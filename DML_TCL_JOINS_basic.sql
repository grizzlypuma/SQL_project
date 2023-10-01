

-- Drop table bookings if already exists
If (Exists (select * 
            from information_schema.tables 
            where table_name = 'bookings'))
Begin
 Drop Table bookings 
End

-- Drop table facilities if already exists
If (Exists (select * 
            from information_schema.tables 
            where table_name = 'facilities'))
Begin
 Drop Table facilities 
End

-- Drop table members if already exists
If (Exists (select * 
            from information_schema.tables 
            where table_name = 'members'))
Begin
 Drop Table members 
End


CREATE TABLE bookings (
    bookid integer NOT NULL,
    facid integer NOT NULL,
    memid integer NOT NULL,
    starttime datetime NOT NULL,
    slots integer NOT NULL
);


CREATE TABLE facilities (
    facid integer NOT NULL,
    name character varying(100) NOT NULL,
    membercost numeric NOT NULL,
    guestcost numeric NOT NULL,
    initialoutlay numeric NOT NULL,
    monthlymaintenance numeric NOT NULL
);


CREATE TABLE members (
    memid integer NOT NULL,
    surname character varying(200) NOT NULL,
    firstname character varying(200) NOT NULL,
    address character varying(300) NOT NULL,
    zipcode integer NOT NULL,
    telephone character varying(20) NOT NULL,
    recommendedby integer,
    joindate datetime NOT NULL
);


