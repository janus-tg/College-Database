# College Database

A database program created in MySQL that can function as a college database. It stores all the students' info in the student_info table which contains the firstname, lastname, student ID, major and their sex. The instructors' details with their IDs and names are in another related table. Another table contains the major names and their corresponding codes. Lastly, different tables have been created for each individual course being offered. These course tables contain the student ID of each student who has taken the course, name of professor who taught the course to the student, year and semester the course was taken in and the mark the student received in the course.

## Running the program

1. Create a database called ```first_db``` on MySQL
2. Run the script ```main.sql```

Note: This program has only been tested on MySQL. Performance on other database engines is not guaranteed. 

## Pictures of table
### Student info, instructor info and majors' tables

<img src="db_img/all student info.jpg" width="300"> 
Student information table
<img src="db_img/all instructors.jpg" width = "250">
Instructor information table
<img src="db_img/all majors.jpg" width = "250"> 
Major information table

### Table for different subjects
Click the links to see the images
- [Calculus 2](https://github.com/janus-tg/college_database/blob/main/db_img/all%20calc2%20.jpg)
- [ESP 2](https://github.com/janus-tg/college_database/blob/main/db_img/all%20esp2.jpg)
- [Calculus 3](https://github.com/janus-tg/college_database/blob/main/db_img/all%20calc3.jpg)
- [Digital Systems](https://github.com/janus-tg/college_database/blob/main/db_img/all%20digitalsystem.jpg)
- [Electric Fundamentals](https://github.com/janus-tg/college_database/blob/main/db_img/all%20elecfundamentals.jpg)

## Results of queries performed
Click the links to see the images
- [Total students.](https://github.com/janus-tg/College-Database/blob/main/db_img/query_totalStudents.jpg)
- [Terms a course is offered in.](https://github.com/janus-tg/College-Database/blob/main/db_img/query_distinctTerms.jpg)
- [Name of all students and arranging them in descending order of age and last name.](https://github.com/janus-tg/College-Database/blob/main/db_img/query_age%20and%20last%20name.jpg)
- [Average marks scored in a course by all students who have taken the course.](https://github.com/janus-tg/College-Database/blob/main/db_img/query_avgMarkinCourse.jpg)
- [Average marks scored by females in Calc 2.](https://github.com/janus-tg/College-Database/blob/main/db_img/query_avgFemaleMarksCalc2.jpg)
- [Name and details of student who scored the max marks in Calc 3.](https://github.com/janus-tg/College-Database/blob/main/db_img/query_nameOfMaxMarkScoredInCalc3.jpg)
- [Grades assigned based on marks to students in electric fundamentals.](https://github.com/janus-tg/College-Database/blob/main/db_img/query_gradeInElec.jpg)
- [Seeing whether student had honors, passed or failed in digital systems.](https://github.com/janus-tg/College-Database/blob/main/db_img/query_statusOfStdInDigital.jpg)

## Contributing

Pull requests are welcome for adding more courses and populating the database or fixing exisiting issues. 

## License
[MIT](https://github.com/janus-tg/college_database/blob/master/LICENSE)
