INSERT INTO bigtext (content) SELECT 'This is record number ' || generate_series(100000,199999) || 
    'of quite a few text records.';