INSERT INTO bookings (bookid, facid, memid, starttime, slots) VALUES
(0, 3, 1, '07-03-2012 11:00:00', 2),
(1, 4, 1, '07-03-2012 08:00:00', 2),
(2, 6, 0, '07-03-2012 18:00:00', 2),
(3, 7, 1, '07-03-2012 19:00:00', 2),
(4, 8, 1, '07-03-2012 10:00:00', 1),
(5, 8, 1, '07-03-2012 15:00:00', 1),
(6, 0, 2, '07-04-2012 09:00:00', 3),
(7, 0, 2, '07-04-2012 15:00:00', 3),
(8, 4, 3, '07-04-2012 13:30:00', 2),
(9, 4, 0, '07-04-2012 15:00:00', 2),
(10, 4, 0, '07-04-2012 17:30:00', 2),
(11, 6, 0, '07-04-2012 12:30:00', 2),
(12, 6, 0, '07-04-2012 14:00:00', 2),
(13, 6, 1, '07-04-2012 15:30:00', 2),
(14, 7, 2, '07-04-2012 14:00:00', 2),
(15, 8, 2, '07-04-2012 12:00:00', 1),
(16, 8, 3, '07-04-2012 18:00:00', 1),
(17, 1, 0, '07-05-2012 17:30:00', 3),
(18, 2, 1, '07-05-2012 09:30:00', 3),
(19, 3, 3, '07-05-2012 09:00:00', 2),
(20, 3, 1, '07-05-2012 19:00:00', 2),
(21, 4, 3, '07-05-2012 18:30:00', 2),
(22, 6, 0, '07-05-2012 13:00:00', 2),
(23, 6, 1, '07-05-2012 14:30:00', 2),
(24, 7, 2, '07-05-2012 18:30:00', 2),
(25, 8, 3, '07-05-2012 12:30:00', 1),
(26, 0, 0, '07-06-2012 08:00:00', 3),
(27, 0, 0, '07-06-2012 14:00:00', 3),
(28, 0, 2, '07-06-2012 15:30:00', 3),
(29, 2, 1, '07-06-2012 17:00:00', 3),
(30, 3, 1, '07-06-2012 11:00:00', 2),
(31, 4, 3, '07-06-2012 12:00:00', 2),
(32, 6, 1, '07-06-2012 14:00:00', 2),
(33, 7, 2, '07-06-2012 08:30:00', 2),
(34, 7, 2, '07-06-2012 13:30:00', 2),
(35, 8, 3, '07-06-2012 15:30:00', 1),
(36, 0, 2, '07-08-2012 08:30:00', 3),
(37, 0, 0, '07-08-2012 12:30:00', 3),
(38, 0, 2, '07-08-2012 14:30:00', 3),
(39, 1, 3, '07-08-2012 08:30:00', 3),
(40, 2, 1, '07-08-2012 09:00:00', 3),
(41, 2, 1, '07-08-2012 11:30:00', 3),
(42, 2, 1, '07-08-2012 16:00:00', 3),
(43, 3, 2, '07-08-2012 12:30:00', 2),
(44, 4, 3, '07-08-2012 11:30:00', 2),
(45, 4, 3, '07-08-2012 14:00:00', 2),
(46, 4, 0, '07-08-2012 17:30:00', 2),
(47, 6, 0, '07-08-2012 08:30:00', 2),
(48, 6, 1, '07-08-2012 10:30:00', 2),
(49, 6, 1, '07-08-2012 14:30:00', 2),
(50, 6, 0, '07-08-2012 16:00:00', 2),
(51, 7, 2, '07-08-2012 11:30:00', 2),
(52, 8, 3, '07-08-2012 16:00:00', 1),
(53, 8, 3, '07-08-2012 17:30:00', 2),
(54, 0, 3, '09-08-2012 13:00:00', 3),
(55, 0, 2, '09-08-2012 17:30:00', 3),
(56, 1, 1, '09-08-2012 15:00:00', 3),
(57, 1, 1, '09-08-2012 17:30:00', 3),
(58, 3, 1, '09-08-2012 11:30:00', 2),
(59, 3, 3, '09-08-2012 18:30:00', 2),
(60, 3, 1, '09-09-2012 19:30:00', 2),
(61, 4, 0, '09-10-2012 11:00:00', 2),
(62, 4, 2, '09-11-2012 16:30:00', 2),
(63, 4, 0, '09-12-2012 18:00:00', 2),
(64, 4, 0, '09-20-2012 19:30:00', 2),
(65, 6, 0, '09-20-2012 14:00:00', 2),
(66, 0, 0, '09-21-2012 18:30:00', 2),
(67, 7, 2, '09-21-2012 11:00:00', 2),
(68, 7, 1, '09-22-2012 16:30:00', 2),
(69, 8, 3, '09-23-2012 10:00:00', 1),
(70, 8, 3, '09-24-2012 16:30:00', 1),
(71, 0, 2, '10-09-2012 12:30:00', 3),
(72, 0, 2, '10-09-2012 15:30:00', 3),
(73, 0, 2, '10-09-2012 19:00:00', 3),
(74, 1, 0, '10-09-2012 13:00:00', 3),
(75, 1, 1, '10-09-2012 19:00:00', 3),
(76, 2, 1, '10-09-2012 09:00:00', 1),
(77, 2, 0, '10-09-2012 19:00:00', 3),
(78, 3, 3, '10-09-2012 17:00:00', 2),
(79, 3, 3, '10-09-2012 18:30:00', 2),
(80, 4, 2, '10-09-2012 11:00:00', 2),
(81, 4, 3, '10-09-2012 14:30:00', 2),
(82, 6, 0, '10-09-2012 14:30:00', 2),
(83, 7, 1, '10-09-2012 15:30:00', 2),
(84, 7, 0, '10-09-2012 18:30:00', 3),
(85, 8, 3, '10-09-2012 09:30:00', 1),
(86, 8, 3, '10-09-2012 16:30:00', 1),
(87, 8, 3, '10-09-2012 20:00:00', 1),
(88, 0, 0, '11-10-2012 11:30:00', 3),
(89, 0, 0, '11-10-2012 16:00:00', 3),
(90, 3, 2, '11-10-2012 08:00:00', 2),
(91, 3, 1, '11-10-2012 11:00:00', 2),
(92, 3, 3, '11-10-2012 15:30:00', 2),
(93, 3, 2, '11-10-2012 16:30:00', 2),
(94, 3, 1, '11-10-2012 18:00:00', 2),
(95, 4, 0, '11-10-2012 10:00:00', 2),
(96, 4, 4, '11-10-2012 11:30:00', 2),
(97, 4, 0, '11-10-2012 15:00:00', 2),
(98, 4, 3, '11-10-2012 17:00:00', 4),
(99, 5, 0, '11-10-2012 08:30:00', 2),
(100, 6, 5, '11-10-2012 14:30:00', 1),
(101, 0, 6, '11-10-2012 08:30:00', 2),
(102, 1, 7, '11-10-2012 09:30:00', 3),
(103, 2, 8, '11-10-2012 10:30:00', 1),
(104, 3, 9, '11-10-2012 08:30:00', 2),
(105, 4, 10, '11-10-2012 09:30:00', 3),
(106, 5, 11, '11-10-2012 10:30:00', 1),
(107, 6, 12, '11-10-2012 08:30:00', 2),
(108, 7, 13, '11-10-2012 09:30:00', 3),
(109, 8, 14, '11-10-2012 10:30:00', 1),
(110, 0, 15, '11-11-2012 08:30:00', 2),
(111, 1, 16, '11-11-2012 09:30:00', 3),
(112, 2, 17, '11-11-2012 10:30:00', 1),
(113, 3, 18, '11-11-2012 08:30:00', 2),
(114, 4, 19, '11-11-2012 09:30:00', 3),
(115, 5, 20, '11-11-2012 10:30:00', 1),
(116, 6, 21, '11-11-2012 08:30:00', 2),
(117, 7, 22, '11-11-2012 09:30:00', 3),
(118, 8, 23, '11-11-2012 10:30:00', 1),
(119, 0, 24, '11-12-2012 08:30:00', 2),
(120, 1, 25, '11-12-2012 09:30:00', 3),
(121, 2, 26, '11-12-2012 10:30:00', 1),
(122, 3, 27, '11-12-2012 08:30:00', 2),
(123, 4, 28, '11-12-2012 09:30:00', 3),
(124, 5, 29, '11-12-2012 10:30:00', 1),
(125, 6, 27, '11-13-2012 08:30:00', 2),
(126, 7, 28, '11-13-2012 09:30:00', 3),
(127, 8, 29, '11-13-2012 10:30:00', 1),
(128, 0, 30, '11-13-2012 08:30:00', 2),
(129, 1, 31, '11-14-2012 09:30:00', 3),
(130, 3, 32, '11-14-2012 10:30:00', 1),
(131, 4, 33, '11-14-2012 08:30:00', 2),
(132, 5, 34, '11-14-2012 09:30:00', 3),
(133, 6, 35, '11-14-2012 10:30:00', 2)



