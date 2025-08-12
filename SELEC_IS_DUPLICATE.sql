SELECT code, COUNT(*) as Duplicate
FROM Partners
GROUP BY Code
HAVING Count(*) >1



