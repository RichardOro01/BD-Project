PGDMP     .            	        {           TRANSBUS    10.23    10.23 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    49152    TRANSBUS    DATABASE     �   CREATE DATABASE "TRANSBUS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "TRANSBUS";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            
           1255    49384    check_update_driver()    FUNCTION     (  CREATE FUNCTION public.check_update_driver() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
	IF NEW.is_free_cover THEN
		INSERT INTO free_cover (id_Driver, brand_name) VALUES (new.id_Driver, NEW.brand_name);
	ELSE
		DELETE FROM free_cover WHERE id_Driver = NEW.id_Driver;
	END IF;
END; $$;
 ,   DROP FUNCTION public.check_update_driver();
       public       postgres    false    3    1            �            1255    49153    check_vehicle_delete()    FUNCTION       CREATE FUNCTION public.check_vehicle_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM discrepancy WHERE discrepancy.fleet_number = OLD.fleet_number) THEN
        RAISE EXCEPTION 'Cannot delete vehicle. It has discrepancies associated with it.';
    END IF;
    
    IF EXISTS (SELECT 1 FROM roadmap WHERE roadmap.fleet_number = OLD.fleet_number) THEN
        RAISE EXCEPTION 'Cannot delete vehicle. It has roadmaps associated with it.';
    END IF;

    RETURN OLD;
END;
$$;
 -   DROP FUNCTION public.check_vehicle_delete();
       public       postgres    false    1    3            �            1255    49154    delete_brand(character varying)    FUNCTION     �   CREATE FUNCTION public.delete_brand(brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM brand b WHERE b.brand_name = brand_name;
END;$$;
 A   DROP FUNCTION public.delete_brand(brand_name character varying);
       public       postgres    false    1    3            �            1255    49155    delete_car(integer)    FUNCTION     �   CREATE FUNCTION public.delete_car(fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM car WHERE car.fleet_number = fleet_number;
END;$$;
 7   DROP FUNCTION public.delete_car(fleet_number integer);
       public       postgres    false    3    1            �            1255    49156    delete_contract(integer)    FUNCTION     �   CREATE FUNCTION public.delete_contract(contract_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM contract WHERE contract.contract_code = contract_code;
END;$$;
 =   DROP FUNCTION public.delete_contract(contract_code integer);
       public       postgres    false    1    3            �            1255    49157    delete_couple(integer)    FUNCTION     �   CREATE FUNCTION public.delete_couple(couple_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM couple WHERE couple.couple_code = couple_code;
END;$$;
 9   DROP FUNCTION public.delete_couple(couple_code integer);
       public       postgres    false    1    3            �            1255    49158 $   delete_discrepency(integer, integer)    FUNCTION     �   CREATE FUNCTION public.delete_discrepency(month_code integer, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM discrepancy d WHERE d.month_code = month_code AND d.fleet_number = fleet_number ;
END;$$;
 S   DROP FUNCTION public.delete_discrepency(month_code integer, fleet_number integer);
       public       postgres    false    1    3            �            1255    49159    delete_district(integer)    FUNCTION     �   CREATE FUNCTION public.delete_district(district_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM district d WHERE d.distric_code = district_code;
END;$$;
 =   DROP FUNCTION public.delete_district(district_code integer);
       public       postgres    false    3    1            �            1255    49160     delete_driver(character varying)    FUNCTION     �   CREATE FUNCTION public.delete_driver(character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM driver d WHERE d.ID_Driver = $1;
END;$_$;
 7   DROP FUNCTION public.delete_driver(character varying);
       public       postgres    false    3    1            �            1255    49161    delete_month(date)    FUNCTION     �   CREATE FUNCTION public.delete_month(month_code date) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN 
	DELETE FROM months WHERE months.month_code = month_code;
END;$$;
 4   DROP FUNCTION public.delete_month(month_code date);
       public       postgres    false    3    1            �            1255    49162 7   delete_relation_service_roadmap(integer, date, integer)    FUNCTION     K  CREATE FUNCTION public.delete_relation_service_roadmap(service_code integer, roadmap_date date, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM relation_service_roadmap WHERE r_s_r.service_code = service_code AND r_s_r.roadmap_date = roadmap_date AND r_s_r.fleet_number = fleet_number;
END;$$;
 u   DROP FUNCTION public.delete_relation_service_roadmap(service_code integer, roadmap_date date, fleet_number integer);
       public       postgres    false    3    1            �            1255    49163    delete_report(integer)    FUNCTION     �   CREATE FUNCTION public.delete_report(report_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM report r WHERE r.report_code = report_code;
END;$$;
 9   DROP FUNCTION public.delete_report(report_code integer);
       public       postgres    false    1    3            �            1255    49164    delete_roadmap(date, integer)    FUNCTION     �   CREATE FUNCTION public.delete_roadmap(date, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM roadmap r WHERE r.roadmap_date = $1 AND r.fleet_number = $2;
END;$_$;
 4   DROP FUNCTION public.delete_roadmap(date, integer);
       public       postgres    false    1    3            �            1255    49165    delete_service(integer)    FUNCTION     �   CREATE FUNCTION public.delete_service(service_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM service s WHERE s.service_code = service_code;
END;$$;
 ;   DROP FUNCTION public.delete_service(service_code integer);
       public       postgres    false    3    1            �            1255    49166 M   insert_brand(character varying, integer, character varying, double precision)    FUNCTION     >  CREATE FUNCTION public.insert_brand(brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO brand (brand_name, amo_seats, fuel_type, spending) VALUES (brand_name, amo_seats, fuel_type, spending);
END;
$$;
 �   DROP FUNCTION public.insert_brand(brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision);
       public       postgres    false    1    3            �            1255    49167 9   insert_car(character varying, integer, character varying)    FUNCTION       CREATE FUNCTION public.insert_car(plate character varying, couple_code integer, brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO car (plate, couple_code, brand_name) VALUES (plate, couple_code, brand_name);
END;
$$;
 m   DROP FUNCTION public.insert_car(plate character varying, couple_code integer, brand_name character varying);
       public       postgres    false    1    3            �            1255    49168 n   insert_contract(character varying, date, date, double precision, double precision, character varying, integer)    FUNCTION     
  CREATE FUNCTION public.insert_contract(applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO contract (applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number) VALUES (applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number);
END;
$$;
 �   DROP FUNCTION public.insert_contract(applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer);
       public       postgres    false    1    3            �            1255    49169 <   insert_couple(integer, character varying, character varying)    FUNCTION     �   CREATE FUNCTION public.insert_couple(couple_code integer, id1 character varying, id2 character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO couple (couple_code, driver_1, driver_2) VALUES (couple_code, ID1, ID2);
END;
$$;
 g   DROP FUNCTION public.insert_couple(couple_code integer, id1 character varying, id2 character varying);
       public       postgres    false    1    3            �            1255    49170 �   insert_discrepancy(date, integer, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION     R  CREATE FUNCTION public.insert_discrepancy(month_code date, fleet_number integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO discrepancy (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel) VALUES (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel);
END;
$$;
   DROP FUNCTION public.insert_discrepancy(month_code date, fleet_number integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision);
       public       postgres    false    1    3            �            1255    49171 "   insert_district(character varying)    FUNCTION     �   CREATE FUNCTION public.insert_district(district_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO district (district_name) VALUES (district_name);
END;
$$;
 G   DROP FUNCTION public.insert_district(district_name character varying);
       public       postgres    false    1    3                       1255    49383 ~   insert_driver(character varying, character varying, character varying, character varying, integer, boolean, character varying)    FUNCTION     <  CREATE FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, is_free_cover boolean, brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO driver (ID_Driver, driver_name, address, phone, district_code, is_free_cover) VALUES (ID_Driver, driver_name, address, phone, district_code, is_free_cover);
  IF(is_free_cover)THEN
   INSERT INTO free_cover (id_Driver, brand_name) VALUES (ID_Driver, brand_name);
  END IF;  
END;$$;
 �   DROP FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, is_free_cover boolean, brand_name character varying);
       public       postgres    false    1    3            �            1255    49172 �   insert_driver(character varying, character varying, character varying, character varying, integer, character varying, character varying)    FUNCTION     8  CREATE FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, type_of_driver character varying, brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO driver (ID_Driver, driver_name, address, phone, district_code) VALUES (ID_Driver, driver_name, address, phone, district_code);
  IF(type_of_driver='free_cover')THEN
   INSERT INTO free_cover (id_Driver, brand_name) VALUES (ID_Driver, brand_name);
  END IF;  
END;
$$;
 �   DROP FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, type_of_driver character varying, brand_name character varying);
       public       postgres    false    3    1            �            1255    49173    insert_month(date, integer)    FUNCTION     �   CREATE FUNCTION public.insert_month(month_code date, report_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO months (month_code, report_code) VALUES (month_code, report_code);
END;
$$;
 I   DROP FUNCTION public.insert_month(month_code date, report_code integer);
       public       postgres    false    3    1            �            1255    49174 7   insert_relation_service_roadmap(integer, date, integer)    FUNCTION     1  CREATE FUNCTION public.insert_relation_service_roadmap(service_code integer, roadmap_date date, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO relation_service_roadmap (service_code,roadmap_date,fleet_number) VALUES (service_code,roadmap_date,fleet_number);
END; $$;
 u   DROP FUNCTION public.insert_relation_service_roadmap(service_code integer, roadmap_date date, fleet_number integer);
       public       postgres    false    1    3            �            1255    49175 ^   insert_report(integer, integer, double precision, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.insert_report(amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO report (amo_services, amo_rents, income_rents, amo_others, income_others, income_total) VALUES (amo_services, amo_rents, income_rents, amo_others, income_others, income_total);
END;
$$;
 �   DROP FUNCTION public.insert_report(amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision);
       public       postgres    false    3    1            �            1255    49176 G   insert_roadmap(date, integer, double precision, time without time zone)    FUNCTION     4  CREATE FUNCTION public.insert_roadmap(date, fleet_number integer, kms double precision, departure_time time without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
  INSERT INTO roadmap (roadmap_date, fleet_number, kms, departure_time) VALUES ($1, fleet_number, kms, departure_time);
END;
$_$;
 ~   DROP FUNCTION public.insert_roadmap(date, fleet_number integer, kms double precision, departure_time time without time zone);
       public       postgres    false    1    3            �            1255    49177 �   insert_service(character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision)    FUNCTION     c  CREATE FUNCTION public.insert_service(service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO service (service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount) VALUES (service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount);
END;
$$;
 -  DROP FUNCTION public.insert_service(service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision);
       public       postgres    false    3    1            �            1255    49178     prevent_delete_brand_with_cars()    FUNCTION     >  CREATE FUNCTION public.prevent_delete_brand_with_cars() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM car WHERE brand_name = OLD.brand_name) THEN
        RAISE EXCEPTION 'This brand cannot be deleted because there are cars associated with it.';
    END IF;
    RETURN OLD;
END;
$$;
 7   DROP FUNCTION public.prevent_delete_brand_with_cars();
       public       postgres    false    3    1            �            1255    49179 `   update_brand(character varying, character varying, integer, character varying, double precision)    FUNCTION     �  CREATE FUNCTION public.update_brand(old_brand_name character varying, new_brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE brand b SET b.brand_name = new_brand_name, b.amo_seats = amo_seats, b.fuel_type = fuel_type, b.spending = spending WHERE b.brand_name = old_brand_name;
END;$$;
 �   DROP FUNCTION public.update_brand(old_brand_name character varying, new_brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision);
       public       postgres    false    3    1                        1255    49180 B   update_car(integer, character varying, integer, character varying)    FUNCTION     D  CREATE FUNCTION public.update_car(fleet_number integer, plate character varying, brand_name integer, couple_code character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE car  SET car.plate = plate, car.couple_code = couple_code, car.brand_name = brand_name WHERE car.fleet_number = fleet_number;
END;$$;
 �   DROP FUNCTION public.update_car(fleet_number integer, plate character varying, brand_name integer, couple_code character varying);
       public       postgres    false    3    1                       1255    49181 w   update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer)    FUNCTION     Z  CREATE FUNCTION public.update_contract(contract_code integer, applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE contract co SET co.applicant_name = applicant_name, co.start_date = start_date, co.end_date = end_date, co.contract_kms = contract_kms, co.contract_amount = contract_amount, co.countrac_country = countrac_country, co.fleet_number = fleet_number WHERE co.contract_code = contract_code;
END;$$;
 �   DROP FUNCTION public.update_contract(contract_code integer, applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer);
       public       postgres    false    3    1                       1255    49182 E   update_couple(integer, integer, character varying, character varying)    FUNCTION     X  CREATE FUNCTION public.update_couple(old_couple_code integer, new_couple_code integer, driver_1 character varying, driver_2 character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE couple co SET co.couple_code = new_couple_code, co.driver_1 = driver_1, co.driver_2 = driver_2 WHERE co.couple_code = old_couple_code;
END;$$;
 �   DROP FUNCTION public.update_couple(old_couple_code integer, new_couple_code integer, driver_1 character varying, driver_2 character varying);
       public       postgres    false    1    3                       1255    49183 �   update_discrepancy(date, integer, date, integer, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_discrepancy(old_month_code date, old_fleet_number integer, new_month_code date, new_fleet_number integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE discrepancy d SET d.month_code = new_month_code, d.fleet_number = new_fleet_number, d.planned_kms = planned_kms, d.tours_kms = tours_kms, d.difference_kms = difference_kms, d.planned_fuel = planned_fuel, d.consumed_fuel = consumed_fuel, d.dif_spending_fuel = dif_spending_fuel WHERE d.month_code = old_month_code AND d.fleet_number = old_fleet_number;
END;$$;
 E  DROP FUNCTION public.update_discrepancy(old_month_code date, old_fleet_number integer, new_month_code date, new_fleet_number integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision);
       public       postgres    false    3    1                       1255    49184 +   update_district(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.update_district(district_code integer, distric_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE district d SET d.distric_name=distric_name WHERE d.district_code = district_code;
END;$$;
 ]   DROP FUNCTION public.update_district(district_code integer, distric_name character varying);
       public       postgres    false    3    1                       1255    49382 �   update_driver(character varying, character varying, character varying, character varying, character varying, integer, character varying, character varying)    FUNCTION     �  CREATE FUNCTION public.update_driver(old_id_driver character varying, new_id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, type_of_driver character varying, brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN 
	UPDATE driver d SET d.ID_Driver = new_ID_Driver, d.driver_name = driver_name, d.address = address, d.phone = phone, d.district_code = district_code WHERE  d.ID_Driver = old_ID_Driver;
	IF(type_of_driver='free_cover')THEN
		UPDATE free_cover f_c SET f_c.brand_name = brand_name WHERE  f_c.id_Driver = new_ID_Driver;
	END IF;	
END;$$;
   DROP FUNCTION public.update_driver(old_id_driver character varying, new_id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, type_of_driver character varying, brand_name character varying);
       public       postgres    false    1    3            �            1255    49186    update_income_total()    FUNCTION     �   CREATE FUNCTION public.update_income_total() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE report
    SET income_total = (income_rents + income_others)
    WHERE report_code = NEW.report_code;
    
    RETURN NEW;
END;
$$;
 ,   DROP FUNCTION public.update_income_total();
       public       postgres    false    1    3            �            1255    49187 !   update_month(date, date, integer)    FUNCTION       CREATE FUNCTION public.update_month(old_month_code date, new_month_code date, report_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE months mo SET mo.month_code = new_month_code, mo.report_code = report_code WHERE mo.month_code=month_code;
END;$$;
 b   DROP FUNCTION public.update_month(old_month_code date, new_month_code date, report_code integer);
       public       postgres    false    1    3                       1255    49188 g   update_report(integer, integer, integer, double precision, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_report(report_code integer, amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE report r SET r.amo_services = amo_services, r.amo_rents = amo_rents, r.income_rents = income_rents, r.amo_others = amo_others, r.income_others = income_others, r.income_total = income_total WHERE r.report_code = report_code;
END;$$;
 �   DROP FUNCTION public.update_report(report_code integer, amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision);
       public       postgres    false    3    1                       1255    49189 V   update_roadmap(date, date, integer, integer, double precision, time without time zone)    FUNCTION     �  CREATE FUNCTION public.update_roadmap(old_roadmap_date date, new_roadmap_date date, old_fleet_number integer, new_fleet_number integer, kms double precision, departure_time time without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE roadmap r SET r.roadmap_date = new_roadmap_date, r.fleet_number = new_fleet_number, r.kms = kms, r.departure_time = departure_time WHERE r.roadmap_date = old_roadmap_date AND r.fleet_number = old_fleet_number;
END;$$;
 �   DROP FUNCTION public.update_roadmap(old_roadmap_date date, new_roadmap_date date, old_fleet_number integer, new_fleet_number integer, kms double precision, departure_time time without time zone);
       public       postgres    false    3    1                       1255    49190 �   update_service(integer, character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_service(service_code integer, service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	UPDATE service s SET s.service_name = service_name, s.request_number = request_number, s.tour_group_code = tour_group_code, s.country = country, s.pickup_place = pickup_place, s.pickup_time = pickup_time, s.pax = pax, s.service_kms = service_kms, s.amount = amount WHERE s.service_code = service_code;
END;$$;
 C  DROP FUNCTION public.update_service(service_code integer, service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision);
       public       postgres    false    1    3                       1255    49191    validate_contract_dates()    FUNCTION       CREATE FUNCTION public.validate_contract_dates() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NEW.start_date >= NEW.end_date THEN
        RAISE EXCEPTION 'The start date of the contract must be before the end date.';
    END IF;
    RETURN NEW;
END;
$$;
 0   DROP FUNCTION public.validate_contract_dates();
       public       postgres    false    1    3            	           1255    49192    validate_district_code()    FUNCTION       CREATE FUNCTION public.validate_district_code() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF NOT EXISTS(SELECT 1 FROM district WHERE district_code = NEW.district_code) THEN
        RAISE EXCEPTION 'The district code is not valid.';
    END IF;
    RETURN NEW;
END;
$$;
 /   DROP FUNCTION public.validate_district_code();
       public       postgres    false    3    1            �            1259    49193    car    TABLE     �   CREATE TABLE public.car (
    fleet_number integer NOT NULL,
    plate character varying,
    brand_name character varying,
    couple_code integer
);
    DROP TABLE public.car;
       public         postgres    false    3            �            1259    49199    Car_fleet_number_seq    SEQUENCE     �   CREATE SEQUENCE public."Car_fleet_number_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Car_fleet_number_seq";
       public       postgres    false    196    3            �           0    0    Car_fleet_number_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Car_fleet_number_seq" OWNED BY public.car.fleet_number;
            public       postgres    false    197            �            1259    49201    contract    TABLE       CREATE TABLE public.contract (
    contract_code integer NOT NULL,
    applicant_name character varying,
    start_date date,
    end_date date,
    contract_kms double precision,
    contract_amount double precision,
    contract_country character varying,
    fleet_number integer
);
    DROP TABLE public.contract;
       public         postgres    false    3            �            1259    49207    Contract_contract_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Contract_contract_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Contract_contract_code_seq";
       public       postgres    false    198    3            �           0    0    Contract_contract_code_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Contract_contract_code_seq" OWNED BY public.contract.contract_code;
            public       postgres    false    199            �            1259    49209    couple    TABLE     �   CREATE TABLE public.couple (
    couple_code integer NOT NULL,
    driver_1 character varying,
    driver_2 character varying
);
    DROP TABLE public.couple;
       public         postgres    false    3            �            1259    49215    Couple_couple_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Couple_couple_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Couple_couple_code_seq";
       public       postgres    false    3    200            �           0    0    Couple_couple_code_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Couple_couple_code_seq" OWNED BY public.couple.couple_code;
            public       postgres    false    201            �            1259    49217    district    TABLE     j   CREATE TABLE public.district (
    district_code integer NOT NULL,
    district_name character varying
);
    DROP TABLE public.district;
       public         postgres    false    3            �            1259    49223    District_district_code_seq    SEQUENCE     �   CREATE SEQUENCE public."District_district_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."District_district_code_seq";
       public       postgres    false    3    202            �           0    0    District_district_code_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."District_district_code_seq" OWNED BY public.district.district_code;
            public       postgres    false    203            �            1259    49225    report    TABLE     �   CREATE TABLE public.report (
    report_code integer NOT NULL,
    amo_services integer,
    amo_rents integer,
    income_rents double precision,
    amo_others integer,
    income_others double precision,
    income_total double precision
);
    DROP TABLE public.report;
       public         postgres    false    3            �            1259    49228    Report_report_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Report_report_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Report_report_code_seq";
       public       postgres    false    3    204            �           0    0    Report_report_code_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Report_report_code_seq" OWNED BY public.report.report_code;
            public       postgres    false    205            �            1259    49230    service    TABLE     o  CREATE TABLE public.service (
    service_code integer NOT NULL,
    service_name character varying,
    request_number character varying,
    tour_group_code character varying,
    country character varying,
    pickup_place character varying,
    pickup_time time without time zone,
    pax integer,
    service_kms double precision,
    amount double precision
);
    DROP TABLE public.service;
       public         postgres    false    3            �            1259    49236    Service_service_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Service_service_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Service_service_code_seq";
       public       postgres    false    3    206            �           0    0    Service_service_code_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Service_service_code_seq" OWNED BY public.service.service_code;
            public       postgres    false    207            �            1259    49238    brand    TABLE     �   CREATE TABLE public.brand (
    brand_name character varying NOT NULL,
    amo_seats integer,
    fuel_type character varying,
    spending double precision
);
    DROP TABLE public.brand;
       public         postgres    false    3            �            1259    49244    discrepancy    TABLE     ;  CREATE TABLE public.discrepancy (
    fleet_number integer NOT NULL,
    planned_kms double precision,
    tours_kms double precision,
    difference_kms double precision,
    planned_fuel double precision,
    consumed_fuel double precision,
    dif_spending_fuel double precision,
    month_code date NOT NULL
);
    DROP TABLE public.discrepancy;
       public         postgres    false    3            �            1259    49247    driver    TABLE     �   CREATE TABLE public.driver (
    "ID_Driver" character varying NOT NULL,
    driver_name character varying,
    address character varying,
    phone character varying,
    distric_code integer,
    is_free_cover boolean
);
    DROP TABLE public.driver;
       public         postgres    false    3            �            1259    49253 
   free_cover    TABLE     z   CREATE TABLE public.free_cover (
    "id_Driver" character varying NOT NULL,
    brand_name character varying NOT NULL
);
    DROP TABLE public.free_cover;
       public         postgres    false    3            �            1259    49259    months    TABLE     V   CREATE TABLE public.months (
    report_code integer,
    month_code date NOT NULL
);
    DROP TABLE public.months;
       public         postgres    false    3            �            1259    49262    relation_service_roadmap    TABLE     �   CREATE TABLE public.relation_service_roadmap (
    service_code integer NOT NULL,
    roadmap_date date NOT NULL,
    fleet_number integer NOT NULL
);
 ,   DROP TABLE public.relation_service_roadmap;
       public         postgres    false    3            �            1259    49265    roadmap    TABLE     �   CREATE TABLE public.roadmap (
    roadmap_date date NOT NULL,
    fleet_number integer NOT NULL,
    kms double precision,
    departure_time time without time zone
);
    DROP TABLE public.roadmap;
       public         postgres    false    3            �
           2604    49268    car fleet_number    DEFAULT     v   ALTER TABLE ONLY public.car ALTER COLUMN fleet_number SET DEFAULT nextval('public."Car_fleet_number_seq"'::regclass);
 ?   ALTER TABLE public.car ALTER COLUMN fleet_number DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    49269    contract contract_code    DEFAULT     �   ALTER TABLE ONLY public.contract ALTER COLUMN contract_code SET DEFAULT nextval('public."Contract_contract_code_seq"'::regclass);
 E   ALTER TABLE public.contract ALTER COLUMN contract_code DROP DEFAULT;
       public       postgres    false    199    198            �
           2604    49270    district district_code    DEFAULT     �   ALTER TABLE ONLY public.district ALTER COLUMN district_code SET DEFAULT nextval('public."District_district_code_seq"'::regclass);
 E   ALTER TABLE public.district ALTER COLUMN district_code DROP DEFAULT;
       public       postgres    false    203    202            �
           2604    49271    report report_code    DEFAULT     z   ALTER TABLE ONLY public.report ALTER COLUMN report_code SET DEFAULT nextval('public."Report_report_code_seq"'::regclass);
 A   ALTER TABLE public.report ALTER COLUMN report_code DROP DEFAULT;
       public       postgres    false    205    204            �
           2604    49272    service service_code    DEFAULT     ~   ALTER TABLE ONLY public.service ALTER COLUMN service_code SET DEFAULT nextval('public."Service_service_code_seq"'::regclass);
 C   ALTER TABLE public.service ALTER COLUMN service_code DROP DEFAULT;
       public       postgres    false    207    206            �          0    49238    brand 
   TABLE DATA               K   COPY public.brand (brand_name, amo_seats, fuel_type, spending) FROM stdin;
    public       postgres    false    208   ��       �          0    49193    car 
   TABLE DATA               K   COPY public.car (fleet_number, plate, brand_name, couple_code) FROM stdin;
    public       postgres    false    196   ��       �          0    49201    contract 
   TABLE DATA               �   COPY public.contract (contract_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number) FROM stdin;
    public       postgres    false    198   ��       �          0    49209    couple 
   TABLE DATA               A   COPY public.couple (couple_code, driver_1, driver_2) FROM stdin;
    public       postgres    false    200   ��       �          0    49244    discrepancy 
   TABLE DATA               �   COPY public.discrepancy (fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel, month_code) FROM stdin;
    public       postgres    false    209   �       �          0    49217    district 
   TABLE DATA               @   COPY public.district (district_code, district_name) FROM stdin;
    public       postgres    false    202   5�       �          0    49247    driver 
   TABLE DATA               g   COPY public.driver ("ID_Driver", driver_name, address, phone, distric_code, is_free_cover) FROM stdin;
    public       postgres    false    210   R�       �          0    49253 
   free_cover 
   TABLE DATA               =   COPY public.free_cover ("id_Driver", brand_name) FROM stdin;
    public       postgres    false    211   o�       �          0    49259    months 
   TABLE DATA               9   COPY public.months (report_code, month_code) FROM stdin;
    public       postgres    false    212   ��       �          0    49262    relation_service_roadmap 
   TABLE DATA               \   COPY public.relation_service_roadmap (service_code, roadmap_date, fleet_number) FROM stdin;
    public       postgres    false    213   ��       �          0    49225    report 
   TABLE DATA               }   COPY public.report (report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total) FROM stdin;
    public       postgres    false    204   ��       �          0    49265    roadmap 
   TABLE DATA               R   COPY public.roadmap (roadmap_date, fleet_number, kms, departure_time) FROM stdin;
    public       postgres    false    214   ��       �          0    49230    service 
   TABLE DATA               �   COPY public.service (service_code, service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount) FROM stdin;
    public       postgres    false    206    �       �           0    0    Car_fleet_number_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Car_fleet_number_seq"', 1, false);
            public       postgres    false    197            �           0    0    Contract_contract_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Contract_contract_code_seq"', 1, false);
            public       postgres    false    199            �           0    0    Couple_couple_code_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Couple_couple_code_seq"', 1, false);
            public       postgres    false    201            �           0    0    District_district_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."District_district_code_seq"', 1, false);
            public       postgres    false    203            �           0    0    Report_report_code_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Report_report_code_seq"', 1, false);
            public       postgres    false    205            �           0    0    Service_service_code_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Service_service_code_seq"', 1, false);
            public       postgres    false    207            �
           2606    49274    brand Brand_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (brand_name);
 <   ALTER TABLE ONLY public.brand DROP CONSTRAINT "Brand_pkey";
       public         postgres    false    208            �
           2606    49276    car Car_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.car
    ADD CONSTRAINT "Car_pkey" PRIMARY KEY (fleet_number);
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT "Car_pkey";
       public         postgres    false    196            �
           2606    49278    contract Contract_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT "Contract_pkey" PRIMARY KEY (contract_code);
 B   ALTER TABLE ONLY public.contract DROP CONSTRAINT "Contract_pkey";
       public         postgres    false    198            �
           2606    49280    couple Couple_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT "Couple_pkey" PRIMARY KEY (couple_code);
 >   ALTER TABLE ONLY public.couple DROP CONSTRAINT "Couple_pkey";
       public         postgres    false    200            �
           2606    49282    district District_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.district
    ADD CONSTRAINT "District_pkey" PRIMARY KEY (district_code);
 B   ALTER TABLE ONLY public.district DROP CONSTRAINT "District_pkey";
       public         postgres    false    202            �
           2606    49284    driver Driver_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT "Driver_pkey" PRIMARY KEY ("ID_Driver");
 >   ALTER TABLE ONLY public.driver DROP CONSTRAINT "Driver_pkey";
       public         postgres    false    210            �
           2606    49286    report Report_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.report
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY (report_code);
 >   ALTER TABLE ONLY public.report DROP CONSTRAINT "Report_pkey";
       public         postgres    false    204            �
           2606    49288    roadmap Roadmap_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.roadmap
    ADD CONSTRAINT "Roadmap_pkey" PRIMARY KEY (roadmap_date, fleet_number);
 @   ALTER TABLE ONLY public.roadmap DROP CONSTRAINT "Roadmap_pkey";
       public         postgres    false    214    214            �
           2606    49290    service Service_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.service
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY (service_code);
 @   ALTER TABLE ONLY public.service DROP CONSTRAINT "Service_pkey";
       public         postgres    false    206            �
           2606    49292    discrepancy discrepancy_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT discrepancy_pkey PRIMARY KEY (month_code, fleet_number);
 F   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT discrepancy_pkey;
       public         postgres    false    209    209            �
           2606    49294    free_cover free_cover_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT free_cover_pkey PRIMARY KEY ("id_Driver");
 D   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT free_cover_pkey;
       public         postgres    false    211            �
           2606    49296    months months_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.months
    ADD CONSTRAINT months_pkey PRIMARY KEY (month_code);
 <   ALTER TABLE ONLY public.months DROP CONSTRAINT months_pkey;
       public         postgres    false    212            �
           2606    49298 6   relation_service_roadmap relation_service_roadmap_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT relation_service_roadmap_pkey PRIMARY KEY (service_code, roadmap_date, fleet_number);
 `   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT relation_service_roadmap_pkey;
       public         postgres    false    213    213    213            �
           1259    49299    fki_brand_name    INDEX     D   CREATE INDEX fki_brand_name ON public.car USING btree (brand_name);
 "   DROP INDEX public.fki_brand_name;
       public         postgres    false    196            �
           1259    49300    fki_distric_code    INDEX     K   CREATE INDEX fki_distric_code ON public.driver USING btree (distric_code);
 $   DROP INDEX public.fki_distric_code;
       public         postgres    false    210            �
           1259    49301    fki_driver_1    INDEX     C   CREATE INDEX fki_driver_1 ON public.couple USING btree (driver_1);
     DROP INDEX public.fki_driver_1;
       public         postgres    false    200            �
           1259    49302    fki_driver_2    INDEX     C   CREATE INDEX fki_driver_2 ON public.couple USING btree (driver_2);
     DROP INDEX public.fki_driver_2;
       public         postgres    false    200            �
           1259    49303    fki_fleet_number    INDEX     P   CREATE INDEX fki_fleet_number ON public.discrepancy USING btree (fleet_number);
 $   DROP INDEX public.fki_fleet_number;
       public         postgres    false    209            �
           1259    49304    fki_month_code    INDEX     L   CREATE INDEX fki_month_code ON public.discrepancy USING btree (month_code);
 "   DROP INDEX public.fki_month_code;
       public         postgres    false    209            �
           1259    49305    fki_service_code    INDEX     ]   CREATE INDEX fki_service_code ON public.relation_service_roadmap USING btree (service_code);
 $   DROP INDEX public.fki_service_code;
       public         postgres    false    213                       2620    49306    driver check_district_code    TRIGGER     �   CREATE TRIGGER check_district_code BEFORE INSERT OR UPDATE ON public.driver FOR EACH ROW EXECUTE PROCEDURE public.validate_district_code();
 3   DROP TRIGGER check_district_code ON public.driver;
       public       postgres    false    210    265                       2620    49307    contract contract_dates_trigger    TRIGGER     �   CREATE TRIGGER contract_dates_trigger BEFORE INSERT OR UPDATE ON public.contract FOR EACH ROW EXECUTE PROCEDURE public.validate_contract_dates();
 8   DROP TRIGGER contract_dates_trigger ON public.contract;
       public       postgres    false    198    264                       2620    49308 $   brand prevent_delete_brand_with_cars    TRIGGER     �   CREATE TRIGGER prevent_delete_brand_with_cars BEFORE DELETE ON public.brand FOR EACH ROW EXECUTE PROCEDURE public.prevent_delete_brand_with_cars();
 =   DROP TRIGGER prevent_delete_brand_with_cars ON public.brand;
       public       postgres    false    208    254                       2620    49309    car prevent_vehicle_delete    TRIGGER     �   CREATE TRIGGER prevent_vehicle_delete BEFORE DELETE ON public.car FOR EACH ROW EXECUTE PROCEDURE public.check_vehicle_delete();
 3   DROP TRIGGER prevent_vehicle_delete ON public.car;
       public       postgres    false    215    196                       2620    49385     driver update_free_cover_trigger    TRIGGER     �   CREATE TRIGGER update_free_cover_trigger AFTER UPDATE OF is_free_cover ON public.driver FOR EACH ROW EXECUTE PROCEDURE public.check_update_driver();
 9   DROP TRIGGER update_free_cover_trigger ON public.driver;
       public       postgres    false    210    266    210                       2620    49310 "   report update_income_total_trigger    TRIGGER     �   CREATE TRIGGER update_income_total_trigger AFTER INSERT OR UPDATE OF income_rents, income_others ON public.report FOR EACH ROW EXECUTE PROCEDURE public.update_income_total();
 ;   DROP TRIGGER update_income_total_trigger ON public.report;
       public       postgres    false    225    204    204    204                        2606    49311    car brand_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT brand_name FOREIGN KEY (brand_name) REFERENCES public.brand(brand_name) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT brand_name;
       public       postgres    false    2799    208    196                       2606    49316    free_cover brand_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT brand_name FOREIGN KEY (brand_name) REFERENCES public.brand(brand_name) ON UPDATE CASCADE ON DELETE SET NULL;
 ?   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT brand_name;
       public       postgres    false    211    2799    208                       2606    49321    car couple_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT couple_code FOREIGN KEY (couple_code) REFERENCES public.couple(couple_code) NOT VALID;
 9   ALTER TABLE ONLY public.car DROP CONSTRAINT couple_code;
       public       postgres    false    196    2789    200                       2606    49326    driver distric_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT distric_code FOREIGN KEY (distric_code) REFERENCES public.district(district_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 =   ALTER TABLE ONLY public.driver DROP CONSTRAINT distric_code;
       public       postgres    false    2793    202    210                       2606    49331    couple driver_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT driver_1 FOREIGN KEY (driver_1) REFERENCES public.driver("ID_Driver") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.couple DROP CONSTRAINT driver_1;
       public       postgres    false    210    2805    200                       2606    49336    couple driver_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT driver_2 FOREIGN KEY (driver_2) REFERENCES public.driver("ID_Driver") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.couple DROP CONSTRAINT driver_2;
       public       postgres    false    2805    210    200                       2606    49341    contract fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.contract DROP CONSTRAINT fleet_number;
       public       postgres    false    198    196    2784                       2606    49346    discrepancy fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 B   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT fleet_number;
       public       postgres    false    196    209    2784                       2606    49351    roadmap fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.roadmap
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.roadmap DROP CONSTRAINT fleet_number;
       public       postgres    false    2784    196    214            	           2606    49356    free_cover id_Driver    FK CONSTRAINT     �   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT "id_Driver" FOREIGN KEY ("id_Driver") REFERENCES public.driver("ID_Driver") ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT "id_Driver";
       public       postgres    false    2805    211    210                       2606    49361    discrepancy month_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT month_code FOREIGN KEY (month_code) REFERENCES public.months(month_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 @   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT month_code;
       public       postgres    false    212    209    2810            
           2606    49366    months report_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.months
    ADD CONSTRAINT report_code FOREIGN KEY (report_code) REFERENCES public.report(report_code) NOT VALID;
 <   ALTER TABLE ONLY public.months DROP CONSTRAINT report_code;
       public       postgres    false    212    2795    204                       2606    49371 $   relation_service_roadmap roadmap_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT roadmap_key FOREIGN KEY (roadmap_date, fleet_number) REFERENCES public.roadmap(roadmap_date, fleet_number) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT roadmap_key;
       public       postgres    false    214    213    2815    213    214                       2606    49376 %   relation_service_roadmap service_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT service_code FOREIGN KEY (service_code) REFERENCES public.service(service_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT service_code;
       public       postgres    false    213    2797    206            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     