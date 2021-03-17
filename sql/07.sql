/*
 * List all actors with Bacall Number 2;
 * That is, list all actors that have appeared in a film with an actor that has appeared in a film with 'RUSSEL BACALL',
 * but do not include actors that have Bacall Number < 2.
 */

select distinct first_name || ' ' || last_name as "Actor Name"
from (
select distinct film_id 
from film_actor
where actor_id in (
    select distinct actor_id
    from film_actor
    where film_id in (
        select film_id
        from film_actor
        where
            actor_id = 112
    )
)) t
inner join film_actor using (film_id)
inner join actor using (actor_id)
-- remove the people who have been in a film with bacall
where actor_id not in (
    select distinct actor_id
    from film_actor
    where film_id in (
        select film_id
        from film_actor
        where
            actor_id = 112
    )
) AND actor_id != 112
order by "Actor Name";


