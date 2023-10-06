-- calculating Descriptive Analysis for the Film table

SELECT MIN(rental_duration) AS min_rental_duration,
       MAX(rental_duration) AS max_rental_duration,
       AVG(rental_duration) AS average_rental_duration,
       COUNT(rental_duration) AS count_rental_duration_values,
       MIN(rental_rate) AS min_rental_rate,
       MAX(rental_rate) AS max_rental_rate,
       COUNT(rental_rate) AS count_rental_rate_values,
       MIN(length) AS min_movie_length,
       MAX(length) AS max_movie_length,
       AVG(length) AS average_movie_length,
       COUNT(length) AS count_movie_length_values,
       MIN(replacement_cost) AS min_replacement_cost,
       MAX(replacement_cost) AS max_replacement_cost,
       AVG(replacement_cost) AS average_replacement_cost,
       COUNT(replacement_cost) AS count_replacement_cost_values,
       COUNT(*) AS count_rows
FROM film;

SELECT MODE() WITHIN GROUP (ORDER BY title) AS title_mode_value,
       MODE() WITHIN GROUP (ORDER BY description) AS description_mode_value,
       MODE() WITHIN GROUP (ORDER BY release_year) AS release_year_mode_value,
       MODE() WITHIN GROUP (ORDER BY language_id) AS language_id_mode_value,
       MODE() WITHIN GROUP (ORDER BY rating) AS rating_mode_value,
       MODE() WITHIN GROUP (ORDER BY last_update) AS last_update_mode_value,
       MODE() WITHIN GROUP (ORDER BY fulltext) AS fulltext_mode_value
FROM film;


-- calculating Descriptive Analysis for the Customer table

SELECT MODE() WITHIN GROUP (ORDER BY store_id) AS store_id_mode_value,
       MODE() WITHIN GROUP (ORDER BY first_name) AS first_name_mode_value,
       MODE() WITHIN GROUP (ORDER BY last_name) AS last_name_mode_value,
       MODE() WITHIN GROUP (ORDER BY email) AS email_mode_value,
       MODE() WITHIN GROUP (ORDER BY address_id) AS address_id_mode_value,
       MODE() WITHIN GROUP (ORDER BY create_date) AS create_date_mode_value,
       MODE() WITHIN GROUP (ORDER BY last_update) AS last_update_mode_value,
       MODE() WITHIN GROUP (ORDER BY active) AS active_mode_value
FROM customer;

    