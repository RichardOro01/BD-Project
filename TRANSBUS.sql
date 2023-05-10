PGDMP     (            
        {           TRANSBUS    10.23    10.23 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    65106    TRANSBUS    DATABASE     �   CREATE DATABASE "TRANSBUS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "TRANSBUS";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1255    65107    check_update_driver()    FUNCTION     (  CREATE FUNCTION public.check_update_driver() RETURNS trigger
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
       public       postgres    false    1    3            �            1255    65108    check_vehicle_delete()    FUNCTION       CREATE FUNCTION public.check_vehicle_delete() RETURNS trigger
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
       public       postgres    false    1    3            �            1255    65109    delete_brand(character varying)    FUNCTION     �   CREATE FUNCTION public.delete_brand(character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM brand b WHERE b.brand_name = $1;
END;
$_$;
 6   DROP FUNCTION public.delete_brand(character varying);
       public       postgres    false    3    1            �            1255    65110    delete_car(integer)    FUNCTION     �   CREATE FUNCTION public.delete_car(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM car WHERE car.fleet_number = $1;
END;
$_$;
 *   DROP FUNCTION public.delete_car(integer);
       public       postgres    false    3    1            �            1255    65111    delete_contract(integer)    FUNCTION     �   CREATE FUNCTION public.delete_contract(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM contract WHERE contract.contract_code = $1;
END;
$_$;
 /   DROP FUNCTION public.delete_contract(integer);
       public       postgres    false    3    1            �            1255    65112    delete_couple(integer)    FUNCTION     �   CREATE FUNCTION public.delete_couple(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM couple WHERE couple.couple_code = $1;
END;
$_$;
 -   DROP FUNCTION public.delete_couple(integer);
       public       postgres    false    3    1            �            1255    65113 $   delete_discrepency(integer, integer)    FUNCTION     �   CREATE FUNCTION public.delete_discrepency(integer, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM discrepancy d WHERE d.month_code = $1 AND d.fleet_number = $2 ;
END;
$_$;
 ;   DROP FUNCTION public.delete_discrepency(integer, integer);
       public       postgres    false    3    1            �            1255    65114    delete_district(integer)    FUNCTION     �   CREATE FUNCTION public.delete_district(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM district d WHERE d.distric_code = $1;
END;
$_$;
 /   DROP FUNCTION public.delete_district(integer);
       public       postgres    false    3    1            �            1255    65115     delete_driver(character varying)    FUNCTION     �   CREATE FUNCTION public.delete_driver(character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM driver d WHERE d.ID_Driver = $1;
END;$_$;
 7   DROP FUNCTION public.delete_driver(character varying);
       public       postgres    false    3    1            �            1255    65116    delete_month(date)    FUNCTION     �   CREATE FUNCTION public.delete_month(date) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN 
	DELETE FROM months WHERE months.month_code = date;
END;
$$;
 )   DROP FUNCTION public.delete_month(date);
       public       postgres    false    3    1            �            1255    65117 7   delete_relation_service_roadmap(integer, date, integer)    FUNCTION     	  CREATE FUNCTION public.delete_relation_service_roadmap(integer, date, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM relation_service_roadmap WHERE r_s_r.service_code = $1 AND r_s_r.roadmap_date = $2 AND r_s_r.fleet_number = $3;
END;
$_$;
 N   DROP FUNCTION public.delete_relation_service_roadmap(integer, date, integer);
       public       postgres    false    3    1            �            1255    65118    delete_report(integer)    FUNCTION     �   CREATE FUNCTION public.delete_report(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM report r WHERE r.report_code = $1;
END;
$_$;
 -   DROP FUNCTION public.delete_report(integer);
       public       postgres    false    3    1            �            1255    65119    delete_roadmap(date, integer)    FUNCTION     �   CREATE FUNCTION public.delete_roadmap(date, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM roadmap r WHERE r.roadmap_date = $1 AND r.fleet_number = $2;
END;$_$;
 4   DROP FUNCTION public.delete_roadmap(date, integer);
       public       postgres    false    3    1            �            1255    65120    delete_service(integer)    FUNCTION     �   CREATE FUNCTION public.delete_service(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM service s WHERE s.service_code = $1;
END;
$_$;
 .   DROP FUNCTION public.delete_service(integer);
       public       postgres    false    3    1                       1255    65339 ,   drivers_worked_tour_group(character varying)    FUNCTION     l  CREATE FUNCTION public.drivers_worked_tour_group(tour_group character varying) RETURNS record
    LANGUAGE plpgsql
    AS $$
DECLARE drivers record;
BEGIN
	SELECT DISTINCT TID_Driver, driver_name INTO drivers
	FROM driver JOIN couple on driver.couple_code = couple.couple_code
	JOIN car ON couple.couple=car.couple_code
	JOIN roadmap ON car.fleet_number = roadmap.fleet_number
	JOIN relation_service_roadmap ON roadmap.fleet_number = relation_service_roadmap.fleet_number
	JOIN service ON relation_service_roadmap.service_code = service.service_code
	WHERE service.tour_group_code = tour_group;
	RETURN drivers;
END;$$;
 N   DROP FUNCTION public.drivers_worked_tour_group(tour_group character varying);
       public       postgres    false    3    1            �            1255    65121 M   insert_brand(character varying, integer, character varying, double precision)    FUNCTION     >  CREATE FUNCTION public.insert_brand(brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO brand (brand_name, amo_seats, fuel_type, spending) VALUES (brand_name, amo_seats, fuel_type, spending);
END;
$$;
 �   DROP FUNCTION public.insert_brand(brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision);
       public       postgres    false    3    1            �            1255    65122 9   insert_car(character varying, integer, character varying)    FUNCTION       CREATE FUNCTION public.insert_car(plate character varying, couple_code integer, brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO car (plate, couple_code, brand_name) VALUES (plate, couple_code, brand_name);
END;
$$;
 m   DROP FUNCTION public.insert_car(plate character varying, couple_code integer, brand_name character varying);
       public       postgres    false    3    1            �            1255    65123 n   insert_contract(character varying, date, date, double precision, double precision, character varying, integer)    FUNCTION     
  CREATE FUNCTION public.insert_contract(applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO contract (applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number) VALUES (applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number);
END;
$$;
 �   DROP FUNCTION public.insert_contract(applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer);
       public       postgres    false    3    1            �            1255    65124 <   insert_couple(integer, character varying, character varying)    FUNCTION     �   CREATE FUNCTION public.insert_couple(couple_code integer, id1 character varying, id2 character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO couple (couple_code, driver_1, driver_2) VALUES (couple_code, ID1, ID2);
END;
$$;
 g   DROP FUNCTION public.insert_couple(couple_code integer, id1 character varying, id2 character varying);
       public       postgres    false    3    1            �            1255    65125 �   insert_discrepancy(date, integer, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION     R  CREATE FUNCTION public.insert_discrepancy(month_code date, fleet_number integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO discrepancy (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel) VALUES (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel);
END;
$$;
   DROP FUNCTION public.insert_discrepancy(month_code date, fleet_number integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision);
       public       postgres    false    1    3            �            1255    65126 "   insert_district(character varying)    FUNCTION     �   CREATE FUNCTION public.insert_district(district_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO district (district_name) VALUES (district_name);
END;
$$;
 G   DROP FUNCTION public.insert_district(district_name character varying);
       public       postgres    false    1    3            �            1255    65127 ~   insert_driver(character varying, character varying, character varying, character varying, integer, boolean, character varying)    FUNCTION     <  CREATE FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, is_free_cover boolean, brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO driver (ID_Driver, driver_name, address, phone, district_code, is_free_cover) VALUES (ID_Driver, driver_name, address, phone, district_code, is_free_cover);
  IF(is_free_cover)THEN
   INSERT INTO free_cover (id_Driver, brand_name) VALUES (ID_Driver, brand_name);
  END IF;  
END;$$;
 �   DROP FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, is_free_cover boolean, brand_name character varying);
       public       postgres    false    1    3            �            1255    65128 �   insert_driver(character varying, character varying, character varying, character varying, integer, character varying, character varying)    FUNCTION     8  CREATE FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, type_of_driver character varying, brand_name character varying) RETURNS void
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
       public       postgres    false    1    3            �            1255    65129    insert_month(date, integer)    FUNCTION     �   CREATE FUNCTION public.insert_month(month_code date, report_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO months (month_code, report_code) VALUES (month_code, report_code);
END;
$$;
 I   DROP FUNCTION public.insert_month(month_code date, report_code integer);
       public       postgres    false    1    3            �            1255    65130 7   insert_relation_service_roadmap(integer, date, integer)    FUNCTION     1  CREATE FUNCTION public.insert_relation_service_roadmap(service_code integer, roadmap_date date, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO relation_service_roadmap (service_code,roadmap_date,fleet_number) VALUES (service_code,roadmap_date,fleet_number);
END; $$;
 u   DROP FUNCTION public.insert_relation_service_roadmap(service_code integer, roadmap_date date, fleet_number integer);
       public       postgres    false    3    1            �            1255    65131 ^   insert_report(integer, integer, double precision, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.insert_report(amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO report (amo_services, amo_rents, income_rents, amo_others, income_others, income_total) VALUES (amo_services, amo_rents, income_rents, amo_others, income_others, income_total);
END;
$$;
 �   DROP FUNCTION public.insert_report(amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision);
       public       postgres    false    3    1            �            1255    65132 G   insert_roadmap(date, integer, double precision, time without time zone)    FUNCTION     4  CREATE FUNCTION public.insert_roadmap(date, fleet_number integer, kms double precision, departure_time time without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
  INSERT INTO roadmap (roadmap_date, fleet_number, kms, departure_time) VALUES ($1, fleet_number, kms, departure_time);
END;
$_$;
 ~   DROP FUNCTION public.insert_roadmap(date, fleet_number integer, kms double precision, departure_time time without time zone);
       public       postgres    false    3    1            �            1255    65133 �   insert_service(character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision)    FUNCTION     c  CREATE FUNCTION public.insert_service(service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO service (service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount) VALUES (service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount);
END;
$$;
 -  DROP FUNCTION public.insert_service(service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision);
       public       postgres    false    3    1            �            1255    65134     prevent_delete_brand_with_cars()    FUNCTION     >  CREATE FUNCTION public.prevent_delete_brand_with_cars() RETURNS trigger
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
       public       postgres    false    1    3                        1255    65135 `   update_brand(character varying, character varying, integer, character varying, double precision)    FUNCTION       CREATE FUNCTION public.update_brand(character varying, character varying, integer, character varying, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE brand SET brand_name = $2, amo_seats = $3, fuel_type = $4, spending = $5 WHERE brand_name = $1;
END;
$_$;
 w   DROP FUNCTION public.update_brand(character varying, character varying, integer, character varying, double precision);
       public       postgres    false    3    1                       1255    65136 B   update_car(integer, character varying, character varying, integer)    FUNCTION     �   CREATE FUNCTION public.update_car(integer, character varying, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE car  SET plate = $2, couple_code = $4, brand_name = $3 WHERE fleet_number = $1;
END;
$_$;
 Y   DROP FUNCTION public.update_car(integer, character varying, character varying, integer);
       public       postgres    false    1    3                       1255    65137 w   update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE contract SET applicant_name = $2, start_date = $3, end_date = $4, contract_kms = $5, contract_amount = $6, countrac_country = $8, fleet_number = $9 WHERE contract_code = $1;
END;
$_$;
 �   DROP FUNCTION public.update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer);
       public       postgres    false    3    1                       1255    65138 E   update_couple(integer, integer, character varying, character varying)    FUNCTION     �   CREATE FUNCTION public.update_couple(integer, integer, character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE couple SET couple_code = $2, driver_1 = $3, driver_2 = $4 WHERE couple_code = $1;
END;
$_$;
 \   DROP FUNCTION public.update_couple(integer, integer, character varying, character varying);
       public       postgres    false    1    3                       1255    65139 �   update_discrepancy(date, integer, date, integer, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_discrepancy(date, integer, date, integer, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE discrepancy SET month_code = $3, fleet_number = $4, planned_kms = $5, tours_kms = $6, difference_kms = $7, planned_fuel = $8, consumed_fuel = $9, dif_spending_fuel = $10 WHERE month_code = $1 AND fleet_number = $2;
END;
$_$;
 �   DROP FUNCTION public.update_discrepancy(date, integer, date, integer, double precision, double precision, double precision, double precision, double precision, double precision);
       public       postgres    false    1    3                       1255    65140 +   update_district(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.update_district(integer, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE district SET distric_name=$2 WHERE district_code = $1;
END;
$_$;
 B   DROP FUNCTION public.update_district(integer, character varying);
       public       postgres    false    3    1                       1255    65141 �   update_driver(character varying, character varying, character varying, character varying, character varying, integer, boolean, character varying)    FUNCTION     �  CREATE FUNCTION public.update_driver(character varying, character varying, character varying, character varying, character varying, integer, boolean, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN 
	UPDATE driver SET ID_Driver = $2, driver_name = $3, address = $4, phone = $5, district_code = $6, is_free_cover = $7 WHERE  ID_Driver = $1;
	IF($7)THEN
		UPDATE free_cover SET brand_name = $8 WHERE  id_Driver = $2;
	END IF;	
END;
$_$;
 �   DROP FUNCTION public.update_driver(character varying, character varying, character varying, character varying, character varying, integer, boolean, character varying);
       public       postgres    false    3    1            �            1255    65142    update_income_total()    FUNCTION     �   CREATE FUNCTION public.update_income_total() RETURNS trigger
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
       public       postgres    false    3    1                       1255    65143 !   update_month(date, date, integer)    FUNCTION     �   CREATE FUNCTION public.update_month(date, date, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE months SET month_code = $2, report_code = $3 WHERE month_code=$1;
END;
$_$;
 8   DROP FUNCTION public.update_month(date, date, integer);
       public       postgres    false    1    3                       1255    65144 g   update_report(integer, integer, integer, double precision, integer, double precision, double precision)    FUNCTION     T  CREATE FUNCTION public.update_report(integer, integer, integer, double precision, integer, double precision, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE report SET amo_services = $2, amo_rents = $3, income_rents = $4, amo_others = $5, income_others = $6, income_total = $7 WHERE report_code = $1;
END;
$_$;
 ~   DROP FUNCTION public.update_report(integer, integer, integer, double precision, integer, double precision, double precision);
       public       postgres    false    3    1                       1255    65145 V   update_roadmap(date, date, integer, integer, double precision, time without time zone)    FUNCTION     2  CREATE FUNCTION public.update_roadmap(date, date, integer, integer, double precision, time without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE roadmap SET roadmap_date = $2, fleet_number = $4, kms = $5, departure_time = $6 WHERE roadmap_date = $1 AND fleet_number = $3;
END;
$_$;
 m   DROP FUNCTION public.update_roadmap(date, date, integer, integer, double precision, time without time zone);
       public       postgres    false    1    3                       1255    65146 �   update_service(integer, character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_service(integer, character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE service SET service_name = $2, request_number = $3, tour_group_code = $4, country = $5, pickup_place = $6, pickup_time = $7, pax = $8, service_kms = $9, amount = $10 WHERE service_code = $1;
END;
$_$;
 �   DROP FUNCTION public.update_service(integer, character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision);
       public       postgres    false    1    3            	           1255    65147    validate_contract_dates()    FUNCTION       CREATE FUNCTION public.validate_contract_dates() RETURNS trigger
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
       public       postgres    false    1    3            
           1255    65148    validate_district_code()    FUNCTION       CREATE FUNCTION public.validate_district_code() RETURNS trigger
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
       public       postgres    false    1    3            �            1259    65149    car    TABLE     �   CREATE TABLE public.car (
    fleet_number integer NOT NULL,
    plate character varying,
    brand_name character varying,
    couple_code integer
);
    DROP TABLE public.car;
       public         postgres    false    3            �            1259    65155    Car_fleet_number_seq    SEQUENCE     �   CREATE SEQUENCE public."Car_fleet_number_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Car_fleet_number_seq";
       public       postgres    false    3    196            �           0    0    Car_fleet_number_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Car_fleet_number_seq" OWNED BY public.car.fleet_number;
            public       postgres    false    197            �            1259    65157    contract    TABLE       CREATE TABLE public.contract (
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
       public         postgres    false    3            �            1259    65163    Contract_contract_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Contract_contract_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Contract_contract_code_seq";
       public       postgres    false    3    198            �           0    0    Contract_contract_code_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Contract_contract_code_seq" OWNED BY public.contract.contract_code;
            public       postgres    false    199            �            1259    65165    couple    TABLE     �   CREATE TABLE public.couple (
    couple_code integer NOT NULL,
    driver_1 character varying,
    driver_2 character varying
);
    DROP TABLE public.couple;
       public         postgres    false    3            �            1259    65171    Couple_couple_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Couple_couple_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Couple_couple_code_seq";
       public       postgres    false    3    200            �           0    0    Couple_couple_code_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Couple_couple_code_seq" OWNED BY public.couple.couple_code;
            public       postgres    false    201            �            1259    65173    district    TABLE     j   CREATE TABLE public.district (
    district_code integer NOT NULL,
    district_name character varying
);
    DROP TABLE public.district;
       public         postgres    false    3            �            1259    65179    District_district_code_seq    SEQUENCE     �   CREATE SEQUENCE public."District_district_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."District_district_code_seq";
       public       postgres    false    3    202            �           0    0    District_district_code_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."District_district_code_seq" OWNED BY public.district.district_code;
            public       postgres    false    203            �            1259    65181    report    TABLE     �   CREATE TABLE public.report (
    report_code integer NOT NULL,
    amo_services integer,
    amo_rents integer,
    income_rents double precision,
    amo_others integer,
    income_others double precision,
    income_total double precision
);
    DROP TABLE public.report;
       public         postgres    false    3            �            1259    65184    Report_report_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Report_report_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Report_report_code_seq";
       public       postgres    false    204    3            �           0    0    Report_report_code_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Report_report_code_seq" OWNED BY public.report.report_code;
            public       postgres    false    205            �            1259    65186    service    TABLE     o  CREATE TABLE public.service (
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
       public         postgres    false    3            �            1259    65192    Service_service_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Service_service_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Service_service_code_seq";
       public       postgres    false    206    3            �           0    0    Service_service_code_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Service_service_code_seq" OWNED BY public.service.service_code;
            public       postgres    false    207            �            1259    65194    brand    TABLE     �   CREATE TABLE public.brand (
    brand_name character varying NOT NULL,
    amo_seats integer,
    fuel_type character varying,
    spending double precision
);
    DROP TABLE public.brand;
       public         postgres    false    3            �            1259    65200    discrepancy    TABLE     ;  CREATE TABLE public.discrepancy (
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
       public         postgres    false    3            �            1259    65203    driver    TABLE     �   CREATE TABLE public.driver (
    "ID_Driver" character varying NOT NULL,
    driver_name character varying,
    address character varying,
    phone character varying,
    distric_code integer,
    is_free_cover boolean
);
    DROP TABLE public.driver;
       public         postgres    false    3            �            1259    65209 
   free_cover    TABLE     z   CREATE TABLE public.free_cover (
    "id_Driver" character varying NOT NULL,
    brand_name character varying NOT NULL
);
    DROP TABLE public.free_cover;
       public         postgres    false    3            �            1259    65215    months    TABLE     V   CREATE TABLE public.months (
    report_code integer,
    month_code date NOT NULL
);
    DROP TABLE public.months;
       public         postgres    false    3            �            1259    65218    relation_service_roadmap    TABLE     �   CREATE TABLE public.relation_service_roadmap (
    service_code integer NOT NULL,
    roadmap_date date NOT NULL,
    fleet_number integer NOT NULL
);
 ,   DROP TABLE public.relation_service_roadmap;
       public         postgres    false    3            �            1259    65221    roadmap    TABLE     �   CREATE TABLE public.roadmap (
    roadmap_date date NOT NULL,
    fleet_number integer NOT NULL,
    kms double precision,
    departure_time time without time zone
);
    DROP TABLE public.roadmap;
       public         postgres    false    3            �
           2604    65224    car fleet_number    DEFAULT     v   ALTER TABLE ONLY public.car ALTER COLUMN fleet_number SET DEFAULT nextval('public."Car_fleet_number_seq"'::regclass);
 ?   ALTER TABLE public.car ALTER COLUMN fleet_number DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    65225    contract contract_code    DEFAULT     �   ALTER TABLE ONLY public.contract ALTER COLUMN contract_code SET DEFAULT nextval('public."Contract_contract_code_seq"'::regclass);
 E   ALTER TABLE public.contract ALTER COLUMN contract_code DROP DEFAULT;
       public       postgres    false    199    198            �
           2604    65226    district district_code    DEFAULT     �   ALTER TABLE ONLY public.district ALTER COLUMN district_code SET DEFAULT nextval('public."District_district_code_seq"'::regclass);
 E   ALTER TABLE public.district ALTER COLUMN district_code DROP DEFAULT;
       public       postgres    false    203    202            �
           2604    65227    report report_code    DEFAULT     z   ALTER TABLE ONLY public.report ALTER COLUMN report_code SET DEFAULT nextval('public."Report_report_code_seq"'::regclass);
 A   ALTER TABLE public.report ALTER COLUMN report_code DROP DEFAULT;
       public       postgres    false    205    204            �
           2604    65228    service service_code    DEFAULT     ~   ALTER TABLE ONLY public.service ALTER COLUMN service_code SET DEFAULT nextval('public."Service_service_code_seq"'::regclass);
 C   ALTER TABLE public.service ALTER COLUMN service_code DROP DEFAULT;
       public       postgres    false    207    206            �          0    65194    brand 
   TABLE DATA               K   COPY public.brand (brand_name, amo_seats, fuel_type, spending) FROM stdin;
    public       postgres    false    208   z�       �          0    65149    car 
   TABLE DATA               K   COPY public.car (fleet_number, plate, brand_name, couple_code) FROM stdin;
    public       postgres    false    196   ��       �          0    65157    contract 
   TABLE DATA               �   COPY public.contract (contract_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number) FROM stdin;
    public       postgres    false    198   ��       �          0    65165    couple 
   TABLE DATA               A   COPY public.couple (couple_code, driver_1, driver_2) FROM stdin;
    public       postgres    false    200   ��       �          0    65200    discrepancy 
   TABLE DATA               �   COPY public.discrepancy (fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel, month_code) FROM stdin;
    public       postgres    false    209   ��       �          0    65173    district 
   TABLE DATA               @   COPY public.district (district_code, district_name) FROM stdin;
    public       postgres    false    202   �       �          0    65203    driver 
   TABLE DATA               g   COPY public.driver ("ID_Driver", driver_name, address, phone, distric_code, is_free_cover) FROM stdin;
    public       postgres    false    210   (�       �          0    65209 
   free_cover 
   TABLE DATA               =   COPY public.free_cover ("id_Driver", brand_name) FROM stdin;
    public       postgres    false    211   E�       �          0    65215    months 
   TABLE DATA               9   COPY public.months (report_code, month_code) FROM stdin;
    public       postgres    false    212   b�       �          0    65218    relation_service_roadmap 
   TABLE DATA               \   COPY public.relation_service_roadmap (service_code, roadmap_date, fleet_number) FROM stdin;
    public       postgres    false    213   �       �          0    65181    report 
   TABLE DATA               }   COPY public.report (report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total) FROM stdin;
    public       postgres    false    204   ��       �          0    65221    roadmap 
   TABLE DATA               R   COPY public.roadmap (roadmap_date, fleet_number, kms, departure_time) FROM stdin;
    public       postgres    false    214   ��       �          0    65186    service 
   TABLE DATA               �   COPY public.service (service_code, service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount) FROM stdin;
    public       postgres    false    206   ��       �           0    0    Car_fleet_number_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Car_fleet_number_seq"', 1, false);
            public       postgres    false    197            �           0    0    Contract_contract_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Contract_contract_code_seq"', 1, false);
            public       postgres    false    199            �           0    0    Couple_couple_code_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Couple_couple_code_seq"', 1, false);
            public       postgres    false    201            �           0    0    District_district_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."District_district_code_seq"', 1, false);
            public       postgres    false    203            �           0    0    Report_report_code_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Report_report_code_seq"', 1, false);
            public       postgres    false    205            �           0    0    Service_service_code_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Service_service_code_seq"', 1, false);
            public       postgres    false    207            �
           2606    65230    brand Brand_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (brand_name);
 <   ALTER TABLE ONLY public.brand DROP CONSTRAINT "Brand_pkey";
       public         postgres    false    208            �
           2606    65232    car Car_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.car
    ADD CONSTRAINT "Car_pkey" PRIMARY KEY (fleet_number);
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT "Car_pkey";
       public         postgres    false    196            �
           2606    65234    contract Contract_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT "Contract_pkey" PRIMARY KEY (contract_code);
 B   ALTER TABLE ONLY public.contract DROP CONSTRAINT "Contract_pkey";
       public         postgres    false    198            �
           2606    65236    couple Couple_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT "Couple_pkey" PRIMARY KEY (couple_code);
 >   ALTER TABLE ONLY public.couple DROP CONSTRAINT "Couple_pkey";
       public         postgres    false    200            �
           2606    65238    district District_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.district
    ADD CONSTRAINT "District_pkey" PRIMARY KEY (district_code);
 B   ALTER TABLE ONLY public.district DROP CONSTRAINT "District_pkey";
       public         postgres    false    202            �
           2606    65240    driver Driver_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT "Driver_pkey" PRIMARY KEY ("ID_Driver");
 >   ALTER TABLE ONLY public.driver DROP CONSTRAINT "Driver_pkey";
       public         postgres    false    210            �
           2606    65242    report Report_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.report
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY (report_code);
 >   ALTER TABLE ONLY public.report DROP CONSTRAINT "Report_pkey";
       public         postgres    false    204                        2606    65244    roadmap Roadmap_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.roadmap
    ADD CONSTRAINT "Roadmap_pkey" PRIMARY KEY (roadmap_date, fleet_number);
 @   ALTER TABLE ONLY public.roadmap DROP CONSTRAINT "Roadmap_pkey";
       public         postgres    false    214    214            �
           2606    65246    service Service_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.service
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY (service_code);
 @   ALTER TABLE ONLY public.service DROP CONSTRAINT "Service_pkey";
       public         postgres    false    206            �
           2606    65248    discrepancy discrepancy_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT discrepancy_pkey PRIMARY KEY (month_code, fleet_number);
 F   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT discrepancy_pkey;
       public         postgres    false    209    209            �
           2606    65250    free_cover free_cover_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT free_cover_pkey PRIMARY KEY ("id_Driver");
 D   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT free_cover_pkey;
       public         postgres    false    211            �
           2606    65252    months months_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.months
    ADD CONSTRAINT months_pkey PRIMARY KEY (month_code);
 <   ALTER TABLE ONLY public.months DROP CONSTRAINT months_pkey;
       public         postgres    false    212            �
           2606    65254 6   relation_service_roadmap relation_service_roadmap_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT relation_service_roadmap_pkey PRIMARY KEY (service_code, roadmap_date, fleet_number);
 `   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT relation_service_roadmap_pkey;
       public         postgres    false    213    213    213            �
           1259    65255    fki_brand_name    INDEX     D   CREATE INDEX fki_brand_name ON public.car USING btree (brand_name);
 "   DROP INDEX public.fki_brand_name;
       public         postgres    false    196            �
           1259    65256    fki_distric_code    INDEX     K   CREATE INDEX fki_distric_code ON public.driver USING btree (distric_code);
 $   DROP INDEX public.fki_distric_code;
       public         postgres    false    210            �
           1259    65257    fki_driver_1    INDEX     C   CREATE INDEX fki_driver_1 ON public.couple USING btree (driver_1);
     DROP INDEX public.fki_driver_1;
       public         postgres    false    200            �
           1259    65258    fki_driver_2    INDEX     C   CREATE INDEX fki_driver_2 ON public.couple USING btree (driver_2);
     DROP INDEX public.fki_driver_2;
       public         postgres    false    200            �
           1259    65259    fki_fleet_number    INDEX     P   CREATE INDEX fki_fleet_number ON public.discrepancy USING btree (fleet_number);
 $   DROP INDEX public.fki_fleet_number;
       public         postgres    false    209            �
           1259    65260    fki_month_code    INDEX     L   CREATE INDEX fki_month_code ON public.discrepancy USING btree (month_code);
 "   DROP INDEX public.fki_month_code;
       public         postgres    false    209            �
           1259    65261    fki_service_code    INDEX     ]   CREATE INDEX fki_service_code ON public.relation_service_roadmap USING btree (service_code);
 $   DROP INDEX public.fki_service_code;
       public         postgres    false    213                       2620    65262    driver check_district_code    TRIGGER     �   CREATE TRIGGER check_district_code BEFORE INSERT OR UPDATE ON public.driver FOR EACH ROW EXECUTE PROCEDURE public.validate_district_code();
 3   DROP TRIGGER check_district_code ON public.driver;
       public       postgres    false    266    210                       2620    65263    contract contract_dates_trigger    TRIGGER     �   CREATE TRIGGER contract_dates_trigger BEFORE INSERT OR UPDATE ON public.contract FOR EACH ROW EXECUTE PROCEDURE public.validate_contract_dates();
 8   DROP TRIGGER contract_dates_trigger ON public.contract;
       public       postgres    false    198    265                       2620    65264 $   brand prevent_delete_brand_with_cars    TRIGGER     �   CREATE TRIGGER prevent_delete_brand_with_cars BEFORE DELETE ON public.brand FOR EACH ROW EXECUTE PROCEDURE public.prevent_delete_brand_with_cars();
 =   DROP TRIGGER prevent_delete_brand_with_cars ON public.brand;
       public       postgres    false    254    208                       2620    65265    car prevent_vehicle_delete    TRIGGER     �   CREATE TRIGGER prevent_vehicle_delete BEFORE DELETE ON public.car FOR EACH ROW EXECUTE PROCEDURE public.check_vehicle_delete();
 3   DROP TRIGGER prevent_vehicle_delete ON public.car;
       public       postgres    false    217    196                       2620    65266     driver update_free_cover_trigger    TRIGGER     �   CREATE TRIGGER update_free_cover_trigger AFTER UPDATE OF is_free_cover ON public.driver FOR EACH ROW EXECUTE PROCEDURE public.check_update_driver();
 9   DROP TRIGGER update_free_cover_trigger ON public.driver;
       public       postgres    false    210    215    210                       2620    65267 "   report update_income_total_trigger    TRIGGER     �   CREATE TRIGGER update_income_total_trigger AFTER INSERT OR UPDATE OF income_rents, income_others ON public.report FOR EACH ROW EXECUTE PROCEDURE public.update_income_total();
 ;   DROP TRIGGER update_income_total_trigger ON public.report;
       public       postgres    false    204    204    255    204                       2606    65268    car brand_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT brand_name FOREIGN KEY (brand_name) REFERENCES public.brand(brand_name) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT brand_name;
       public       postgres    false    196    208    2800            	           2606    65273    free_cover brand_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT brand_name FOREIGN KEY (brand_name) REFERENCES public.brand(brand_name) ON UPDATE CASCADE ON DELETE SET NULL;
 ?   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT brand_name;
       public       postgres    false    2800    211    208                       2606    65278    car couple_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT couple_code FOREIGN KEY (couple_code) REFERENCES public.couple(couple_code) NOT VALID;
 9   ALTER TABLE ONLY public.car DROP CONSTRAINT couple_code;
       public       postgres    false    196    200    2790                       2606    65283    driver distric_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT distric_code FOREIGN KEY (distric_code) REFERENCES public.district(district_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 =   ALTER TABLE ONLY public.driver DROP CONSTRAINT distric_code;
       public       postgres    false    202    210    2794                       2606    65288    couple driver_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT driver_1 FOREIGN KEY (driver_1) REFERENCES public.driver("ID_Driver") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.couple DROP CONSTRAINT driver_1;
       public       postgres    false    200    210    2806                       2606    65293    couple driver_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT driver_2 FOREIGN KEY (driver_2) REFERENCES public.driver("ID_Driver") ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.couple DROP CONSTRAINT driver_2;
       public       postgres    false    210    2806    200                       2606    65298    contract fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.contract DROP CONSTRAINT fleet_number;
       public       postgres    false    196    198    2785                       2606    65303    discrepancy fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 B   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT fleet_number;
       public       postgres    false    2785    196    209                       2606    65308    roadmap fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.roadmap
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.roadmap DROP CONSTRAINT fleet_number;
       public       postgres    false    196    214    2785            
           2606    65313    free_cover id_Driver    FK CONSTRAINT     �   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT "id_Driver" FOREIGN KEY ("id_Driver") REFERENCES public.driver("ID_Driver") ON UPDATE CASCADE ON DELETE CASCADE;
 @   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT "id_Driver";
       public       postgres    false    2806    211    210                       2606    65318    discrepancy month_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT month_code FOREIGN KEY (month_code) REFERENCES public.months(month_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 @   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT month_code;
       public       postgres    false    212    2811    209                       2606    65323    months report_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.months
    ADD CONSTRAINT report_code FOREIGN KEY (report_code) REFERENCES public.report(report_code) NOT VALID;
 <   ALTER TABLE ONLY public.months DROP CONSTRAINT report_code;
       public       postgres    false    2796    212    204                       2606    65328 $   relation_service_roadmap roadmap_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT roadmap_key FOREIGN KEY (roadmap_date, fleet_number) REFERENCES public.roadmap(roadmap_date, fleet_number) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT roadmap_key;
       public       postgres    false    2816    214    214    213    213                       2606    65333 %   relation_service_roadmap service_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT service_code FOREIGN KEY (service_code) REFERENCES public.service(service_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT service_code;
       public       postgres    false    213    206    2798            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     