import graphene
from fastapi import Depends
from graphene import ObjectType, String, Int, Field, List, Schema
from graphene_sqlalchemy import SQLAlchemyObjectType
from sqlalchemy.orm import Session, joinedload

import models
from database import session


class Student(SQLAlchemyObjectType):
    id = graphene.ID(required=True)
    grades = List(lambda: Grade)
    class Meta:
        model = models.StudentModel
        interfaces = (graphene.relay.Node,)

class Subject(SQLAlchemyObjectType):
    class Meta:
        model = models.SubjectModel
        interfaces = (graphene.relay.Node,)

class Grade(SQLAlchemyObjectType):
    student = Field(Student)
    subject = Field(Subject)

    class Meta:
        model = models.GradeModel
        interfaces = (graphene.relay.Node,)


class Query(ObjectType):
    students = List(Student)
    student = Field(Student, id=graphene.ID(required=True))

    def resolve_students(self, info):
        db = session()
        try:
            return db.query(models.StudentModel).options(joinedload(models.StudentModel.grades)).all()
        finally:
            db.close()

    def resolve_student(self, info, id):
        db = session()
        try:
            student = db.query(models.StudentModel).options(
                joinedload(models.StudentModel.grades).joinedload(models.GradeModel.subject)
            ).filter(models.StudentModel.id == int(id)).first()
            return student
        finally:
            db.close()

schema = Schema(query=Query)
