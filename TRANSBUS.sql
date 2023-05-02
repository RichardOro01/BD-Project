PGDMP                         {           TRANSBUS    10.23    10.23 y    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    64377    TRANSBUS    DATABASE     �   CREATE DATABASE "TRANSBUS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "TRANSBUS";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1255    64548    delete_brand(character varying)    FUNCTION     �   CREATE FUNCTION public.delete_brand(brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM brand b WHERE b.brand_name = brand_name;
END;$$;
 A   DROP FUNCTION public.delete_brand(brand_name character varying);
       public       postgres    false    1    3            �            1255    64549    delete_car(integer)    FUNCTION     �   CREATE FUNCTION public.delete_car(fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM car c WHERE c.fleet_number = fleet_number;
END;$$;
 7   DROP FUNCTION public.delete_car(fleet_number integer);
       public       postgres    false    1    3            �            1255    64550    delete_contract(integer)    FUNCTION     �   CREATE FUNCTION public.delete_contract(contract_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM contract c WHERE c.contrac_code = contract_code;
END;$$;
 =   DROP FUNCTION public.delete_contract(contract_code integer);
       public       postgres    false    1    3            �            1255    64551    delete_couple(integer)    FUNCTION     �   CREATE FUNCTION public.delete_couple(couple_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM couple c WHERE c.couple_code = couple_code;
END;$$;
 9   DROP FUNCTION public.delete_couple(couple_code integer);
       public       postgres    false    3    1            �            1255    64552 $   delete_discrepency(integer, integer)    FUNCTION     �   CREATE FUNCTION public.delete_discrepency(month_code integer, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM discrepancy d WHERE d.month_code = month_code AND d.fleet_number = fleet_number ;
END;$$;
 S   DROP FUNCTION public.delete_discrepency(month_code integer, fleet_number integer);
       public       postgres    false    3    1            �            1255    64553    delete_district(integer)    FUNCTION     �   CREATE FUNCTION public.delete_district(district_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM district d WHERE d.distric_code = district_code;
END;$$;
 =   DROP FUNCTION public.delete_district(district_code integer);
       public       postgres    false    1    3            �            1255    64554     delete_driver(character varying)    FUNCTION     �   CREATE FUNCTION public.delete_driver(id character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM driver d WHERE d.ID = ID;
END;$$;
 :   DROP FUNCTION public.delete_driver(id character varying);
       public       postgres    false    1    3            �            1255    64555    delete_month(integer)    FUNCTION     �   CREATE FUNCTION public.delete_month(month_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN 
	DELETE FROM month m WHERE m.month_code = month_code;
END;$$;
 7   DROP FUNCTION public.delete_month(month_code integer);
       public       postgres    false    3    1            �            1255    64547    delete_report(integer)    FUNCTION     �   CREATE FUNCTION public.delete_report(report_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM report r WHERE r.report_code = report_code;
END;$$;
 9   DROP FUNCTION public.delete_report(report_code integer);
       public       postgres    false    3    1            �            1255    64556    delete_roadmap(date, integer)    FUNCTION     �   CREATE FUNCTION public.delete_roadmap(date, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	DELETE FROM roadmap r WHERE r.date = $1 AND r.fleet_number = $2;
END;$_$;
 4   DROP FUNCTION public.delete_roadmap(date, integer);
       public       postgres    false    3    1            �            1255    64557    delete_service(integer)    FUNCTION     �   CREATE FUNCTION public.delete_service(service_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
	DELETE FROM service s WHERE s.service_code = service_code;
END;$$;
 ;   DROP FUNCTION public.delete_service(service_code integer);
       public       postgres    false    3    1            �            1255    64378 M   insert_brand(character varying, integer, character varying, double precision)    FUNCTION     >  CREATE FUNCTION public.insert_brand(brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO brand (brand_name, amo_seats, fuel_type, spending) VALUES (brand_name, amo_seats, fuel_type, spending);
END;
$$;
 �   DROP FUNCTION public.insert_brand(brand_name character varying, amo_seats integer, fuel_type character varying, spending double precision);
       public       postgres    false    3    1            �            1255    64379 B   insert_car(integer, character varying, integer, character varying)    FUNCTION       CREATE FUNCTION public.insert_car(fleet_number integer, plate character varying, couple_code integer, brand_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO car (plate, couple_code, brand_name) VALUES (plate, couple_code, brand_name);
END;
$$;
 �   DROP FUNCTION public.insert_car(fleet_number integer, plate character varying, couple_code integer, brand_name character varying);
       public       postgres    false    1    3            �            1255    64380 w   insert_contract(integer, character varying, date, date, double precision, double precision, character varying, integer)    FUNCTION     <  CREATE FUNCTION public.insert_contract(contact_code integer, applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO contract (contact_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number) VALUES (contact_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number);
END;
$$;
 �   DROP FUNCTION public.insert_contract(contact_code integer, applicant_name character varying, start_date date, end_date date, contract_kms double precision, contract_amount double precision, contract_country character varying, fleet_number integer);
       public       postgres    false    3    1            �            1255    64381 <   insert_couple(integer, character varying, character varying)    FUNCTION     �   CREATE FUNCTION public.insert_couple(couple_code integer, id1 character varying, id2 character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO couple (couple_code, driver_1, driver_2) VALUES (couple_code, ID1, ID2);
END;
$$;
 g   DROP FUNCTION public.insert_couple(couple_code integer, id1 character varying, id2 character varying);
       public       postgres    false    3    1            �            1255    64382 �   insert_discrepancy(integer, integer, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION     U  CREATE FUNCTION public.insert_discrepancy(month_code integer, fleet_number integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO discrepancy (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel) VALUES (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel);
END;
$$;
   DROP FUNCTION public.insert_discrepancy(month_code integer, fleet_number integer, planned_kms double precision, tours_kms double precision, difference_kms double precision, planned_fuel double precision, consumed_fuel double precision, dif_spending_fuel double precision);
       public       postgres    false    1    3            �            1255    64383 +   insert_district(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.insert_district(district_code integer, district_name character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO district (district_code, district_name) VALUES (district_code, district_name);
END;
$$;
 ^   DROP FUNCTION public.insert_district(district_code integer, district_name character varying);
       public       postgres    false    3    1            �            1255    64384 b   insert_driver(character varying, character varying, character varying, character varying, integer)    FUNCTION     _  CREATE FUNCTION public.insert_driver(id character varying, driver_name character varying, address character varying, phone character varying, district_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO driver (ID, driver_name, address, phone, district_code) VALUES (ID, driver_name, address, phone, district_code);
END;
$$;
 �   DROP FUNCTION public.insert_driver(id character varying, driver_name character varying, address character varying, phone character varying, district_code integer);
       public       postgres    false    3    1            �            1255    64385    insert_month(integer, integer)    FUNCTION     �   CREATE FUNCTION public.insert_month(month_code integer, report_code integer) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO month (month_code, report_code) VALUES (month_code, report_code);
END;
$$;
 L   DROP FUNCTION public.insert_month(month_code integer, report_code integer);
       public       postgres    false    3    1            �            1255    64386 g   insert_report(integer, integer, integer, double precision, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.insert_report(report_code integer, amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO report (report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total) VALUES (report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total);
END;
$$;
 �   DROP FUNCTION public.insert_report(report_code integer, amo_services integer, amo_rents integer, income_rents double precision, amo_others integer, income_others double precision, income_total double precision);
       public       postgres    false    1    3            �            1255    64387 G   insert_roadmap(date, integer, double precision, time without time zone)    FUNCTION     ,  CREATE FUNCTION public.insert_roadmap(date, fleet_number integer, kms double precision, departure_time time without time zone) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
  INSERT INTO roadmap (date, fleet_number, kms, departure_time) VALUES ($1, fleet_number, kms, departure_time);
END;
$_$;
 ~   DROP FUNCTION public.insert_roadmap(date, fleet_number integer, kms double precision, departure_time time without time zone);
       public       postgres    false    1    3            �            1255    64388 �   insert_service(integer, character varying, character varying, character varying, character varying, character varying, time without time zone, integer, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.insert_service(service_code integer, service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
  INSERT INTO service (service_code, service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount) VALUES (service_code, service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount);
END;
$$;
 C  DROP FUNCTION public.insert_service(service_code integer, service_name character varying, request_number character varying, tour_group_code character varying, country character varying, pickup_place character varying, pickup_time time without time zone, pax integer, service_kms double precision, amount double precision);
       public       postgres    false    1    3            �            1255    64558 M   update_brand(character varying, integer, character varying, double precision)    FUNCTION     �   CREATE FUNCTION public.update_brand(character varying, integer, character varying, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE brand SET amo_seats = $2, fuel_type = $3, spending = $4 WHERE brand_name = $1;
END;$_$;
 d   DROP FUNCTION public.update_brand(character varying, integer, character varying, double precision);
       public       postgres    false    3    1            �            1255    64560 B   update_car(integer, character varying, integer, character varying)    FUNCTION     �   CREATE FUNCTION public.update_car(integer, character varying, integer, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE car SET plate = $2, couple_code = $3, brand_name = $4 WHERE fleet_number = $1;
END;$_$;
 Y   DROP FUNCTION public.update_car(integer, character varying, integer, character varying);
       public       postgres    false    3    1            �            1255    64561 w   update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer)    FUNCTION     �  CREATE FUNCTION public.update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE contract SET applicant_name = $2, start_date = $3, end_date = $4, contract_kms = $5, contract_amount = $6, countrac_country = $7, fleet_number = $8 WHERE contract_code = $1;
END;$_$;
 �   DROP FUNCTION public.update_contract(integer, character varying, date, date, double precision, double precision, character varying, integer);
       public       postgres    false    3    1            �            1255    64562 <   update_couple(integer, character varying, character varying)    FUNCTION     �   CREATE FUNCTION public.update_couple(integer, character varying, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE couple SET driver_1 = $2, driver_2 = $3 WHERE couple_code = $1;
END;$_$;
 S   DROP FUNCTION public.update_couple(integer, character varying, character varying);
       public       postgres    false    3    1            �            1255    64563 �   update_discrepancy(integer, integer, double precision, double precision, double precision, double precision, double precision, double precision)    FUNCTION     �  CREATE FUNCTION public.update_discrepancy(integer, integer, double precision, double precision, double precision, double precision, double precision, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE discrepancy SET planned_kms = $3, tours_kms = $4, difference_kms = $5, planned_fuel = $6, consumed_fuel = $7, dif_spending_fuel = $8 WHERE month_code = $1 AND fleet_number = $2;
END;$_$;
 �   DROP FUNCTION public.update_discrepancy(integer, integer, double precision, double precision, double precision, double precision, double precision, double precision);
       public       postgres    false    1    3            �            1255    64564 +   update_district(integer, character varying)    FUNCTION     �   CREATE FUNCTION public.update_district(integer, character varying) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE district SET distric_name=$2 WHERE district_code = $1;
END;$_$;
 B   DROP FUNCTION public.update_district(integer, character varying);
       public       postgres    false    3    1            �            1255    64565 b   update_driver(character varying, character varying, character varying, character varying, integer)    FUNCTION       CREATE FUNCTION public.update_driver(character varying, character varying, character varying, character varying, integer) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN 
	UPDATE driver SET driver_name = $2, address_name = $3, phone = $4, district_code = $5 WHERE  ID = $1;
END;$_$;
 y   DROP FUNCTION public.update_driver(character varying, character varying, character varying, character varying, integer);
       public       postgres    false    3    1                        1255    64566 g   update_report(integer, integer, integer, double precision, integer, double precision, double precision)    FUNCTION     S  CREATE FUNCTION public.update_report(integer, integer, integer, double precision, integer, double precision, double precision) RETURNS void
    LANGUAGE plpgsql
    AS $_$
BEGIN
	UPDATE report SET amo_services = $2, amo_rents = $3, income_rents = $4, amo_others = $5, income_others = $6, income_total = $7 WHERE report_code = $1;
END;$_$;
 ~   DROP FUNCTION public.update_report(integer, integer, integer, double precision, integer, double precision, double precision);
       public       postgres    false    1    3            �            1259    64389    car    TABLE     �   CREATE TABLE public.car (
    fleet_number integer NOT NULL,
    plate character varying,
    couple_code integer NOT NULL,
    brand_name character varying
);
    DROP TABLE public.car;
       public         postgres    false    3            �            1259    64395    Car_couple_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Car_couple_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Car_couple_code_seq";
       public       postgres    false    3    196            �           0    0    Car_couple_code_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public."Car_couple_code_seq" OWNED BY public.car.couple_code;
            public       postgres    false    197            �            1259    64397    Car_fleet_number_seq    SEQUENCE     �   CREATE SEQUENCE public."Car_fleet_number_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Car_fleet_number_seq";
       public       postgres    false    3    196            �           0    0    Car_fleet_number_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Car_fleet_number_seq" OWNED BY public.car.fleet_number;
            public       postgres    false    198            �            1259    64399    contract    TABLE       CREATE TABLE public.contract (
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
       public         postgres    false    3            �            1259    64405    Contract_contract_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Contract_contract_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Contract_contract_code_seq";
       public       postgres    false    3    199            �           0    0    Contract_contract_code_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."Contract_contract_code_seq" OWNED BY public.contract.contract_code;
            public       postgres    false    200            �            1259    64407    couple    TABLE     �   CREATE TABLE public.couple (
    couple_code integer NOT NULL,
    driver_1 character varying,
    driver_2 character varying
);
    DROP TABLE public.couple;
       public         postgres    false    3            �            1259    64413    Couple_couple_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Couple_couple_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Couple_couple_code_seq";
       public       postgres    false    3    201            �           0    0    Couple_couple_code_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Couple_couple_code_seq" OWNED BY public.couple.couple_code;
            public       postgres    false    202            �            1259    64415    district    TABLE     j   CREATE TABLE public.district (
    district_code integer NOT NULL,
    district_name character varying
);
    DROP TABLE public.district;
       public         postgres    false    3            �            1259    64421    District_district_code_seq    SEQUENCE     �   CREATE SEQUENCE public."District_district_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."District_district_code_seq";
       public       postgres    false    203    3            �           0    0    District_district_code_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public."District_district_code_seq" OWNED BY public.district.district_code;
            public       postgres    false    204            �            1259    64423    month    TABLE     a   CREATE TABLE public.month (
    month_code integer NOT NULL,
    report_code integer NOT NULL
);
    DROP TABLE public.month;
       public         postgres    false    3            �            1259    64426    Month_report_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Month_report_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Month_report_code_seq";
       public       postgres    false    205    3            �           0    0    Month_report_code_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Month_report_code_seq" OWNED BY public.month.report_code;
            public       postgres    false    206            �            1259    64428    report    TABLE     �   CREATE TABLE public.report (
    report_code integer NOT NULL,
    amo_services integer,
    amo_rents integer,
    income_rents double precision,
    amo_others integer,
    income_others double precision,
    income_total double precision
);
    DROP TABLE public.report;
       public         postgres    false    3            �            1259    64431    Report_report_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Report_report_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Report_report_code_seq";
       public       postgres    false    207    3            �           0    0    Report_report_code_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Report_report_code_seq" OWNED BY public.report.report_code;
            public       postgres    false    208            �            1259    64433    service    TABLE     o  CREATE TABLE public.service (
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
       public         postgres    false    3            �            1259    64439    Service_service_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Service_service_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Service_service_code_seq";
       public       postgres    false    3    209            �           0    0    Service_service_code_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public."Service_service_code_seq" OWNED BY public.service.service_code;
            public       postgres    false    210            �            1259    64441    brand    TABLE     �   CREATE TABLE public.brand (
    brand_name character varying NOT NULL,
    amo_seats integer,
    fuel_type character varying,
    spending double precision
);
    DROP TABLE public.brand;
       public         postgres    false    3            �            1259    64447    discrepancy    TABLE     >  CREATE TABLE public.discrepancy (
    month_code integer NOT NULL,
    fleet_number integer NOT NULL,
    planned_kms double precision,
    tours_kms double precision,
    difference_kms double precision,
    planned_fuel double precision,
    consumed_fuel double precision,
    dif_spending_fuel double precision
);
    DROP TABLE public.discrepancy;
       public         postgres    false    3            �            1259    64450    driver    TABLE     �   CREATE TABLE public.driver (
    "ID" character varying NOT NULL,
    driver_name character varying,
    address character varying,
    phone character varying,
    distric_code integer
);
    DROP TABLE public.driver;
       public         postgres    false    3            �            1259    64456    roadmap    TABLE     �   CREATE TABLE public.roadmap (
    date date NOT NULL,
    fleet_number integer NOT NULL,
    kms double precision,
    departure_time time without time zone
);
    DROP TABLE public.roadmap;
       public         postgres    false    3            �
           2604    64459    car fleet_number    DEFAULT     v   ALTER TABLE ONLY public.car ALTER COLUMN fleet_number SET DEFAULT nextval('public."Car_fleet_number_seq"'::regclass);
 ?   ALTER TABLE public.car ALTER COLUMN fleet_number DROP DEFAULT;
       public       postgres    false    198    196            �
           2604    64460    car couple_code    DEFAULT     t   ALTER TABLE ONLY public.car ALTER COLUMN couple_code SET DEFAULT nextval('public."Car_couple_code_seq"'::regclass);
 >   ALTER TABLE public.car ALTER COLUMN couple_code DROP DEFAULT;
       public       postgres    false    197    196            �
           2604    64461    contract contract_code    DEFAULT     �   ALTER TABLE ONLY public.contract ALTER COLUMN contract_code SET DEFAULT nextval('public."Contract_contract_code_seq"'::regclass);
 E   ALTER TABLE public.contract ALTER COLUMN contract_code DROP DEFAULT;
       public       postgres    false    200    199            �
           2604    64462    couple couple_code    DEFAULT     z   ALTER TABLE ONLY public.couple ALTER COLUMN couple_code SET DEFAULT nextval('public."Couple_couple_code_seq"'::regclass);
 A   ALTER TABLE public.couple ALTER COLUMN couple_code DROP DEFAULT;
       public       postgres    false    202    201            �
           2604    64463    district district_code    DEFAULT     �   ALTER TABLE ONLY public.district ALTER COLUMN district_code SET DEFAULT nextval('public."District_district_code_seq"'::regclass);
 E   ALTER TABLE public.district ALTER COLUMN district_code DROP DEFAULT;
       public       postgres    false    204    203            �
           2604    64464    month report_code    DEFAULT     x   ALTER TABLE ONLY public.month ALTER COLUMN report_code SET DEFAULT nextval('public."Month_report_code_seq"'::regclass);
 @   ALTER TABLE public.month ALTER COLUMN report_code DROP DEFAULT;
       public       postgres    false    206    205            �
           2604    64465    report report_code    DEFAULT     z   ALTER TABLE ONLY public.report ALTER COLUMN report_code SET DEFAULT nextval('public."Report_report_code_seq"'::regclass);
 A   ALTER TABLE public.report ALTER COLUMN report_code DROP DEFAULT;
       public       postgres    false    208    207            �
           2604    64466    service service_code    DEFAULT     ~   ALTER TABLE ONLY public.service ALTER COLUMN service_code SET DEFAULT nextval('public."Service_service_code_seq"'::regclass);
 C   ALTER TABLE public.service ALTER COLUMN service_code DROP DEFAULT;
       public       postgres    false    210    209            �          0    64441    brand 
   TABLE DATA               K   COPY public.brand (brand_name, amo_seats, fuel_type, spending) FROM stdin;
    public       postgres    false    211   i�       r          0    64389    car 
   TABLE DATA               K   COPY public.car (fleet_number, plate, couple_code, brand_name) FROM stdin;
    public       postgres    false    196   ��       u          0    64399    contract 
   TABLE DATA               �   COPY public.contract (contract_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number) FROM stdin;
    public       postgres    false    199   ��       w          0    64407    couple 
   TABLE DATA               A   COPY public.couple (couple_code, driver_1, driver_2) FROM stdin;
    public       postgres    false    201   ��       �          0    64447    discrepancy 
   TABLE DATA               �   COPY public.discrepancy (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel) FROM stdin;
    public       postgres    false    212   ݬ       y          0    64415    district 
   TABLE DATA               @   COPY public.district (district_code, district_name) FROM stdin;
    public       postgres    false    203   ��       �          0    64450    driver 
   TABLE DATA               Q   COPY public.driver ("ID", driver_name, address, phone, distric_code) FROM stdin;
    public       postgres    false    213   �       {          0    64423    month 
   TABLE DATA               8   COPY public.month (month_code, report_code) FROM stdin;
    public       postgres    false    205   4�       }          0    64428    report 
   TABLE DATA               }   COPY public.report (report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total) FROM stdin;
    public       postgres    false    207   Q�       �          0    64456    roadmap 
   TABLE DATA               J   COPY public.roadmap (date, fleet_number, kms, departure_time) FROM stdin;
    public       postgres    false    214   n�                 0    64433    service 
   TABLE DATA               �   COPY public.service (service_code, service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount) FROM stdin;
    public       postgres    false    209   ��       �           0    0    Car_couple_code_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Car_couple_code_seq"', 1, false);
            public       postgres    false    197            �           0    0    Car_fleet_number_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Car_fleet_number_seq"', 1, false);
            public       postgres    false    198            �           0    0    Contract_contract_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Contract_contract_code_seq"', 1, false);
            public       postgres    false    200            �           0    0    Couple_couple_code_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Couple_couple_code_seq"', 1, false);
            public       postgres    false    202            �           0    0    District_district_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."District_district_code_seq"', 1, false);
            public       postgres    false    204            �           0    0    Month_report_code_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Month_report_code_seq"', 1, false);
            public       postgres    false    206            �           0    0    Report_report_code_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Report_report_code_seq"', 1, false);
            public       postgres    false    208            �           0    0    Service_service_code_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Service_service_code_seq"', 1, false);
            public       postgres    false    210            �
           2606    64468    brand Brand_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.brand
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (brand_name);
 <   ALTER TABLE ONLY public.brand DROP CONSTRAINT "Brand_pkey";
       public         postgres    false    211            �
           2606    64470    car Car_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.car
    ADD CONSTRAINT "Car_pkey" PRIMARY KEY (fleet_number);
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT "Car_pkey";
       public         postgres    false    196            �
           2606    64472    contract Contract_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT "Contract_pkey" PRIMARY KEY (contract_code);
 B   ALTER TABLE ONLY public.contract DROP CONSTRAINT "Contract_pkey";
       public         postgres    false    199            �
           2606    64474    couple Couple_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT "Couple_pkey" PRIMARY KEY (couple_code);
 >   ALTER TABLE ONLY public.couple DROP CONSTRAINT "Couple_pkey";
       public         postgres    false    201            �
           2606    64476    discrepancy Discrepancy_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT "Discrepancy_pkey" PRIMARY KEY (month_code, fleet_number);
 H   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT "Discrepancy_pkey";
       public         postgres    false    212    212            �
           2606    64478    district District_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.district
    ADD CONSTRAINT "District_pkey" PRIMARY KEY (district_code);
 B   ALTER TABLE ONLY public.district DROP CONSTRAINT "District_pkey";
       public         postgres    false    203            �
           2606    64480    driver Driver_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT "Driver_pkey" PRIMARY KEY ("ID");
 >   ALTER TABLE ONLY public.driver DROP CONSTRAINT "Driver_pkey";
       public         postgres    false    213            �
           2606    64482    month Month_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.month
    ADD CONSTRAINT "Month_pkey" PRIMARY KEY (month_code);
 <   ALTER TABLE ONLY public.month DROP CONSTRAINT "Month_pkey";
       public         postgres    false    205            �
           2606    64484    report Report_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY public.report
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY (report_code);
 >   ALTER TABLE ONLY public.report DROP CONSTRAINT "Report_pkey";
       public         postgres    false    207            �
           2606    64486    roadmap Roadmap_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.roadmap
    ADD CONSTRAINT "Roadmap_pkey" PRIMARY KEY (date, fleet_number);
 @   ALTER TABLE ONLY public.roadmap DROP CONSTRAINT "Roadmap_pkey";
       public         postgres    false    214    214            �
           2606    64488    service Service_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.service
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY (service_code);
 @   ALTER TABLE ONLY public.service DROP CONSTRAINT "Service_pkey";
       public         postgres    false    209            �
           1259    64489    fki_brand_name    INDEX     D   CREATE INDEX fki_brand_name ON public.car USING btree (brand_name);
 "   DROP INDEX public.fki_brand_name;
       public         postgres    false    196            �
           1259    64490    fki_couple_code    INDEX     F   CREATE INDEX fki_couple_code ON public.car USING btree (couple_code);
 #   DROP INDEX public.fki_couple_code;
       public         postgres    false    196            �
           1259    64491    fki_d    INDEX     C   CREATE INDEX fki_d ON public.discrepancy USING btree (month_code);
    DROP INDEX public.fki_d;
       public         postgres    false    212            �
           1259    64492    fki_distric_code    INDEX     K   CREATE INDEX fki_distric_code ON public.driver USING btree (distric_code);
 $   DROP INDEX public.fki_distric_code;
       public         postgres    false    213            �
           1259    64493    fki_driver_1    INDEX     C   CREATE INDEX fki_driver_1 ON public.couple USING btree (driver_1);
     DROP INDEX public.fki_driver_1;
       public         postgres    false    201            �
           1259    64494    fki_driver_2    INDEX     C   CREATE INDEX fki_driver_2 ON public.couple USING btree (driver_2);
     DROP INDEX public.fki_driver_2;
       public         postgres    false    201            �
           1259    64495    fki_fleet_number    INDEX     P   CREATE INDEX fki_fleet_number ON public.discrepancy USING btree (fleet_number);
 $   DROP INDEX public.fki_fleet_number;
       public         postgres    false    212            �
           1259    64496    fki_report_code    INDEX     H   CREATE INDEX fki_report_code ON public.month USING btree (report_code);
 #   DROP INDEX public.fki_report_code;
       public         postgres    false    205            �
           2606    64497    car brand_name    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT brand_name FOREIGN KEY (brand_name) REFERENCES public.brand(brand_name) NOT VALID;
 8   ALTER TABLE ONLY public.car DROP CONSTRAINT brand_name;
       public       postgres    false    196    211    2789            �
           2606    64502    car couple_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.car
    ADD CONSTRAINT couple_code FOREIGN KEY (couple_code) REFERENCES public.couple(couple_code) NOT VALID;
 9   ALTER TABLE ONLY public.car DROP CONSTRAINT couple_code;
       public       postgres    false    201    2776    196            �
           2606    64507    driver distric_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.driver
    ADD CONSTRAINT distric_code FOREIGN KEY (distric_code) REFERENCES public.district(district_code) NOT VALID;
 =   ALTER TABLE ONLY public.driver DROP CONSTRAINT distric_code;
       public       postgres    false    2780    203    213            �
           2606    64512    couple driver_1    FK CONSTRAINT     |   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT driver_1 FOREIGN KEY (driver_1) REFERENCES public.driver("ID") NOT VALID;
 9   ALTER TABLE ONLY public.couple DROP CONSTRAINT driver_1;
       public       postgres    false    2795    213    201            �
           2606    64517    couple driver_2    FK CONSTRAINT     |   ALTER TABLE ONLY public.couple
    ADD CONSTRAINT driver_2 FOREIGN KEY (driver_2) REFERENCES public.driver("ID") NOT VALID;
 9   ALTER TABLE ONLY public.couple DROP CONSTRAINT driver_2;
       public       postgres    false    2795    201    213            �
           2606    64522    discrepancy fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) NOT VALID;
 B   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT fleet_number;
       public       postgres    false    196    212    2770            �
           2606    64527    roadmap fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.roadmap
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) NOT VALID;
 >   ALTER TABLE ONLY public.roadmap DROP CONSTRAINT fleet_number;
       public       postgres    false    214    196    2770            �
           2606    64532    contract fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public.contract
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public.car(fleet_number) NOT VALID;
 ?   ALTER TABLE ONLY public.contract DROP CONSTRAINT fleet_number;
       public       postgres    false    196    199    2770            �
           2606    64537    discrepancy month_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.discrepancy
    ADD CONSTRAINT month_code FOREIGN KEY (month_code) REFERENCES public.month(month_code) NOT VALID;
 @   ALTER TABLE ONLY public.discrepancy DROP CONSTRAINT month_code;
       public       postgres    false    205    212    2782            �
           2606    64542    month report_code    FK CONSTRAINT     �   ALTER TABLE ONLY public.month
    ADD CONSTRAINT report_code FOREIGN KEY (report_code) REFERENCES public.report(report_code) ON DELETE CASCADE NOT VALID;
 ;   ALTER TABLE ONLY public.month DROP CONSTRAINT report_code;
       public       postgres    false    2785    205    207            �      x������ � �      r      x������ � �      u      x������ � �      w      x������ � �      �      x������ � �      y      x������ � �      �      x������ � �      {      x������ � �      }      x������ � �      �      x������ � �            x������ � �     