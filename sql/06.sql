/*
 * This question and the next one are inspired by the Bacon Number:
 * https://en.wikipedia.org/wiki/Six_Degrees_of_Kevin_Bacon#Bacon_numbers
 *
 * List all actors with Bacall Number 1;
 * That is, list all actors that have appeared in a film with 'RUSSEL BACALL'.
 * Do not list 'RUSSEL BACALL', since he has a Bacall Number of 0.
 */

/*
select distinct 
    --a2.actor_id
    a2.first_name || ' ' || a2.last_name as "Actor Name"
from actor a1
join film_actor fa1 ON a1.actor_id = fa1.actor_id
join film_actor fa2 on fa1.film_id = fa2.film_id
join actor a2 on fa2.actor_id = a2.actor_id
where 
    a1.actor_id = 112 AND
    a2.actor_id != 112
order by "Actor Name";
*/ 

select first_name || ' ' || last_name AS "Actor Name"
from
(
select distinct actor_id 
from film_actor
where film_id in (
    select film_id 
    from film_actor
    where 
        actor_id = 112
    )
) t
inner join actor using (actor_id)
where
    actor_id != 112
order by "Actor Name";
