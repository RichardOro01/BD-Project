PGDMP                         {           transbus    15.1    15.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    transbus    DATABASE     z   CREATE DATABASE transbus WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Cuba.1252';
    DROP DATABASE transbus;
                postgres    false            /           1255    24717    check_duplicate_couple()    FUNCTION     �  CREATE FUNCTION public.check_duplicate_couple() RETURNS trigger
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
       public          postgres    false            �            1255    16399    check_update_driver()    FUNCTION     (  CREATE FUNCTION public.check_update_driver() RETURNS trigger
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
       public          postgres    false            �            1255    16400    check_vehicle_delete()    FUNCTION       CREATE FUNCTION public.check_vehicle_delete() RETURNS trigger
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
       public          postgres    false                       1255    24598    delete_brand(integer)    FUNCTION     �   CREATE FUNCTION public.delete_brand(integer) RETURNS void
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
       public          postgres    false                       1255    24655    delete_driver(integer)    FUNCTION     �   CREATE FUNCTION public.delete_driver(integer) RETURNS void
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
       public          postgres    false                       1255    16411    delete_roadmap(date, integer)    FUNCTION     �   CREATE FUNCTION public.delete_roadmap(date, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM roadmap r WHERE r.roadmap_date = $1 AND r.fleet_number = $2;
END;$_$;
 4   DROP FUNCTION public.delete_roadmap(date, integer);
       public          postgres    false                       1255    25057    delete_role(integer)    FUNCTION     �   CREATE FUNCTION public.delete_role(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM role WHERE role_code = $1;
END;$_$;
 +   DROP FUNCTION public.delete_role(integer);
       public          postgres    false                       1255    16412    delete_service(integer)    FUNCTION     �   CREATE FUNCTION public.delete_service(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM service s WHERE s.service_code = $1;
END;
$_$;
 .   DROP FUNCTION public.delete_service(integer);
       public          postgres    false                       1255    25054    delete_user(integer)    FUNCTION     �   CREATE FUNCTION public.delete_user(integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM users WHERE id = $1;
END;$_$;
 +   DROP FUNCTION public.delete_user(integer);
       public          postgres    false            .           1255    16413 ,   drivers_worked_tour_group(character varying)    FUNCTION     ~  CREATE FUNCTION public.drivers_worked_tour_group(tour_group character varying) RETURNS refcursor
    LANGUAGE plpgsql
    AS $$
DECLARE drivers refcursor;
BEGIN
	OPEN drivers FOR
		SELECT DISTINCT id_driver, driver_name
		FROM driver JOIN couple on driver.couple_code = couple.couple_code
		JOIN car ON couple.couple=car.couple_code
		JOIN roadmap ON car.fleet_number = roadmap.fleet_number
		JOIN relation_service_roadmap ON roadmap.fleet_number = relation_service_roadmap.fleet_number
		JOIN service ON relation_service_roadmap.service_code = service.service_code
		WHERE service.tour_group_code = tour_group;
	RETURN drivers;
END;
$$;
 N   DROP FUNCTION public.drivers_worked_tour_group(tour_group character varying);
       public          postgres    false                       1255    16414 M   insert_brand(character varying, integer, character varying, double precision)    FUNCTION     >  CREATE FUNCTION public.insert_brand(brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO brand (brand_name, amo_seats, fuel_type, spending) VALUES (brand_name, amo_seats, fuel_type, spending);
END;
$$;
 �   DROP FUNCTION public.insert_brand(brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision);
       public          postgres    false            0           1255    24740 B   insert_car(integer, character varying, integer, character varying)    FUNCTION     7  CREATE FUNCTION public.insert_car(fleet_number integer, plate character varying, couple_code integer, brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO car (fleet_number, plate, couple_code, brand_name) VALUES (fleet_number, plate, couple_code, brand_name);
END;
$$;
 �   DROP FUNCTION public.insert_car(fleet_number integer, plate character varying, couple_code integer, brand_name character varying);
       public          postgres    false                       1255    16416 n   insert_contract(character varying, date, date, double precision, double precision, character varying, integer)    FUNCTION     
  CREATE FUNCTION public.insert_contract(applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO contract (applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number) VALUES (applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number);
END;
$$;
 �   DROP FUNCTION public.insert_contract(applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer);
       public          postgres    false            	           1255    16417 <   insert_couple(integer, character varying, character varying)    FUNCTION     �   CREATE FUNCTION public.insert_couple(couple_code integer, id1 character varying, id2 character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO couple (couple_code, driver_1, driver_2) VALUES (couple_code, ID1, ID2);
END;
$$;
 g   DROP FUNCTION public.insert_couple(couple_code integer, id1 character varying, id2 character varying);
       public          postgres    false                       1255    16418 �   insert_discrepancy(date, integer, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION     R  CREATE FUNCTION public.insert_discrepancy(month_code date, fleet_number integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO discrepancy (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel) VALUES (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel);
END;
$$;
   DROP FUNCTION public.insert_discrepancy(month_code date, fleet_number integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision);
       public          postgres    false                       1255    16419 "   insert_district(character varying)    FUNCTION     �   CREATE FUNCTION public.insert_district(district_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO district (district_name) VALUES (district_name);
END;
$$;
 G   DROP FUNCTION public.insert_district(district_name character varying);
       public          postgres    false            -           1255    16420 ~   insert_driver(character varying, character varying, character varying, character varying, integer, boolean, character varying)    FUNCTION     <  CREATE FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, is_free_cover boolean, brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO driver (id_driver, driver_name, address, phone, district_code, is_free_cover) VALUES (ID_Driver, driver_name, address, phone, district_code, is_free_cover);
  IF(is_free_cover)THEN
   INSERT INTO free_cover (id_driver, brand_name) VALUES (ID_Driver, brand_name);
  END IF;  
END;$$;
 �   DROP FUNCTION public.insert_driver(id_driver character varying, driver_name character varying, address character varying, phone character varying, district_code integer, is_free_cover boolean, brand_name character varying);
       public          postgres    false                       1255    16422    insert_month(date, integer)    FUNCTION     �   CREATE FUNCTION public.insert_month(month_code date, report_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO months (month_code, report_code) VALUES (month_code, report_code);
END;
$$;
 I   DROP FUNCTION public.insert_month(month_code date, report_code integer);
       public          postgres    false                       1255    16423 7   insert_relation_service_roadmap(integer, date, integer)    FUNCTION     1  CREATE FUNCTION public.insert_relation_service_roadmap(service_code integer, roadmap_date date, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	INSERT INTO relation_service_roadmap (service_code,roadmap_date,fleet_number) VALUES (service_code,roadmap_date,fleet_number);
END; $$;
 u   DROP FUNCTION public.insert_relation_service_roadmap(service_code integer, roadmap_date date, fleet_number integer);
       public          postgres    false            !           1255    16424 ^   insert_report(integer, integer, double precision, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.insert_report(amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO report (amo_services, amo_rents, income_rents, amo_others, income_others, income_total) VALUES (amo_services, amo_rents, income_rents, amo_others, income_others, income_total);
END;
$$;
 �   DROP FUNCTION public.insert_report(amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision);
       public          postgres    false            "           1255    16425 G   insert_roadmap(date, integer, double precision, time without time zone)    FUNCTION     4  CREATE FUNCTION public.insert_roadmap(date, fleet_number integer, kms double precision, departure_time time without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
  INSERT INTO roadmap (roadmap_date, fleet_number, kms, departure_time) VALUES ($1, fleet_number, kms, departure_time);
END;
$_$;
 ~   DROP FUNCTION public.insert_roadmap(date, fleet_number integer, kms double precision, departure_time time without time zone);
       public          postgres    false                        1255    25056    insert_role(character varying)    FUNCTION     �   CREATE FUNCTION public.insert_role(character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	INSERT INTO role (description) VALUES ($1); 
END;$_$;
 5   DROP FUNCTION public.insert_role(character varying);
       public          postgres    false            #           1255    16426 �   insert_service(character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision)    FUNCTION     c  CREATE FUNCTION public.insert_service(service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO service (service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount) VALUES (service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount);
END;
$$;
 -  DROP FUNCTION public.insert_service(service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision);
       public          postgres    false                       1255    25058 '   insert_user(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.insert_user(integer, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE role SET description = $2 WHERE role_code = $1;
END;$_$;
 >   DROP FUNCTION public.insert_user(integer, character varying);
       public          postgres    false                       1255    25053 M   insert_user(character varying, character varying, character varying, integer)    FUNCTION     �   CREATE FUNCTION public.insert_user(character varying, character varying, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	INSERT INTO users (username,password,name,role_code) VALUES ($1,$2,$3,$4); 
END;$_$;
 d   DROP FUNCTION public.insert_user(character varying, character varying, character varying, integer);
       public          postgres    false            �            1255    25055 V   insert_user(integer, character varying, character varying, character varying, integer)    FUNCTION       CREATE FUNCTION public.insert_user(integer, character varying, character varying, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE users SET username = $2, password = $3, name = $4, role_code = $5 WHERE id = $1;
END;$_$;
 m   DROP FUNCTION public.insert_user(integer, character varying, character varying, character varying, integer);
       public          postgres    false            $           1255    16427     prevent_delete_brand_with_cars()    FUNCTION     >  CREATE FUNCTION public.prevent_delete_brand_with_cars() RETURNS trigger
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
       public          postgres    false            %           1255    16428    tour_countries()    FUNCTION       CREATE FUNCTION public.tour_countries() RETURNS refcursor
    LANGUAGE plpgsql
    AS $$
DECLARE countries refcursor ;
BEGIN
	OPEN countries FOR 
		SELECT country, count(*) as services
		FROM service
		GROUP BY country
		ORDER BY services DESC
		LIMIT 3;
	RETURN countries;
END;
$$;
 '   DROP FUNCTION public.tour_countries();
       public          postgres    false            &           1255    16429 7   tourist_group_activities(character varying, date, date)    FUNCTION     �  CREATE FUNCTION public.tourist_group_activities(tour_group character varying, start_date date, end_date date) RETURNS refcursor
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
       public          postgres    false                       1255    24599 V   update_brand(integer, character varying, integer, character varying, double precision)    FUNCTION       CREATE FUNCTION public.update_brand(integer, character varying, integer, character varying, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE brand SET brand_name = $2, amo_seats = $3, fuel_type = $4, spending = $5 WHERE brand_code = $1;
END;
$_$;
 m   DROP FUNCTION public.update_brand(integer, character varying, integer, character varying, double precision);
       public          postgres    false                       1255    24627 K   update_car(integer, integer, character varying, character varying, integer)    FUNCTION       CREATE FUNCTION public.update_car(integer, integer, character varying, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE car  SET fleet_number = $2, plate = $3, couple_code = $5, brand_name = $4 WHERE car_code = $1;
END;
$_$;
 b   DROP FUNCTION public.update_car(integer, integer, character varying, character varying, integer);
       public          postgres    false            '           1255    16432 w   update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE contract SET applicant_name = $2, start_date = $3, end_date = $4, contract_kms = $5, contract_amount = $6, countrac_country = $8, fleet_number = $9 WHERE contract_code = $1;
END;
$_$;
 �   DROP FUNCTION public.update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer);
       public          postgres    false            (           1255    16433 E   update_couple(integer, integer, character varying, character varying)    FUNCTION     �   CREATE FUNCTION public.update_couple(integer, integer, character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE couple SET couple_code = $2, driver_1 = $3, driver_2 = $4 WHERE couple_code = $1;
END;
$_$;
 \   DROP FUNCTION public.update_couple(integer, integer, character varying, character varying);
       public          postgres    false            )           1255    16434 �   update_discrepancy(date, integer, date, integer, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_discrepancy(date, integer, date, integer, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE discrepancy SET month_code = $3, fleet_number = $4, planned_kms = $5, tours_kms = $6, difference_kms = $7, planned_fuel = $8, consumed_fuel = $9, dif_spending_fuel = $10 WHERE month_code = $1 AND fleet_number = $2;
END;
$_$;
 �   DROP FUNCTION public.update_discrepancy(date, integer, date, integer, double precision, double precision, double precision, double precision, double precision, double precision);
       public          postgres    false            *           1255    16435 +   update_district(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.update_district(integer, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE district SET distric_name=$2 WHERE district_code = $1;
END;
$_$;
 B   DROP FUNCTION public.update_district(integer, character varying);
       public          postgres    false                       1255    24656 �   update_driver(integer, character varying, character varying, character varying, character varying, integer, boolean, character varying)    FUNCTION     �  CREATE FUNCTION public.update_driver(integer, character varying, character varying, character varying, character varying, integer, boolean, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN 
	UPDATE driver SET id_driver = $2, driver_name = $3, address = $4, phone = $5, district_code = $6, is_free_cover = $7 WHERE  driver_code = $1;
	IF($7)THEN
		UPDATE free_cover SET brand_name = $8 WHERE  id_driver = $2;
	END IF;	
END;
$_$;
 �   DROP FUNCTION public.update_driver(integer, character varying, character varying, character varying, character varying, integer, boolean, character varying);
       public          postgres    false            +           1255    16437    update_income_total()    FUNCTION     �   CREATE FUNCTION public.update_income_total() RETURNS trigger
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
       public          postgres    false            ,           1255    16438 !   update_month(date, date, integer)    FUNCTION     �   CREATE FUNCTION public.update_month(date, date, integer) RETURNS void
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
       public          postgres    false            �            1255    16440 V   update_roadmap(date, date, integer, integer, double precision, time without time zone)    FUNCTION     2  CREATE FUNCTION public.update_roadmap(date, date, integer, integer, double precision, time without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE roadmap SET roadmap_date = $2, fleet_number = $4, kms = $5, departure_time = $6 WHERE roadmap_date = $1 AND fleet_number = $3;
END;
$_$;
 m   DROP FUNCTION public.update_roadmap(date, date, integer, integer, double precision, time without time zone);
       public          postgres    false                       1255    16441 �   update_service(integer, character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_service(integer, character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE service SET service_name = $2, request_number = $3, tour_group_code = $4, country = $5, pickup_place = $6, pickup_time = $7, pax = $8, service_kms = $9, amount = $10 WHERE service_code = $1;
END;
$_$;
 �   DROP FUNCTION public.update_service(integer, character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision);
       public          postgres    false                       1255    16442    validate_contract_dates()    FUNCTION       CREATE FUNCTION public.validate_contract_dates() RETURNS trigger
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
       public          postgres    false            
           1255    16443    validate_district_code()    FUNCTION       CREATE FUNCTION public.validate_district_code() RETURNS trigger
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
       public          postgres    false            �            1259    16444    car    TABLE     �   CREATE TABLE public.car (
    fleet_number integer NOT NULL,
    plate character varying,
    brand_name character varying,
    couple_code integer,
    car_code integer NOT NULL
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
          public          postgres    false    215            �            1259    16450    contract    TABLE       CREATE TABLE public.contract (
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
          public          postgres    false    222            �            1259    16472    service    TABLE     o  CREATE TABLE public.service (
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
    fuel_type character varying,
    spending double precision,
    brand_code integer NOT NULL
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
          public          postgres    false    236            �            1259    16629    country    TABLE     M   CREATE TABLE public.country (
    country_name character varying NOT NULL
);
    DROP TABLE public.country;
       public         heap    postgres    false            �            1259    16456    couple    TABLE     �   CREATE TABLE public.couple (
    driver_1 character varying,
    driver_2 character varying,
    couple_code integer NOT NULL
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
          public          postgres    false    238            �            1259    16483    discrepancy    TABLE     ;  CREATE TABLE public.discrepancy (
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
   free_cover    TABLE     x   CREATE TABLE public.free_cover (
    id_driver character varying NOT NULL,
    brand_name character varying NOT NULL
);
    DROP TABLE public.free_cover;
       public         heap    postgres    false            �            1259    16620    fuel    TABLE     G   CREATE TABLE public.fuel (
    fuel_name character varying NOT NULL
);
    DROP TABLE public.fuel;
       public         heap    postgres    false            �            1259    16496    months    TABLE     V   CREATE TABLE public.months (
    report_code integer,
    month_code date NOT NULL
);
    DROP TABLE public.months;
       public         heap    postgres    false            �            1259    16499    relation_service_roadmap    TABLE     �   CREATE TABLE public.relation_service_roadmap (
    service_code integer NOT NULL,
    roadmap_date date NOT NULL,
    fleet_number integer NOT NULL
);
 ,   DROP TABLE public.relation_service_roadmap;
       public         heap    postgres    false            �            1259    16502    roadmap    TABLE     �   CREATE TABLE public.roadmap (
    roadmap_date date NOT NULL,
    fleet_number integer NOT NULL,
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
          public          postgres    false    241            �            1259    16639    tourist_group    TABLE     U   CREATE TABLE public.tourist_group (
    group_code character varying(10) NOT NULL
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
       public          postgres    false    237    227            �           2604    16508    report report_code    DEFAULT     z   ALTER TABLE ONLY public.report ALTER COLUMN report_code SET DEFAULT nextval('public."Report_report_code_seq"'::regclass);
 A   ALTER TABLE public.report ALTER COLUMN report_code DROP DEFAULT;
       public          postgres    false    222    221            �           2604    25042    role role_code    DEFAULT     p   ALTER TABLE ONLY public.role ALTER COLUMN role_code SET DEFAULT nextval('public.role_role_code_seq'::regclass);
 =   ALTER TABLE public.role ALTER COLUMN role_code DROP DEFAULT;
       public          postgres    false    242    241    242            �           2604    16509    service service_code    DEFAULT     ~   ALTER TABLE ONLY public.service ALTER COLUMN service_code SET DEFAULT nextval('public."Service_service_code_seq"'::regclass);
 C   ALTER TABLE public.service ALTER COLUMN service_code DROP DEFAULT;
       public          postgres    false    224    223            �           2604    25033    users id    DEFAULT     c   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    240    240            �          0    16478    brand 
   TABLE DATA           W   COPY public.brand (brand_name, amo_seats, fuel_type, spending, brand_code) FROM stdin;
    public          postgres    false    225   #      �          0    16444    car 
   TABLE DATA           U   COPY public.car (fleet_number, plate, brand_name, couple_code, car_code) FROM stdin;
    public          postgres    false    214   �      �          0    16450    contract 
   TABLE DATA           �   COPY public.contract (contract_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number) FROM stdin;
    public          postgres    false    216   �      �          0    16629    country 
   TABLE DATA           /   COPY public.country (country_name) FROM stdin;
    public          postgres    false    233   �      �          0    16456    couple 
   TABLE DATA           A   COPY public.couple (driver_1, driver_2, couple_code) FROM stdin;
    public          postgres    false    218   �"      �          0    16483    discrepancy 
   TABLE DATA           �   COPY public.discrepancy (fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel, month_code) FROM stdin;
    public          postgres    false    226   ]#      �          0    16462    district 
   TABLE DATA           @   COPY public.district (district_code, district_name) FROM stdin;
    public          postgres    false    219   z#      �          0    16486    driver 
   TABLE DATA           s   COPY public.driver (id_driver, driver_name, address, phone, district_code, is_free_cover, driver_code) FROM stdin;
    public          postgres    false    227   �$      �          0    16491 
   free_cover 
   TABLE DATA           ;   COPY public.free_cover (id_driver, brand_name) FROM stdin;
    public          postgres    false    228   �'      �          0    16620    fuel 
   TABLE DATA           )   COPY public.fuel (fuel_name) FROM stdin;
    public          postgres    false    232   �(      �          0    16496    months 
   TABLE DATA           9   COPY public.months (report_code, month_code) FROM stdin;
    public          postgres    false    229   9)      �          0    16499    relation_service_roadmap 
   TABLE DATA           \   COPY public.relation_service_roadmap (service_code, roadmap_date, fleet_number) FROM stdin;
    public          postgres    false    230   V)      �          0    16468    report 
   TABLE DATA           }   COPY public.report (report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total) FROM stdin;
    public          postgres    false    221   s)      �          0    16502    roadmap 
   TABLE DATA           R   COPY public.roadmap (roadmap_date, fleet_number, kms, departure_time) FROM stdin;
    public          postgres    false    231   �)      �          0    25039    role 
   TABLE DATA           6   COPY public.role (role_code, description) FROM stdin;
    public          postgres    false    242   �)      �          0    16472    service 
   TABLE DATA           �   COPY public.service (service_code, service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount) FROM stdin;
    public          postgres    false    223   �)      �          0    16639    tourist_group 
   TABLE DATA           3   COPY public.tourist_group (group_code) FROM stdin;
    public          postgres    false    234   *      �          0    25030    users 
   TABLE DATA           H   COPY public.users (id, username, password, name, role_code) FROM stdin;
    public          postgres    false    240   B*      �           0    0    Car_fleet_number_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Car_fleet_number_seq"', 23, true);
          public          postgres    false    215            �           0    0    Contract_contract_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Contract_contract_code_seq"', 1, false);
          public          postgres    false    217                        0    0    District_district_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."District_district_code_seq"', 30, true);
          public          postgres    false    220                       0    0    Report_report_code_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Report_report_code_seq"', 1, false);
          public          postgres    false    222                       0    0    Service_service_code_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Service_service_code_seq"', 1, false);
          public          postgres    false    224                       0    0    brand_brand_code_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.brand_brand_code_seq', 10, true);
          public          postgres    false    235                       0    0    car_car_code_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.car_car_code_seq', 30, true);
          public          postgres    false    236                       0    0    couple_couple_code_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.couple_couple_code_seq', 10, true);
          public          postgres    false    238                       0    0    driver_driver_code_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.driver_driver_code_seq', 28, true);
          public          postgres    false    237                       0    0    role_role_code_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.role_role_code_seq', 3, true);
          public          postgres    false    241                       0    0    user_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.user_id_seq', 1, false);
          public          postgres    false    239            �           2606    16515    contract Contract_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT "Contract_pkey" PRIMARY KEY (contract_code);
 B   ALTER TABLE ONLY public.contract DROP CONSTRAINT "Contract_pkey";
       public            postgres    false    216            �           2606    16519    district District_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.district
    ADD CONSTRAINT "District_pkey" PRIMARY KEY (district_code);
 B   ALTER TABLE ONLY public.district DROP CONSTRAINT "District_pkey";
       public            postgres    false    219                        2606    16523    report Report_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.report
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY (report_code);
 >   ALTER TABLE ONLY public.report DROP CONSTRAINT "Report_pkey";
       public            postgres    false    221                       2606    16525    roadmap Roadmap_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.roadmap
    ADD CONSTRAINT "Roadmap_pkey" PRIMARY KEY (roadmap_date, fleet_number);
 @   ALTER TABLE ONLY public.roadmap DROP CONSTRAINT "Roadmap_pkey";
       public            postgres    false    231    231                       2606    16527    service Service_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.service
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY (service_code);
 @   ALTER TABLE ONLY public.service DROP CONSTRAINT "Service_pkey";
       public            postgres    false    223                       2606    24587    brand brand_name 
   CONSTRAINT     Q   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_name UNIQUE (brand_name);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_name;
       public            postgres    false    225                       2606    24585    brand brand_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT brand_pkey PRIMARY KEY (brand_code);
 :   ALTER TABLE ONLY public.brand DROP CONSTRAINT brand_pkey;
       public            postgres    false    225            �           2606    24609    car car_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.car
    ADD CONSTRAINT car_pkey PRIMARY KEY (car_code);
 6   ALTER TABLE ONLY public.car DROP CONSTRAINT car_pkey;
       public            postgres    false    214                        2606    16648    country country_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (country_name);
 >   ALTER TABLE ONLY public.country DROP CONSTRAINT country_pkey;
       public            postgres    false    233            �           2606    24710    couple couple_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT couple_pkey PRIMARY KEY (couple_code);
 <   ALTER TABLE ONLY public.couple DROP CONSTRAINT couple_pkey;
       public            postgres    false    218                       2606    16529    discrepancy discrepancy_pkey 
   CONSTRAINT     p   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT discrepancy_pkey PRIMARY KEY (month_code, fleet_number);
 F   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT discrepancy_pkey;
       public            postgres    false    226    226                       2606    24637    driver driver_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (driver_code);
 <   ALTER TABLE ONLY public.driver DROP CONSTRAINT driver_pkey;
       public            postgres    false    227            �           2606    24611    car fleet_number 
   CONSTRAINT     S   ALTER TABLE ONLY public.car
    ADD CONSTRAINT fleet_number UNIQUE (fleet_number);
 :   ALTER TABLE ONLY public.car DROP CONSTRAINT fleet_number;
       public            postgres    false    214                       2606    24658    free_cover free_cover_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT free_cover_pkey PRIMARY KEY (id_driver);
 D   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT free_cover_pkey;
       public            postgres    false    228                       2606    16650    fuel fuel_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.fuel
    ADD CONSTRAINT fuel_pkey PRIMARY KEY (fuel_name);
 8   ALTER TABLE ONLY public.fuel DROP CONSTRAINT fuel_pkey;
       public            postgres    false    232                       2606    24639    driver id_driver 
   CONSTRAINT     P   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT id_driver UNIQUE (id_driver);
 :   ALTER TABLE ONLY public.driver DROP CONSTRAINT id_driver;
       public            postgres    false    227                       2606    16533    months months_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.months
    ADD CONSTRAINT months_pkey PRIMARY KEY (month_code);
 <   ALTER TABLE ONLY public.months DROP CONSTRAINT months_pkey;
       public            postgres    false    229                       2606    16535 6   relation_service_roadmap relation_service_roadmap_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT relation_service_roadmap_pkey PRIMARY KEY (service_code, roadmap_date, fleet_number);
 `   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT relation_service_roadmap_pkey;
       public            postgres    false    230    230    230            '           2606    25046    role role_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (role_code);
 8   ALTER TABLE ONLY public.role DROP CONSTRAINT role_pkey;
       public            postgres    false    242            "           2606    24694     tourist_group tourist_group_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.tourist_group
    ADD CONSTRAINT tourist_group_pkey PRIMARY KEY (group_code);
 J   ALTER TABLE ONLY public.tourist_group DROP CONSTRAINT tourist_group_pkey;
       public            postgres    false    234            %           2606    25037    users user_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (username);
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT user_pkey;
       public            postgres    false    240            �           1259    16536    fki_brand_name    INDEX     D   CREATE INDEX fki_brand_name ON public.car USING btree (brand_name);
 "   DROP INDEX public.fki_brand_name;
       public            postgres    false    214                       1259    16678    fki_c    INDEX     D   CREATE INDEX fki_c ON public.service USING btree (tour_group_code);
    DROP INDEX public.fki_c;
       public            postgres    false    223            �           1259    16664    fki_contract_country    INDEX     U   CREATE INDEX fki_contract_country ON public.contract USING btree (contract_country);
 (   DROP INDEX public.fki_contract_country;
       public            postgres    false    216                       1259    16670    fki_country    INDEX     B   CREATE INDEX fki_country ON public.service USING btree (country);
    DROP INDEX public.fki_country;
       public            postgres    false    223            �           1259    24716    fki_couple_code    INDEX     F   CREATE INDEX fki_couple_code ON public.car USING btree (couple_code);
 #   DROP INDEX public.fki_couple_code;
       public            postgres    false    214                       1259    16537    fki_distric_code    INDEX     L   CREATE INDEX fki_distric_code ON public.driver USING btree (district_code);
 $   DROP INDEX public.fki_distric_code;
       public            postgres    false    227            �           1259    16538    fki_driver_1    INDEX     C   CREATE INDEX fki_driver_1 ON public.couple USING btree (driver_1);
     DROP INDEX public.fki_driver_1;
       public            postgres    false    218            �           1259    16539    fki_driver_2    INDEX     C   CREATE INDEX fki_driver_2 ON public.couple USING btree (driver_2);
     DROP INDEX public.fki_driver_2;
       public            postgres    false    218                       1259    16540    fki_fleet_number    INDEX     P   CREATE INDEX fki_fleet_number ON public.discrepancy USING btree (fleet_number);
 $   DROP INDEX public.fki_fleet_number;
       public            postgres    false    226            	           1259    16658    fki_fuel_type    INDEX     D   CREATE INDEX fki_fuel_type ON public.brand USING btree (fuel_type);
 !   DROP INDEX public.fki_fuel_type;
       public            postgres    false    225                       1259    16689    fki_id_driver    INDEX     I   CREATE INDEX fki_id_driver ON public.free_cover USING btree (id_driver);
 !   DROP INDEX public.fki_id_driver;
       public            postgres    false    228                       1259    16541    fki_month_code    INDEX     L   CREATE INDEX fki_month_code ON public.discrepancy USING btree (month_code);
 "   DROP INDEX public.fki_month_code;
       public            postgres    false    226            #           1259    25052    fki_role_code    INDEX     D   CREATE INDEX fki_role_code ON public.users USING btree (role_code);
 !   DROP INDEX public.fki_role_code;
       public            postgres    false    240                       1259    16542    fki_service_code    INDEX     ]   CREATE INDEX fki_service_code ON public.relation_service_roadmap USING btree (service_code);
 $   DROP INDEX public.fki_service_code;
       public            postgres    false    230            @           2620    16543    driver check_district_code    TRIGGER     �   CREATE TRIGGER check_district_code BEFORE INSERT OR UPDATE ON public.driver FOR EACH ROW EXECUTE FUNCTION public.validate_district_code();
 3   DROP TRIGGER check_district_code ON public.driver;
       public          postgres    false    227    266            <           2620    16544    contract contract_dates_trigger    TRIGGER     �   CREATE TRIGGER contract_dates_trigger BEFORE INSERT OR UPDATE ON public.contract FOR EACH ROW EXECUTE FUNCTION public.validate_contract_dates();
 8   DROP TRIGGER contract_dates_trigger ON public.contract;
       public          postgres    false    262    216            ?           2620    16545 $   brand prevent_delete_brand_with_cars    TRIGGER     �   CREATE TRIGGER prevent_delete_brand_with_cars BEFORE DELETE ON public.brand FOR EACH ROW EXECUTE FUNCTION public.prevent_delete_brand_with_cars();
 =   DROP TRIGGER prevent_delete_brand_with_cars ON public.brand;
       public          postgres    false    292    225            =           2620    24718    couple prevent_duplicate_couple    TRIGGER     �   CREATE TRIGGER prevent_duplicate_couple BEFORE INSERT ON public.couple FOR EACH ROW EXECUTE FUNCTION public.check_duplicate_couple();
 8   DROP TRIGGER prevent_duplicate_couple ON public.couple;
       public          postgres    false    218    303            ;           2620    16546    car prevent_vehicle_delete    TRIGGER        CREATE TRIGGER prevent_vehicle_delete BEFORE DELETE ON public.car FOR EACH ROW EXECUTE FUNCTION public.check_vehicle_delete();
 3   DROP TRIGGER prevent_vehicle_delete ON public.car;
       public          postgres    false    247    214            A           2620    16547     driver update_free_cover_trigger    TRIGGER     �   CREATE TRIGGER update_free_cover_trigger AFTER UPDATE OF is_free_cover ON public.driver FOR EACH ROW EXECUTE FUNCTION public.check_update_driver();
 9   DROP TRIGGER update_free_cover_trigger ON public.driver;
       public          postgres    false    244    227    227            >           2620    16548 "   report update_income_total_trigger    TRIGGER     �   CREATE TRIGGER update_income_total_trigger AFTER INSERT OR UPDATE OF income_rents, income_others ON public.report FOR EACH ROW EXECUTE FUNCTION public.update_income_total();
 ;   DROP TRIGGER update_income_total_trigger ON public.report;
       public          postgres    false    221    299    221    221            (           2606    24588    car brand_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT brand_name FOREIGN KEY (brand_name) REFERENCES public.brand(brand_name) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT brand_name;
       public          postgres    false    225    214    3334            4           2606    24593    free_cover brand_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT brand_name FOREIGN KEY (brand_name) REFERENCES public.brand(brand_name) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 ?   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT brand_name;
       public          postgres    false    3334    228    225            *           2606    16659    contract contract_country    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT contract_country FOREIGN KEY (contract_country) REFERENCES public.country(country_name) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 C   ALTER TABLE ONLY public.contract DROP CONSTRAINT contract_country;
       public          postgres    false    216    233    3360            .           2606    16665    service country    FK CONSTRAINT     �   ALTER TABLE ONLY public.service
    ADD CONSTRAINT country FOREIGN KEY (country) REFERENCES public.country(country_name) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 9   ALTER TABLE ONLY public.service DROP CONSTRAINT country;
       public          postgres    false    223    3360    233            )           2606    24711    car couple_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT couple_code FOREIGN KEY (couple_code) REFERENCES public.couple(couple_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.car DROP CONSTRAINT couple_code;
       public          postgres    false    218    214    3322            3           2606    16564    driver distric_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT distric_code FOREIGN KEY (district_code) REFERENCES public.district(district_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 =   ALTER TABLE ONLY public.driver DROP CONSTRAINT distric_code;
       public          postgres    false    227    3326    219            ,           2606    24640    couple driver_1    FK CONSTRAINT     �   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT driver_1 FOREIGN KEY (driver_1) REFERENCES public.driver(id_driver) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 9   ALTER TABLE ONLY public.couple DROP CONSTRAINT driver_1;
       public          postgres    false    3346    227    218            -           2606    24645    couple driver_2    FK CONSTRAINT     �   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT driver_2 FOREIGN KEY (driver_2) REFERENCES public.driver(id_driver) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.couple DROP CONSTRAINT driver_2;
       public          postgres    false    227    218    3346            +           2606    24612    contract fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) ON UPDATE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.contract DROP CONSTRAINT fleet_number;
       public          postgres    false    216    3317    214            1           2606    24617    discrepancy fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 B   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT fleet_number;
       public          postgres    false    3317    214    226            9           2606    24622    roadmap fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.roadmap
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.roadmap DROP CONSTRAINT fleet_number;
       public          postgres    false    214    3317    231            0           2606    16653    brand fuel_type    FK CONSTRAINT     �   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT fuel_type FOREIGN KEY (fuel_type) REFERENCES public.fuel(fuel_name) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 9   ALTER TABLE ONLY public.brand DROP CONSTRAINT fuel_type;
       public          postgres    false    232    225    3358            5           2606    24650    free_cover id_driver    FK CONSTRAINT     �   ALTER TABLE ONLY public.free_cover
    ADD CONSTRAINT id_driver FOREIGN KEY (id_driver) REFERENCES public.driver(id_driver) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 >   ALTER TABLE ONLY public.free_cover DROP CONSTRAINT id_driver;
       public          postgres    false    3346    227    228            2           2606    24659    discrepancy month_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT month_code FOREIGN KEY (month_code) REFERENCES public.months(month_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 @   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT month_code;
       public          postgres    false    3351    226    229            6           2606    16604    months report_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.months
    ADD CONSTRAINT report_code FOREIGN KEY (report_code) REFERENCES public.report(report_code) NOT VALID;
 <   ALTER TABLE ONLY public.months DROP CONSTRAINT report_code;
       public          postgres    false    229    3328    221            7           2606    16609 $   relation_service_roadmap roadmap_key    FK CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT roadmap_key FOREIGN KEY (roadmap_date, fleet_number) REFERENCES public.roadmap(roadmap_date, fleet_number) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 N   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT roadmap_key;
       public          postgres    false    231    230    3356    231    230            :           2606    25047    users role_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.users
    ADD CONSTRAINT role_code FOREIGN KEY (role_code) REFERENCES public.role(role_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 9   ALTER TABLE ONLY public.users DROP CONSTRAINT role_code;
       public          postgres    false    3367    240    242            8           2606    16614 %   relation_service_roadmap service_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.relation_service_roadmap
    ADD CONSTRAINT service_code FOREIGN KEY (service_code) REFERENCES public.service(service_code) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 O   ALTER TABLE ONLY public.relation_service_roadmap DROP CONSTRAINT service_code;
       public          postgres    false    3330    230    223            /           2606    24695    service tourist_group    FK CONSTRAINT     �   ALTER TABLE ONLY public.service
    ADD CONSTRAINT tourist_group FOREIGN KEY (tour_group_code) REFERENCES public.tourist_group(group_code) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 ?   ALTER TABLE ONLY public.service DROP CONSTRAINT tourist_group;
       public          postgres    false    234    223    3362            �   �   x�u�1
�@E�?��K��դW"h!�`3��D�l�7��^��Bb;���f}��5]Жg��*g��x�Q��{ib�������H7��R_�A�DA[�0�/�gi�Q-n�<�ص|����8�i���p����I����=�	a����r�(&���h�c���;�Wf�>��!�7�Re      �   �   x�%ͻ
�@��z�Äݳ�һ!)��Yp!(��}l?��%bUIVx�)A�%q�Q���9o̤�����:�)-P`E�i�d���d��J�˜w��r�v�y9�.X�%���A�;���|����Ƀ=�~4��ӱ�D ������yl�J��AD��-u      �      x������ � �      �     x�UUKr�8������i�k{\���N���t�񴽛�d��S��V���Jo�@@$����<w�$��͙/��L@�G��>��[�$]�j_M(Թ�&P-T�(��t۱��S��rS�)�=K�5�^OhC=E��,�û����û����vҐ��E� 7���1G\9�0�=�Vv#����Á;�Ӑ&>�L*�b����dۑF6��V��n�k�\P��G-C�k�'E�O�!�7`�`.6�b˺��m��[߃-��k h����m��!��*�2��9�g;�����rM�+����{qj�63�d����B��Q�K��c5��r��(�� 	��4Z���,'��p�4���41����9��G2�be�p"$g	�n/�2�Ӏ��>��q�>t���UP.�|�)��J��L$o������#u��^sM�������J�uv]��nJ8X�c-��@/X�o�U<�BT�ㆬ=m���5����M��o���~K[5��ЖJ��}?��]��NB��	RSs��A�fF t��#_3y�Gt%�R�V'���l���1����Y��}��jN�zçښ�ڎb�*��T%@1�B+;0�aMjCcq�U��4�G!_����4PINlνmiWl�Ԧ%n��!Z������fA}y��f��-2� ��0f�b8v������0�'��W�D.i8F��#�%��^�uE��@�.���T�7�*j9zۛ�6�Y�K�uK�;�s��X�q������Z��>[6���P��^��<�����%�y^�e�������"�c>j�d�ǢGvY1�/�Z�c���b��}��j��}ǗK��q�f���KW���͆�U7��Ռ=�\��h���M�����WA��HC�2�����*��^e9�tf�5ɩ�����5����ok�5HK-�_��T����������D�Y߻�;��<4�����B.�~8�|v�H$��ěGPr�(1�(�4�o����4��'�k�Q��i���`�7      �   x   x�]�K!C��0U����K��Ƴ1��=��˝��]�$kau˒�H�nk�,�	B5I�j]dӝN��`�a�:3kS}\(X�b�WS;�gj�@:I���!��f�<����'���1���/�      �      x������ � �      �   C  x�-�=n�0�g�:A���H$i� ��0��pET�ط�ءCѵ�/V��$��I��=v_-4��V{
��Vk�1�l3*q+nl�
���{s5�R+}8��ׁ�#��. �{�Gp�l�r���:��E�a��Ljs�ԠN`��:o+��!�w�liEUO�/�R=T�hMaC!fb4�-�����������U.`Gy�B3�08)c4nڃ�1�!죽�:P�&�CI���9��˺�f/�RJv
G�j�k���AK�Ԋ�o9��p�U�9 ��V�2��]�������EOjRi��@�d�d'�S��z����E      �     x�u�͎�0���S�*�ǉs��c���t'.�1KP6An�ľG{��b��i�v?:�������1��oC��vS�S��f;ןc�A9�mA��Q4��a�(�!��}��v�n���W��&h�	s�q��jW�?�pe�Yq��)� "
�R7��rh�f;��s}�M�e�� Aj_�Vya%F�^�A/v�~N�W��W�����"���m�����PT!N!qD����}R��6s}Յ��8�آ'�%D�Z�m
������b�"�<��K%YKq� ��uL7������O7�Z�E��g���0f�ԕ�{�(�����"�1��j2��E��uc}�+��yq�ͨ�b�������\�~�4���q�\k��1�r{3�k�w���0ֶ�7]8��*v����ⓕZ�����=�;�N���	u��Y����G�愼Rț�%Ƶ�x,��Kv{n�ś'�k������PA#t��%�$q�P��QF��r�r�91+�=�q�����c��	sb�2s��c�U4A����;�N��12x��!O�;������;���jz�;Ɲ�q��<���<�t=�'V$�mPw~�Lh�	K����ϯ�)ubg�:\�|�*F<|p$��.����Uݞ'��x 8:�ְ�2�����>?���!DF���p���*�Mj��ش0=>�'����}v�b(��-������w�R����p���n��Ȟ��=sbgUN\�W˕�+L���]�?�C����c/g∽a�^]c�@�����O�lY�C ?��b6����߃      �   �   x�M��
�0Dϛ�);���*�O�B/�D���~}w#T3��������)�\��Z�yԲ"�b7u*���)|�Q�F��G�s����u��"�dP��S�z������M)%]S�r��eX��B�1�i��=�bT�N�Ԍ�Q�D�hp���Q�7\!s��#�1�H&D�      �   o   x�sO,����KTp-.HM�L��r������$q�d^Y�
�8�9'5�P�K,)-J�Qp��-(���L�W�p�s�K�d&�&ERRRK�����>�\N��)P�b���� ތ-�      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   +   x�3�tL����2�.-(�/*Q�M�KLO-�2��p��qqq 	�6      �      x������ � �      �   -   x�q700�
�F`�L��IS0i&�������\1z\\\ �C�      �      x������ � �     