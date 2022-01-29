CREATE OR REPLACE FUNCTION get_base_price (
    in_screening_id IN screenings.id%TYPE
) RETURN screening_types.price%TYPE IS
    out_price screening_types.price%TYPE;
BEGIN
    SELECT
        st.price
    INTO out_price
    FROM
        screenings        s
        JOIN rooms             r ON s.room = r.id
        JOIN screening_types   st ON r.screening_type = st.id
    WHERE
        s.id = in_screening_id;

    RETURN out_price;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20002, 'Price not found for screening_id: ' || TO_CHAR(in_screening_id));
END get_base_price;

CREATE OR REPLACE FUNCTION calculate_price (
    in_screening_id   IN   screenings.id%TYPE,
    in_discount_id    IN   discounts.id%TYPE
) RETURN sold_tickets.price%TYPE IS

    base_price         screening_types.price%TYPE;
    disc_value         discounts.percent_off%TYPE;
    calculated_price   sold_tickets.price%TYPE;
BEGIN
    base_price := get_base_price(in_screening_id);
    SELECT
        percent_off
    INTO disc_value
    FROM
        discounts
    WHERE
        id = in_discount_id;

    calculated_price := ( 1 - disc_value ) * base_price;
    RETURN calculated_price;
EXCEPTION
    WHEN no_data_found THEN
        raise_application_error(-20003, 'Discount "'
                                        || in_discount_id
                                        || '" not found.');
END calculate_price;

CREATE OR REPLACE FUNCTION get_free_places_number (
    in_screening_id IN screenings.id%TYPE
) RETURN rooms.capacity%TYPE IS

    l_capacity        rooms.capacity%TYPE;
    out_free_places   rooms.capacity%TYPE := -1;
    occupied_places   rooms.capacity%TYPE;
BEGIN

-- get capacity
    SELECT
        r.capacity
    INTO l_capacity
    FROM
        screenings   s
        JOIN rooms        r ON s.room = r.id
    WHERE
        s.id = in_screening_id
    FETCH FIRST 1 ROWS ONLY;
    
-- count sold tickets

    SELECT
        COUNT(id)
    INTO occupied_places
    FROM
        sold_tickets
    WHERE
        screening_id = in_screening_id;

    out_free_places := l_capacity - occupied_places;
    RETURN out_free_places;
END get_free_places_number;
