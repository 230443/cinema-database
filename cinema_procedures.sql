CREATE OR REPLACE PROCEDURE sell_ticket (
    in_screening_id     IN   screenings.id%TYPE,
    in_discount_id      IN   discounts.id%TYPE DEFAULT 'nodis',
    in_customer_email   IN   customers.email%TYPE DEFAULT NULL
) IS
    customer_id   sold_tickets.customer_id%TYPE;
    price         sold_tickets.price%TYPE;
BEGIN

-- get customer id
    IF in_customer_email IS NOT NULL THEN
        SELECT
            id
        INTO customer_id
        FROM
            customers
        WHERE
            email = in_customer_email;

    ELSE
        customer_id := NULL;
    END IF;

-- calculate price

    price := calculate_price(in_screening_id, in_discount_id);

-- insert row to sold_tickets table
    INSERT INTO sold_tickets (
        customer_id,
        screening_id,
        discount_id,
        price
    ) VALUES (
        customer_id,
        in_screening_id,
        in_discount_id,
        price
    );

END sell_ticket;


CREATE OR REPLACE PROCEDURE modify_film_by_title (
    in_search_title   IN   films.title%TYPE,
    in_title          IN   films.title%TYPE DEFAULT NULL,
    in_director       IN   films.director%TYPE DEFAULT NULL,
    in_release_date   IN   films.release_date%TYPE DEFAULT NULL
) IS
    film_row films%rowtype;
BEGIN
    SELECT
        id,
        title,
        director,
        release_date
    INTO film_row
    FROM
        films
    WHERE
        lower(title) LIKE '%'
                          || lower(in_search_title)
                          || '%';

    film_row.title := nvl(in_title, film_row.title);
    film_row.director := nvl(in_director, film_row.director);
    film_row.release_date := nvl(in_release_date, film_row.release_date);
    UPDATE films
    SET
        row = film_row
    WHERE
        id = film_row.id;

END modify_film_by_title;

CREATE OR REPLACE PROCEDURE modify_film_by_title (
    in_search_title   IN   films.title%TYPE,
    in_title          IN   films.title%TYPE DEFAULT NULL,
    in_director       IN   films.director%TYPE DEFAULT NULL,
    in_release_date   IN   films.release_date%TYPE DEFAULT NULL
) IS
    film_row films%rowtype;
BEGIN
    SELECT
        id,
        title,
        director,
        release_date
    INTO film_row
    FROM
        films
    WHERE
        lower(title) LIKE '%'
                          || lower(in_search_title)
                          || '%';

    film_row.title := nvl(in_title, film_row.title);
    film_row.director := nvl(in_director, film_row.director);
    film_row.release_date := nvl(in_release_date, film_row.release_date);
    UPDATE films
    SET
        row = film_row
    WHERE
        id = film_row.id;

END modify_film_by_title;

CREATE OR REPLACE PROCEDURE add_screening (
    film_id          IN   screenings.film%TYPE,
    room_id          IN   screenings.room%TYPE,
    screening_time   IN   screenings.screening_time%TYPE
) IS

    start_d   DATE := screening_time - INTERVAL '3' HOUR;
    end_d     DATE := screening_time + INTERVAL '3' HOUR;
    CURSOR cur IS
    SELECT
        s.id,
        f.title,
        s.screening_time
    FROM
        screenings   s
        JOIN films        f ON s.film = f.id
    WHERE
        s.room = room_id
        AND s.screening_time BETWEEN start_d AND end_d
    ORDER BY
        s.screening_time;

    cur_row   cur%rowtype;
BEGIN
    OPEN cur;
    FETCH cur INTO cur_row;
    IF cur%notfound THEN
        INSERT INTO screenings VALUES ( DEFAULT,
        film_id,
        room_id,
        screening_time );

        dbms_output.put_line('Row inserted.');
    ELSE
        dbms_output.put_line('Proposed screening collide with other screenings:');--will return row number beginning with 1
        dbms_output.put_line(cur%rowcount
                             || '.   '
                             || cur_row.id
                             || '    '
                             || cur_row.screening_time
                             || '    '
                             || cur_row.title);

        LOOP
            FETCH cur INTO cur_row;
            EXIT WHEN cur%notfound;
            dbms_output.put_line(cur%rowcount
                                 || '.   '
                                 || cur_row.id
                                 || '    '
                                 || cur_row.screening_time
                                 || '    '
                                 || cur_row.title);

        END LOOP;

        dbms_output.put_line('Row has not been inserted.');
    END IF;

END add_screening;
