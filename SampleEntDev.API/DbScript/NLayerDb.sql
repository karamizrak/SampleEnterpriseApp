--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11
-- Dumped by pg_dump version 12.11

-- Started on 2022-07-08 03:12:08

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1254';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE nlayerdb;
--
-- TOC entry 2948 (class 1262 OID 16394)
-- Name: nlayerdb; Type: DATABASE; Schema: -; Owner: -
--

CREATE DATABASE nlayerdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Turkish_Turkey.1254' LC_CTYPE = 'Turkish_Turkey.1254';


\connect nlayerdb

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1254';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16395)
-- Name: ecommerce; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA ecommerce;


--
-- TOC entry 9 (class 2615 OID 16492)
-- Name: management; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA management;


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 205 (class 1259 OID 16409)
-- Name: BaseEntity; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."BaseEntity" (
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_date timestamp without time zone
);


--
-- TOC entry 206 (class 1259 OID 16416)
-- Name: category; Type: TABLE; Schema: ecommerce; Owner: -
--

CREATE TABLE ecommerce.category (
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone,
    name text,
    description text,
    id integer NOT NULL
)
INHERITS (public."BaseEntity");


--
-- TOC entry 210 (class 1259 OID 16458)
-- Name: category_id_seq; Type: SEQUENCE; Schema: ecommerce; Owner: -
--

CREATE SEQUENCE ecommerce.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2949 (class 0 OID 0)
-- Dependencies: 210
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: ecommerce; Owner: -
--

ALTER SEQUENCE ecommerce.category_id_seq OWNED BY ecommerce.category.id;


--
-- TOC entry 207 (class 1259 OID 16424)
-- Name: product; Type: TABLE; Schema: ecommerce; Owner: -
--

CREATE TABLE ecommerce.product (
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone,
    name text,
    stock integer NOT NULL,
    price real NOT NULL,
    category_id integer,
    id integer NOT NULL
)
INHERITS (public."BaseEntity");


--
-- TOC entry 204 (class 1259 OID 16398)
-- Name: product_feature; Type: TABLE; Schema: ecommerce; Owner: -
--

CREATE TABLE ecommerce.product_feature (
    color text,
    height integer,
    width integer,
    product_id integer NOT NULL
);


--
-- TOC entry 211 (class 1259 OID 16469)
-- Name: product_id_seq; Type: SEQUENCE; Schema: ecommerce; Owner: -
--

CREATE SEQUENCE ecommerce.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2950 (class 0 OID 0)
-- Dependencies: 211
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: ecommerce; Owner: -
--

ALTER SEQUENCE ecommerce.product_id_seq OWNED BY ecommerce.product.id;


--
-- TOC entry 209 (class 1259 OID 16448)
-- Name: test; Type: TABLE; Schema: ecommerce; Owner: -
--

CREATE TABLE ecommerce.test (
    id integer NOT NULL,
    ad character varying,
    soyad character varying
)
INHERITS (public."BaseEntity");


--
-- TOC entry 208 (class 1259 OID 16446)
-- Name: test_id_seq; Type: SEQUENCE; Schema: ecommerce; Owner: -
--

CREATE SEQUENCE ecommerce.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2951 (class 0 OID 0)
-- Dependencies: 208
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: ecommerce; Owner: -
--

ALTER SEQUENCE ecommerce.test_id_seq OWNED BY ecommerce.test.id;


--
-- TOC entry 216 (class 1259 OID 16518)
-- Name: functions_id_seq; Type: SEQUENCE; Schema: management; Owner: -
--

CREATE SEQUENCE management.functions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


--
-- TOC entry 217 (class 1259 OID 16520)
-- Name: Functions; Type: TABLE; Schema: management; Owner: -
--

CREATE TABLE management."Functions" (
    id integer DEFAULT nextval('management.functions_id_seq'::regclass) NOT NULL,
    function_name character varying NOT NULL,
    area_name character varying,
    controller_name character varying NOT NULL,
    action_name character varying NOT NULL
)
INHERITS (public."BaseEntity");


--
-- TOC entry 220 (class 1259 OID 16551)
-- Name: RoleToFunctions; Type: TABLE; Schema: management; Owner: -
--

CREATE TABLE management."RoleToFunctions" (
    id integer NOT NULL,
    role_id integer NOT NULL,
    function_id integer NOT NULL
)
INHERITS (public."BaseEntity");


--
-- TOC entry 219 (class 1259 OID 16549)
-- Name: RoleToFunctions_id_seq; Type: SEQUENCE; Schema: management; Owner: -
--

