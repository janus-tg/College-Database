-- create a database called first_db
-- changing the active database
use first_db;
-- creating the main student_info table having the student name and basic info
create table student_info (
	std_id int primary key, 
    f_name varchar(20), 
    l_name varchar(20), 
    birth_date date, 
    sex varchar(1),
    majorCode int 
);
-- name of majors 
create table majorList (
	majorCode int primary key,
    majorName varchar (40)
);
alter table student_info
	add foreign key(majorCode) 
    references majorList(majorCode)
    on delete set null;
-- creating the table having name of instructors based on their code
create table instructor_info (
	ins_id int primary key, 
    f_name varchar(20), 
    l_name varchar(20)
);
-- creating tables having all the students who were enrolled in a particular course

create table calc2 (
	std_id int, 
    ins_id int, 
    yearTaken int, 
    term varchar(10),
    mark int,
    foreign key(std_id) references student_info(std_id) on delete set null,
    foreign key(ins_id) references instructor_info(ins_id) on delete set null
);
create table calc3 (
	std_id int, 
    ins_id int, 
    yearTaken int, 
    term varchar(10),
    mark int,
    foreign key(std_id) references student_info(std_id) on delete set null,
    foreign key(ins_id) references instructor_info(ins_id) on delete set null
);

create table esp2 (
	std_id int, 
    ins_id int, 
    yearTaken int, 
    term varchar(10),
    mark int,
    foreign key(std_id) references student_info(std_id) on delete set null,
    foreign key(ins_id) references instructor_info(ins_id) on delete set null
);
create table elecFundamentals (
	std_id int, 
    ins_id int, 
    yearTaken int, 
    term varchar(10),
    mark int,
    foreign key(std_id) references student_info(std_id) on delete set null,
    foreign key(ins_id) references instructor_info(ins_id) on delete set null
);

create table digitalSystems (
	std_id int, 
    ins_id int, 
    yearTaken int, 
    term varchar(10),
    mark int,
    foreign key(std_id) references student_info(std_id) on delete set null,
    foreign key(ins_id) references instructor_info(ins_id) on delete set null
);

-- populating the tables
insert into student_info values(0, 'Harvey', 'Specter', '1968-03-02', 'M', null);
insert into majorlist values(100, 'Computer Engineering');
insert into majorlist values(101, 'Electrical Engineering');
insert into majorlist values(102, 'Mechanical Engineering');
insert into majorlist values(103, 'Chemical Engineering');
insert into majorlist values(104, 'Industrial Engineering');
select * from majorlist; -- displays all the majors

update student_info
	set majorCode = 100
    where std_id = 0;

insert into student_info values(1, 'Michael', 'Ross', '1981-07-22', 'M', 103);
insert into student_info values(2, 'Louis', 'Litt', '1966-11-21', 'M', 100);
insert into student_info values(3, 'Jessica', 'Pearson', '1960-08-09', 'F', 100);
insert into student_info values(4, 'Rachel', 'Zane', '1982-05-09', 'F', 101);
select * from student_info;

insert into instructor_info values(900, 'Donna', 'Paulsen');
insert into instructor_info values(901, 'Paul', 'Porter');
insert into instructor_info values(902, 'Daniel', 'Hardman');
insert into instructor_info values(903, 'Steven', 'Gerrard');
select * from instructor_info;

insert into calc2 values(0, 903, 1986, 'winter', 79);
insert into calc2 values(2, 903, 1984, 'winter', 82);
insert into calc2 values(3, 901, 1978, 'fall', 80);

insert into calc3 values(0, 902, 1986, 'fall', 89);
insert into calc3 values(1, 900, 1986, 'winter', 83);
insert into calc3 values(2, 902, 1986, 'fall', 75);
insert into calc3 values(3, 900, 1986, 'winter', 95);
insert into calc3 values(4, 902, 1986, 'fall', 90);

insert into esp2 values(0, 901, 1987, 'summer', 91);
insert into esp2 values(1, 902, 1988, 'winter', 83);
insert into esp2 values(4, 902, 1989, 'winter', 71);

insert into digitalsystems values(0, 900, 1981, 'fall', 69);
insert into digitalsystems values(1, 902, 1983, 'winter', 73);
insert into digitalsystems values(2, 902, 1988, 'fall', 75);
insert into digitalsystems values(3, 901, 1982, 'winter', 55);
insert into digitalsystems values(4, 901, 1985, 'fall', 70);

insert into elecfundamentals values(1, 901, 1986, 'winter', 83);
insert into elecfundamentals values(2, 900, 1987, 'fall', 75);
insert into elecfundamentals values(3, 902, 1982, 'winter', 95);
insert into elecfundamentals values(4, 902, 1988, 'fall', 90);

-- values have been inserted now. Now, we will perform queries
select * from student_info;
select* from majorlist;
select * from instructor_info;
select * from calc2;
select* from calc3;
select * from digitalsystems;
select * from elecfundamentals;
select * from esp2;

-- performing queries

-- order students by age and last name
select std_id, f_name, l_name, birth_date from student_info
order by birth_date, l_name;

-- find terms being offered for a particular course
select distinct(term) from calc3;

-- find the total number of students
select count(std_id) from student_info;

-- find the average marks scored by students in elecfundamentals
select round(avg(mark), 2) from elecfundamentals;

-- find the average marks scored by female students
select round(avg(mark), 2) as 'average marks in calc 2 scored by females' from calc2
	where std_id in (
		select std_id from student_info
			where sex = 'F'
	);
    
-- display max marks scored in calc3 subject with name of student
select calc3.std_id, f_name, l_name, max(mark) from calc3
	join student_info
    on calc3.std_id = student_info.std_id
	where mark = (select max(mark) from calc3);
    
-- display the name and mark scored by a particular student id in a subject
select calc2.std_id, f_name, l_name, mark from calc2
	join student_info
    on calc2.std_id = student_info.std_id
    where calc2.std_id = 0;
    
-- display a grade for a course depending on mark 
select elecfundamentals.std_id, f_name, l_name, mark, 
	case when mark > 85 then 'A'
    when mark > 79 then 'A-'
    when mark > 76 then 'B+'
    when mark > 72 then 'B'
    when mark > 69 then 'B-'
    when mark > 66 then 'C+'
    when mark > 62 then 'C'
    when mark > 59 then 'C-'
    when mark > 49 then 'D'
    else 'F'
    end as grade
    from elecfundamentals
    join student_info
    on student_info.std_id = elecfundamentals.std_id;
    
-- display name of students who have recieved honors in digital circuits
select digitalsystems.std_id, f_name, l_name, mark,
	case when mark > 79 then 'honors'
    when mark > 49 then 'pass'
    else 'fail'
    end as remark
    from digitalsystems
    join student_info
    on student_info.std_id = digitalsystems.std_id;