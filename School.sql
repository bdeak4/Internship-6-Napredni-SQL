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
	PriorKnowledge nvarchar(2) NOT NULL,
	Birthday datetime2 NOT NULL
)

CREATE TABLE Courses (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	Title nvarchar(50) NOT NULL
)

CREATE TABLE StudentGroups (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	CourseId int FOREIGN KEY REFERENCES Courses(Id) NOT NULL,
)

CREATE TABLE Classes (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	Title nvarchar(50) NOT NULL
)

CREATE TABLE StudentGroupMembers (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	StudentGroupId int FOREIGN KEY REFERENCES StudentGroups(Id) NOT NULL,
	StudentId int FOREIGN KEY REFERENCES Students(Id) NOT NULL,
	TotalInstallments int NOT NULL,
	PaidInstallments int NOT NULL
)

CREATE TABLE StudentGroupLectures (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	StudentGroupId int FOREIGN KEY REFERENCES StudentGroups(Id) NOT NULL,
	TeacherId int FOREIGN KEY REFERENCES Teachers(Id) NOT NULL,
	ClassId int FOREIGN KEY REFERENCES Classes(Id) NOT NULL,
	StartDate datetime2 NOT NULL,
	EndDate datetime2 NOT NULL
)

CREATE TABLE StudentGroupLectureAttendance (
	Id int IDENTITY(1, 1) PRIMARY KEY,
	StudentGroupLectureId int FOREIGN KEY REFERENCES StudentGroupLectures(Id) NOT NULL,
	StudentId int FOREIGN KEY REFERENCES Students(Id) NOT NULL,
	Present bit NOT NULL,
	UNIQUE (StudentGroupLectureId, StudentId)
)

-- seed ---------------------------------------------------------------

-- https://www.mockaroo.com/
insert into Teachers (FirstName, LastName) values ('Osgood', 'Wayt');
insert into Teachers (FirstName, LastName) values ('Nelson', 'Domonkos');
insert into Teachers (FirstName, LastName) values ('Euell', 'Osinin');
insert into Teachers (FirstName, LastName) values ('Martha', 'Thing');
insert into Teachers (FirstName, LastName) values ('Felike', 'Rawstorn');
insert into Teachers (FirstName, LastName) values ('Barry', 'Brundell');
insert into Teachers (FirstName, LastName) values ('Kath', 'Wohler');
insert into Teachers (FirstName, LastName) values ('Mirabelle', 'Seide');
insert into Teachers (FirstName, LastName) values ('Beltran', 'Dewdney');
insert into Teachers (FirstName, LastName) values ('Justen', 'Spelman');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Aurlie', 'Howchin', '2007-05-10', 'B2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Waylon', 'Fackney', '1981-03-26', 'A1');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Carson', 'Giannoni', '1984-10-24', 'A3');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Craggy', 'Tulloch', '1984-12-17', 'B2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Pasquale', 'Wyse', '2004-08-24', 'B2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Coretta', 'Dabourne', '1992-07-24', 'B2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Emmye', 'Jeffcock', '1988-04-17', 'B2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Woody', 'Yurasov', '1985-10-06', 'B2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Dena', 'Blackaller', '1982-04-28', 'B2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Barbette', 'Sizey', '1993-06-27', 'B2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Johnathan', 'Beaby', '1985-11-10', 'B2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Caron', 'Issacoff', '1982-07-15', 'A2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Aubrey', 'Blizard', '1982-09-23', 'A2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Pammie', 'Djekovic', '1990-09-10', 'A2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Willy', 'Bortoletti', '2002-06-13', 'A2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Rodrick', 'Skip', '1982-03-24', 'A2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Hubie', 'Webb-Bowen', '2008-09-08', 'B2');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Corty', 'Espinay', '1981-01-14', 'B1');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Far', 'Croci', '1991-06-11', 'B1');
insert into Students (FirstName, LastName, Birthday, PriorKnowledge) values ('Rudie', 'Harlin', '1984-09-18', 'B1');
insert into Courses (Title) values ('Montenegrin');
insert into Courses (Title) values ('Kannada');
insert into Courses (Title) values ('Hiri Motu');
insert into Courses (Title) values ('Malagasy');
insert into Courses (Title) values ('Polish');

