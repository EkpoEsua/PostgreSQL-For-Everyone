INSERT into invert01 (doc_id, keyword)
select distinct id, lower(unnest) as keyword
from docs01, unnest(string_to_array(docs01.doc, ' '))
order by id;
