INSERT INTO Customers (email) VALUES ('random.guy@email.com');
INSERT INTO Customers (email) VALUES ('another.guy@email.com');


INSERT INTO Discounts VALUES ('nodis', 'Full price ticket', 0.0);
INSERT INTO Discounts VALUES ('child', 'Children to 10 years old', 0.60);
INSERT INTO Discounts VALUES ('stdnt', 'Students to 26 years old with valid student ID', 0.40);
INSERT INTO Discounts VALUES ('senio', 'Individuals above 60 years old', 0.30);


INSERT INTO Films VALUES (default, 'Spider-Man: No way home', 'Jon Watts', TO_DATE('2022-01-30', 'YYYY-MM-DD'));
INSERT INTO Films VALUES (default, 'The Lamb', 'Valdimar Jóhannsson', TO_DATE('2021-12-31', 'YYYY-MM-DD'));
INSERT INTO Films VALUES (default, 'The Matrix Resurrections', 'Lana Wachowski', TO_DATE('2021-12-22', 'YYYY-MM-DD'));
INSERT INTO Films VALUES (default, 'Clifford. The big red dog', 'Walt Becker', TO_DATE('2021-12-03', 'YYYY-MM-DD'));


INSERT INTO Screening_types VALUES ('2D', '2D', 21.00);
INSERT INTO Screening_types VALUES ('3D', '3D', 23.00);
INSERT INTO Screening_types VALUES ('4X2D', '4DX 2D', 35.00);
INSERT INTO Screening_types VALUES ('4X3D', '4DX 3D', 37.00);
INSERT INTO Screening_types VALUES ('IM2D', 'IMAX 2D', 24.00);
INSERT INTO Screening_types VALUES ('IM3D', 'IMAX 3D', 26.00);


INSERT INTO Rooms VALUES (default, 150, '2D');
INSERT INTO Rooms VALUES (default, 100, '2D');
INSERT INTO Rooms VALUES (default, 150, '3D');
INSERT INTO Rooms VALUES (default, 50, '4X2D');
INSERT INTO Rooms VALUES (default, 70, '4X3D');
INSERT INTO Rooms VALUES (default, 150, 'IM2D');
INSERT INTO Rooms VALUES (default, 150, 'IM2D');
INSERT INTO Rooms VALUES (default, 130, 'IM3D');
INSERT INTO Rooms VALUES (default, 2, '2D');


INSERT INTO Screenings VALUES (default, 1, 1, TO_DATE('2021-12-21 17:00', 'YYYY-MM-DD HH24:MI'));
INSERT INTO Screenings VALUES (default, 2, 3, TO_DATE('2021-12-21 17:15', 'YYYY-MM-DD HH24:MI'));
INSERT INTO Screenings VALUES (default, 3, 5, TO_DATE('2021-12-21 17:30', 'YYYY-MM-DD HH24:MI'));
INSERT INTO Screenings VALUES (default, 4, 7, TO_DATE('2021-12-21 16:00', 'YYYY-MM-DD HH24:MI'));


INSERT INTO Sold_tickets (customer_id, screening_id, discount_id, price) VALUES (1, 1, 'nodis', 21);
INSERT INTO Sold_tickets (customer_id, screening_id, discount_id, price) VALUES (2, 2, 'stdnt', 14.5);
INSERT INTO Sold_tickets (customer_id, screening_id, discount_id, price) VALUES (1, 3, 'nodis', 37);
INSERT INTO Sold_tickets (customer_id, screening_id, discount_id, price) VALUES (2, 4, 'child', 21);
