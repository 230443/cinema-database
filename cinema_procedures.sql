CREATE OR REPLACE PROCEDURE sell_ticket (
    in_screening_id     IN   screenings.id%TYPE,
    in_discount_id      IN   discounts.id%TYPE DEFAULT 'nodis',
    in_customer_email   IN   customers.email%TYPE DEFAULT NULL
) IS
    customer_id   sold_tickets.customer_id%TYPE;
    price         sold_tickets.price%TYPE;
BEGIN
    SELECT
        id
    INTO customer_id
    FROM
        customers
    WHERE
        email = in_customer_email;

    price := calculate_price(in_screening_id, in_discount_id);
    
    INSERT INTO sold_tickets (
        customer_id,
        screening_id,
        discount_id,
        price
    ) VALUES (customer_id,
        in_screening_id,
        in_discount_id,
        price
    );

END sell_ticket;
