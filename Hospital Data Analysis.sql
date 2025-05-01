CREATE TABLE Hospital(
	 Hospital_Name VARCHAR(100),
	 Location VARCHAR(50),
	 Department VARCHAR(100),
	 Doctors_Count INT,
	 Patients_Count INT,
	 Admission_Date DATE,
	 Discharge_Date	DATE,
	 Medical_Expenses NUMERIC(10,2)
);


SELECT * FROM Hospital;


-- 1. Write an SQL query to find the total number of patients across all hospitals.
SELECT DISTINCT hospital_name, SUM(patients_count) AS total_patients_count
FROM Hospital
GROUP BY hospital_name;


--2. Retrieve the average count of doctors available in each hospital.
SELECT hospital_name, AVG(doctors_count) AS AVG_doctors_per_hospital
FROM Hospital
GROUP BY  hospital_name
ORDER BY AVG(doctors_count) ASC;


--3. Find the top 3 hospital departments that have the highest number of patients.
SELECT DISTINCT department, SUM(patients_count) AS total_patients
FROM Hospital
GROUP BY department
ORDER BY total_patients DESC LIMIT 3;


--4. Identify the hospital that recorded the highest medical expenses.
SELECT hospital_name,SUM(medical_expenses) AS highest_expenses
FROM Hospital
GROUP BY hospital_name
ORDER BY highest_expenses DESC LIMIT 1


--5. Calculate the average medical expenses per day for each hospital.
SELECT Hospital_Name, AVG(Medical_Expenses / GREATEST(Discharge_Date - Admission_Date, 1)) AS Avg_Expense_Per_Day
FROM Hospital
GROUP BY Hospital_Name;


--6. Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
SELECT *, (discharge_date - admission_date) AS longest_stay
FROM Hospital
ORDER BY longest_stay DESC LIMIT 1;


--7. Count the total number of patients treated in each city.
SELECT DISTINCT location,SUM(patients_count) AS total_number_of_patients
FROM  Hospital
GROUP BY location;


--8. Calculate the average number of days patients spend in each department.
SELECT department, AVG(discharge_date - admission_date) AS avg_days
FROM Hospital
GROUP BY department;


--9. Find the department with the least number of patients.
SELECT department, SUM(patients_count) AS least_number_of_patients
FROM Hospital
GROUP BY department 
ORDER BY SUM(patients_count) ASC LIMIT 1;


--10. Group the data by month and calculate the total medical expenses for each month.
SELECT TO_CHAR(Admission_Date, 'YYYY-MM') AS Month, SUM(Medical_Expenses) AS Total_Medical_Expenses
FROM Hospital
GROUP BY TO_CHAR(Admission_Date, 'YYYY-MM')
ORDER BY Month;