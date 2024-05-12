KINO Database Schema

This repository contains SQL code for creating and managing a database schema designed for a cinema (KINO). The schema includes tables for managing customers, movies, screenings, tickets, reservations, reviews, categories, and more.
Table of Contents

    Introduction
    Database Schema
    Setup
    Contributing
    License

Introduction

The KINO database schema aims to facilitate the management of cinema operations, including customer bookings, movie screenings, ticket sales, and movie reviews. It provides a structured approach to organizing data related to cinema management.
Database Schema

The database schema consists of the following tables:

    Klienci: Stores information about customers, including their names, surnames, and birth dates.
    Sale: Contains details about cinema halls, such as hall names and seat capacities.
    Filmy: Stores information about movies, including titles, directors, and release years.
    Seanse: Manages movie screenings, including the movie, hall, date, and time.
    Miejsca: Represents seats within cinema halls, including row and seat numbers.
    Bilety: Handles ticket sales, linking customers, screenings, and seats.
    ZarezerwowaneMiejsca: Tracks reserved seats for tickets.
    Recenzje: Stores movie reviews, including ratings, opinions, and review dates.
    Kategorie: Manages movie categories or genres.
    Filmy_Kategorie: Associates movies with their respective categories.

Setup

To set up the KINO database schema, execute the SQL code provided in the kino_schema.sql file against your preferred SQL database management system. Ensure that you have appropriate permissions to create and modify databases and tables.
Contributing

Contributions to improve the database schema or add new features are welcome. If you encounter any issues or have suggestions for enhancements, please open an issue or submit a pull request.
License

This project is licensed under the MIT License.
