SET SERVEROUTPUT ON

-- get_base_price

DECLARE
    price NUMBER;
BEGIN
    price := get_base_price(64);
    dbms_output.put_line(TO_CHAR(price));
    price := get_base_price(1243);
END;

-- calculate price

DECLARE
    price NUMBER(6, 2);
BEGIN
    price := calculate_price(64, 'stdnt');
    dbms_output.put_line(TO_CHAR(price));
    price := calculate_price(64, 'invalid discount');
END;

-- get free places num

DECLARE
    free_places NUMBER(6, 2);
BEGIN
    free_places := get_free_places_number(64);
    dbms_output.put_line(TO_CHAR(free_places));
END;

-- sell tickets

DECLARE
    screening   NUMBER := 69;
    email       customers.email%TYPE := 'random.guy@email.com';
    dis         discounts.id%TYPE := 'stdnt';
BEGIN
    dbms_output.put_line('Free places: ' || TO_CHAR(get_free_places_number(screening)));
    dbms_output.put_line('Running sell_ticket(screening, dis, email) ');
    sell_ticket(screening, dis, email);
    
    dbms_output.put_line('Free places: ' || TO_CHAR(get_free_places_number(screening)));
    dbms_output.put_line('Running sell_ticket(screening, dis) ');
    sell_ticket(screening, dis);
    
    dbms_output.put_line('Free places: ' || TO_CHAR(get_free_places_number(screening)));
    dbms_output.put_line('Running sell_ticket(screening) ');
    sell_ticket(screening);
    
    dbms_output.put_line('next should be an error');
    sell_ticket(screening);
EXCEPTION
    WHEN OTHERS THEN
        IF sqlcode = -20001 THEN
            dbms_output.put_line('error thrown. no free places');
        ELSE
            RAISE;
        END IF;
end;


SELECT
    id,
    title,
    director,
    release_date
FROM
    films
WHERE
    lower(title) LIKE '%'
                      || lower('Spider-man')
                      || '%';
DECLARE
    search_title   films.title%TYPE := 'matrix';
    title          films.title%TYPE;
    director       films.director%TYPE := 'test director modified';
    release_date   films.release_date%TYPE := '15-SEP-2020';
BEGIN
    modify_film_by_title(in_search_title => search_title, in_director => director, in_release_date => release_date);
END;