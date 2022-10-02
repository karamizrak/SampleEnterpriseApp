--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11
-- Dumped by pg_dump version 12.11

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: ecommerce; Type: SCHEMA; Schema: -; Owner: nlayer
--

CREATE SCHEMA ecommerce;


ALTER SCHEMA ecommerce OWNER TO nlayer;

--
-- Name: global; Type: SCHEMA; Schema: -; Owner: nlayer
--

CREATE SCHEMA global;


ALTER SCHEMA global OWNER TO nlayer;

--
-- Name: management; Type: SCHEMA; Schema: -; Owner: nlayer
--

CREATE SCHEMA management;


ALTER SCHEMA management OWNER TO nlayer;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: BaseEntity; Type: TABLE; Schema: public; Owner: nlayer
--

CREATE TABLE public."BaseEntity" (
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone,
    is_deleted boolean DEFAULT false,
    last_modifier character varying
);


ALTER TABLE public."BaseEntity" OWNER TO nlayer;

--
-- Name: category; Type: TABLE; Schema: ecommerce; Owner: nlayer
--

CREATE TABLE ecommerce.category (
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_date timestamp without time zone,
    name text,
    description text,
    id integer NOT NULL
)
INHERITS (public."BaseEntity");


ALTER TABLE ecommerce.category OWNER TO nlayer;

--
-- Name: category_id_seq; Type: SEQUENCE; Schema: ecommerce; Owner: nlayer
--

CREATE SEQUENCE ecommerce.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ecommerce.category_id_seq OWNER TO nlayer;

--
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: ecommerce; Owner: nlayer
--

ALTER SEQUENCE ecommerce.category_id_seq OWNED BY ecommerce.category.id;


--
-- Name: product; Type: TABLE; Schema: ecommerce; Owner: nlayer
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


ALTER TABLE ecommerce.product OWNER TO nlayer;

--
-- Name: product_feature; Type: TABLE; Schema: ecommerce; Owner: nlayer
--

CREATE TABLE ecommerce.product_feature (
    color text,
    height integer,
    width integer,
    product_id integer NOT NULL
);


ALTER TABLE ecommerce.product_feature OWNER TO nlayer;

--
-- Name: product_id_seq; Type: SEQUENCE; Schema: ecommerce; Owner: nlayer
--

CREATE SEQUENCE ecommerce.product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ecommerce.product_id_seq OWNER TO nlayer;

--
-- Name: product_id_seq; Type: SEQUENCE OWNED BY; Schema: ecommerce; Owner: nlayer
--

ALTER SEQUENCE ecommerce.product_id_seq OWNED BY ecommerce.product.id;


--
-- Name: test; Type: TABLE; Schema: ecommerce; Owner: nlayer
--

CREATE TABLE ecommerce.test (
    id integer NOT NULL,
    ad character varying,
    soyad character varying
)
INHERITS (public."BaseEntity");


ALTER TABLE ecommerce.test OWNER TO nlayer;

--
-- Name: test_id_seq; Type: SEQUENCE; Schema: ecommerce; Owner: nlayer
--

CREATE SEQUENCE ecommerce.test_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ecommerce.test_id_seq OWNER TO nlayer;

--
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: ecommerce; Owner: nlayer
--

ALTER SEQUENCE ecommerce.test_id_seq OWNED BY ecommerce.test.id;


--
-- Name: institution; Type: TABLE; Schema: global; Owner: nlayer
--

CREATE TABLE global.institution (
    id integer NOT NULL,
    name character varying NOT NULL,
    address character varying,
    phone character varying,
    city_id integer NOT NULL,
    county_id integer,
    neighborhood_id integer
)
INHERITS (public."BaseEntity");


ALTER TABLE global.institution OWNER TO nlayer;

--
-- Name: Institution_id_seq; Type: SEQUENCE; Schema: global; Owner: nlayer
--

CREATE SEQUENCE global."Institution_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE global."Institution_id_seq" OWNER TO nlayer;

--
-- Name: Institution_id_seq; Type: SEQUENCE OWNED BY; Schema: global; Owner: nlayer
--

ALTER SEQUENCE global."Institution_id_seq" OWNED BY global.institution.id;


--
-- Name: audit_logs; Type: TABLE; Schema: global; Owner: nlayer
--

CREATE TABLE global.audit_logs (
    message text,
    message_template text,
    level character varying(50),
    raise_date timestamp without time zone,
    exception text,
    properties jsonb,
    props_test jsonb,
    machine_name text
);


ALTER TABLE global.audit_logs OWNER TO nlayer;

--
-- Name: logs; Type: TABLE; Schema: global; Owner: nlayer
--

CREATE TABLE global.logs (
    message text,
    message_template text,
    level character varying(50),
    raise_date timestamp without time zone,
    exception text,
    properties jsonb,
    props_test jsonb,
    machine_name text
);


ALTER TABLE global.logs OWNER TO nlayer;

--
-- Name: logs2; Type: TABLE; Schema: global; Owner: nlayer
--

CREATE TABLE global.logs2 (
    message text,
    message_template text,
    level integer,
    "timestamp" timestamp without time zone,
    exception text,
    log_event jsonb
);


ALTER TABLE global.logs2 OWNER TO nlayer;

--
-- Name: logs3; Type: TABLE; Schema: global; Owner: nlayer
--

CREATE TABLE global.logs3 (
    message text,
    message_template text,
    level integer,
    "timestamp" timestamp without time zone,
    exception text,
    log_event jsonb
);


ALTER TABLE global.logs3 OWNER TO nlayer;

--
-- Name: logs4; Type: TABLE; Schema: global; Owner: nlayer
--

CREATE TABLE global.logs4 (
    message text,
    message_template text,
    level character varying(50),
    raise_date timestamp without time zone,
    exception text,
    properties jsonb,
    props_test jsonb,
    machine_name text
);


ALTER TABLE global.logs4 OWNER TO nlayer;

--
-- Name: menu; Type: TABLE; Schema: management; Owner: nlayer
--

CREATE TABLE management.menu (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    description character varying,
    url character varying DEFAULT '#'::character varying,
    parent_id integer,
    icon_path character varying,
    function_id integer
)
INHERITS (public."BaseEntity");


ALTER TABLE management.menu OWNER TO nlayer;

--
-- Name: Menu_id_seq; Type: SEQUENCE; Schema: management; Owner: nlayer
--

CREATE SEQUENCE management."Menu_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE management."Menu_id_seq" OWNER TO nlayer;

--
-- Name: Menu_id_seq; Type: SEQUENCE OWNED BY; Schema: management; Owner: nlayer
--

ALTER SEQUENCE management."Menu_id_seq" OWNED BY management.menu.id;


--
-- Name: role_to_functions; Type: TABLE; Schema: management; Owner: nlayer
--

CREATE TABLE management.role_to_functions (
    id integer NOT NULL,
    role_id integer NOT NULL,
    function_id integer NOT NULL
)
INHERITS (public."BaseEntity");


ALTER TABLE management.role_to_functions OWNER TO nlayer;

--
-- Name: RoleToFunctions_id_seq; Type: SEQUENCE; Schema: management; Owner: nlayer
--

CREATE SEQUENCE management."RoleToFunctions_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE management."RoleToFunctions_id_seq" OWNER TO nlayer;

--
-- Name: RoleToFunctions_id_seq; Type: SEQUENCE OWNED BY; Schema: management; Owner: nlayer
--

ALTER SEQUENCE management."RoleToFunctions_id_seq" OWNED BY management.role_to_functions.id;


--
-- Name: roles; Type: TABLE; Schema: management; Owner: nlayer
--

CREATE TABLE management.roles (
    id integer NOT NULL,
    role_name character varying NOT NULL
)
INHERITS (public."BaseEntity");


ALTER TABLE management.roles OWNER TO nlayer;

--
-- Name: Roles_id_seq; Type: SEQUENCE; Schema: management; Owner: nlayer
--

CREATE SEQUENCE management."Roles_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE management."Roles_id_seq" OWNER TO nlayer;

--
-- Name: Roles_id_seq; Type: SEQUENCE OWNED BY; Schema: management; Owner: nlayer
--

ALTER SEQUENCE management."Roles_id_seq" OWNED BY management.roles.id;


--
-- Name: user_to_funcitons; Type: TABLE; Schema: management; Owner: nlayer
--

CREATE TABLE management.user_to_funcitons (
    user_id integer NOT NULL,
    function_id integer NOT NULL,
    validity_period_start_time timestamp without time zone,
    validity_period_end_time timestamp without time zone,
    id integer NOT NULL
)
INHERITS (public."BaseEntity");


ALTER TABLE management.user_to_funcitons OWNER TO nlayer;

--
-- Name: UserToFunciton_id_seq; Type: SEQUENCE; Schema: management; Owner: nlayer
--

CREATE SEQUENCE management."UserToFunciton_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE management."UserToFunciton_id_seq" OWNER TO nlayer;

--
-- Name: UserToFunciton_id_seq; Type: SEQUENCE OWNED BY; Schema: management; Owner: nlayer
--

ALTER SEQUENCE management."UserToFunciton_id_seq" OWNED BY management.user_to_funcitons.id;


--
-- Name: UserToRoles_id_seq; Type: SEQUENCE; Schema: management; Owner: nlayer
--

CREATE SEQUENCE management."UserToRoles_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE management."UserToRoles_id_seq" OWNER TO nlayer;

--
-- Name: users; Type: TABLE; Schema: management; Owner: nlayer
--

