GO
CREATE TRIGGER UpdateTicketPriceTrigger
ON Bilety
AFTER INSERT, UPDATE
AS
BEGIN
    UPDATE B
    SET Cena = F.Cena
    FROM Bilety B
    INNER JOIN inserted i ON B.BiletID = i.BiletID
    INNER JOIN Seanse S ON i.Seans = S.SeansID
    INNER JOIN Filmy F ON S.Film = F.FilmID;

    INSERT INTO TicketPriceChangeLog (BiletID, OldPrice, NewPrice, ChangeDate)
    SELECT i.BiletID, d.Cena AS OldPrice, i.Cena AS NewPrice, GETDATE()
    FROM inserted i
    JOIN deleted d ON i.BiletID = d.BiletID;
END;

GO
CREATE TRIGGER DeleteTicketTrigger
ON Bilety
AFTER DELETE
AS
BEGIN
    INSERT INTO DeletedTicketLog (BiletID, DeletionDate)
    SELECT BiletID, GETDATE()
    FROM deleted;
END;

GO
CREATE TRIGGER AuditTicketChangesTrigger
ON Bilety
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    INSERT INTO TicketChangeLog (BiletID, Operation, ChangeDate)
    SELECT COALESCE(i.BiletID, d.BiletID), 
           CASE 
               WHEN i.BiletID IS NOT NULL AND d.BiletID IS NULL THEN 'Insert'
               WHEN i.BiletID IS NOT NULL AND d.BiletID IS NOT NULL THEN 'Update'
               WHEN i.BiletID IS NULL AND d.BiletID IS NOT NULL THEN 'Delete'
           END AS Operation,
           GETDATE()
    FROM inserted i
    FULL OUTER JOIN deleted d ON i.BiletID = d.BiletID;
END;

GO
CREATE TRIGGER CheckTicketAvailabilityTrigger
ON Bilety
INSTEAD OF INSERT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Bilety B JOIN inserted i ON B.Seans = i.Seans AND B.Miejsce = i.Miejsce)
    BEGIN
        INSERT INTO Bilety (Klient, Seans, Miejsce, Cena)
        SELECT Klient, Seans, Miejsce, Cena
        FROM inserted;
    END
    ELSE
    BEGIN
        RAISERROR ('Selected seat is already booked for this show.', 16, 1);
    END;
END;

GO
CREATE TRIGGER BlockTicketDeletionTrigger
ON Bilety
INSTEAD OF DELETE
AS
BEGIN
    DELETE FROM Bilety
    WHERE BiletID IN (SELECT BiletID FROM deleted WHERE Cena > 100);
END;