CREATE SEQUENCE management."RoleToFunctions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2952 (class 0 OID 0)
-- Dependencies: 219
-- Name: RoleToFunctions_id_seq; Type: SEQUENCE OWNED BY; Schema: management; Owner: -
--

ALTER SEQUENCE management."RoleToFunctions_id_seq" OWNED BY management."RoleToFunctions".id;


--
-- TOC entry 215 (class 1259 OID 16508)
-- Name: Roles; Type: TABLE; Schema: management; Owner: -
--

CREATE TABLE management."Roles" (
    id integer NOT NULL,
    role_name character varying NOT NULL
)
INHERITS (public."BaseEntity");


--
-- TOC entry 214 (class 1259 OID 16506)
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: management; Owner: -
--

CREATE SEQUENCE management."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2953 (class 0 OID 0)
-- Dependencies: 214
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: management; Owner: -
--

ALTER SEQUENCE management."Roles_id_seq" OWNED BY management."Roles".id;


--
-- TOC entry 218 (class 1259 OID 16532)
-- Name: UserToFuncitons; Type: TABLE; Schema: management; Owner: -
--

CREATE TABLE management."UserToFuncitons" (
    user_id integer NOT NULL,
    function_id integer NOT NULL,
    validity_period_start_time timestamp without time zone,
    validity_period_end_time timestamp without time zone,
    id integer NOT NULL
)
INHERITS (public."BaseEntity");


--
-- TOC entry 223 (class 1259 OID 16577)
-- Name: UserToFunciton_id_seq; Type: SEQUENCE; Schema: management; Owner: -
--

CREATE SEQUENCE management."UserToFunciton_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2954 (class 0 OID 0)
-- Dependencies: 223
-- Name: UserToFunciton_id_seq; Type: SEQUENCE OWNED BY; Schema: management; Owner: -
--

ALTER SEQUENCE management."UserToFunciton_id_seq" OWNED BY management."UserToFuncitons".id;


--
-- TOC entry 221 (class 1259 OID 16568)
-- Name: UserToRoles_id_seq; Type: SEQUENCE; Schema: management; Owner: -
--

CREATE SEQUENCE management."UserToRoles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


--
-- TOC entry 222 (class 1259 OID 16570)
-- Name: UserToRoles; Type: TABLE; Schema: management; Owner: -
--

CREATE TABLE management."UserToRoles" (
    id integer DEFAULT nextval('management."UserToRoles_id_seq"'::regclass) NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    validity_period_start_time timestamp without time zone,
    validity_period_end_time timestamp without time zone
)
INHERITS (public."BaseEntity");


--
-- TOC entry 213 (class 1259 OID 16495)
-- Name: Users; Type: TABLE; Schema: management; Owner: -
--

CREATE TABLE management."Users" (
    id integer NOT NULL,
    identity_number bigint,
    name character varying NOT NULL,
    surename character varying NOT NULL,
    e_mail character varying NOT NULL,
    password character varying NOT NULL,
    last_login_datetime timestamp without time zone,
    record_status smallint NOT NULL,
    last_modifier_id integer NOT NULL,
    refresh_token character varying,
    refresh_token_end_date timestamp without time zone
)
INHERITS (public."BaseEntity");


--
-- TOC entry 212 (class 1259 OID 16493)
-- Name: User_id_seq; Type: SEQUENCE; Schema: management; Owner: -
--

CREATE SEQUENCE management."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2955 (class 0 OID 0)
-- Dependencies: 212
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: management; Owner: -
--

ALTER SEQUENCE management."User_id_seq" OWNED BY management."Users".id;


--
-- TOC entry 2754 (class 2604 OID 16460)
-- Name: category id; Type: DEFAULT; Schema: ecommerce; Owner: -
--

ALTER TABLE ONLY ecommerce.category ALTER COLUMN id SET DEFAULT nextval('ecommerce.category_id_seq'::regclass);


--
-- TOC entry 2756 (class 2604 OID 16471)
-- Name: product id; Type: DEFAULT; Schema: ecommerce; Owner: -
--

ALTER TABLE ONLY ecommerce.product ALTER COLUMN id SET DEFAULT nextval('ecommerce.product_id_seq'::regclass);


--
-- TOC entry 2757 (class 2604 OID 16451)
-- Name: test created_date; Type: DEFAULT; Schema: ecommerce; Owner: -
--

ALTER TABLE ONLY ecommerce.test ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- TOC entry 2758 (class 2604 OID 16452)
-- Name: test id; Type: DEFAULT; Schema: ecommerce; Owner: -
--

