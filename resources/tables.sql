create table crag (
	id SERIAL PRIMARY KEY,
	name text,
	area text,
    county text,
	description text
);

CREATE INDEX ix_crag_index ON crag USING btree (id);

create table grade_entry (
    id SERIAL PRIMARY KEY,
    font text NULL,
    hueco text NULL
);

CREATE INDEX ix_grade_entry_index ON grade_entry USING btree (id);

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