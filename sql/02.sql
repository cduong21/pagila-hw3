/*
 * Count the number of movies that contain each type of special feature.
 */

select unnest as special_features, 
    count(unnest) as count
from (
select 
    title, 
    unnest(special_features)
from film) as t 
group by unnest
order by unnest;

