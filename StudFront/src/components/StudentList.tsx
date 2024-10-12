import { useQuery } from '@apollo/client';
import { GET_STUDENTS } from '../api/queries';
import StudentListItem from './StudentItem';

function StudentList() {
  const { loading, error, data } = useQuery(GET_STUDENTS);
  
  if (loading) return <p>Loading</p>;
  if (error) return <p>Error: {error.message}</p>;  

  return (
    <div>
    {data.students.map(student => (
      <StudentListItem key={student.id} student={student} />
    ))}
  </div>
  );
};

export default StudentList;
