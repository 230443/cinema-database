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

    calculated_price :=  (1 - disc_value) * base_price;
    
    RETURN calculated_price;
END calculate_price;
