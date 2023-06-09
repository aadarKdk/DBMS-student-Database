SELECT tbl_students.rollno, tbl_students.name,
    (SELECT SUM(marks) -- Subquery to calculate the sum of marks
     FROM tbl_marks
     WHERE rollno = tbl_students.rollno) AS total_marks -- Alias the subquery result as total_marks
FROM tbl_students; -- Select rollno, name, and total_marks from tbl_students

