-- TBI ANALYSIS

-- what were the total injuries per age_group
SELECT 
	age_group,
    SUM(number) 'injuries'
FROM tbi_age
WHERE age_group != 'Total'
GROUP BY age_group
ORDER BY SUM(number) DESC;

-- fraction of the total
SELECT SUM(number) FROM tbi_age WHERE age_group != 'Total';

SELECT 
	age_group,
    SUM(number) 'injuries',
    (SELECT SUM(number) FROM tbi_age WHERE age_group != 'Total') 'Total',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group != 'Total') * 100 '% of Total'
FROM tbi_age
WHERE age_group != 'Total'
GROUP BY age_group;




-- what was the most common outcome from injuries
SELECT
	outcome_id,
    outcome_name,
    SUM(number) 'injuries'
FROM tbi_age t
JOIN outcome o ON t.outcome = o.outcome_id
WHERE age_group != 'Total'
GROUP BY outcome_id
ORDER BY SUM(number) DESC;

-- fraction of the total

SELECT
	outcome_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group != 'Total') * 100 '% of total'
FROM tbi_age t
JOIN outcome o ON t.outcome = o.outcome_id
WHERE age_group != 'Total'
GROUP BY outcome_id;






-- what were the most common mechanisms of injury
SELECT
	mechanism_name,
    SUM(number) 'number of tbi'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total'
GROUP BY t.mechanism_id
ORDER BY SUM(number) DESC;

-- fraction of the total
SELECT
	mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group != 'Total') * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total'
GROUP BY t.mechanism_id;




-- what was the age group distribution of patients who went to the emergency department?
SELECT 
	age_group,
    SUM(number) 'injuries'
FROM tbi_age
WHERE age_group != 'Total' AND outcome_id = 200
GROUP BY age_group
ORDER BY SUM(number) DESC;

-- fraction of total
SELECT SUM(number) FROM tbi_age WHERE outcome = 200 AND age_group != 'Total';

SELECT 
	age_group,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE outcome_id = 200 AND age_group != 'Total') * 100 '% of total'
FROM tbi_age
WHERE age_group != 'Total' AND outcome_id = 200
GROUP BY age_group;




-- what was the age group distribution of patients who got hospitalized?
SELECT 
	age_group,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE outcome_id = 201 AND age_group != 'Total') * 100 '% of total'
FROM tbi_age
WHERE age_group != 'Total' AND outcome_id = 201
GROUP BY age_group
ORDER BY SUM(number) DESC;

-- what was the age group distribution of patients who succumbed to injuries?
SELECT 
	age_group,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE outcome_id = 202 AND age_group != 'Total') * 100 '% of total'
FROM tbi_age
WHERE age_group != 'Total' AND outcome_id = 202
GROUP BY age_group
ORDER BY SUM(number) DESC;



-- what were the leading mechanisms of injury per age group
SELECT SUM(number) FROM tbi_age WHERE age_group = '0-4';

-- 0-4
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group = '0-4') * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group = '0-4'
GROUP BY t.mechanism_id, age_group
;
-- 5-14
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group = '5-14') * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group = '5-14'
GROUP BY t.mechanism_id, age_group;
-- 15-24
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group = '15-24') * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group = '15-24'
GROUP BY t.mechanism_id, age_group;
-- 25-34
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group = '25-34') * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group = '25-34'
GROUP BY t.mechanism_id, age_group;
-- 35-44
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group = '35-44') * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group = '35-44'
GROUP BY t.mechanism_id, age_group;
-- 45-54
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group = '45-54') * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group = '45-54'
GROUP BY t.mechanism_id, age_group;
-- 55-64
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group = '55-64') * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group = '55-64'
GROUP BY t.mechanism_id, age_group;
-- 65-74
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group = '65-74') * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group = '65-74'
GROUP BY t.mechanism_id, age_group;
-- 75+
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group = '75+') * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group = '75+'
GROUP BY t.mechanism_id, age_group;




-- which age groups were more likely to incur injuries from:
(SELECT SUM(number)  FROM tbi_age WHERE age_group != 'Total' AND injury_mechanism = 100);

-- mvc
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
    SUM(number) / (SELECT SUM(number)  FROM tbi_age WHERE age_group != 'Total' AND mechanism_id = 100) * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.mechanism_id = 100
GROUP BY age_group
ORDER BY SUM(number) DESC;

-- uf
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
	SUM(number) / (SELECT SUM(number)  FROM tbi_age WHERE age_group != 'Total' AND mechanism_id = 101) * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.mechanism_id = 101
GROUP BY age_group
ORDER BY SUM(number) DESC;

