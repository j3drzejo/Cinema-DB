GO
CREATE FUNCTION CalculateTotalPriceFunction
(
    @BiletID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @TotalPrice INT;
    
    SELECT @TotalPrice = Cena
    FROM Bilety
    WHERE BiletID = @BiletID;

    RETURN @TotalPrice;
END;

GO
CREATE FUNCTION GetTicketPriceFunction
(
    @BiletID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @Price INT;
    
    SELECT @Price = Cena
    FROM Bilety
    WHERE BiletID = @BiletID;

    RETURN @Price;
END;

GO
CREATE FUNCTION GetTicketCountFunction
(
    @KlientID INT
)
RETURNS INT
AS
BEGIN
    DECLARE @TicketCount INT;
    
    SELECT @TicketCount = COUNT(*)
    FROM Bilety
    WHERE Klient = @KlientID;

    RETURN @TicketCount;
END;

GO
CREATE FUNCTION IsTicketAvailableFunction
(
    @BiletID INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @Available BIT;

    IF EXISTS (SELECT * FROM Bilety WHERE BiletID = @BiletID)
        SET @Available = 1;
    ELSE
        SET @Available = 0;

    RETURN @Available;
END;

GO
CREATE FUNCTION IsTicketValidFunction
(
    @BiletID INT,
    @KlientID INT
)
RETURNS BIT
AS
BEGIN
    DECLARE @Valid BIT;

    IF EXISTS (SELECT * FROM Bilety WHERE BiletID = @BiletID AND Klient = @KlientID)
        SET @Valid = 1;
    ELSE
        SET @Valid = 0;

    RETURN @Valid;
END;
