update short_span_problems set grade = replace(grade, '?', '');
delete from short_span_problems where name = '-' and area = '-' and boulder_sector = '-';

alter table short_span_problems rename column sent_date to sent_date_str;
alter table short_span_problems add column sent_date date;

insert into crag (county, area, name)
select p.county, p.area, p.boulder_sector from problem p group by p.county, p.area, p.boulder_sector;

update problem p set p.crag_id = c.index from crag c where c.county = p.county and c.area = p.area and c.name = p.boulder_sector;

insert into grade_entry (font, hueco)
values ('4','v0'),
('5','v1'),
('5+','v2'),
('6a','v3'),
('6a+','v3'),
('6b','v4'),
('6b+','v4'),
('6c','v4'),
('6c+','v5'),
('7a','v6'),
('7a+','v7'),
('7b','v8'),
('7b+','v8'),
('7c','v9'),
('7c+','v10'),
('8a','v11'),
('8a+','v12'),
('8b','v13'),
('8b+','v14'),
('8c','v15'),
('8c+','v16'),
('9a','v17')