1.	Hogy hívják az egyes pizzafutárokat? Névsorba rendezve jelenítsd meg!
SELECT futar.fnev FROM futar ORDER BY futar.fnev;
2.	Milyen pizzák közül lehet rendelni, és mennyibe kerülnek? Ár szerint növekvõ sorrendbe rendezve!
SELECT pizza.pnev, pizza.par FROM pizza ORDER BY pizza.par;
3.	Mennyibe kerül átlagosan egy pizza?
SELECT AVG(pizza.par) FROM pizza;
	(1218)
4.	Mely pizzák olcsóbbak 1000 Ft-nál?
SELECT pizza.pnev FROM pizza WHERE pizza.par < 1000;
5.	Ki szállította házhoz az elsõ (egyes sorszámú) rendelést?
SELECT futar.fnev FROM futar INNER JOIN rendeles ON futar.fazon = rendeles.fazon WHERE razon = 1; 
6.	Kik rendeltek pizzát délelõtt?
SELECT vevo.vnev FROM vevo INNER JOIN rendeles ON vevo.vazon = rendeles.vazon WHERE rendeles.ido < '12:00:00';
7.	Milyen pizzákat evett Szundi?
SELECT pizza.pnev FROM rendeles INNER JOIN tetel ON rendeles.razon = tetel.razon INNER JOIN pizza ON pizza.pazon = tetel.pazon INNER JOIN vevo ON rendeles.vazon = vevo.vazon WHERE vevo.vnev = 'Szundi';
	(Karib..., Húsimádó, Son.go.ku)
8.	Ki szállított házhoz Tudornak?
SELECT futar.fnev FROM futar INNER JOIN rendeles ON futar.fazon = rendeles.fazon INNER JOIN vevo ON rendeles.vazon = vevo.vazon WHERE vevo.vnev = 'Tudor';
	(Gyalogkakukk,
	Imperial)
9.	Az egyes rendelések alkalmával, ki kinek szállított házhoz?
SELECT futar.fnev, vevo.vnev FROM rendeles INNER JOIN vevo ON vevo.vazon = rendeles.vazon INNER JOIN futar ON futar.fazon = rendeles.fazon;
10.	Mennyit költött pizzára Morgó?
SELECT SUM(pizza.par * tetel.db) FROM pizza INNER JOIN tetel ON pizza.pazon = tetel.pazon INNER JOIN rendeles ON rendeles.razon = tetel.razon INNER JOIN vevo ON vevo.vazon = rendeles.vazon WHERE vevo.vnev = 'Morgó';
	(12000)
11.	Hány alkalommal rendelt Macskajaj pizzát Kuka?
SELECT COUNT(rendeles.razon) FROM pizza INNER JOIN tetel ON pizza.pazon = tetel.pazon INNER JOIN rendeles ON rendeles.razon = tetel.razon INNER JOIN vevo ON vevo.vazon = rendeles.vazon WHERE pizza.pnev = 'Macskajaj' AND vevo.vnev = 'Kuka';
	(3)
12.	Hány darab Macskajaj pizzát rendelt Kuka?
SELECT SUM(tetel.db) FROM pizza INNER JOIN tetel ON pizza.pazon = tetel.pazon INNER JOIN rendeles ON rendeles.razon = tetel.razon INNER JOIN vevo ON vevo.vazon = rendeles.vazon WHERE pizza.pnev = 'Macskajaj' AND vevo.vnev = 'Kuka';
	(4)
13.	Hányszor rendelt pizzát Szendre?
SELECT COUNT(rendeles.razon) FROM rendeles INNER JOIN vevo ON rendeles.vazon = vevo.vazon WHERE vevo.vnev = 'Szendre';
	(3)
14.	Hány darab Húsimádó pizza fogyott összesen?
SELECT SUM(tetel.db) FROM tetel INNER JOIN pizza ON pizza.pazon = tetel.pazon WHERE pizza.pnev = 'Húsimádó';
	(15)