CREATE TABLE management.users (
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


ALTER TABLE management.users OWNER TO nlayer;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: management; Owner: nlayer
--

CREATE SEQUENCE management."User_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE management."User_id_seq" OWNER TO nlayer;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: management; Owner: nlayer
--

ALTER SEQUENCE management."User_id_seq" OWNED BY management.users.id;


--
-- Name: functions_id_seq; Type: SEQUENCE; Schema: management; Owner: nlayer
--

CREATE SEQUENCE management.functions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE management.functions_id_seq OWNER TO nlayer;

--
-- Name: functions; Type: TABLE; Schema: management; Owner: nlayer
--

CREATE TABLE management.functions (
    id integer DEFAULT nextval('management.functions_id_seq'::regclass) NOT NULL,
    function_name character varying NOT NULL,
    area_name character varying,
    controller_name character varying NOT NULL,
    action_name character varying NOT NULL
)
INHERITS (public."BaseEntity");


ALTER TABLE management.functions OWNER TO nlayer;

--
-- Name: user_to_roles; Type: TABLE; Schema: management; Owner: nlayer
--

CREATE TABLE management.user_to_roles (
    id integer DEFAULT nextval('management."UserToRoles_id_seq"'::regclass) NOT NULL,
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    validity_period_start_time timestamp without time zone,
    validity_period_end_time timestamp without time zone
)
INHERITS (public."BaseEntity");


ALTER TABLE management.user_to_roles OWNER TO nlayer;

--
-- Name: category id; Type: DEFAULT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.category ALTER COLUMN id SET DEFAULT nextval('ecommerce.category_id_seq'::regclass);


--
-- Name: category is_deleted; Type: DEFAULT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.category ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Name: product id; Type: DEFAULT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.product ALTER COLUMN id SET DEFAULT nextval('ecommerce.product_id_seq'::regclass);


--
-- Name: product is_deleted; Type: DEFAULT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.product ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Name: test created_date; Type: DEFAULT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.test ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: test id; Type: DEFAULT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.test ALTER COLUMN id SET DEFAULT nextval('ecommerce.test_id_seq'::regclass);


--
-- Name: test is_deleted; Type: DEFAULT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.test ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Name: institution created_date; Type: DEFAULT; Schema: global; Owner: nlayer
--

ALTER TABLE ONLY global.institution ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: institution id; Type: DEFAULT; Schema: global; Owner: nlayer
--

ALTER TABLE ONLY global.institution ALTER COLUMN id SET DEFAULT nextval('global."Institution_id_seq"'::regclass);


--
-- Name: institution is_deleted; Type: DEFAULT; Schema: global; Owner: nlayer
--

ALTER TABLE ONLY global.institution ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Name: functions created_date; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.functions ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: functions is_deleted; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.functions ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Name: menu created_date; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.menu ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: menu id; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.menu ALTER COLUMN id SET DEFAULT nextval('management."Menu_id_seq"'::regclass);


--
-- Name: menu is_deleted; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.menu ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Name: role_to_functions created_date; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.role_to_functions ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: role_to_functions id; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.role_to_functions ALTER COLUMN id SET DEFAULT nextval('management."RoleToFunctions_id_seq"'::regclass);


--
-- Name: role_to_functions is_deleted; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.role_to_functions ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Name: roles created_date; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.roles ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: roles id; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.roles ALTER COLUMN id SET DEFAULT nextval('management."Roles_id_seq"'::regclass);


--
-- Name: roles is_deleted; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.roles ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Name: user_to_funcitons created_date; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_funcitons ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: user_to_funcitons id; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_funcitons ALTER COLUMN id SET DEFAULT nextval('management."UserToFunciton_id_seq"'::regclass);


--
-- Name: user_to_funcitons is_deleted; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_funcitons ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Name: user_to_roles created_date; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_roles ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: user_to_roles is_deleted; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_roles ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Name: users created_date; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.users ALTER COLUMN created_date SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: users id; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.users ALTER COLUMN id SET DEFAULT nextval('management."User_id_seq"'::regclass);


--
-- Name: users is_deleted; Type: DEFAULT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.users ALTER COLUMN is_deleted SET DEFAULT false;


--
-- Data for Name: category; Type: TABLE DATA; Schema: ecommerce; Owner: nlayer
--

COPY ecommerce.category (created_date, updated_date, name, description, id, is_deleted, last_modifier) FROM stdin;
2022-06-23 03:10:01.301015	\N	kalemler	\N	1	f	\N
2022-06-23 03:10:01.301015	\N	defterler	\N	2	f	\N
2022-06-23 03:10:01.301015	\N	silgiler	\N	3	f	\N
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: ecommerce; Owner: nlayer
--

COPY ecommerce.product (created_date, updated_date, name, stock, price, category_id, id, is_deleted, last_modifier) FROM stdin;
2022-06-23 03:10:51.17269	\N	tükenmez kalem	10	2	1	1	f	\N
2022-06-23 03:10:51.17269	\N	mavi silgi	50	1	3	3	f	\N
2022-06-23 03:10:51.17269	\N	büyük defeter	20	3	1	2	f	\N
2022-06-27 01:19:22.54287	\N	aa	1	2	1	6	f	\N
2022-06-28 00:31:37.556184	\N	string	2	1	2	8	f	\N
2022-07-19 03:10:20.90902	\N	test	10	10	2	9	f	\N
2022-07-19 03:21:35.884303	\N	test	10	11	1	10	f	\N
-infinity	\N	test23	11	11	1	11	f	\N
\N	2022-08-28 02:16:59.894182	string2	3	33	2	12	t	\N
2022-08-28 04:15:49.48116	\N	string777	77	77	1	13	f	\N
2022-08-28 04:18:19.116731	\N	string777	77	77	1	15	f	\N
2022-08-28 04:30:15.732711	\N	string777	77	77	1	16	f	
2022-08-28 04:30:51.889806	\N	string777	77	77	1	17	f	
2022-08-28 04:36:01.631859	\N	string444	44	44	1	20	f	2
\N	2022-08-28 04:37:38.291043	string44554	55	45	2	18	t	2
2022-08-28 04:33:04.620829	2022-08-28 04:38:01.073068	string444	44	44	1	19	t	2
2022-08-28 04:16:36.488185	2022-08-28 04:38:45.891431	string777	77	77	1	14	t	2
\.


--
-- Data for Name: product_feature; Type: TABLE DATA; Schema: ecommerce; Owner: nlayer
--

COPY ecommerce.product_feature (color, height, width, product_id) FROM stdin;
kırmızı	12	12	1
mavi	11	11	2
sarı	10	10	3
\.


--
-- Data for Name: test; Type: TABLE DATA; Schema: ecommerce; Owner: nlayer
--

COPY ecommerce.test (created_date, updated_date, id, ad, soyad, is_deleted, last_modifier) FROM stdin;
\.


--
-- Data for Name: audit_logs; Type: TABLE DATA; Schema: global; Owner: nlayer
--

COPY global.audit_logs (message, message_template, level, raise_date, exception, properties, props_test, machine_name) FROM stdin;
test	test	Information	2022-07-22 01:17:37.426101	\N	{"Level": "Information", "Timestamp": "2022-07-22T01:17:37.4261016+03:00", "Properties": {"ActionId": "89781183-9b2d-4bb2-aacb-9f4f629e14d8", "RequestId": "0HMJBCQL50OD2:0000000B", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBCQL50OD2", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}, "MessageTemplate": "test"}	{"ActionId": "89781183-9b2d-4bb2-aacb-9f4f629e14d8", "RequestId": "0HMJBCQL50OD2:0000000B", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBCQL50OD2", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}	\N
mesaj	mesaj	Error	2022-07-22 01:17:37.436104	System.ArgumentNullException: Value cannot be null. (Parameter 'nul la bu')	{"Level": "Error", "Exception": "System.ArgumentNullException: Value cannot be null. (Parameter 'nul la bu')", "Timestamp": "2022-07-22T01:17:37.4361044+03:00", "Properties": {"EventId": {"Id": 122, "Name": "eventName"}, "ActionId": "89781183-9b2d-4bb2-aacb-9f4f629e14d8", "RequestId": "0HMJBCQL50OD2:0000000B", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBCQL50OD2", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}, "MessageTemplate": "mesaj"}	{"EventId": {"Id": 122, "Name": "eventName"}, "ActionId": "89781183-9b2d-4bb2-aacb-9f4f629e14d8", "RequestId": "0HMJBCQL50OD2:0000000B", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBCQL50OD2", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}	\N
An unhandled exception has occurred while executing the request.	An unhandled exception has occurred while executing the request.	Error	2022-07-22 01:22:22.0368	SampleEntDev.Service.Exceptions.NotFoundException: Category (34) not found\r\n   at SampleEntDev.Service.Services.GenericService`1.GetByIdAsync(Int32 id) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.Service\\Services\\GenericService.cs:line 58\r\n   at SampleEntDev.API.Filter.GetByIdFilter`2.OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Filter\\GetByIdFilter.cs:line 36\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)\r\n   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)\r\n   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)	{"Level": "Error", "Exception": "SampleEntDev.Service.Exceptions.NotFoundException: Category (34) not found\\r\\n   at SampleEntDev.Service.Services.GenericService`1.GetByIdAsync(Int32 id) in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.Service\\\\Services\\\\GenericService.cs:line 58\\r\\n   at SampleEntDev.API.Filter.GetByIdFilter`2.OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next) in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Filter\\\\GetByIdFilter.cs:line 36\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeInnerFilterAsync>g__Awaited|13_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)\\r\\n   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)\\r\\n   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)", "Timestamp": "2022-07-22T01:22:22.0368002+03:00", "Properties": {"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBCTEQ67L9:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBCTEQ67L9", "SourceContext": "Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware"}, "MessageTemplate": "An unhandled exception has occurred while executing the request."}	{"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBCTEQ67L9:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBCTEQ67L9", "SourceContext": "Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 01:26:25.47455	\N	{"Level": "Information", "Timestamp": "2022-07-22T01:26:25.4745501+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 01:28:03.856641	\N	{"Level": "Information", "Timestamp": "2022-07-22T01:28:03.8566412+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 01:29:16.588061	\N	{"Level": "Information", "Timestamp": "2022-07-22T01:29:16.5880611+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 01:32:16.817111	\N	{"Level": "Information", "Timestamp": "2022-07-22T01:32:16.8171116+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
An unhandled exception has occurred while executing the request.	An unhandled exception has occurred while executing the request.	Error	2022-07-22 01:32:30.011909	System.Exception: Olmadı\r\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 31\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	{"Level": "Error", "Exception": "System.Exception: Olmadı\\r\\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 31\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)", "Timestamp": "2022-07-22T01:32:30.0119091+03:00", "Properties": {"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBD3EV7OOB:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMJBD3EV7OOB", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}, "MessageTemplate": "An unhandled exception has occurred while executing the request."}	{"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBD3EV7OOB:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMJBD3EV7OOB", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 01:33:04.11148	\N	{"Level": "Information", "Timestamp": "2022-07-22T01:33:04.1114802+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 02:13:42.546528	\N	{"Level": "Information", "Timestamp": "2022-08-28T02:13:42.5465281+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 02:39:05.234394	\N	{"Level": "Information", "Timestamp": "2022-08-28T02:39:05.2343948+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
An unhandled exception has occurred while executing the request.	An unhandled exception has occurred while executing the request.	Error	2022-07-22 01:33:17.894231	System.Exception: Olmadı\r\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 31\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	{"Level": "Error", "Exception": "System.Exception: Olmadı\\r\\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 31\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)", "Timestamp": "2022-07-22T01:33:17.8942319+03:00", "Properties": {"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBD3T2ICQ1:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMJBD3T2ICQ1", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}, "MessageTemplate": "An unhandled exception has occurred while executing the request."}	{"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBD3T2ICQ1:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMJBD3T2ICQ1", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}	\N
Stacktrace of error:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 31\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	Stacktrace of error:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 31\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	Error	2022-07-22 01:33:44.020639	\N	{"Level": "Error", "Timestamp": "2022-07-22T01:33:44.0206395+03:00", "Properties": {"RequestId": "0HMJBD3T2ICQ1:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMJBD3T2ICQ1", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "Stacktrace of error:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 31\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)"}	{"RequestId": "0HMJBD3T2ICQ1:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMJBD3T2ICQ1", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 01:40:53.375187	\N	{"Level": "Information", "Timestamp": "2022-07-22T01:40:53.3751878+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 01:43:19.144656	\N	{"Level": "Information", "Timestamp": "2022-07-22T01:43:19.1446566+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
An unhandled exception has occurred while executing the request.	An unhandled exception has occurred while executing the request.	Error	2022-07-22 01:44:04.948256	SampleEntDev.Service.Exceptions.NotFoundException: Category (45) not found\r\n   at SampleEntDev.Service.Services.GenericService`1.GetByIdAsync(Int32 id) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.Service\\Services\\GenericService.cs:line 58\r\n   at SampleEntDev.API.Filter.GetByIdFilter`2.OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Filter\\GetByIdFilter.cs:line 36\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	{"Level": "Error", "Exception": "SampleEntDev.Service.Exceptions.NotFoundException: Category (45) not found\\r\\n   at SampleEntDev.Service.Services.GenericService`1.GetByIdAsync(Int32 id) in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.Service\\\\Services\\\\GenericService.cs:line 58\\r\\n   at SampleEntDev.API.Filter.GetByIdFilter`2.OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next) in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Filter\\\\GetByIdFilter.cs:line 36\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)", "Timestamp": "2022-07-22T01:44:04.9482566+03:00", "Properties": {"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBD9KBORF6:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBD9KBORF6", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}, "MessageTemplate": "An unhandled exception has occurred while executing the request."}	{"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBD9KBORF6:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBD9KBORF6", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}	\N
An exception was thrown attempting to execute the error handler.	An exception was thrown attempting to execute the error handler.	Error	2022-07-22 01:44:44.215869	Newtonsoft.Json.JsonSerializationException: Self referencing loop detected with type 'System.Collections.Generic.KeyValuePair`2[System.Type,System.Object]'. Path 'HttpContext.Features[0].Value'.\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.CheckForCircularReference(JsonWriter writer, Object value, JsonProperty property, JsonContract contract, JsonContainerContract containerContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeList(JsonWriter writer, IEnumerable values, JsonArrayContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.Serialize(JsonWriter jsonWriter, Object value, Type objectType)\r\n   at Newtonsoft.Json.Converters.KeyValuePairConverter.WriteJson(JsonWriter writer, Object value, JsonSerializer serializer)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeConvertable(JsonWriter writer, JsonConverter converter, Object value, JsonContract contract, JsonContainerContract collectionContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeList(JsonWriter writer, IEnumerable values, JsonArrayContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeObject(JsonWriter writer, Object value, JsonObjectContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeObject(JsonWriter writer, Object value, JsonObjectContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.Serialize(JsonWriter jsonWriter, Object value, Type objectType)\r\n   at Newtonsoft.Json.JsonSerializer.SerializeInternal(JsonWriter jsonWriter, Object value, Type objectType)\r\n   at Newtonsoft.Json.JsonConvert.SerializeObjectInternal(Object value, Type type, JsonSerializer jsonSerializer)\r\n   at SampleEntDev.API.MiddleWares.UseCustomExceptionHandler.<>c__DisplayClass0_0.<<UseCustomException>b__1>d.MoveNext() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\MiddleWares\\UseCustomExceptionHandler.cs:line 29\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.HandleException(HttpContext context, ExceptionDispatchInfo edi)	{"Level": "Error", "Exception": "Newtonsoft.Json.JsonSerializationException: Self referencing loop detected with type 'System.Collections.Generic.KeyValuePair`2[System.Type,System.Object]'. Path 'HttpContext.Features[0].Value'.\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.CheckForCircularReference(JsonWriter writer, Object value, JsonProperty property, JsonContract contract, JsonContainerContract containerContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeList(JsonWriter writer, IEnumerable values, JsonArrayContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.Serialize(JsonWriter jsonWriter, Object value, Type objectType)\\r\\n   at Newtonsoft.Json.Converters.KeyValuePairConverter.WriteJson(JsonWriter writer, Object value, JsonSerializer serializer)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeConvertable(JsonWriter writer, JsonConverter converter, Object value, JsonContract contract, JsonContainerContract collectionContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeList(JsonWriter writer, IEnumerable values, JsonArrayContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeObject(JsonWriter writer, Object value, JsonObjectContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeObject(JsonWriter writer, Object value, JsonObjectContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.Serialize(JsonWriter jsonWriter, Object value, Type objectType)\\r\\n   at Newtonsoft.Json.JsonSerializer.SerializeInternal(JsonWriter jsonWriter, Object value, Type objectType)\\r\\n   at Newtonsoft.Json.JsonConvert.SerializeObjectInternal(Object value, Type type, JsonSerializer jsonSerializer)\\r\\n   at SampleEntDev.API.MiddleWares.UseCustomExceptionHandler.<>c__DisplayClass0_0.<<UseCustomException>b__1>d.MoveNext() in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\MiddleWares\\\\UseCustomExceptionHandler.cs:line 29\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.HandleException(HttpContext context, ExceptionDispatchInfo edi)", "Timestamp": "2022-07-22T01:44:44.2158694+03:00", "Properties": {"EventId": {"Id": 3, "Name": "Exception"}, "RequestId": "0HMJBD9KBORF6:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBD9KBORF6", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}, "MessageTemplate": "An exception was thrown attempting to execute the error handler."}	{"EventId": {"Id": 3, "Name": "Exception"}, "RequestId": "0HMJBD9KBORF6:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBD9KBORF6", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 02:16:51.324496	\N	{"Level": "Information", "Timestamp": "2022-08-28T02:16:51.3244964+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 02:40:59.177776	\N	{"Level": "Information", "Timestamp": "2022-08-28T02:40:59.1777763+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
An unhandled exception has occurred while executing the request.	An unhandled exception has occurred while executing the request.	Error	2022-07-22 01:44:44.217463	SampleEntDev.Service.Exceptions.NotFoundException: Category (45) not found\r\n   at SampleEntDev.Service.Services.GenericService`1.GetByIdAsync(Int32 id) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.Service\\Services\\GenericService.cs:line 58\r\n   at SampleEntDev.API.Filter.GetByIdFilter`2.OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Filter\\GetByIdFilter.cs:line 36\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.HandleException(HttpContext context, ExceptionDispatchInfo edi)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)\r\n   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)\r\n   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)\r\n   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)	{"Level": "Error", "Exception": "SampleEntDev.Service.Exceptions.NotFoundException: Category (45) not found\\r\\n   at SampleEntDev.Service.Services.GenericService`1.GetByIdAsync(Int32 id) in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.Service\\\\Services\\\\GenericService.cs:line 58\\r\\n   at SampleEntDev.API.Filter.GetByIdFilter`2.OnActionExecutionAsync(ActionExecutingContext context, ActionExecutionDelegate next) in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Filter\\\\GetByIdFilter.cs:line 36\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.HandleException(HttpContext context, ExceptionDispatchInfo edi)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)\\r\\n   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)\\r\\n   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)\\r\\n   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)", "Timestamp": "2022-07-22T01:44:44.2174634+03:00", "Properties": {"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBD9KBORF6:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBD9KBORF6", "SourceContext": "Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware"}, "MessageTemplate": "An unhandled exception has occurred while executing the request."}	{"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBD9KBORF6:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBD9KBORF6", "SourceContext": "Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 01:48:10.917178	\N	{"Level": "Information", "Timestamp": "2022-07-22T01:48:10.9171788+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 02:11:13.648908	\N	{"Level": "Information", "Timestamp": "2022-07-22T02:11:13.6489088+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 02:12:44.458137	\N	{"Level": "Information", "Timestamp": "2022-07-22T02:12:44.4581377+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
An unhandled exception has occurred while executing the request.	An unhandled exception has occurred while executing the request.	Error	2022-07-22 02:12:56.774966	System.Exception: Olmadı2\r\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAsync(Int32 id) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 49\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	{"Level": "Error", "Exception": "System.Exception: Olmadı2\\r\\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAsync(Int32 id) in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 49\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)", "Timestamp": "2022-07-22T02:12:56.7749663+03:00", "Properties": {"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBDQ2DLUQG:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBDQ2DLUQG", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}, "MessageTemplate": "An unhandled exception has occurred while executing the request."}	{"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBDQ2DLUQG:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBDQ2DLUQG", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}	\N
An exception was thrown attempting to execute the error handler.	An exception was thrown attempting to execute the error handler.	Error	2022-07-22 02:13:02.654692	Newtonsoft.Json.JsonSerializationException: Self referencing loop detected with type 'System.Collections.Generic.KeyValuePair`2[System.Type,System.Object]'. Path 'HttpContext.Features[0].Value'.\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.CheckForCircularReference(JsonWriter writer, Object value, JsonProperty property, JsonContract contract, JsonContainerContract containerContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeList(JsonWriter writer, IEnumerable values, JsonArrayContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.Serialize(JsonWriter jsonWriter, Object value, Type objectType)\r\n   at Newtonsoft.Json.Converters.KeyValuePairConverter.WriteJson(JsonWriter writer, Object value, JsonSerializer serializer)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeConvertable(JsonWriter writer, JsonConverter converter, Object value, JsonContract contract, JsonContainerContract collectionContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeList(JsonWriter writer, IEnumerable values, JsonArrayContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeObject(JsonWriter writer, Object value, JsonObjectContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeObject(JsonWriter writer, Object value, JsonObjectContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\r\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.Serialize(JsonWriter jsonWriter, Object value, Type objectType)\r\n   at Newtonsoft.Json.JsonSerializer.SerializeInternal(JsonWriter jsonWriter, Object value, Type objectType)\r\n   at Newtonsoft.Json.JsonConvert.SerializeObjectInternal(Object value, Type type, JsonSerializer jsonSerializer)\r\n   at SampleEntDev.API.MiddleWares.UseCustomExceptionHandler.<>c__DisplayClass0_0.<<UseCustomException>b__1>d.MoveNext() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\MiddleWares\\UseCustomExceptionHandler.cs:line 29\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.HandleException(HttpContext context, ExceptionDispatchInfo edi)	{"Level": "Error", "Exception": "Newtonsoft.Json.JsonSerializationException: Self referencing loop detected with type 'System.Collections.Generic.KeyValuePair`2[System.Type,System.Object]'. Path 'HttpContext.Features[0].Value'.\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.CheckForCircularReference(JsonWriter writer, Object value, JsonProperty property, JsonContract contract, JsonContainerContract containerContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeList(JsonWriter writer, IEnumerable values, JsonArrayContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.Serialize(JsonWriter jsonWriter, Object value, Type objectType)\\r\\n   at Newtonsoft.Json.Converters.KeyValuePairConverter.WriteJson(JsonWriter writer, Object value, JsonSerializer serializer)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeConvertable(JsonWriter writer, JsonConverter converter, Object value, JsonContract contract, JsonContainerContract collectionContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeList(JsonWriter writer, IEnumerable values, JsonArrayContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeObject(JsonWriter writer, Object value, JsonObjectContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.SerializeObject(JsonWriter writer, Object value, JsonObjectContract contract, JsonProperty member, JsonContainerContract collectionContract, JsonProperty containerProperty)\\r\\n   at Newtonsoft.Json.Serialization.JsonSerializerInternalWriter.Serialize(JsonWriter jsonWriter, Object value, Type objectType)\\r\\n   at Newtonsoft.Json.JsonSerializer.SerializeInternal(JsonWriter jsonWriter, Object value, Type objectType)\\r\\n   at Newtonsoft.Json.JsonConvert.SerializeObjectInternal(Object value, Type type, JsonSerializer jsonSerializer)\\r\\n   at SampleEntDev.API.MiddleWares.UseCustomExceptionHandler.<>c__DisplayClass0_0.<<UseCustomException>b__1>d.MoveNext() in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\MiddleWares\\\\UseCustomExceptionHandler.cs:line 29\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.HandleException(HttpContext context, ExceptionDispatchInfo edi)", "Timestamp": "2022-07-22T02:13:02.6546927+03:00", "Properties": {"EventId": {"Id": 3, "Name": "Exception"}, "RequestId": "0HMJBDQ2DLUQG:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBDQ2DLUQG", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}, "MessageTemplate": "An exception was thrown attempting to execute the error handler."}	{"EventId": {"Id": 3, "Name": "Exception"}, "RequestId": "0HMJBDQ2DLUQG:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBDQ2DLUQG", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}	\N
An unhandled exception has occurred while executing the request.	An unhandled exception has occurred while executing the request.	Error	2022-07-22 02:13:02.656025	System.Exception: Olmadı2\r\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAsync(Int32 id) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 49\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.HandleException(HttpContext context, ExceptionDispatchInfo edi)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)\r\n   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)\r\n   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)\r\n   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)	{"Level": "Error", "Exception": "System.Exception: Olmadı2\\r\\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAsync(Int32 id) in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 49\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.HandleException(HttpContext context, ExceptionDispatchInfo edi)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)\\r\\n   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)\\r\\n   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)\\r\\n   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)", "Timestamp": "2022-07-22T02:13:02.6560251+03:00", "Properties": {"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBDQ2DLUQG:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBDQ2DLUQG", "SourceContext": "Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware"}, "MessageTemplate": "An unhandled exception has occurred while executing the request."}	{"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBDQ2DLUQG:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBDQ2DLUQG", "SourceContext": "Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-07-22 02:13:36.647295	\N	{"Level": "Information", "Timestamp": "2022-07-22T02:13:36.6472952+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 02:34:10.169809	\N	{"Level": "Information", "Timestamp": "2022-08-28T02:34:10.1698099+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
An unhandled exception has occurred while executing the request.	An unhandled exception has occurred while executing the request.	Error	2022-07-22 02:13:49.535046	System.Exception: Olmadı2\r\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAsync(Int32 id) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 49\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	{"Level": "Error", "Exception": "System.Exception: Olmadı2\\r\\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAsync(Int32 id) in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 49\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)", "Timestamp": "2022-07-22T02:13:49.5350469+03:00", "Properties": {"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBDQHVQMJ4:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBDQHVQMJ4", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}, "MessageTemplate": "An unhandled exception has occurred while executing the request."}	{"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMJBDQHVQMJ4:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBDQHVQMJ4", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}	\N
HttpRequest:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAsync(Int32 id) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 49\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	HttpRequest:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAsync(Int32 id) in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 49\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	Error	2022-07-22 02:13:52.596383	\N	{"Level": "Error", "Timestamp": "2022-07-22T02:13:52.5963838+03:00", "Properties": {"RequestId": "0HMJBDQHVQMJ4:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBDQHVQMJ4", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "HttpRequest:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAsync(Int32 id) in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 49\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)"}	{"RequestId": "0HMJBDQHVQMJ4:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/Get", "ConnectionId": "0HMJBDQHVQMJ4", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 01:14:27.325628	\N	{"Level": "Information", "Timestamp": "2022-08-28T01:14:27.3256284+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 01:17:01.935241	\N	{"Level": "Information", "Timestamp": "2022-08-28T01:17:01.9352413+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 01:17:59.586087	\N	{"Level": "Information", "Timestamp": "2022-08-28T01:17:59.5860879+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 01:23:34.725404	\N	{"Level": "Information", "Timestamp": "2022-08-28T01:23:34.7254040+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 01:26:36.946716	\N	{"Level": "Information", "Timestamp": "2022-08-28T01:26:36.9467166+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 01:38:41.354756	\N	{"Level": "Information", "Timestamp": "2022-08-28T01:38:41.3547565+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 01:42:39.799563	\N	{"Level": "Information", "Timestamp": "2022-08-28T01:42:39.7995631+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 01:45:42.388429	\N	{"Level": "Information", "Timestamp": "2022-08-28T01:45:42.3884293+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 01:46:45.36865	\N	{"Level": "Information", "Timestamp": "2022-08-28T01:46:45.3686508+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 01:56:18.850464	\N	{"Level": "Information", "Timestamp": "2022-08-28T01:56:18.8504646+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 02:44:18.896046	\N	{"Level": "Information", "Timestamp": "2022-08-28T02:44:18.8960463+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 02:48:21.637766	\N	{"Level": "Information", "Timestamp": "2022-08-28T02:48:21.6377665+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 03:19:29.870184	\N	{"Level": "Information", "Timestamp": "2022-08-28T03:19:29.8701848+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 03:27:16.484772	\N	{"Level": "Information", "Timestamp": "2022-08-28T03:27:16.4847727+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
An unhandled exception has occurred while executing the request.	An unhandled exception has occurred while executing the request.	Error	2022-08-28 03:28:26.444319	System.Exception: Olmadı\r\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 31\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	{"Level": "Error", "Exception": "System.Exception: Olmadı\\r\\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 31\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)", "Timestamp": "2022-08-28T03:28:26.4443198+03:00", "Properties": {"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMK8HG7Q4MK0:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMK8HG7Q4MK0", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}, "MessageTemplate": "An unhandled exception has occurred while executing the request."}	{"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMK8HG7Q4MK0:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMK8HG7Q4MK0", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}	\N
HttpRequest:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 31\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	HttpRequest:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 31\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	Error	2022-08-28 03:28:26.643566	\N	{"Level": "Error", "Timestamp": "2022-08-28T03:28:26.6435665+03:00", "Properties": {"RequestId": "0HMK8HG7Q4MK0:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMK8HG7Q4MK0", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "HttpRequest:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 31\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)"}	{"RequestId": "0HMK8HG7Q4MK0:00000009", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMK8HG7Q4MK0", "SourceContext": "SampleEntDev.API"}	\N
An unhandled exception has occurred while executing the request.	An unhandled exception has occurred while executing the request.	Error	2022-08-28 03:28:44.33532	System.Exception: Olmadı\r\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 31\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	{"Level": "Error", "Exception": "System.Exception: Olmadı\\r\\n   at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 31\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)", "Timestamp": "2022-08-28T03:28:44.3353207+03:00", "Properties": {"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMK8HG7Q4MK0:0000000B", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMK8HG7Q4MK0", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}, "MessageTemplate": "An unhandled exception has occurred while executing the request."}	{"EventId": {"Id": 1, "Name": "UnhandledException"}, "RequestId": "0HMK8HG7Q4MK0:0000000B", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMK8HG7Q4MK0", "SourceContext": "Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware"}	\N
HttpRequest:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 31\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	HttpRequest:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\Areas\\ECommerce\\Controllers\\CategoryController.cs:line 31\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\r\n--- End of stack trace from previous location ---\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\r\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\r\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\r\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)	Error	2022-08-28 03:28:44.336162	\N	{"Level": "Error", "Timestamp": "2022-08-28T03:28:44.3361622+03:00", "Properties": {"RequestId": "0HMK8HG7Q4MK0:0000000B", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMK8HG7Q4MK0", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "HttpRequest:    at SampleEntDev.API.Areas.ECommerce.Controllers.CategoryController.GetAll() in C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\Areas\\\\ECommerce\\\\Controllers\\\\CategoryController.cs:line 31\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ActionMethodExecutor.TaskOfIActionResultExecutor.Execute(IActionResultTypeMapper mapper, ObjectMethodExecutor executor, Object controller, Object[] arguments)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeActionMethodAsync>g__Awaited|12_0(ControllerActionInvoker invoker, ValueTask`1 actionResultValueTask)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.<InvokeNextActionFilterAsync>g__Awaited|10_0(ControllerActionInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Rethrow(ActionExecutedContextSealed context)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker.InvokeInnerFilterAsync()\\r\\n--- End of stack trace from previous location ---\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeFilterPipelineAsync>g__Awaited|20_0(ResourceInvoker invoker, Task lastTask, State next, Scope scope, Object state, Boolean isCompleted)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Mvc.Infrastructure.ResourceInvoker.<InvokeAsync>g__Awaited|17_0(ResourceInvoker invoker, Task task, IDisposable scope)\\r\\n   at Microsoft.AspNetCore.Routing.EndpointMiddleware.<Invoke>g__AwaitRequestTask|6_0(Endpoint endpoint, Task requestTask, ILogger logger)\\r\\n   at Microsoft.AspNetCore.Authorization.AuthorizationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)\\r\\n   at Microsoft.AspNetCore.Diagnostics.ExceptionHandlerMiddleware.<Invoke>g__Awaited|6_0(ExceptionHandlerMiddleware middleware, HttpContext context, Task task)"}	{"RequestId": "0HMK8HG7Q4MK0:0000000B", "Application": "Sample Enterprise Api", "RequestPath": "/api/ECommerce/Category/GetAll", "ConnectionId": "0HMK8HG7Q4MK0", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 03:38:27.771977	\N	{"Level": "Information", "Timestamp": "2022-08-28T03:38:27.7719777+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 03:44:31.708383	\N	{"Level": "Information", "Timestamp": "2022-08-28T03:44:31.7083831+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 03:45:48.651421	\N	{"Level": "Information", "Timestamp": "2022-08-28T03:45:48.6514217+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 04:14:01.936345	\N	{"Level": "Information", "Timestamp": "2022-08-28T04:14:01.9363455+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 04:16:05.163712	\N	{"Level": "Information", "Timestamp": "2022-08-28T04:16:05.1637125+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 04:29:51.858968	\N	{"Level": "Information", "Timestamp": "2022-08-28T04:29:51.8589687+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
The application SampleEntDev.API started	The application SampleEntDev.API started	Information	2022-08-28 04:35:42.350902	\N	{"Level": "Information", "Timestamp": "2022-08-28T04:35:42.3509020+03:00", "Properties": {"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}, "MessageTemplate": "The application SampleEntDev.API started"}	{"Application": "Sample Enterprise Api", "SourceContext": "SampleEntDev.API"}	\N
\.


--
-- Data for Name: institution; Type: TABLE DATA; Schema: global; Owner: nlayer
--

COPY global.institution (created_date, updated_date, id, name, address, phone, city_id, county_id, neighborhood_id, is_deleted, last_modifier) FROM stdin;
\.


--
-- Data for Name: logs; Type: TABLE DATA; Schema: global; Owner: nlayer
--

COPY global.logs (message, message_template, level, raise_date, exception, properties, props_test, machine_name) FROM stdin;
test	test	Information	2022-07-22 00:44:55.05463	\N	{"Level": "Information", "Timestamp": "2022-07-22T00:44:55.0546304+03:00", "Properties": {"ActionId": "89992099-83f1-45ee-b80c-e610a40cfd5a", "RequestId": "0HMJBC8Q7G1KE:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBC8Q7G1KE", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}, "MessageTemplate": "test"}	{"ActionId": "89992099-83f1-45ee-b80c-e610a40cfd5a", "RequestId": "0HMJBC8Q7G1KE:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBC8Q7G1KE", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}	\N
mesaj	mesaj	Error	2022-07-22 00:44:55.073572	System.ArgumentNullException: Value cannot be null. (Parameter 'nul la bu')	{"Level": "Error", "Exception": "System.ArgumentNullException: Value cannot be null. (Parameter 'nul la bu')", "Timestamp": "2022-07-22T00:44:55.0735724+03:00", "Properties": {"EventId": {"Id": 122, "Name": "eventName"}, "ActionId": "89992099-83f1-45ee-b80c-e610a40cfd5a", "RequestId": "0HMJBC8Q7G1KE:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBC8Q7G1KE", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}, "MessageTemplate": "mesaj"}	{"EventId": {"Id": 122, "Name": "eventName"}, "ActionId": "89992099-83f1-45ee-b80c-e610a40cfd5a", "RequestId": "0HMJBC8Q7G1KE:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBC8Q7G1KE", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}	\N
test	test	Information	2022-07-22 00:46:26.035839	\N	{"Level": "Information", "Timestamp": "2022-07-22T00:46:26.0358397+03:00", "Properties": {"ActionId": "912bda0e-2f9b-485e-bd1d-a6e34c69c7e4", "RequestId": "0HMJBC9MVGOTU:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBC9MVGOTU", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}, "MessageTemplate": "test"}	{"ActionId": "912bda0e-2f9b-485e-bd1d-a6e34c69c7e4", "RequestId": "0HMJBC9MVGOTU:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBC9MVGOTU", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}	\N
mesaj	mesaj	Error	2022-07-22 00:46:26.063816	System.ArgumentNullException: Value cannot be null. (Parameter 'nul la bu')	{"Level": "Error", "Exception": "System.ArgumentNullException: Value cannot be null. (Parameter 'nul la bu')", "Timestamp": "2022-07-22T00:46:26.0638162+03:00", "Properties": {"EventId": {"Id": 122, "Name": "eventName"}, "ActionId": "912bda0e-2f9b-485e-bd1d-a6e34c69c7e4", "RequestId": "0HMJBC9MVGOTU:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBC9MVGOTU", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}, "MessageTemplate": "mesaj"}	{"EventId": {"Id": 122, "Name": "eventName"}, "ActionId": "912bda0e-2f9b-485e-bd1d-a6e34c69c7e4", "RequestId": "0HMJBC9MVGOTU:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Application": "Sample Enterprise Api", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJBC9MVGOTU", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}	\N
\.


--
-- Data for Name: logs2; Type: TABLE DATA; Schema: global; Owner: nlayer
--

COPY global.logs2 (message, message_template, level, "timestamp", exception, log_event) FROM stdin;
\.


--
-- Data for Name: logs3; Type: TABLE DATA; Schema: global; Owner: nlayer
--

COPY global.logs3 (message, message_template, level, "timestamp", exception, log_event) FROM stdin;
\.


--
-- Data for Name: logs4; Type: TABLE DATA; Schema: global; Owner: nlayer
--

COPY global.logs4 (message, message_template, level, raise_date, exception, properties, props_test, machine_name) FROM stdin;
Request starting HTTP/2 GET https://localhost:7201/WeatherForecast - -	{HostingRequestStartingLog:l}	Information	2022-07-21 04:02:12.44732	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:02:12.4473206+03:00", "Properties": {"Host": "localhost:7201", "Path": "/WeatherForecast", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMHTPO003:00000009", "ContentType": null, "QueryString": "", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/WeatherForecast - -"}, "Renderings": {"HostingRequestStartingLog": [{"Format": "l", "Rendering": "Request starting HTTP/2 GET https://localhost:7201/WeatherForecast - -"}]}, "MessageTemplate": "{HostingRequestStartingLog:l}"}	{"Host": "localhost:7201", "Path": "/WeatherForecast", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMHTPO003:00000009", "ContentType": null, "QueryString": "", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/WeatherForecast - -"}	\N
Executing endpoint '"SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)"'	Executing endpoint '{EndpointName}'	Information	2022-07-21 04:02:12.578214	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:02:12.5782144+03:00", "Properties": {"EventId": {"Name": "ExecutingEndpoint"}, "RequestId": "0HMJAMHTPO003:00000009", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "EndpointName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "SourceContext": "Microsoft.AspNetCore.Routing.EndpointMiddleware"}, "MessageTemplate": "Executing endpoint '{EndpointName}'"}	{"EventId": {"Name": "ExecutingEndpoint"}, "RequestId": "0HMJAMHTPO003:00000009", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "EndpointName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "SourceContext": "Microsoft.AspNetCore.Routing.EndpointMiddleware"}	\N
Route matched with "{action = \\"Get\\", controller = \\"WeatherForecast\\", area = \\"\\"}". Executing controller action with signature "System.Collections.Generic.IEnumerable`1[SampleEntDev.API.WeatherForecast] Get()" on controller "SampleEntDev.API.Controllers.WeatherForecastController" ("SampleEntDev.API").	Route matched with {RouteData}. Executing controller action with signature {MethodInfo} on controller {Controller} ({AssemblyName}).	Information	2022-07-21 04:02:12.590477	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:02:12.5904778+03:00", "Properties": {"EventId": {"Id": 3, "Name": "ControllerActionExecuting"}, "ActionId": "71505426-9f19-400a-a9f5-f816a8f87f50", "RequestId": "0HMJAMHTPO003:00000009", "RouteData": "{action = \\"Get\\", controller = \\"WeatherForecast\\", area = \\"\\"}", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Controller": "SampleEntDev.API.Controllers.WeatherForecastController", "MethodInfo": "System.Collections.Generic.IEnumerable`1[SampleEntDev.API.WeatherForecast] Get()", "RequestPath": "/WeatherForecast", "AssemblyName": "SampleEntDev.API", "ConnectionId": "0HMJAMHTPO003", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker"}, "MessageTemplate": "Route matched with {RouteData}. Executing controller action with signature {MethodInfo} on controller {Controller} ({AssemblyName})."}	{"EventId": {"Id": 3, "Name": "ControllerActionExecuting"}, "ActionId": "71505426-9f19-400a-a9f5-f816a8f87f50", "RequestId": "0HMJAMHTPO003:00000009", "RouteData": "{action = \\"Get\\", controller = \\"WeatherForecast\\", area = \\"\\"}", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Controller": "SampleEntDev.API.Controllers.WeatherForecastController", "MethodInfo": "System.Collections.Generic.IEnumerable`1[SampleEntDev.API.WeatherForecast] Get()", "RequestPath": "/WeatherForecast", "AssemblyName": "SampleEntDev.API", "ConnectionId": "0HMJAMHTPO003", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker"}	\N
test	test	Information	2022-07-21 04:02:14.657212	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:02:14.6572128+03:00", "Properties": {"ActionId": "71505426-9f19-400a-a9f5-f816a8f87f50", "RequestId": "0HMJAMHTPO003:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}, "MessageTemplate": "test"}	{"ActionId": "71505426-9f19-400a-a9f5-f816a8f87f50", "RequestId": "0HMJAMHTPO003:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}	\N
mesaj	mesaj	Error	2022-07-21 04:02:14.65755	System.ArgumentNullException: Value cannot be null. (Parameter 'nul la bu')	{"Level": "Error", "Exception": "System.ArgumentNullException: Value cannot be null. (Parameter 'nul la bu')", "Timestamp": "2022-07-21T04:02:14.6575504+03:00", "Properties": {"EventId": {"Id": 122, "Name": "eventName"}, "ActionId": "71505426-9f19-400a-a9f5-f816a8f87f50", "RequestId": "0HMJAMHTPO003:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}, "MessageTemplate": "mesaj"}	{"EventId": {"Id": 122, "Name": "eventName"}, "ActionId": "71505426-9f19-400a-a9f5-f816a8f87f50", "RequestId": "0HMJAMHTPO003:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}	\N
Executing "ObjectResult", writing value of type '"SampleEntDev.API.WeatherForecast[]"'.	Executing {ObjectResultType}, writing value of type '{Type}'.	Information	2022-07-21 04:02:14.692731	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:02:14.6927316+03:00", "Properties": {"Type": "SampleEntDev.API.WeatherForecast[]", "EventId": {"Id": 1, "Name": "ObjectResultExecuting"}, "ActionId": "71505426-9f19-400a-a9f5-f816a8f87f50", "RequestId": "0HMJAMHTPO003:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ObjectResultExecutor", "ObjectResultType": "ObjectResult"}, "MessageTemplate": "Executing {ObjectResultType}, writing value of type '{Type}'."}	{"Type": "SampleEntDev.API.WeatherForecast[]", "EventId": {"Id": 1, "Name": "ObjectResultExecuting"}, "ActionId": "71505426-9f19-400a-a9f5-f816a8f87f50", "RequestId": "0HMJAMHTPO003:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ObjectResultExecutor", "ObjectResultType": "ObjectResult"}	\N
Executed action "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)" in 2128.9152ms	Executed action {ActionName} in {ElapsedMilliseconds}ms	Information	2022-07-21 04:02:14.756994	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:02:14.7569946+03:00", "Properties": {"EventId": {"Id": 2, "Name": "ActionExecuted"}, "RequestId": "0HMJAMHTPO003:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker", "ElapsedMilliseconds": 2128.9152}, "MessageTemplate": "Executed action {ActionName} in {ElapsedMilliseconds}ms"}	{"EventId": {"Id": 2, "Name": "ActionExecuted"}, "RequestId": "0HMJAMHTPO003:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker", "ElapsedMilliseconds": 2128.9152}	\N
Executed endpoint '"SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)"'	Executed endpoint '{EndpointName}'	Information	2022-07-21 04:02:14.757126	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:02:14.7571265+03:00", "Properties": {"EventId": {"Id": 1, "Name": "ExecutedEndpoint"}, "RequestId": "0HMJAMHTPO003:00000009", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "EndpointName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "SourceContext": "Microsoft.AspNetCore.Routing.EndpointMiddleware"}, "MessageTemplate": "Executed endpoint '{EndpointName}'"}	{"EventId": {"Id": 1, "Name": "ExecutedEndpoint"}, "RequestId": "0HMJAMHTPO003:00000009", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "EndpointName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "SourceContext": "Microsoft.AspNetCore.Routing.EndpointMiddleware"}	\N
Request finished HTTP/2 GET https://localhost:7201/WeatherForecast - - - 200 - application/json;+charset=utf-8 2310.1214ms	{HostingRequestFinishedLog:l}	Information	2022-07-21 04:02:14.757473	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:02:14.7574735+03:00", "Properties": {"Host": "localhost:7201", "Path": "/WeatherForecast", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMHTPO003:00000009", "StatusCode": 200, "ContentType": "application/json; charset=utf-8", "QueryString": "", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 2310.1214, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/WeatherForecast - - - 200 - application/json;+charset=utf-8 2310.1214ms"}, "Renderings": {"HostingRequestFinishedLog": [{"Format": "l", "Rendering": "Request finished HTTP/2 GET https://localhost:7201/WeatherForecast - - - 200 - application/json;+charset=utf-8 2310.1214ms"}]}, "MessageTemplate": "{HostingRequestFinishedLog:l}"}	{"Host": "localhost:7201", "Path": "/WeatherForecast", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMHTPO003:00000009", "StatusCode": 200, "ContentType": "application/json; charset=utf-8", "QueryString": "", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMHTPO003", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 2310.1214, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/WeatherForecast - - - 200 - application/json;+charset=utf-8 2310.1214ms"}	\N
User profile is available. Using '"C:\\Users\\Osman\\AppData\\Local\\ASP.NET\\DataProtection-Keys"' as key repository and Windows DPAPI to encrypt keys at rest.	User profile is available. Using '{FullName}' as key repository and Windows DPAPI to encrypt keys at rest.	Information	2022-07-21 04:06:09.334057	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:09.3340573+03:00", "Properties": {"EventId": {"Id": 63, "Name": "UsingProfileAsKeyRepositoryWithDPAPI"}, "FullName": "C:\\\\Users\\\\Osman\\\\AppData\\\\Local\\\\ASP.NET\\\\DataProtection-Keys", "SourceContext": "Microsoft.AspNetCore.DataProtection.KeyManagement.XmlKeyManager"}, "MessageTemplate": "User profile is available. Using '{FullName}' as key repository and Windows DPAPI to encrypt keys at rest."}	{"EventId": {"Id": 63, "Name": "UsingProfileAsKeyRepositoryWithDPAPI"}, "FullName": "C:\\\\Users\\\\Osman\\\\AppData\\\\Local\\\\ASP.NET\\\\DataProtection-Keys", "SourceContext": "Microsoft.AspNetCore.DataProtection.KeyManagement.XmlKeyManager"}	\N
Now listening on: "https://localhost:7201"	Now listening on: {address}	Information	2022-07-21 04:06:09.678899	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:09.6788994+03:00", "Properties": {"EventId": {"Id": 14, "Name": "ListeningOnAddress"}, "address": "https://localhost:7201", "SourceContext": "Microsoft.Hosting.Lifetime"}, "MessageTemplate": "Now listening on: {address}"}	{"EventId": {"Id": 14, "Name": "ListeningOnAddress"}, "address": "https://localhost:7201", "SourceContext": "Microsoft.Hosting.Lifetime"}	\N
Now listening on: "http://localhost:5201"	Now listening on: {address}	Information	2022-07-21 04:06:09.679052	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:09.6790528+03:00", "Properties": {"EventId": {"Id": 14, "Name": "ListeningOnAddress"}, "address": "http://localhost:5201", "SourceContext": "Microsoft.Hosting.Lifetime"}, "MessageTemplate": "Now listening on: {address}"}	{"EventId": {"Id": 14, "Name": "ListeningOnAddress"}, "address": "http://localhost:5201", "SourceContext": "Microsoft.Hosting.Lifetime"}	\N
Application started. Press Ctrl+C to shut down.	Application started. Press Ctrl+C to shut down.	Information	2022-07-21 04:06:09.682569	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:09.6825696+03:00", "Properties": {"SourceContext": "Microsoft.Hosting.Lifetime"}, "MessageTemplate": "Application started. Press Ctrl+C to shut down."}	{"SourceContext": "Microsoft.Hosting.Lifetime"}	\N
Hosting environment: "Development"	Hosting environment: {envName}	Information	2022-07-21 04:06:09.682646	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:09.6826465+03:00", "Properties": {"envName": "Development", "SourceContext": "Microsoft.Hosting.Lifetime"}, "MessageTemplate": "Hosting environment: {envName}"}	{"envName": "Development", "SourceContext": "Microsoft.Hosting.Lifetime"}	\N
Content root path: "C:\\Users\\Osman\\Source\\Repos\\SampleEnterpriseApp\\SampleEntDev.API\\"	Content root path: {contentRoot}	Information	2022-07-21 04:06:09.682675	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:09.6826750+03:00", "Properties": {"contentRoot": "C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\", "SourceContext": "Microsoft.Hosting.Lifetime"}, "MessageTemplate": "Content root path: {contentRoot}"}	{"contentRoot": "C:\\\\Users\\\\Osman\\\\Source\\\\Repos\\\\SampleEnterpriseApp\\\\SampleEntDev.API\\\\", "SourceContext": "Microsoft.Hosting.Lifetime"}	\N
Request starting HTTP/2 GET https://localhost:7201/swagger/index.html - -	{HostingRequestStartingLog:l}	Information	2022-07-21 04:06:10.267554	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:10.2675544+03:00", "Properties": {"Host": "localhost:7201", "Path": "/swagger/index.html", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000001", "ContentType": null, "QueryString": "", "RequestPath": "/swagger/index.html", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/swagger/index.html - -"}, "Renderings": {"HostingRequestStartingLog": [{"Format": "l", "Rendering": "Request starting HTTP/2 GET https://localhost:7201/swagger/index.html - -"}]}, "MessageTemplate": "{HostingRequestStartingLog:l}"}	{"Host": "localhost:7201", "Path": "/swagger/index.html", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000001", "ContentType": null, "QueryString": "", "RequestPath": "/swagger/index.html", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/swagger/index.html - -"}	\N
Request starting HTTP/2 GET https://localhost:7201/_framework/aspnetcore-browser-refresh.js - -	{HostingRequestStartingLog:l}	Information	2022-07-21 04:06:10.678679	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:10.6786792+03:00", "Properties": {"Host": "localhost:7201", "Path": "/_framework/aspnetcore-browser-refresh.js", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000003", "ContentType": null, "QueryString": "", "RequestPath": "/_framework/aspnetcore-browser-refresh.js", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/_framework/aspnetcore-browser-refresh.js - -"}, "Renderings": {"HostingRequestStartingLog": [{"Format": "l", "Rendering": "Request starting HTTP/2 GET https://localhost:7201/_framework/aspnetcore-browser-refresh.js - -"}]}, "MessageTemplate": "{HostingRequestStartingLog:l}"}	{"Host": "localhost:7201", "Path": "/_framework/aspnetcore-browser-refresh.js", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000003", "ContentType": null, "QueryString": "", "RequestPath": "/_framework/aspnetcore-browser-refresh.js", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/_framework/aspnetcore-browser-refresh.js - -"}	\N
Request finished HTTP/2 GET https://localhost:7201/_framework/aspnetcore-browser-refresh.js - - - 200 12002 application/javascript;+charset=utf-8 8.5974ms	{HostingRequestFinishedLog:l}	Information	2022-07-21 04:06:10.688697	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:10.6886973+03:00", "Properties": {"Host": "localhost:7201", "Path": "/_framework/aspnetcore-browser-refresh.js", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000003", "StatusCode": 200, "ContentType": "application/javascript; charset=utf-8", "QueryString": "", "RequestPath": "/_framework/aspnetcore-browser-refresh.js", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": 12002, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 8.5974, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/_framework/aspnetcore-browser-refresh.js - - - 200 12002 application/javascript;+charset=utf-8 8.5974ms"}, "Renderings": {"HostingRequestFinishedLog": [{"Format": "l", "Rendering": "Request finished HTTP/2 GET https://localhost:7201/_framework/aspnetcore-browser-refresh.js - - - 200 12002 application/javascript;+charset=utf-8 8.5974ms"}]}, "MessageTemplate": "{HostingRequestFinishedLog:l}"}	{"Host": "localhost:7201", "Path": "/_framework/aspnetcore-browser-refresh.js", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000003", "StatusCode": 200, "ContentType": "application/javascript; charset=utf-8", "QueryString": "", "RequestPath": "/_framework/aspnetcore-browser-refresh.js", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": 12002, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 8.5974, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/_framework/aspnetcore-browser-refresh.js - - - 200 12002 application/javascript;+charset=utf-8 8.5974ms"}	\N
Request finished HTTP/2 GET https://localhost:7201/swagger/index.html - - - 200 - text/html;charset=utf-8 446.9768ms	{HostingRequestFinishedLog:l}	Information	2022-07-21 04:06:10.709393	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:10.7093932+03:00", "Properties": {"Host": "localhost:7201", "Path": "/swagger/index.html", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000001", "StatusCode": 200, "ContentType": "text/html;charset=utf-8", "QueryString": "", "RequestPath": "/swagger/index.html", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 446.9768, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/swagger/index.html - - - 200 - text/html;charset=utf-8 446.9768ms"}, "Renderings": {"HostingRequestFinishedLog": [{"Format": "l", "Rendering": "Request finished HTTP/2 GET https://localhost:7201/swagger/index.html - - - 200 - text/html;charset=utf-8 446.9768ms"}]}, "MessageTemplate": "{HostingRequestFinishedLog:l}"}	{"Host": "localhost:7201", "Path": "/swagger/index.html", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000001", "StatusCode": 200, "ContentType": "text/html;charset=utf-8", "QueryString": "", "RequestPath": "/swagger/index.html", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 446.9768, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/swagger/index.html - - - 200 - text/html;charset=utf-8 446.9768ms"}	\N
Executed action "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)" in 3251.2635ms	Executed action {ActionName} in {ElapsedMilliseconds}ms	Information	2022-07-21 04:06:19.696056	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:19.6960567+03:00", "Properties": {"EventId": {"Id": 2, "Name": "ActionExecuted"}, "RequestId": "0HMJAMKPAFODA:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker", "ElapsedMilliseconds": 3251.2635}, "MessageTemplate": "Executed action {ActionName} in {ElapsedMilliseconds}ms"}	{"EventId": {"Id": 2, "Name": "ActionExecuted"}, "RequestId": "0HMJAMKPAFODA:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker", "ElapsedMilliseconds": 3251.2635}	\N
Request starting HTTP/2 GET https://localhost:7201/_vs/browserLink - -	{HostingRequestStartingLog:l}	Information	2022-07-21 04:06:10.783665	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:10.7836656+03:00", "Properties": {"Host": "localhost:7201", "Path": "/_vs/browserLink", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000005", "ContentType": null, "QueryString": "", "RequestPath": "/_vs/browserLink", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/_vs/browserLink - -"}, "Renderings": {"HostingRequestStartingLog": [{"Format": "l", "Rendering": "Request starting HTTP/2 GET https://localhost:7201/_vs/browserLink - -"}]}, "MessageTemplate": "{HostingRequestStartingLog:l}"}	{"Host": "localhost:7201", "Path": "/_vs/browserLink", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000005", "ContentType": null, "QueryString": "", "RequestPath": "/_vs/browserLink", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/_vs/browserLink - -"}	\N
Request finished HTTP/2 GET https://localhost:7201/_vs/browserLink - - - 200 - text/javascript;+charset=UTF-8 40.5583ms	{HostingRequestFinishedLog:l}	Information	2022-07-21 04:06:10.824189	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:10.8241898+03:00", "Properties": {"Host": "localhost:7201", "Path": "/_vs/browserLink", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000005", "StatusCode": 200, "ContentType": "text/javascript; charset=UTF-8", "QueryString": "", "RequestPath": "/_vs/browserLink", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 40.5583, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/_vs/browserLink - - - 200 - text/javascript;+charset=UTF-8 40.5583ms"}, "Renderings": {"HostingRequestFinishedLog": [{"Format": "l", "Rendering": "Request finished HTTP/2 GET https://localhost:7201/_vs/browserLink - - - 200 - text/javascript;+charset=UTF-8 40.5583ms"}]}, "MessageTemplate": "{HostingRequestFinishedLog:l}"}	{"Host": "localhost:7201", "Path": "/_vs/browserLink", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000005", "StatusCode": 200, "ContentType": "text/javascript; charset=UTF-8", "QueryString": "", "RequestPath": "/_vs/browserLink", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 40.5583, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/_vs/browserLink - - - 200 - text/javascript;+charset=UTF-8 40.5583ms"}	\N
Request starting HTTP/2 GET https://localhost:7201/swagger/v1/swagger.json - -	{HostingRequestStartingLog:l}	Information	2022-07-21 04:06:11.027807	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:11.0278070+03:00", "Properties": {"Host": "localhost:7201", "Path": "/swagger/v1/swagger.json", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000007", "ContentType": null, "QueryString": "", "RequestPath": "/swagger/v1/swagger.json", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/swagger/v1/swagger.json - -"}, "Renderings": {"HostingRequestStartingLog": [{"Format": "l", "Rendering": "Request starting HTTP/2 GET https://localhost:7201/swagger/v1/swagger.json - -"}]}, "MessageTemplate": "{HostingRequestStartingLog:l}"}	{"Host": "localhost:7201", "Path": "/swagger/v1/swagger.json", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000007", "ContentType": null, "QueryString": "", "RequestPath": "/swagger/v1/swagger.json", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/swagger/v1/swagger.json - -"}	\N
Request finished HTTP/2 GET https://localhost:7201/swagger/v1/swagger.json - - - 200 - application/json;charset=utf-8 481.7793ms	{HostingRequestFinishedLog:l}	Information	2022-07-21 04:06:11.509763	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:11.5097637+03:00", "Properties": {"Host": "localhost:7201", "Path": "/swagger/v1/swagger.json", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000007", "StatusCode": 200, "ContentType": "application/json;charset=utf-8", "QueryString": "", "RequestPath": "/swagger/v1/swagger.json", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 481.7793, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/swagger/v1/swagger.json - - - 200 - application/json;charset=utf-8 481.7793ms"}, "Renderings": {"HostingRequestFinishedLog": [{"Format": "l", "Rendering": "Request finished HTTP/2 GET https://localhost:7201/swagger/v1/swagger.json - - - 200 - application/json;charset=utf-8 481.7793ms"}]}, "MessageTemplate": "{HostingRequestFinishedLog:l}"}	{"Host": "localhost:7201", "Path": "/swagger/v1/swagger.json", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000007", "StatusCode": 200, "ContentType": "application/json;charset=utf-8", "QueryString": "", "RequestPath": "/swagger/v1/swagger.json", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 481.7793, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/swagger/v1/swagger.json - - - 200 - application/json;charset=utf-8 481.7793ms"}	\N
Executed endpoint '"SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)"'	Executed endpoint '{EndpointName}'	Information	2022-07-21 04:06:19.696248	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:19.6962488+03:00", "Properties": {"EventId": {"Id": 1, "Name": "ExecutedEndpoint"}, "RequestId": "0HMJAMKPAFODA:00000009", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "EndpointName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "SourceContext": "Microsoft.AspNetCore.Routing.EndpointMiddleware"}, "MessageTemplate": "Executed endpoint '{EndpointName}'"}	{"EventId": {"Id": 1, "Name": "ExecutedEndpoint"}, "RequestId": "0HMJAMKPAFODA:00000009", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "EndpointName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "SourceContext": "Microsoft.AspNetCore.Routing.EndpointMiddleware"}	\N
Request starting HTTP/2 GET https://localhost:7201/WeatherForecast - -	{HostingRequestStartingLog:l}	Information	2022-07-21 04:06:16.006556	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:16.0065568+03:00", "Properties": {"Host": "localhost:7201", "Path": "/WeatherForecast", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000009", "ContentType": null, "QueryString": "", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/WeatherForecast - -"}, "Renderings": {"HostingRequestStartingLog": [{"Format": "l", "Rendering": "Request starting HTTP/2 GET https://localhost:7201/WeatherForecast - -"}]}, "MessageTemplate": "{HostingRequestStartingLog:l}"}	{"Host": "localhost:7201", "Path": "/WeatherForecast", "Method": "GET", "Scheme": "https", "EventId": {"Id": 1}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000009", "ContentType": null, "QueryString": "", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "HostingRequestStartingLog": "Request starting HTTP/2 GET https://localhost:7201/WeatherForecast - -"}	\N
Executing endpoint '"SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)"'	Executing endpoint '{EndpointName}'	Information	2022-07-21 04:06:16.363915	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:16.3639151+03:00", "Properties": {"EventId": {"Name": "ExecutingEndpoint"}, "RequestId": "0HMJAMKPAFODA:00000009", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "EndpointName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "SourceContext": "Microsoft.AspNetCore.Routing.EndpointMiddleware"}, "MessageTemplate": "Executing endpoint '{EndpointName}'"}	{"EventId": {"Name": "ExecutingEndpoint"}, "RequestId": "0HMJAMKPAFODA:00000009", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "EndpointName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "SourceContext": "Microsoft.AspNetCore.Routing.EndpointMiddleware"}	\N
Route matched with "{action = \\"Get\\", controller = \\"WeatherForecast\\", area = \\"\\"}". Executing controller action with signature "System.Collections.Generic.IEnumerable`1[SampleEntDev.API.WeatherForecast] Get()" on controller "SampleEntDev.API.Controllers.WeatherForecastController" ("SampleEntDev.API").	Route matched with {RouteData}. Executing controller action with signature {MethodInfo} on controller {Controller} ({AssemblyName}).	Information	2022-07-21 04:06:16.421238	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:16.4212382+03:00", "Properties": {"EventId": {"Id": 3, "Name": "ControllerActionExecuting"}, "ActionId": "05927eae-57fb-41dc-bf75-2802f29eea7a", "RequestId": "0HMJAMKPAFODA:00000009", "RouteData": "{action = \\"Get\\", controller = \\"WeatherForecast\\", area = \\"\\"}", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Controller": "SampleEntDev.API.Controllers.WeatherForecastController", "MethodInfo": "System.Collections.Generic.IEnumerable`1[SampleEntDev.API.WeatherForecast] Get()", "RequestPath": "/WeatherForecast", "AssemblyName": "SampleEntDev.API", "ConnectionId": "0HMJAMKPAFODA", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker"}, "MessageTemplate": "Route matched with {RouteData}. Executing controller action with signature {MethodInfo} on controller {Controller} ({AssemblyName})."}	{"EventId": {"Id": 3, "Name": "ControllerActionExecuting"}, "ActionId": "05927eae-57fb-41dc-bf75-2802f29eea7a", "RequestId": "0HMJAMKPAFODA:00000009", "RouteData": "{action = \\"Get\\", controller = \\"WeatherForecast\\", area = \\"\\"}", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "Controller": "SampleEntDev.API.Controllers.WeatherForecastController", "MethodInfo": "System.Collections.Generic.IEnumerable`1[SampleEntDev.API.WeatherForecast] Get()", "RequestPath": "/WeatherForecast", "AssemblyName": "SampleEntDev.API", "ConnectionId": "0HMJAMKPAFODA", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ControllerActionInvoker"}	\N
test	test	Information	2022-07-21 04:06:19.613203	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:19.6132036+03:00", "Properties": {"ActionId": "05927eae-57fb-41dc-bf75-2802f29eea7a", "RequestId": "0HMJAMKPAFODA:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}, "MessageTemplate": "test"}	{"ActionId": "05927eae-57fb-41dc-bf75-2802f29eea7a", "RequestId": "0HMJAMKPAFODA:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}	\N
mesaj	mesaj	Error	2022-07-21 04:06:19.613596	System.ArgumentNullException: Value cannot be null. (Parameter 'nul la bu')	{"Level": "Error", "Exception": "System.ArgumentNullException: Value cannot be null. (Parameter 'nul la bu')", "Timestamp": "2022-07-21T04:06:19.6135961+03:00", "Properties": {"EventId": {"Id": 122, "Name": "eventName"}, "ActionId": "05927eae-57fb-41dc-bf75-2802f29eea7a", "RequestId": "0HMJAMKPAFODA:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}, "MessageTemplate": "mesaj"}	{"EventId": {"Id": 122, "Name": "eventName"}, "ActionId": "05927eae-57fb-41dc-bf75-2802f29eea7a", "RequestId": "0HMJAMKPAFODA:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "SourceContext": "SampleEntDev.API.Controllers.WeatherForecastController"}	\N
Executing "ObjectResult", writing value of type '"SampleEntDev.API.WeatherForecast[]"'.	Executing {ObjectResultType}, writing value of type '{Type}'.	Information	2022-07-21 04:06:19.645462	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:19.6454627+03:00", "Properties": {"Type": "SampleEntDev.API.WeatherForecast[]", "EventId": {"Id": 1, "Name": "ObjectResultExecuting"}, "ActionId": "05927eae-57fb-41dc-bf75-2802f29eea7a", "RequestId": "0HMJAMKPAFODA:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ObjectResultExecutor", "ObjectResultType": "ObjectResult"}, "MessageTemplate": "Executing {ObjectResultType}, writing value of type '{Type}'."}	{"Type": "SampleEntDev.API.WeatherForecast[]", "EventId": {"Id": 1, "Name": "ObjectResultExecuting"}, "ActionId": "05927eae-57fb-41dc-bf75-2802f29eea7a", "RequestId": "0HMJAMKPAFODA:00000009", "ActionName": "SampleEntDev.API.Controllers.WeatherForecastController.Get (SampleEntDev.API)", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "SourceContext": "Microsoft.AspNetCore.Mvc.Infrastructure.ObjectResultExecutor", "ObjectResultType": "ObjectResult"}	\N
Request finished HTTP/2 GET https://localhost:7201/WeatherForecast - - - 200 - application/json;+charset=utf-8 3690.2760ms	{HostingRequestFinishedLog:l}	Information	2022-07-21 04:06:19.696708	\N	{"Level": "Information", "Timestamp": "2022-07-21T04:06:19.6967081+03:00", "Properties": {"Host": "localhost:7201", "Path": "/WeatherForecast", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000009", "StatusCode": 200, "ContentType": "application/json; charset=utf-8", "QueryString": "", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 3690.276, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/WeatherForecast - - - 200 - application/json;+charset=utf-8 3690.2760ms"}, "Renderings": {"HostingRequestFinishedLog": [{"Format": "l", "Rendering": "Request finished HTTP/2 GET https://localhost:7201/WeatherForecast - - - 200 - application/json;+charset=utf-8 3690.2760ms"}]}, "MessageTemplate": "{HostingRequestFinishedLog:l}"}	{"Host": "localhost:7201", "Path": "/WeatherForecast", "Method": "GET", "Scheme": "https", "EventId": {"Id": 2}, "PathBase": "", "Protocol": "HTTP/2", "RequestId": "0HMJAMKPAFODA:00000009", "StatusCode": 200, "ContentType": "application/json; charset=utf-8", "QueryString": "", "RequestPath": "/WeatherForecast", "ConnectionId": "0HMJAMKPAFODA", "ContentLength": null, "SourceContext": "Microsoft.AspNetCore.Hosting.Diagnostics", "ElapsedMilliseconds": 3690.276, "HostingRequestFinishedLog": "Request finished HTTP/2 GET https://localhost:7201/WeatherForecast - - - 200 - application/json;+charset=utf-8 3690.2760ms"}	\N
\.


--
-- Data for Name: functions; Type: TABLE DATA; Schema: management; Owner: nlayer
--

COPY management.functions (created_date, updated_date, id, function_name, area_name, controller_name, action_name, is_deleted, last_modifier) FROM stdin;
2022-07-08 02:27:53.083386	\N	1	All Category	ECommerce	Category	GetAll	f	\N
2022-07-08 02:28:50.083243	\N	2	Get By Id Function	ECommerce	Category	GetById	f	\N
2022-07-10 02:07:31.72911	\N	3	Get	ECommerce	Category	Get	f	\N
2022-07-15 02:36:17.823232	\N	4	Get	ECommerce	Product	Get	f	\N
2022-07-19 02:10:47.886106	\N	5	GetSingleCategoryByIdWithProducts	ECommerce	Category	GetSingleCategoryByIdWithProducts	f	\N
\.


--
-- Data for Name: menu; Type: TABLE DATA; Schema: management; Owner: nlayer
--

COPY management.menu (created_date, updated_date, id, name, description, url, parent_id, icon_path, function_id, is_deleted, last_modifier) FROM stdin;
\.


--
-- Data for Name: role_to_functions; Type: TABLE DATA; Schema: management; Owner: nlayer
--

COPY management.role_to_functions (created_date, updated_date, id, role_id, function_id, is_deleted, last_modifier) FROM stdin;
2022-07-10 02:36:07.838736	\N	1	1	1	f	\N
2022-07-10 02:36:16.307433	\N	2	1	2	f	\N
2022-07-10 02:36:23.460606	\N	3	1	3	f	\N
2022-07-14 01:38:33.469721	\N	4	2	3	f	\N
2022-07-14 01:44:43.272666	\N	5	1	3	f	\N
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: management; Owner: nlayer
--

COPY management.roles (created_date, updated_date, id, role_name, is_deleted, last_modifier) FROM stdin;
2022-07-10 02:30:46.655497	\N	1	Category All	f	\N
2022-07-10 02:30:46.655497	\N	2	a Product	f	\N
\.


--
-- Data for Name: user_to_funcitons; Type: TABLE DATA; Schema: management; Owner: nlayer
--

COPY management.user_to_funcitons (created_date, updated_date, user_id, function_id, validity_period_start_time, validity_period_end_time, id, is_deleted, last_modifier) FROM stdin;
2022-07-08 02:29:55.773054	\N	2	1	\N	\N	2	f	\N
2022-07-08 02:30:05.889398	\N	2	2	\N	\N	3	f	\N
2022-07-15 02:36:37.727033	\N	2	4	\N	\N	5	f	\N
2022-07-19 02:12:03.979441	\N	2	5	\N	\N	6	f	\N
\.


--
-- Data for Name: user_to_roles; Type: TABLE DATA; Schema: management; Owner: nlayer
--

COPY management.user_to_roles (created_date, updated_date, id, user_id, role_id, validity_period_start_time, validity_period_end_time, is_deleted, last_modifier) FROM stdin;
2022-07-10 02:31:00.035295	\N	2	2	1	\N	\N	f	\N
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: management; Owner: nlayer
--

COPY management.users (created_date, updated_date, id, identity_number, name, surename, e_mail, password, last_login_datetime, record_status, last_modifier_id, refresh_token, refresh_token_end_date, is_deleted, last_modifier) FROM stdin;
2022-07-05 03:28:56.60037	\N	2	311	osman	karamızrak	osman@osman.com	12345	\N	1	1	lcMrgrHhyCRO5Y6imkQz1/GgHPEzullLy2eEhHsQcRA=	2022-08-28 01:19:36.581717	f	\N
\.


--
-- Data for Name: BaseEntity; Type: TABLE DATA; Schema: public; Owner: nlayer
--

COPY public."BaseEntity" (created_date, updated_date, is_deleted, last_modifier) FROM stdin;
\.


--
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: ecommerce; Owner: nlayer
--

SELECT pg_catalog.setval('ecommerce.category_id_seq', 3, true);


--
-- Name: product_id_seq; Type: SEQUENCE SET; Schema: ecommerce; Owner: nlayer
--

SELECT pg_catalog.setval('ecommerce.product_id_seq', 20, true);


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: ecommerce; Owner: nlayer
--

SELECT pg_catalog.setval('ecommerce.test_id_seq', 1, false);


--
-- Name: Institution_id_seq; Type: SEQUENCE SET; Schema: global; Owner: nlayer
--

SELECT pg_catalog.setval('global."Institution_id_seq"', 1, false);


--
-- Name: Menu_id_seq; Type: SEQUENCE SET; Schema: management; Owner: nlayer
--

SELECT pg_catalog.setval('management."Menu_id_seq"', 1, false);


--
-- Name: RoleToFunctions_id_seq; Type: SEQUENCE SET; Schema: management; Owner: nlayer
--

SELECT pg_catalog.setval('management."RoleToFunctions_id_seq"', 5, true);


--
-- Name: Roles_id_seq; Type: SEQUENCE SET; Schema: management; Owner: nlayer
--

SELECT pg_catalog.setval('management."Roles_id_seq"', 2, true);


--
-- Name: UserToFunciton_id_seq; Type: SEQUENCE SET; Schema: management; Owner: nlayer
--

SELECT pg_catalog.setval('management."UserToFunciton_id_seq"', 6, true);


--
-- Name: UserToRoles_id_seq; Type: SEQUENCE SET; Schema: management; Owner: nlayer
--

SELECT pg_catalog.setval('management."UserToRoles_id_seq"', 2, true);


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: management; Owner: nlayer
--

SELECT pg_catalog.setval('management."User_id_seq"', 1, true);


--
-- Name: functions_id_seq; Type: SEQUENCE SET; Schema: management; Owner: nlayer
--

SELECT pg_catalog.setval('management.functions_id_seq', 4, true);


--
-- Name: category category_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- Name: product_feature product_feature_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.product_feature
    ADD CONSTRAINT product_feature_pkey PRIMARY KEY (product_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


--
-- Name: test test_pkey; Type: CONSTRAINT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- Name: institution institution_pkey; Type: CONSTRAINT; Schema: global; Owner: nlayer
--

ALTER TABLE ONLY global.institution
    ADD CONSTRAINT institution_pkey PRIMARY KEY (id);


--
-- Name: functions functions_pkey; Type: CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.functions
    ADD CONSTRAINT functions_pkey PRIMARY KEY (id);


--
-- Name: menu menu_pkey; Type: CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (id);


--
-- Name: role_to_functions role_to_functions_pkey; Type: CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.role_to_functions
    ADD CONSTRAINT role_to_functions_pkey PRIMARY KEY (id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: users user_pkey; Type: CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.users
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: user_to_funcitons user_to_funciton_pkey; Type: CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_funcitons
    ADD CONSTRAINT user_to_funciton_pkey PRIMARY KEY (id);


--
-- Name: user_to_roles user_to_roles_pkey; Type: CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_roles
    ADD CONSTRAINT user_to_roles_pkey PRIMARY KEY (id);


--
-- Name: product product_category_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.product
    ADD CONSTRAINT product_category_id_fkey FOREIGN KEY (category_id) REFERENCES ecommerce.category(id) NOT VALID;


--
-- Name: product_feature product_feature_product_id_fkey; Type: FK CONSTRAINT; Schema: ecommerce; Owner: nlayer
--

ALTER TABLE ONLY ecommerce.product_feature
    ADD CONSTRAINT product_feature_product_id_fkey FOREIGN KEY (product_id) REFERENCES ecommerce.product(id) NOT VALID;


--
-- Name: menu menu_function_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.menu
    ADD CONSTRAINT menu_function_id_fkey FOREIGN KEY (function_id) REFERENCES management.functions(id) NOT VALID;


--
-- Name: role_to_functions role_to_functions_function_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.role_to_functions
    ADD CONSTRAINT role_to_functions_function_id_fkey FOREIGN KEY (function_id) REFERENCES management.functions(id) NOT VALID;


--
-- Name: role_to_functions role_to_functions_role_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.role_to_functions
    ADD CONSTRAINT role_to_functions_role_id_fkey FOREIGN KEY (role_id) REFERENCES management.roles(id) NOT VALID;


--
-- Name: user_to_funcitons user_to_funciton_function_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_funcitons
    ADD CONSTRAINT user_to_funciton_function_id_fkey FOREIGN KEY (function_id) REFERENCES management.functions(id) NOT VALID;


--
-- Name: user_to_funcitons user_to_funciton_user_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_funcitons
    ADD CONSTRAINT user_to_funciton_user_id_fkey FOREIGN KEY (user_id) REFERENCES management.users(id) NOT VALID;


--
-- Name: user_to_roles user_to_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_roles
    ADD CONSTRAINT user_to_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES management.roles(id) NOT VALID;


--
-- Name: user_to_roles user_to_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: management; Owner: nlayer
--

ALTER TABLE ONLY management.user_to_roles
    ADD CONSTRAINT user_to_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES management.users(id) NOT VALID;


--
-- PostgreSQL database dump complete
--

