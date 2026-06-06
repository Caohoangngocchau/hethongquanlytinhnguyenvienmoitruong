CREATE DATABASE SOF1022
GO

USE SOF1022
GO
drop table Users
drop table Employees

CREATE TABLE Users (
    Id NVARCHAR(50) PRIMARY KEY,
    Password NVARCHAR(50) NOT NULL,
    Fullname NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100),
    Admin BIT DEFAULT 0
);
GO

CREATE TABLE Employees(
    Id NVARCHAR(20) PRIMARY KEY,
    Fullname NVARCHAR(100),
    Email NVARCHAR(100),
    Username NVARCHAR(50),
    Password NVARCHAR(50),
    Admin BIT
);


drop table Employees
drop table Users 

INSERT INTO Users(Id, Password, Fullname, Email, Admin)
VALUES
('admin', 'admin123', N'Quản trị viên', 'admin@gmail.com', 1);

INSERT INTO Users(Id, Password, Fullname, Email, Admin)
VALUES
('user01', '123', N'Nguyễn Văn A', 'user01@gmail.com', 0);

INSERT INTO Users(Id, Password, Fullname, Email, Admin)
VALUES
('user02', '123', N'Trần Thị B', 'user02@gmail.com', 0);

INSERT INTO Users(Id, Password, Fullname, Email, Admin)
VALUES
('user03', '123', N'Lê Văn C', 'user03@gmail.com', 0);

INSERT INTO Users(Id, Password, Fullname, Email, Admin)
VALUES
('user04', '123', N'Phạm Thị D', 'user04@gmail.com', 0);

GO
select*from Users;
ALTER TABLE Users
ADD Email NVARCHAR(100);
GO

UPDATE Users
SET Email='admin@gmail.com'
WHERE Id='admin';

UPDATE Users
SET Email='user1@gmail.com'
WHERE Id='user1';

UPDATE Users
SET Email='user2@gmail.com'
WHERE Id='user2';

sp_help Users

SELECT COLUMN_NAME
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Users';

SELECT * FROM Users;

-- Xóa dữ liệu cũ nếu có để tránh trùng lặp khóa chính khi chạy lại
DELETE FROM Employees;

-- Chèn dữ liệu mẫu vào bảng Employees
INSERT INTO Employees (Id, Fullname, Email, Username, Password, Admin) VALUES 
('EMP01', N'Nguyễn Văn Trưởng', 'truongnv@gmail.com', 'truongnv', '123456', 1), -- 1 là Admin
('EMP02', N'Lê Thị Kế Toán', 'toanlt@gmail.com', 'toanlt', 'password123', 0),  -- 0 là Nhân viên thường
('EMP03', N'Trần Văn Nhân Sự', 'nhansutv@gmail.com', 'nhansutv', 'emp@2026', 0),
('EMP04', N'Phạm Hoàng Admin', 'admin.hoang@poly.edu.vn', 'hoangph', 'admin2026', 1),
('EMP05', N'Nguyễn Thị Thu Ngân', 'nganntt@gmail.com', 'nganntt', 'ngan123', 0);

-- Kiểm tra lại dữ liệu sau khi nhập
SELECT * FROM Employees;