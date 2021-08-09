CREATE TABLE docs03 (id SERIAL, doc TEXT, PRIMARY KEY(id));

CREATE INDEX array03 ON docs03 USING gin(string_to_array(lower(doc), ' ') array_ops);

INSERT INTO docs03 (doc) VALUES
('word to was used sixteen times in the first three paragraphs of this'),
('This very fact that computers are good at things that humans are not is'),
('why you need to become skilled at talking computer language Once you'),
('learn this new language you can delegate mundane tasks to your partner'),
('uniquely suited for You bring creativity intuition and inventiveness'),
('While this book is not intended for professional programmers'),
('professional programming can be a very rewarding job both financially'),
('and personally Building useful elegant and clever programs for others'),
('to use is a very creative activity Your computer or Personal Digital'),
('Assistant PDA usually contains many different programs from many');


--- generate more rows to ignite indexing

INSERT INTO docs03 (doc) SELECT 'Neon ' || generate_series(10000,20000);

