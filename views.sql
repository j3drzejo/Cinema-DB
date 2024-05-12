GO
CREATE VIEW TicketDetailsView AS
SELECT B.BiletID, B.Klient, B.Seans, B.Miejsce, B.Cena,
       F.Tytul AS TytulFilmu, F.Rezyser AS RezyserFilmu,
       K.Imie AS ImieKlienta, K.Nazwisko AS NazwiskoKlienta
FROM Bilety B
JOIN Filmy F ON B.Seans = F.FilmID
JOIN Klienci K ON B.Klient = K.KlientID;

GO
CREATE VIEW ClientTicketsView AS
SELECT B.BiletID, B.Klient, B.Seans, B.Miejsce, B.Cena,
       K.Imie AS ImieKlienta, K.Nazwisko AS NazwiskoKlienta
FROM Bilety B
JOIN Klienci K ON B.Klient = K.KlientID;

GO
CREATE VIEW TicketSaleInfoView AS
SELECT B.BiletID, B.Seans, B.Miejsce, B.Cena,
       F.Tytul AS TytulFilmu, F.Rezyser AS RezyserFilmu,
       S.Data AS DataSeansu, S.Sala AS NumerSali, S.Data AS DataSeansu
FROM Bilety B
JOIN Seanse S ON B.Seans = S.SeansID
JOIN Filmy F ON S.Film = F.FilmID;

GO
CREATE VIEW TicketAvailabilityView AS
SELECT B.BiletID, B.Seans, B.Miejsce,
       S.NazwaSali AS NazwaSali, M.Rzad, M.Fotel
FROM Bilety B
JOIN Seanse S ON B.Seans = S.SeansID
JOIN Sale S ON S.SalaID = S.Sala
JOIN Miejsca M ON B.Miejsce = M.MiejsceID;

GO
CREATE VIEW TicketPriceView AS
SELECT B.BiletID, B.Cena,
       F.Tytul AS TytulFilmu, K.Imie AS ImieKlienta, K.Nazwisko AS NazwiskoKlienta
FROM Bilety B
JOIN Filmy F ON B.Seans = F.FilmID
JOIN Klienci K ON B.Klient = K.KlientID;
