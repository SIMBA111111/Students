import { gql } from '@apollo/client';

export const GET_STUDENTS = gql`
  query GetStudents {
    students {
      id
      fio
      grades {
        grade
      }
    }
  }
`;

export const GET_STUDENT_DETAILS = gql`
query GetStudentDetails($id: ID!) {
  student(id: $id) {
    id
    fio
    grades {
      grade
      subject {
        id
        subject
      }
    }
  }
}
`;