ALTER TABLE ONLY ecommerce.test ALTER COLUMN id SET DEFAULT nextval('ecommerce.test_id_seq'::regclass);


--
-- TOC entry 2763 (class 2604 OID 16523)
-- Name: Functions created_date; Type: DEFAULT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."Functions" ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- TOC entry 2767 (class 2604 OID 16554)
-- Name: RoleToFunctions created_date; Type: DEFAULT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."RoleToFunctions" ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- TOC entry 2768 (class 2604 OID 16614)
-- Name: RoleToFunctions id; Type: DEFAULT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."RoleToFunctions" ALTER COLUMN id SET DEFAULT nextval('management."RoleToFunctions_id_seq"'::regclass);


--
-- TOC entry 2761 (class 2604 OID 16511)
-- Name: Roles created_date; Type: DEFAULT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."Roles" ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- TOC entry 2762 (class 2604 OID 16512)
-- Name: Roles id; Type: DEFAULT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."Roles" ALTER COLUMN id SET DEFAULT nextval('management."Roles_id_seq"'::regclass);


--
-- TOC entry 2765 (class 2604 OID 16535)
-- Name: UserToFuncitons created_date; Type: DEFAULT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."UserToFuncitons" ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- TOC entry 2766 (class 2604 OID 16579)
-- Name: UserToFuncitons id; Type: DEFAULT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."UserToFuncitons" ALTER COLUMN id SET DEFAULT nextval('management."UserToFunciton_id_seq"'::regclass);


--
-- TOC entry 2769 (class 2604 OID 16573)
-- Name: UserToRoles created_date; Type: DEFAULT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."UserToRoles" ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- TOC entry 2759 (class 2604 OID 16498)
-- Name: Users created_date; Type: DEFAULT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."Users" ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- TOC entry 2760 (class 2604 OID 16499)
-- Name: Users id; Type: DEFAULT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."Users" ALTER COLUMN id SET DEFAULT nextval('management."User_id_seq"'::regclass);


--
-- TOC entry 2925 (class 0 OID 16416)
-- Dependencies: 206
-- Data for Name: category; Type: TABLE DATA; Schema: ecommerce; Owner: -
--

INSERT INTO ecommerce.category (created_date, updated_date, name, description, id) VALUES ('2022-06-23 03:10:01.301015', NULL, 'kalemler', NULL, 1);
INSERT INTO ecommerce.category (created_date, updated_date, name, description, id) VALUES ('2022-06-23 03:10:01.301015', NULL, 'defterler', NULL, 2);
INSERT INTO ecommerce.category (created_date, updated_date, name, description, id) VALUES ('2022-06-23 03:10:01.301015', NULL, 'silgiler', NULL, 3);


--
-- TOC entry 2926 (class 0 OID 16424)
-- Dependencies: 207
-- Data for Name: product; Type: TABLE DATA; Schema: ecommerce; Owner: -
--

INSERT INTO ecommerce.product (created_date, updated_date, name, stock, price, category_id, id) VALUES ('2022-06-23 03:10:51.17269', NULL, 'tükenmez kalem', 10, 2, 1, 1);
INSERT INTO ecommerce.product (created_date, updated_date, name, stock, price, category_id, id) VALUES ('2022-06-23 03:10:51.17269', NULL, 'mavi silgi', 50, 1, 3, 3);
INSERT INTO ecommerce.product (created_date, updated_date, name, stock, price, category_id, id) VALUES ('2022-06-23 03:10:51.17269', NULL, 'büyük defeter', 20, 3, 1, 2);
INSERT INTO ecommerce.product (created_date, updated_date, name, stock, price, category_id, id) VALUES ('2022-06-27 01:19:22.54287', NULL, 'aa', 1, 2, 1, 6);
INSERT INTO ecommerce.product (created_date, updated_date, name, stock, price, category_id, id) VALUES ('2022-06-28 00:31:37.556184', NULL, 'string', 2, 1, 2, 8);


--
-- TOC entry 2923 (class 0 OID 16398)
-- Dependencies: 204
-- Data for Name: product_feature; Type: TABLE DATA; Schema: ecommerce; Owner: -
--

INSERT INTO ecommerce.product_feature (color, height, width, product_id) VALUES ('kýrmýzý', 12, 12, 1);
INSERT INTO ecommerce.product_feature (color, height, width, product_id) VALUES ('mavi', 11, 11, 2);
INSERT INTO ecommerce.product_feature (color, height, width, product_id) VALUES ('sarý', 10, 10, 3);


