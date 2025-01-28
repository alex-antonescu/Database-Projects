INSERT INTO FlightClass (id_class, name)
VALUES
  (1, 'Economy'),
  (2, 'Business'),
  (3, 'First Class');
---------------------------------------------

INSERT INTO Passenger (id_passenger, firstName, lastName)
VALUES
  (1, 'John', 'Doe'),
  (2, 'Jane', 'Smith'),
  (3, 'Alice', 'Brown'),
  (4, 'Bob', 'Johnson');
---------------------------------------------

INSERT INTO Airline (idAirline)
VALUES
  (1),
  (2),
  (3);
---------------------------------------------

INSERT INTO Flight (number, Airline_idAirline, departure_dateTime, arrival_dateTime, durationInMinutes, distance_in_KM, id_departure_airport, id_arrival_airport)
VALUES
  ('FL001', 1, '2025-01-01 08:00:00', '2025-01-01 10:00:00', 120, 500, 1, 2),
  ('FL002', 2, '2025-01-02 12:00:00', '2025-01-02 15:00:00', 180, 1000, 2, 3),
  ('FL003', 3, '2025-01-03 18:00:00', '2025-01-03 20:30:00', 150, 800, 3, 1);
----------------------------------------------

INSERT INTO Airport (IATACode, name, city)
VALUES
  ('JFK', 'John F. Kennedy International Airport', 'New York'),
  ('LAX', 'Los Angeles International Airport', 'Los Angeles'),
  ('ORD', 'O'Hare International Airport', 'Chicago');
-----------------------------------------------

INSERT INTO Ticket (ticketNumber, price, Flight_number, Flight_Airline_idAirline, FlightClass_id_class)
VALUES
  ('T001', 150.00, 'FL001', 1, 1),
  ('T002', 300.00, 'FL002', 2, 2),
  ('T003', 500.00, 'FL003', 3, 3);
-----------------------------------------------

INSERT INTO Passenger_has_Ticket (Passenger_id_passenger, Ticket_ticketNumber, Ticket_FlightClass_name)
VALUES
  (1, 'T001', 'Economy'),
  (2, 'T002', 'Business'),
  (3, 'T003', 'First Class'),
  (4, 'T001', 'Economy');
-----------------------------------------------