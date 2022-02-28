SELECT * FROM t_standings;
SELECT * FROM t_all;
SELECT * FROM t_club ;

----------한번도 출전하지 않은 선수는 고려 하지 않았습니다.----------
DELETE FROM t_all  WHERE Appearances = 0;


----------모든 선수 스탯이 들어있는 테이블은 4개로 복사해서 필요없는 필드를 삭제했습니다.----------
ALTER TABLE t_fw
	DROP COLUMN Clean sheets,
	DROP COLUMN Tackle success %,
	DROP COLUMN Blocked shots,
	DROP COLUMN Interceptions,
	DROP COLUMN Clearances,
	DROP COLUMN Duels won,
	DROP COLUMN Cross accuracy %,
	DROP COLUMN Accurate long balls,
	DROP COLUMN Saves;


----------포지션별로 테이블을 나눴습니다.----------
DELETE FROM t_fw WHERE POSITION != 'Forward';

ALTER TABLE t_mid 
	DROP COLUMN Clean sheets,
	DROP COLUMN Tackle success %,
	DROP COLUMN Blocked shots,
	DROP COLUMN Saves;

DELETE FROM t_mid WHERE POSITION != 'Midfielder';

ALTER TABLE t_def
	DROP COLUMN Saves;

DELETE FROM t_def WHERE POSITION != 'Defender';

ALTER TABLE t_gk
	DROP COLUMN Tackle success %,
	DROP COLUMN Blocked shots,
	DROP COLUMN Interceptions,
	DROP COLUMN Clearances,
	DROP COLUMN Duels won,
	DROP COLUMN Assists,
	DROP COLUMN Passes,
	DROP COLUMN Passes per match,
	DROP COLUMN Big Chances Created,
	DROP COLUMN Crosses,     
	DROP COLUMN Cross accuracy %,
	DROP COLUMN Goals,      
	DROP COLUMN Goals per match;
      
DELETE FROM t_gk WHERE POSITION != 'Goalkeeper';


----------기타----------
SELECT * FROM t_fw ;
SELECT * FROM t_all WHERE POSITION = 'Forward';
SELECT * FROM t_all a, t_club c WHERE a.name = c.name;
SELECT count(*) FROM t_club c, t_standings s WHERE c.club = s.club ;
SELECT name FROM t_club ORDER BY name ASC;
SELECT count(*) FROM t_all ORDER BY name ASC;
SELECT name FROM t_all WHERE appearances > 0;
SELECT c.name FROM t_club c, t_all a WHERE c.name=a.name ORDER BY c.name ASC;
SELECT name FROM t_club ORDER BY name ASC;
SELECT count(*) FROM t_all ORDER BY name ASC;
SELECT count(*) FROM t_club ORDER BY name ASC;
SELECT name FROM t_all WHERE Column1 = 10;
SELECT name, Column1 FROM t_all WHERE appearances > 0 ORDER BY name ASC;
SELECT a.name, a.Column1 FROM t_club c, t_all a WHERE c.name=a.name ORDER BY a.name ASC;
SELECT name, Column1  FROM t_all
WHERE name NOT IN
(SELECT name FROM t_club) AND Appearances > 0;

SHOW COLUMNS FROM t_gk;
SHOW COLUMNS FROM t_all;

