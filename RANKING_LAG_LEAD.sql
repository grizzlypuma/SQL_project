--- 1: Employee salaries 
--- the Employee table contains the salaries of all employees. 
--- Each employee has an Id, a salary, and also has a column for the department Id.

/*
+----+-------+--------+--------------+
| Id | Name  | Salary | DepartmentId |
+----+-------+--------+--------------+
| 1  | Joe   | 70000  | 1            |
| 2  | Jim   | 90000  | 1            |
| 3  | Henry | 80000  | 2            |
| 4  | Sam   | 60000  | 2            |
| 5  | Max   | 90000  | 1            |
+----+-------+--------+--------------+
*/

--- The Department table contains the names and IDs of departments.

/*
+----+----------+
| Id | Name     |
+----+----------+
| 1  | IT       |
| 2  | Sales    |
+----+----------+
*/

--- Write an SQL query to find the highest paid employees in each department. 
--- For the above tables, your SQL query should return the following rows (row order does not matter).
/*
+------------+----------+--------+
| Department | Employee | Salary |
+------------+----------+--------+
| IT         | Max      | 90000  |
| IT         | Jim      | 90000  |
| Sales      | Henry    | 80000  |
+------------+----------+--------+
*/
select 
  B.Name as Department, 
  A.Name as Employee, 
  A.salary 
from 
  employee as A 
  join Department as B on Department.ID = Employee.DepartmentID 
where 
  dense_ranks(A.Salary) over(
    partition by B.Name 
    order by 
      A.name
  ) = 1


  ---------------------------------------------------------------------------

--- 2: Ranking of ratings 
--- write an SQL query to rank the scores in the Scores table. 
--- If two results are equal, both must have the same rating. Note that after a tie, the next sequence number must be the next consecutive integer value. 
--- That is, there should be no “holes” between the rows.

/*
+----+-------+
| Id | Score |
+----+-------+
| 1  | 3.50  |
| 2  | 3.65  |
| 3  | 4.00  |
| 4  | 3.85  |
| 5  | 4.00  |
| 6  | 3.65  |
+----+-------+
*/

--- For example, given the scoring table above, 
--- your query should produce the following report (in order of highest score):
/*
+-------+---------+
| score | Rank    |
+-------+---------+
| 4.00  | 1       |
| 4.00  | 1       |
| 3.85  | 2       |
| 3.65  | 3       |
| 3.65  | 3       |
| 3.50  | 4       |
+-------+---------+
*/
select 
  score, 
  dense_rank(score) over(
    order by 
      id
  ) as rank 
from 
  score 
order by 
  score

--------------------------------------------------------------------------------------

--- 3: Consecutive digits
--- Stadium table
/*
+---------------+---------+
| Column Name   | Type      |
+---------------+---------+
| id            | int          |
| visit_date    | date       |
| people        | int         |
+---------------+---------+
*/

---visit_date is the primary key for this table.
---Each row of this table contains the date of the visit and the ID of the stadium visit with the number of people during the visit.
---No two rows will have the same visit date, and as the ID increases, the dates also increase.

---Write an SQL query to display records with three or more rows with sequential IDs and a number of people greater than or equal to 100 for each.
---The result should be sorted by visit_date in ascending order.
---The format of the query result is shown in the following example.

/*
Stadium table:
+------+------------+-----------+
| id        | visit_date    | people       |
+------+------------+-----------+
| 1         | 2017-01-01  | 10              |
| 2         | 2017-01-02 | 109            |
| 3         | 2017-01-03 | 150            |
| 4         | 2017-01-04 | 99             |
| 5         | 2017-01-05  | 145           |
| 6         | 2017-01-06  | 1455        |
| 7         | 2017-01-07  | 199           |
| 8         | 2017-01-09  | 188          |
+------+------------+-----------+

?????????:
+------+------------+-----------+
| id        | visit_date    | people       |
+------+------------+-----------+
| 5         | 2017-01-05 | 145          |
| 6         | 2017-01-06 | 1455        |
| 7         | 2017-01-07 | 199           |
| 8         | 2017-01-09 | 188           |
+------+------------+-----------+
*/

---The four rows with IDs 5, 6, 7 and 8 have consecutive IDs and each had >= 100 people present. Note that line 8 was included even though visit_date was not the day after line 7.
---Rows with IDs 2 and 3 are not included because we need at least three consecutive IDs.

select 
  id, 
  visit_date, 
  people 
from 
  (
    select 
      id, 
      visit_date, 
      people, 
      lag(id) over (
        order by 
          visit_date
      ) AS prev_id, 
      lead(id) over (
        order by 
          visit_date
      ) AS next_id, 
      count(*) over (
        partition by id 
        order by 
          visit_date
      ) AS people_count 
    from 
      table_name
  ) AS subquery 
where 
  people_count >= 100 
  AND (
    id = prev_id + 1 
    OR id = next_id - 1
  ) 
order by 
  visit_date;

  ----------------------------------------------------------------------------------------

  --- 4: students in class
--- There is a table of courses with columns: student and class.
--- Please list all classes with at least 5 students.
--- For example, table:
/*
+ --------- + ------------ +
| student    | class            |
+ --------- + ------------ +
| ?                | Math |
| B                | English  |
| C                | Math |
| D                | Biology     |
| E                | Math  |
| F                | CompSci   |
| G                | Math |
| H                | Math |
| ?                | Math |
+ --------- + ------------ +
*/
--- Should output:
/*
+ --------- +
| class        |
+ --------- +
| Math |
+ --------- +
*/

--- Note:
--- Students should not be considered duplicates in each course
select 
  class 
from 
  student 
where 
  count(
    row_number() over(
      partition by class 
      order by 
        student
    )
  )>= 5 
group by 
  class
