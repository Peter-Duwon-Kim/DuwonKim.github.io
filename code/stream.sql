SELECT * FROM t_net ;
SELECT * FROM t_dis ;


----------넷플릭스 테이블에서 필요없는 필드 삭제----------
ALTER TABLE t_net
	DROP COLUMN num,
	DROP COLUMN NO_of_TV_Shows,
	DROP COLUMN NO_of_Movies
	DROP COLUMN Cost_Per_Month_Standard,
	DROP COLUMN Cost_Per_Month_Premium ;


----------테이블 이름 변경----------
ALTER TABLE t_net 
	RENAME COLUMN Library_Size TO Titles,
	RENAME COLUMN Basic TO Price;
	
ALTER TABLE t_net
ADD COLUMN price_per_title INT AFTER Price;

ALTER TABLE t_dis
ADD COLUMN price_per_title INT AFTER Price;


----------기타----------
SELECT * FROM t_tt ;
SELECT * FROM t_pp ;
SELECT Country  FROM t_pp
WHERE Country NOT IN
(SELECT Country FROM t_tt) ;

SELECT * FROM t_dis GROUP BY Country;
DELETE FROM t_dis  WHERE isnull(Price) ;

SELECT Country, Titles, Price FROM t_net 
WHERE Country IN (SELECT Country FROM t_dis);