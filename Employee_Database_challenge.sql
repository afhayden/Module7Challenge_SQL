-- Joining employees and titles tables to get retiring employees
SELECT e.emp_no,
	 e.first_name,
	 e.last_name,
	 ti.title,
     ti.from_date,
     ti.to_date
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

SELECT * FROM unique_titles;

-- Get retiring titles and count them
SELECT COUNT(*), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY COUNT(*) DESC;

SELECT * FROM retiring_titles


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
