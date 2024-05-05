CREATE DATABASE project;
USE project;
SHOW DATABASES;

#1 sql query to find  in which sport or event india has won the highest medals

SELECT * FROM dataset_olympics;
SELECT Event, COUNT(Medal) AS Medal_Count
FROM dataset_olympics
WHERE Team='India' AND Medal<>'NA'
GROUP BY Event
ORDER BY COUNT(Medal) DESC;

#2 identify the sports or event which was played most consecutively in th summer olympic games

select year,Event,count(Medal)
from dataset_olympics
WHERE Team='India' AND Medal<>'NA'
GROUP BY year,Event
ORDER BY year asc; 
SELECT Event, COUNT(Medal)
FROM dataset_olympics
WHERE Season='Summer' AND Medal<>'NA'
GROUP BY Event
ORDER BY COUNT(Medal) DESC;

#3.to fetch the details of all the countries which have won most number of silver and bronze and atleast one gold medals

select Team,
       SUM(Silver) AS Total_Silver,
       SUM(Bronze) AS Total_Bronze,
       SUM(Gold) AS Total_Gold
FROM (
    SELECT *,
           CASE Medal WHEN 'Silver' THEN 1 ELSE 0 END AS Silver,
           CASE Medal WHEN 'Bronze' THEN 1 ELSE 0 END AS Bronze,
           CASE Medal WHEN 'Gold' THEN 1 ELSE 0 END AS Gold
    FROM dataset_olympics
) AS innerT
GROUP BY Team
having sum(Gold)>0
order by sum(Silver) desc;

#which player has maximum gold medals 

SELECT Name,
       SUM(Gold) AS Total_Gold
FROM (
    SELECT *,
           CASE Medal WHEN 'Gold' THEN 1 ELSE 0 END AS Gold
    FROM dataset_olympics
) AS innerT
GROUP BY Name
order by sum(Gold) desc;

# which sport has maximum events

select Sport,count(*)
from dataset_olympics
group by Sport
order by count(*) desc;

# in which year has maximum events 

select year,count(event)
from dataset_olympics
group by year
order by count(event) desc;


