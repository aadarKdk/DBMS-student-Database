-- Select the columns we want to retrieve
SELECT tbl_students.rollno, tbl_students.name, tbl_students.DOB, tbl_subjects.subject_name, tbl_marks.marks
-- Specify the tables we are querying
FROM tbl_students
-- Join the tbl_students table with tbl_marks based on the rollno column
JOIN tbl_marks ON tbl_students.rollno = tbl_marks.rollno
-- Join the tbl_marks table with tbl_subjects based on the subject_code column
JOIN tbl_subjects ON tbl_marks.subject_code = tbl_subjects.subject_code
-- Filter the rows based on conditions
WHERE tbl_marks.marks = (
    -- Subquery to find the maximum marks for each subject
    SELECT MAX(marks)
    FROM (
        -- Subquery to retrieve marks for each subject
        SELECT marks
        FROM tbl_marks AS sub
        -- Correlate the subquery with the outer query by matching the subject code
        WHERE sub.subject_code = tbl_marks.subject_code
    ) AS max_marks
);
