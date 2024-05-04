
CREATE TABLE Instructors (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(100),
  Phone VARCHAR(20)
);

-- Crear tabla Students
CREATE TABLE Students (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Email VARCHAR(100),
  Phone VARCHAR(20),
  Address TEXT
);

-- Crear tabla Courses
CREATE TABLE Courses (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL,
  Description TEXT,
  Duration INT NOT NULL
);

-- Crear tabla Schedules
CREATE TABLE Schedules (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Course_ID INT,
  Day VARCHAR(10),
  Time TIME NOT NULL,
  FOREIGN KEY (Course_ID) REFERENCES Courses(ID)
);

-- Crear tabla Locations
CREATE TABLE Locations (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Address TEXT NOT NULL
);

-- Crear tabla Attendance
CREATE TABLE Attendance (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Student_ID INT,
  Schedule_ID INT,
  Date DATE NOT NULL,
  FOREIGN KEY (Student_ID) REFERENCES Students(ID),
  FOREIGN KEY (Schedule_ID) REFERENCES Schedules(ID)
);

-- Crear tabla Payments
CREATE TABLE Payments (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Student_ID INT,
  Amount DECIMAL(10,2) NOT NULL,
  Date DATE NOT NULL,
  FOREIGN KEY (Student_ID) REFERENCES Students(ID)
);

-- Crear tabla Ranks
CREATE TABLE Ranks (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Name VARCHAR(100) NOT NULL
);

-- Crear tabla Student_Ranks
CREATE TABLE Student_Ranks (
  ID INT AUTO_INCREMENT PRIMARY KEY,
  Student_ID INT,
  Rank_ID INT,
  Achievement_Date DATE NOT NULL,
  FOREIGN KEY (Student_ID) REFERENCES Students(ID),
  FOREIGN KEY (Rank_ID) REFERENCES Ranks(ID)
);
