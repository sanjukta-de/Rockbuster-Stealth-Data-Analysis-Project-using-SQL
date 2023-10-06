-- Finding the average amount paid by the zop 5 customers using Subquery

SELECT AVG(total_amount_paid) AS average
FROM (SELECT B.customer_id, 
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
      GROUP BY B.customer_id, country, city
      ORDER BY SUM(A.amount) 
      DESC LIMIT 5) AS total_amount_paid;


-- Finding out where the top 5 customers are based in

SELECT D.country,
       COUNT (A.customer_id) AS all_customer_count, 
       COUNT (top_5_customers) AS top_customer_count
FROM customer A
INNER JOIN address B ON A.address_id = B.address_id
INNER JOIN city C ON B.city_id = C.city_id
INNER JOIN country D ON C.country_id = D.country_id
LEFT JOIN (SELECT A.customer_id, 
                  A.first_name, 
                  A.last_name,
                  D.country,
                  C.city,
                  SUM(E.amount) AS total_amount_paid
           FROM customer A
           INNER JOIN address B ON A.address_id = B.address_id INNER JOIN city C ON B.city_id = C.city_id
           INNER JOIN country D ON C.country_id = D.country_id
           INNER JOIN payment E ON A.customer_id = E.customer_id
           WHERE city IN('Aurora','Acua','Citrus Heights','Iwaki','Ambattur','Shanwei','So Leopoldo','Teboksary','Tianjin','Cianjur') 
           GROUP BY A.customer_id, country, city
           ORDER BY SUM(E.amount) DESC
           LIMIT 5) AS top_5_customers
ON A.customer_id = top_5_customers.customer_id 
GROUP BY D.country
HAVING COUNT(top_5_customers) > 0;