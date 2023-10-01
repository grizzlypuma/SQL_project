
use testdb
drop table [Hackers]
drop table [Difficulty]
drop table [Challenges]
drop table [Submissions]

CREATE TABLE [Hackers] (
    [hacker_id] INT NOT NULL,
    [name] VARCHAR(100) NOT NULL,
);
GO

INSERT INTO [Hackers] ([hacker_id],[name]) 
VALUES (5580,N'Rose'), (8439,N'Angela'), (27205,N'Frank'), (52243,N'Patrick'), (52348,N'Lisa'), 
(57645,N'Kimberly'), (77726,N'Bonnie'), (83082,N'Michael'), (86870,N'Todd'), (90411,N'Joe')

SELECT * FROM [Hackers]

-- WEEK 3 TABLE Difficulty

CREATE TABLE [Difficulty] (
    [difficulty_level] INT NOT NULL,
    [score] INT NOT NULL
);
GO

INSERT INTO [Difficulty] ([difficulty_level],[score]) 
VALUES (1,20), (2,30), (3,40), (4,60), (5,80), (6,100), (7,120)

SELECT * FROM [Difficulty]


-- WEEK 3 TABLE Challenges

CREATE TABLE [Challenges] (
    [challenge_id] INT NOT NULL,
	[hacker_id] INT NOT NULL,
    [difficulty_level] INT NOT NULL
);
GO

INSERT INTO [Challenges] ([challenge_id], [hacker_id], [difficulty_level]) 
VALUES (4810,77726,4), (21089,27205,1), (36566,5580,7), (66730,52243,6), (71055,52243,2)

SELECT * FROM [Challenges]


-- WEEK 3 TABLE Submissions

CREATE TABLE [Submissions] (
    [submission_id] INT NOT NULL,
	[hacker_id] INT NOT NULL,
	[challenge_id] INT NOT NULL,
    [score] INT NOT NULL
);
GO

INSERT INTO [Submissions] ([submission_id], [hacker_id], [challenge_id], [score]) 
VALUES (68628, 77726, 36566, 30), 
(65300, 77726, 21089, 10), 
(40326, 52243, 36566, 77), 
(8941, 27205, 4810, 4), 
(83654, 77726, 66730, 30), 
(43353, 52243, 66730, 0), 
(55385, 52348, 71055, 20), 
(39784, 27205, 71055, 23), 
(94613, 86870, 71055, 30), 
(45788, 52348, 36566, 0), 
(93058, 86870, 36566, 30), 
(7344, 8439, 66730, 92), 
(2721, 8439, 4810, 36), 
(523, 5580, 71055, 4), 
(49105, 52348, 66730, 0), 
(55877, 57645, 66730, 80), 
(38355, 27205, 66730, 35), 
(3924, 8439, 36566, 80), 
(97397, 90411, 66730, 100), 
(84162, 83082, 4810, 40), 
(97431, 90411, 71055, 30),
(97432, 86870, 66730, 100),
(97433, 77726, 71055, 10),
(97434, 77726, 71055, 20)

SELECT * FROM [Submissions]

--- 1: Write an SQL query that will return you a list of hacker_ids and names of hackers 
--- who scored the maximum score on more than one task. Sort the results in descending order by 
--- the number of tasks on which the hacker scored the maximum score. If more than one hacker has the maximum score 
--- on the same number of tasks, sort them by hacker_id in ascending order.
select 
  H.hacker_id, 
  H.name 
from 
  hackers as H 
  join submissions as S on H.hacker_id = S.hacker_id 
  join challenges as C on S.challenge_id = C.challenge_id 
  join difficulty as D on C.difficulty_level = D.difficulty_level 
where 
  S.score = D.score 
group by 
  H.hacker_id, 
  H.name 
having 
  count(S.submission_id) > 1 
order by 
  H.hacker_id desc


--- 2: Write an SQL query that will return you a list of hacker_id and names of hackers 
--- who sent the most submissions to tasks with difficulty level 1, 2 or 3, 
--- sorted in descending order and with the number of attempts greater than 1
select 
  H.hacker_id, 
  H.name, 
  count(S.submission_id) as count_sub 
from 
  hackers as H 
  join submissions as S on H.hacker_id = S.hacker_id 
  join challenges as C on S.challenge_id = C.challenge_id 
  join difficulty as D on C.difficulty_level = D.difficulty_level 
where 
  D.difficulty_level in (1, 2, 3) 
group by 
  H.hacker_id, 
  H.name 
having 
  count(submission_ID) > 1 
order by 
  count(S.submission_id) desc



