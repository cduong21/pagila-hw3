/*
 * Management is planning on purchasing new inventory.
 * Films with special features cost more to purchase than films without special features,
 * and so management wants to know if the addition of special features impacts revenue from movies.
 *
 * Write a query that for each special_feature, calculates the total profit of all movies rented with that special feature.
 *
 * HINT:
 * Start with the query you created in pagila-hw1 problem 16, but add the special_features column to the output.
 * Use this query as a subquery in a select statement similar to answer to the previous problem.
 */

select unnest as special_feature, 
sum(profit) as profit
from (
SELECT
    title,
    sum(amount) as profit,
    unnest(special_features)
FROM payment
INNER JOIN rental USING (rental_id)
INNER JOIN inventory USING (inventory_id)
INNER JOIN film USING (film_id)
group by title, special_features
) as t
group by unnest 
order by unnest;


