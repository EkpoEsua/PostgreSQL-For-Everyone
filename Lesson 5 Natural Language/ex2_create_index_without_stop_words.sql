INSERT into invert02 (doc_id, keyword)
select distinct id, lower(unnest) as keyword
from docs02, unnest(string_to_array(docs02.doc, ' '))
where unnest not in (SELECT word from stop_words)
order by id;
 
delete from invert02 where keyword in (select word from stop_words);
