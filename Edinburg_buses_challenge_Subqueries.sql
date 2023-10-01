--- For database detailes go to ---https://sqlzoo.net/wiki/Edinburgh_Buses.
/*

Route table - 1174 rows, including:

num	company	pos	stop
1	CRT		1	137
1	ORT		2	99
1	CRT		3	59
1	CRT		4	66
1	CRT		5	42
....
100	LRT		2	115
100	LRT		?	48
100	LRT		4	83
100	???		1	219
100	???		2	160
100	???		?	184
...
113	SMT		6	237
113	SMT		7	233
113	SMT		8	183
12	LRT		1	173
12	CRT		2	54
12	LRT		3	192

--------------------------------------------
Stops table - 246 rows, including:

id	name
1	Abertady
2	Abington
3	Amisfield Park
4	Ancrum
5	Armadale
6	ASDA
7	ASDA'8runstane
8	Auchendinny
9	Baberton
...
242	West Mains
243	Westburn
244	Wester Hailes
245	Wester Hailes Centre
246	Whitburn
247	Whitecraig
248	Wilkieston
249	Willowbrae
250	Wtnchburgh

*/

--- 1: The query shown gives the number of routes that pass through London Road (149) or 
--- Craiglockhart (53). The two services that link these stops have COUNT=2. 
--- Add a HAVING clause to limit the output to these two routes.
SELECT 
  company, 
  num, 
  COUNT(*) 
FROM 
  route 
WHERE 
  (
    stop = 149 
    OR stop = 53
  ) 
group by 
  company, 
  num 
having 
  count(*) = 2

--- 2: If you do a self join, b.stop gives you all the places you can get to from 
--- Craiglockhart without changing routes. Write your query to show services from 
--- Craiglockhart to London Road.
select 
  A.num, 
  A.company, 
  S.name, 
  S2.name 
from 
  route as A 
  join route as B on (
    A.num = B.num 
    and A.company = B.company
  ) 
  join stops as S on S.id = A.stop 
  join stops as S2 on S2.id = B.stop 
where 
  S.name = 'Craiglockhart' 
  and S2.name = 'London Road'

--- 3: Provide a list of services connecting Craiglockhart and Tollcross stops.
select 
  A.num, 
  A.company, 
  S.name, 
  S2.name 
from 
  route as A 
  join route as B on (
    A.num = B.num 
    and A.company = B.company
  ) 
  join stops as S on S.id = A.stop 
  join stops as S2 on S2.id = B.stop 
where 
  S.name = 'Craiglockhart' 
  and S2.name = 'Tollcross'

--- 4: List all services that connect stops 115 and 137 ('Haymarket' and 'Leith').
select 
  distinct A.num, 
  A.company, 
  A.stop, 
  B.stop 
from 
  route as A 
  join route as B on (
    B.num = A.num 
    and B.company = A.company
  ) 
where 
  A.stop = 115 
  and B.stop = 137

--- 5: Create a unique list of stops that can be reached from Craiglockhart on one bus, including Craiglockhart itself, 
--- which is offered by the LRT. Include the company and bus number of the relevant services.
select 
  distinct A.num, 
  A.company, 
  S.name 
from 
  route as A 
  join route as B on (
    A.num = B.num 
    and A.company = B.company
  ) 
  join stops as S on S.id = A.stop 
  join stops as S2 on S2.id = B.stop 
where 
  S.name = 'Craiglockhart' 
  and A.company = 'LRT'

--- 6: Find routes involving two buses that can travel from Craiglockhart to Lochend. 
--- Show the bus number and company of the first bus, the name of the transfer stop, the bus number and company of the second bus.
SELECT 
  a.num, 
  a.company, 
  bstop.name, 
  c.num, 
  c.company 
FROM 
  route AS a 
  JOIN route AS b ON (
    a.company = b.company 
    AND a.num = b.num
  ) 
  JOIN route AS c ON (b.stop = c.stop) 
  JOIN route AS d ON (
    c.company = d.company 
    AND c.num = d.num
  ) 
  JOIN stops AS astop ON (a.stop = astop.id) 
  JOIN stops AS bstop ON (b.stop = bstop.id) 
  JOIN stops AS cstop ON (c.stop = cstop.id) 
  JOIN stops AS dstop ON (d.stop = dstop.id) 
WHERE 
  astop.name = 'Craiglockhart' 
  AND dstop.name = 'Lochend' 
  AND bstop.id = cstop.id







