1.	Mennyit költöttek pizzára az egyes vevõk?
SELECT vevo.vnev, SUM(pizza.par * tetel.db) FROM vevo
INNER JOIN rendeles ON rendeles.vazon = vevo.vazon  
INNER JOIN tetel ON rendeles.razon = tetel.razon 
INNER JOIN pizza ON pizza.pazon = tetel.pazon 
GROUP BY vevo.vnev;

Hapci	8300
Kuka 	18000
Morgó 	12000
Szende	12300
Szundi	10000
Tudor	8100
Vidor	10700
2.	Mennyit vettek az egyes vevõk a különbözõ pizzákból?
SELECT vevo.vnev, pizza.pnev, SUM(tetel.db) FROM vevo
INNER JOIN rendeles ON rendeles.vazon = vevo.vazon  
INNER JOIN tetel ON rendeles.razon = tetel.razon 
INNER JOIN pizza ON pizza.pazon = tetel.pazon 
GROUP BY vevo.vnev, pizza.pnev;

Hapci	Karib tenger kalózai	1
Hapci	Macskajaj				3
Hapci	Son.go.ku				3
Kuka	Húsimádó				5

3.	Ki hány pizzát szállított házhoz az egyes napokon?
SELECT futar.fnev, rendeles.datum, SUM(tetel.db) FROM futar
INNER JOIN rendeles ON rendeles.fazon = futar.fazon 
INNER JOIN tetel ON rendeles.razon = tetel.razon  
GROUP BY futar.fnev, rendeles.datum;

4.	Ki hány pizzát rendelt az egyes napokon?
SELECT vevo.vnev, rendeles.datum, SUM(tetel.db) FROM vevo
INNER JOIN rendeles ON vevo.vazon = rendeles.vazon 
INNER JOIN tetel ON rendeles.razon = tetel.razon  
GROUP BY vevo.vnev, rendeles.datum;

5.	Mennyi volt a bevétel az egyes napokon?
SELECT rendeles.datum, SUM(pizza.par * tetel.db) FROM rendeles  
INNER JOIN tetel ON rendeles.razon = tetel.razon 
INNER JOIN pizza ON pizza.pazon = tetel.pazon 
GROUP BY rendeles.datum;

2017-10-01	7800
2017-10-02	10300
2017-10-03	3700
2017-10-04	14100
2017-10-05	6700
2017-10-06	18300
2017-10-07	14300
2017-10-08	4200

6.	Hány pizza fogyott naponta?
SELECT rendeles.datum, SUM(tetel.db) FROM vevo
INNER JOIN rendeles ON vevo.vazon = rendeles.vazon 
INNER JOIN tetel ON rendeles.razon = tetel.razon  
GROUP BY rendeles.datum;

7.	Átlagosan hány darab pizzát rendeltek naponta?
SELECT rendeles.datum, AVG(tetel.db) FROM vevo
INNER JOIN rendeles ON vevo.vazon = rendeles.vazon 
INNER JOIN tetel ON rendeles.razon = tetel.razon  
GROUP BY rendeles.datum;


2017-10-01	2.0000
2017-10-02	2.0000

8.	Hány pizzát rendeltek átlagosan egyszerre az egyes vevõk?
SELECT vevo.vnev, AVG(tetel.db) FROM vevo
INNER JOIN rendeles ON vevo.vazon = rendeles.vazon 
INNER JOIN tetel ON rendeles.razon = tetel.razon  
GROUP BY vevo.vnev;

Hapci	1.7500
Kuka	1.4000

9.	Hány alkalommal szállítottak házhoz az egyes futárok?
SELECT futar.fnev, COUNT(rendeles.fazon) FROM futar
INNER JOIN rendeles ON futar.fazon = rendeles.fazon
GROUP BY futar.fnev;

Gömbvillám		3
Gyalogkakukk	9

10.	A fogyasztás alapján mi a pizzák népszerûségi sorrendje?
SELECT pizza.pnev, SUM(tetel.db) FROM pizza
INNER JOIN tetel ON tetel.pazon = pizza.pazon
GROUP BY pizza.pazon ORDER BY 2 DESC;


