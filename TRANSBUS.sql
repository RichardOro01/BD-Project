PGDMP         :                {           transbus    15.1    15.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    transbus    DATABASE     z   CREATE DATABASE transbus WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Cuba.1252';
    DROP DATABASE transbus;
                postgres    false                        1255    24717    check_duplicate_couple()    FUNCTION     �  CREATE FUNCTION public.check_duplicate_couple() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    -- Verificar si la pareja ya existe en alguna orientación
    IF EXISTS (SELECT 1 FROM couple WHERE driver_1 = NEW.driver_1 AND driver_2 = NEW.driver_2) OR
       EXISTS (SELECT 1 FROM couple WHERE driver_1 = NEW.driver_2 AND driver_2 = NEW.driver_1) THEN
        RAISE EXCEPTION 'The couple already exists in the couple table.';
    END IF;
    
    RETURN NEW;
END;
$$;
 /   DROP FUNCTION public.check_duplicate_couple();
       public          postgres    false            *           1255    16400    check_vehicle_delete()    FUNCTION     �  CREATE FUNCTION public.check_vehicle_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM discrepancy WHERE discrepancy.car_code = OLD.car_code) THEN
        RAISE EXCEPTION 'Cannot delete vehicle. It has discrepancies associated with it.';
    END IF;
    
    IF EXISTS (SELECT 1 FROM roadmap WHERE roadmap.car_code = OLD.car_code) THEN
        RAISE EXCEPTION 'Cannot delete vehicle. It has roadmaps associated with it.';
    END IF;

    RETURN OLD;
