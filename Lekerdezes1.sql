1.	Hogy hívják az egyes pizzafutárokat? Névsorba rendezve jelenítsd meg!
	select fnev from futar order by fnev;
2.	Milyen pizzák közül lehet rendelni, és mennyibe kerülnek? Ár szerint növekvő sorrendbe rendezve!
	select pnev, par from pizza order by par;
3.	Mennyibe kerül átlagosan egy pizza?
	(1218)
	select avg(par) from pizza;
4.	Mely pizzák olcsóbbak 1000 Ft-nál?
	select pnev from pizza where par<1000;
5.	Ki szállította házhoz az első (egyes sorszámú) rendelést?
	select fnev from futar inner join rendeles on futar.fazon=rendeles.fazon order by ido limit 1;
6.	Kik rendeltek pizzát délelőtt?
	select vnev from vevo inner join rendeles on vevo.vazon=rendeles.vazon where ido < "12:00:00"; 
7.	Milyen pizzákat evett Szundi?
	(Karib..., Húsimádó, Son.go.ku)
	select pnev from pizza inner join tetel on pizza.pazon=tetel.pazon inner join rendeles on rendeles.razon=tetel.tazon inner join vevo on vevo.vazon=rendeles.vazon where vnev="Szundi";
8.	Ki szállított házhoz Tudornak?
	(Gyalogkakukk,
	Imperial)
	select fnev from futar inner join rendeles on rendeles.razon=vevo.vazon inner join futar on futar.fazon=rendeles.fazon where vnev="Tudor";
9.	Az egyes rendelések alkalmával, ki kinek szállított házhoz?

10.	Mennyit költött pizzára Morgó?
	(12000)
	select sum(pizza.par * tetel.db) from pizza inner join tetel on pizza.pazon=tetel.pazon inner join rendeles on tetel.razon=rendeles.razon inner join vevo on vevo.vazon=rendeles.vazon where vnev="Morgó";
11.	Hány alkalommal rendelt Macskajaj pizzát Kuka?
	(3)
	select Count(rendeles.razon) from pizza inner join tetel on pizza.pazon=tetel.pazon inner join rendeles on tetel.razon=rendeles.razon inner join vevo on vevo.vazon=rendeles.vazon where pnev="Macskajaj" and vnev="Kuka";
12.	Hány darab Macskajaj pizzát rendelt Kuka?
	(4)
	select sum(razon) from rendeles inner join tetel on pizza.pazon=tetel.pazon inner join rendeles on tetel.razon=rendeles.razon inner join vevo on vevo.vazon=rendeles.vazon where vnev="Kuka" and pnev ="Macskajaj";
13.	Hányszor rendelt pizzát Szende?
	(3)
14.	Hány darab Húsimádó pizza fogyott összesen?
	(15)