INSERT INTO facilities (facid, name, membercost, guestcost, initialoutlay, monthlymaintenance) VALUES
(0, 'Tennis Court 1', 5, 25, 10000, 200),
(1, 'Tennis Court 2', 5, 25, 8000, 200),
(2, 'Badminton Court', 0, 15.5, 4000, 50),
(3, 'Table Tennis', 0, 5, 320, 10),
(4, 'Massage Room 1', 35, 80, 4000, 3000),
(5, 'Massage Room 2', 35, 80, 4000, 3000),
(6, 'Squash Court', 3.5, 17.5, 5000, 80),
(7, 'Snooker Table', 0, 5, 450, 15),
(8, 'Pool Table', 0, 5, 400, 15);



INSERT INTO members (memid, surname, firstname, address, zipcode, telephone, recommendedby, joindate) VALUES
(0, 'GUEST', 'GUEST', 'GUEST', 0, '(000) 000-0000', NULL, '07-01-2012 00:00:00'),
(1, 'Smith', 'Darren', '8 Bloomsbury Close, Boston', 4321, '555-555-5555', NULL, '07-02-2012 12:02:05'),
(2, 'Smith', 'Tracy', '8 Bloomsbury Close, New York', 4321, '555-555-5555', NULL, '07-12-2012 12:08:23'),
(3, 'Rownam', 'Tim', '23 Highway Way, Boston', 23423, '(844) 693-0723', NULL, '07-03-2012 09:32:15'),
(4, 'Joplette', 'Janice', '20 Crossing Road, New York', 234, '(833) 942-4710', 1, '07-03-2012 10:25:05'),
(5, 'Butters', 'Gerald', '1065 Huntingdon Avenue, Boston', 56754, '(844) 078-4130', 1, '07-09-2012 10:44:09'),
(6, 'Tracy', 'Burton', '3 Tunisia Drive, Boston', 45678, '(822) 354-9973', NULL, '07-15-2012 08:52:55'),
(7, 'Dare', 'Nancy', '6 Hunting Lodge Way, Boston', 10383, '(833) 776-4001', 4, '07-25-2012 08:59:12'),
(8, 'Boothe', 'Tim', '3 Bloomsbury Close, Reading, 00234', 234, '(811) 433-2547', 3, '07-25-2012 16:02:35'),
(9, 'Stibbons', 'Ponder', '5 Dragons Way, Winchester', 87630, '(833) 160-3900', 6, '07-25-2012 17:09:05'),
(10, 'Owen', 'Charles', '52 Cheshire Grove, Winchester, 28563', 28563, '(855) 542-5251', 1, '08-03-2012 19:42:37'),
(11, 'Jones', 'David', '976 Gnats Close, Reading', 33862, '(844) 536-8036', 4, '08-06-2012 16:32:55'),
(12, 'Baker', 'Anne', '55 Powdery Street, Boston', 80743, '844-076-5141', 9, '08-10-2012 14:23:22'),
(13, 'Farrell', 'Jemima', '103 Firth Avenue, North Reading', 57392, '(855) 016-0163', NULL, '08-10-2012 14:28:01'),
(14, 'Smith', 'Jack', '252 Binkington Way, Boston', 69302, '(822) 163-3254', 1, '08-10-2012 16:22:05'),
(15, 'Bader', 'Florence', '264 Ursula Drive, Westford', 84923, '(833) 499-3527', 9, '08-10-2012 17:52:03'),
(16, 'Baker', 'Timothy', '329 James Street, Reading', 58393, '833-941-0824', 13, '08-15-2012 10:34:25'),
(17, 'Pinker', 'David', '5 Impreza Road, Boston', 65332, '811 409-6734', 13, '08-16-2012 11:32:47'),
(20, 'Genting', 'Matthew', '4 Nunnington Place, Wingfield, Boston', 52365, '(811) 972-1377', 5, '08-10-2012 14:55:55'),
(21, 'Mackenzie', 'Anna', '64 Perkington Lane, Reading', 64577, '(822) 661-2898', 1, '08-26-2012 09:32:05'),
(22, 'Coplin', 'Joan', '85 Bard Street, Bloomington, Boston', 43533, '(822) 499-2232', 16, '08-29-2012 08:32:41'),
(24, 'Sarwin', 'Ramnaresh', '12 Bullington Lane, Boston', 65464, '(822) 413-1470', 15, '09-01-2012 08:44:42'),
(26, 'Jones', 'Douglas', '976 Gnats Close, Reading', 11986, '844 536-8036', 11, '09-02-2012 18:43:05'),
(27, 'Rumney', 'Henrietta', '3 Burkington Plaza, Boston', 78533, '(822) 989-8876', 20, '09-05-2012 08:42:35'),
(28, 'Farrell', 'David', '437 Granite Farm Road, Westford', 43532, '(855) 755-9876', NULL, '09-15-2012 08:22:05'),
(29, 'Worthington-Smyth', 'Henry', '55 Jagbi Way, North Reading', 97676, '(855) 894-3758', 2, '09-17-2012 12:27:15'),
(30, 'Purview', 'Millicent', '641 Drudgery Close, Burnington, Boston', 34232, '(855) 941-9786', 2, '09-18-2012 19:04:01'),
(33, 'Tupperware', 'Hyacinth', '33 Cheerful Plaza, Drake Road, Westford', 68666, '(822) 665-5327', NULL, '09-18-2012 19:32:05'),
(35, 'Hunt', 'John', '5 Bullington Lane, Boston', 54333, '(899) 720-6978', 30, '09-19-2012 11:32:45'),
(36, 'Crumpet', 'Erica', 'Crimson Road, North Reading', 75655, '(811) 732-4816', 2, '10-12-2012 08:36:38'),
(37, 'Smith', 'Darren', '3 Funktown, Denzington, Boston', 66796, '(822) 577-3541', NULL, '10-16-2012 18:08:45');


