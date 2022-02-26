/****** HackerRank Practice 
Top Competitors: print the hacker_id and name of hackers who achieved full scores for more than one challenge. 
Order your output in descending order by the total number of challenges in which the hacker earned a full score. 
If more than one hacker received full scores in same number of challenges, then sort them by ascending hacker_id. ******/

-- Recreating the tables used in this exercise:

--INSERT INTO dbo.Hackers VALUES 
--						  (5580, 'Rose')
--						, (8439, 'Angela')
--						, (27205, 'Frank')
--						, (52243, 'Patrick')
--						, (82348, 'Lisa')
--						, (57645, 'Kimberly')
--						, (77726, 'Bonnie')
--						, (83082, 'Michael')
--						, (86870, 'Todd')
--						, (90411, 'Joe')


--INSERT INTO dbo.Difficulty VALUES
--							  (1, 20)
--							, (2, 30)
--							, (3, 40)
--							, (4, 60)
--							, (5, 80)
--							, (6, 100)
--							, (7, 120)

--INSERT INTO dbo.Challenges VALUES
--							  (4810, 77726, 4)
--							, (21089, 27205, 1)
--							, (36566, 5580, 7)
--							, (66730, 52243, 6)
--							, (71055, 52243, 2)

--INSERT INTO dbo.Submissions VALUES
--							  (38628, 77726, 36566, 30)
--							, (65300, 77726, 21089, 10)
--							, (40326, 52243, 36566, 77)
--							, (8941, 27205, 4810, 4)
--							, (83554, 77726, 66730, 30)
--							, (43353, 52243, 66730, 0)
--							, (55385, 52348, 71055, 20)
--							, (39784, 27205, 71055, 23)
--							, (94613, 86870, 71055, 30)
--							, (45788, 52348, 36566, 0)
--							, (93058, 86870, 36566, 30)
--							, (7344, 8439, 66730, 92)
--							, (2721, 8439, 4810, 36)
--							, (523, 5580, 71055, 4)
--							, (49105, 52348, 66730, 0)
--							, (55877, 57645, 66730, 80)
--							, (38355, 27205, 66730, 35)
--							, (3924, 8439, 36566, 80)
--							, (97397, 90411, 66730, 100)
--							, (84162, 83082, 4810, 40)
--							, (97431, 90411, 71055, 30);

-- The actual query:
WITH cte AS
		(SELECT s.submission_id, s.hacker_id, s.challenge_id, s.score, CAST(d.score AS FLOAT) AS score_dl, CAST(s.score AS FLOAT) / d.score AS full_scores, h.[name] 
		FROM Submissions AS s
		LEFT JOIN
		Challenges AS c
		ON s.challenge_id = c.challenge_id
		LEFT JOIN Difficulty AS d
		ON c.difficulty_level = d.difficulty_level
		LEFT JOIN Hackers AS h
		ON s.hacker_id = h.hacker_id
		WHERE s.score <> 0 
		AND CAST(s.score AS FLOAT) / d.score >= 1) 
SELECT CONCAT(hacker_id, '  ', [name]) AS [Hackers' ID and Name] 
FROM cte
GROUP BY hacker_id, [name]
ORDER BY SUM(full_scores) DESC;