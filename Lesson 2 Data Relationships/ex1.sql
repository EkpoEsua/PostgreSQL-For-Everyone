DROP TABLE make CASCADE;

CREATE TABLE make(
    id SERIAL,
    name VARCHAR,
    PRIMARY KEY(id)
);

DROP TABLE model;

CREATE TABLE model(
    id SERIAL,
    name VARCHAR(128),
    make_id INTEGER,
    CONSTRAINT foreign_key FOREIGN KEY (make_id) REFERENCES make(id) ON DELETE CASCADE,
    PRIMARY KEY(id)
);



INSERT INTO make (name) VALUES ('Acura');
INSERT INTO make (name) VALUES ('Ford');

INSERT INTO model (name, make_id) VALUES ('MDX AWD', 1);
INSERT INTO model (name, make_id) VALUES ('MDX AWD A-SPEC', 1);
INSERT INTO model (name, make_id) VALUES ('MDX FWD', 1);

INSERT INTO model (name, make_id) VALUES ('F150 5.0L 4WD FFV GVWR>7599 LBS PAYLOAD PACKAGE', 2);
INSERT INTO model (name, make_id) VALUES ('F150 5.0L 4WD GVWR>7599 LBS', 2);

SELECT make.name, model.name
    FROM model
    JOIN make ON model.make_id = make.id
    ORDER BY make.name LIMIT 5;