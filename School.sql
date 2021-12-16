CREATE DATABASE School

USE School

-- schema -------------------------------------------------------------

CREATE TABLE Teachers (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL
)

CREATE TABLE Students (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	FirstName nvarchar(50) NOT NULL,
	LastName nvarchar(50) NOT NULL,
	Age int NOT NULL
)

CREATE TABLE Courses (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	Title nvarchar(50) NOT NULL
)

CREATE TABLE StudentGroups (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	CourseId int FOREIGN KEY REFERENCES Courses(Id) NOT NULL,
)

CREATE TABLE StudentGroupMembers (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	StudentGroupId int FOREIGN KEY REFERENCES StudentGroups(Id) NOT NULL,
	StudentId int FOREIGN KEY REFERENCES Students(Id) NOT NULL
)

CREATE TABLE StudentGroupLectures (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	StudentGroupId int FOREIGN KEY REFERENCES StudentGroups(Id) NOT NULL,
	TeacherId int FOREIGN KEY REFERENCES Teachers(Id) NOT NULL,
	StartDate datetime2 NOT NULL,
	EndDate datetime2 NOT NULL
)

CREATE TABLE StudentGroupLectureStudents (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	StudentGroupLectureId int FOREIGN KEY REFERENCES StudentGroupLectures(Id) NOT NULL,
	StudentId int FOREIGN KEY REFERENCES Students(Id) NOT NULL,
	Present bit NOT NULL,
	Paid bit NOT NULL,
	UNIQUE (StudentGroupLectureId, StudentId)
)