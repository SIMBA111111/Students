from sqlalchemy import Integer, String, Column, TIMESTAMP, func, ForeignKey, CheckConstraint
from sqlalchemy.orm import relationship
from database import Base


class BaseModel(Base):
    __abstract__ = True

    id = Column(Integer, primary_key=True, autoincrement=True, index=True)


class StudentModel(BaseModel):
    __tablename__ = 'student'

    fio = Column(String)
    grades = relationship("GradeModel", back_populates="student")


class SubjectModel(BaseModel):
    __tablename__ = 'subject'

    subject = Column(String)
    grades = relationship("GradeModel", back_populates="subject")


class GradeModel(BaseModel):
    __tablename__ = 'grade'

    student_id = Column(Integer, ForeignKey("student.id"))
    subject_id = Column(Integer, ForeignKey("subject.id"))
    grade = Column(Integer, CheckConstraint('grade > 0 and grade < 6'))

    student = relationship("StudentModel", back_populates='grades')
    subject = relationship("SubjectModel", back_populates='grades')
