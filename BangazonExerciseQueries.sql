-- 1 List each employee first name, last name and supervisor status along with their department name. Order by department name, then by employee last name, and finally by employee first name.

--SELECT e.FirstName, e.LastName, e.IsSupervisor, d.Name
--FROM Employee e Join Department d ON d.Id = e. departmentId
--ORDER BY d.Name, e.LastName, e.FirstName
--==========================================================================
-- 2 List each department ordered by budget amount with the highest first.

--SELECT Name,Budget 
--FROM Department
--ORDER BY Budget Desc
--===========================================================================

-- 3 List each department name along with any employees (full name) in that department who are supervisors.

--Select d.Name, e.FirstName + ' '+ e.LastName As 'Full Name'
--From Employee e JOIN Department d ON d.Id = e.DepartmentId
--Where IsSupervisor = 'true'

--=============================================================================

-- 4 List each department name along with a count of employees in each department.

--SELECT d.Name, COUNT(e.DepartmentId)AS 'Employee Count'
--FROM Employee e JOIN Department d ON e.DepartmentId = d.Id
--GROUP BY d.Name
--=======================================================================
-- 5 Write a single update statement to increase each department's budget by 20%.

--UPDATE Department
--SET Budget = (Budget + (Budget*.20))
--==========================================================================
-- 6 List the employee full names for employees who are not signed up for any training programs.

--Select e.FirstName +' ' + e.LastName AS 'Full Name'
--From Employee e LEFT JOIN EmployeeTraining t ON e.Id = t.EmployeeId
--WHERE t.EmployeeId IS NULL

--=========================================================================
-- 7 List the employee full names for employees who are signed up for at least one training program and include the number of training programs they are signed up for.

--Select COUNT(t.EmployeeId)AS 'Training Program Count',e.FirstName +' ' + e.LastName AS 'Full Name'
--From Employee e LEFT JOIN EmployeeTraining t ON e.Id = t.EmployeeId
--WHERE t.EmployeeId IS NOT NULL
--Group by e.FirstName, e.LastName

--===========================================================================
-- 8 List all training programs along with the count employees who have signed up for each.

--SELECT COUNT(t.EmployeeId)AS 'Employee Count', tp.Name
--FROM EmployeeTraining t JOIN TrainingProgram tp
--ON t.TrainingProgramId = tp.Id
--GROUP BY Name

--=============================================================================
-- 9 List all training programs who have no more seats available.
--******************************************************************
--Select tp.Name AS TrainingProgram, tp.MaxAttendees, Count(et.EmployeeId) AS EmployeesEnrolled 
--from TrainingProgram tp left join EmployeeTraining et on et.TrainingProgramId = tp.Id 
--Group By tp.Name, tp.MaxAttendees 
--having Count(et.EmployeeId) = tp.MaxAttendees 

--=========================================================================
-- 10 List all future training programs ordered by start date with the earliest date first.

--SELECT  Name, StartDate
--FROM TrainingProgram
--Where StartDate > GETDATE()
--Order By StartDate 
--======================================================================

-- 11 Assign a few employees to training programs of your choice.
--INSERT INTO EmployeeTraining(EmployeeId, TrainingProgramId) VALUES (3,2);
--INSERT INTO EmployeeTraining(EmployeeId, TrainingProgramId) VALUES (3,3);
--========================================================================

-- 12 List the top 3 most popular training programs. (For this question, consider each record in the training program table to be a UNIQUE training program).

--SELECT TOP 3 tp.Id, tp.Name, COUNT(et.EmployeeId) AS 'Employee Count'
--FROM TrainingProgram tp
--JOIN EmployeeTraining et on tp.Id = et.TrainingProgramId
--GROUP BY tp.Id, tp.Name
--ORDER BY COUNT(et.EmployeeId) DESC
--==================================================================

-- 13 List the top 3 most popular training programs. (For this question consider training programs with the same name to be the SAME training program).

--SELECT TOP 3  tp.Name, COUNT(et.EmployeeId) AS 'Employee Count'
--FROM TrainingProgram tp
--JOIN EmployeeTraining et on tp.Id = et.TrainingProgramId
--GROUP BY tp.Name
--ORDER BY COUNT(et.EmployeeId) DESC

--==================================================================
-- 14 List all employees who do not have computers.
--SELECT FirstName + '  ' + LastName As 'Employee w/o computer'
--From Employee e LEFT JOIN  ComputerEmployee ce
--ON e.Id = ce.EmployeeId
--WHERE ce.ComputerId IS NULL 
--======================================================================
-- 15 List all employees along with their current computer information make and manufacturer combined into a field entitled ComputerInfo. If they do not have a computer, this field should say "N/A".

-- 16 List all computers that were purchased before July 2019 that are have not been decommissioned.
-- 17 List all employees along with the total number of computers they have ever had.
-- 18 List the number of customers using each payment type
-- 19 List the 10 most expensive products and the names of the seller
-- 20 List the 10 most purchased products and the names of the seller
-- 21 Find the name of the customer who has made the most purchases
-- 22 List the amount of total sales by product type
-- 23 List the total amount made from all sellers