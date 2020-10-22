USE AdresDB;

--7.	Voeg jouw naam aan de tabel toe;
INSERT INTO AdresTabel (Voornaam ,Naam,Adres,Gemeente,Postcode,Telefoon)
     VALUES ('Jan', 'Janssens','Pierkensstraat 6','Zottegem',9620,'0472-12 45 89');
--8.	Verwijder Lieve Thorens (met één R) uit de tabel, dit was een schrijffout;
delete from AdresTabel where Naam = 'Thorens';
--9.	Verander het adres van Mia Groter naar Stationstraat 25 en het telefoonnummer naar 016-85 21 25;
update AdresTabel set Adres = 'Stationstraat 25', 
	Telefoon = '016-85 21 25' 
	where Voornaam = 'Mia'	AND Naam = 'Groter'
--10.	Voeg jullie instructeur toe aan de tabel, maar enkel de voornaam en achternaam. De rest is privé; 
INSERT INTO AdresTabel (Voornaam,Naam) 
VALUES ('Helena','Coppieters');
