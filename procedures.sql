GO
CREATE PROCEDURE InsertTicketProcedure
    @Klient INT,
    @Seans INT,
    @Miejsce INT,
    @Cena INT
AS
BEGIN
    INSERT INTO Bilety (Klient, Seans, Miejsce, Cena)
    VALUES (@Klient, @Seans, @Miejsce, @Cena);
END;
GO
CREATE PROCEDURE UpdateTicketProcedure
    @BiletID INT,
    @Klient INT,
    @Seans INT,
    @Miejsce INT,
    @Cena INT
AS
BEGIN
    UPDATE Bilety
    SET Klient = @Klient,
        Seans = @Seans,
        Miejsce = @Miejsce,
        Cena = @Cena
    WHERE BiletID = @BiletID;
END;

GO
CREATE PROCEDURE DeleteTicketProcedure
    @BiletID INT
AS
BEGIN
    DELETE FROM Bilety
    WHERE BiletID = @BiletID;
END;

GO
CREATE PROCEDURE GetTicketByIDProcedure
    @BiletID INT
AS
BEGIN
    SELECT *
    FROM Bilety
    WHERE BiletID = @BiletID;
END;

GO
CREATE PROCEDURE GetTicketsByClientProcedure
    @KlientID INT
AS
BEGIN
    SELECT *
    FROM Bilety
    WHERE Klient = @KlientID;
END;
