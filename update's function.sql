CREATE OR REPLACE FUNCTION update_brand(character varying, integer, character varying, double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE brand SET amo_seats = $2, fuel_type = $3, spending = $4 WHERE brand_name = $1;
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

CREATE OR REPLACE FUNCTION update_couple (integer, character varying, character varying)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE couple SET driver_1 = $2, driver_2 = $3 WHERE couple_code = $1;
END;$$

CREATE OR REPLACE FUNCTION update_discrepancy (integer,integer,double precision,double precision,double precision,double precision, double precision, double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE discrepancy SET planned_kms = $3, tours_kms = $4, difference_kms = $5, planned_fuel = $6, consumed_fuel = $7, dif_spending_fuel = $8 WHERE month_code = $1 AND fleet_number = $2;
END;$$

CREATE OR REPLACE FUNCTION update_district (integer, character varying)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE district SET distric_name=$2 WHERE district_code = $1;
END;$$

CREATE OR REPLACE FUNCTION update_driver (character varying, character varying, character varying, character varying, integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN 
	UPDATE driver SET driver_name = $2, address_name = $3, phone = $4, district_code = $5 WHERE  ID = $1;
END;$$

CREATE OR REPLACE FUNCTION update_month (integer,integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE month SET report_code = $2 WHERE month_code=$1;
END;$$

CREATE OR REPLACE FUNCTION update_report (integer, integer, integer, double precision, integer, double precision, double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE report SET amo_services = $2, amo_rents = $3, income_rents = $4, amo_others = $5, income_others = $6, income_total = $7 WHERE report_code = $1;
END;$$



