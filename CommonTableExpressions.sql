-- Finding the average amount paid by the top 5 customers using CTE

WITH top_5_customers_cte (customer_id, first_name,last_name, country,city,total_amount_paid) AS
     (SELECT B.customer_id, 
             B.first_name, 
             B.last_name,
             E.country,
             D.city,
             SUM(A.amount) AS total_amount_paid
     FROM payment A
     INNER JOIN customer B ON A.customer_id = B.customer_id
     INNER JOIN address C ON B.address_id = C.address_id
     INNER JOIN city D ON C.city_id = D.city_id
     INNER JOIN country E ON D.country_id = E.country_id
     WHERE city IN('Aurora','Acua','Citrus Heights','Iwaki','Ambattur','Shanwei','So Leopoldo','Teboksary','Tianjin','Cianjur') 
     GROUP BY B.customer_id, country,city
ORDER BY SUM(A.amount) DESC
LIMIT 5)
SELECT AVG(total_amount_paid) AS average 
FROM top_5_customers_cte;


-- Finding out where the top 5 customers are based in

WITH top_5_customers_cte (customer_id, first_name,last_name, country,city,total_amount_paid) AS
     (SELECT B.customer_id, 
             B.first_name, 
             B.last_name,
             E.country,
             D.city,
             SUM(A.amount) AS total_amount_paid
     FROM payment A
     INNER JOIN customer B ON A.customer_id = B.customer_id
     INNER JOIN address C ON B.address_id = C.address_id
     INNER JOIN city D ON C.city_id = D.city_id
     INNER JOIN country E ON D.country_id = E.country_id
     WHERE city IN('Aurora','Acua','Citrus Heights','Iwaki','Ambattur','Shanwei','So Leopoldo','Teboksary','Tianjin','Cianjur') GROUP BY B.customer_id, country,city
     ORDER BY SUM(A.amount) DESC
     LIMIT 5) 
SELECT E.country,
       COUNT(B.customer_id) AS all_customer_count,
       COUNT(top_5_customers_cte.customer_id) AS top_customer_count 
FROM customer B
INNER JOIN address C ON B.address_id = C.address_id
INNER JOIN city D ON C.city_id = D.city_id
INNER JOIN country E ON D.country_id = E.country_id
LEFT JOIN top_5_customers_cte ON top_5_customers_cte.customer_id = B.customer_id 
GROUP BY E.country
HAVING COUNT (top_5_customers_cte.customer_id) > 0;

