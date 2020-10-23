USE [Plantv]
GO
--Oplossing oefening Alter table
--1. Breid de tabel PLANTEN uit men een kolom VOORRAAD 
--voor het aantal stuks dat het tuincentrum van de desbetreffende plant nog in
--voorraad heeft.
Alter table planten add voorraad INT
--2. Definieer als standaardkleur voor planten de kleur groen.
ALTER TABLE Planten
ADD CONSTRAINT DF_Kleur DEFAULT ('GROEN') FOR Kleur