--
-- TOC entry 2928 (class 0 OID 16448)
-- Dependencies: 209
-- Data for Name: test; Type: TABLE DATA; Schema: ecommerce; Owner: -
--



--
-- TOC entry 2936 (class 0 OID 16520)
-- Dependencies: 217
-- Data for Name: Functions; Type: TABLE DATA; Schema: management; Owner: -
--

INSERT INTO management."Functions" (created_date, updated_date, id, function_name, area_name, controller_name, action_name) VALUES ('2022-07-08 02:27:53.083386', NULL, 1, 'All Category', 'ECommerce', 'Category', 'GetAll');
INSERT INTO management."Functions" (created_date, updated_date, id, function_name, area_name, controller_name, action_name) VALUES ('2022-07-08 02:28:50.083243', NULL, 2, 'Get By Id Function', 'ECommerce', 'Category', 'GetById');


--
-- TOC entry 2939 (class 0 OID 16551)
-- Dependencies: 220
-- Data for Name: RoleToFunctions; Type: TABLE DATA; Schema: management; Owner: -
--



--
-- TOC entry 2934 (class 0 OID 16508)
-- Dependencies: 215
-- Data for Name: Roles; Type: TABLE DATA; Schema: management; Owner: -
--



--
-- TOC entry 2937 (class 0 OID 16532)
-- Dependencies: 218
-- Data for Name: UserToFuncitons; Type: TABLE DATA; Schema: management; Owner: -
--

INSERT INTO management."UserToFuncitons" (created_date, updated_date, user_id, function_id, validity_period_start_time, validity_period_end_time, id) VALUES ('2022-07-08 02:29:55.773054', NULL, 2, 1, NULL, NULL, 2);
INSERT INTO management."UserToFuncitons" (created_date, updated_date, user_id, function_id, validity_period_start_time, validity_period_end_time, id) VALUES ('2022-07-08 02:30:05.889398', NULL, 2, 2, NULL, NULL, 3);


--
-- TOC entry 2941 (class 0 OID 16570)
-- Dependencies: 222
-- Data for Name: UserToRoles; Type: TABLE DATA; Schema: management; Owner: -
--



--
-- TOC entry 2932 (class 0 OID 16495)
-- Dependencies: 213
-- Data for Name: Users; Type: TABLE DATA; Schema: management; Owner: -
--

INSERT INTO management."Users" (created_date, updated_date, id, identity_number, name, surename, e_mail, password, last_login_datetime, record_status, last_modifier_id, refresh_token, refresh_token_end_date) VALUES ('2022-07-05 03:28:56.60037', NULL, 2, 311, 'osman', 'karamýzrak', 'osman@osman.com', '12345', NULL, 1, 1, 'LjRnHMJ67diehsNARJmA3fV//P2zOLAqnFa2AT3db/Q=', '2022-07-08 01:44:25.576588');


--
-- TOC entry 2924 (class 0 OID 16409)
-- Dependencies: 205
-- Data for Name: BaseEntity; Type: TABLE DATA; Schema: public; Owner: -
--



--
-- TOC entry 2956 (class 0 OID 0)
-- Dependencies: 210
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: ecommerce; Owner: -
--

SELECT pg_catalog.setval('ecommerce.category_id_seq', 3, true);


--
-- TOC entry 2957 (class 0 OID 0)
-- Dependencies: 211
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: ecommerce; Owner: -
--

SELECT pg_catalog.setval('ecommerce.product_id_seq', 8, true);


--
-- TOC entry 2958 (class 0 OID 0)
-- Dependencies: 208
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: ecommerce; Owner: -
--

SELECT pg_catalog.setval('ecommerce.test_id_seq', 1, false);


--
-- TOC entry 2959 (class 0 OID 0)
-- Dependencies: 219
-- Name: RoleToFunctions_id_seq; Type: SEQUENCE SET; Schema: management; Owner: -
--

SELECT pg_catalog.setval('management."RoleToFunctions_id_seq"', 1, false);


--
-- TOC entry 2960 (class 0 OID 0)
-- Dependencies: 214
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: management; Owner: -
--

SELECT pg_catalog.setval('management."Roles_id_seq"', 1, false);


--
-- TOC entry 2961 (class 0 OID 0)
-- Dependencies: 223
-- Name: UserToFunciton_id_seq; Type: SEQUENCE SET; Schema: management; Owner: -
--

SELECT pg_catalog.setval('management."UserToFunciton_id_seq"', 3, true);


--
-- TOC entry 2962 (class 0 OID 0)
-- Dependencies: 221
-- Name: UserToRoles_id_seq; Type: SEQUENCE SET; Schema: management; Owner: -
--

