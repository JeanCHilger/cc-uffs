---- 4)
SELECT f.titulo, p.nome FROM filme f JOIN pessoa p on f.codd=p.codp;

---- 5)
select f.titulo from filme f where f.codd=101;

---- 6)
select p.nome FROM pessoa p JOIN elenco e ON p.codp=e.codp WHERE e.oscar='Y';

---- 7)
SELECT f.titulo, f.anol, f.dur, p.nome FROM filme f JOIN elenco e ON e.codf=f.codf 
                                                    JOIN pessoa p ON p.codp=e.codp;
-- natural join
SELECT f.titulo, f.anol, f.dur, p.nome FROM filme f NATURAL JOIN elenco e NATURAL 
                                                            JOIN pessoa p;

---- 8)
SELECT f.titulo FROM filme f JOIN avaliacao a ON f.codf=a.codf WHERE a.nestrelas=5;

---- 9)
SELECT f.titulo FROM filme f JOIN elenco e ON f.codf=e.codf 
                             JOIN pessoa p ON p.codp=e.codp WHERE p.nome='Steven';

---- 10)
SELECT p.nome, f.titulo FROM elenco e NATURAL JOIN pessoa p
                                      JOIN filme f ON e.codf=f.codf;

---- 11)
SELECT p.nome FROM pessoa p WHERE p.nome NOT IN (SELECT p.nome FROM elenco e NATURAL JOIN pessoa p);

---- 12)
SELECT * FROM filme f LEFT JOIN avaliacao a ON f.codf=a.codf WHERE a.codf IS NULL;

---- 13)
SELECT f.titulo, f.dur FROM filme f
                       WHERE f.anol BETWEEN 1960 AND 1969;

---- 14)
SELECT p.nome FROM pessoa p JOIN elenco e ON e.codp=p.codp
              WHERE e.papel = 'figur';

---- 15)
SELECT count(a.coment) FROM avaliacao a WHERE a.email = 'cinefilo@gmail.com';

---- 16)
SELECT p.paisn, count(p.nome) FROM pessoa p
                              GROUP BY p.paisn;

---- 17)
				   -- =
SELECT * FROM pessoa p WHERE p.dtnasc IN (SELECT min(p.dtnasc) FROM pessoa p);
    -- ou
--SELECT * FROM pessoa p ORDER BY p.dtnasc LIMIT 1; -- gambiarra d+

---- 18)
SELECT * FROM filme f WHERE f.dur IN (SELECT min(f.dur) FROM filme f);

---- 19)
SELECT f.titulo, count(p) FROM filme f JOIN elenco e ON f.codf=e.codf
                                       JOIN pessoa p ON e.codp=p.codp
                                       GROUP BY f.titulo;

---- 20)
SELECT f.titulo, avg(a.nestrelas) FROM filme f NATURAL JOIN avaliacao a
                                  GROUP BY f.titulo;

---- desafio

