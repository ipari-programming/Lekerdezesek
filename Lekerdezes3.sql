1.	Átlagosan hányszor mentek házhoz a futárok?
Select (SELECT COUNT(razon) from rendeles) / 
(SELECT COUNT(fazon) FROM futar);
->4.21.
	
2.	Mely futárok mentek többet házhoz az átlagosnál?
SELECT fnev from futar 
INNER JOIN rendeles ON rendeles.fazon = futar.fazon 
Group by futar.fnev HAVING COUNT(razon) > 
(Select (SELECT COUNT(razon) from rendeles) / 
(SELECT COUNT(fazon) FROM futar));

-> Gyalogkakukk 9

3.	Átlagosan hány pizzát rendelek a vevõk?
SELECT (SELECT Sum(tetel.db) FROM tetel) / 
(SELECT COUNT(vazon) from vevo);

4.	Kik rendeltek több pizzát, mint egy átlagos vevõ?
SELECT vevo.vnev from vevo 
INNER JOIN rendeles on rendeles.vazon = vevo.vazon 
INNER JOIN tetel ON tetel.razon = rendeles.razon 
GROUP BY vevo.vnev 
HAVING SUM(db) > 
(SELECT (SELECT Sum(tetel.db) FROM tetel) / (SELECT COUNT(vazon) from vevo));
Kuka (14)
Morgó (9)
Szende (9)

5.	Kik szállítottak házhoz legalább négyszer?


Gyalogkakukk -9-szer
Imperial -4-szer

6.	Mely pizzából fogyott legalább 15 db?


Húsimádó, Karib tenger kalózai, Macskajaj

Húsimádó  15
Karib tenger kalózai 18
Macskajaj 16

7.	Van-e olyan pizza, amibõl nem rendeltek még?


Lecsó


8.	Mely vevõk nem rendeltek legalább háromszor?

Szundi, Tudor

9.	Kik rendeltek legalább 5 Son.go.ku pizzát?


Szundi (6db)


10.	Milyen pizzából nem rendelt soha Szende?
	(Milyen pizzákat rendelt Szende? 
	 Milyen pizzanév nem szerepel ezek között - NOT IN!!!)


Lecsó
Son.go.ku

11.	Ki nem rendelt soha Macskajaj pizzát?
(Kik rendeltek Macskajaj pizzát?
Kinek a neve nem szerepel ezek között? NOT IN!!!)


Szundi

12.	Mely pizzafutárokkal nem találkoztak az egyes vevõk?
SELECT vnev, fnev
FROM vevo, futar; -> minden lehtséges futár-vevõ párosítás (descartes szorzat)
Ki kivel találkozott?
Melyik lehetséges párosítás nem szerepel ezek között? Megint NOT IN...)


Hapci Gyalogkakukk
Hapci Gömbvillám
Vidor Gyalogkakukk
Vidor Szélvész
Tudor Hurrikán
Tudor Gömbvillám
Tudor Szélvész
Kuka Hurrikán
Kuka Szélvész
Szende Hurrikán
Szende Szélvész
Szende Imperial
Szundi Hurrikán
Szundi Gömbvillám
Szundi Szélvész
Szundi Imperial
Morgó Hurrikán
Morgó Gömbvillám
Morgó Imperial

13.	Kik rendeltek több Húsimádó pizzát, mint Macskajajt?

/*
------------******************----------------
Nézettáblák

A CREATE TABLE utasítással definiált táblák fizikailagléteznekaz adatbázisban,
azaz az adatbázisrendszer valamilyen fizikai struktúrában tárolja õket. Megtartják
az állapotukat, azaz nem változnak addig, amíg valamilyen táblamódosító
SQL-utasítás meg nem változtatja õket.
Létezik az SQL-relációknak egy másik típusa, amit nézettáblának nevezünk,
amelyek nem léteznek fizikailag az adatbázisban. A nézettáblákat a lekérdezéshez
hasonló kifejezés segítségével definiáljuk. A nézettáblákat ugyanúgy lekérdezhetjük,
mint a fizikailag létezõ táblákat, és egyes esetekben még módosíthatjuk
is õket.

Nézettáblák létrehozása

A legegyszerûbb mód egy nézettábla létrehozására a következõ:

CREATE VIEW <név> AS <definíció>;

A nézettábla definíciója egy SQL-lekérdezés.

Példa:

CREATE VIEW ParamountFilmek AS
SELECT filmcim, ev
FROM filmek
WHERE studioNev='Paramount';

------------***************-----------------
Hozz létre egy husimado nevû nézettáblát, ami azt tartalmazza,
hogy az egyes vevõk hány db Húsimádó pizzát rendeltek
a vevõ neve alapján rendezve,
a nézettábla két mezõjének neve vnev, illetve db legyen!



Kuka 	5
Morgó 	3
Szende 	4
Szundi 	1
Tudor 	1
Vidor 	1

Hozz létre egy Macskajaj nevû nézettáblát, ami azt tartalmazza,
hogy az egyes vevõk hány db macskajaj pizzát rendeltek 
a vevõ neve alapján rendezve,
a nézettábla két mezõjének neve vnev, illetve db legyen!



Hapci 3
Kuka 4
Morgó 2
Szende 1
Tudor 5
Vidor 1

Kösd össze a két nézettáblát, a vnev egyezõsége alapján,
ahol a húsimádó nézettábla db mezõje nagyobb a macskajaj tábla db mezõjénél az lesz jó...



Kuka 
Morgó
Szende
Szundi

Ha Szundi nem szerepel...
LEFT+IFNULL


*/
14.	Kik rendeltek legalább 5 Húsimádó vagy 3 Macskajaj pizzát?
/*
UNION operátor

Az UNION operátor két vagy több SELECT utasítás egyesítését teszi lehetõvé.

Minden UNION-ban lévõ SELECT utasításnak azonos számú oszlopot azonos sorrendben kell tartalmaznia
Az oszlopoknak hasonló adattípusokkal kell rendelkezniük 

UNION Szintaxis:

SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
*/

Kuka
Hapci
Tudor

15.	Kik rendeltek kétfajta pizzából is legalább 3 darabot?

Nézettábla - ki milyen pizzából rendelt legalább 3 darabot?

Hapci 	Macskajaj 				3
Hapci 	Son.go.ku 				3
Kuka 	Húsimádó 				5
Kuka 	Karib tenger kalózai 	3
Kuka 	Macskajaj 				4
Morgó 	Húsimádó 				3
Morgó 	Karib tenger kalózai 	4
Szende 	Húsimádó 				4
Szende 	Karib tenger kalózai 	4
Szundi 	Son.go.ku 				6
Tudor 	Macskajaj 				5
Vidor 	Karib tenger kalózai 	5

Kinek a neve szerepel legalább 2x a nézettáblában?
