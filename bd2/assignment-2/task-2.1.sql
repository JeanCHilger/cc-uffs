CREATE OR REPLACE FUNCTION
    t2_1()
RETURNS TRIGGER AS $$

BEGIN

    IF NEW.quantity = 0 THEN
        DELETE FROM stock WHERE eid = NEW.eid;
        DELETE FROM product WHERE eid = NEW.eid;
    END IF;

    RETURN NEW;

END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER t2_1
    AFTER UPDATE ON stock
    FOR EACH ROW EXECUTE PROCEDURE t2_1();