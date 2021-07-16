
DELETE FROM course;

INSERT INTO course (title) VALUES ('si106');
INSERT INTO course (title) VALUES ('si110');
INSERT INTO course (title) VALUES ('si206');

DELETE FROM student;

INSERT INTO student (name) VALUES('Machlan');
INSERT INTO student (name) VALUES('Breogan');
INSERT INTO student (name) VALUES('Paige');
INSERT INTO student (name) VALUES('Ricco');
INSERT INTO student (name) VALUES('Solomon');
INSERT INTO student (name) VALUES('Abhia');
INSERT INTO student (name) VALUES('Abbeygale');
INSERT INTO student (name) VALUES('Haajirah');
INSERT INTO student (name) VALUES('Mantej');
INSERT INTO student (name) VALUES('Suhaira');
INSERT INTO student (name) VALUES('Louella');
INSERT INTO student (name) VALUES('Apisai');
INSERT INTO student (name) VALUES('Damon');
INSERT INTO student (name) VALUES('Majid');
INSERT INTO student (name) VALUES('Sweyn');



INSERT INTO roster (student_id, course_id, role) VALUES(1, 1, 1);
INSERT INTO roster (student_id, course_id, role) VALUES(2, 1, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(3, 1, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(4, 1, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(5, 1, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(6, 2, 1);
INSERT INTO roster (student_id, course_id, role) VALUES(7, 2, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(8, 2, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(9, 2, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(10, 2, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(11, 3, 1);
INSERT INTO roster (student_id, course_id, role) VALUES(12, 3, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(13, 3, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(14, 3, 0);
INSERT INTO roster (student_id, course_id, role) VALUES(15, 3, 0);