--- 1: 1. Print a list of facilities where members must pay
select 
  name 
from 
  facilities 
where 
  membercost > 0
--- 2: 2. Print a list of facilities in which members must pay and the payment was less than 1/50 of the monthly maintenance. 
--- The table must contain facid, facility name, member cost, and monthly maintenance.
select 
  facid, 
  name, 
  membercost, 
  monthlymaintenance 
from 
  facilities 
where 
  membercost < monthlymaintenance / 50 
  and membercost > 0
--- 3: 3. Print a list of facilities with the word ‘Tennis’ in the name
select 
  * 
from 
  facilities 
where 
  name like '%tennis%'
--- 4: 4. What code should be written to display information for facilities with ID 1 and 5. 
--- Do not use the OR operator.
select 
  * 
from 
  facilities 
where 
  facid in (1, 5)
--- 5: 5. How can I produce a list of members who joined after September 2012? 
--- Print memid, surname, firstname, and joindate.
select 
  memid, 
  surname, 
  firstname, 
  joindate 
from 
  members 
where 
  joindate > '2012-09-30'
--- 6: 6. How can you display a list of the first 10 last names sorted alphabetically? 
--- The list must not contain duplicates.
select 
  distinct top 10 surname 
from 
  members 
order by 
  surname asc
--- 7: 7. You want to know the joindate of the most recent member (who joined last). 
--- What code do you need to write?
select 
  max(joindate) 
from 
  members
--- 8: 8. Write code to request starttime bookings for a member named David Farrell.
select 
  starttime 
from 
  bookings as B 
  join members as m on B.memid = M.memid 
where 
  M.firstname = 'David' 
  and M.surname = 'Farrell'
--- 9: 9. What code should I write to list starttimes for tennis court reservations by date '2012-09-21'? List starttime and facility name in pairs and then sort by time. 
--- Data at start time is stored in this format: 2012-09-21 08:00:00
select 
  starttime, 
  F.name 
from 
  bookings as B 
  join facilities as F on B.facid = F.facid 
where 
  B.starttime between '2012-09-21 00:00:00' 
  and '2012-09-21 23:59:59' 
  and F.name like '%tennis%' 
order by 
  B.starttime
