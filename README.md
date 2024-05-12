# Cinema Database

The "Kino" database schema aims to facilitate the management of cinema operations, including customer bookings, movie screenings, ticket sales, and movie reviews. It provides a structured approach to organizing data related to cinema management.
Database Schema

# ER DIAGRAM
![alt text](https://github.com/j3drzejo/Cinema-DB/blob/main/er.PNG)

# The database schema consists of the following tables:

- Klienci: Stores information about customers, including their names, surnames, and birth dates.
- Sale: Contains details about cinema halls, such as hall names and seat capacities.
- Filmy: Stores information about movies, including titles, directors, and release years.
- Seanse: Manages movie screenings, including the movie, hall, date, and time.
- Miejsca: Represents seats within cinema halls, including row and seat numbers.
- Bilety: Handles ticket sales, linking customers, screenings, and seats.
- ZarezerwowaneMiejsca: Tracks reserved seats for tickets.
- Recenzje: Stores movie reviews, including ratings, opinions, and review dates.
- Kategorie: Manages movie categories or genres.
- Filmy_Kategorie: Associates movies with their respective categories.

Functions:
- CalculateTotalPriceFunction: Calculates total ticket price.
- GetTicketPriceFunction: Retrieves ticket price.
- GetTicketCountFunction: Counts tickets purchased by a customer.
- IsTicketAvailableFunction: Checks ticket availability.
- IsTicketValidFunction: Validates ticket ownership by a customer.

Procedures:
- InsertTicketProcedure: Inserts a new ticket into the database.
- UpdateTicketProcedure: Updates details of an existing ticket.
- DeleteTicketProcedure: Deletes a ticket from the database.
- GetTicketByIDProcedure: Retrieves a ticket by its ID.
- GetTicketsByClientProcedure: Retrieves tickets associated with a specific customer.

Triggers:
- UpdateTicketPriceTrigger: Updates ticket prices after insert or update operations. It also logs price changes in the TicketPriceChangeLog table.
- DeleteTicketTrigger: Logs the deletion of tickets by inserting entries into the DeletedTicketLog table.
- AuditTicketChangesTrigger: Records all changes (inserts, updates, deletes) made to tickets in the TicketChangeLog table.
- CheckTicketAvailabilityTrigger: Prevents the insertion of tickets for seats that are already booked for a show. It checks seat availability before allowing an insert operation.
- BlockTicketDeletionTrigger: Blocks the deletion of tickets with prices higher than $100. It performs this action instead of allowing the delete operation to proceed.

Views:
- TicketDetailsView: Presents detailed information about tickets, including ticket ID, customer details, movie details, and ticket price.
- ClientTicketsView: Displays tickets associated with customers, showing ticket ID, customer details, ticket details, and price.
- TicketSaleInfoView: Offers insights into ticket sale information, featuring ticket ID, movie details, screening date, hall number, and ticket price.
- TicketAvailabilityView: Shows the availability of tickets for screenings, listing ticket ID, screening details, seat details (row and seat number), and hall name.
- TicketPriceView: Highlights ticket prices along with associated movie and customer details, displaying ticket ID, price, movie title, and customer name.

