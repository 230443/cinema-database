SET SERVEROUTPUT ON

-- get_base_price

DECLARE
    price NUMBER;
BEGIN
    price := get_base_price(5);
    dbms_output.put_line(TO_CHAR(price));
END;

-- calculate price

DECLARE
    price NUMBER(6, 2);
BEGIN
    price := calculate_price(5, 'stdnt');
    dbms_output.put_line(TO_CHAR(price));
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
    dbms_output.put_line('sell_ticket(screening, dis, email) ');
    sell_ticket(screening, dis, email);
    dbms_output.put_line(TO_CHAR(get_free_places_number(screening)));
    dbms_output.put_line('sell_ticket(screening, dis) ');
    sell_ticket(screening, dis);
    dbms_output.put_line(TO_CHAR(get_free_places_number(screening)));
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
END;