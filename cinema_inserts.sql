INSERT INTO Customers (email) VALUES ('random.guy@email.com');
INSERT INTO Customers (email) VALUES ('another.guy@email.com');

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


INSERT INTO Films VALUES (default, 'Spider-Man: No way home', 'Jon Watts', TO_DATE('2022-01-30', 'YYYY-MM-DD'));
INSERT INTO Films VALUES (default, 'The Lamb', 'Valdimar Jóhannsson', TO_DATE('2021-12-31', 'YYYY-MM-DD'));
INSERT INTO Films VALUES (default, 'The Matrix Resurrections', 'Lana Wachowski', TO_DATE('2021-12-22', 'YYYY-MM-DD'));
INSERT INTO Films VALUES (default, 'Clifford. The big red dog', 'Walt Becker', TO_DATE('2021-12-03', 'YYYY-MM-DD'));


INSERT INTO Rooms VALUES
(150, '2D'),
(100, '2D'),
(50, '3D');

INSERT INTO Screenings VALUES
(1, 1, '2021-12-21 17:00:00'),
(2, 2, '2021-12-21 17:15:00'),
(3, 1, '2021-12-21 17:30:00'),
(4, 2, '2021-12-21 16:00:00');

INSERT INTO Screening_types VALUES ('2D', '2D', 21.00);
INSERT INTO Screening_types VALUES ('3D', '3D', 23.00);
INSERT INTO Screening_types VALUES ('4X2D', '4DX 2D', 35.00);
INSERT INTO Screening_types VALUES ('4X3D', '4DX 3D', 37.00);
INSERT INTO Screening_types VALUES ('IM2D', 'IMAX 2D', 24.00);
INSERT INTO Screening_types VALUES ('IM3D', 'IMAX 3D', 26.00);


INSERT INTO Sold_tickets VALUES
(1, 1, 'nodis'),
(2, 2, 'stdnt'),
(1, 4, 'nodis'),
(1, 4, 'child');