INSERT INTO StudentGroups (CourseId) VALUES
(1),
(1),
(1),
(5),
(4)

INSERT INTO Classes(Title) VALUES
('A100'),
('A101'),
('C401')

INSERT INTO StudentGroupMembers (StudentGroupId, StudentId, TotalInstallments, PaidInstallments) SELECT 1, id, 12, CRYPT_GEN_RANDOM(1) % 12 FROM Students WHERE Birthday LIKE '198[0-4]%' AND PriorKnowledge = 'A2'
INSERT INTO StudentGroupMembers (StudentGroupId, StudentId, TotalInstallments, PaidInstallments) SELECT 2, id,  6, CRYPT_GEN_RANDOM(1) %  6 FROM Students WHERE Birthday LIKE '198[5-9]%' AND PriorKnowledge = 'B2'
INSERT INTO StudentGroupMembers (StudentGroupId, StudentId, TotalInstallments, PaidInstallments) SELECT 3, id, 18, CRYPT_GEN_RANDOM(1) % 18 FROM Students WHERE Birthday LIKE '200[0-5]%' AND PriorKnowledge = 'B2'
INSERT INTO StudentGroupMembers (StudentGroupId, StudentId, TotalInstallments, PaidInstallments) SELECT 4, id, 12, CRYPT_GEN_RANDOM(1) % 12 FROM Students WHERE Birthday LIKE '198[5-9]%' AND PriorKnowledge = 'B2'
INSERT INTO StudentGroupMembers (StudentGroupId, StudentId, TotalInstallments, PaidInstallments) SELECT 5, id, 12, CRYPT_GEN_RANDOM(1) % 12 FROM Students WHERE Birthday LIKE '198[5-9]%' AND PriorKnowledge = 'B2'

