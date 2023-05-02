CREATE OR REPLACE FUNCTION insert_month(month_code INTEGER, report_code INTEGER) RETURNS VOID AS $$
BEGIN
  INSERT INTO month (month_code, report_code) VALUES (month_code, report_code);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_report(report_code INTEGER, amo_services INTEGER, amo_rents INTEGER, income_rents DOUBLE PRECISION, amo_others INTEGER, income_others DOUBLE PRECISION, income_total DOUBLE PRECISION) RETURNS VOID AS $$
BEGIN
  INSERT INTO report (report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total) VALUES (report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_contract(contact_code INTEGER, applicant_name CHARACTER VARYING, start_date DATE, end_date DATE, contract_kms DOUBLE PRECISION, contract_amount DOUBLE PRECISION, contract_country CHARACTER VARYING, fleet_number INTEGER) RETURNS VOID AS $$
BEGIN
  INSERT INTO contract (contact_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number) VALUES (contact_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_car(fleet_number INTEGER, plate CHARACTER VARYING, couple_code INTEGER, brand_name CHARACTER VARYING) RETURNS VOID AS $$
BEGIN
  INSERT INTO car (fleet_number, plate, couple_code, brand_name) VALUES (fleet_number, plate, couple_code, brand_name);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_brand(brand_name CHARACTER VARYING, amo_seats INTEGER, fuel_type CHARACTER VARYING, spending DOUBLE PRECISION) RETURNS VOID AS $$
BEGIN
  INSERT INTO brand (brand_name, amo_seats, fuel_type, spending) VALUES (brand_name, amo_seats, fuel_type, spending);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_couple(couple_code INTEGER, ID1 CHARACTER VARYING, ID2 CHARACTER VARYING) RETURNS VOID AS $$
BEGIN
  INSERT INTO couple (couple_code, driver_1, driver_2) VALUES (couple_code, ID1, ID2);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_driver(ID CHARACTER VARYING, driver_name CHARACTER VARYING, address CHARACTER VARYING, phone CHARACTER VARYING, district_code INTEGER) RETURNS VOID AS $$
BEGIN
  INSERT INTO driver (ID, driver_name, address, phone, district_code) VALUES (ID, driver_name, address, phone, district_code);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_district(district_code INTEGER, district_name CHARACTER VARYING) RETURNS VOID AS $$
BEGIN
  INSERT INTO district (district_code, district_name) VALUES (district_code, district_name);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_service(service_code INTEGER, service_name CHARACTER VARYING, request_number CHARACTER VARYING, tour_group_code CHARACTER VARYING, country CHARACTER VARYING, pickup_place CHARACTER VARYING, pickup_time TIME WITHOUT TIME ZONE, pax INTEGER, service_kms DOUBLE PRECISION, amount DOUBLE PRECISION) RETURNS VOID AS $$
BEGIN
  INSERT INTO service (service_code, service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount) VALUES (service_code, service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_discrepancy(month_code INTEGER, fleet_number INTEGER, planned_kms DOUBLE PRECISION, tours_kms DOUBLE PRECISION, difference_kms DOUBLE PRECISION, planned_fuel DOUBLE PRECISION, consumed_fuel DOUBLE PRECISION, dif_spending_fuel DOUBLE PRECISION) RETURNS VOID AS $$
BEGIN
  INSERT INTO discrepancy (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel) VALUES (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel);
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_roadmap(date, fleet_number INTEGER, kms DOUBLE PRECISION, departure_time TIME WITHOUT TIME ZONE) RETURNS VOID AS $$
BEGIN
  INSERT INTO roadmap (date, fleet_number, kms, departure_time) VALUES ($1, fleet_number, kms, departure_time);
END;
$$ LANGUAGE plpgsql;