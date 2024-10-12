import { useParams } from 'react-router-dom';
import { useQuery } from '@apollo/client';
import { GET_STUDENT_DETAILS } from '../api/queries';

function StudentDetail() {
  const { id } = useParams<{ id: string }>();
  
  const { loading, error, data } = useQuery(GET_STUDENT_DETAILS, {
    variables: { id },
  });
  if (loading) return <p>Loading</p>;
  if (error) return <p>Error: {error.message}</p>;
  
  return (
    <div>
      <h1>{data.student.fio}</h1>
      <h3>Оценки по каждой дисциплине:</h3>
      <ul>
        {data.student.grades.map((grade: any) => (
          <li key={grade.subject.id}>
            {grade.subject.subject}: {grade.grade} 
           </li>
        ))}
      </ul>
    </div>
  );
};

export default StudentDetail;
