CREATE OR REPLACE FUNCTION validate_contract_dates() RETURNS TRIGGER AS $$
BEGIN
    IF NEW.start_date >= NEW.end_date THEN
        RAISE EXCEPTION 'The start date of the contract must be before the end date.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER contract_dates_trigger
BEFORE INSERT OR UPDATE ON contract
FOR EACH ROW
EXECUTE PROCEDURE validate_contract_dates();

CREATE OR REPLACE FUNCTION prevent_delete_brand_with_cars()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM car WHERE brand_name = OLD.brand_name) THEN
        RAISE EXCEPTION 'This brand cannot be deleted because there are cars associated with it.';
    END IF;
    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_delete_brand_with_cars
BEFORE DELETE ON brand
FOR EACH ROW
EXECUTE PROCEDURE prevent_delete_brand_with_cars();

CREATE OR REPLACE FUNCTION update_income_total()
RETURNS TRIGGER AS $$
BEGIN
    UPDATE report
    SET income_total = (income_rents + income_others)
    WHERE report_code = NEW.report_code;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_income_total_trigger
AFTER INSERT OR UPDATE OF income_rents,income_others ON report
FOR EACH ROW
EXECUTE PROCEDURE update_income_total();

CREATE OR REPLACE FUNCTION validate_district_code()
RETURNS TRIGGER AS $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM district WHERE district_code = NEW.district_code) THEN
        RAISE EXCEPTION 'The district code is not valid.';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_district_code
BEFORE INSERT OR UPDATE ON driver
FOR EACH ROW
EXECUTE PROCEDURE validate_district_code();

CREATE OR REPLACE FUNCTION check_vehicle_delete()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM discrepancy WHERE discrepancy.fleet_number = OLD.fleet_number) THEN
        RAISE EXCEPTION 'Cannot delete vehicle. It has discrepancies associated with it.';
    END IF;
    
    IF EXISTS (SELECT 1 FROM roadmap WHERE roadmap.fleet_number = OLD.fleet_number) THEN
        RAISE EXCEPTION 'Cannot delete vehicle. It has roadmaps associated with it.';
    END IF;

    RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER prevent_vehicle_delete
BEFORE DELETE ON car
FOR EACH ROW
EXECUTE PROCEDURE check_vehicle_delete();
