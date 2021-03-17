/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */
select distinct 
    "Actor Name"
from (
select 
    first_name || ' ' || last_name as "Actor Name"
from film 
inner join film_actor using (film_id)
inner join actor using (actor_id)
) as t 
order by "Actor Name";
