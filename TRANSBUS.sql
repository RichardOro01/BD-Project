PGDMP         -                {           TRANSBUS    10.23    10.23 [    i           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            j           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            k           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            l           1262    40995    TRANSBUS    DATABASE     �   CREATE DATABASE "TRANSBUS" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';
    DROP DATABASE "TRANSBUS";
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            m           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    3                        3079    12924    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            n           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    41054    Brand    TABLE     �   CREATE TABLE public."Brand" (
    brand_name character varying NOT NULL,
    amo_seats integer,
    fuel_type character varying,
    spending double precision
);
    DROP TABLE public."Brand";
       public         postgres    false    3            �            1259    41044    Car    TABLE     �   CREATE TABLE public."Car" (
    fleet_number integer NOT NULL,
    plate character varying,
    couple_code integer NOT NULL,
    brand_name character varying
);
    DROP TABLE public."Car";
       public         postgres    false    3            �            1259    41042    Car_couple_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Car_couple_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public."Car_couple_code_seq";
       public       postgres    false    3    206            o           0    0    Car_couple_code_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public."Car_couple_code_seq" OWNED BY public."Car".couple_code;
            public       postgres    false    205            �            1259    41040    Car_fleet_number_seq    SEQUENCE     �   CREATE SEQUENCE public."Car_fleet_number_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public."Car_fleet_number_seq";
       public       postgres    false    206    3            p           0    0    Car_fleet_number_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public."Car_fleet_number_seq" OWNED BY public."Car".fleet_number;
            public       postgres    false    204            �            1259    41152    Contract    TABLE        CREATE TABLE public."Contract" (
    contract_code integer NOT NULL,
    applicant_name character varying,
    start_date date,
    end_date date,
    contract_kms double precision,
    contract_amount double precision,
    contract_country character varying,
    fleet_number integer
);
    DROP TABLE public."Contract";
       public         postgres    false    3            �            1259    41150    Contract_contract_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Contract_contract_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."Contract_contract_code_seq";
       public       postgres    false    3    214            q           0    0    Contract_contract_code_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."Contract_contract_code_seq" OWNED BY public."Contract".contract_code;
            public       postgres    false    213            �            1259    41113    Couple    TABLE     �   CREATE TABLE public."Couple" (
    couple_code integer NOT NULL,
    driver_1 character varying,
    driver_2 character varying
);
    DROP TABLE public."Couple";
       public         postgres    false    3            �            1259    41111    Couple_couple_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Couple_couple_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Couple_couple_code_seq";
       public       postgres    false    211    3            r           0    0    Couple_couple_code_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Couple_couple_code_seq" OWNED BY public."Couple".couple_code;
            public       postgres    false    210            �            1259    41082    Discrepancy    TABLE     @  CREATE TABLE public."Discrepancy" (
    month_code integer NOT NULL,
    fleet_number integer NOT NULL,
    planned_kms double precision,
    tours_kms double precision,
    difference_kms double precision,
    planned_fuel double precision,
    consumed_fuel double precision,
    dif_spending_fuel double precision
);
 !   DROP TABLE public."Discrepancy";
       public         postgres    false    3            �            1259    41020    District    TABLE     l   CREATE TABLE public."District" (
    district_code integer NOT NULL,
    district_name character varying
);
    DROP TABLE public."District";
       public         postgres    false    3            �            1259    41018    District_district_code_seq    SEQUENCE     �   CREATE SEQUENCE public."District_district_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public."District_district_code_seq";
       public       postgres    false    3    201            s           0    0    District_district_code_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE public."District_district_code_seq" OWNED BY public."District".district_code;
            public       postgres    false    200            �            1259    41068    Driver    TABLE     �   CREATE TABLE public."Driver" (
    "ID" character varying NOT NULL,
    driver_name character varying,
    address character varying,
    phone character varying,
    distric_code integer
);
    DROP TABLE public."Driver";
       public         postgres    false    3            �            1259    40998    Month    TABLE     c   CREATE TABLE public."Month" (
    month_code integer NOT NULL,
    report_code integer NOT NULL
);
    DROP TABLE public."Month";
       public         postgres    false    3            �            1259    40996    Month_report_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Month_report_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public."Month_report_code_seq";
       public       postgres    false    197    3            t           0    0    Month_report_code_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public."Month_report_code_seq" OWNED BY public."Month".report_code;
            public       postgres    false    196            �            1259    41006    Report    TABLE     �   CREATE TABLE public."Report" (
    report_code integer NOT NULL,
    amo_services integer,
    amo_rents integer,
    income_rents double precision,
    amo_others integer,
    income_others double precision,
    income_total double precision
);
    DROP TABLE public."Report";
       public         postgres    false    3            �            1259    41004    Report_report_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Report_report_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."Report_report_code_seq";
       public       postgres    false    3    199            u           0    0    Report_report_code_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public."Report_report_code_seq" OWNED BY public."Report".report_code;
            public       postgres    false    198            �            1259    41134    Roadmap    TABLE     �   CREATE TABLE public."Roadmap" (
    date date NOT NULL,
    fleet_number integer NOT NULL,
    kms double precision,
    departure_time time without time zone
);
    DROP TABLE public."Roadmap";
       public         postgres    false    3            �            1259    41031    Service    TABLE     q  CREATE TABLE public."Service" (
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
    DROP TABLE public."Service";
       public         postgres    false    3            �            1259    41029    Service_service_code_seq    SEQUENCE     �   CREATE SEQUENCE public."Service_service_code_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public."Service_service_code_seq";
       public       postgres    false    203    3            v           0    0    Service_service_code_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public."Service_service_code_seq" OWNED BY public."Service".service_code;
            public       postgres    false    202            �
           2604    41047    Car fleet_number    DEFAULT     x   ALTER TABLE ONLY public."Car" ALTER COLUMN fleet_number SET DEFAULT nextval('public."Car_fleet_number_seq"'::regclass);
 A   ALTER TABLE public."Car" ALTER COLUMN fleet_number DROP DEFAULT;
       public       postgres    false    204    206    206            �
           2604    41048    Car couple_code    DEFAULT     v   ALTER TABLE ONLY public."Car" ALTER COLUMN couple_code SET DEFAULT nextval('public."Car_couple_code_seq"'::regclass);
 @   ALTER TABLE public."Car" ALTER COLUMN couple_code DROP DEFAULT;
       public       postgres    false    205    206    206            �
           2604    41155    Contract contract_code    DEFAULT     �   ALTER TABLE ONLY public."Contract" ALTER COLUMN contract_code SET DEFAULT nextval('public."Contract_contract_code_seq"'::regclass);
 G   ALTER TABLE public."Contract" ALTER COLUMN contract_code DROP DEFAULT;
       public       postgres    false    213    214    214            �
           2604    41116    Couple couple_code    DEFAULT     |   ALTER TABLE ONLY public."Couple" ALTER COLUMN couple_code SET DEFAULT nextval('public."Couple_couple_code_seq"'::regclass);
 C   ALTER TABLE public."Couple" ALTER COLUMN couple_code DROP DEFAULT;
       public       postgres    false    210    211    211            �
           2604    41023    District district_code    DEFAULT     �   ALTER TABLE ONLY public."District" ALTER COLUMN district_code SET DEFAULT nextval('public."District_district_code_seq"'::regclass);
 G   ALTER TABLE public."District" ALTER COLUMN district_code DROP DEFAULT;
       public       postgres    false    200    201    201            �
           2604    41001    Month report_code    DEFAULT     z   ALTER TABLE ONLY public."Month" ALTER COLUMN report_code SET DEFAULT nextval('public."Month_report_code_seq"'::regclass);
 B   ALTER TABLE public."Month" ALTER COLUMN report_code DROP DEFAULT;
       public       postgres    false    196    197    197            �
           2604    41009    Report report_code    DEFAULT     |   ALTER TABLE ONLY public."Report" ALTER COLUMN report_code SET DEFAULT nextval('public."Report_report_code_seq"'::regclass);
 C   ALTER TABLE public."Report" ALTER COLUMN report_code DROP DEFAULT;
       public       postgres    false    198    199    199            �
           2604    41034    Service service_code    DEFAULT     �   ALTER TABLE ONLY public."Service" ALTER COLUMN service_code SET DEFAULT nextval('public."Service_service_code_seq"'::regclass);
 E   ALTER TABLE public."Service" ALTER COLUMN service_code DROP DEFAULT;
       public       postgres    false    203    202    203            _          0    41054    Brand 
   TABLE DATA               M   COPY public."Brand" (brand_name, amo_seats, fuel_type, spending) FROM stdin;
    public       postgres    false    207   \g       ^          0    41044    Car 
   TABLE DATA               M   COPY public."Car" (fleet_number, plate, couple_code, brand_name) FROM stdin;
    public       postgres    false    206   yg       f          0    41152    Contract 
   TABLE DATA               �   COPY public."Contract" (contract_code, applicant_name, start_date, end_date, contract_kms, contract_amount, contract_country, fleet_number) FROM stdin;
    public       postgres    false    214   �g       c          0    41113    Couple 
   TABLE DATA               C   COPY public."Couple" (couple_code, driver_1, driver_2) FROM stdin;
    public       postgres    false    211   �g       a          0    41082    Discrepancy 
   TABLE DATA               �   COPY public."Discrepancy" (month_code, fleet_number, planned_kms, tours_kms, difference_kms, planned_fuel, consumed_fuel, dif_spending_fuel) FROM stdin;
    public       postgres    false    209   �g       Y          0    41020    District 
   TABLE DATA               B   COPY public."District" (district_code, district_name) FROM stdin;
    public       postgres    false    201   �g       `          0    41068    Driver 
   TABLE DATA               S   COPY public."Driver" ("ID", driver_name, address, phone, distric_code) FROM stdin;
    public       postgres    false    208   
h       U          0    40998    Month 
   TABLE DATA               :   COPY public."Month" (month_code, report_code) FROM stdin;
    public       postgres    false    197   'h       W          0    41006    Report 
   TABLE DATA                  COPY public."Report" (report_code, amo_services, amo_rents, income_rents, amo_others, income_others, income_total) FROM stdin;
    public       postgres    false    199   Dh       d          0    41134    Roadmap 
   TABLE DATA               L   COPY public."Roadmap" (date, fleet_number, kms, departure_time) FROM stdin;
    public       postgres    false    212   ah       [          0    41031    Service 
   TABLE DATA               �   COPY public."Service" (service_code, service_name, request_number, tour_group_code, country, pickup_place, pickup_time, pax, service_kms, amount) FROM stdin;
    public       postgres    false    203   ~h       w           0    0    Car_couple_code_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public."Car_couple_code_seq"', 1, false);
            public       postgres    false    205            x           0    0    Car_fleet_number_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Car_fleet_number_seq"', 1, false);
            public       postgres    false    204            y           0    0    Contract_contract_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."Contract_contract_code_seq"', 1, false);
            public       postgres    false    213            z           0    0    Couple_couple_code_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Couple_couple_code_seq"', 1, false);
            public       postgres    false    210            {           0    0    District_district_code_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('public."District_district_code_seq"', 1, false);
            public       postgres    false    200            |           0    0    Month_report_code_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Month_report_code_seq"', 1, false);
            public       postgres    false    196            }           0    0    Report_report_code_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."Report_report_code_seq"', 1, false);
            public       postgres    false    198            ~           0    0    Service_service_code_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Service_service_code_seq"', 1, false);
            public       postgres    false    202            �
           2606    41061    Brand Brand_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Brand"
    ADD CONSTRAINT "Brand_pkey" PRIMARY KEY (brand_name);
 >   ALTER TABLE ONLY public."Brand" DROP CONSTRAINT "Brand_pkey";
       public         postgres    false    207            �
           2606    41053    Car Car_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."Car"
    ADD CONSTRAINT "Car_pkey" PRIMARY KEY (fleet_number);
 :   ALTER TABLE ONLY public."Car" DROP CONSTRAINT "Car_pkey";
       public         postgres    false    206            �
           2606    41160    Contract Contract_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."Contract"
    ADD CONSTRAINT "Contract_pkey" PRIMARY KEY (contract_code);
 D   ALTER TABLE ONLY public."Contract" DROP CONSTRAINT "Contract_pkey";
       public         postgres    false    214            �
           2606    41121    Couple Couple_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Couple"
    ADD CONSTRAINT "Couple_pkey" PRIMARY KEY (couple_code);
 @   ALTER TABLE ONLY public."Couple" DROP CONSTRAINT "Couple_pkey";
       public         postgres    false    211            �
           2606    41086    Discrepancy Discrepancy_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."Discrepancy"
    ADD CONSTRAINT "Discrepancy_pkey" PRIMARY KEY (month_code, fleet_number);
 J   ALTER TABLE ONLY public."Discrepancy" DROP CONSTRAINT "Discrepancy_pkey";
       public         postgres    false    209    209            �
           2606    41028    District District_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY public."District"
    ADD CONSTRAINT "District_pkey" PRIMARY KEY (district_code);
 D   ALTER TABLE ONLY public."District" DROP CONSTRAINT "District_pkey";
       public         postgres    false    201            �
           2606    41075    Driver Driver_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public."Driver"
    ADD CONSTRAINT "Driver_pkey" PRIMARY KEY ("ID");
 @   ALTER TABLE ONLY public."Driver" DROP CONSTRAINT "Driver_pkey";
       public         postgres    false    208            �
           2606    41003    Month Month_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public."Month"
    ADD CONSTRAINT "Month_pkey" PRIMARY KEY (month_code);
 >   ALTER TABLE ONLY public."Month" DROP CONSTRAINT "Month_pkey";
       public         postgres    false    197            �
           2606    41011    Report Report_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY public."Report"
    ADD CONSTRAINT "Report_pkey" PRIMARY KEY (report_code);
 @   ALTER TABLE ONLY public."Report" DROP CONSTRAINT "Report_pkey";
       public         postgres    false    199            �
           2606    41138    Roadmap Roadmap_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public."Roadmap"
    ADD CONSTRAINT "Roadmap_pkey" PRIMARY KEY (date, fleet_number);
 B   ALTER TABLE ONLY public."Roadmap" DROP CONSTRAINT "Roadmap_pkey";
       public         postgres    false    212    212            �
           2606    41039    Service Service_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public."Service"
    ADD CONSTRAINT "Service_pkey" PRIMARY KEY (service_code);
 B   ALTER TABLE ONLY public."Service" DROP CONSTRAINT "Service_pkey";
       public         postgres    false    203            �
           1259    41067    fki_brand_name    INDEX     F   CREATE INDEX fki_brand_name ON public."Car" USING btree (brand_name);
 "   DROP INDEX public.fki_brand_name;
       public         postgres    false    206            �
           1259    41149    fki_couple_code    INDEX     H   CREATE INDEX fki_couple_code ON public."Car" USING btree (couple_code);
 #   DROP INDEX public.fki_couple_code;
       public         postgres    false    206            �
           1259    41092    fki_d    INDEX     E   CREATE INDEX fki_d ON public."Discrepancy" USING btree (month_code);
    DROP INDEX public.fki_d;
       public         postgres    false    209            �
           1259    41081    fki_distric_code    INDEX     M   CREATE INDEX fki_distric_code ON public."Driver" USING btree (distric_code);
 $   DROP INDEX public.fki_distric_code;
       public         postgres    false    208            �
           1259    41127    fki_driver_1    INDEX     E   CREATE INDEX fki_driver_1 ON public."Couple" USING btree (driver_1);
     DROP INDEX public.fki_driver_1;
       public         postgres    false    211            �
           1259    41133    fki_driver_2    INDEX     E   CREATE INDEX fki_driver_2 ON public."Couple" USING btree (driver_2);
     DROP INDEX public.fki_driver_2;
       public         postgres    false    211            �
           1259    41098    fki_fleet_number    INDEX     R   CREATE INDEX fki_fleet_number ON public."Discrepancy" USING btree (fleet_number);
 $   DROP INDEX public.fki_fleet_number;
       public         postgres    false    209            �
           1259    41017    fki_report_code    INDEX     J   CREATE INDEX fki_report_code ON public."Month" USING btree (report_code);
 #   DROP INDEX public.fki_report_code;
       public         postgres    false    197            �
           2606    41062    Car brand_name    FK CONSTRAINT     �   ALTER TABLE ONLY public."Car"
    ADD CONSTRAINT brand_name FOREIGN KEY (brand_name) REFERENCES public."Brand"(brand_name) NOT VALID;
 :   ALTER TABLE ONLY public."Car" DROP CONSTRAINT brand_name;
       public       postgres    false    207    206    2753            �
           2606    41144    Car couple_code    FK CONSTRAINT     �   ALTER TABLE ONLY public."Car"
    ADD CONSTRAINT couple_code FOREIGN KEY (couple_code) REFERENCES public."Couple"(couple_code) NOT VALID;
 ;   ALTER TABLE ONLY public."Car" DROP CONSTRAINT couple_code;
       public       postgres    false    206    2762    211            �
           2606    41076    Driver distric_code    FK CONSTRAINT     �   ALTER TABLE ONLY public."Driver"
    ADD CONSTRAINT distric_code FOREIGN KEY (distric_code) REFERENCES public."District"(district_code) NOT VALID;
 ?   ALTER TABLE ONLY public."Driver" DROP CONSTRAINT distric_code;
       public       postgres    false    2745    201    208            �
           2606    41122    Couple driver_1    FK CONSTRAINT     �   ALTER TABLE ONLY public."Couple"
    ADD CONSTRAINT driver_1 FOREIGN KEY (driver_1) REFERENCES public."Driver"("ID") NOT VALID;
 ;   ALTER TABLE ONLY public."Couple" DROP CONSTRAINT driver_1;
       public       postgres    false    2755    211    208            �
           2606    41128    Couple driver_2    FK CONSTRAINT     �   ALTER TABLE ONLY public."Couple"
    ADD CONSTRAINT driver_2 FOREIGN KEY (driver_2) REFERENCES public."Driver"("ID") NOT VALID;
 ;   ALTER TABLE ONLY public."Couple" DROP CONSTRAINT driver_2;
       public       postgres    false    2755    211    208            �
           2606    41093    Discrepancy fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public."Discrepancy"
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public."Car"(fleet_number) NOT VALID;
 D   ALTER TABLE ONLY public."Discrepancy" DROP CONSTRAINT fleet_number;
       public       postgres    false    209    2749    206            �
           2606    41139    Roadmap fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public."Roadmap"
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public."Car"(fleet_number) NOT VALID;
 @   ALTER TABLE ONLY public."Roadmap" DROP CONSTRAINT fleet_number;
       public       postgres    false    206    2749    212            �
           2606    41161    Contract fleet_number    FK CONSTRAINT     �   ALTER TABLE ONLY public."Contract"
    ADD CONSTRAINT fleet_number FOREIGN KEY (fleet_number) REFERENCES public."Car"(fleet_number) NOT VALID;
 A   ALTER TABLE ONLY public."Contract" DROP CONSTRAINT fleet_number;
       public       postgres    false    214    206    2749            �
           2606    41087    Discrepancy month_code    FK CONSTRAINT     �   ALTER TABLE ONLY public."Discrepancy"
    ADD CONSTRAINT month_code FOREIGN KEY (month_code) REFERENCES public."Month"(month_code) NOT VALID;
 B   ALTER TABLE ONLY public."Discrepancy" DROP CONSTRAINT month_code;
       public       postgres    false    197    2740    209            �
           2606    41012    Month report_code    FK CONSTRAINT     �   ALTER TABLE ONLY public."Month"
    ADD CONSTRAINT report_code FOREIGN KEY (report_code) REFERENCES public."Report"(report_code) ON DELETE CASCADE NOT VALID;
 =   ALTER TABLE ONLY public."Month" DROP CONSTRAINT report_code;
       public       postgres    false    2743    197    199            _      x������ � �      ^      x������ � �      f      x������ � �      c      x������ � �      a      x������ � �      Y      x������ � �      `      x������ � �      U      x������ � �      W      x������ � �      d      x������ � �      [      x������ � �     