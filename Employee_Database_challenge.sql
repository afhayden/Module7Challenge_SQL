-- Joining employees and titles tables to get retiring employees
SELECT e.emp_no,
	 e.first_name,
	 e.last_name,
	 ti.title,
     ti.from_date,
     ti.to_date,
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no,
rt.first_name,
rt.last_name,
rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = '9999-01-01'
ORDER BY rt.emp_no, rt.to_date DESC;

SELECT distinct(title) FROM unique_titles;

-- Get retiring titles and count them
SELECT COUNT(*), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(*) DESC;

SELECT title as "Job Title",  TO_CHAR(count, 'fm999G999') as "Total" FROM retiring_titles


-- Joining employees and titles tables to get mentor-eligible employees
SELECT DISTINCT ON (e.emp_no) e.emp_no,
	 e.first_name,
	 e.last_name,
	 e.birth_date,
	 ti.title,
     de.from_date,
     de.to_date
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	 AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no;

SELECT * FROM mentorship_eligibility;

SELECT title as "Job Title",  TO_CHAR(count(*), 'fm999G999') as "Total"
FROM mentorship_eligibility
GROUP BY title
ORDER BY COUNT(*) DESC;

--1st new query for Summary section of ReadMe file
drop table retirement_titles_birth;
SELECT e.emp_no,
	 e.first_name,
	 e.last_name,
	 e.birth_date,
	 DATE_PART('year', now()::date) - DATE_PART('year', e.birth_date::date) as emp_age,
	 ti.title,
     ti.from_date,
     ti.to_date
INTO retirement_titles_birth
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT emp_age As "Retiring Age", TO_CHAR(COUNT(*), 'fm999G999') as "Total"
FROM retirement_titles_birth as ra
GROUP BY emp_age
ORDER BY emp_age;

SELECT DATE_PART('year', now()::date) - DATE_PART('year', birth_date::date) as emp_age, TO_CHAR(COUNT(*), 'fm999G999') as "Total"
FROM mentorship_eligibility
GROUP BY emp_age
ORDER BY emp_age;



--2nd new query for Summary section of ReadMe file
drop table non_retiring;
--query for non-retiring employees
SELECT e.emp_no,
	 e.first_name,
	 e.last_name,
	 e.birth_date,
	 DATE_PART('year', now()::date) - DATE_PART('year', e.birth_date::date) as emp_age,
	 ti.title,
     ti.from_date,
     ti.to_date
INTO non_retiring
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE (e.birth_date > '1955-12-31')
ORDER BY e.emp_no;

SELECT emp_age As "Non-Retired Age", TO_CHAR(COUNT(*), 'fm999G999') as "Total"
FROM non_retiring as ra
GROUP BY emp_age
ORDER BY emp_age;


SELECT e.emp_no,
	 e.first_name,
	 e.last_name,
	 ti.title,
     ti.from_date,
     ti.to_date,
	 CASE 
	 	WHEN ti.to_date = '9999-01-01' THEN DATE_PART('year', now()::date) - DATE_PART('year', ti.from_date::date)
	 	ELSE DATE_PART('year', ti.to_date::date) - DATE_PART('year', ti.from_date::date)
	 END as "YRS in Role"
--INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON e.emp_no = ti.emp_no
WHERE e.birth_date > '1955-12-31'
ORDER BY e.emp_no;
