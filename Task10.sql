CREATE TABLE Classes
(
  ClassName varchar(6),
  Teacher varchar(30),
   TimeSlot varchar(30),
    Class int ,
    Lab int
);

~~~~Tạo an unique, clustered index tên là MyClusteredIndex trên trường ClassName
CREATE  UNIQUE  INDEX MyClusteredIndex ON Classes(ClassName)

~~~~~Tạo a nonclustered index tên là TeacherIndex trên trường Teacher
ALTER TABLE Classes ADD INDEX TeacherIndex22(Teacher);

DROP INDEX TeacherIndex22 ON Classes

Xây dựng lại MyClusteredIndex với các thuộc tính FILLFACTOR

AlTER INDEX MyClusteredIndex ON Classes REBUILD WITH (FILLFACTOR =60)

~~~~Tạo một composite index tên là ClassLabIndex trên 2 trường Class và Lab.

CREATE UNIQUE INDEX ClassLabIndex ON Classes (Class,Lab)

~~~~Viết câu lệnh xem toàn bộ các chỉ mục của cơ sở dữ liệu CodeLean.
SHOW INDEX FROM Classes


CREATE TABLE Student
(
    StudentNo int PRIMARY KEY ,
    StudentName varchar(50) NOT NULL,
    StudentAddress varchar(100) NOT NULL,
    PhoneNo int 
);



CREATE TABLE Department
(
    DeptNo int PRIMARY KEY ,
    DeptName varchar(50),
    ManagerName varchar(30)
);

CREATE TABLE Assignment
(AssignmentNo int PRIMARY KEY,
 Description varchar(100)
  );

  CREATE TABLE WorksAssign
(
    JobID int PRIMARY KEY,
    StudentNo int,
    AssignmentNo int,
    CONSTRAINT FK1 FOREIGN KEY (StudentNo) REFERENCES student(StudentNo),
    CONSTRAINT FK2  FOREIGN KEY (AssignmentNo) REFERENCES Assignment(AssignmentNo),
    TotalHours int,
    JobDetails varchar(50)
);

~~~~Tạo một clustered index tên là IX_Student trên cột StudentNo của bảng Student
CREATE  UNIQUE INDEX IX_Student ON student(StudentNo)

~~~Chỉnh sửa và xây dựng lại (rebuild) IX_Student đã được tạo trên bảng Student

AlTER INDEX IX_Student1 ON student REBUILD


~~~~Tạo một chỉ non clustered index tên là IX_Dept trên bảng Department sử dụng 2 trường không
khóa DeptName và ManagerName.

CREATE INDEX IX_Dept ON Department(DeptName,ManagerName);





