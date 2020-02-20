1.	Mennyit költöttek pizzára az egyes vevők?
select vnev, sum(pizza)

Hapci	8300
Kuka 	18000
Morgó 	12000
Szende	12300
Szundi	10000
Tudor	8100
Vidor	10700
2.	Mennyit vettek az egyes vevők a különböző pizzákból?
select vevo.vnev, pnev from vevo
inner join rendeles on rendeles.vazon=vevo.vazon
inner join tetel on tetel.razon=rendeles.razon
inner join 

Hapci	Karib tenger kalózai	1
Hapci	Macskajaj				3
Hapci	Son.go.ku				3
Kuka	Húsimádó				5

3.	Ki hány pizzát szállított házhoz az egyes napokon?



4.	Ki hány pizzát rendelt az egyes napokon?


5.	Mennyi volt a bevétel az egyes napokon?


2017-10-01	7800
2017-10-02	10300
2017-10-03	3700
2017-10-04	14100
2017-10-05	6700
2017-10-06	18300
2017-10-07	14300
2017-10-08	4200

6.	Hány pizza fogyott naponta?
select 

7.	Átlagosan hány darab pizzát rendeltek naponta?

select avg() 

2017-10-01	2.0000
2017-10-02	2.0000

8.	Hány pizzát rendeltek átlagosan egyszerre az egyes vevők?

select avg()

Hapci	1.7500
Kuka	1.4000

9.	Hány alkalommal szállítottak házhoz az egyes futárok?

select fnev, count(razon) from rendeles inner join futar on rendeles.fazon=futar.fazon;
Gömbvillám		3
Gyalogkakukk	9

10.	A fogyasztás alapján mi a pizzák népszerűségi sorrendje?

select pnev from pizza 


11.	A rendelések értéke alapján ki a 3 legjobb vevő?

Kuka 	18000
Szende 	12300
Morgó	12000

12.	Melyik a legdrágább pizza?

select pizza.pnev from pizza order by par desc limit 1;


13.	Ki szállította házhoz a legtöbb pizzát?

select fnev from futar inner join rendeles on rendeles.fazon=futar.fazon group by rendeles.fazon order by count(razon) desc limit 1;

Gyalogkakukk

14.	Ki ette a legtöbb pizzát?

select vnev from vevo inner join rendeles on rendeles.vazon=vevo.vazon group by rendeles.vazon order by count(razon) desc limit 1;

Kuka (14)

15.	Melyik nap fogyott a legtöbb pizza?

select 


2017-10-06 (14)

16.	Melyik nap fogyott a legtöbb Húsimádó pizza?


2017-10-04 (4)

17.	Hány pizza fogyott a legforgalmasabb napon?


14

18.	Mennyi volt a bevétel a legjobb napon?


18300

19.	Mi Szundi kedvenc pizzája?
select pnev, sum(db) from pizza inner join tetel on tetel.pazon=pizza.pazon inner join rendeles on rendeles.razon=tetel.razon inner join vevo on vevo.vazon=rendeles.vazon where vnev like "Szundi" group by pizza.pnev order by 2 desc limit 1;

20.	Kik rendeltek pizzát a nyitás napján?

select vnev, rendeles.datum from rendeles inner join vevo on vevo.vazon=rendeles.vazon where datum = (select rendeles.datum from rendeles order by 1 limit 1);

21.	Mely pizzák olcsóbbak a Son.go.ku pizzánál?

select pnev from pizza where par<(select par from pizza where pnev = 'Songoku');

22.	Mely pizzák drágábbak az átlagosnál?

select pnev from pizza where par>(select avg(par) from pizza);

23.	Mely pizza ára van legközelebb az átlagárhoz?

select pnev from pizza where par!=(select avg(par) from pizza) order by par limit 1;



