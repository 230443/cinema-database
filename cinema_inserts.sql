INSERT INTO Customers VALUES
('random.guy@email.com'),
('another.guy@email.com');

INSERT INTO Discounts VALUES
('nodis', 'Full price ticket', 0),
('child', 'Children to 10 years old', 60),
('stdnt', 'Students to 26 years old with valid student ID', 40),
('senio', 'Individuals above 60 years old', 30);

INSERT INTO Films VALUES
('Spider-Man: No way home', 'Jon Watts', '2021-12-17'),
('The Lamb', 'Valdimar Jóhannsson', '2021-12-31'),
('The Matrix Resurrections', 'Lana Wachowski', '2021-12-22'),
('Clifford. The big red dog', 'Walt Becker', '2021-12-03');

INSERT INTO Rooms VALUES
(150, '2D'),
(100, '2D'),
(50, '3D');

INSERT INTO Screenings VALUES
(1, 1, '2021-12-21 17:00:00'),
(2, 2, '2021-12-21 17:15:00'),
(3, 1, '2021-12-21 17:30:00'),
(4, 2, '2021-12-21 16:00:00');

/*INSERT INTO Screening_types VALUES  ?*/

INSERT INTO Sold_tickets VALUES
(1, 1, 'nodis'),
(2, 2, 'stdnt'),
(1, 4, 'nodis'),
(1, 4, 'child');
