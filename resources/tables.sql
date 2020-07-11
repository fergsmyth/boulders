create table crag (
	id SERIAL PRIMARY KEY,
	name text NOT NULL,
	area text NOT NULL,
    county text NOT NULL,
	description text
);

CREATE INDEX ix_crag_index ON crag USING btree (id);

create table boulder (
	id SERIAL PRIMARY KEY,
	crag_id INTEGER REFERENCES crag(id)
	name text NOT NULL,
	area text NOT NULL,
    county text NOT NULL,
	description text
);

CREATE INDEX ix_boulder_index ON boulder USING btree (id);

create table grade (
    id SERIAL PRIMARY KEY,
    font text NULL,
    hueco text NULL
);

CREATE INDEX ix_grade_index ON grade USING btree (id);

CREATE TABLE problem (
	id SERIAL PRIMARY KEY,
	name text NULL,
	grade text NULL,
	county text NULL,
	area text NULL,
	boulder_sector text NULL,
	description text NULL,
	sender text NULL,
	sent_date text NULL,
    crag_id INTEGER
);

CREATE INDEX ix_problem_index ON problem USING btree (id);