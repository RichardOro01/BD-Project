CREATE OR REPLACE FUNCTION update_brand(old_brand_name character varying, new_brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE brand b SET b.brand_name = new_brand_name, b.amo_seats = amo_seats, b.fuel_type = fuel_type, b.spending = spending WHERE b.brand_name = old_brand_name;
END;$$

CREATE OR REPLACE FUNCTION update_car (fleet_number integer, plate character varying, brand_name integer, couple_code character varying)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE car  SET car.plate = plate, car.couple_code = couple_code, car.brand_name = brand_name WHERE car.fleet_number = fleet_number;
END;$$

CREATE OR REPLACE FUNCTION update_contract (contract_code integer, applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE contract co SET co.applicant_name = applicant_name, co.start_date = start_date, co.end_date = end_date, co.contract_kms = contract_kms, co.contract_amount = contract_amount, co.countrac_country = countrac_country, co.fleet_number = fleet_number WHERE co.contract_code = contract_code;
END;$$

CREATE OR REPLACE FUNCTION update_couple (old_couple_code integer, new_couple_code integer, driver_1 character varying, driver_2 character varying)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE couple co SET co.couple_code = new_couple_code, co.driver_1 = driver_1, co.driver_2 = driver_2 WHERE co.couple_code = old_couple_code;
END;$$

CREATE OR REPLACE FUNCTION update_discrepancy (old_month_code integer,old_fleet_number integer,new_month_code integer,new_fleet_number integer,planned_kms double precision,tours_kms double precision,difference_kms double precision,planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE discrepancy d SET d.month_code = new_month_code, d.fleet_number = new_fleet_number, d.planned_kms = planned_kms, d.tours_kms = tours_kms, d.difference_kms = difference_kms, d.planned_fuel = planned_fuel, d.consumed_fuel = consumed_fuel, d.dif_spending_fuel = dif_spending_fuel WHERE d.month_code = old_month_code AND d.fleet_number = old_fleet_number;
END;$$

CREATE OR REPLACE FUNCTION update_district (district_code integer, distric_name character varying)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE district d SET d.distric_name=distric_name WHERE d.district_code = district_code;
END;$$

CREATE OR REPLACE FUNCTION update_driver (old_ID_Driver character varying, new_ID_Driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN 
	UPDATE driver d SET d.ID_Driver = new_ID_Driver, d.driver_name = driver_name, d.address = address, d.phone = phone, d.district_code = district_code WHERE  d.ID_Driver = old_ID_Driver;
END;$$

CREATE OR REPLACE FUNCTION update_month (old_month_code date,new_month_code date,report_code integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE months mo SET mo.month_code = new_month_code, mo.report_code = report_code WHERE mo.month_code=month_code;
END;$$

CREATE OR REPLACE FUNCTION update_report (report_code integer, amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE report r SET r.amo_services = amo_services, r.amo_rents = amo_rents, r.income_rents = income_rents, r.amo_others = amo_others, r.income_others = income_others, r.income_total = income_total WHERE r.report_code = report_code;
END;$$

CREATE OR REPLACE FUNCTION update_roadmap (old_roadmap_date date, new_roadmap_date date, old_fleet_number integer,new_fleet_number integer, kms double precision, departure_time time without time zone)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE roadmap r SET r.roadmap_date = new_roadmap_date, r.fleet_number = new_fleet_number, r.kms = kms, r.departure_time = departure_time WHERE r.roadmap_date = old_roadmap_date AND r.fleet_number = old_fleet_number;
END;$$

CREATE OR REPLACE FUNCTION update_service (service_code integer, service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	UPDATE service s SET s.service_name = service_name, s.request_number = request_number, s.tour_group_code = tour_group_code, s.country = country, s.pickup_place = pickup_place, s.pickup_time = pickup_time, s.pax = pax, s.service_kms = service_kms, s.amount = amount WHERE s.service_code = service_code;
END;$$	
