drop database if exists QuanLiHocVien;
create database if not exists QuanLiHocVien;

use QuanLiHocVien;

create table Address(
id int auto_increment primary key,
address varchar(50) not null
);

create table Classes(
id int auto_increment primary key,
nameClass varchar(50) not null,
languageClass varchar(50) not null,
descriptionClass text
);

create table Students(
id int auto_increment primary key,
fullname varchar(50) not null,
address_id int,
age int not null,
phone varchar(10) unique,
classes_id int,
foreign key (address_id) references Address(id),
foreign key (classes_id) references Classes(id)
);

create table Course(
id int auto_increment primary key,
nameCourse varchar(50) not null,
descriptionCourse varchar(250)
);

create table Points(
id int auto_increment primary key,
course_id int,
student_id int,
points float,
foreign key (course_id) references Course(id),
foreign key (student_id) references Students(id)
);

select * from quanlihocvien.students
where fullname like 'Nguyễn%';

select * from quanlihocvien.students
where fullname like '%Anh';

select * from quanlihocvien.students
where age between 20 and 25;

select * from quanlihocvien.students
where id = 12 or id = 13;

-- Thống kê số lượng học viên các lớp (count)

select classes_id, nameClass, count(classes_id) as 'số lượng học viên'
from quanlihocvien.students join quanlihocvien.classes
on students.classes_id = classes.id
group by classes_id;

-- Thống kê số lượng học viên tại các tỉnh (count)

select address_id, address, count(address_id) as 'số lượng học viên ở tỉnh'
from quanlihocvien.students join quanlihocvien.address
on students.address_id = address.id
group by address_id;

-- Tính điểm trung bình của các khóa học (avg)

select course_id, nameCourse, avg(points) as 'điểm trung bình khóa học'
from quanlihocvien.points join quanlihocvien.course
on points.course_id = course.id
group by course_id;