SELECT pg_catalog.setval('management."UserToRoles_id_seq"', 1, false);


--
-- TOC entry 2963 (class 0 OID 0)
-- Dependencies: 212
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: management; Owner: -
--

SELECT pg_catalog.setval('management."User_id_seq"', 1, true);


--
-- TOC entry 2964 (class 0 OID 0)
-- Dependencies: 216
-- Name: functions_id_seq; Type: SEQUENCE SET; Schema: management; Owner: -
--

SELECT pg_catalog.setval('management.functions_id_seq', 1, true);


--
-- TOC entry 2774 (class 2606 OID 16468)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: -
--

ALTER TABLE ONLY ecommerce.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 2772 (class 2606 OID 16486)
-- Name: product_feature product_feature_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: -
--

ALTER TABLE ONLY ecommerce.product_feature
    ADD CONSTRAINT product_feature_pkey PRIMARY KEY (product_id);


--
-- TOC entry 2776 (class 2606 OID 16479)
-- Name: product product_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: -
--

ALTER TABLE ONLY ecommerce.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- TOC entry 2778 (class 2606 OID 16457)
-- Name: test test_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: -
--

ALTER TABLE ONLY ecommerce.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- TOC entry 2788 (class 2606 OID 16616)
-- Name: RoleToFunctions RoleToFunctions_pkey; Type: CONSTRAINT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."RoleToFunctions"
    ADD CONSTRAINT "RoleToFunctions_pkey" PRIMARY KEY (id);


--
-- TOC entry 2782 (class 2606 OID 16517)
-- Name: Roles Roles_pkey; Type: CONSTRAINT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."Roles"
    ADD CONSTRAINT "Roles_pkey" PRIMARY KEY (id);


--
-- TOC entry 2786 (class 2606 OID 16584)
-- Name: UserToFuncitons UserToFunciton_pkey; Type: CONSTRAINT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."UserToFuncitons"
    ADD CONSTRAINT "UserToFunciton_pkey" PRIMARY KEY (id);


--
-- TOC entry 2790 (class 2606 OID 16609)
-- Name: UserToRoles UserToRoles_pkey; Type: CONSTRAINT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."UserToRoles"
    ADD CONSTRAINT "UserToRoles_pkey" PRIMARY KEY (id);


--
-- TOC entry 2780 (class 2606 OID 16504)
-- Name: Users User_pkey; Type: CONSTRAINT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."Users"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 2784 (class 2606 OID 16587)
-- Name: Functions functions_pkey; Type: CONSTRAINT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."Functions"
    ADD CONSTRAINT functions_pkey PRIMARY KEY (id);


--
-- TOC entry 2792 (class 2606 OID 16480)
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: -
--

ALTER TABLE ONLY ecommerce.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES ecommerce.category(id) NOT VALID;


--
-- TOC entry 2791 (class 2606 OID 16487)
-- Name: product_feature product_feature_product_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: -
--

ALTER TABLE ONLY ecommerce.product_feature
    ADD CONSTRAINT product_feature_product_id_fkey FOREIGN KEY (product_id) REFERENCES ecommerce.product(id) NOT VALID;


--
-- TOC entry 2796 (class 2606 OID 16593)
-- Name: RoleToFunctions RoleToFunctions_function_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."RoleToFunctions"
    ADD CONSTRAINT "RoleToFunctions_function_id_fkey" FOREIGN KEY (function_id) REFERENCES management."Functions"(id) NOT VALID;


--
-- TOC entry 2795 (class 2606 OID 16558)
-- Name: RoleToFunctions RoleToFunctions_role_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."RoleToFunctions"
    ADD CONSTRAINT "RoleToFunctions_role_id_fkey" FOREIGN KEY (role_id) REFERENCES management."Roles"(id) NOT VALID;


--
-- TOC entry 2794 (class 2606 OID 16588)
-- Name: UserToFuncitons UserToFunciton_function_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."UserToFuncitons"
    ADD CONSTRAINT "UserToFunciton_function_id_fkey" FOREIGN KEY (function_id) REFERENCES management."Functions"(id) NOT VALID;


--
-- TOC entry 2793 (class 2606 OID 16539)
-- Name: UserToFuncitons UserToFunciton_user_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: -
--

ALTER TABLE ONLY management."UserToFuncitons"
    ADD CONSTRAINT "UserToFunciton_user_id_fkey" FOREIGN KEY (user_id) REFERENCES management."Users"(id) NOT VALID;


-- Completed on 2022-07-08 03:12:09

--
-- PostgreSQL database dump complete
--

