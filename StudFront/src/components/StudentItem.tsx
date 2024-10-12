import { Link } from 'react-router-dom';

function StudentListItem({ student }) {
  const averageGrade = (
    student.grades.reduce((sum: number, grade: any) => sum + grade.grade, 0) / student.grades.length
  ).toFixed(2);
  
  return (
    <div>
        <Link to={`/student/${student.id}`}>
        <h3>{student.fio}</h3>
        <p>Средний общий бал: {averageGrade}</p>
      </Link>
    </div>
  );
};

export default StudentListItem;
