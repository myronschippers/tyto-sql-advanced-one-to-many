
-- ONE - TO - ONE
CREATE TABLE "person" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL
);

CREATE TABLE "social_security" (
	"id" SERIAL PRIMARY KEY,
	"number" INT NOT NULL,
	"person_id" INT REFERNCES "person"
);

INSERT INTO "person" ("name")
VALUES ('Dane'),
	('Josh'),
	('Travis'),
	('Allen');
	
INSERT INTO "social_security" ("number", "person_id")
VALUES (1234, 2),
	(2345, 3),
	(3456, 4),
	(4567, 1);
	
SELECT * FROM "person";

SELECT * FROM "social_security";
	
SELECT * FROM "person"
JOIN "social_security" ON "person"."id" = "social_security"."person_id";
	
SELECT * FROM "person"
JOIN "social_security" ON "person"."id" = "social_security"."person_id"
WHERE "person"."id" = 1;


-- ONE-TO-MANY

CREATE TABLE "cohorts" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(20) NOT NULL,
	"start_date" DATE
);

CREATE TABLE "students" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(80) NOT NULL,
	"cohorts_id" INT REFERENCES "cohorts"
);

INSERT INTO "cohorts" ("name", "start_date")
VALUES ('Tyto', '11/11/2019'),
	('Isurus', '07/11/2019');
	
INSERT INTO "students" ("name", "cohorts_id")
VALUES ('Dane', 1),
	('Luke Ma', 1),
	('Travis', 1),
	('Allen', 1),
	('Josh', 1),
	('Lucas', 1),
	('Luke', 2),
	('Shanice', 2),
	('Ellen', 2),
	('James', 2),
	('Macy', 2);
	
	
SELECT * FROM "students"
JOIN "cohorts" ON "students"."cohorts_id" = "cohorts"."id";
	
SELECT * FROM "students"
JOIN "cohorts" ON "students"."cohorts_id" = "cohorts"."id"
WHERE "cohorts"."name" = 'Tyto';
	
-- Join and Group
SELECT "cohorts"."name", count(*) FROM "students"
JOIN "cohorts" ON "students"."cohorts_id" = "cohorts"."id"
GROUP BY "cohorts"."name";

-- Join and Group I don't want count as label
SELECT "cohorts"."name" as "cohort_name", count(*) as "number_of_students" FROM "students"
JOIN "cohorts" ON "students"."cohorts_id" = "cohorts"."id"
GROUP BY "cohorts"."name";

-- SORTING
SELECT * FROM "students"
JOIN "cohorts" ON "cohorts"."id" = "students"."cohorts_id"
WHERE "cohorts"."name" = 'Tyto'
ORDER BY "students"."name" ASC;





