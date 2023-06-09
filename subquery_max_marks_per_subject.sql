SELECT tbl_students.rollno, tbl_students.name, tbl_students.DOB, tbl_subjects.subject_name, tbl_marks.marks
FROM tbl_students
JOIN tbl_marks ON tbl_students.rollno = tbl_marks.rollno
JOIN tbl_subjects ON tbl_marks.subject_code = tbl_subjects.subject_code
WHERE tbl_marks.marks = (
    -- Subquery to find the maximum marks for each subject
    SELECT MAX(marks)
    FROM (
        -- Subquery to retrieve marks for each subject
        SELECT marks
        FROM tbl_marks AS sub
        WHERE sub.subject_code = tbl_marks.subject_code
    ) AS max_marks
);