-- us
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
	SUM(number) / (SELECT SUM(number)  FROM tbi_age WHERE age_group != 'Total' AND mechanism_id = 102) * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.mechanism_id = 102
GROUP BY age_group
ORDER BY SUM(number) DESC;

-- oii
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
	SUM(number) / (SELECT SUM(number)  FROM tbi_age WHERE age_group != 'Total' AND mechanism_id = 103) * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.mechanism_id = 103
GROUP BY age_group
ORDER BY SUM(number) DESC;

-- assault
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
	SUM(number) / (SELECT SUM(number)  FROM tbi_age WHERE age_group != 'Total' AND mechanism_id = 104) * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.mechanism_id = 104
GROUP BY age_group
ORDER BY SUM(number) DESC;

-- other mechanisms
SELECT 
	age_group,
    mechanism_name,
    SUM(number) 'injuries',
	SUM(number) / (SELECT SUM(number)  FROM tbi_age WHERE age_group != 'Total' AND mechanism_id = 105) * 100 '% of total'
FROM tbi_age t
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.mechanism_id = 105
GROUP BY age_group
ORDER BY SUM(number) DESC;


-- what mechanisms were more likely to lead to an EDV?
SELECT 
	i.mechanism_name,
    o.outcome_name,
    SUM(t.number) injuries,
    SUM(t.number) / (SELECT SUM(number) FROM tbi_age WHERE age_group != 'Total' AND outcome_id = 200) * 100 '% of total'
FROM tbi_age t
JOIN outcome o ON t.outcome_id = o.outcome_id
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.outcome_id = 200
GROUP BY t.mechanism_id, t.outcome_id;

-- what mechanisms were more likely to lead to hospitalization?
SELECT 
	mechanism_name,
    outcome_name,
    SUM(number) injuries,
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group != 'Total' AND outcome_id = 201) * 100 '% of total'
FROM tbi_age t
JOIN outcome o ON t.outcome_id = o.outcome_id
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.outcome_id = 201
GROUP BY t.mechanism_id, t.outcome_id;

-- what mechanisms were more likely to lead to deaths?
SELECT 
	mechanism_name,
    outcome_name,
    SUM(number) injuries,
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group != 'Total' AND outcome_id = 202) * 100 '% of total'
FROM tbi_age t
JOIN outcome o ON t.outcome_id = o.outcome_id
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.outcome_id = 202
GROUP BY t.mechanism_id, t.outcome_id;


-- what were the outcomes per mechanism?
SELECT
	mechanism_name,
    outcome_name,
    SUM(number) injuries,
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group != 'Total' AND mechanism_id = 100) * 100 '% of total'
FROM tbi_age t
JOIN outcome o ON t.outcome_id = o.outcome_id
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.mechanism_id = 100
GROUP BY t.mechanism_id, t.outcome_id;

SELECT
	mechanism_name,
    outcome_name,
    SUM(number) injuries,
    SUM(number) / (SELECT SUM(number) FROM tbi_age WHERE age_group != 'Total' AND mechanism_id = 101) * 100 '% of total'
FROM tbi_age t
JOIN outcome o ON t.outcome_id = o.outcome_id
JOIN injury_mechanism i ON t.mechanism_id = i.mechanism_id
WHERE age_group != 'Total' AND t.mechanism_id = 101
GROUP BY t.mechanism_id, t.outcome_id;

-- YEAR
-- what were the total injuries per year
SELECT
	year,
    SUM(number) injuries
FROM year
GROUP BY year
ORDER BY SUM(number) DESC;


-- what mechanisms of injury were associated with most injuries per year?
-- total mvc injuries per year
SELECT
	year,
    mechanism_name,
    SUM(number) number
FROM year y
JOIN injury_mechanism i ON y.mechanism_id = i.mechanism_id
WHERE y.mechanism_id = 100
GROUP BY year
ORDER BY SUM(number) DESC;
-- mvc as a fraction of the total per year
SELECT
	year,
    SUM(CASE WHEN mechanism_id = 100 THEN number ELSE 0 END) mvc_injuries,
    SUM(number) total_injuries,
    SUM(CASE WHEN mechanism_id = 100 THEN number ELSE 0 END)/SUM(number)*100 'mvc attributed injuries'
FROM year
GROUP BY year;

-- totals of unintentional falls per year
SELECT
	year,
    mechanism_id,
    SUM(number) number
