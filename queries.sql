-- write your queries here

--Joining owners table with vehicles table
SELECT * FROM owners o 
FULL OUTER JOIN vehicles v 
ON o.id=v.owner_id;

--Query counting the number of cars for each owner
SELECT first_name, last_name, COUNT(owner_id)
FROM owners o JOIN vehicles v 
ON o.id=v.owner_id
GROUP BY (first_name, last_name) 
ORDER BY first_name;

--Querying owners with more than one vehicle and has an average price > 10,000--
SELECT first_name, last_name, ROUND(AVG(price)) AS average_price, COUNT(owner_id)
FROM owners o JOIN vehicles v
ON o.id=v.owner_id
GROUP BY (first_name, last_name)
HAVING COUNT(owner_id) > 1 AND ROUND(AVG(price)) > 10000
ORDER BY first_name DESC;