CREATE OR REPLACE FUNCTION update_brand(character varying, character varying, integer, character varying, double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE brand SET brand_name = $2, amo_seats = $3, fuel_type = $4, spending = $5 WHERE brand_name = $1;
END;$$

CREATE OR REPLACE FUNCTION update_car (integer, character varying, integer, character varying)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE car SET plate = $2, couple_code = $3, brand_name = $4 WHERE fleet_number = $1;
END;$$

CREATE OR REPLACE FUNCTION update_contract (integer, character varying, date, date, double precision, double precision, character varying, integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE contract SET applicant_name = $2, start_date = $3, end_date = $4, contract_kms = $5, contract_amount = $6, countrac_country = $7, fleet_number = $8 WHERE contract_code = $1;
END;$$

CREATE OR REPLACE FUNCTION update_couple (integer,integer, character varying, character varying)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE couple SET couple_code = $2, driver_1 = $3, driver_2 = $4 WHERE couple_code = $1;
END;$$

CREATE OR REPLACE FUNCTION update_discrepancy (integer,integer,integer,integer,double precision,double precision,double precision,double precision, double precision, double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE discrepancy SET month_code = $3, fleet_number = $4, planned_kms = $5, tours_kms = $6, difference_kms = $7, planned_fuel = $8, consumed_fuel = $9, dif_spending_fuel = $10 WHERE month_code = $1 AND fleet_number = $2;
END;$$

CREATE OR REPLACE FUNCTION update_district (integer, character varying)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE district SET distric_name=$2 WHERE district_code = $1;
END;$$

CREATE OR REPLACE FUNCTION update_driver (character varying, character varying, character varying, character varying, character varying, integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN 
	UPDATE driver SET ID_Driver = $2, driver_name = $3, address_name = $4, phone = $5, district_code = $6 WHERE  ID_Driver = $1;
END;$$

CREATE OR REPLACE FUNCTION update_month (integer,integer,integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE months SET month_code = $2, report_code = $3 WHERE month_code=$1;
END;$$

CREATE OR REPLACE FUNCTION update_report (integer, integer, integer, double precision, integer, double precision, double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE report SET amo_services = $2, amo_rents = $3, income_rents = $4, amo_others = $5, income_others = $6, income_total = $7 WHERE report_code = $1;
END;$$

CREATE OR REPLACE FUNCTION update_roadmap (date,date,integer,integer,double precision, time without time zone)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE roadmap SET roadmap_date = $2, fleet_number = $4, kms = $5, departure_time = $6 WHERE roadmap_date = $1 AND fleet_number = $3;
END;$$

CREATE OR REPLACE FUNCTION update_service (integer,character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE service SET service_name = $2, request_number = $3, tour_group_code = $4, country = $5, pickup_place = $6, pickup_time = $7, pax = $8, service_kms = $9, amount = $10 WHERE service_code = $1;
END;$$	