FROM year
WHERE mechanism_id = 101
GROUP BY year
ORDER BY SUM(number) DESC;
-- uf as a fraction of the total per year
SELECT
	year,
    SUM(CASE WHEN mechanism_id = 101 THEN number ELSE 0 END) uf_injuries,
    SUM(number) total_injuries,
    SUM(CASE WHEN mechanism_id = 101 THEN number ELSE 0 END)/SUM(number)*100 'uf attributed injuries'
FROM year
GROUP BY year;


-- totals of us per year
SELECT
	year,
    mechanism_id,
    SUM(number) number
FROM year
WHERE mechanism_id = 102
GROUP BY year
ORDER BY SUM(number) DESC;
-- us as a fraction of the total per year
SELECT
	year,
    SUM(CASE WHEN mechanism_id = 102 THEN number ELSE 0 END) us_injuries,
    SUM(number) total_injuries,
    SUM(CASE WHEN mechanism_id = 102 THEN number ELSE 0 END)/SUM(number)*100 'us attributed injuries'
FROM year
GROUP BY year;


-- totals of oii per year
SELECT
	year,
    mechanism_id,
    SUM(number) number
FROM year
WHERE mechanism_id = 103
GROUP BY year
ORDER BY SUM(number) DESC;
-- oii as a fraction of the total per year
SELECT
	year,
    SUM(CASE WHEN mechanism_id = 103 THEN number ELSE 0 END) oii_injuries,
    SUM(number) total_injuries,
    SUM(CASE WHEN mechanism_id = 103 THEN number ELSE 0 END)/SUM(number)*103 'oii attributed injuries'
FROM year
GROUP BY year;


-- totals of assault per year
SELECT
	year,
    mechanism_id,
    SUM(number) number
FROM year
WHERE mechanism_id = 104
GROUP BY year
ORDER BY SUM(number) DESC;
-- assault as a fraction of the total per year
SELECT
	year,
    SUM(CASE WHEN mechanism_id = 104 THEN number ELSE 0 END) assault_injuries,
    SUM(number) total_injuries,
    SUM(CASE WHEN mechanism_id = 104 THEN number ELSE 0 END)/SUM(number)*100 'assault attributed injuries'
FROM year
GROUP BY year;


-- totals of other per year
SELECT
	year,
    mechanism_id,
    SUM(number) number
FROM year
WHERE mechanism_id = 105
GROUP BY year
ORDER BY SUM(number) DESC;
-- other as a fraction of the total per year
SELECT
	year,
    SUM(CASE WHEN mechanism_id = 105 THEN number ELSE 0 END) other_injuries,
    SUM(number) total_injuries,
    SUM(CASE WHEN mechanism_id = 105 THEN number ELSE 0 END)/SUM(number)*100 'other attributed injuries'
FROM year
GROUP BY year;

-- what were the most common outcomes per year
-- totals of edv per year
SELECT
	year,
    outcome_name,
    SUM(number) number
FROM year y
JOIN outcome o ON y.outcome_id = o.outcome_id
WHERE y.outcome_id = 200
GROUP BY year
ORDER BY SUM(number) DESC;

-- totals of hosp per year
SELECT
	year,
    outcome_name,
    SUM(number) number
FROM year y
JOIN outcome o ON y.outcome_id = o.outcome_id
WHERE y.outcome_id = 201
GROUP BY year
ORDER BY SUM(number) DESC;

-- totals of deaths per year
SELECT
	year,
    outcome_name,
    SUM(number) number
FROM year y
JOIN outcome o ON y.outcome_id = o.outcome_id
WHERE y.outcome_id = 202
GROUP BY year
ORDER BY SUM(number) DESC;


-- what were the outcomes as a fraction of the total injuries per year
-- edv
SELECT
	year,
    SUM(CASE WHEN outcome_id = 200 THEN number ELSE 0 END) 'e.d_visits',
    SUM(number) total_injuries,
    SUM(CASE WHEN outcome_id = 200 THEN number ELSE 0 END)/SUM(number)*100 'edv percentage'
FROM year
GROUP BY year;

-- hospitalization
SELECT
	year,
    SUM(CASE WHEN outcome_id = 201 THEN number ELSE 0 END) 'hospitalizations',
    SUM(number) total_injuries,
    SUM(CASE WHEN outcome_id = 201 THEN number ELSE 0 END)/SUM(number)*100 'hosp percentage'
FROM year
GROUP BY year;

-- deaths
SELECT
	year,
    SUM(CASE WHEN outcome_id = 202 THEN number ELSE 0 END) 'deaths',
    SUM(number) total_injuries,
    SUM(CASE WHEN outcome_id = 202 THEN number ELSE 0 END)/SUM(number)*100 'death percentage'
FROM year
GROUP BY year;
----------------------------------------------------------------------------------------------------- END
