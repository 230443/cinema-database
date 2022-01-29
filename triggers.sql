CREATE OR REPLACE TRIGGER before_sell BEFORE
    INSERT ON sold_tickets
    FOR EACH ROW
BEGIN
    IF get_free_places_number(:new.screening_id) <= 0 THEN
        raise_application_error(-20001, 'No free places');
    END IF;
END;

