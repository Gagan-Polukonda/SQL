SELECT 
    MAX(CASE WHEN Occupation = 'Doctor' THEN Name ELSE NULL END) AS Doctor,
    MAX(CASE WHEN Occupation = 'Professor' THEN Name ELSE NULL END) AS Professor,
    MAX(CASE WHEN Occupation = 'Singer' THEN Name ELSE NULL END) AS Singer,
    MAX(CASE WHEN Occupation = 'Actor' THEN Name ELSE NULL END) AS Actor
FROM (
    SELECT 
        Name,
        Occupation,
        Rank() OVER (PARTITION BY Occupation ORDER BY Name) AS Stage
    FROM OCCUPATIONS
) AS Individuals
GROUP BY Stage
ORDER BY Stage;
