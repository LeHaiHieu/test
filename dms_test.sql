create database ABCcompany;

use ABCcompany;

CREATE TABLE Department (
    dept_code VARCHAR(10) PRIMARY KEY,
    dept_name NVARCHAR(100)
);

CREATE TABLE Employee (
    emp_code VARCHAR(10) PRIMARY KEY,
    emp_name NVARCHAR(100) NOT NULL,
    dept_code VARCHAR(10) NOT NULL,
    FOREIGN KEY (dept_code) REFERENCES Department(dept_code)
);

CREATE TABLE Payroll (
    emp_code VARCHAR(10) NOT NULL,
    period_year INT NOT NULL,
    period_month TINYINT NOT NULL,
    working_days TINYINT,
    paid_leave_days TINYINT,
    unpaid_leave_days TINYINT,
    basic_salary_per_day INT,
    gross_salary INT,
    net_salary INT,
    note NVARCHAR(200),
    PRIMARY KEY(emp_code, period_year, period_month),
    FOREIGN KEY(emp_code) REFERENCES Employee(emp_code)
);

INSERT INTO Department VALUES
('IT', N'Công nghệ thông tin'),
('HR', N'Nhân sự'),
('SALE', N'Kinh doanh');

INSERT INTO Employee VALUES
('A1', N'Nguyễn Văn A', 'IT'),
('A2', N'Lê Thị Bình', 'IT'),
('B1', N'Nguyễn Lan', 'HR'),
('D1', N'Mai Tuấn Anh', 'HR'),
('C1', N'Hà Thị Lan', 'HR'),
('C2', N'Lê Tú Chinh', 'SALE'),
('D2', N'Trần Văn Toàn', 'HR'),
('A3', N'Trần Văn Nam', 'IT'),
('B2', N'Huỳnh Anh', 'SALE');

INSERT INTO Payroll VALUES
('A1', 2025, 10, 22, 0, 0, 1000, 22000, 20000, NULL),
('A2', 2025, 10, 21, 1, 0, 1200, 26400, 23000, NULL),
('B1', 2025, 10, 20, 1, 1, 600, 13200, 12000, NULL),
('D1', 2025, 10, 20, 1, 1, 500, 11000, 10000, NULL),
('C1', 2025, 10, 22, 0, 0, 500, 11000, 10000, NULL),
('C2', 2025, 10, 22, 0, 0, 1200, 26400, 23000, NULL),
('D2', 2025, 10, 22, 0, 0, 500, 11000, 10000, NULL),
('A3', 2025, 10, 22, 0, 0, 1200, 26400, 23000, NULL),
('B2', 2025, 10, 21, 1, 0, 1200, 26400, 23000, NULL);

GO

CREATE PROCEDURE uTongLuongTheoPhongBan
    @Year INT,
    @Month TINYINT
AS
BEGIN
    SELECT e.dept_code AS MaPhongBan,
           SUM(p.net_salary) AS TongLuongThucNhan
    FROM Payroll p
    JOIN Employee e ON p.emp_code = e.emp_code
    WHERE p.period_year = @Year AND p.period_month = @Month
    GROUP BY e.dept_code
    ORDER BY e.dept_code ASC;
END

GO