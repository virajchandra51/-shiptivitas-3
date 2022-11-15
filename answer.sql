-- TYPE YOUR SQL QUERY BELOW

-- PART 1: Create a SQL query that maps out the daily average users before and after the feature change

select count(*) as Daily_Users, strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch')) as Day from login_history group by strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch')); 
select avg(a.dayCount) from (select count(*) as dayCount from login_history group by strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch'))) a;


--query of before the feature change
select count(*) as Count, strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch')) as Day from login_history where login_timestamp < 1527898041 group by strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch'));
select avg(a.dayCount) from (select count(*) as dayCount from login_history where login_timestamp < 1527898041 group by strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch'))) a;


--query of after the feature change
select count(*) as Count, strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch')) as Day from login_history where login_timestamp > 1527898040 group by strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch'));
select avg(a.dayCount) from (select count(*) as dayCount from login_history where login_timestamp > 1527898040 group by strftime('%m-%d-%Y', datetime(login_timestamp, 'unixepoch'))) a;


-- PART 2: Create a SQL query that indicates the number of status changes by card

select cardID, count(*) from card_change_history where oldStatus != newStatus group by cardID; 