-- https://www.mockaroo.com/
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (4, 1, 3, '2021-02-26 17:00:00', '2021-02-26 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (3, 1, 3, '2021-05-17 17:00:00', '2021-05-17 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (3, 9, 3, '2021-12-10 17:00:00', '2021-12-10 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (2, 5, 3, '2021-04-12 17:00:00', '2021-04-12 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (3, 2, 3, '2021-04-05 17:00:00', '2021-04-05 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (2, 9, 3, '2021-09-30 17:00:00', '2021-09-30 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (3, 10, 1, '2021-04-26 17:00:00', '2021-04-26 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (3, 8, 2, '2021-09-25 17:00:00', '2021-09-25 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (3, 1, 2, '2021-03-14 17:00:00', '2021-03-14 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (1, 2, 2, '2021-06-11 17:00:00', '2021-06-11 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (4, 6, 2, '2021-07-05 17:00:00', '2021-07-05 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (3, 6, 2, '2021-06-12 17:00:00', '2021-06-12 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (3, 9, 2, '2021-12-03 17:00:00', '2021-12-03 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (1, 6, 2, '2021-11-28 17:00:00', '2021-11-28 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (4, 6, 2, '2021-09-09 17:00:00', '2021-09-09 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (1, 7, 2, '2021-12-04 17:00:00', '2021-12-04 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (2, 9, 2, '2021-07-10 17:00:00', '2021-07-10 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (1, 6, 2, '2021-03-24 17:00:00', '2021-03-24 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (2, 6, 2, '2021-08-21 17:00:00', '2021-08-21 20:00:00');
insert into StudentGroupLectures (StudentGroupId, TeacherId, ClassId, StartDate, EndDate) values (4, 10, 1, '2021-10-25 17:00:00', '2021-10-25 20:00:00');

INSERT INTO StudentGroupLectureAttendance (StudentGroupLectureId, StudentId, Present)
SELECT l.Id, m.StudentId, CRYPT_GEN_RANDOM(1) % 2
FROM StudentGroupLectures l
JOIN StudentGroupMembers m ON l.StudentGroupId = m.StudentGroupId

-- queries -------------------------------------------------------------

-- raspored održavanja tečajeva u školi za određeni vremenski period.
SELECT c.Id AS CourseId, g.Id AS GroupId,
       c.Title, l.StartDate, l.EndDate
FROM StudentGroupLectures l
JOIN StudentGroups g ON l.StudentGroupId = g.Id
JOIN Courses c ON g.CourseId = c.Id
WHERE l.StartDate BETWEEN '2021-03-01' AND '2021-09-01'

-- raspored održavanja tečaja za pojedinu grupu polaznika za određeni vremenski period. 
SELECT c.Id AS CourseId, g.Id AS GroupId,
       c.Title, l.StartDate, l.EndDate
FROM StudentGroupLectures l
JOIN StudentGroups g ON l.StudentGroupId = g.Id
JOIN Courses c ON g.CourseId = c.Id
WHERE g.Id = 3
  AND l.StartDate BETWEEN '2021-03-01' AND '2021-09-01'

-- raspored rada pojedinog nastavnika za određeni vremenski period. 
SELECT c.Id AS CourseId, g.Id AS GroupId, t.Id AS TeacherId,
       t.FirstName, t.LastName, c.Title, l.StartDate, l.EndDate
FROM StudentGroupLectures l
JOIN Teachers t ON l.TeacherId = t.Id
JOIN StudentGroups g ON l.StudentGroupId = g.Id
JOIN Courses c ON g.CourseId = c.Id
WHERE t.Id = 6
  AND l.StartDate BETWEEN '2021-03-01' AND '2021-09-01'

-- izvještaj za pojedinog polaznika za određeni vremenski period,
-- koji uključuje podatke o tečajevima stranih jezika koje sluša,
-- stupnjevima koje je završio, nastavnicima koji mu predaju,
-- prisutnosti na nastavi te ratama koje je uplatio.
SELECT *,
       (
           SELECT STRING_AGG(Teacher, ', ')
           FROM (
               SELECT DISTINCT t.FirstName + ' ' + t.LastName AS Teacher
               FROM Teachers t
               JOIN StudentGroupLectures l ON l.TeacherId = t.Id
               JOIN StudentGroupMembers m ON m.StudentGroupId = l.StudentGroupId
               WHERE m.StudentId = s.Id
                 AND l.StartDate BETWEEN '2021-03-01' AND '2021-10-01'
           ) AS t
       ) AS Teachers,
       (
           SELECT STRING_AGG(Title, ', ')
           FROM (
               SELECT DISTINCT Title
               FROM Courses c
               JOIN StudentGroups g ON g.CourseId = c.Id
               JOIN StudentGroupLectures l ON l.StudentGroupId = g.Id
               JOIN StudentGroupMembers m ON m.StudentGroupId = g.Id
               WHERE m.StudentId = s.Id
                 AND l.StartDate BETWEEN '2021-03-01' AND '2021-10-01'
           ) AS c
       ) AS Courses,
       (
           SELECT CAST((100.0 * SUM(CASE WHEN Present = 1 THEN 1 ELSE 0 END) / COUNT(*)) AS int)
           FROM StudentGroupLectureAttendance
           WHERE StudentId = s.Id
       ) AS LectureAttendancePercent,
       (
           SELECT CAST(SUM(PaidInstallments) AS varchar) + '/' + CAST(SUM(TotalInstallments) AS varchar)
           FROM StudentGroupMembers m
           WHERE m.StudentId = s.Id
       ) AS PaidInstallments
FROM Students s
WHERE s.Id = 7

-- izvještaj o brojnosti polaznika i posjećenosti nastave na pojedinom tečaju u određenom vremenskom periodu. 
SELECT StudentGroupId, MemberCount,
       AVG(CAST(100.0 * PresentCount / MemberCount AS int)) AS AverageAttendancePercent
FROM (
	SELECT l.StudentGroupId, COUNT(*) AS MemberCount,
	       SUM(CASE WHEN Present = 1 THEN 1 ELSE 0 END) AS PresentCount
	FROM StudentGroupLectureAttendance a
	JOIN StudentGroupLectures l ON a.StudentGroupLectureId = l.Id
	WHERE l.StartDate BETWEEN '2021-03-01' AND '2021-09-01'
	GROUP BY l.Id, l.StudentGroupId
) AS g
GROUP BY StudentGroupId, MemberCount

-- pregled brojnosti polaznika na pojedinim tečajevima po starosnim skupinama.
SELECT StudentGroupId, c.Title,
       SUM(CASE WHEN Age <= 17 THEN 1 ELSE 0 END) AS 'BrojUcenika',
       SUM(CASE WHEN Age >= 18 AND Age <= 27 THEN 1 ELSE 0 END) AS 'BrojStudenata',
       SUM(CASE WHEN Age >= 28 AND Age <= 66 THEN 1 ELSE 0 END) AS 'BrojRadnika',
       SUM(CASE WHEN Age >= 67 THEN 1 ELSE 0 END) AS 'BrojPenzionera'
FROM StudentGroupMembers m
JOIN (
	SELECT *, FLOOR(DATEDIFF(DAY, Birthday, GETDATE()) / 365.25) AS Age
	FROM Students
) s ON m.StudentId = s.Id
JOIN StudentGroups g ON m.StudentGroupId = g.Id
JOIN Courses c ON g.CourseId = c.Id
GROUP BY StudentGroupId, c.Title

-- ispis imena najstarijeg polaznika koji pohađa više od dva jezika
SELECT TOP 1 s.Id, s.FirstName, s.LastName, s.Birthday, COUNT(m.StudentGroupId) AS StudentGroupCount
FROM StudentGroupMembers m
JOIN Students s ON m.StudentId = s.Id
GROUP BY s.Id, s.FirstName, s.LastName, s.Birthday
HAVING COUNT(m.StudentGroupId) > 2
ORDER BY FLOOR(DATEDIFF(DAY, s.Birthday, GETDATE()) / 365.25) DESC

-- sortiranje tečajeva po broju polaznika koji imaju manje od 20 godina
SELECT g.Id, c.Title, COUNT(s.Id) AS StudentCount
FROM StudentGroups g
RIGHT JOIN StudentGroupMembers m ON m.StudentGroupId = g.Id
LEFT JOIN (
	SELECT *
	FROM Students
	WHERE FLOOR(DATEDIFF(DAY, Birthday, GETDATE()) / 365.25) < 20
) s ON m.StudentId = s.Id
JOIN Courses c ON g.CourseId = c.Id
GROUP BY g.Id, c.Title
ORDER BY StudentCount DESC

-- ispis statusa polaznika
SELECT *, CASE WHEN Age <= 17 THEN 'ucenik'
               WHEN Age >= 18 AND Age <= 27 THEN 'student'
               WHEN Age >= 28 AND Age <= 66 THEN 'radnik'
               ELSE 'penzioner'
          END AS PersonStatus
FROM (
	SELECT *, FLOOR(DATEDIFF(DAY, Birthday, GETDATE()) / 365.25) AS Age
	FROM Students
) AS Students

-- ispis svih polaznika koji polažu bilo koji od tečajeva za određen jezik
SELECT s.Id, s.FirstName, s.LastName
FROM StudentGroupMembers m
JOIN Students s ON m.StudentId = s.Id
JOIN StudentGroups g ON m.StudentGroupId = g.Id
JOIN Courses c ON g.CourseId = c.Id
WHERE c.Id = 1

-- ispis svih polaznika koji su bili u određenoj učionici
SELECT DISTINCT s.Id, s.FirstName, s.LastName
FROM StudentGroupLectures l
RIGHT JOIN StudentGroupMembers m ON l.StudentGroupId = m.StudentGroupId
JOIN Students s ON m.StudentId = s.Id
WHERE l.ClassId = 2

-- ispis svih polaznika i nastavnika za zadanom jeziku
SELECT s.Id, s.FirstName, s.LastName, 'student' AS PersonStatus
FROM StudentGroupMembers m
JOIN Students s ON m.StudentId = s.Id
JOIN StudentGroups g ON m.StudentGroupId = g.Id
JOIN Courses c ON g.CourseId = c.Id
WHERE c.Id = 1
UNION
SELECT DISTINCT t.Id, t.FirstName, t.LastName, 'teacher' AS PersonStatus
FROM StudentGroupLectures l
JOIN Teachers t ON l.TeacherId = t.Id
JOIN StudentGroups g ON l.StudentGroupId = g.Id
JOIN Courses c ON g.CourseId = c.Id
WHERE c.Id = 1
