CREATE OR REPLACE FUNCTION delete_report(report_code integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	DELETE FROM report r WHERE r.report_code = report_code;
END;$$

CREATE OR REPLACE FUNCTION delete_brand(brand_name character varying)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	DELETE FROM brand b WHERE b.brand_name = brand_name;
END;$$

CREATE OR REPLACE FUNCTION delete_car(fleet_number integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	DELETE FROM car c WHERE c.fleet_number = fleet_number;
END;$$

CREATE OR REPLACE FUNCTION delete_contract(contract_code integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	DELETE FROM contract c WHERE c.contrac_code = contract_code;
END;$$

CREATE OR REPLACE FUNCTION delete_couple(couple_code integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	DELETE FROM couple c WHERE c.couple_code = couple_code;
END;$$

CREATE OR REPLACE FUNCTION delete_discrepency(month_code integer, fleet_number integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	DELETE FROM discrepancy d WHERE d.month_code = month_code AND d.fleet_number = fleet_number ;
END;$$

CREATE OR REPLACE FUNCTION delete_district(district_code integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	DELETE FROM district d WHERE d.distric_code = district_code;
END;$$

CREATE OR REPLACE FUNCTION delete_driver(character varying)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	DELETE FROM driver d WHERE d.ID = $1;
END;$$

CREATE OR REPLACE FUNCTION delete_month(month_code integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN 
	DELETE FROM month m WHERE m.month_code = month_code;
END;$$

CREATE OR REPLACE FUNCTION delete_roadmap(date,integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	DELETE FROM roadmap r WHERE r.date = $1 AND r.fleet_number = $2;
END;$$	

CREATE OR REPLACE FUNCTION delete_service(service_code integer)
RETURNS VOID LANGUAGE 'plpgsql' AS $$
BEGIN
	DELETE FROM service s WHERE s.service_code = service_code;
END;$$	




	
	
	
	
	
	
	
	
	