END;
$$;
 -   DROP FUNCTION public.check_vehicle_delete();
       public          postgres    false                       1255    24598    delete_brand(integer)    FUNCTION     �   CREATE FUNCTION public.delete_brand(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM brand b WHERE b.brand_code = $1;
END;
$_$;
 ,   DROP FUNCTION public.delete_brand(integer);
       public          postgres    false            �            1255    16402    delete_car(integer)    FUNCTION     �   CREATE FUNCTION public.delete_car(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM car WHERE car.car_code = $1;
END;
$_$;
 *   DROP FUNCTION public.delete_car(integer);
       public          postgres    false            �            1255    16403    delete_contract(integer)    FUNCTION     �   CREATE FUNCTION public.delete_contract(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM contract WHERE contract.contract_code = $1;
END;
$_$;
 /   DROP FUNCTION public.delete_contract(integer);
       public          postgres    false            �            1255    16404    delete_couple(integer)    FUNCTION     �   CREATE FUNCTION public.delete_couple(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM couple WHERE couple.couple_code = $1;
END;
$_$;
 -   DROP FUNCTION public.delete_couple(integer);
       public          postgres    false            �            1255    16405 $   delete_discrepency(integer, integer)    FUNCTION     �   CREATE FUNCTION public.delete_discrepency(integer, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM discrepancy d WHERE d.month_code = $1 AND d.fleet_number = $2 ;
END;
$_$;
 ;   DROP FUNCTION public.delete_discrepency(integer, integer);
       public          postgres    false            �            1255    16406    delete_district(integer)    FUNCTION     �   CREATE FUNCTION public.delete_district(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM district d WHERE d.distric_code = $1;
END;
$_$;
 /   DROP FUNCTION public.delete_district(integer);
       public          postgres    false                       1255    24655    delete_driver(integer)    FUNCTION     �   CREATE FUNCTION public.delete_driver(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM driver d WHERE d.driver_code = $1;
END;
$_$;
 -   DROP FUNCTION public.delete_driver(integer);
       public          postgres    false            �            1255    16408    delete_month(date)    FUNCTION     �   CREATE FUNCTION public.delete_month(date) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN 
	DELETE FROM months WHERE months.month_code = date;
END;
$$;
 )   DROP FUNCTION public.delete_month(date);
       public          postgres    false            �            1255    16409 7   delete_relation_service_roadmap(integer, date, integer)    FUNCTION     	  CREATE FUNCTION public.delete_relation_service_roadmap(integer, date, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM relation_service_roadmap WHERE r_s_r.service_code = $1 AND r_s_r.roadmap_date = $2 AND r_s_r.fleet_number = $3;
END;
$_$;
 N   DROP FUNCTION public.delete_relation_service_roadmap(integer, date, integer);
       public          postgres    false            �            1255    16410    delete_report(integer)    FUNCTION     �   CREATE FUNCTION public.delete_report(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM report r WHERE r.report_code = $1;
END;
$_$;
 -   DROP FUNCTION public.delete_report(integer);
       public          postgres    false            �            1255    16411    delete_roadmap(date, integer)    FUNCTION     �   CREATE FUNCTION public.delete_roadmap(date, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM roadmap r WHERE r.roadmap_date = $1 AND r.fleet_number = $2;
END;$_$;
 4   DROP FUNCTION public.delete_roadmap(date, integer);
       public          postgres    false                       1255    25057    delete_role(integer)    FUNCTION     �   CREATE FUNCTION public.delete_role(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM role WHERE role_code = $1;
END;$_$;
 +   DROP FUNCTION public.delete_role(integer);
       public          postgres    false                        1255    16412    delete_service(integer)    FUNCTION     �   CREATE FUNCTION public.delete_service(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM service s WHERE s.service_code = $1;
END;
$_$;
 .   DROP FUNCTION public.delete_service(integer);
       public          postgres    false                       1255    25054    delete_user(integer)    FUNCTION     �   CREATE FUNCTION public.delete_user(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM users WHERE id = $1;
END;$_$;
 +   DROP FUNCTION public.delete_user(integer);
       public          postgres    false                       1255    16413 ,   drivers_worked_tour_group(character varying)    FUNCTION     n  CREATE FUNCTION public.drivers_worked_tour_group(tour_group character varying) RETURNS refcursor
    LANGUAGE plpgsql
    AS $$
DECLARE drivers refcursor;
BEGIN
	OPEN drivers FOR
		SELECT DISTINCT id_driver, driver_name
		FROM driver JOIN couple on driver.couple_code = couple.couple_code
		JOIN car ON couple.couple=car.couple_code
		JOIN roadmap ON car.car_code = roadmap.car_code
		JOIN relation_service_roadmap ON roadmap.car_code = relation_service_roadmap.car_code
		JOIN service ON relation_service_roadmap.service_code = service.service_code
		WHERE service.tour_group_code = tour_group;
	RETURN drivers;
END;
$$;
 N   DROP FUNCTION public.drivers_worked_tour_group(tour_group character varying);
       public          postgres    false            ,           1255    25252 C   insert_brand(character varying, integer, integer, double precision)    FUNCTION     4  CREATE FUNCTION public.insert_brand(brand_name character varying, amo_seats integer, fuel_code integer, spending double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO brand (brand_name, amo_seats, fuel_code, spending) VALUES (brand_name, amo_seats, fuel_code, spending);
END;
$$;
 �   DROP FUNCTION public.insert_brand(brand_name character varying, amo_seats integer, fuel_code integer, spending double precision);
       public          postgres    false            -           1255    25253 8   insert_car(integer, character varying, integer, integer)    FUNCTION     -  CREATE FUNCTION public.insert_car(fleet_number integer, plate character varying, couple_code integer, brand_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO car (fleet_number, plate, couple_code, brand_code) VALUES (fleet_number, plate, couple_code, brand_code);
END;
$$;
 y   DROP FUNCTION public.insert_car(fleet_number integer, plate character varying, couple_code integer, brand_code integer);
       public          postgres    false            $           1255    25254 n   insert_contract(character varying, date, date, double precision, double precision, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.insert_contract(applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, car_coder integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO contract (applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, car_code) VALUES (applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, car_code);
END;
$$;
 �   DROP FUNCTION public.insert_contract(applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, car_coder integer);
       public          postgres    false                       1255    25167 (   insert_couple(integer, integer, integer)    FUNCTION     �   CREATE FUNCTION public.insert_couple(couple_code integer, id1 integer, id2 integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO couple (couple_code, driver_1, driver_2) VALUES (couple_code, id1, id2);
END;
$$;
 S   DROP FUNCTION public.insert_couple(couple_code integer, id1 integer, id2 integer);
       public          postgres    false            %           1255    25255 �   insert_discrepancy(date, integer, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION     F  CREATE FUNCTION public.insert_discrepancy(month_code date, car_code integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO discrepancy (month_code, car_code, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel) VALUES (month_code, car_code, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel);
END;
$$;
 
  DROP FUNCTION public.insert_discrepancy(month_code date, car_code integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision);
       public          postgres    false                       1255    16419 "   insert_district(character varying)    FUNCTION     �   CREATE FUNCTION public.insert_district(district_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO district (district_name) VALUES (district_name);
END;
$$;
 G   DROP FUNCTION public.insert_district(district_name character varying);
       public          postgres    false            +           1255    25251 t   insert_driver(character varying, character varying, character varying, character varying, integer, boolean, integer)    FUNCTION     p  CREATE FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, is_free_cover boolean, brand_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE new_code integer;
BEGIN
  INSERT INTO driver (id_driver, driver_name, address, phone, district_code, is_free_cover) VALUES (ID_Driver, driver_name, address, phone, district_code, is_free_cover) RETURNING driver_code INTO new_code;
  IF(is_free_cover)THEN
   INSERT INTO free_cover (driver_code,brand_code) VALUES (new_code,brand_code);
  END IF;  
END;
$$;
 �   DROP FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, is_free_cover boolean, brand_code integer);
       public          postgres    false                       1255    16422    insert_month(date, integer)    FUNCTION     �   CREATE FUNCTION public.insert_month(month_code date, report_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO months (month_code, report_code) VALUES (month_code, report_code);
END;
$$;
 I   DROP FUNCTION public.insert_month(month_code date, report_code integer);
       public          postgres    false                       1255    16423 7   insert_relation_service_roadmap(integer, date, integer)    FUNCTION     1  CREATE FUNCTION public.insert_relation_service_roadmap(service_code integer, roadmap_date date, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO relation_service_roadmap (service_code,roadmap_date,fleet_number) VALUES (service_code,roadmap_date,fleet_number);
END; $$;
 u   DROP FUNCTION public.insert_relation_service_roadmap(service_code integer, roadmap_date date, fleet_number integer);
       public          postgres    false                       1255    16424 ^   insert_report(integer, integer, double precision, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.insert_report(amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO report (amo_services, amo_rents, income_rents, amo_others, income_others, income_total) VALUES (amo_services, amo_rents, income_rents, amo_others, income_others, income_total);
END;
$$;
 �   DROP FUNCTION public.insert_report(amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision);
       public          postgres    false            '           1255    25264 G   insert_roadmap(date, integer, double precision, time without time zone)    FUNCTION     (  CREATE FUNCTION public.insert_roadmap(date, car_code integer, kms double precision, departure_time time without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
  INSERT INTO roadmap (roadmap_date, car_code, kms, departure_time) VALUES ($1, car_code, kms, departure_time);
END;
$_$;
 z   DROP FUNCTION public.insert_roadmap(date, car_code integer, kms double precision, departure_time time without time zone);
       public          postgres    false            �            1255    25056    insert_role(character varying)    FUNCTION     �   CREATE FUNCTION public.insert_role(character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	INSERT INTO role (description) VALUES ($1); 
END;$_$;
 5   DROP FUNCTION public.insert_role(character varying);
       public          postgres    false            )           1255    25271 �   insert_service(character varying, integer, character varying, character varying, character varying, time without time zone, integer, double precision, double precision)    FUNCTION     h  CREATE FUNCTION public.insert_service(service_name character varying, request_number integer, tour_group_code character varying, country_code character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO service (service_name, request_number, tour_group_code, country_code, pickup_place, pickup_time, pax, service_kms, amount) VALUES (service_name, request_number, tour_group_code, country_code, pickup_place, pickup_time, pax, service_kms, amount);
END;
$$;
 (  DROP FUNCTION public.insert_service(service_name character varying, request_number integer, tour_group_code character varying, country_code character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision);
       public          postgres    false            �            1255    25055 V   insert_user(integer, character varying, character varying, character varying, integer)    FUNCTION       CREATE FUNCTION public.insert_user(integer, character varying, character varying, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE users SET username = $2, password = $3, name = $4, role_code = $5 WHERE id = $1;
END;$_$;
 m   DROP FUNCTION public.insert_user(integer, character varying, character varying, character varying, integer);
       public          postgres    false                       1255    16427     prevent_delete_brand_with_cars()    FUNCTION     >  CREATE FUNCTION public.prevent_delete_brand_with_cars() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (SELECT 1 FROM car WHERE brand_code = OLD.brand_code) THEN
        RAISE EXCEPTION 'This brand cannot be deleted because there are cars associated with it.';
    END IF;
    RETURN OLD;
END;
$$;
 7   DROP FUNCTION public.prevent_delete_brand_with_cars();
       public          postgres    false                       1255    16428    tour_countries()    FUNCTION     %  CREATE FUNCTION public.tour_countries() RETURNS refcursor
    LANGUAGE plpgsql
    AS $$
DECLARE countries refcursor ;
BEGIN
	OPEN countries FOR 
		SELECT country_code, count(*) as services
		FROM service
		GROUP BY country_code
		ORDER BY services DESC
		LIMIT 3;
	RETURN countries;
END;
$$;
 '   DROP FUNCTION public.tour_countries();
       public          postgres    false                       1255    16429 7   tourist_group_activities(character varying, date, date)    FUNCTION     �  CREATE FUNCTION public.tourist_group_activities(tour_group character varying, start_date date, end_date date) RETURNS refcursor
    LANGUAGE plpgsql
    AS $$
DECLARE services refcursor;
BEGIN
	OPEN services FOR
	SELECT s.service_name, s.pickup_time, s.amount
	FROM service s
	WHERE s.tour_group_code = tour_group
	AND s.pickup_time BETWEEN start_date AND end_date;
	RETURN services;
END;$$;
 m   DROP FUNCTION public.tourist_group_activities(tour_group character varying, start_date date, end_date date);
       public          postgres    false            !           1255    25112 L   update_brand(integer, character varying, integer, integer, double precision)    FUNCTION     	  CREATE FUNCTION public.update_brand(integer, character varying, integer, integer, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE brand SET brand_name = $2, amo_seats = $3, fuel_code = $4, spending = $5 WHERE brand_code = $1;
END;
$_$;
 c   DROP FUNCTION public.update_brand(integer, character varying, integer, integer, double precision);
       public          postgres    false            "           1255    25120 A   update_car(integer, integer, character varying, integer, integer)    FUNCTION     �   CREATE FUNCTION public.update_car(integer, integer, character varying, integer, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE car  SET fleet_number = $2, plate = $3, couple_code = $5, brand_code = $4 WHERE car_code = $1;
END;
$_$;
 X   DROP FUNCTION public.update_car(integer, integer, character varying, integer, integer);
       public          postgres    false                       1255    16432 w   update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer)    FUNCTION     ~  CREATE FUNCTION public.update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE contract SET applicant_name = $2, start_date = $3, end_date = $4, contract_kms = $5, contract_amount = $6, countrac_country = $8, car_code = $9 WHERE contract_code = $1;
END;
$_$;
 �   DROP FUNCTION public.update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer);
       public          postgres    false                       1255    25168 1   update_couple(integer, integer, integer, integer)    FUNCTION     �   CREATE FUNCTION public.update_couple(integer, integer, integer, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE couple SET couple_code = $2, driver_1 = $3, driver_2 = $4 WHERE couple_code = $1;
END;
$_$;
 H   DROP FUNCTION public.update_couple(integer, integer, integer, integer);
       public          postgres    false                       1255    16434 �   update_discrepancy(date, integer, date, integer, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_discrepancy(date, integer, date, integer, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE discrepancy SET month_code = $3, car_code = $4, planned_kms = $5, tours_kms = $6, difference_kms = $7, planned_fuel = $8, consumed_fuel = $9, dif_spending_fuel = $10 WHERE month_code = $1 AND car_code = $2;
END;
$_$;
 �   DROP FUNCTION public.update_discrepancy(date, integer, date, integer, double precision, double precision, double precision, double precision, double precision, double precision);
       public          postgres    false                       1255    16435 +   update_district(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.update_district(integer, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE district SET distric_name=$2 WHERE district_code = $1;
END;
$_$;
 B   DROP FUNCTION public.update_district(integer, character varying);
       public          postgres    false            &           1255    25201 }   update_driver(integer, character varying, character varying, character varying, character varying, integer, boolean, integer)    FUNCTION     �  CREATE FUNCTION public.update_driver(integer, character varying, character varying, character varying, character varying, integer, boolean, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN 
	UPDATE driver SET id_driver = $2, driver_name = $3, address = $4, phone = $5, district_code = $6, is_free_cover = $7 WHERE  driver_code = $1;
	IF($7)THEN
		UPDATE free_cover SET id_driver = $2, brand_name = $8 WHERE  driver_code = $1;
	END IF;	
END;
$_$;
 �   DROP FUNCTION public.update_driver(integer, character varying, character varying, character varying, character varying, integer, boolean, integer);
       public          postgres    false                       1255    16437    update_income_total()    FUNCTION     �   CREATE FUNCTION public.update_income_total() RETURNS trigger
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
       public          postgres    false                       1255    16438 !   update_month(date, date, integer)    FUNCTION     �   CREATE FUNCTION public.update_month(date, date, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE months SET month_code = $2, report_code = $3 WHERE month_code=$1;
END;
$_$;
 8   DROP FUNCTION public.update_month(date, date, integer);
       public          postgres    false            �            1255    16439 g   update_report(integer, integer, integer, double precision, integer, double precision, double precision)    FUNCTION     T  CREATE FUNCTION public.update_report(integer, integer, integer, double precision, integer, double precision, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE report SET amo_services = $2, amo_rents = $3, income_rents = $4, amo_others = $5, income_others = $6, income_total = $7 WHERE report_code = $1;
END;
$_$;
 ~   DROP FUNCTION public.update_report(integer, integer, integer, double precision, integer, double precision, double precision);
       public          postgres    false            (           1255    16440 V   update_roadmap(date, date, integer, integer, double precision, time without time zone)    FUNCTION     *  CREATE FUNCTION public.update_roadmap(date, date, integer, integer, double precision, time without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE roadmap SET roadmap_date = $2, car_code = $4, kms = $5, departure_time = $6 WHERE roadmap_date = $1 AND car_code = $3;
END;
$_$;
 m   DROP FUNCTION public.update_roadmap(date, date, integer, integer, double precision, time without time zone);
       public          postgres    false            #           1255    25122 �   update_service(integer, character varying, integer, character varying, character varying, character varying, time without time zone, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_service(integer, character varying, integer, character varying, character varying, character varying, time without time zone, integer, double precision, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE service SET service_name = $2, request_number = $3, tour_group_code = $4, country_code = $5, pickup_place = $6, pickup_time = $7, pax = $8, service_kms = $9, amount = $10 WHERE service_code = $1;
END;
$_$;
 �   DROP FUNCTION public.update_service(integer, character varying, integer, character varying, character varying, character varying, time without time zone, integer, double precision, double precision);
       public          postgres    false                       1255    16442    validate_contract_dates()    FUNCTION       CREATE FUNCTION public.validate_contract_dates() RETURNS trigger
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
       public          postgres    false            �            1259    16444    car    TABLE     �   CREATE TABLE public.car (
    fleet_number integer NOT NULL,
    plate character varying,
    couple_code integer,
    car_code integer NOT NULL,
    brand_code integer
);
    DROP TABLE public.car;
       public         heap    postgres    false            �            1259    16449    Car_fleet_number_seq    SEQUENCE     �   CREATE SEQUENCE public."Car_fleet_number_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Car_fleet_number_seq";
       public          postgres    false    214            �           0    0    Car_fleet_number_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Car_fleet_number_seq" OWNED BY public.car.fleet_number;
          public          postgres    false    215            �            1259    16450    contract    TABLE       CREATE TABLE public.contract (
    contract_code integer NOT NULL,
    applicant_name character varying,
    start_date date,
    end_date date,
    contract_kms double precision,
    contract_amount double precision,
    contract_country character varying,
    car_code integer
);
    DROP TABLE public.contract;
       public         heap    postgres    false            �            1259    16455    Contract_contract_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Contract_contract_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Contract_contract_code_seq";
       public          postgres    false    216            �           0    0    Contract_contract_code_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Contract_contract_code_seq" OWNED BY public.contract.contract_code;
          public          postgres    false    217            �            1259    16462    district    TABLE     j   CREATE TABLE public.district (
    district_code integer NOT NULL,
    district_name character varying
);
    DROP TABLE public.district;
       public         heap    postgres    false            �            1259    16467    District_district_code_seq    SEQUENCE     �   CREATE SEQUENCE public."District_district_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."District_district_code_seq";
       public          postgres    false    219            �           0    0    District_district_code_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."District_district_code_seq" OWNED BY public.district.district_code;
          public          postgres    false    220            �            1259    16468    report    TABLE     �   CREATE TABLE public.report (
    report_code integer NOT NULL,
    amo_services integer,
    amo_rents integer,
    income_rents double precision,
    amo_others integer,
    income_others double precision,
    income_total double precision
);
    DROP TABLE public.report;
       public         heap    postgres    false            �            1259    16471    Report_report_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Report_report_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Report_report_code_seq";
       public          postgres    false    221            �           0    0    Report_report_code_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Report_report_code_seq" OWNED BY public.report.report_code;
          public          postgres    false    222            �            1259    16472    service    TABLE     j  CREATE TABLE public.service (
    service_code integer NOT NULL,
    service_name character varying,
    tour_group_code character varying,
    country_code character varying,
    pickup_place character varying,
    pickup_time time without time zone,
    pax integer,
    service_kms double precision,
    amount double precision,
    request_number integer
);
    DROP TABLE public.service;
       public         heap    postgres    false            �            1259    16477    Service_service_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Service_service_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Service_service_code_seq";
       public          postgres    false    223            �           0    0    Service_service_code_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Service_service_code_seq" OWNED BY public.service.service_code;
          public          postgres    false    224            �            1259    16478    brand    TABLE     �   CREATE TABLE public.brand (
    brand_name character varying NOT NULL,
    amo_seats integer,
    spending double precision,
    brand_code integer NOT NULL,
    fuel_code integer
);
    DROP TABLE public.brand;
       public         heap    postgres    false            �            1259    24576    brand_brand_code_seq    SEQUENCE     �   CREATE SEQUENCE public.brand_brand_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.brand_brand_code_seq;
       public          postgres    false    225            �           0    0    brand_brand_code_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.brand_brand_code_seq OWNED BY public.brand.brand_code;
          public          postgres    false    235            �            1259    24600    car_car_code_seq    SEQUENCE     �   CREATE SEQUENCE public.car_car_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.car_car_code_seq;
       public          postgres    false    214            �           0    0    car_car_code_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.car_car_code_seq OWNED BY public.car.car_code;
          public          postgres    false    236            �            1259    16629    country    TABLE     �   CREATE TABLE public.country (
    country_name character varying(50) NOT NULL,
    country_code character varying(2) NOT NULL
);
    DROP TABLE public.country;
       public         heap    postgres    false            �            1259    16456    couple    TABLE     m   CREATE TABLE public.couple (
    couple_code integer NOT NULL,
    driver_1 integer,
    driver_2 integer
);
    DROP TABLE public.couple;
       public         heap    postgres    false            �            1259    24700    couple_couple_code_seq    SEQUENCE     �   CREATE SEQUENCE public.couple_couple_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.couple_couple_code_seq;
       public          postgres    false    218            �           0    0    couple_couple_code_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.couple_couple_code_seq OWNED BY public.couple.couple_code;
          public          postgres    false    238            �            1259    16483    discrepancy    TABLE     7  CREATE TABLE public.discrepancy (
    car_code integer NOT NULL,
    planned_kms double precision,
    tours_kms double precision,
    difference_kms double precision,
    planned_fuel double precision,
    consumed_fuel double precision,
    dif_spending_fuel double precision,
    month_code date NOT NULL
);
    DROP TABLE public.discrepancy;
       public         heap    postgres    false            �            1259    16486    driver    TABLE        CREATE TABLE public.driver (
    id_driver character varying NOT NULL,
    driver_name character varying,
    address character varying,
    phone character varying,
    district_code integer,
    is_free_cover boolean,
    driver_code integer NOT NULL
);
    DROP TABLE public.driver;
       public         heap    postgres    false            �            1259    24628    driver_driver_code_seq    SEQUENCE     �   CREATE SEQUENCE public.driver_driver_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.driver_driver_code_seq;
       public          postgres    false    227            �           0    0    driver_driver_code_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.driver_driver_code_seq OWNED BY public.driver.driver_code;
          public          postgres    false    237            �            1259    16491 
   free_cover    TABLE     ]   CREATE TABLE public.free_cover (
    brand_code integer,
    driver_code integer NOT NULL
);
    DROP TABLE public.free_cover;
       public         heap    postgres    false            �            1259    16620    fuel    TABLE     g   CREATE TABLE public.fuel (
    fuel_name character varying NOT NULL,
    fuel_code integer NOT NULL
);
    DROP TABLE public.fuel;
       public         heap    postgres    false            �            1259    25059    fuel_fuel_code_seq    SEQUENCE     �   CREATE SEQUENCE public.fuel_fuel_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.fuel_fuel_code_seq;
       public          postgres    false    232            �           0    0    fuel_fuel_code_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.fuel_fuel_code_seq OWNED BY public.fuel.fuel_code;
          public          postgres    false    243            �            1259    16496    months    TABLE     V   CREATE TABLE public.months (
    report_code integer,
    month_code date NOT NULL
);
    DROP TABLE public.months;
       public         heap    postgres    false            �            1259    16499    relation_service_roadmap    TABLE     �   CREATE TABLE public.relation_service_roadmap (
    service_code integer NOT NULL,
    roadmap_date date NOT NULL,
    car_code integer NOT NULL
);
 ,   DROP TABLE public.relation_service_roadmap;
       public         heap    postgres    false            �            1259    16502    roadmap    TABLE     �   CREATE TABLE public.roadmap (
    roadmap_date date NOT NULL,
    car_code integer NOT NULL,
    kms double precision,
    departure_time time without time zone
);
    DROP TABLE public.roadmap;
       public         heap    postgres    false            �            1259    25039    role    TABLE     i   CREATE TABLE public.role (
    role_code integer NOT NULL,
    description character varying NOT NULL
);
    DROP TABLE public.role;
       public         heap    postgres    false            �            1259    25038    role_role_code_seq    SEQUENCE     �   CREATE SEQUENCE public.role_role_code_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.role_role_code_seq;
       public          postgres    false    242            �           0    0    role_role_code_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.role_role_code_seq OWNED BY public.role.role_code;
          public          postgres    false    241            �            1259    16639    tourist_group    TABLE     {   CREATE TABLE public.tourist_group (
    group_code character varying(10) NOT NULL,
    group_name character varying(50)
);
 !   DROP TABLE public.tourist_group;
       public         heap    postgres    false            �            1259    25030    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying NOT NULL,
    password character varying,
    name character varying,
    role_code integer
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    25029    user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.user_id_seq;
       public          postgres    false    240            �           0    0    user_id_seq    SEQUENCE OWNED BY     <   ALTER SEQUENCE public.user_id_seq OWNED BY public.users.id;
          public          postgres    false    239            �           2604    24577    brand brand_code    DEFAULT     t   ALTER TABLE ONLY public.brand ALTER COLUMN brand_code SET DEFAULT nextval('public.brand_brand_code_seq'::regclass);
 ?   ALTER TABLE public.brand ALTER COLUMN brand_code DROP DEFAULT;
       public          postgres    false    235    225            �           2604    24601    car car_code    DEFAULT     l   ALTER TABLE ONLY public.car ALTER COLUMN car_code SET DEFAULT nextval('public.car_car_code_seq'::regclass);
 ;   ALTER TABLE public.car ALTER COLUMN car_code DROP DEFAULT;
       public          postgres    false    236    214            �           2604    16506    contract contract_code    DEFAULT     �   ALTER TABLE ONLY public.contract ALTER COLUMN contract_code SET DEFAULT nextval('public."Contract_contract_code_seq"'::regclass);
 E   ALTER TABLE public.contract ALTER COLUMN contract_code DROP DEFAULT;
       public          postgres    false    217    216            �           2604    24701    couple couple_code    DEFAULT     x   ALTER TABLE ONLY public.couple ALTER COLUMN couple_code SET DEFAULT nextval('public.couple_couple_code_seq'::regclass);
 A   ALTER TABLE public.couple ALTER COLUMN couple_code DROP DEFAULT;
       public          postgres    false    238    218            �           2604    16507    district district_code    DEFAULT     �   ALTER TABLE ONLY public.district ALTER COLUMN district_code SET DEFAULT nextval('public."District_district_code_seq"'::regclass);
 E   ALTER TABLE public.district ALTER COLUMN district_code DROP DEFAULT;
       public          postgres    false    220    219            �           2604    24629    driver driver_code    DEFAULT     x   ALTER TABLE ONLY public.driver ALTER COLUMN driver_code SET DEFAULT nextval('public.driver_driver_code_seq'::regclass);
 A   ALTER TABLE public.driver ALTER COLUMN driver_code DROP DEFAULT;
       public          postgres    false    237    227            �           2604    25060    fuel fuel_code    DEFAULT     p   ALTER TABLE ONLY public.fuel ALTER COLUMN fuel_code SET DEFAULT nextval('public.fuel_fuel_code_seq'::regclass);
 =   ALTER TABLE public.fuel ALTER COLUMN fuel_code DROP DEFAULT;
       public          postgres    false    243    232            �           2604    16508    report report_code    DEFAULT     z   ALTER TABLE ONLY public.report ALTER COLUMN report_code SET DEFAULT nextval('public."Report_report_code_seq"'::regclass);
 A   ALTER TABLE public.report ALTER COLUMN report_code DROP DEFAULT;
       public          postgres    false    222    221            �           2604    25042    role role_code    DEFAULT     p   ALTER TABLE ONLY public.role ALTER COLUMN role_code SET DEFAULT nextval('public.role_role_code_seq'::regclass);
 =   ALTER TABLE public.role ALTER COLUMN role_code DROP DEFAULT;
       public          postgres    false    241    242    242            �           2604    16509    service service_code    DEFAULT     ~   ALTER TABLE ONLY public.service ALTER COLUMN service_code SET DEFAULT nextval('public."Service_service_code_seq"'::regclass);
 C   ALTER TABLE public.service ALTER COLUMN service_code DROP DEFAULT;
       public          postgres    false    224    223            �           2604    25033    users id    DEFAULT     c   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240            �          0    16478    brand 
   TABLE DATA           W   COPY public.brand (brand_name, amo_seats, spending, brand_code, fuel_code) FROM stdin;
    public          postgres    false    225   =      �          0    16444    car 
   TABLE DATA           U   COPY public.car (fleet_number, plate, couple_code, car_code, brand_code) FROM stdin;
    public          postgres    false    214   h      �          0    16450    contract 
   TABLE DATA           �   COPY public.contract (contract_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, car_code) FROM stdin;
    public          postgres    false    216   �      �          0    16629    country 
   TABLE DATA           =   COPY public.country (country_name, country_code) FROM stdin;
    public          postgres    false    233   �      �          0    16456    couple 
   TABLE DATA           A   COPY public.couple (couple_code, driver_1, driver_2) FROM stdin;
    public          postgres    false    218   �      �          0    16483    discrepancy 
   TABLE DATA           �   COPY public.discrepancy (car_code, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel, month_code) FROM stdin;
    public          postgres    false    226          �          0    16462    district 
   TABLE DATA           @   COPY public.district (district_code, district_name) FROM stdin;
    public          postgres    false    219   3       �          0    16486    driver 
   TABLE DATA           s   COPY public.driver (id_driver, driver_name, address, phone, district_code, is_free_cover, driver_code) FROM stdin;
    public          postgres    false    227   �!      �          0    16491 
   free_cover 
   TABLE DATA           =   COPY public.free_cover (brand_code, driver_code) FROM stdin;
    public          postgres    false    228   �$      �          0    16620    fuel 
   TABLE DATA           4   COPY public.fuel (fuel_name, fuel_code) FROM stdin;
    public          postgres    false    232   �$      �          0    16496    months 
   TABLE DATA           9   COPY public.months (report_code, month_code) FROM stdin;
    public          postgres    false    229   �%      �          0    16499    relation_service_roadmap 
   TABLE DATA           X   COPY public.relation_service_roadmap (service_code, roadmap_date, car_code) FROM stdin;
    public          postgres    false    230   �%      �          0    16468    report 
   TABLE DATA           }   COPY public.report (report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total) FROM stdin;
    public          postgres    false    221   �%      �          0    16502    roadmap 
   TABLE DATA           N   COPY public.roadmap (roadmap_date, car_code, kms, departure_time) FROM stdin;
    public          postgres    false    231   �%      �          0    25039    role 
   TABLE DATA           6   COPY public.role (role_code, description) FROM stdin;
    public          postgres    false    242   �%      �          0    16472    service 
   TABLE DATA           �   COPY public.service (service_code, service_name, tour_group_code, country_code, pickup_place, pickup_time, pax, service_kms, amount, request_number) FROM stdin;
    public          postgres    false    223   2&      �          0    16639    tourist_group 
   TABLE DATA           ?   COPY public.tourist_group (group_code, group_name) FROM stdin;
    public          postgres    false    234   O&      �          0    25030    users 
   TABLE DATA           H   COPY public.users (id, username, password, name, role_code) FROM stdin;
    public          postgres    false    240   '      �           0    0    Car_fleet_number_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Car_fleet_number_seq"', 23, true);
          public          postgres    false    215            �           0    0    Contract_contract_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Contract_contract_code_seq"', 1, false);
          public          postgres    false    217                        0    0    District_district_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."District_district_code_seq"', 30, true);
          public          postgres    false    220                       0    0    Report_report_code_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Report_report_code_seq"', 1, false);
          public          postgres    false    222                       0    0    Service_service_code_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Service_service_code_seq"', 1, false);
          public          postgres    false    224                       0    0    brand_brand_code_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.brand_brand_code_seq', 12, true);
          public          postgres    false    235                       0    0    car_car_code_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.car_car_code_seq', 30, true);
          public          postgres    false    236                       0    0    couple_couple_code_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.couple_couple_code_seq', 14, true);
          public          postgres    false    238                       0    0    driver_driver_code_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.driver_driver_code_seq', 36, true);
          public          postgres    false    237                       0    0    fuel_fuel_code_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.fuel_fuel_code_seq', 14, true);
          public          postgres    false    243                       0    0    role_role_code_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.role_role_code_seq', 3, true);
          public          postgres    false    241            	           0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    239            �           2606    16515    contract Contract_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT "Contract_pkey" PRIMARY KEY (contract_code);
 B   ALTER TABLE ONLY public.contract DROP CONSTRAINT "Contract_pkey";
       public            postgres    false    216            �           2606    16519    district District_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.district
    ADD CONSTRAINT "District_pkey" PRIMARY KEY (district_code);
 B   ALTER TABLE ONLY public.district DROP CONSTRAINT "District_pkey";
       public            postgres    false    219            �           2606    16523    report Report_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.report
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY (report_code);
 >   ALTER TABLE ONLY public.report DROP CONSTRAINT "Report_pkey";
       public            postgres    false    221                       2606    16525    roadmap Roadmap_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.roadmap
    ADD CONSTRAINT "Roadmap_pkey" PRIMARY KEY (roadmap_date, car_code);
 @   ALTER TABLE ONLY public.roadmap DROP CONSTRAINT "Roadmap_pkey";
       public            postgres    false    231    231                        2606    16527    service Service_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.service
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY (service_code);
 @   ALTER TABLE ONLY public.service DROP CONSTRAINT "Service_pkey";
       public            postgres    false    223                       2606    24587    brand brand_name 
   CONSTRAINT     Q   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_name UNIQUE (brand_name);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_name;
       public            postgres    false    225                       2606    24585    brand brand_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brand_code);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_pkey;
       public            postgres    false    225            �           2606    24609    car car_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (car_code);
 6   ALTER TABLE ONLY public.car DROP CONSTRAINT car_pkey;
       public            postgres    false    214            !           2606    25138    country country_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_code);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public            postgres    false    233            �           2606    24710    couple couple_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT couple_pkey PRIMARY KEY (couple_code);
 <   ALTER TABLE ONLY public.couple DROP CONSTRAINT couple_pkey;
       public            postgres    false    218            
           2606    16529    discrepancy discrepancy_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT discrepancy_pkey PRIMARY KEY (month_code, car_code);
 F   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT discrepancy_pkey;
       public            postgres    false    226    226                       2606    24637    driver driver_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (driver_code);
 <   ALTER TABLE ONLY public.driver DROP CONSTRAINT driver_pkey;
       public            postgres    false    227            �           2606    24611    car fleet_number 
   CONSTRAINT     S   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fleet_number UNIQUE (fleet_number);
 :   ALTER TABLE ONLY public.car DROP CONSTRAINT fleet_number;
       public            postgres    false    214                       2606    25238    free_cover free_cover_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT free_cover_pkey PRIMARY KEY (driver_code);
 D   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT free_cover_pkey;
       public            postgres    false    228                       2606    25067    fuel fuel_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.fuel
    ADD CONSTRAINT fuel_pkey PRIMARY KEY (fuel_code);
 8   ALTER TABLE ONLY public.fuel DROP CONSTRAINT fuel_pkey;
       public            postgres    false    232                       2606    24639    driver id_driver 
   CONSTRAINT     P   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT id_driver UNIQUE (id_driver);
 :   ALTER TABLE ONLY public.driver DROP CONSTRAINT id_driver;
       public            postgres    false    227                       2606    16533    months months_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.months
    ADD CONSTRAINT months_pkey PRIMARY KEY (month_code);
 <   ALTER TABLE ONLY public.months DROP CONSTRAINT months_pkey;
       public            postgres    false    229                       2606    25257 6   relation_service_roadmap relation_service_roadmap_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT relation_service_roadmap_pkey PRIMARY KEY (service_code, roadmap_date, car_code);
 `   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT relation_service_roadmap_pkey;
       public            postgres    false    230    230    230            (           2606    25046    role role_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_code);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    242            #           2606    24694     tourist_group tourist_group_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tourist_group
    ADD CONSTRAINT tourist_group_pkey PRIMARY KEY (group_code);
 J   ALTER TABLE ONLY public.tourist_group DROP CONSTRAINT tourist_group_pkey;
       public            postgres    false    234            &           2606    25037    users user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (username);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public            postgres    false    240            �           1259    25118    fki_brand_name    INDEX     D   CREATE INDEX fki_brand_name ON public.car USING btree (brand_code);
 "   DROP INDEX public.fki_brand_name;
       public            postgres    false    214                       1259    16678    fki_c    INDEX     D   CREATE INDEX fki_c ON public.service USING btree (tour_group_code);
    DROP INDEX public.fki_c;
       public            postgres    false    223            �           1259    16664    fki_contract_country    INDEX     U   CREATE INDEX fki_contract_country ON public.contract USING btree (contract_country);
 (   DROP INDEX public.fki_contract_country;
       public            postgres    false    216                       1259    16670    fki_country    INDEX     G   CREATE INDEX fki_country ON public.service USING btree (country_code);
    DROP INDEX public.fki_country;
       public            postgres    false    223                       1259    25270    fki_country_code    INDEX     L   CREATE INDEX fki_country_code ON public.service USING btree (country_code);
 $   DROP INDEX public.fki_country_code;
       public            postgres    false    223            �           1259    24716    fki_couple_code    INDEX     F   CREATE INDEX fki_couple_code ON public.car USING btree (couple_code);
 #   DROP INDEX public.fki_couple_code;
       public            postgres    false    214                       1259    25244    fki_d    INDEX     B   CREATE INDEX fki_d ON public.free_cover USING btree (brand_code);
    DROP INDEX public.fki_d;
       public            postgres    false    228                       1259    16537    fki_distric_code    INDEX     L   CREATE INDEX fki_distric_code ON public.driver USING btree (district_code);
 $   DROP INDEX public.fki_distric_code;
       public            postgres    false    227            �           1259    25160    fki_driver_1    INDEX     C   CREATE INDEX fki_driver_1 ON public.couple USING btree (driver_1);
     DROP INDEX public.fki_driver_1;
       public            postgres    false    218            �           1259    25166    fki_driver_2    INDEX     C   CREATE INDEX fki_driver_2 ON public.couple USING btree (driver_2);
     DROP INDEX public.fki_driver_2;
       public            postgres    false    218                       1259    25250    fki_driver_code    INDEX     M   CREATE INDEX fki_driver_code ON public.free_cover USING btree (driver_code);
 #   DROP INDEX public.fki_driver_code;
       public            postgres    false    228                       1259    16540    fki_fleet_number    INDEX     L   CREATE INDEX fki_fleet_number ON public.discrepancy USING btree (car_code);
 $   DROP INDEX public.fki_fleet_number;
       public            postgres    false    226                       1259    25074    fki_fuel_type    INDEX     D   CREATE INDEX fki_fuel_type ON public.brand USING btree (fuel_code);
 !   DROP INDEX public.fki_fuel_type;
       public            postgres    false    225                       1259    16541    fki_month_code    INDEX     L   CREATE INDEX fki_month_code ON public.discrepancy USING btree (month_code);
 "   DROP INDEX public.fki_month_code;
       public            postgres    false    226                       1259    25263    fki_roadmap_code    INDEX     g   CREATE INDEX fki_roadmap_code ON public.relation_service_roadmap USING btree (roadmap_date, car_code);
 $   DROP INDEX public.fki_roadmap_code;
       public            postgres    false    230    230            $           1259    25052    fki_role_code    INDEX     D   CREATE INDEX fki_role_code ON public.users USING btree (role_code);
 !   DROP INDEX public.fki_role_code;
       public            postgres    false    240                       1259    16542    fki_service_code    INDEX     ]   CREATE INDEX fki_service_code ON public.relation_service_roadmap USING btree (service_code);
 $   DROP INDEX public.fki_service_code;
       public            postgres    false    230            <           2620    16544    contract contract_dates_trigger    TRIGGER     �   CREATE TRIGGER contract_dates_trigger BEFORE INSERT OR UPDATE ON public.contract FOR EACH ROW EXECUTE FUNCTION public.validate_contract_dates();
 8   DROP TRIGGER contract_dates_trigger ON public.contract;
       public          postgres    false    216    259            ?           2620    16545 $   brand prevent_delete_brand_with_cars    TRIGGER     �   CREATE TRIGGER prevent_delete_brand_with_cars BEFORE DELETE ON public.brand FOR EACH ROW EXECUTE FUNCTION public.prevent_delete_brand_with_cars();
 =   DROP TRIGGER prevent_delete_brand_with_cars ON public.brand;
       public          postgres    false    286    225            =           2620    24718    couple prevent_duplicate_couple    TRIGGER     �   CREATE TRIGGER prevent_duplicate_couple BEFORE INSERT ON public.couple FOR EACH ROW EXECUTE FUNCTION public.check_duplicate_couple();
 8   DROP TRIGGER prevent_duplicate_couple ON public.couple;
       public          postgres    false    288    218            ;           2620    16546    car prevent_vehicle_delete    TRIGGER        CREATE TRIGGER prevent_vehicle_delete BEFORE DELETE ON public.car FOR EACH ROW EXECUTE FUNCTION public.check_vehicle_delete();
 3   DROP TRIGGER prevent_vehicle_delete ON public.car;
       public          postgres    false    214    298            >           2620    16548 "   report update_income_total_trigger    TRIGGER     �   CREATE TRIGGER update_income_total_trigger AFTER INSERT OR UPDATE OF income_rents, income_others ON public.report FOR EACH ROW EXECUTE FUNCTION public.update_income_total();
 ;   DROP TRIGGER update_income_total_trigger ON public.report;
       public          postgres    false    221    281    221    221            )           2606    25113    car brand_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT brand_code FOREIGN KEY (brand_code) REFERENCES public.brand(brand_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT brand_code;
       public          postgres    false    214    3335    225            4           2606    25239    free_cover brand_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT brand_code FOREIGN KEY (brand_code) REFERENCES public.brand(brand_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 ?   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT brand_code;
       public          postgres    false    228    225    3335            +           2606    25150    contract car_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT car_code FOREIGN KEY (car_code) REFERENCES public.car(car_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ;   ALTER TABLE ONLY public.contract DROP CONSTRAINT car_code;
       public          postgres    false    216    3311    214            1           2606    25169    discrepancy car_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT car_code FOREIGN KEY (car_code) REFERENCES public.car(car_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 >   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT car_code;
       public          postgres    false    3311    226    214            9           2606    25229    roadmap car_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.roadmap
    ADD CONSTRAINT car_code FOREIGN KEY (car_code) REFERENCES public.car(car_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 :   ALTER TABLE ONLY public.roadmap DROP CONSTRAINT car_code;
       public          postgres    false    231    214    3311            .           2606    25265    service country_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.service
    ADD CONSTRAINT country_code FOREIGN KEY (country_code) REFERENCES public.country(country_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 >   ALTER TABLE ONLY public.service DROP CONSTRAINT country_code;
       public          postgres    false    3361    223    233            *           2606    24711    car couple_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT couple_code FOREIGN KEY (couple_code) REFERENCES public.couple(couple_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.car DROP CONSTRAINT couple_code;
       public          postgres    false    3320    214    218            3           2606    16564    driver distric_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT distric_code FOREIGN KEY (district_code) REFERENCES public.district(district_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 =   ALTER TABLE ONLY public.driver DROP CONSTRAINT distric_code;
       public          postgres    false    219    227    3324            ,           2606    25155    couple driver_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT driver_1 FOREIGN KEY (driver_1) REFERENCES public.driver(driver_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.couple DROP CONSTRAINT driver_1;
       public          postgres    false    3342    218    227            -           2606    25161    couple driver_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT driver_2 FOREIGN KEY (driver_2) REFERENCES public.driver(driver_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.couple DROP CONSTRAINT driver_2;
       public          postgres    false    3342    218    227            5           2606    25245    free_cover driver_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT driver_code FOREIGN KEY (driver_code) REFERENCES public.driver(driver_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 @   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT driver_code;
       public          postgres    false    227    228    3342            0           2606    25069    brand fuel_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT fuel_code FOREIGN KEY (fuel_code) REFERENCES public.fuel(fuel_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 9   ALTER TABLE ONLY public.brand DROP CONSTRAINT fuel_code;
       public          postgres    false    232    225    3359            2           2606    24659    discrepancy month_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT month_code FOREIGN KEY (month_code) REFERENCES public.months(month_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 @   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT month_code;
       public          postgres    false    229    226    3351            6           2606    16604    months report_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.months
    ADD CONSTRAINT report_code FOREIGN KEY (report_code) REFERENCES public.report(report_code) NOT VALID;
 <   ALTER TABLE ONLY public.months DROP CONSTRAINT report_code;
       public          postgres    false    3326    229    221            7           2606    25258 %   relation_service_roadmap roadmap_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT roadmap_code FOREIGN KEY (roadmap_date, car_code) REFERENCES public.roadmap(roadmap_date, car_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT roadmap_code;
       public          postgres    false    230    230    231    231    3357            :           2606    25047    users role_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT role_code FOREIGN KEY (role_code) REFERENCES public.role(role_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT role_code;
       public          postgres    false    240    242    3368            8           2606    16614 %   relation_service_roadmap service_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT service_code FOREIGN KEY (service_code) REFERENCES public.service(service_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT service_code;
       public          postgres    false    230    3328    223            /           2606    24695    service tourist_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.service
    ADD CONSTRAINT tourist_group FOREIGN KEY (tour_group_code) REFERENCES public.tourist_group(group_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 ?   ALTER TABLE ONLY public.service DROP CONSTRAINT tourist_group;
       public          postgres    false    234    223    3363            �      x���L�4�44���&\1z\\\ 4f�      �      x������ � �      �      x������ � �      �   @  x�mWͶ��w=�d��� "�#[P��NZ�hG�M{}�3�o�;_��d�{'�UU�]U]��Og�趓�p��V{PR�	�IY�Ɏ�� ����� �9k'�'S-��bw�:|%������l��'��?��kO
��D���S�~�!�o;++�F�aI�]ٽ�?X�y�,k�
�`h�n�7lN�<��,�	��h��#OU���[�'�������b`kV�K�;��"�$�T�jx�V͔���yec<��}��7���Ꜩ��Pxk��JxK ����D�Qý��³Tlco"��o�v&�p++	U3���$�^l/8ԙ��o�t�݄�/���"�1V֘F�)p#a��]��V����u�q��h+�-����q����T�~_����Q��u��0�� ,
7�n���|s0��)V�rs��<��!�L�����6�CK��~8�/NwV�D��`%�ꩊc��H��Ę��c�kg�1�/����N9���h��p�5�I�do���ەÇ�wu8�a�&�����IL�zo�N�ɜ&��1I��GMzD��O��v�DRP!��ׁ_�)��Kܸ���^7J���D������
��6W�%Meuakߍv>����~�bk��!�M�-�s���^�M�lJL�@���8��6��3rS������+`�Y�߱�U+�)�r�]��FÔBe�a h_71<��(�{j�#
�RP&\h�1L�6�PW���W�ʙ�E��w�jd�KP�U7�������4����۠fI(f%͔���:=LL#���,���J9����k_w�tP�X�X�{�r4���1�i�7�ڛ��(:�����!�E�10���	E��/ñ��Xђ�?E��c���Rq&��QQ
�JU�(���
IIs�H�y
xŲyNse�Q������X���<�xG�jn����=qD�AX~�3se��j?(��o�7���vw)�����Ii��X�q�M֔(�$DU���;����Н�%C�l���j�N�~'ݹ�YRR���P{{ɊRy�F����5V��A�ζ?8���Ei��Gy��񚆠*��E�Ѝ�.�2>�W$D�fy�����gYUϐJg�C�?{%�P=Rj�:]>(�����7�uJl���[`�7J�����ř���/�q�ǖ������h^!�`��F�&>#tq>2c'���$�Y.;���9�'.���|�zG)��f���!f9�3�HdK��UV"��p��g	�7Ǘ�x"��N�!��eY+1:�,��Dd�x}��e�~7�{�ٔ9c�J�U�C>=���M�D��*�X����8�1p��o�W����d����I�.�S���4yޠ�M�[�����#���%��g��� ��a����yd��7�%�(b���eD����ť��F#�-M=D�rAK<@<�X��%&���
�DO^���?��o�K̙�P]�8n{@��ˡ�v��s���7g)��c}����d�U�SgA�8��9����1� ?�t���!��"�!TA�<}�-	o�rN��pޚ��tS �w�Q��)M={�hE	AԎk%�d�R��/PS$;{���*\�(pk'�D!�DOad�WT=Q�L�u�G��I�=�+�QQ!�.|P<�a�-"*x�1�g���&�bAC;}Yb�>�G�|�a����ƙ�[��c�P�E�|�E�����q `����[�v�x ga:�|���c����)��S��3+Gj��8; ��}�g�#Dn�j��W�bK��o��r��ahU�Xn ���W�A5w9��U����Y���g9�QΨԘ�BW@M,*�2���8��7'�!�}��e��K^ZR�l�]f���fX.��"�J�@�!����҇.�QkZ��l[����?�+�6	j͵�n�ΏXG��{�u[���dIc����o��RZ�~(7�-��{���jGk�`.��zEk��Y��/CE���u@k��o�΀z�p�W㏊X��#Z}-��uDt5=�i�w=�v3�ߍ��3ʢf�Up���G�]J;]���M�݆������z      �      x�34�4�4����� \�      �      x������ � �      �   C  x�-�=n�0�g�:A���H$i� ��0��pET�ط�ءCѵ�/V��$��I��=v_-4��V{
��Vk�1�l3*q+nl�
���{s5�R+}8��ׁ�#��. �{�Gp�l�r���:��E�a��Ljs�ԠN`��:o+��!�w�liEUO�/�R=T�hMaC!fb4�-�����������U.`Gy�B3�08)c4nڃ�1�!죽�:P�&�CI���9��˺�f/�RJv
G�j�k���AK�Ԋ�o9��p�U�9 ��V�2��]�������EOjRi��@�d�d'�S��z����E      �   ?  x�u��n�8���S���3)��f�H�EO�p-6�B��мM�=��G���([���1�`���8��!�(u�����N�Q]�����\�Mh�#�)k�FѬ6�!���vOA�������طM�n��˶}hW�_�p��Xq��+� "
�R7��rh�v;���"��4���o����[U�+1
�(��z��s?9_��_�����E��_��_SX�BQ�8��qQ�:6��ϐR\O�����.�̮(�9�m8q�Qj�)hLc�{�:�����={%Y���Q�&��vП��q���|-�"^�ҳ{Y�0f�ԥ�WQ�c��EXcXS�dr�v����\�HFW�smF�[X�e��=w�����3�a��n�k��Z����Q���A�`��ǆ��e���a�V�C�d���Բ]�Լ��tb��N�#&��@�eL=�7'�y!oZ�ײ.D�x�/M����o^aN���e��
�{A-�W��r$�2rDΐ�7���ȉ�����)zC��b��	sb�2s��c*�4A���	ZwΝ��bd�,U�*z�Y���̎�Q� 4P��Ug܉g�ΓO���I�xbE�u�gʄ֙�4,����Z0�R'vV�åʷ�d��G�kq�BZ�i^��)qb�����Ul[� �=�����rb^9����\.p;?İI������'�
r␑C�"��_e���=?��]@�}#s�{t�w3tH~@����;�rb�_-��K.1�&�v5�h��g�N�i�t��#�W\�ȟP{��鵃-vP�P=��������Ɣw���~5��	������Ͼ���f�����      �      x�34�46����� 
y�      �   {   x�M���0��+20�J��TU�������Ů��.l��ޝd 4�p��6n����M8Č�
�����.�����H��~��,�����kO���t��Xɧ8�	C:�G��� |��,      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   +   x�3�tL����2�.-(�/*Q�M�KLO-�2��p��qqq 	�6      �      x������ � �      �   �   x�e���0Eׯ_�/0����!1$n�T�jk:�{	�ݞs�bE1$�F�E�7/e,ZG��L!��L�\�28ɜ�N�oL=��"{��5#\@&}�3���1�ot{鼱-M�[�U*��@z�;�߷MОIM�U��q��4�O���&��7nJ&      �      x������ � �     