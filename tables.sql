create table crag (
	index SERIAL PRIMARY KEY,
	name text,
	area text,
    county text,
	description text
);

CREATE INDEX ix_crag_index ON crag USING btree (index);

CREATE TABLE problem (
	index SERIAL PRIMARY KEY,
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

CREATE INDEX ix_problem_index ON problem USING btree (index);

insert into crag (county, area, name)
select p.county, p.area, p.boulder_sector from problem p group by p.county, p.area, p.boulder_sector;

update problem p set p.crag_id = c.index from crag c where c.county = p.county and c.area = p.area and c.name = p.boulder_sector;