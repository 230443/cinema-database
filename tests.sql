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
    price NUMBER(6,2);
BEGIN
    price := calculate_price(5, 'stdnt');
    dbms_output.put_line(TO_CHAR(price));
END;


-- get free places num

DECLARE
    free_places NUMBER(6,2);
BEGIN
    free_places := get_free_places_number(64);
    dbms_output.put_line(TO_CHAR(free_places));
END;