11.	A rendelések értéke alapján ki a 3 legjobb vevõ?
SELECT vevo.vnev, SUM(tetel.db * pizza.par) FROM vevo
INNER JOIN rendeles ON rendeles.vazon = vevo.vazon
INNER JOIN tetel ON tetel.razon = rendeles.razon
INNER JOIN pizza ON tetel.pazon = pizza.pazon
GROUP BY vevo.vnev ORDER BY 2 DESC;

Kuka 	18000
Szende 	12300
Morgó	12000

12.	Melyik a legdrágább pizza?
SELECT pizza.pnev FROM pizza ORDER BY pizza.par DESC LIMIT 1;


13.	Ki szállította házhoz a legtöbb pizzát?
SELECT futar.fnev FROM futar
INNER JOIN rendeles ON futar.fazon = rendeles.fazon
GROUP BY rendeles.fazon
ORDER BY COUNT(rendeles.razon) desc LIMIT 1;

Gyalogkakukk

14.	Ki ette a legtöbb pizzát?
SELECT vevo.vnev FROM vevo
INNER JOIN rendeles ON vevo.vazon = rendeles.vazon
INNER JOIN tetel ON tetel.razon = rendeles.razon
GROUP BY vevo.vnev
ORDER BY COUNT(rendeles.razon) desc LIMIT 1;

Kuka (14)

15.	Melyik nap fogyott a legtöbb pizza?
SELECT rendeles.datum, SUM(tetel.db) FROM tetel
INNER JOIN rendeles ON rendeles.razon = tetel.razon  
GROUP BY rendeles.datum ORDER BY 2 DESC LIMIT 1;

2017-10-06 (14)

16.	Melyik nap fogyott a legtöbb Húsimádó pizza?
SELECT rendeles.datum, SUM(tetel.db) FROM tetel
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN pizza ON tetel.pazon = pizza.pazon
WHERE pizza.pnev = 'Húsimádó'
GROUP BY rendeles.datum ORDER BY 2 DESC LIMIT 1;

2017-10-04 (4)

17.	Hány pizza fogyott a legforgalmasabb napon?
SELECT SUM(tetel.db) FROM tetel
INNER JOIN rendeles ON rendeles.razon = tetel.razon  
GROUP BY rendeles.datum ORDER BY 1 DESC LIMIT 1;

14

18.	Mennyi volt a bevétel a legjobb napon?
SELECT SUM(tetel.db * pizza.par) FROM tetel
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN pizza ON pizza.pazon = tetel.pazon
GROUP BY rendeles.datum ORDER BY 1 DESC LIMIT 1;

18300

19.	Mi Szundi kedvenc pizzája?
SELECT pizza.pnev, SUM(tetel.db) FROM pizza
INNER JOIN tetel ON pizza.pazon = tetel.pazon
INNER JOIN rendeles ON rendeles.razon = tetel.razon
INNER JOIN vevo ON vevo.vazon = rendeles.vazon
WHERE vevo.vnev = 'Szundi' GROUP BY pizza.pnev ORDER BY 2 DESC LIMIT 1;

20.	Kik rendeltek pizzát a nyitás napján?
SELECT rendeles.datum FROM rendeles ORDER BY 1 LIMIT 1; /*nyitas napja*/
SELECT vevo.vnev FROM vevo
INNER JOIN rendeles ON rendeles.vazon = vevo.vazon
WHERE datum = (SELECT rendeles.datum FROM rendeles ORDER BY 1 LIMIT 1);

21.	Mely pizzák olcsóbbak a Son.go.ku pizzánál?
select pnev from pizza 
where par < (select par from pizza where pnev="Son.go.ku");

22.	Mely pizzák drágábbak az átlagosnál?
select pnev from pizza 
where par > (select AVG(par) from pizza);

23.	Mely pizza ára van legközelebb az átlagárhoz?
select pnev, ABS(par - (select AVG(par) from pizza)) FROM pizza ORDER BY 2 LIMIT 1;
