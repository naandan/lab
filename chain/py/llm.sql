--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.4 (Ubuntu 16.4-1.pgdg24.04+1)

-- Started on 2024-08-24 23:57:14 WIB

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
-- TOC entry 5 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 22092)
-- Name: auditlog_logentry; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auditlog_logentry (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    object_id bigint,
    object_repr text NOT NULL,
    action smallint NOT NULL,
    changes text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    actor_id bigint,
    content_type_id integer NOT NULL,
    remote_addr inet,
    additional_data jsonb,
    CONSTRAINT auditlog_logentry_action_check CHECK ((action >= 0))
);


ALTER TABLE public.auditlog_logentry OWNER TO root;

--
-- TOC entry 216 (class 1259 OID 22098)
-- Name: auditlog_logentry_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auditlog_logentry_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auditlog_logentry_id_seq OWNER TO root;

--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 216
-- Name: auditlog_logentry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auditlog_logentry_id_seq OWNED BY public.auditlog_logentry.id;


--
-- TOC entry 217 (class 1259 OID 22099)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO root;

--
-- TOC entry 218 (class 1259 OID 22102)
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_id_seq OWNER TO root;

--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 218
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 219 (class 1259 OID 22103)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO root;

--
-- TOC entry 220 (class 1259 OID 22106)
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_group_permissions_id_seq OWNER TO root;

--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 220
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 221 (class 1259 OID 22107)
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO root;

--
-- TOC entry 222 (class 1259 OID 22110)
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.auth_permission_id_seq OWNER TO root;

--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 223 (class 1259 OID 22111)
-- Name: axes_accessattempt; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.axes_accessattempt (
    id integer NOT NULL,
    user_agent character varying(255) NOT NULL,
    ip_address inet,
    username character varying(255),
    http_accept character varying(1025) NOT NULL,
    path_info character varying(255) NOT NULL,
    attempt_time timestamp with time zone NOT NULL,
    get_data text NOT NULL,
    post_data text NOT NULL,
    failures_since_start integer NOT NULL,
    CONSTRAINT axes_accessattempt_failures_since_start_check CHECK ((failures_since_start >= 0))
);


ALTER TABLE public.axes_accessattempt OWNER TO root;

--
-- TOC entry 224 (class 1259 OID 22117)
-- Name: axes_accessattempt_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.axes_accessattempt_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.axes_accessattempt_id_seq OWNER TO root;

--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 224
-- Name: axes_accessattempt_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.axes_accessattempt_id_seq OWNED BY public.axes_accessattempt.id;


--
-- TOC entry 225 (class 1259 OID 22118)
-- Name: axes_accessfailurelog; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.axes_accessfailurelog (
    id integer NOT NULL,
    user_agent character varying(255) NOT NULL,
    ip_address inet,
    username character varying(255),
    http_accept character varying(1025) NOT NULL,
    path_info character varying(255) NOT NULL,
    attempt_time timestamp with time zone NOT NULL,
    locked_out boolean NOT NULL
);


ALTER TABLE public.axes_accessfailurelog OWNER TO root;

--
-- TOC entry 226 (class 1259 OID 22123)
-- Name: axes_accessfailurelog_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.axes_accessfailurelog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.axes_accessfailurelog_id_seq OWNER TO root;

--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 226
-- Name: axes_accessfailurelog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.axes_accessfailurelog_id_seq OWNED BY public.axes_accessfailurelog.id;


--
-- TOC entry 227 (class 1259 OID 22124)
-- Name: axes_accesslog; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.axes_accesslog (
    id integer NOT NULL,
    user_agent character varying(255) NOT NULL,
    ip_address inet,
    username character varying(255),
    http_accept character varying(1025) NOT NULL,
    path_info character varying(255) NOT NULL,
    attempt_time timestamp with time zone NOT NULL,
    logout_time timestamp with time zone
);


ALTER TABLE public.axes_accesslog OWNER TO root;

--
-- TOC entry 228 (class 1259 OID 22129)
-- Name: axes_accesslog_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.axes_accesslog_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.axes_accesslog_id_seq OWNER TO root;

--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 228
-- Name: axes_accesslog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.axes_accesslog_id_seq OWNED BY public.axes_accesslog.id;


--
-- TOC entry 229 (class 1259 OID 22130)
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO root;

--
-- TOC entry 230 (class 1259 OID 22136)
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_admin_log_id_seq OWNER TO root;

--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 230
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 231 (class 1259 OID 22137)
-- Name: django_celery_beat_clockedschedule; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_celery_beat_clockedschedule (
    id integer NOT NULL,
    clocked_time timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_clockedschedule OWNER TO root;

--
-- TOC entry 232 (class 1259 OID 22140)
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_celery_beat_clockedschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNER TO root;

--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 232
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_celery_beat_clockedschedule_id_seq OWNED BY public.django_celery_beat_clockedschedule.id;


--
-- TOC entry 233 (class 1259 OID 22141)
-- Name: django_celery_beat_crontabschedule; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_celery_beat_crontabschedule (
    id integer NOT NULL,
    minute character varying(240) NOT NULL,
    hour character varying(96) NOT NULL,
    day_of_week character varying(64) NOT NULL,
    day_of_month character varying(124) NOT NULL,
    month_of_year character varying(64) NOT NULL,
    timezone character varying(63) NOT NULL
);


ALTER TABLE public.django_celery_beat_crontabschedule OWNER TO root;

--
-- TOC entry 234 (class 1259 OID 22146)
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_celery_beat_crontabschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNER TO root;

--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_celery_beat_crontabschedule_id_seq OWNED BY public.django_celery_beat_crontabschedule.id;


--
-- TOC entry 235 (class 1259 OID 22147)
-- Name: django_celery_beat_intervalschedule; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_celery_beat_intervalschedule (
    id integer NOT NULL,
    every integer NOT NULL,
    period character varying(24) NOT NULL
);


ALTER TABLE public.django_celery_beat_intervalschedule OWNER TO root;

--
-- TOC entry 236 (class 1259 OID 22150)
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_celery_beat_intervalschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNER TO root;

--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 236
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_celery_beat_intervalschedule_id_seq OWNED BY public.django_celery_beat_intervalschedule.id;


--
-- TOC entry 237 (class 1259 OID 22151)
-- Name: django_celery_beat_periodictask; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_celery_beat_periodictask (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    task character varying(200) NOT NULL,
    args text NOT NULL,
    kwargs text NOT NULL,
    queue character varying(200),
    exchange character varying(200),
    routing_key character varying(200),
    expires timestamp with time zone,
    enabled boolean NOT NULL,
    last_run_at timestamp with time zone,
    total_run_count integer NOT NULL,
    date_changed timestamp with time zone NOT NULL,
    description text NOT NULL,
    crontab_id integer,
    interval_id integer,
    solar_id integer,
    one_off boolean NOT NULL,
    start_time timestamp with time zone,
    priority integer,
    headers text NOT NULL,
    clocked_id integer,
    expire_seconds integer,
    CONSTRAINT django_celery_beat_periodictask_expire_seconds_check CHECK ((expire_seconds >= 0)),
    CONSTRAINT django_celery_beat_periodictask_priority_check CHECK ((priority >= 0)),
    CONSTRAINT django_celery_beat_periodictask_total_run_count_check CHECK ((total_run_count >= 0))
);


ALTER TABLE public.django_celery_beat_periodictask OWNER TO root;

--
-- TOC entry 238 (class 1259 OID 22159)
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_celery_beat_periodictask_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNER TO root;

--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 238
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_celery_beat_periodictask_id_seq OWNED BY public.django_celery_beat_periodictask.id;


--
-- TOC entry 239 (class 1259 OID 22160)
-- Name: django_celery_beat_periodictasks; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_celery_beat_periodictasks (
    ident smallint NOT NULL,
    last_update timestamp with time zone NOT NULL
);


ALTER TABLE public.django_celery_beat_periodictasks OWNER TO root;

--
-- TOC entry 240 (class 1259 OID 22163)
-- Name: django_celery_beat_solarschedule; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_celery_beat_solarschedule (
    id integer NOT NULL,
    event character varying(24) NOT NULL,
    latitude numeric(9,6) NOT NULL,
    longitude numeric(9,6) NOT NULL
);


ALTER TABLE public.django_celery_beat_solarschedule OWNER TO root;

--
-- TOC entry 241 (class 1259 OID 22166)
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_celery_beat_solarschedule_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNER TO root;

--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 241
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_celery_beat_solarschedule_id_seq OWNED BY public.django_celery_beat_solarschedule.id;


--
-- TOC entry 242 (class 1259 OID 22167)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO root;

--
-- TOC entry 243 (class 1259 OID 22170)
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_content_type_id_seq OWNER TO root;

--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 243
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 244 (class 1259 OID 22171)
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO root;

--
-- TOC entry 245 (class 1259 OID 22176)
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.django_migrations_id_seq OWNER TO root;

--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 245
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 246 (class 1259 OID 22177)
-- Name: django_session; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO root;

--
-- TOC entry 247 (class 1259 OID 22182)
-- Name: invoices_invoice; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.invoices_invoice (
    id bigint NOT NULL,
    creation_date date NOT NULL,
    due_date date,
    notes text NOT NULL,
    client_id bigint NOT NULL
);


ALTER TABLE public.invoices_invoice OWNER TO root;

--
-- TOC entry 248 (class 1259 OID 22187)
-- Name: invoices_invoice_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.invoices_invoice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoices_invoice_id_seq OWNER TO root;

--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 248
-- Name: invoices_invoice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.invoices_invoice_id_seq OWNED BY public.invoices_invoice.id;


--
-- TOC entry 249 (class 1259 OID 22188)
-- Name: invoices_invoicecommission; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.invoices_invoicecommission (
    id bigint NOT NULL,
    commission_amount numeric(10,0) NOT NULL,
    commission_date timestamp with time zone NOT NULL,
    commission_notes text NOT NULL,
    invoice_id bigint NOT NULL
);


ALTER TABLE public.invoices_invoicecommission OWNER TO root;

--
-- TOC entry 250 (class 1259 OID 22193)
-- Name: invoices_invoicecommission_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.invoices_invoicecommission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoices_invoicecommission_id_seq OWNER TO root;

--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 250
-- Name: invoices_invoicecommission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.invoices_invoicecommission_id_seq OWNED BY public.invoices_invoicecommission.id;


--
-- TOC entry 251 (class 1259 OID 22194)
-- Name: invoices_invoiceitem; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.invoices_invoiceitem (
    id bigint NOT NULL,
    item_name character varying(100) NOT NULL,
    item_price numeric(10,0) NOT NULL,
    item_quantity integer NOT NULL,
    item_total_price numeric(10,0) NOT NULL,
    item_tax numeric(10,0) NOT NULL,
    invoice_id bigint NOT NULL
);


ALTER TABLE public.invoices_invoiceitem OWNER TO root;

--
-- TOC entry 252 (class 1259 OID 22197)
-- Name: invoices_invoiceitem_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.invoices_invoiceitem_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoices_invoiceitem_id_seq OWNER TO root;

--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 252
-- Name: invoices_invoiceitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.invoices_invoiceitem_id_seq OWNED BY public.invoices_invoiceitem.id;


--
-- TOC entry 253 (class 1259 OID 22198)
-- Name: invoices_invoicepayment; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.invoices_invoicepayment (
    id bigint NOT NULL,
    payment_transaction_id character varying(100) NOT NULL,
    payment_transaction_fee numeric(10,0) NOT NULL,
    payment_date timestamp with time zone NOT NULL,
    payment_amount numeric(10,0) NOT NULL,
    payment_method character varying(100) NOT NULL,
    payment_notes text NOT NULL,
    invoice_id bigint NOT NULL
);


ALTER TABLE public.invoices_invoicepayment OWNER TO root;

--
-- TOC entry 254 (class 1259 OID 22203)
-- Name: invoices_invoicepayment_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.invoices_invoicepayment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoices_invoicepayment_id_seq OWNER TO root;

--
-- TOC entry 3918 (class 0 OID 0)
-- Dependencies: 254
-- Name: invoices_invoicepayment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.invoices_invoicepayment_id_seq OWNED BY public.invoices_invoicepayment.id;


--
-- TOC entry 255 (class 1259 OID 22204)
-- Name: invoices_invoicestatus; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.invoices_invoicestatus (
    id bigint NOT NULL,
    status integer NOT NULL,
    update_date timestamp with time zone NOT NULL,
    invoice_id bigint NOT NULL
);


ALTER TABLE public.invoices_invoicestatus OWNER TO root;

--
-- TOC entry 256 (class 1259 OID 22207)
-- Name: invoices_invoicestatus_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.invoices_invoicestatus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoices_invoicestatus_id_seq OWNER TO root;

--
-- TOC entry 3919 (class 0 OID 0)
-- Dependencies: 256
-- Name: invoices_invoicestatus_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.invoices_invoicestatus_id_seq OWNED BY public.invoices_invoicestatus.id;


--
-- TOC entry 257 (class 1259 OID 22208)
-- Name: invoices_invoicesummary; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.invoices_invoicesummary (
    id bigint NOT NULL,
    total_price numeric(10,0) NOT NULL,
    total_paid numeric(10,0) NOT NULL,
    total_refunded numeric(10,0) NOT NULL,
    total_due numeric(10,0) NOT NULL,
    invoice_id bigint NOT NULL
);


ALTER TABLE public.invoices_invoicesummary OWNER TO root;

--
-- TOC entry 258 (class 1259 OID 22211)
-- Name: invoices_invoicesummary_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.invoices_invoicesummary_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.invoices_invoicesummary_id_seq OWNER TO root;

--
-- TOC entry 3920 (class 0 OID 0)
-- Dependencies: 258
-- Name: invoices_invoicesummary_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.invoices_invoicesummary_id_seq OWNED BY public.invoices_invoicesummary.id;


--
-- TOC entry 259 (class 1259 OID 22212)
-- Name: maildb_emailconfiguration; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.maildb_emailconfiguration (
    id bigint NOT NULL,
    host character varying(256),
    port smallint,
    from_email character varying(256),
    username character varying(256),
    password character varying(256),
    use_tls boolean NOT NULL,
    use_ssl boolean NOT NULL,
    fail_silently boolean NOT NULL,
    timeout smallint
);


ALTER TABLE public.maildb_emailconfiguration OWNER TO root;

--
-- TOC entry 260 (class 1259 OID 22217)
-- Name: maildb_emailconfiguration_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.maildb_emailconfiguration_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.maildb_emailconfiguration_id_seq OWNER TO root;

--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 260
-- Name: maildb_emailconfiguration_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.maildb_emailconfiguration_id_seq OWNED BY public.maildb_emailconfiguration.id;


--
-- TOC entry 261 (class 1259 OID 22218)
-- Name: news_feed; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.news_feed (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    is_published boolean NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public.news_feed OWNER TO root;

--
-- TOC entry 262 (class 1259 OID 22223)
-- Name: news_feed_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.news_feed_groups (
    id bigint NOT NULL,
    newsfeed_id bigint NOT NULL,
    usergroup_id bigint NOT NULL
);


ALTER TABLE public.news_feed_groups OWNER TO root;

--
-- TOC entry 263 (class 1259 OID 22226)
-- Name: news_feed_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.news_feed_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_feed_groups_id_seq OWNER TO root;

--
-- TOC entry 3922 (class 0 OID 0)
-- Dependencies: 263
-- Name: news_feed_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.news_feed_groups_id_seq OWNED BY public.news_feed_groups.id;


--
-- TOC entry 264 (class 1259 OID 22227)
-- Name: news_feed_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.news_feed_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.news_feed_id_seq OWNER TO root;

--
-- TOC entry 3923 (class 0 OID 0)
-- Dependencies: 264
-- Name: news_feed_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.news_feed_id_seq OWNED BY public.news_feed.id;


--
-- TOC entry 265 (class 1259 OID 22228)
-- Name: otp_email_emaildevice; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.otp_email_emaildevice (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    confirmed boolean NOT NULL,
    user_id bigint NOT NULL,
    token character varying(16),
    valid_until timestamp with time zone NOT NULL,
    email character varying(254),
    throttling_failure_count integer NOT NULL,
    throttling_failure_timestamp timestamp with time zone,
    CONSTRAINT otp_email_emaildevice_throttling_failure_count_check CHECK ((throttling_failure_count >= 0))
);


ALTER TABLE public.otp_email_emaildevice OWNER TO root;

--
-- TOC entry 266 (class 1259 OID 22232)
-- Name: otp_email_emaildevice_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.otp_email_emaildevice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.otp_email_emaildevice_id_seq OWNER TO root;

--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 266
-- Name: otp_email_emaildevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.otp_email_emaildevice_id_seq OWNED BY public.otp_email_emaildevice.id;


--
-- TOC entry 267 (class 1259 OID 22233)
-- Name: otp_static_staticdevice; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.otp_static_staticdevice (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    confirmed boolean NOT NULL,
    user_id bigint NOT NULL,
    throttling_failure_count integer NOT NULL,
    throttling_failure_timestamp timestamp with time zone,
    CONSTRAINT otp_static_staticdevice_throttling_failure_count_check CHECK ((throttling_failure_count >= 0))
);


ALTER TABLE public.otp_static_staticdevice OWNER TO root;

--
-- TOC entry 268 (class 1259 OID 22237)
-- Name: otp_static_staticdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.otp_static_staticdevice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.otp_static_staticdevice_id_seq OWNER TO root;

--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 268
-- Name: otp_static_staticdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.otp_static_staticdevice_id_seq OWNED BY public.otp_static_staticdevice.id;


--
-- TOC entry 269 (class 1259 OID 22238)
-- Name: otp_static_statictoken; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.otp_static_statictoken (
    id integer NOT NULL,
    token character varying(16) NOT NULL,
    device_id integer NOT NULL
);


ALTER TABLE public.otp_static_statictoken OWNER TO root;

--
-- TOC entry 270 (class 1259 OID 22241)
-- Name: otp_static_statictoken_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.otp_static_statictoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.otp_static_statictoken_id_seq OWNER TO root;

--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 270
-- Name: otp_static_statictoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.otp_static_statictoken_id_seq OWNED BY public.otp_static_statictoken.id;


--
-- TOC entry 271 (class 1259 OID 22242)
-- Name: otp_totp_totpdevice; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.otp_totp_totpdevice (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    confirmed boolean NOT NULL,
    key character varying(80) NOT NULL,
    step smallint NOT NULL,
    t0 bigint NOT NULL,
    digits smallint NOT NULL,
    tolerance smallint NOT NULL,
    drift smallint NOT NULL,
    last_t bigint NOT NULL,
    user_id bigint NOT NULL,
    throttling_failure_count integer NOT NULL,
    throttling_failure_timestamp timestamp with time zone,
    CONSTRAINT otp_totp_totpdevice_digits_check CHECK ((digits >= 0)),
    CONSTRAINT otp_totp_totpdevice_step_check CHECK ((step >= 0)),
    CONSTRAINT otp_totp_totpdevice_throttling_failure_count_check CHECK ((throttling_failure_count >= 0)),
    CONSTRAINT otp_totp_totpdevice_tolerance_check CHECK ((tolerance >= 0))
);


ALTER TABLE public.otp_totp_totpdevice OWNER TO root;

--
-- TOC entry 272 (class 1259 OID 22249)
-- Name: otp_totp_totpdevice_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.otp_totp_totpdevice_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.otp_totp_totpdevice_id_seq OWNER TO root;

--
-- TOC entry 3927 (class 0 OID 0)
-- Dependencies: 272
-- Name: otp_totp_totpdevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.otp_totp_totpdevice_id_seq OWNED BY public.otp_totp_totpdevice.id;


--
-- TOC entry 273 (class 1259 OID 22250)
-- Name: two_factor_phonedevice; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.two_factor_phonedevice (
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    confirmed boolean NOT NULL,
    number character varying(128) NOT NULL,
    key character varying(40) NOT NULL,
    method character varying(4) NOT NULL,
    user_id bigint NOT NULL,
    throttling_failure_count integer NOT NULL,
    throttling_failure_timestamp timestamp with time zone,
    CONSTRAINT two_factor_phonedevice_throttling_failure_count_check CHECK ((throttling_failure_count >= 0))
);


ALTER TABLE public.two_factor_phonedevice OWNER TO root;

--
-- TOC entry 274 (class 1259 OID 22254)
-- Name: two_factor_phonedevice_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.two_factor_phonedevice_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.two_factor_phonedevice_id_seq OWNER TO root;

--
-- TOC entry 3928 (class 0 OID 0)
-- Dependencies: 274
-- Name: two_factor_phonedevice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.two_factor_phonedevice_id_seq OWNED BY public.two_factor_phonedevice.id;


--
-- TOC entry 275 (class 1259 OID 22255)
-- Name: users_user; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users_user (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    phone_number character varying(30) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    address character varying(100) NOT NULL,
    user_group_id bigint
);


ALTER TABLE public.users_user OWNER TO root;

--
-- TOC entry 276 (class 1259 OID 22260)
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users_user_groups (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO root;

--
-- TOC entry 277 (class 1259 OID 22263)
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_groups_id_seq OWNER TO root;

--
-- TOC entry 3929 (class 0 OID 0)
-- Dependencies: 277
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- TOC entry 278 (class 1259 OID 22264)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO root;

--
-- TOC entry 3930 (class 0 OID 0)
-- Dependencies: 278
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- TOC entry 279 (class 1259 OID 22265)
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users_user_user_permissions (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO root;

--
-- TOC entry 280 (class 1259 OID 22268)
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNER TO root;

--
-- TOC entry 3931 (class 0 OID 0)
-- Dependencies: 280
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- TOC entry 281 (class 1259 OID 22269)
-- Name: users_usergroup; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.users_usergroup (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users_usergroup OWNER TO root;

--
-- TOC entry 282 (class 1259 OID 22272)
-- Name: users_usergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.users_usergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_usergroup_id_seq OWNER TO root;

--
-- TOC entry 3932 (class 0 OID 0)
-- Dependencies: 282
-- Name: users_usergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.users_usergroup_id_seq OWNED BY public.users_usergroup.id;


--
-- TOC entry 283 (class 1259 OID 22273)
-- Name: vouchers_package; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.vouchers_package (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    ext_id bigint,
    price numeric(10,2) NOT NULL,
    commision numeric(10,2) NOT NULL,
    is_fixed_rate boolean NOT NULL,
    percentage_commision numeric(5,2) NOT NULL,
    extra_values text NOT NULL,
    is_enabled boolean NOT NULL,
    server_id bigint NOT NULL,
    is_synced boolean NOT NULL
);


ALTER TABLE public.vouchers_package OWNER TO root;

--
-- TOC entry 284 (class 1259 OID 22278)
-- Name: vouchers_package_groups; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.vouchers_package_groups (
    id bigint NOT NULL,
    package_id bigint NOT NULL,
    usergroup_id bigint NOT NULL
);


ALTER TABLE public.vouchers_package_groups OWNER TO root;

--
-- TOC entry 285 (class 1259 OID 22281)
-- Name: vouchers_package_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.vouchers_package_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vouchers_package_group_id_seq OWNER TO root;

--
-- TOC entry 3933 (class 0 OID 0)
-- Dependencies: 285
-- Name: vouchers_package_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.vouchers_package_group_id_seq OWNED BY public.vouchers_package_groups.id;


--
-- TOC entry 286 (class 1259 OID 22282)
-- Name: vouchers_package_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.vouchers_package_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vouchers_package_id_seq OWNER TO root;

--
-- TOC entry 3934 (class 0 OID 0)
-- Dependencies: 286
-- Name: vouchers_package_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.vouchers_package_id_seq OWNED BY public.vouchers_package.id;


--
-- TOC entry 287 (class 1259 OID 22283)
-- Name: vouchers_server; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.vouchers_server (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    endpoint character varying(100),
    username character varying(100),
    password character varying(100) NOT NULL,
    realm_id bigint,
    accesshash text,
    portal_url character varying(100),
    enabled boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.vouchers_server OWNER TO root;

--
-- TOC entry 288 (class 1259 OID 22288)
-- Name: vouchers_server_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.vouchers_server_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vouchers_server_id_seq OWNER TO root;

--
-- TOC entry 3935 (class 0 OID 0)
-- Dependencies: 288
-- Name: vouchers_server_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.vouchers_server_id_seq OWNED BY public.vouchers_server.id;


--
-- TOC entry 289 (class 1259 OID 22289)
-- Name: vouchers_servergroup; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.vouchers_servergroup (
    id bigint NOT NULL,
    name character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    server_id bigint NOT NULL
);


ALTER TABLE public.vouchers_servergroup OWNER TO root;

--
-- TOC entry 290 (class 1259 OID 22292)
-- Name: vouchers_servergroup_client_group; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.vouchers_servergroup_client_group (
    id bigint NOT NULL,
    servergroup_id bigint NOT NULL,
    usergroup_id bigint NOT NULL
);


ALTER TABLE public.vouchers_servergroup_client_group OWNER TO root;

--
-- TOC entry 291 (class 1259 OID 22295)
-- Name: vouchers_servergroup_client_group_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.vouchers_servergroup_client_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vouchers_servergroup_client_group_id_seq OWNER TO root;

--
-- TOC entry 3936 (class 0 OID 0)
-- Dependencies: 291
-- Name: vouchers_servergroup_client_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.vouchers_servergroup_client_group_id_seq OWNED BY public.vouchers_servergroup_client_group.id;


--
-- TOC entry 292 (class 1259 OID 22296)
-- Name: vouchers_servergroup_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.vouchers_servergroup_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vouchers_servergroup_id_seq OWNER TO root;

--
-- TOC entry 3937 (class 0 OID 0)
-- Dependencies: 292
-- Name: vouchers_servergroup_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.vouchers_servergroup_id_seq OWNED BY public.vouchers_servergroup.id;


--
-- TOC entry 293 (class 1259 OID 22297)
-- Name: vouchers_voucher; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE public.vouchers_voucher (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    password character varying(100) NOT NULL,
    ext_id bigint,
    status integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    extra_fields text NOT NULL,
    owner_id bigint NOT NULL,
    package_id bigint,
    sold boolean NOT NULL
);


ALTER TABLE public.vouchers_voucher OWNER TO root;

--
-- TOC entry 294 (class 1259 OID 22302)
-- Name: vouchers_voucher_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE public.vouchers_voucher_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vouchers_voucher_id_seq OWNER TO root;

--
-- TOC entry 3938 (class 0 OID 0)
-- Dependencies: 294
-- Name: vouchers_voucher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE public.vouchers_voucher_id_seq OWNED BY public.vouchers_voucher.id;


--
-- TOC entry 3401 (class 2604 OID 22303)
-- Name: auditlog_logentry id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auditlog_logentry ALTER COLUMN id SET DEFAULT nextval('public.auditlog_logentry_id_seq'::regclass);


--
-- TOC entry 3402 (class 2604 OID 22304)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 3403 (class 2604 OID 22305)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 3404 (class 2604 OID 22306)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 3405 (class 2604 OID 22307)
-- Name: axes_accessattempt id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.axes_accessattempt ALTER COLUMN id SET DEFAULT nextval('public.axes_accessattempt_id_seq'::regclass);


--
-- TOC entry 3406 (class 2604 OID 22308)
-- Name: axes_accessfailurelog id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.axes_accessfailurelog ALTER COLUMN id SET DEFAULT nextval('public.axes_accessfailurelog_id_seq'::regclass);


--
-- TOC entry 3407 (class 2604 OID 22309)
-- Name: axes_accesslog id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.axes_accesslog ALTER COLUMN id SET DEFAULT nextval('public.axes_accesslog_id_seq'::regclass);


--
-- TOC entry 3408 (class 2604 OID 22310)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 3409 (class 2604 OID 22311)
-- Name: django_celery_beat_clockedschedule id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_clockedschedule_id_seq'::regclass);


--
-- TOC entry 3410 (class 2604 OID 22312)
-- Name: django_celery_beat_crontabschedule id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_crontabschedule_id_seq'::regclass);


--
-- TOC entry 3411 (class 2604 OID 22313)
-- Name: django_celery_beat_intervalschedule id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_intervalschedule_id_seq'::regclass);


--
-- TOC entry 3412 (class 2604 OID 22314)
-- Name: django_celery_beat_periodictask id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_periodictask ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_periodictask_id_seq'::regclass);


--
-- TOC entry 3413 (class 2604 OID 22315)
-- Name: django_celery_beat_solarschedule id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule ALTER COLUMN id SET DEFAULT nextval('public.django_celery_beat_solarschedule_id_seq'::regclass);


--
-- TOC entry 3414 (class 2604 OID 22316)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 3415 (class 2604 OID 22317)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3416 (class 2604 OID 22318)
-- Name: invoices_invoice id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoice ALTER COLUMN id SET DEFAULT nextval('public.invoices_invoice_id_seq'::regclass);


--
-- TOC entry 3417 (class 2604 OID 22319)
-- Name: invoices_invoicecommission id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicecommission ALTER COLUMN id SET DEFAULT nextval('public.invoices_invoicecommission_id_seq'::regclass);


--
-- TOC entry 3418 (class 2604 OID 22320)
-- Name: invoices_invoiceitem id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoiceitem ALTER COLUMN id SET DEFAULT nextval('public.invoices_invoiceitem_id_seq'::regclass);


--
-- TOC entry 3419 (class 2604 OID 22321)
-- Name: invoices_invoicepayment id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicepayment ALTER COLUMN id SET DEFAULT nextval('public.invoices_invoicepayment_id_seq'::regclass);


--
-- TOC entry 3420 (class 2604 OID 22322)
-- Name: invoices_invoicestatus id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicestatus ALTER COLUMN id SET DEFAULT nextval('public.invoices_invoicestatus_id_seq'::regclass);


--
-- TOC entry 3421 (class 2604 OID 22323)
-- Name: invoices_invoicesummary id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicesummary ALTER COLUMN id SET DEFAULT nextval('public.invoices_invoicesummary_id_seq'::regclass);


--
-- TOC entry 3422 (class 2604 OID 22324)
-- Name: maildb_emailconfiguration id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.maildb_emailconfiguration ALTER COLUMN id SET DEFAULT nextval('public.maildb_emailconfiguration_id_seq'::regclass);


--
-- TOC entry 3423 (class 2604 OID 22325)
-- Name: news_feed id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.news_feed ALTER COLUMN id SET DEFAULT nextval('public.news_feed_id_seq'::regclass);


--
-- TOC entry 3424 (class 2604 OID 22326)
-- Name: news_feed_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.news_feed_groups ALTER COLUMN id SET DEFAULT nextval('public.news_feed_groups_id_seq'::regclass);


--
-- TOC entry 3425 (class 2604 OID 22327)
-- Name: otp_email_emaildevice id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_email_emaildevice ALTER COLUMN id SET DEFAULT nextval('public.otp_email_emaildevice_id_seq'::regclass);


--
-- TOC entry 3426 (class 2604 OID 22328)
-- Name: otp_static_staticdevice id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_static_staticdevice ALTER COLUMN id SET DEFAULT nextval('public.otp_static_staticdevice_id_seq'::regclass);


--
-- TOC entry 3427 (class 2604 OID 22329)
-- Name: otp_static_statictoken id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_static_statictoken ALTER COLUMN id SET DEFAULT nextval('public.otp_static_statictoken_id_seq'::regclass);


--
-- TOC entry 3428 (class 2604 OID 22330)
-- Name: otp_totp_totpdevice id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_totp_totpdevice ALTER COLUMN id SET DEFAULT nextval('public.otp_totp_totpdevice_id_seq'::regclass);


--
-- TOC entry 3429 (class 2604 OID 22331)
-- Name: two_factor_phonedevice id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.two_factor_phonedevice ALTER COLUMN id SET DEFAULT nextval('public.two_factor_phonedevice_id_seq'::regclass);


--
-- TOC entry 3430 (class 2604 OID 22332)
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 3431 (class 2604 OID 22333)
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- TOC entry 3432 (class 2604 OID 22334)
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- TOC entry 3433 (class 2604 OID 22335)
-- Name: users_usergroup id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_usergroup ALTER COLUMN id SET DEFAULT nextval('public.users_usergroup_id_seq'::regclass);


--
-- TOC entry 3434 (class 2604 OID 22336)
-- Name: vouchers_package id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_package ALTER COLUMN id SET DEFAULT nextval('public.vouchers_package_id_seq'::regclass);


--
-- TOC entry 3435 (class 2604 OID 22337)
-- Name: vouchers_package_groups id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_package_groups ALTER COLUMN id SET DEFAULT nextval('public.vouchers_package_group_id_seq'::regclass);


--
-- TOC entry 3436 (class 2604 OID 22338)
-- Name: vouchers_server id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_server ALTER COLUMN id SET DEFAULT nextval('public.vouchers_server_id_seq'::regclass);


--
-- TOC entry 3437 (class 2604 OID 22339)
-- Name: vouchers_servergroup id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_servergroup ALTER COLUMN id SET DEFAULT nextval('public.vouchers_servergroup_id_seq'::regclass);


--
-- TOC entry 3438 (class 2604 OID 22340)
-- Name: vouchers_servergroup_client_group id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_servergroup_client_group ALTER COLUMN id SET DEFAULT nextval('public.vouchers_servergroup_client_group_id_seq'::regclass);


--
-- TOC entry 3439 (class 2604 OID 22341)
-- Name: vouchers_voucher id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_voucher ALTER COLUMN id SET DEFAULT nextval('public.vouchers_voucher_id_seq'::regclass);


--
-- TOC entry 3813 (class 0 OID 22092)
-- Dependencies: 215
-- Data for Name: auditlog_logentry; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auditlog_logentry (id, object_pk, object_id, object_repr, action, changes, "timestamp", actor_id, content_type_id, remote_addr, additional_data) FROM stdin;
1	1	1	rd-1	0	{"enabled": ["None", "True"], "realm_id": ["None", "1"], "endpoint": ["None", "http://172.16.17.88/cake3/rd_cake"], "username": ["None", "45"], "accesshash": ["None", "http://192.168.1.1:8002/index.php?zone=hercules&redirurl=https://skyline.net.id"], "created_at": ["None", "2023-03-13 04:15:21.430324"], "id": ["None", "1"], "updated_at": ["None", "2023-03-13 04:15:21.430341"], "name": ["None", "rd-1"], "password": ["None", "b4c6ac81-8c7c-4802-b50a-0a6380555b50"], "portal_url": ["None", "http://192.168.1.1:8002"]}	2023-03-13 04:15:21.457657+00	1	10	103.44.149.62	\N
2	1	1	77 7 Jam	0	{"ext_id": ["None", "53"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "price": ["None", "0"], "server": ["None", "rd-1"], "name": ["None", "77 7 Jam"], "is_fixed_rate": ["None", "False"], "extra_values": ["None", "{\\"id\\": 53, \\"name\\": \\"77 7 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 52, \\"username\\": \\"77 7 Jam\\", \\"groupname\\": \\"SimpleAdd_53\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "id": ["None", "1"]}	2023-03-13 04:15:26.411384+00	1	9	103.44.149.62	\N
3	2	2	AKU 5 Jam	0	{"ext_id": ["None", "49"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "price": ["None", "0"], "server": ["None", "rd-1"], "name": ["None", "AKU 5 Jam"], "is_fixed_rate": ["None", "False"], "extra_values": ["None", "{\\"id\\": 49, \\"name\\": \\"AKU 5 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 48, \\"username\\": \\"AKU 5 Jam\\", \\"groupname\\": \\"SimpleAdd_49\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "id": ["None", "2"]}	2023-03-13 04:15:26.438568+00	1	9	103.44.149.62	\N
4	3	3	berapa 1 Jam	0	{"ext_id": ["None", "50"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "price": ["None", "0"], "server": ["None", "rd-1"], "name": ["None", "berapa 1 Jam"], "is_fixed_rate": ["None", "False"], "extra_values": ["None", "{\\"id\\": 50, \\"name\\": \\"berapa 1 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 49, \\"username\\": \\"berapa 1 Jam\\", \\"groupname\\": \\"SimpleAdd_50\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "id": ["None", "3"]}	2023-03-13 04:15:26.472549+00	1	9	103.44.149.62	\N
5	4	4	FAST	0	{"ext_id": ["None", "54"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "price": ["None", "0"], "server": ["None", "rd-1"], "name": ["None", "FAST"], "is_fixed_rate": ["None", "False"], "extra_values": ["None", "{\\"id\\": 54, \\"name\\": \\"FAST\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 53, \\"username\\": \\"FAST\\", \\"groupname\\": \\"SimpleAdd_54\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": false, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "id": ["None", "4"]}	2023-03-13 04:15:26.497347+00	1	9	103.44.149.62	\N
6	5	5	poiuyt 1 Jam	0	{"ext_id": ["None", "51"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "price": ["None", "0"], "server": ["None", "rd-1"], "name": ["None", "poiuyt 1 Jam"], "is_fixed_rate": ["None", "False"], "extra_values": ["None", "{\\"id\\": 51, \\"name\\": \\"poiuyt 1 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 50, \\"username\\": \\"poiuyt 1 Jam\\", \\"groupname\\": \\"SimpleAdd_51\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "id": ["None", "5"]}	2023-03-13 04:15:26.52941+00	1	9	103.44.149.62	\N
7	6	6	RD-1 4 Jam	0	{"ext_id": ["None", "52"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "price": ["None", "0"], "server": ["None", "rd-1"], "name": ["None", "RD-1 4 Jam"], "is_fixed_rate": ["None", "False"], "extra_values": ["None", "{\\"id\\": 52, \\"name\\": \\"RD-1 4 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 51, \\"username\\": \\"RD-1 4 Jam\\", \\"groupname\\": \\"SimpleAdd_52\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "id": ["None", "6"]}	2023-03-13 04:15:26.556569+00	1	9	103.44.149.62	\N
8	7	7	satu 1 Jam	0	{"ext_id": ["None", "48"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "price": ["None", "0"], "server": ["None", "rd-1"], "name": ["None", "satu 1 Jam"], "is_fixed_rate": ["None", "False"], "extra_values": ["None", "{\\"id\\": 48, \\"name\\": \\"satu 1 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 47, \\"username\\": \\"satu 1 Jam\\", \\"groupname\\": \\"SimpleAdd_48\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "id": ["None", "7"]}	2023-03-13 04:15:26.58969+00	1	9	103.44.149.62	\N
9	8	8	Satu 7 Jam	0	{"ext_id": ["None", "47"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "price": ["None", "0"], "server": ["None", "rd-1"], "name": ["None", "Satu 7 Jam"], "is_fixed_rate": ["None", "False"], "extra_values": ["None", "{\\"id\\": 47, \\"name\\": \\"Satu 7 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 46, \\"username\\": \\"Satu 7 Jam\\", \\"groupname\\": \\"SimpleAdd_47\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "id": ["None", "8"]}	2023-03-13 04:15:26.620308+00	1	9	103.44.149.62	\N
10	9	9	SKY 1 Jam	0	{"ext_id": ["None", "55"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "price": ["None", "0"], "server": ["None", "rd-1"], "name": ["None", "SKY 1 Jam"], "is_fixed_rate": ["None", "False"], "extra_values": ["None", "{\\"id\\": 55, \\"name\\": \\"SKY 1 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 54, \\"username\\": \\"SKY 1 Jam\\", \\"groupname\\": \\"SimpleAdd_55\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "id": ["None", "9"]}	2023-03-13 04:15:26.644174+00	1	9	103.44.149.62	\N
84	1	1	Invoice #1 status: Belum dibayar	1	{"status": ["1", "0"]}	2024-02-28 02:56:01.121242+00	1	15	127.0.0.1	\N
114	14	14	Invoice #2 item: Paket 3 Jam - FO0YU8	0	{"item_price": ["None", "5000"], "item_name": ["None", "Paket 3 Jam - FO0YU8"], "item_tax": ["None", "0"], "item_quantity": ["None", "1"], "id": ["None", "14"], "invoice": ["None", "Invoice #2"], "item_total_price": ["None", "5000"]}	2024-02-28 04:31:05.58198+00	1	17	127.0.0.1	\N
11	10	10	SKY 2 Jam	0	{"ext_id": ["None", "56"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "price": ["None", "0"], "server": ["None", "rd-1"], "name": ["None", "SKY 2 Jam"], "is_fixed_rate": ["None", "False"], "extra_values": ["None", "{\\"id\\": 56, \\"name\\": \\"SKY 2 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 55, \\"username\\": \\"SKY 2 Jam\\", \\"groupname\\": \\"SimpleAdd_56\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "id": ["None", "10"]}	2023-03-13 04:15:26.673236+00	1	9	103.44.149.62	\N
12	1	1	SUMEDANG	0	{"server": ["None", "rd-1"], "client_group": ["None", "SUMEDANG"], "created_at": ["None", "2023-03-13 04:16:19.310498"], "name": ["None", "SUMEDANG"], "updated_at": ["None", "2023-03-13 04:16:19.310515"], "id": ["None", "1"]}	2023-03-13 04:16:19.332979+00	1	12	103.44.149.62	\N
13	1	1	77 7 Jam	1	{"percentage_commision": ["0.00", "20"], "price": ["0.00", "5000"], "commision": ["0.00", "1000"], "is_enabled": ["False", "True"]}	2023-03-13 04:18:24.088035+00	1	9	103.44.149.62	\N
14	1	1	rashtrouble	0	{"extra_fields": ["None", "{\\"id\\": 629, \\"name\\": \\"rashtrouble\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:18:39\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"77 7 Jam\\", \\"profile_id\\": 53, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "77 7 Jam"], "password": ["None", "rashtrouble"], "ext_id": ["None", "629"], "id": ["None", "1"], "created_at": ["None", "2023-03-13 04:18:39.601882"], "updated_at": ["None", "2023-03-13 04:18:39.601896"], "owner": ["None", "marchel@skyline.net.id"], "status": ["None", "0"], "name": ["None", "rashtrouble"]}	2023-03-13 04:18:39.628496+00	2	11	103.44.149.62	\N
15	2	2	safefeeling	0	{"extra_fields": ["None", "{\\"id\\": 630, \\"name\\": \\"safefeeling\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:18:39\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"77 7 Jam\\", \\"profile_id\\": 53, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "77 7 Jam"], "password": ["None", "safefeeling"], "ext_id": ["None", "630"], "id": ["None", "2"], "created_at": ["None", "2023-03-13 04:18:39.634791"], "updated_at": ["None", "2023-03-13 04:18:39.634806"], "owner": ["None", "marchel@skyline.net.id"], "status": ["None", "0"], "name": ["None", "safefeeling"]}	2023-03-13 04:18:39.652867+00	2	11	103.44.149.62	\N
16	10	10	SKY 2 Jam	1	{"percentage_commision": ["0.00", "5"], "price": ["0.00", "5000"], "commision": ["0.00", "250"], "is_enabled": ["False", "True"]}	2023-03-13 04:19:29.649615+00	1	9	103.44.149.62	\N
17	3	3	harsherror	0	{"extra_fields": ["None", "{\\"id\\": 631, \\"name\\": \\"harsherror\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "harsherror"], "ext_id": ["None", "631"], "id": ["None", "3"], "created_at": ["None", "2023-03-13 04:19:42.454955"], "updated_at": ["None", "2023-03-13 04:19:42.454969"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "harsherror"]}	2023-03-13 04:19:42.486891+00	1	11	103.44.149.62	\N
18	4	4	lastturn	0	{"extra_fields": ["None", "{\\"id\\": 632, \\"name\\": \\"lastturn\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "lastturn"], "ext_id": ["None", "632"], "id": ["None", "4"], "created_at": ["None", "2023-03-13 04:19:42.494007"], "updated_at": ["None", "2023-03-13 04:19:42.494022"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "lastturn"]}	2023-03-13 04:19:42.519778+00	1	11	103.44.149.62	\N
19	5	5	meanfinger	0	{"extra_fields": ["None", "{\\"id\\": 633, \\"name\\": \\"meanfinger\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "meanfinger"], "ext_id": ["None", "633"], "id": ["None", "5"], "created_at": ["None", "2023-03-13 04:19:42.525262"], "updated_at": ["None", "2023-03-13 04:19:42.525276"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "meanfinger"]}	2023-03-13 04:19:42.548082+00	1	11	103.44.149.62	\N
20	6	6	chillysnow	0	{"extra_fields": ["None", "{\\"id\\": 634, \\"name\\": \\"chillysnow\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "chillysnow"], "ext_id": ["None", "634"], "id": ["None", "6"], "created_at": ["None", "2023-03-13 04:19:42.554097"], "updated_at": ["None", "2023-03-13 04:19:42.554111"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "chillysnow"]}	2023-03-13 04:19:42.584327+00	1	11	103.44.149.62	\N
21	7	7	uniformcrow	0	{"extra_fields": ["None", "{\\"id\\": 635, \\"name\\": \\"uniformcrow\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "uniformcrow"], "ext_id": ["None", "635"], "id": ["None", "7"], "created_at": ["None", "2023-03-13 04:19:42.590999"], "updated_at": ["None", "2023-03-13 04:19:42.591014"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "uniformcrow"]}	2023-03-13 04:19:42.61658+00	1	11	103.44.149.62	\N
22	8	8	pettytent	0	{"extra_fields": ["None", "{\\"id\\": 636, \\"name\\": \\"pettytent\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "pettytent"], "ext_id": ["None", "636"], "id": ["None", "8"], "created_at": ["None", "2023-03-13 04:19:42.622202"], "updated_at": ["None", "2023-03-13 04:19:42.622216"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "pettytent"]}	2023-03-13 04:19:42.646148+00	1	11	103.44.149.62	\N
23	9	9	fickleday	0	{"extra_fields": ["None", "{\\"id\\": 637, \\"name\\": \\"fickleday\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "fickleday"], "ext_id": ["None", "637"], "id": ["None", "9"], "created_at": ["None", "2023-03-13 04:19:42.651727"], "updated_at": ["None", "2023-03-13 04:19:42.651743"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "fickleday"]}	2023-03-13 04:19:42.679741+00	1	11	103.44.149.62	\N
24	10	10	betterpart	0	{"extra_fields": ["None", "{\\"id\\": 638, \\"name\\": \\"betterpart\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "betterpart"], "ext_id": ["None", "638"], "id": ["None", "10"], "created_at": ["None", "2023-03-13 04:19:42.686882"], "updated_at": ["None", "2023-03-13 04:19:42.686902"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "betterpart"]}	2023-03-13 04:19:42.711072+00	1	11	103.44.149.62	\N
25	11	11	wavyend	0	{"extra_fields": ["None", "{\\"id\\": 639, \\"name\\": \\"wavyend\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "wavyend"], "ext_id": ["None", "639"], "id": ["None", "11"], "created_at": ["None", "2023-03-13 04:19:42.716417"], "updated_at": ["None", "2023-03-13 04:19:42.716434"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "wavyend"]}	2023-03-13 04:19:42.742359+00	1	11	103.44.149.62	\N
26	12	12	teamdress	0	{"extra_fields": ["None", "{\\"id\\": 640, \\"name\\": \\"teamdress\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "teamdress"], "ext_id": ["None", "640"], "id": ["None", "12"], "created_at": ["None", "2023-03-13 04:19:42.747181"], "updated_at": ["None", "2023-03-13 04:19:42.747196"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "teamdress"]}	2023-03-13 04:19:42.775304+00	1	11	103.44.149.62	\N
27	13	13	ablewaves	0	{"extra_fields": ["None", "{\\"id\\": 641, \\"name\\": \\"ablewaves\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "ablewaves"], "ext_id": ["None", "641"], "id": ["None", "13"], "created_at": ["None", "2023-03-13 04:19:42.781276"], "updated_at": ["None", "2023-03-13 04:19:42.781291"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "ablewaves"]}	2023-03-13 04:19:42.813755+00	1	11	103.44.149.62	\N
28	14	14	usefulpurpose	0	{"extra_fields": ["None", "{\\"id\\": 642, \\"name\\": \\"usefulpurpose\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "usefulpurpose"], "ext_id": ["None", "642"], "id": ["None", "14"], "created_at": ["None", "2023-03-13 04:19:42.818939"], "updated_at": ["None", "2023-03-13 04:19:42.818955"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "usefulpurpose"]}	2023-03-13 04:19:42.841938+00	1	11	103.44.149.62	\N
29	15	15	nauticaltent	0	{"extra_fields": ["None", "{\\"id\\": 643, \\"name\\": \\"nauticaltent\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "nauticaltent"], "ext_id": ["None", "643"], "id": ["None", "15"], "created_at": ["None", "2023-03-13 04:19:42.848200"], "updated_at": ["None", "2023-03-13 04:19:42.848214"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "nauticaltent"]}	2023-03-13 04:19:42.876612+00	1	11	103.44.149.62	\N
30	16	16	carefulerror	0	{"extra_fields": ["None", "{\\"id\\": 644, \\"name\\": \\"carefulerror\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "carefulerror"], "ext_id": ["None", "644"], "id": ["None", "16"], "created_at": ["None", "2023-03-13 04:19:42.882443"], "updated_at": ["None", "2023-03-13 04:19:42.882458"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "carefulerror"]}	2023-03-13 04:19:42.907786+00	1	11	103.44.149.62	\N
31	17	17	fantasticsize	0	{"extra_fields": ["None", "{\\"id\\": 645, \\"name\\": \\"fantasticsize\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "fantasticsize"], "ext_id": ["None", "645"], "id": ["None", "17"], "created_at": ["None", "2023-03-13 04:19:42.916083"], "updated_at": ["None", "2023-03-13 04:19:42.916096"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "fantasticsize"]}	2023-03-13 04:19:42.941021+00	1	11	103.44.149.62	\N
32	18	18	badvan	0	{"extra_fields": ["None", "{\\"id\\": 646, \\"name\\": \\"badvan\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "badvan"], "ext_id": ["None", "646"], "id": ["None", "18"], "created_at": ["None", "2023-03-13 04:19:42.946540"], "updated_at": ["None", "2023-03-13 04:19:42.946553"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "badvan"]}	2023-03-13 04:19:42.975707+00	1	11	103.44.149.62	\N
33	19	19	speedknee	0	{"extra_fields": ["None", "{\\"id\\": 647, \\"name\\": \\"speedknee\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "speedknee"], "ext_id": ["None", "647"], "id": ["None", "19"], "created_at": ["None", "2023-03-13 04:19:42.980142"], "updated_at": ["None", "2023-03-13 04:19:42.980154"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "speedknee"]}	2023-03-13 04:19:42.999393+00	1	11	103.44.149.62	\N
34	20	20	uniformself	0	{"extra_fields": ["None", "{\\"id\\": 648, \\"name\\": \\"uniformself\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "uniformself"], "ext_id": ["None", "648"], "id": ["None", "20"], "created_at": ["None", "2023-03-13 04:19:43.005041"], "updated_at": ["None", "2023-03-13 04:19:43.005053"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "uniformself"]}	2023-03-13 04:19:43.02814+00	1	11	103.44.149.62	\N
35	21	21	elegantnumber	0	{"extra_fields": ["None", "{\\"id\\": 649, \\"name\\": \\"elegantnumber\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "elegantnumber"], "ext_id": ["None", "649"], "id": ["None", "21"], "created_at": ["None", "2023-03-13 04:19:43.033079"], "updated_at": ["None", "2023-03-13 04:19:43.033093"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "elegantnumber"]}	2023-03-13 04:19:43.057072+00	1	11	103.44.149.62	\N
36	22	22	shinyunit	0	{"extra_fields": ["None", "{\\"id\\": 650, \\"name\\": \\"shinyunit\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "SKY 2 Jam"], "password": ["None", "shinyunit"], "ext_id": ["None", "650"], "id": ["None", "22"], "created_at": ["None", "2023-03-13 04:19:43.061794"], "updated_at": ["None", "2023-03-13 04:19:43.061824"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "name": ["None", "shinyunit"]}	2023-03-13 04:19:43.091836+00	1	11	103.44.149.62	\N
37	11	11	Bekerja 18 Jam	0	{"is_enabled": ["None", "False"], "price": ["None", "0"], "server": ["None", "rd-1"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "extra_values": ["None", "{\\"id\\": 57, \\"name\\": \\"Bekerja 18 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 56, \\"username\\": \\"Bekerja 18 Jam\\", \\"groupname\\": \\"SimpleAdd_57\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "name": ["None", "Bekerja 18 Jam"], "ext_id": ["None", "57"], "is_fixed_rate": ["None", "False"], "id": ["None", "11"]}	2024-02-28 02:37:46.470108+00	1	9	127.0.0.1	\N
38	12	12	SKY 3 Jam	0	{"is_enabled": ["None", "False"], "price": ["None", "0"], "server": ["None", "rd-1"], "percentage_commision": ["None", "0"], "is_synced": ["None", "True"], "extra_values": ["None", "{\\"id\\": 58, \\"name\\": \\"SKY 3 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 57, \\"username\\": \\"SKY 3 Jam\\", \\"groupname\\": \\"SimpleAdd_58\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "name": ["None", "SKY 3 Jam"], "ext_id": ["None", "58"], "is_fixed_rate": ["None", "False"], "id": ["None", "12"]}	2024-02-28 02:37:46.516053+00	1	9	127.0.0.1	\N
39	1	1	77 7 Jam	2	{"is_enabled": ["True", "None"], "price": ["5000.00", "None"], "server": ["rd-1", "None"], "percentage_commision": ["20.00", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 53, \\"name\\": \\"77 7 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 52, \\"username\\": \\"77 7 Jam\\", \\"groupname\\": \\"SimpleAdd_53\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "commision": ["1000.00", "None"], "name": ["77 7 Jam", "None"], "ext_id": ["53", "None"], "is_fixed_rate": ["False", "None"], "id": ["1", "None"]}	2024-02-28 02:37:57.02954+00	1	9	127.0.0.1	\N
40	2	2	safefeeling	2	{"ext_id": ["630", "None"], "extra_fields": ["{\\"id\\": 630, \\"name\\": \\"safefeeling\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:18:39\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"77 7 Jam\\", \\"profile_id\\": 53, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"], "name": ["safefeeling", "None"], "password": ["safefeeling", "None"], "package": ["None", "None"], "updated_at": ["2023-03-13 04:18:39.634806", "None"], "id": ["2", "None"], "created_at": ["2023-03-13 04:18:39.634791", "None"], "owner": ["marchel@skyline.net.id", "None"], "status": ["0", "None"]}	2024-02-28 02:37:57.035821+00	1	11	127.0.0.1	\N
41	1	1	rashtrouble	2	{"ext_id": ["629", "None"], "extra_fields": ["{\\"id\\": 629, \\"name\\": \\"rashtrouble\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:18:39\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"77 7 Jam\\", \\"profile_id\\": 53, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"], "name": ["rashtrouble", "None"], "password": ["rashtrouble", "None"], "package": ["None", "None"], "updated_at": ["2023-03-13 04:18:39.601896", "None"], "id": ["1", "None"], "created_at": ["2023-03-13 04:18:39.601882", "None"], "owner": ["marchel@skyline.net.id", "None"], "status": ["0", "None"]}	2024-02-28 02:37:57.038855+00	1	11	127.0.0.1	\N
42	2	2	AKU 5 Jam	2	{"price": ["0.00", "None"], "ext_id": ["49", "None"], "commision": ["0.00", "None"], "percentage_commision": ["0.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 49, \\"name\\": \\"AKU 5 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 48, \\"username\\": \\"AKU 5 Jam\\", \\"groupname\\": \\"SimpleAdd_49\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["2", "None"], "server": ["rd-1", "None"], "name": ["AKU 5 Jam", "None"], "is_enabled": ["False", "None"]}	2024-02-28 02:39:06.29538+00	1	9	127.0.0.1	\N
43	11	11	Bekerja 18 Jam	2	{"price": ["0.00", "None"], "ext_id": ["57", "None"], "commision": ["0.00", "None"], "percentage_commision": ["0.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 57, \\"name\\": \\"Bekerja 18 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 56, \\"username\\": \\"Bekerja 18 Jam\\", \\"groupname\\": \\"SimpleAdd_57\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["11", "None"], "server": ["rd-1", "None"], "name": ["Bekerja 18 Jam", "None"], "is_enabled": ["False", "None"]}	2024-02-28 02:40:28.956553+00	1	9	127.0.0.1	\N
44	10	10	SKY 2 Jam	2	{"price": ["5000.00", "None"], "ext_id": ["56", "None"], "commision": ["250.00", "None"], "percentage_commision": ["5.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 56, \\"name\\": \\"SKY 2 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 55, \\"username\\": \\"SKY 2 Jam\\", \\"groupname\\": \\"SimpleAdd_56\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["10", "None"], "server": ["rd-1", "None"], "name": ["SKY 2 Jam", "None"], "is_enabled": ["True", "None"]}	2024-02-28 02:40:34.266081+00	1	9	127.0.0.1	\N
112	13	13	Invoice #2 item: Paket 3 Jam - KR1T63	0	{"item_price": ["None", "5000"], "item_name": ["None", "Paket 3 Jam - KR1T63"], "item_tax": ["None", "0"], "item_quantity": ["None", "1"], "id": ["None", "13"], "invoice": ["None", "Invoice #2"], "item_total_price": ["None", "5000"]}	2024-02-28 04:31:05.57187+00	1	17	127.0.0.1	\N
45	22	22	shinyunit	2	{"ext_id": ["650", "None"], "created_at": ["2023-03-13 04:19:43.061794", "None"], "updated_at": ["2023-03-13 04:19:43.061824", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["22", "None"], "status": ["0", "None"], "name": ["shinyunit", "None"], "package": ["None", "None"], "password": ["shinyunit", "None"], "extra_fields": ["{\\"id\\": 650, \\"name\\": \\"shinyunit\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.271926+00	1	11	127.0.0.1	\N
46	21	21	elegantnumber	2	{"ext_id": ["649", "None"], "created_at": ["2023-03-13 04:19:43.033079", "None"], "updated_at": ["2023-03-13 04:19:43.033093", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["21", "None"], "status": ["0", "None"], "name": ["elegantnumber", "None"], "package": ["None", "None"], "password": ["elegantnumber", "None"], "extra_fields": ["{\\"id\\": 649, \\"name\\": \\"elegantnumber\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.275321+00	1	11	127.0.0.1	\N
47	20	20	uniformself	2	{"ext_id": ["648", "None"], "created_at": ["2023-03-13 04:19:43.005041", "None"], "updated_at": ["2023-03-13 04:19:43.005053", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["20", "None"], "status": ["0", "None"], "name": ["uniformself", "None"], "package": ["None", "None"], "password": ["uniformself", "None"], "extra_fields": ["{\\"id\\": 648, \\"name\\": \\"uniformself\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.278186+00	1	11	127.0.0.1	\N
48	19	19	speedknee	2	{"ext_id": ["647", "None"], "created_at": ["2023-03-13 04:19:42.980142", "None"], "updated_at": ["2023-03-13 04:19:42.980154", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["19", "None"], "status": ["0", "None"], "name": ["speedknee", "None"], "package": ["None", "None"], "password": ["speedknee", "None"], "extra_fields": ["{\\"id\\": 647, \\"name\\": \\"speedknee\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.281008+00	1	11	127.0.0.1	\N
49	18	18	badvan	2	{"ext_id": ["646", "None"], "created_at": ["2023-03-13 04:19:42.946540", "None"], "updated_at": ["2023-03-13 04:19:42.946553", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["18", "None"], "status": ["0", "None"], "name": ["badvan", "None"], "package": ["None", "None"], "password": ["badvan", "None"], "extra_fields": ["{\\"id\\": 646, \\"name\\": \\"badvan\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.283797+00	1	11	127.0.0.1	\N
50	17	17	fantasticsize	2	{"ext_id": ["645", "None"], "created_at": ["2023-03-13 04:19:42.916083", "None"], "updated_at": ["2023-03-13 04:19:42.916096", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["17", "None"], "status": ["0", "None"], "name": ["fantasticsize", "None"], "package": ["None", "None"], "password": ["fantasticsize", "None"], "extra_fields": ["{\\"id\\": 645, \\"name\\": \\"fantasticsize\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.286608+00	1	11	127.0.0.1	\N
51	16	16	carefulerror	2	{"ext_id": ["644", "None"], "created_at": ["2023-03-13 04:19:42.882443", "None"], "updated_at": ["2023-03-13 04:19:42.882458", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["16", "None"], "status": ["0", "None"], "name": ["carefulerror", "None"], "package": ["None", "None"], "password": ["carefulerror", "None"], "extra_fields": ["{\\"id\\": 644, \\"name\\": \\"carefulerror\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.289399+00	1	11	127.0.0.1	\N
52	15	15	nauticaltent	2	{"ext_id": ["643", "None"], "created_at": ["2023-03-13 04:19:42.848200", "None"], "updated_at": ["2023-03-13 04:19:42.848214", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["15", "None"], "status": ["0", "None"], "name": ["nauticaltent", "None"], "package": ["None", "None"], "password": ["nauticaltent", "None"], "extra_fields": ["{\\"id\\": 643, \\"name\\": \\"nauticaltent\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.292212+00	1	11	127.0.0.1	\N
53	14	14	usefulpurpose	2	{"ext_id": ["642", "None"], "created_at": ["2023-03-13 04:19:42.818939", "None"], "updated_at": ["2023-03-13 04:19:42.818955", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["14", "None"], "status": ["0", "None"], "name": ["usefulpurpose", "None"], "package": ["None", "None"], "password": ["usefulpurpose", "None"], "extra_fields": ["{\\"id\\": 642, \\"name\\": \\"usefulpurpose\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.295039+00	1	11	127.0.0.1	\N
54	13	13	ablewaves	2	{"ext_id": ["641", "None"], "created_at": ["2023-03-13 04:19:42.781276", "None"], "updated_at": ["2023-03-13 04:19:42.781291", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["13", "None"], "status": ["0", "None"], "name": ["ablewaves", "None"], "package": ["None", "None"], "password": ["ablewaves", "None"], "extra_fields": ["{\\"id\\": 641, \\"name\\": \\"ablewaves\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.297946+00	1	11	127.0.0.1	\N
55	12	12	teamdress	2	{"ext_id": ["640", "None"], "created_at": ["2023-03-13 04:19:42.747181", "None"], "updated_at": ["2023-03-13 04:19:42.747196", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["12", "None"], "status": ["0", "None"], "name": ["teamdress", "None"], "package": ["None", "None"], "password": ["teamdress", "None"], "extra_fields": ["{\\"id\\": 640, \\"name\\": \\"teamdress\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.300802+00	1	11	127.0.0.1	\N
157	49	49	9WVZAB	1	{"status": ["0", "1"]}	2024-08-19 07:33:45.939724+00	3	11	127.0.0.1	\N
56	11	11	wavyend	2	{"ext_id": ["639", "None"], "created_at": ["2023-03-13 04:19:42.716417", "None"], "updated_at": ["2023-03-13 04:19:42.716434", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["11", "None"], "status": ["0", "None"], "name": ["wavyend", "None"], "package": ["None", "None"], "password": ["wavyend", "None"], "extra_fields": ["{\\"id\\": 639, \\"name\\": \\"wavyend\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.304056+00	1	11	127.0.0.1	\N
57	10	10	betterpart	2	{"ext_id": ["638", "None"], "created_at": ["2023-03-13 04:19:42.686882", "None"], "updated_at": ["2023-03-13 04:19:42.686902", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["10", "None"], "status": ["0", "None"], "name": ["betterpart", "None"], "package": ["None", "None"], "password": ["betterpart", "None"], "extra_fields": ["{\\"id\\": 638, \\"name\\": \\"betterpart\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.306904+00	1	11	127.0.0.1	\N
58	9	9	fickleday	2	{"ext_id": ["637", "None"], "created_at": ["2023-03-13 04:19:42.651727", "None"], "updated_at": ["2023-03-13 04:19:42.651743", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["9", "None"], "status": ["0", "None"], "name": ["fickleday", "None"], "package": ["None", "None"], "password": ["fickleday", "None"], "extra_fields": ["{\\"id\\": 637, \\"name\\": \\"fickleday\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.30974+00	1	11	127.0.0.1	\N
59	8	8	pettytent	2	{"ext_id": ["636", "None"], "created_at": ["2023-03-13 04:19:42.622202", "None"], "updated_at": ["2023-03-13 04:19:42.622216", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["8", "None"], "status": ["0", "None"], "name": ["pettytent", "None"], "package": ["None", "None"], "password": ["pettytent", "None"], "extra_fields": ["{\\"id\\": 636, \\"name\\": \\"pettytent\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.312576+00	1	11	127.0.0.1	\N
60	7	7	uniformcrow	2	{"ext_id": ["635", "None"], "created_at": ["2023-03-13 04:19:42.590999", "None"], "updated_at": ["2023-03-13 04:19:42.591014", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["7", "None"], "status": ["0", "None"], "name": ["uniformcrow", "None"], "package": ["None", "None"], "password": ["uniformcrow", "None"], "extra_fields": ["{\\"id\\": 635, \\"name\\": \\"uniformcrow\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.315352+00	1	11	127.0.0.1	\N
61	6	6	chillysnow	2	{"ext_id": ["634", "None"], "created_at": ["2023-03-13 04:19:42.554097", "None"], "updated_at": ["2023-03-13 04:19:42.554111", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["6", "None"], "status": ["0", "None"], "name": ["chillysnow", "None"], "package": ["None", "None"], "password": ["chillysnow", "None"], "extra_fields": ["{\\"id\\": 634, \\"name\\": \\"chillysnow\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.31815+00	1	11	127.0.0.1	\N
62	5	5	meanfinger	2	{"ext_id": ["633", "None"], "created_at": ["2023-03-13 04:19:42.525262", "None"], "updated_at": ["2023-03-13 04:19:42.525276", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["5", "None"], "status": ["0", "None"], "name": ["meanfinger", "None"], "package": ["None", "None"], "password": ["meanfinger", "None"], "extra_fields": ["{\\"id\\": 633, \\"name\\": \\"meanfinger\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.321105+00	1	11	127.0.0.1	\N
63	4	4	lastturn	2	{"ext_id": ["632", "None"], "created_at": ["2023-03-13 04:19:42.494007", "None"], "updated_at": ["2023-03-13 04:19:42.494022", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["4", "None"], "status": ["0", "None"], "name": ["lastturn", "None"], "package": ["None", "None"], "password": ["lastturn", "None"], "extra_fields": ["{\\"id\\": 632, \\"name\\": \\"lastturn\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.323741+00	1	11	127.0.0.1	\N
64	3	3	harsherror	2	{"ext_id": ["631", "None"], "created_at": ["2023-03-13 04:19:42.454955", "None"], "updated_at": ["2023-03-13 04:19:42.454969", "None"], "owner": ["marchel@sti-group.co.id", "None"], "id": ["3", "None"], "status": ["0", "None"], "name": ["harsherror", "None"], "package": ["None", "None"], "password": ["harsherror", "None"], "extra_fields": ["{\\"id\\": 631, \\"name\\": \\"harsherror\\", \\"batch\\": null, \\"created\\": \\"2023-03-13 04:19:42\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"SKY 2 Jam\\", \\"profile_id\\": 56, \\"expire\\": null, \\"time_valid\\": \\"\\"}", "None"]}	2024-02-28 02:40:34.326309+00	1	11	127.0.0.1	\N
65	3	3	berapa 1 Jam	2	{"price": ["0.00", "None"], "ext_id": ["50", "None"], "commision": ["0.00", "None"], "percentage_commision": ["0.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 50, \\"name\\": \\"berapa 1 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 49, \\"username\\": \\"berapa 1 Jam\\", \\"groupname\\": \\"SimpleAdd_50\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["3", "None"], "server": ["rd-1", "None"], "name": ["berapa 1 Jam", "None"], "is_enabled": ["False", "None"]}	2024-02-28 02:40:40.567843+00	1	9	127.0.0.1	\N
66	4	4	FAST	2	{"price": ["0.00", "None"], "ext_id": ["54", "None"], "commision": ["0.00", "None"], "percentage_commision": ["0.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 54, \\"name\\": \\"FAST\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 53, \\"username\\": \\"FAST\\", \\"groupname\\": \\"SimpleAdd_54\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": false, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["4", "None"], "server": ["rd-1", "None"], "name": ["FAST", "None"], "is_enabled": ["False", "None"]}	2024-02-28 02:40:45.569566+00	1	9	127.0.0.1	\N
67	5	5	poiuyt 1 Jam	2	{"price": ["0.00", "None"], "ext_id": ["51", "None"], "commision": ["0.00", "None"], "percentage_commision": ["0.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 51, \\"name\\": \\"poiuyt 1 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 50, \\"username\\": \\"poiuyt 1 Jam\\", \\"groupname\\": \\"SimpleAdd_51\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["5", "None"], "server": ["rd-1", "None"], "name": ["poiuyt 1 Jam", "None"], "is_enabled": ["False", "None"]}	2024-02-28 02:40:49.017904+00	1	9	127.0.0.1	\N
68	6	6	RD-1 4 Jam	2	{"price": ["0.00", "None"], "ext_id": ["52", "None"], "commision": ["0.00", "None"], "percentage_commision": ["0.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 52, \\"name\\": \\"RD-1 4 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 51, \\"username\\": \\"RD-1 4 Jam\\", \\"groupname\\": \\"SimpleAdd_52\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["6", "None"], "server": ["rd-1", "None"], "name": ["RD-1 4 Jam", "None"], "is_enabled": ["False", "None"]}	2024-02-28 02:40:52.147453+00	1	9	127.0.0.1	\N
69	7	7	satu 1 Jam	2	{"price": ["0.00", "None"], "ext_id": ["48", "None"], "commision": ["0.00", "None"], "percentage_commision": ["0.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 48, \\"name\\": \\"satu 1 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 47, \\"username\\": \\"satu 1 Jam\\", \\"groupname\\": \\"SimpleAdd_48\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["7", "None"], "server": ["rd-1", "None"], "name": ["satu 1 Jam", "None"], "is_enabled": ["False", "None"]}	2024-02-28 02:41:00.752878+00	1	9	127.0.0.1	\N
70	8	8	Satu 7 Jam	2	{"price": ["0.00", "None"], "ext_id": ["47", "None"], "commision": ["0.00", "None"], "percentage_commision": ["0.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 47, \\"name\\": \\"Satu 7 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 46, \\"username\\": \\"Satu 7 Jam\\", \\"groupname\\": \\"SimpleAdd_47\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["8", "None"], "server": ["rd-1", "None"], "name": ["Satu 7 Jam", "None"], "is_enabled": ["False", "None"]}	2024-02-28 02:41:22.624939+00	1	9	127.0.0.1	\N
71	9	9	SKY 1 Jam	2	{"price": ["0.00", "None"], "ext_id": ["55", "None"], "commision": ["0.00", "None"], "percentage_commision": ["0.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 55, \\"name\\": \\"SKY 1 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 54, \\"username\\": \\"SKY 1 Jam\\", \\"groupname\\": \\"SimpleAdd_55\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["9", "None"], "server": ["rd-1", "None"], "name": ["SKY 1 Jam", "None"], "is_enabled": ["False", "None"]}	2024-02-28 02:42:00.104567+00	1	9	127.0.0.1	\N
72	12	12	SKY 3 Jam	2	{"price": ["0.00", "None"], "ext_id": ["58", "None"], "commision": ["0.00", "None"], "percentage_commision": ["0.00", "None"], "is_fixed_rate": ["False", "None"], "is_synced": ["True", "None"], "extra_values": ["{\\"id\\": 58, \\"name\\": \\"SKY 3 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 57, \\"username\\": \\"SKY 3 Jam\\", \\"groupname\\": \\"SimpleAdd_58\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}", "None"], "id": ["12", "None"], "server": ["rd-1", "None"], "name": ["SKY 3 Jam", "None"], "is_enabled": ["False", "None"]}	2024-02-28 02:42:09.599773+00	1	9	127.0.0.1	\N
73	13	13	Paket 3 Jam	0	{"id": ["None", "13"], "server": ["None", "rd-1"], "is_enabled": ["None", "False"], "price": ["None", "5000"], "name": ["None", "Paket 3 Jam"], "commision": ["None", "1100"], "is_fixed_rate": ["None", "False"], "percentage_commision": ["None", "22"], "is_synced": ["None", "False"], "extra_values": ["None", "{}"]}	2024-02-28 02:44:06.313583+00	1	9	127.0.0.1	\N
74	13	13	Paket 3 Jam	1	{"is_enabled": ["False", "True"], "ext_id": ["None", "59"], "is_synced": ["False", "True"], "extra_values": ["{}", "{\\"id\\": 59, \\"name\\": \\"Paket 3 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 58, \\"username\\": \\"Paket 3 Jam\\", \\"groupname\\": \\"SimpleAdd_59\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"]}	2024-02-28 02:44:12.898176+00	1	9	127.0.0.1	\N
75	13	13	Paket 3 Jam	1	{"commision": ["1100", "1150"], "percentage_commision": ["22", "23"]}	2024-02-28 02:44:38.689072+00	1	9	127.0.0.1	\N
76	1	1	Invoice #1	0	{"id": ["None", "1"], "payments": ["None", "invoices.InvoicePayment.None"], "client": ["None", "marchel@skyline.net.id"], "items": ["None", "invoices.InvoiceItem.None"], "notes": ["None", ""], "creation_date": ["None", "2024-02-28"], "due_date": ["None", "2024-02-28"]}	2024-02-28 02:47:39.587436+00	1	13	127.0.0.1	\N
77	1	1	Invoice #1 status: Belum dibayar	0	{"id": ["None", "1"], "update_date": ["None", "2024-02-28 02:47:39.588306"], "status": ["None", "0"], "invoice": ["None", "Invoice #1"]}	2024-02-28 02:47:39.592222+00	1	15	127.0.0.1	\N
78	1	1	Invoice #1 summary	0	{"total_paid": ["None", "0"], "total_refunded": ["None", "0"], "invoice": ["None", "Invoice #1"], "total_price": ["None", "0"], "id": ["None", "1"], "total_due": ["None", "0"]}	2024-02-28 02:47:39.596626+00	1	14	127.0.0.1	\N
79	1	1	Invoice #1 commission	0	{"commission_date": ["None", "2024-02-28 02:47:39.597336"], "commission_notes": ["None", ""], "invoice": ["None", "Invoice #1"], "id": ["None", "1"], "commission_amount": ["None", "0"]}	2024-02-28 02:47:39.601044+00	1	18	127.0.0.1	\N
80	1	1	Invoice #1 summary	1	{"total_paid": ["0.00", "0"], "total_refunded": ["0.00", "0"], "total_price": ["0.00", "0"], "total_due": ["0.00", "0"]}	2024-02-28 02:47:39.603403+00	1	14	127.0.0.1	\N
81	1	1	Invoice #1 item: Data	0	{"item_total_price": ["None", "2000"], "item_quantity": ["None", "1"], "invoice": ["None", "Invoice #1"], "item_name": ["None", "Data"], "item_price": ["None", "2000"], "item_tax": ["None", "0"], "id": ["None", "1"]}	2024-02-28 02:47:39.609286+00	1	17	127.0.0.1	\N
82	1	1	Invoice #1 summary	1	{"total_paid": ["0.00", "0"], "total_refunded": ["0.00", "0"], "total_price": ["0.00", "2000.00"], "total_due": ["0.00", "2000.00"]}	2024-02-28 02:47:39.612682+00	1	14	127.0.0.1	\N
83	1	1	Invoice #1 status: Terbayar	1	{"status": ["0", "1"]}	2024-02-28 02:55:44.702906+00	1	15	127.0.0.1	\N
85	23	23	Z1QN2S	0	{"extra_fields": ["None", "{\\"id\\": 1129, \\"name\\": \\"Z1QN2S\\", \\"batch\\": null, \\"created\\": \\"2024-02-28 03:25:31\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"Paket 3 Jam\\", \\"profile_id\\": 59, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "owner": ["None", "marchel@sti-group.co.id"], "status": ["None", "0"], "ext_id": ["None", "1129"], "id": ["None", "23"], "created_at": ["None", "2024-02-28 03:25:31.515887"], "name": ["None", "Z1QN2S"], "password": ["None", "Z1QN2S"], "package": ["None", "Paket 3 Jam"], "updated_at": ["None", "2024-02-28 03:25:31.515909"]}	2024-02-28 03:25:31.523618+00	1	11	127.0.0.1	\N
86	2	2	Invoice #2	0	{"creation_date": ["None", "2024-02-28"], "payments": ["None", "invoices.InvoicePayment.None"], "items": ["None", "invoices.InvoiceItem.None"], "client": ["None", "marchel@sti-group.co.id"], "id": ["None", "2"], "notes": ["None", ""]}	2024-02-28 04:12:40.295947+00	1	13	127.0.0.1	\N
87	2	2	Invoice #2 status: Belum dibayar	0	{"update_date": ["None", "2024-02-28 04:12:40.299177"], "status": ["None", "0"], "invoice": ["None", "Invoice #2"], "id": ["None", "2"]}	2024-02-28 04:12:40.303233+00	1	15	127.0.0.1	\N
88	2	2	Invoice #2 summary	0	{"invoice": ["None", "Invoice #2"], "total_price": ["None", "0"], "total_due": ["None", "0"], "id": ["None", "2"], "total_refunded": ["None", "0"], "total_paid": ["None", "0"]}	2024-02-28 04:12:40.308343+00	1	14	127.0.0.1	\N
89	2	2	Invoice #2 commission	0	{"commission_date": ["None", "2024-02-28 04:12:40.309462"], "id": ["None", "2"], "commission_notes": ["None", ""], "invoice": ["None", "Invoice #2"], "commission_amount": ["None", "0"]}	2024-02-28 04:12:40.313435+00	1	18	127.0.0.1	\N
90	2	2	Invoice #2 item: N2QJD6 - Paket 3 Jam	0	{"item_price": ["None", "5000"], "item_quantity": ["None", "1"], "invoice": ["None", "Invoice #2"], "item_name": ["None", "N2QJD6 - Paket 3 Jam"], "item_total_price": ["None", "5000"], "id": ["None", "2"], "item_tax": ["None", "0"]}	2024-02-28 04:12:40.322331+00	1	17	127.0.0.1	\N
91	2	2	Invoice #2 summary	1	{"total_price": ["0", "5000"], "total_due": ["0", "5000"]}	2024-02-28 04:12:40.327497+00	1	14	127.0.0.1	\N
92	3	3	Invoice #2 item: KOPBXD - Paket 3 Jam	0	{"item_price": ["None", "5000"], "item_quantity": ["None", "1"], "invoice": ["None", "Invoice #2"], "item_name": ["None", "KOPBXD - Paket 3 Jam"], "item_total_price": ["None", "5000"], "id": ["None", "3"], "item_tax": ["None", "0"]}	2024-02-28 04:13:01.865938+00	1	17	127.0.0.1	\N
93	2	2	Invoice #2 summary	1	{"total_price": ["5000", "10000"], "total_due": ["5000", "10000"]}	2024-02-28 04:13:01.87238+00	1	14	127.0.0.1	\N
94	4	4	Invoice #2 item: EFMAIP - Paket 3 Jam	0	{"item_price": ["None", "5000"], "item_quantity": ["None", "1"], "invoice": ["None", "Invoice #2"], "item_name": ["None", "EFMAIP - Paket 3 Jam"], "item_total_price": ["None", "5000"], "id": ["None", "4"], "item_tax": ["None", "0"]}	2024-02-28 04:13:41.09734+00	1	17	127.0.0.1	\N
95	2	2	Invoice #2 summary	1	{"total_price": ["10000", "15000"], "total_due": ["10000", "15000"]}	2024-02-28 04:13:41.103391+00	1	14	127.0.0.1	\N
96	5	5	Invoice #2 item: RKIOVQ - Paket 3 Jam	0	{"item_price": ["None", "5000"], "item_quantity": ["None", "1"], "invoice": ["None", "Invoice #2"], "item_name": ["None", "RKIOVQ - Paket 3 Jam"], "item_total_price": ["None", "5000"], "id": ["None", "5"], "item_tax": ["None", "0"]}	2024-02-28 04:13:41.109563+00	1	17	127.0.0.1	\N
97	2	2	Invoice #2 summary	1	{"total_price": ["15000", "20000"], "total_due": ["15000", "20000"]}	2024-02-28 04:13:41.113188+00	1	14	127.0.0.1	\N
98	6	6	Invoice #2 item: WIGVHN - Paket 3 Jam	0	{"item_price": ["None", "5000"], "item_quantity": ["None", "1"], "invoice": ["None", "Invoice #2"], "item_name": ["None", "WIGVHN - Paket 3 Jam"], "item_total_price": ["None", "5000"], "id": ["None", "6"], "item_tax": ["None", "0"]}	2024-02-28 04:13:41.119042+00	1	17	127.0.0.1	\N
99	2	2	Invoice #2 summary	1	{"total_price": ["20000", "25000"], "total_due": ["20000", "25000"]}	2024-02-28 04:13:41.124341+00	1	14	127.0.0.1	\N
100	7	7	Invoice #2 item: 9PA56M - Paket 3 Jam	0	{"item_price": ["None", "5000"], "item_quantity": ["None", "1"], "invoice": ["None", "Invoice #2"], "item_name": ["None", "9PA56M - Paket 3 Jam"], "item_total_price": ["None", "5000"], "id": ["None", "7"], "item_tax": ["None", "0"]}	2024-02-28 04:13:41.130817+00	1	17	127.0.0.1	\N
101	2	2	Invoice #2 summary	1	{"total_price": ["25000", "30000"], "total_due": ["25000", "30000"]}	2024-02-28 04:13:41.135181+00	1	14	127.0.0.1	\N
102	8	8	Invoice #2 item: Paket 3 Jam - T0DGKV	0	{"item_price": ["None", "5000"], "item_name": ["None", "Paket 3 Jam - T0DGKV"], "item_tax": ["None", "0"], "item_quantity": ["None", "1"], "id": ["None", "8"], "invoice": ["None", "Invoice #2"], "item_total_price": ["None", "5000"]}	2024-02-28 04:27:28.080251+00	1	17	127.0.0.1	\N
103	2	2	Invoice #2 summary	1	{"total_price": ["30000", "35000"], "total_due": ["30000", "35000"]}	2024-02-28 04:27:28.088136+00	1	14	127.0.0.1	\N
104	9	9	Invoice #2 item: Paket 3 Jam - D9NGM4	0	{"item_price": ["None", "5000"], "item_name": ["None", "Paket 3 Jam - D9NGM4"], "item_tax": ["None", "0"], "item_quantity": ["None", "1"], "id": ["None", "9"], "invoice": ["None", "Invoice #2"], "item_total_price": ["None", "5000"]}	2024-02-28 04:27:28.095011+00	1	17	127.0.0.1	\N
105	2	2	Invoice #2 summary	1	{"total_price": ["35000", "40000"], "total_due": ["35000", "40000"]}	2024-02-28 04:27:28.099002+00	1	14	127.0.0.1	\N
106	10	10	Invoice #2 item: Paket 3 Jam - 9O4RZ2	0	{"item_price": ["None", "5000"], "item_name": ["None", "Paket 3 Jam - 9O4RZ2"], "item_tax": ["None", "0"], "item_quantity": ["None", "1"], "id": ["None", "10"], "invoice": ["None", "Invoice #2"], "item_total_price": ["None", "5000"]}	2024-02-28 04:31:05.537437+00	1	17	127.0.0.1	\N
107	2	2	Invoice #2 summary	1	{"total_price": ["40000", "45000"], "total_due": ["40000", "45000"]}	2024-02-28 04:31:05.543743+00	1	14	127.0.0.1	\N
108	11	11	Invoice #2 item: Paket 3 Jam - 0CKP3U	0	{"item_price": ["None", "5000"], "item_name": ["None", "Paket 3 Jam - 0CKP3U"], "item_tax": ["None", "0"], "item_quantity": ["None", "1"], "id": ["None", "11"], "invoice": ["None", "Invoice #2"], "item_total_price": ["None", "5000"]}	2024-02-28 04:31:05.550105+00	1	17	127.0.0.1	\N
109	2	2	Invoice #2 summary	1	{"total_price": ["45000", "50000"], "total_due": ["45000", "50000"]}	2024-02-28 04:31:05.553835+00	1	14	127.0.0.1	\N
110	12	12	Invoice #2 item: Paket 3 Jam - 6YFEMW	0	{"item_price": ["None", "5000"], "item_name": ["None", "Paket 3 Jam - 6YFEMW"], "item_tax": ["None", "0"], "item_quantity": ["None", "1"], "id": ["None", "12"], "invoice": ["None", "Invoice #2"], "item_total_price": ["None", "5000"]}	2024-02-28 04:31:05.560446+00	1	17	127.0.0.1	\N
111	2	2	Invoice #2 summary	1	{"total_price": ["50000", "55000"], "total_due": ["50000", "55000"]}	2024-02-28 04:31:05.5655+00	1	14	127.0.0.1	\N
113	2	2	Invoice #2 summary	1	{"total_price": ["55000", "60000"], "total_due": ["55000", "60000"]}	2024-02-28 04:31:05.57567+00	1	14	127.0.0.1	\N
115	2	2	Invoice #2 summary	1	{"total_price": ["60000", "65000"], "total_due": ["60000", "65000"]}	2024-02-28 04:31:05.585814+00	1	14	127.0.0.1	\N
116	2	2	smkn1	0	{"id": ["None", "2"], "name": ["None", "smkn1"], "created_at": ["None", "2024-02-28 04:58:48.605228"], "server": ["None", "rd-1"], "client_group": ["None", "SMKN1"], "updated_at": ["None", "2024-02-28 04:58:48.605244"]}	2024-02-28 04:58:48.611308+00	1	12	127.0.0.1	\N
117	2	2	smkn1	2	{"id": ["2", "None"], "name": ["smkn1", "None"], "created_at": ["2024-02-28 04:58:48.605228", "None"], "server": ["rd-1", "None"], "client_group": ["SMKN1", "None"], "updated_at": ["2024-02-28 04:58:48.605244", "None"]}	2024-02-28 04:59:14.920989+00	1	12	127.0.0.1	\N
118	3	3	SUMEDANG 2	0	{"updated_at": ["None", "2024-02-29 03:09:12.227666"], "server": ["None", "rd-1"], "id": ["None", "3"], "name": ["None", "SUMEDANG 2"], "created_at": ["None", "2024-02-29 03:09:12.227646"]}	2024-02-29 03:09:12.242135+00	1	12	127.0.0.1	\N
119	3	3	SUMEDANG 2	2	{"updated_at": ["2024-02-29 03:09:12.227666", "None"], "server": ["rd-1", "None"], "id": ["3", "None"], "name": ["SUMEDANG 2", "None"], "created_at": ["2024-02-29 03:09:12.227646", "None"]}	2024-02-29 03:09:17.641142+00	1	12	127.0.0.1	\N
120	15	15	Paket 2 Jam	0	{"price": ["None", "0"], "extra_values": ["None", "{\\"id\\": 60, \\"name\\": \\"Paket 2 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 59, \\"username\\": \\"Paket 2 Jam\\", \\"groupname\\": \\"SimpleAdd_60\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "commision": ["None", "0"], "is_enabled": ["None", "False"], "name": ["None", "Paket 2 Jam"], "ext_id": ["None", "60"], "is_synced": ["None", "True"], "id": ["None", "15"], "is_fixed_rate": ["None", "False"], "server": ["None", "rd-1"], "percentage_commision": ["None", "0"]}	2024-02-29 04:17:12.079192+00	1	9	127.0.0.1	\N
121	15	15	Paket 2 Jam	1	{"price": ["0", "2000"], "is_enabled": ["False", "True"]}	2024-02-29 04:17:23.88313+00	1	9	127.0.0.1	\N
122	37	37	0PKQDV	0	{"extra_fields": ["None", "{\\"id\\": 1143, \\"name\\": \\"0PKQDV\\", \\"batch\\": null, \\"created\\": \\"2024-02-29 04:31:31\\", \\"extra_name\\": \\"\\", \\"extra_value\\": \\"\\", \\"realm\\": \\"Demo1\\", \\"realm_id\\": 1, \\"profile\\": \\"Paket 2 Jam\\", \\"profile_id\\": 60, \\"expire\\": null, \\"time_valid\\": \\"\\"}"], "package": ["None", "Paket 2 Jam"], "updated_at": ["None", "2024-02-29 04:31:31.859590"], "owner": ["None", "marchel@skyline.net.id"], "password": ["None", "0PKQDV"], "created_at": ["None", "2024-02-29 04:31:31.859556"], "ext_id": ["None", "1143"], "id": ["None", "37"], "status": ["None", "0"], "name": ["None", "0PKQDV"]}	2024-02-29 04:31:31.86719+00	2	11	127.0.0.1	\N
123	15	15	Invoice #1 item: Paket 3 Jam - 2BZRT6	0	{"id": ["None", "15"], "item_tax": ["None", "0"], "item_price": ["None", "5000"], "invoice": ["None", "Invoice #1"], "item_quantity": ["None", "1"], "item_total_price": ["None", "5000"], "item_name": ["None", "Paket 3 Jam - 2BZRT6"]}	2024-02-29 04:56:33.495927+00	2	17	127.0.0.1	\N
124	1	1	Invoice #1 summary	1	{"total_price": ["2000", "7000"], "total_due": ["2000", "7000"]}	2024-02-29 04:56:33.50328+00	2	14	127.0.0.1	\N
125	16	16	Paket 5 Jam	0	{"percentage_commision": ["None", "0"], "server": ["None", "rd-1"], "price": ["None", "1000"], "extra_values": ["None", "{}"], "commision": ["None", "0"], "name": ["None", "Paket 5 Jam"], "id": ["None", "16"], "is_fixed_rate": ["None", "False"], "is_synced": ["None", "False"], "is_enabled": ["None", "False"]}	2024-03-07 08:21:58.673658+00	1	9	127.0.0.1	\N
126	16	16	Paket 5 Jam	1	{"extra_values": ["{}", "{\\"id\\": 61, \\"name\\": \\"Paket 5 Jam\\", \\"owner\\": \\"demo1 (root -> demo1)\\", \\"available_to_siblings\\": false, \\"profile_components\\": [{\\"id\\": 60, \\"username\\": \\"Paket 5 Jam\\", \\"groupname\\": \\"SimpleAdd_61\\", \\"priority\\": 5}], \\"data_cap_in_profile\\": false, \\"time_cap_in_profile\\": true, \\"notes\\": false, \\"update\\": true, \\"delete\\": true}"], "ext_id": ["None", "61"], "is_synced": ["False", "True"], "is_enabled": ["False", "True"]}	2024-03-07 08:22:08.735613+00	1	9	127.0.0.1	\N
127	3	3	Invoice #3	0	{"items": ["None", "invoices.InvoiceItem.None"], "client": ["None", "marchel@sti-group.co.id"], "id": ["None", "3"], "creation_date": ["None", "2024-03-07"], "payments": ["None", "invoices.InvoicePayment.None"], "notes": ["None", ""]}	2024-03-07 08:22:31.321232+00	1	13	127.0.0.1	\N
128	3	3	Invoice #3 status: Belum dibayar	0	{"invoice": ["None", "Invoice #3"], "update_date": ["None", "2024-03-07 08:22:31.322723"], "status": ["None", "0"], "id": ["None", "3"]}	2024-03-07 08:22:31.328496+00	1	15	127.0.0.1	\N
129	3	3	Invoice #3 summary	0	{"total_due": ["None", "0"], "total_price": ["None", "0"], "total_paid": ["None", "0"], "id": ["None", "3"], "invoice": ["None", "Invoice #3"], "total_refunded": ["None", "0"]}	2024-03-07 08:22:31.337034+00	1	14	127.0.0.1	\N
130	3	3	Invoice #3 commission	0	{"id": ["None", "3"], "commission_amount": ["None", "0"], "commission_date": ["None", "2024-03-07 08:22:31.338496"], "commission_notes": ["None", ""], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.344273+00	1	18	127.0.0.1	\N
131	16	16	Invoice #3 item: Paket 2 Jam - MLJHB0	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - MLJHB0"], "item_tax": ["None", "0"], "id": ["None", "16"], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.35494+00	1	17	127.0.0.1	\N
132	3	3	Invoice #3 summary	1	{"total_due": ["0", "2000"], "total_price": ["0", "2000"]}	2024-03-07 08:22:31.358981+00	1	14	127.0.0.1	\N
133	17	17	Invoice #3 item: Paket 2 Jam - D5LWG7	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - D5LWG7"], "item_tax": ["None", "0"], "id": ["None", "17"], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.365668+00	1	17	127.0.0.1	\N
134	3	3	Invoice #3 summary	1	{"total_due": ["2000", "4000"], "total_price": ["2000", "4000"]}	2024-03-07 08:22:31.369333+00	1	14	127.0.0.1	\N
135	18	18	Invoice #3 item: Paket 2 Jam - AKP38R	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - AKP38R"], "item_tax": ["None", "0"], "id": ["None", "18"], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.375574+00	1	17	127.0.0.1	\N
136	3	3	Invoice #3 summary	1	{"total_due": ["4000", "6000"], "total_price": ["4000", "6000"]}	2024-03-07 08:22:31.379276+00	1	14	127.0.0.1	\N
137	19	19	Invoice #3 item: Paket 2 Jam - L6O7IQ	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - L6O7IQ"], "item_tax": ["None", "0"], "id": ["None", "19"], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.385478+00	1	17	127.0.0.1	\N
138	3	3	Invoice #3 summary	1	{"total_due": ["6000", "8000"], "total_price": ["6000", "8000"]}	2024-03-07 08:22:31.38919+00	1	14	127.0.0.1	\N
158	49	49	9WVZAB	1	{"sold": ["False", "True"]}	2024-08-19 07:34:11.674852+00	3	11	127.0.0.1	\N
139	20	20	Invoice #3 item: Paket 2 Jam - 3S1BCQ	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - 3S1BCQ"], "item_tax": ["None", "0"], "id": ["None", "20"], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.395492+00	1	17	127.0.0.1	\N
140	3	3	Invoice #3 summary	1	{"total_due": ["8000", "10000"], "total_price": ["8000", "10000"]}	2024-03-07 08:22:31.399941+00	1	14	127.0.0.1	\N
141	21	21	Invoice #3 item: Paket 2 Jam - K4UWNY	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - K4UWNY"], "item_tax": ["None", "0"], "id": ["None", "21"], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.406088+00	1	17	127.0.0.1	\N
142	3	3	Invoice #3 summary	1	{"total_due": ["10000", "12000"], "total_price": ["10000", "12000"]}	2024-03-07 08:22:31.4098+00	1	14	127.0.0.1	\N
143	22	22	Invoice #3 item: Paket 2 Jam - 3XDYGP	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - 3XDYGP"], "item_tax": ["None", "0"], "id": ["None", "22"], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.415784+00	1	17	127.0.0.1	\N
144	3	3	Invoice #3 summary	1	{"total_due": ["12000", "14000"], "total_price": ["12000", "14000"]}	2024-03-07 08:22:31.419461+00	1	14	127.0.0.1	\N
145	23	23	Invoice #3 item: Paket 2 Jam - WZQALM	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - WZQALM"], "item_tax": ["None", "0"], "id": ["None", "23"], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.425521+00	1	17	127.0.0.1	\N
146	3	3	Invoice #3 summary	1	{"total_due": ["14000", "16000"], "total_price": ["14000", "16000"]}	2024-03-07 08:22:31.429163+00	1	14	127.0.0.1	\N
147	24	24	Invoice #3 item: Paket 2 Jam - I2LDKW	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - I2LDKW"], "item_tax": ["None", "0"], "id": ["None", "24"], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.435877+00	1	17	127.0.0.1	\N
148	3	3	Invoice #3 summary	1	{"total_due": ["16000", "18000"], "total_price": ["16000", "18000"]}	2024-03-07 08:22:31.439542+00	1	14	127.0.0.1	\N
149	25	25	Invoice #3 item: Paket 2 Jam - M7TBOQ	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - M7TBOQ"], "item_tax": ["None", "0"], "id": ["None", "25"], "invoice": ["None", "Invoice #3"]}	2024-03-07 08:22:31.445837+00	1	17	127.0.0.1	\N
150	3	3	Invoice #3 summary	1	{"total_due": ["18000", "20000"], "total_price": ["18000", "20000"]}	2024-03-07 08:22:31.449657+00	1	14	127.0.0.1	\N
151	4	4	Invoice #4	0	{"items": ["None", "invoices.InvoiceItem.None"], "client": ["None", "marchel@skyline.net.id"], "id": ["None", "4"], "creation_date": ["None", "2024-03-07"], "payments": ["None", "invoices.InvoicePayment.None"], "notes": ["None", ""]}	2024-03-07 08:23:35.133562+00	2	13	127.0.0.1	\N
152	4	4	Invoice #4 status: Belum dibayar	0	{"invoice": ["None", "Invoice #4"], "update_date": ["None", "2024-03-07 08:23:35.135382"], "status": ["None", "0"], "id": ["None", "4"]}	2024-03-07 08:23:35.140099+00	2	15	127.0.0.1	\N
153	4	4	Invoice #4 summary	0	{"total_due": ["None", "0"], "total_price": ["None", "0"], "total_paid": ["None", "0"], "id": ["None", "4"], "invoice": ["None", "Invoice #4"], "total_refunded": ["None", "0"]}	2024-03-07 08:23:35.147279+00	2	14	127.0.0.1	\N
154	4	4	Invoice #4 commission	0	{"id": ["None", "4"], "commission_amount": ["None", "0"], "commission_date": ["None", "2024-03-07 08:23:35.148656"], "commission_notes": ["None", ""], "invoice": ["None", "Invoice #4"]}	2024-03-07 08:23:35.152623+00	2	18	127.0.0.1	\N
155	26	26	Invoice #4 item: Paket 2 Jam - 9WVZAB	0	{"item_total_price": ["None", "2000.00"], "item_price": ["None", "2000.00"], "item_quantity": ["None", "1"], "item_name": ["None", "Paket 2 Jam - 9WVZAB"], "item_tax": ["None", "0"], "id": ["None", "26"], "invoice": ["None", "Invoice #4"]}	2024-03-07 08:23:35.164164+00	2	17	127.0.0.1	\N
156	4	4	Invoice #4 summary	1	{"total_due": ["0", "2000"], "total_price": ["0", "2000"]}	2024-03-07 08:23:35.169281+00	2	14	127.0.0.1	\N
159	48	48	M7TBOQ	1	{"status": ["1", "True"]}	2024-08-19 09:35:41.094904+00	3	11	127.0.0.1	\N
160	49	49	9WVZAB	1	{"status": ["1", "True"]}	2024-08-19 09:35:41.119713+00	3	11	127.0.0.1	\N
161	48	48	M7TBOQ	1	{"sold": ["False", "True"]}	2024-08-19 09:36:36.066348+00	3	11	127.0.0.1	\N
\.


--
-- TOC entry 3815 (class 0 OID 22099)
-- Dependencies: 217
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- TOC entry 3817 (class 0 OID 22103)
-- Dependencies: 219
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3819 (class 0 OID 22107)
-- Dependencies: 221
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user group	6	add_usergroup
22	Can change user group	6	change_usergroup
23	Can delete user group	6	delete_usergroup
24	Can view user group	6	view_usergroup
25	Can add User	7	add_user
26	Can change User	7	change_user
27	Can delete User	7	delete_user
28	Can view User	7	view_user
29	Can add News Feed	8	add_newsfeed
30	Can change News Feed	8	change_newsfeed
31	Can delete News Feed	8	delete_newsfeed
32	Can view News Feed	8	view_newsfeed
33	Can add Package	9	add_package
34	Can change Package	9	change_package
35	Can delete Package	9	delete_package
36	Can view Package	9	view_package
37	Can add Server	10	add_server
38	Can change Server	10	change_server
39	Can delete Server	10	delete_server
40	Can view Server	10	view_server
41	Can add Voucher	11	add_voucher
42	Can change Voucher	11	change_voucher
43	Can delete Voucher	11	delete_voucher
44	Can view Voucher	11	view_voucher
45	Can add Server Client Group	12	add_servergroup
46	Can change Server Client Group	12	change_servergroup
47	Can delete Server Client Group	12	delete_servergroup
48	Can view Server Client Group	12	view_servergroup
49	Can add Invoice	13	add_invoice
50	Can change Invoice	13	change_invoice
51	Can delete Invoice	13	delete_invoice
52	Can view Invoice	13	view_invoice
53	Can add Invoice Summary	14	add_invoicesummary
54	Can change Invoice Summary	14	change_invoicesummary
55	Can delete Invoice Summary	14	delete_invoicesummary
56	Can view Invoice Summary	14	view_invoicesummary
57	Can add Invoice Status	15	add_invoicestatus
58	Can change Invoice Status	15	change_invoicestatus
59	Can delete Invoice Status	15	delete_invoicestatus
60	Can view Invoice Status	15	view_invoicestatus
61	Can add Invoice Payment	16	add_invoicepayment
62	Can change Invoice Payment	16	change_invoicepayment
63	Can delete Invoice Payment	16	delete_invoicepayment
64	Can view Invoice Payment	16	view_invoicepayment
65	Can add Invoice Item	17	add_invoiceitem
66	Can change Invoice Item	17	change_invoiceitem
67	Can delete Invoice Item	17	delete_invoiceitem
68	Can view Invoice Item	17	view_invoiceitem
69	Can add Invoice Commission	18	add_invoicecommission
70	Can change Invoice Commission	18	change_invoicecommission
71	Can delete Invoice Commission	18	delete_invoicecommission
72	Can view Invoice Commission	18	view_invoicecommission
73	Can add log entry	19	add_logentry
74	Can change log entry	19	change_logentry
75	Can delete log entry	19	delete_logentry
76	Can view log entry	19	view_logentry
77	Can add static device	20	add_staticdevice
78	Can change static device	20	change_staticdevice
79	Can delete static device	20	delete_staticdevice
80	Can view static device	20	view_staticdevice
81	Can add static token	21	add_statictoken
82	Can change static token	21	change_statictoken
83	Can delete static token	21	delete_statictoken
84	Can view static token	21	view_statictoken
85	Can add TOTP device	22	add_totpdevice
86	Can change TOTP device	22	change_totpdevice
87	Can delete TOTP device	22	delete_totpdevice
88	Can view TOTP device	22	view_totpdevice
89	Can add email device	23	add_emaildevice
90	Can change email device	23	change_emaildevice
91	Can delete email device	23	delete_emaildevice
92	Can view email device	23	view_emaildevice
93	Can add crontab	24	add_crontabschedule
94	Can change crontab	24	change_crontabschedule
95	Can delete crontab	24	delete_crontabschedule
96	Can view crontab	24	view_crontabschedule
97	Can add interval	25	add_intervalschedule
98	Can change interval	25	change_intervalschedule
99	Can delete interval	25	delete_intervalschedule
100	Can view interval	25	view_intervalschedule
101	Can add periodic task	26	add_periodictask
102	Can change periodic task	26	change_periodictask
103	Can delete periodic task	26	delete_periodictask
104	Can view periodic task	26	view_periodictask
105	Can add periodic tasks	27	add_periodictasks
106	Can change periodic tasks	27	change_periodictasks
107	Can delete periodic tasks	27	delete_periodictasks
108	Can view periodic tasks	27	view_periodictasks
109	Can add solar event	28	add_solarschedule
110	Can change solar event	28	change_solarschedule
111	Can delete solar event	28	delete_solarschedule
112	Can view solar event	28	view_solarschedule
113	Can add clocked	29	add_clockedschedule
114	Can change clocked	29	change_clockedschedule
115	Can delete clocked	29	delete_clockedschedule
116	Can view clocked	29	view_clockedschedule
117	Can add access attempt	30	add_accessattempt
118	Can change access attempt	30	change_accessattempt
119	Can delete access attempt	30	delete_accessattempt
120	Can view access attempt	30	view_accessattempt
121	Can add access log	31	add_accesslog
122	Can change access log	31	change_accesslog
123	Can delete access log	31	delete_accesslog
124	Can view access log	31	view_accesslog
125	Can add access failure	32	add_accessfailurelog
126	Can change access failure	32	change_accessfailurelog
127	Can delete access failure	32	delete_accessfailurelog
128	Can view access failure	32	view_accessfailurelog
129	Can add Email Configuration	33	add_emailconfiguration
130	Can change Email Configuration	33	change_emailconfiguration
131	Can delete Email Configuration	33	delete_emailconfiguration
132	Can view Email Configuration	33	view_emailconfiguration
\.


--
-- TOC entry 3821 (class 0 OID 22111)
-- Dependencies: 223
-- Data for Name: axes_accessattempt; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.axes_accessattempt (id, user_agent, ip_address, username, http_accept, path_info, attempt_time, get_data, post_data, failures_since_start) FROM stdin;
\.


--
-- TOC entry 3823 (class 0 OID 22118)
-- Dependencies: 225
-- Data for Name: axes_accessfailurelog; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.axes_accessfailurelog (id, user_agent, ip_address, username, http_accept, path_info, attempt_time, locked_out) FROM stdin;
\.


--
-- TOC entry 3825 (class 0 OID 22124)
-- Dependencies: 227
-- Data for Name: axes_accesslog; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.axes_accesslog (id, user_agent, ip_address, username, http_accept, path_info, attempt_time, logout_time) FROM stdin;
1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0	103.44.149.62	marchel@sti-group.co.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8	/auth/login/	2023-03-13 02:01:04.52482+00	2023-03-13 04:17:27.606947+00
3	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0	103.44.149.62	marchel@sti-group.co.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8	/auth/login/	2023-03-13 04:17:57.41104+00	2024-02-29 04:50:28.71939+00
4	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0	127.0.0.1	marchel@sti-group.co.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-02-28 02:37:21.729862+00	2024-02-29 04:50:28.71939+00
5	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0	127.0.0.1	marchel@sti-group.co.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-02-28 03:05:41.546481+00	2024-02-29 04:50:28.71939+00
6	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	127.0.0.1	marchel@sti-group.co.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-02-28 03:25:21.329605+00	2024-02-29 04:50:28.71939+00
9	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0	127.0.0.1	marchel@sti-group.co.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-03-07 02:59:06.535231+00	2024-03-07 08:23:13.311867+00
2	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:109.0) Gecko/20100101 Firefox/110.0	103.44.149.62	marchel@skyline.net.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,*/*;q=0.8	/auth/login/	2023-03-13 04:17:34.458325+00	2024-03-07 08:23:49.822741+00
7	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36	127.0.0.1	marchel@skyline.net.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-02-29 04:19:37.031825+00	2024-03-07 08:23:49.822741+00
8	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0	127.0.0.1	marchel@skyline.net.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-02-29 04:50:38.545254+00	2024-03-07 08:23:49.822741+00
10	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0	127.0.0.1	marchel@skyline.net.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-03-07 08:23:20.375152+00	2024-03-07 08:23:49.822741+00
12	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	admin@gmail.com	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-19 05:15:44.468297+00	2024-08-19 08:06:42.945413+00
11	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36 Edg/122.0.0.0	127.0.0.1	marchel@sti-group.co.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-03-07 08:23:55.773709+00	2024-08-19 08:10:43.456954+00
13	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	marchel@sti-group.co.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-19 08:08:29.522199+00	2024-08-19 08:10:43.456954+00
14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	marchel@skyline.net.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-19 08:11:03.00853+00	2024-08-19 08:12:08.607248+00
15	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	admin@gmail.com	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-19 08:12:14.854136+00	2024-08-20 01:45:12.126785+00
16	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	admin@gmail.com	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 01:45:17.727279+00	2024-08-20 02:57:51.47105+00
17	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	admin@gmail.com	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 02:58:24.074188+00	2024-08-20 02:58:43.562591+00
18	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	nandan@skyline.net.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 02:58:52.874805+00	2024-08-20 03:03:24.749438+00
19	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	admin@gmail.com	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 03:03:31.118098+00	2024-08-20 03:55:39.25675+00
20	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	nandan@skyline.net.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 03:55:51.318534+00	2024-08-20 04:17:06.380676+00
21	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	admin@gmail.com	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 04:17:40.825982+00	2024-08-20 04:31:27.654337+00
22	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	admin@gmail.com	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 04:31:34.677127+00	2024-08-20 04:33:52.979486+00
23	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	nandan@skyline.net.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 04:34:00.760296+00	2024-08-20 04:42:52.225014+00
24	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	admin@gmail.com	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 04:43:11.506786+00	2024-08-20 04:43:25.740623+00
25	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	admin@gmail.com	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 04:52:49.269002+00	2024-08-20 06:52:57.250188+00
26	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	nandan@skyline.net.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 06:53:04.070872+00	2024-08-20 07:12:10.403569+00
27	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	nandan@skyline.net.id	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 07:12:17.821617+00	2024-08-20 07:13:00.345766+00
28	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36	127.0.0.1	admin@gmail.com	text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7	/auth/login/	2024-08-20 07:13:07.995234+00	\N
\.


--
-- TOC entry 3827 (class 0 OID 22130)
-- Dependencies: 229
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2024-02-28 02:47:39.614167+00	1	Invoice #1	1	[{"added": {}}, {"added": {"name": "Invoice Item", "object": "Invoice #1 item: Data"}}]	13	1
2	2024-02-28 02:55:44.705292+00	1	Invoice #1	2	[{"changed": {"name": "Invoice Status", "object": "Invoice #1 status: Terbayar", "fields": ["Status"]}}]	13	1
3	2024-02-28 02:56:01.123219+00	1	Invoice #1	2	[{"changed": {"name": "Invoice Status", "object": "Invoice #1 status: Belum dibayar", "fields": ["Status"]}}]	13	1
4	2024-02-28 05:00:16.794295+00	1	SUMEDANG	2	[{"changed": {"fields": ["Client group"]}}]	12	1
5	2024-02-28 11:07:01.848176+00	1	Update Anjg - 1 - True - 0	1	[{"added": {}}]	8	1
6	2024-02-29 03:54:19.124518+00	13	Paket 3 Jam	2	[{"changed": {"fields": ["Groups"]}}]	9	1
7	2024-08-19 07:33:45.945588+00	49	9WVZAB	2	[{"changed": {"fields": ["Status"]}}]	11	3
8	2024-08-19 07:34:11.681001+00	49	9WVZAB	2	[{"changed": {"fields": ["Sold"]}}]	11	3
\.


--
-- TOC entry 3829 (class 0 OID 22137)
-- Dependencies: 231
-- Data for Name: django_celery_beat_clockedschedule; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_celery_beat_clockedschedule (id, clocked_time) FROM stdin;
\.


--
-- TOC entry 3831 (class 0 OID 22141)
-- Dependencies: 233
-- Data for Name: django_celery_beat_crontabschedule; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_celery_beat_crontabschedule (id, minute, hour, day_of_week, day_of_month, month_of_year, timezone) FROM stdin;
\.


--
-- TOC entry 3833 (class 0 OID 22147)
-- Dependencies: 235
-- Data for Name: django_celery_beat_intervalschedule; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_celery_beat_intervalschedule (id, every, period) FROM stdin;
\.


--
-- TOC entry 3835 (class 0 OID 22151)
-- Dependencies: 237
-- Data for Name: django_celery_beat_periodictask; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_celery_beat_periodictask (id, name, task, args, kwargs, queue, exchange, routing_key, expires, enabled, last_run_at, total_run_count, date_changed, description, crontab_id, interval_id, solar_id, one_off, start_time, priority, headers, clocked_id, expire_seconds) FROM stdin;
\.


--
-- TOC entry 3837 (class 0 OID 22160)
-- Dependencies: 239
-- Data for Name: django_celery_beat_periodictasks; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_celery_beat_periodictasks (ident, last_update) FROM stdin;
\.


--
-- TOC entry 3838 (class 0 OID 22163)
-- Dependencies: 240
-- Data for Name: django_celery_beat_solarschedule; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_celery_beat_solarschedule (id, event, latitude, longitude) FROM stdin;
\.


--
-- TOC entry 3840 (class 0 OID 22167)
-- Dependencies: 242
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	usergroup
7	users	user
8	dashboard	newsfeed
9	vouchers	package
10	vouchers	server
11	vouchers	voucher
12	vouchers	servergroup
13	invoices	invoice
14	invoices	invoicesummary
15	invoices	invoicestatus
16	invoices	invoicepayment
17	invoices	invoiceitem
18	invoices	invoicecommission
19	auditlog	logentry
20	otp_static	staticdevice
21	otp_static	statictoken
22	otp_totp	totpdevice
23	otp_email	emaildevice
24	django_celery_beat	crontabschedule
25	django_celery_beat	intervalschedule
26	django_celery_beat	periodictask
27	django_celery_beat	periodictasks
28	django_celery_beat	solarschedule
29	django_celery_beat	clockedschedule
30	axes	accessattempt
31	axes	accesslog
32	axes	accessfailurelog
33	maildb	emailconfiguration
\.


--
-- TOC entry 3842 (class 0 OID 22171)
-- Dependencies: 244
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-03-13 01:55:03.08165+00
2	contenttypes	0002_remove_content_type_name	2023-03-13 01:55:03.12616+00
3	auth	0001_initial	2023-03-13 01:55:03.249073+00
4	auth	0002_alter_permission_name_max_length	2023-03-13 01:55:03.273366+00
5	auth	0003_alter_user_email_max_length	2023-03-13 01:55:03.295933+00
6	auth	0004_alter_user_username_opts	2023-03-13 01:55:03.325729+00
7	auth	0005_alter_user_last_login_null	2023-03-13 01:55:03.35421+00
8	auth	0006_require_contenttypes_0002	2023-03-13 01:55:03.381919+00
9	auth	0007_alter_validators_add_error_messages	2023-03-13 01:55:03.419698+00
10	auth	0008_alter_user_username_max_length	2023-03-13 01:55:03.451027+00
11	auth	0009_alter_user_last_name_max_length	2023-03-13 01:55:03.480723+00
12	auth	0010_alter_group_name_max_length	2023-03-13 01:55:03.622533+00
13	auth	0011_update_proxy_permissions	2023-03-13 01:55:03.64866+00
14	auth	0012_alter_user_first_name_max_length	2023-03-13 01:55:03.673229+00
15	users	0001_initial	2023-03-13 01:55:03.810947+00
16	admin	0001_initial	2023-03-13 01:55:03.868342+00
17	admin	0002_logentry_remove_auto_add	2023-03-13 01:55:03.888422+00
18	admin	0003_logentry_add_action_flag_choices	2023-03-13 01:55:03.914341+00
19	auditlog	0001_initial	2023-03-13 01:55:03.991892+00
20	auditlog	0002_auto_support_long_primary_keys	2023-03-13 01:55:04.07808+00
21	auditlog	0003_logentry_remote_addr	2023-03-13 01:55:04.11192+00
22	auditlog	0004_logentry_detailed_object_repr	2023-03-13 01:55:04.141401+00
23	auditlog	0005_logentry_additional_data_verbose_name	2023-03-13 01:55:04.166098+00
24	auditlog	0006_object_pk_index	2023-03-13 01:55:04.235358+00
25	auditlog	0007_object_pk_type	2023-03-13 01:55:04.276195+00
26	auditlog	0008_action_index	2023-03-13 01:55:04.319032+00
27	auditlog	0009_alter_logentry_additional_data	2023-03-13 01:55:04.345742+00
28	axes	0001_initial	2023-03-13 01:55:04.388221+00
29	axes	0002_auto_20151217_2044	2023-03-13 01:55:04.506993+00
30	axes	0003_auto_20160322_0929	2023-03-13 01:55:04.54282+00
31	axes	0004_auto_20181024_1538	2023-03-13 01:55:04.57418+00
32	axes	0005_remove_accessattempt_trusted	2023-03-13 01:55:04.598745+00
33	axes	0006_remove_accesslog_trusted	2023-03-13 01:55:04.630374+00
34	axes	0007_alter_accessattempt_unique_together	2023-03-13 01:55:04.676565+00
35	axes	0008_accessfailurelog	2023-03-13 01:55:04.7418+00
36	dashboard	0001_initial	2023-03-13 01:55:04.809362+00
37	django_celery_beat	0001_initial	2023-03-13 01:55:04.906555+00
38	django_celery_beat	0002_auto_20161118_0346	2023-03-13 01:55:04.963089+00
39	django_celery_beat	0003_auto_20161209_0049	2023-03-13 01:55:04.989452+00
40	django_celery_beat	0004_auto_20170221_0000	2023-03-13 01:55:05.01473+00
41	django_celery_beat	0005_add_solarschedule_events_choices	2023-03-13 01:55:05.081701+00
42	django_celery_beat	0006_auto_20180322_0932	2023-03-13 01:55:05.158185+00
43	django_celery_beat	0007_auto_20180521_0826	2023-03-13 01:55:05.220669+00
44	django_celery_beat	0008_auto_20180914_1922	2023-03-13 01:55:05.273674+00
45	django_celery_beat	0006_auto_20180210_1226	2023-03-13 01:55:05.308803+00
46	django_celery_beat	0006_periodictask_priority	2023-03-13 01:55:05.341562+00
47	django_celery_beat	0009_periodictask_headers	2023-03-13 01:55:05.388216+00
48	django_celery_beat	0010_auto_20190429_0326	2023-03-13 01:55:05.499871+00
49	django_celery_beat	0011_auto_20190508_0153	2023-03-13 01:55:05.574052+00
50	django_celery_beat	0012_periodictask_expire_seconds	2023-03-13 01:55:05.599345+00
51	django_celery_beat	0013_auto_20200609_0727	2023-03-13 01:55:05.629167+00
52	django_celery_beat	0014_remove_clockedschedule_enabled	2023-03-13 01:55:05.665663+00
53	django_celery_beat	0015_edit_solarschedule_events_choices	2023-03-13 01:55:05.688007+00
54	django_celery_beat	0016_alter_crontabschedule_timezone	2023-03-13 01:55:05.713803+00
55	invoices	0001_initial	2023-03-13 01:55:05.907697+00
56	invoices	0002_alter_invoicestatus_status	2023-03-13 01:55:05.925654+00
57	maildb	0001_initial	2023-03-13 01:55:05.961324+00
58	otp_email	0001_initial	2023-03-13 01:55:06.015942+00
59	otp_email	0002_sidechanneldevice_email	2023-03-13 01:55:06.243566+00
60	otp_email	0003_emaildevice_email	2023-03-13 01:55:06.286187+00
61	otp_email	0004_throttling	2023-03-13 01:55:06.335504+00
62	otp_static	0001_initial	2023-03-13 01:55:06.454503+00
63	otp_static	0002_throttling	2023-03-13 01:55:06.507374+00
64	otp_totp	0001_initial	2023-03-13 01:55:06.584464+00
65	otp_totp	0002_auto_20190420_0723	2023-03-13 01:55:06.643909+00
66	sessions	0001_initial	2023-03-13 01:55:06.70466+00
67	two_factor	0001_initial	2023-03-13 01:55:06.773239+00
68	two_factor	0002_auto_20150110_0810	2023-03-13 01:55:06.798086+00
69	two_factor	0003_auto_20150817_1733	2023-03-13 01:55:06.954214+00
70	two_factor	0004_auto_20160205_1827	2023-03-13 01:55:07.003885+00
71	two_factor	0005_auto_20160224_0450	2023-03-13 01:55:07.083301+00
72	two_factor	0006_phonedevice_key_default	2023-03-13 01:55:07.123442+00
73	two_factor	0007_auto_20201201_1019	2023-03-13 01:55:07.176429+00
74	users	0002_alter_user_user_group	2023-03-13 01:55:07.257224+00
75	vouchers	0001_initial	2023-03-13 01:55:07.433302+00
76	vouchers	0002_package_is_synced	2023-03-13 01:55:07.474394+00
77	two_factor	0008_alter_phonedevice_id	2024-02-28 02:43:31.503424+00
78	vouchers	0003_alter_package_commision_and_more	2024-02-28 02:43:31.542292+00
79	invoices	0003_alter_invoicecommission_commission_amount_and_more	2024-02-28 02:56:56.355457+00
80	invoices	0004_alter_invoicesummary_total_due	2024-02-28 02:57:19.702551+00
81	vouchers	0003_package_group_alter_servergroup_server	2024-02-28 04:58:11.867598+00
82	vouchers	0004_remove_servergroup_client_group_and_more	2024-02-28 04:59:46.390974+00
83	vouchers	0005_remove_package_group_package_group	2024-02-28 05:04:49.730477+00
84	vouchers	0006_rename_group_package_groups	2024-02-28 05:06:49.599865+00
85	vouchers	0007_alter_servergroup_server	2024-02-29 03:31:47.626535+00
86	vouchers	0008_merge_20240307_0927	2024-03-07 02:28:44.411064+00
87	vouchers	0009_alter_package_commision_alter_package_groups_and_more	2024-03-07 02:58:35.305692+00
88	vouchers	0010_voucher_sold	2024-08-19 07:23:48.911117+00
\.


--
-- TOC entry 3844 (class 0 OID 22177)
-- Dependencies: 246
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
g5o5tpcuvr8ujtlvva1y19nvd7hb3wc2	.eJxVjEEOwiAQRe_C2pAp0AIu3fcMZAYYWzWQlHZlvLtt0oVu33v_v0XAbZ3C1vIS5iSuQonLLyOMz1wOkR5Y7lXGWtZlJnkk8rRNjjXl1-1s_w4mbNO-ppgB2DBGy1Zp1xFbPVAcjDWAnU9pZz5Rr3iAbI1XBkBTz-iAgZz4fAHwyjfJ:1pbZcs:F9kFCndtoeJhrqfiFV-bxsmgex6uVEMHuRd105E3PeQ	2023-03-27 04:17:34.466128+00
rs1cix0m5y8t3dp3zmtiahl7s4mocv7b	.eJxVjEEOwiAQAP_C2RC2LVA8eu8byMIuUjWQlPZk_Lsh6UGvM5N5C4_Hnv3RePMriasAcfllAeOTSxf0wHKvMtayb2uQPZGnbXKpxK_b2f4NMrbct5MFSyaoARw4dlYpq2anAjMCD0pThJGmBBbGgEanNANo6xgxGW1IfL613Dc6:1pbZdF:PYYvIxof3lJkL1AjOt-pOH_yPR-q7c-rAFCo2dq8jqQ	2023-03-27 04:17:57.416691+00
ah8c0o8l5mlaaomuguv1yi71urei96u3	.eJxVjEEOwiAQAP_C2RC2LVA8eu8byMIuUjWQlPZk_Lsh6UGvM5N5C4_Hnv3RePMriasAcfllAeOTSxf0wHKvMtayb2uQPZGnbXKpxK_b2f4NMrbct5MFSyaoARw4dlYpq2anAjMCD0pThJGmBBbGgEanNANo6xgxGW1IfL613Dc6:1rfAGL:_7cn33tvngaoThHpF6HN11aQ84utavKH5OfiTgapeMw	2024-03-13 03:05:41.548385+00
pb19ue5c35wl24ve6t743l4a3hii66pi	.eJxVjEEOwiAQAP_C2RC2LVA8eu8byMIuUjWQlPZk_Lsh6UGvM5N5C4_Hnv3RePMriasAcfllAeOTSxf0wHKvMtayb2uQPZGnbXKpxK_b2f4NMrbct5MFSyaoARw4dlYpq2anAjMCD0pThJGmBBbGgEanNANo6xgxGW1IfL613Dc6:1rfAZN:nxAUrBdae56P9-kJCFJQgMzswHpsmm8Ta9JyoWOpMMk	2024-03-13 03:25:21.331488+00
ipdcoboxboezf494czxqzpvoemstbtoe	.eJxVjEEOwiAQRe_C2pAp0AIu3fcMZAYYWzWQlHZlvLtt0oVu33v_v0XAbZ3C1vIS5iSuQonLLyOMz1wOkR5Y7lXGWtZlJnkk8rRNjjXl1-1s_w4mbNO-ppgB2DBGy1Zp1xFbPVAcjDWAnU9pZz5Rr3iAbI1XBkBTz-iAgZz4fAHwyjfJ:1rfXtR:_jNnUUWuvYGIMxWfM__FOo_p-VAfv81MUmzVL7sQpYc	2024-03-14 04:19:37.036265+00
iajkfo9olvm5e0sn10eztw4s3cctw3kr	.eJxVjEEOwiAQRe_C2pAp0AIu3fcMZAYYWzWQlHZlvLtt0oVu33v_v0XAbZ3C1vIS5iSuQonLLyOMz1wOkR5Y7lXGWtZlJnkk8rRNjjXl1-1s_w4mbNO-ppgB2DBGy1Zp1xFbPVAcjDWAnU9pZz5Rr3iAbI1XBkBTz-iAgZz4fAHwyjfJ:1rfYNS:FoCPHfDQctPDhwzDti3a8wvfF5u-1g8OiMILFv3rXf8	2024-03-14 04:50:38.54691+00
g4ls4ahlxvdj7n3f2wf4893bp3q4922i	.eJxVjEEOwiAQAP_C2RC2LVA8eu8byMIuUjWQlPZk_Lsh6UGvM5N5C4_Hnv3RePMriasAcfllAeOTSxf0wHKvMtayb2uQPZGnbXKpxK_b2f4NMrbct5MFSyaoARw4dlYpq2anAjMCD0pThJGmBBbGgEanNANo6xgxGW1IfL613Dc6:1ri92h:KWFdwCXn3czV3xXVUxZhbk4661Pz2QRsIBf-tf2oxp0	2024-03-21 08:23:55.775487+00
yaumqr8kr27naa27uer526aegwpa63f1	.eJxVjMsOgjAUBf-la9Nw-wSX7vkG0vuoRQ0kFFbGfxcSFro9M3PeakjbWoatyjKMrK7KqsvvhomeMh2AH2m6z5rmaV1G1IeiT1p1P7O8bqf7d1BSLXudjUXjKCO00LWOfSNAXrpMwmgJESHEGKiRYIDJh-xc9BDb3YLgrfp8AfiYN9E:1sgJ3D:U7cghiZpvOJJf6ynj78uTCBjeSwuBS_jw2dddoCXO10	2024-09-03 07:13:07.998608+00
\.


--
-- TOC entry 3845 (class 0 OID 22182)
-- Dependencies: 247
-- Data for Name: invoices_invoice; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.invoices_invoice (id, creation_date, due_date, notes, client_id) FROM stdin;
1	2024-02-28	2024-02-28		2
2	2024-02-28	\N		1
3	2024-03-07	\N		1
4	2024-03-07	\N		2
\.


--
-- TOC entry 3847 (class 0 OID 22188)
-- Dependencies: 249
-- Data for Name: invoices_invoicecommission; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.invoices_invoicecommission (id, commission_amount, commission_date, commission_notes, invoice_id) FROM stdin;
1	0	2024-02-28 02:47:39.597336+00		1
2	0	2024-02-28 04:12:40.309462+00		2
3	0	2024-03-07 08:22:31.338496+00		3
4	0	2024-03-07 08:23:35.148656+00		4
\.


--
-- TOC entry 3849 (class 0 OID 22194)
-- Dependencies: 251
-- Data for Name: invoices_invoiceitem; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.invoices_invoiceitem (id, item_name, item_price, item_quantity, item_total_price, item_tax, invoice_id) FROM stdin;
1	Data	2000	1	2000	0	1
2	N2QJD6 - Paket 3 Jam	5000	1	5000	0	2
3	KOPBXD - Paket 3 Jam	5000	1	5000	0	2
4	EFMAIP - Paket 3 Jam	5000	1	5000	0	2
5	RKIOVQ - Paket 3 Jam	5000	1	5000	0	2
6	WIGVHN - Paket 3 Jam	5000	1	5000	0	2
7	9PA56M - Paket 3 Jam	5000	1	5000	0	2
8	Paket 3 Jam - T0DGKV	5000	1	5000	0	2
9	Paket 3 Jam - D9NGM4	5000	1	5000	0	2
10	Paket 3 Jam - 9O4RZ2	5000	1	5000	0	2
11	Paket 3 Jam - 0CKP3U	5000	1	5000	0	2
12	Paket 3 Jam - 6YFEMW	5000	1	5000	0	2
13	Paket 3 Jam - KR1T63	5000	1	5000	0	2
14	Paket 3 Jam - FO0YU8	5000	1	5000	0	2
15	Paket 3 Jam - 2BZRT6	5000	1	5000	0	1
16	Paket 2 Jam - MLJHB0	2000	1	2000	0	3
17	Paket 2 Jam - D5LWG7	2000	1	2000	0	3
18	Paket 2 Jam - AKP38R	2000	1	2000	0	3
19	Paket 2 Jam - L6O7IQ	2000	1	2000	0	3
20	Paket 2 Jam - 3S1BCQ	2000	1	2000	0	3
21	Paket 2 Jam - K4UWNY	2000	1	2000	0	3
22	Paket 2 Jam - 3XDYGP	2000	1	2000	0	3
23	Paket 2 Jam - WZQALM	2000	1	2000	0	3
24	Paket 2 Jam - I2LDKW	2000	1	2000	0	3
25	Paket 2 Jam - M7TBOQ	2000	1	2000	0	3
26	Paket 2 Jam - 9WVZAB	2000	1	2000	0	4
\.


--
-- TOC entry 3851 (class 0 OID 22198)
-- Dependencies: 253
-- Data for Name: invoices_invoicepayment; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.invoices_invoicepayment (id, payment_transaction_id, payment_transaction_fee, payment_date, payment_amount, payment_method, payment_notes, invoice_id) FROM stdin;
\.


--
-- TOC entry 3853 (class 0 OID 22204)
-- Dependencies: 255
-- Data for Name: invoices_invoicestatus; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.invoices_invoicestatus (id, status, update_date, invoice_id) FROM stdin;
1	0	2024-02-28 02:47:39.588306+00	1
2	0	2024-02-28 04:12:40.299177+00	2
3	0	2024-03-07 08:22:31.322723+00	3
4	0	2024-03-07 08:23:35.135382+00	4
\.


--
-- TOC entry 3855 (class 0 OID 22208)
-- Dependencies: 257
-- Data for Name: invoices_invoicesummary; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.invoices_invoicesummary (id, total_price, total_paid, total_refunded, total_due, invoice_id) FROM stdin;
2	65000	0	0	65000	2
1	7000	0	0	7000	1
3	20000	0	0	20000	3
4	2000	0	0	2000	4
\.


--
-- TOC entry 3857 (class 0 OID 22212)
-- Dependencies: 259
-- Data for Name: maildb_emailconfiguration; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.maildb_emailconfiguration (id, host, port, from_email, username, password, use_tls, use_ssl, fail_silently, timeout) FROM stdin;
\.


--
-- TOC entry 3859 (class 0 OID 22218)
-- Dependencies: 261
-- Data for Name: news_feed; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.news_feed (id, title, content, created_at, updated_at, is_published, "order") FROM stdin;
1	Update Anjg	{"delta":"{\\"ops\\":[{\\"insert\\":\\"Update su\\\\n\\"}]}","html":"<p>Update su</p>"}	2024-02-28 11:07:01.840532+00	2024-02-28 11:07:01.840558+00	t	0
\.


--
-- TOC entry 3860 (class 0 OID 22223)
-- Dependencies: 262
-- Data for Name: news_feed_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.news_feed_groups (id, newsfeed_id, usergroup_id) FROM stdin;
1	1	1
2	1	2
\.


--
-- TOC entry 3863 (class 0 OID 22228)
-- Dependencies: 265
-- Data for Name: otp_email_emaildevice; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.otp_email_emaildevice (id, name, confirmed, user_id, token, valid_until, email, throttling_failure_count, throttling_failure_timestamp) FROM stdin;
\.


--
-- TOC entry 3865 (class 0 OID 22233)
-- Dependencies: 267
-- Data for Name: otp_static_staticdevice; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.otp_static_staticdevice (id, name, confirmed, user_id, throttling_failure_count, throttling_failure_timestamp) FROM stdin;
\.


--
-- TOC entry 3867 (class 0 OID 22238)
-- Dependencies: 269
-- Data for Name: otp_static_statictoken; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.otp_static_statictoken (id, token, device_id) FROM stdin;
\.


--
-- TOC entry 3869 (class 0 OID 22242)
-- Dependencies: 271
-- Data for Name: otp_totp_totpdevice; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.otp_totp_totpdevice (id, name, confirmed, key, step, t0, digits, tolerance, drift, last_t, user_id, throttling_failure_count, throttling_failure_timestamp) FROM stdin;
\.


--
-- TOC entry 3871 (class 0 OID 22250)
-- Dependencies: 273
-- Data for Name: two_factor_phonedevice; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.two_factor_phonedevice (id, name, confirmed, number, key, method, user_id, throttling_failure_count, throttling_failure_timestamp) FROM stdin;
\.


--
-- TOC entry 3873 (class 0 OID 22255)
-- Dependencies: 275
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users_user (id, password, last_login, is_superuser, email, first_name, last_name, phone_number, is_staff, is_active, created_at, updated_at, address, user_group_id) FROM stdin;
1	pbkdf2_sha256$320000$t8XT5lHnUb2dAgs85PVclw$xgmndpUhzKwCheBo54g87f7OlYzz+/Duk4OpfJyXXAQ=	2024-08-19 08:08:29.514672+00	t	marchel@sti-group.co.id	Marchel	Fahrezi	087865022330	t	t	2023-03-13 01:58:40.928386+00	2023-03-13 01:58:40.928414+00		\N
2	pbkdf2_sha256$320000$t8XT5lHnUb2dAgs85PVclw$xgmndpUhzKwCheBo54g87f7OlYzz+/Duk4OpfJyXXAQ=	2024-08-20 07:12:17.813564+00	f	nandan@skyline.net.id	Nandan	Ramdani	087865022330	f	t	2023-03-13 04:17:21.643138+00	2024-08-20 02:09:52.574792+00	Bandung	1
3	pbkdf2_sha256$320000$t8XT5lHnUb2dAgs85PVclw$xgmndpUhzKwCheBo54g87f7OlYzz+/Duk4OpfJyXXAQ=	2024-08-20 07:13:07.989089+00	t	admin@gmail.com	admin	admin	0852123456789	t	t	2024-08-19 05:15:19.340729+00	2024-08-19 05:15:19.340768+00		\N
\.


--
-- TOC entry 3874 (class 0 OID 22260)
-- Dependencies: 276
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- TOC entry 3877 (class 0 OID 22265)
-- Dependencies: 279
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- TOC entry 3879 (class 0 OID 22269)
-- Dependencies: 281
-- Data for Name: users_usergroup; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.users_usergroup (id, name, created_at, updated_at) FROM stdin;
1	SUMEDANG	2023-03-13 04:16:07.446188+00	2023-03-13 04:16:07.446201+00
2	SMKN1	2024-02-28 04:58:32.542196+00	2024-02-28 04:58:32.542212+00
\.


--
-- TOC entry 3881 (class 0 OID 22273)
-- Dependencies: 283
-- Data for Name: vouchers_package; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.vouchers_package (id, name, ext_id, price, commision, is_fixed_rate, percentage_commision, extra_values, is_enabled, server_id, is_synced) FROM stdin;
15	Paket 2 Jam	60	2000.00	0.00	f	0.00	{"id": 60, "name": "Paket 2 Jam", "owner": "demo1 (root -> demo1)", "available_to_siblings": false, "profile_components": [{"id": 59, "username": "Paket 2 Jam", "groupname": "SimpleAdd_60", "priority": 5}], "data_cap_in_profile": false, "time_cap_in_profile": true, "notes": false, "update": true, "delete": true}	t	1	t
13	Paket 3 Jam	59	5000.00	1150.00	f	23.00	{"id": 59, "name": "Paket 3 Jam", "owner": "demo1 (root -> demo1)", "available_to_siblings": false, "profile_components": [{"id": 58, "username": "Paket 3 Jam", "groupname": "SimpleAdd_59", "priority": 5}], "data_cap_in_profile": false, "time_cap_in_profile": true, "notes": false, "update": true, "delete": true}	t	1	t
16	Paket 5 Jam	61	1000.00	0.00	f	0.00	{"id": 61, "name": "Paket 5 Jam", "owner": "demo1 (root -> demo1)", "available_to_siblings": false, "profile_components": [{"id": 60, "username": "Paket 5 Jam", "groupname": "SimpleAdd_61", "priority": 5}], "data_cap_in_profile": false, "time_cap_in_profile": true, "notes": false, "update": true, "delete": true}	t	1	t
\.


--
-- TOC entry 3882 (class 0 OID 22278)
-- Dependencies: 284
-- Data for Name: vouchers_package_groups; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.vouchers_package_groups (id, package_id, usergroup_id) FROM stdin;
1	13	1
3	13	2
4	15	2
5	15	1
\.


--
-- TOC entry 3885 (class 0 OID 22283)
-- Dependencies: 287
-- Data for Name: vouchers_server; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.vouchers_server (id, name, endpoint, username, password, realm_id, accesshash, portal_url, enabled, created_at, updated_at) FROM stdin;
1	rd-1	http://172.16.17.88/cake3/rd_cake	45	b4c6ac81-8c7c-4802-b50a-0a6380555b50	1	http://192.168.1.1:8002/index.php?zone=hercules&redirurl=https://skyline.net.id	http://192.168.1.1:8002	t	2023-03-13 04:15:21.430324+00	2023-03-13 04:15:21.430341+00
\.


--
-- TOC entry 3887 (class 0 OID 22289)
-- Dependencies: 289
-- Data for Name: vouchers_servergroup; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.vouchers_servergroup (id, name, created_at, updated_at, server_id) FROM stdin;
1	SUMEDANG	2023-03-13 04:16:19.310498+00	2024-02-28 05:00:16.790953+00	1
\.


--
-- TOC entry 3888 (class 0 OID 22292)
-- Dependencies: 290
-- Data for Name: vouchers_servergroup_client_group; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.vouchers_servergroup_client_group (id, servergroup_id, usergroup_id) FROM stdin;
1	1	1
2	1	2
\.


--
-- TOC entry 3891 (class 0 OID 22297)
-- Dependencies: 293
-- Data for Name: vouchers_voucher; Type: TABLE DATA; Schema: public; Owner: root
--

COPY public.vouchers_voucher (id, name, password, ext_id, status, created_at, updated_at, extra_fields, owner_id, package_id, sold) FROM stdin;
23	Z1QN2S	Z1QN2S	1129	0	2024-02-28 03:25:31.515887+00	2024-02-28 03:25:31.515909+00	{"id": 1129, "name": "Z1QN2S", "batch": null, "created": "2024-02-28 03:25:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
24	N2QJD6	N2QJD6	1130	0	2024-02-28 04:12:40.281606+00	2024-02-28 04:12:40.281628+00	{"id": 1130, "name": "N2QJD6", "batch": null, "created": "2024-02-28 04:12:40", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
27	RKIOVQ	RKIOVQ	1133	0	2024-02-28 04:13:41.08669+00	2024-02-28 04:13:41.086699+00	{"id": 1133, "name": "RKIOVQ", "batch": null, "created": "2024-02-28 04:13:41", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
29	9PA56M	9PA56M	1135	0	2024-02-28 04:13:41.086785+00	2024-02-28 04:13:41.086794+00	{"id": 1135, "name": "9PA56M", "batch": null, "created": "2024-02-28 04:13:41", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
30	T0DGKV	T0DGKV	1136	0	2024-02-28 04:27:28.066363+00	2024-02-28 04:27:28.066384+00	{"id": 1136, "name": "T0DGKV", "batch": null, "created": "2024-02-28 04:27:28", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
31	D9NGM4	D9NGM4	1137	0	2024-02-28 04:27:28.06641+00	2024-02-28 04:27:28.066417+00	{"id": 1137, "name": "D9NGM4", "batch": null, "created": "2024-02-28 04:27:28", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
32	9O4RZ2	9O4RZ2	1138	0	2024-02-28 04:31:05.526364+00	2024-02-28 04:31:05.526387+00	{"id": 1138, "name": "9O4RZ2", "batch": null, "created": "2024-02-28 04:31:05", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
33	0CKP3U	0CKP3U	1139	0	2024-02-28 04:31:05.526414+00	2024-02-28 04:31:05.52642+00	{"id": 1139, "name": "0CKP3U", "batch": null, "created": "2024-02-28 04:31:05", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
34	6YFEMW	6YFEMW	1140	0	2024-02-28 04:31:05.526442+00	2024-02-28 04:31:05.526447+00	{"id": 1140, "name": "6YFEMW", "batch": null, "created": "2024-02-28 04:31:05", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
35	KR1T63	KR1T63	1141	0	2024-02-28 04:31:05.526467+00	2024-02-28 04:31:05.526473+00	{"id": 1141, "name": "KR1T63", "batch": null, "created": "2024-02-28 04:31:05", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
36	FO0YU8	FO0YU8	1142	0	2024-02-28 04:31:05.526492+00	2024-02-28 04:31:05.526498+00	{"id": 1142, "name": "FO0YU8", "batch": null, "created": "2024-02-28 04:31:05", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
37	0PKQDV	0PKQDV	1143	0	2024-02-29 04:31:31.859556+00	2024-02-29 04:31:31.85959+00	{"id": 1143, "name": "0PKQDV", "batch": null, "created": "2024-02-29 04:31:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	2	15	f
39	MLJHB0	MLJHB0	1145	0	2024-03-07 08:22:31.302703+00	2024-03-07 08:22:31.302741+00	{"id": 1145, "name": "MLJHB0", "batch": null, "created": "2024-03-07 08:22:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	1	15	f
40	D5LWG7	D5LWG7	1146	0	2024-03-07 08:22:31.30279+00	2024-03-07 08:22:31.3028+00	{"id": 1146, "name": "D5LWG7", "batch": null, "created": "2024-03-07 08:22:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	1	15	f
41	AKP38R	AKP38R	1147	0	2024-03-07 08:22:31.302845+00	2024-03-07 08:22:31.302855+00	{"id": 1147, "name": "AKP38R", "batch": null, "created": "2024-03-07 08:22:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	1	15	f
42	L6O7IQ	L6O7IQ	1148	0	2024-03-07 08:22:31.302893+00	2024-03-07 08:22:31.302906+00	{"id": 1148, "name": "L6O7IQ", "batch": null, "created": "2024-03-07 08:22:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	1	15	f
43	3S1BCQ	3S1BCQ	1149	0	2024-03-07 08:22:31.302943+00	2024-03-07 08:22:31.302951+00	{"id": 1149, "name": "3S1BCQ", "batch": null, "created": "2024-03-07 08:22:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	1	15	f
44	K4UWNY	K4UWNY	1150	0	2024-03-07 08:22:31.302994+00	2024-03-07 08:22:31.303002+00	{"id": 1150, "name": "K4UWNY", "batch": null, "created": "2024-03-07 08:22:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	1	15	f
38	2BZRT6	2BZRT6	1144	0	2024-02-29 04:56:33.48335+00	2024-02-29 04:56:33.483369+00	{"id": 1144, "name": "2BZRT6", "batch": null, "created": "2024-02-29 04:56:33", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	2	13	f
25	KOPBXD	KOPBXD	1131	0	2024-02-28 04:13:01.856225+00	2024-02-28 04:13:01.85624+00	{"id": 1131, "name": "KOPBXD", "batch": null, "created": "2024-02-28 04:13:01", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
48	M7TBOQ	M7TBOQ	1154	1	2024-03-07 08:22:31.303187+00	2024-08-19 09:36:36.069617+00	{"id": 1154, "name": "M7TBOQ", "batch": null, "created": "2024-03-07 08:22:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	1	15	t
46	WZQALM	WZQALM	1152	0	2024-03-07 08:22:31.303089+00	2024-03-07 08:22:31.3031+00	{"id": 1152, "name": "WZQALM", "batch": null, "created": "2024-03-07 08:22:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	1	15	f
47	I2LDKW	I2LDKW	1153	0	2024-03-07 08:22:31.303136+00	2024-03-07 08:22:31.303146+00	{"id": 1153, "name": "I2LDKW", "batch": null, "created": "2024-03-07 08:22:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	1	15	f
45	3XDYGP	3XDYGP	1151	0	2024-03-07 08:22:31.303042+00	2024-03-07 08:22:31.303052+00	{"id": 1151, "name": "3XDYGP", "batch": null, "created": "2024-03-07 08:22:31", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	1	15	t
28	WIGVHN	WIGVHN	1134	0	2024-02-28 04:13:41.086738+00	2024-02-28 04:13:41.086747+00	{"id": 1134, "name": "WIGVHN", "batch": null, "created": "2024-02-28 04:13:41", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	t
26	EFMAIP	EFMAIP	1132	0	2024-02-28 04:13:41.086618+00	2024-02-28 04:13:41.086645+00	{"id": 1132, "name": "EFMAIP", "batch": null, "created": "2024-02-28 04:13:41", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 3 Jam", "profile_id": 59, "expire": null, "time_valid": ""}	1	13	f
49	9WVZAB	9WVZAB	1155	1	2024-03-07 08:23:35.120636+00	2024-08-19 09:36:36.085543+00	{"id": 1155, "name": "9WVZAB", "batch": null, "created": "2024-03-07 08:23:35", "extra_name": "", "extra_value": "", "realm": "Demo1", "realm_id": 1, "profile": "Paket 2 Jam", "profile_id": 60, "expire": null, "time_valid": ""}	2	15	t
\.


--
-- TOC entry 3939 (class 0 OID 0)
-- Dependencies: 216
-- Name: auditlog_logentry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auditlog_logentry_id_seq', 161, true);


--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 218
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3941 (class 0 OID 0)
-- Dependencies: 220
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3942 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 132, true);


--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 224
-- Name: axes_accessattempt_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.axes_accessattempt_id_seq', 8, true);


--
-- TOC entry 3944 (class 0 OID 0)
-- Dependencies: 226
-- Name: axes_accessfailurelog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.axes_accessfailurelog_id_seq', 1, false);


--
-- TOC entry 3945 (class 0 OID 0)
-- Dependencies: 228
-- Name: axes_accesslog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.axes_accesslog_id_seq', 28, true);


--
-- TOC entry 3946 (class 0 OID 0)
-- Dependencies: 230
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 8, true);


--
-- TOC entry 3947 (class 0 OID 0)
-- Dependencies: 232
-- Name: django_celery_beat_clockedschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_celery_beat_clockedschedule_id_seq', 1, false);


--
-- TOC entry 3948 (class 0 OID 0)
-- Dependencies: 234
-- Name: django_celery_beat_crontabschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_celery_beat_crontabschedule_id_seq', 1, false);


--
-- TOC entry 3949 (class 0 OID 0)
-- Dependencies: 236
-- Name: django_celery_beat_intervalschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_celery_beat_intervalschedule_id_seq', 1, false);


--
-- TOC entry 3950 (class 0 OID 0)
-- Dependencies: 238
-- Name: django_celery_beat_periodictask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_celery_beat_periodictask_id_seq', 1, false);


--
-- TOC entry 3951 (class 0 OID 0)
-- Dependencies: 241
-- Name: django_celery_beat_solarschedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_celery_beat_solarschedule_id_seq', 1, false);


--
-- TOC entry 3952 (class 0 OID 0)
-- Dependencies: 243
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 33, true);


--
-- TOC entry 3953 (class 0 OID 0)
-- Dependencies: 245
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 88, true);


--
-- TOC entry 3954 (class 0 OID 0)
-- Dependencies: 248
-- Name: invoices_invoice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.invoices_invoice_id_seq', 4, true);


--
-- TOC entry 3955 (class 0 OID 0)
-- Dependencies: 250
-- Name: invoices_invoicecommission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.invoices_invoicecommission_id_seq', 4, true);


--
-- TOC entry 3956 (class 0 OID 0)
-- Dependencies: 252
-- Name: invoices_invoiceitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.invoices_invoiceitem_id_seq', 26, true);


--
-- TOC entry 3957 (class 0 OID 0)
-- Dependencies: 254
-- Name: invoices_invoicepayment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.invoices_invoicepayment_id_seq', 1, false);


--
-- TOC entry 3958 (class 0 OID 0)
-- Dependencies: 256
-- Name: invoices_invoicestatus_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.invoices_invoicestatus_id_seq', 4, true);


--
-- TOC entry 3959 (class 0 OID 0)
-- Dependencies: 258
-- Name: invoices_invoicesummary_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.invoices_invoicesummary_id_seq', 4, true);


--
-- TOC entry 3960 (class 0 OID 0)
-- Dependencies: 260
-- Name: maildb_emailconfiguration_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.maildb_emailconfiguration_id_seq', 1, false);


--
-- TOC entry 3961 (class 0 OID 0)
-- Dependencies: 263
-- Name: news_feed_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.news_feed_groups_id_seq', 2, true);


--
-- TOC entry 3962 (class 0 OID 0)
-- Dependencies: 264
-- Name: news_feed_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.news_feed_id_seq', 1, true);


--
-- TOC entry 3963 (class 0 OID 0)
-- Dependencies: 266
-- Name: otp_email_emaildevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.otp_email_emaildevice_id_seq', 1, false);


--
-- TOC entry 3964 (class 0 OID 0)
-- Dependencies: 268
-- Name: otp_static_staticdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.otp_static_staticdevice_id_seq', 1, false);


--
-- TOC entry 3965 (class 0 OID 0)
-- Dependencies: 270
-- Name: otp_static_statictoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.otp_static_statictoken_id_seq', 1, false);


--
-- TOC entry 3966 (class 0 OID 0)
-- Dependencies: 272
-- Name: otp_totp_totpdevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.otp_totp_totpdevice_id_seq', 1, false);


--
-- TOC entry 3967 (class 0 OID 0)
-- Dependencies: 274
-- Name: two_factor_phonedevice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.two_factor_phonedevice_id_seq', 1, false);


--
-- TOC entry 3968 (class 0 OID 0)
-- Dependencies: 277
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- TOC entry 3969 (class 0 OID 0)
-- Dependencies: 278
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_user_id_seq', 3, true);


--
-- TOC entry 3970 (class 0 OID 0)
-- Dependencies: 280
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- TOC entry 3971 (class 0 OID 0)
-- Dependencies: 282
-- Name: users_usergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.users_usergroup_id_seq', 2, true);


--
-- TOC entry 3972 (class 0 OID 0)
-- Dependencies: 285
-- Name: vouchers_package_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.vouchers_package_group_id_seq', 5, true);


--
-- TOC entry 3973 (class 0 OID 0)
-- Dependencies: 286
-- Name: vouchers_package_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.vouchers_package_id_seq', 16, true);


--
-- TOC entry 3974 (class 0 OID 0)
-- Dependencies: 288
-- Name: vouchers_server_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.vouchers_server_id_seq', 1, true);


--
-- TOC entry 3975 (class 0 OID 0)
-- Dependencies: 291
-- Name: vouchers_servergroup_client_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.vouchers_servergroup_client_group_id_seq', 3, true);


--
-- TOC entry 3976 (class 0 OID 0)
-- Dependencies: 292
-- Name: vouchers_servergroup_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.vouchers_servergroup_id_seq', 3, true);


--
-- TOC entry 3977 (class 0 OID 0)
-- Dependencies: 294
-- Name: vouchers_voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('public.vouchers_voucher_id_seq', 49, true);


--
-- TOC entry 3460 (class 2606 OID 22343)
-- Name: auditlog_logentry auditlog_logentry_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auditlog_logentry
    ADD CONSTRAINT auditlog_logentry_pkey PRIMARY KEY (id);


--
-- TOC entry 3463 (class 2606 OID 22345)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 3468 (class 2606 OID 22347)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 3471 (class 2606 OID 22349)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3465 (class 2606 OID 22351)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3474 (class 2606 OID 22353)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 3476 (class 2606 OID 22355)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 3479 (class 2606 OID 22357)
-- Name: axes_accessattempt axes_accessattempt_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.axes_accessattempt
    ADD CONSTRAINT axes_accessattempt_pkey PRIMARY KEY (id);


--
-- TOC entry 3485 (class 2606 OID 22359)
-- Name: axes_accessattempt axes_accessattempt_username_ip_address_user_agent_8ea22282_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.axes_accessattempt
    ADD CONSTRAINT axes_accessattempt_username_ip_address_user_agent_8ea22282_uniq UNIQUE (username, ip_address, user_agent);


--
-- TOC entry 3488 (class 2606 OID 22361)
-- Name: axes_accessfailurelog axes_accessfailurelog_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.axes_accessfailurelog
    ADD CONSTRAINT axes_accessfailurelog_pkey PRIMARY KEY (id);


--
-- TOC entry 3495 (class 2606 OID 22363)
-- Name: axes_accesslog axes_accesslog_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.axes_accesslog
    ADD CONSTRAINT axes_accesslog_pkey PRIMARY KEY (id);


--
-- TOC entry 3502 (class 2606 OID 22365)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3505 (class 2606 OID 22367)
-- Name: django_celery_beat_clockedschedule django_celery_beat_clockedschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_clockedschedule
    ADD CONSTRAINT django_celery_beat_clockedschedule_pkey PRIMARY KEY (id);


--
-- TOC entry 3507 (class 2606 OID 22369)
-- Name: django_celery_beat_crontabschedule django_celery_beat_crontabschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_crontabschedule
    ADD CONSTRAINT django_celery_beat_crontabschedule_pkey PRIMARY KEY (id);


--
-- TOC entry 3509 (class 2606 OID 22371)
-- Name: django_celery_beat_intervalschedule django_celery_beat_intervalschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_intervalschedule
    ADD CONSTRAINT django_celery_beat_intervalschedule_pkey PRIMARY KEY (id);


--
-- TOC entry 3515 (class 2606 OID 22373)
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_name_key UNIQUE (name);


--
-- TOC entry 3517 (class 2606 OID 22375)
-- Name: django_celery_beat_periodictask django_celery_beat_periodictask_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_periodictask_pkey PRIMARY KEY (id);


--
-- TOC entry 3520 (class 2606 OID 22377)
-- Name: django_celery_beat_periodictasks django_celery_beat_periodictasks_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_periodictasks
    ADD CONSTRAINT django_celery_beat_periodictasks_pkey PRIMARY KEY (ident);


--
-- TOC entry 3522 (class 2606 OID 22379)
-- Name: django_celery_beat_solarschedule django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solar_event_latitude_longitude_ba64999a_uniq UNIQUE (event, latitude, longitude);


--
-- TOC entry 3524 (class 2606 OID 22381)
-- Name: django_celery_beat_solarschedule django_celery_beat_solarschedule_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_solarschedule
    ADD CONSTRAINT django_celery_beat_solarschedule_pkey PRIMARY KEY (id);


--
-- TOC entry 3526 (class 2606 OID 22383)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 3528 (class 2606 OID 22385)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 3530 (class 2606 OID 22387)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3533 (class 2606 OID 22389)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 3537 (class 2606 OID 22391)
-- Name: invoices_invoice invoices_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoice
    ADD CONSTRAINT invoices_invoice_pkey PRIMARY KEY (id);


--
-- TOC entry 3539 (class 2606 OID 22393)
-- Name: invoices_invoicecommission invoices_invoicecommission_invoice_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicecommission
    ADD CONSTRAINT invoices_invoicecommission_invoice_id_key UNIQUE (invoice_id);


--
-- TOC entry 3541 (class 2606 OID 22395)
-- Name: invoices_invoicecommission invoices_invoicecommission_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicecommission
    ADD CONSTRAINT invoices_invoicecommission_pkey PRIMARY KEY (id);


--
-- TOC entry 3544 (class 2606 OID 22397)
-- Name: invoices_invoiceitem invoices_invoiceitem_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoiceitem
    ADD CONSTRAINT invoices_invoiceitem_pkey PRIMARY KEY (id);


--
-- TOC entry 3547 (class 2606 OID 22399)
-- Name: invoices_invoicepayment invoices_invoicepayment_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicepayment
    ADD CONSTRAINT invoices_invoicepayment_pkey PRIMARY KEY (id);


--
-- TOC entry 3549 (class 2606 OID 22401)
-- Name: invoices_invoicestatus invoices_invoicestatus_invoice_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicestatus
    ADD CONSTRAINT invoices_invoicestatus_invoice_id_key UNIQUE (invoice_id);


--
-- TOC entry 3551 (class 2606 OID 22403)
-- Name: invoices_invoicestatus invoices_invoicestatus_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicestatus
    ADD CONSTRAINT invoices_invoicestatus_pkey PRIMARY KEY (id);


--
-- TOC entry 3553 (class 2606 OID 22405)
-- Name: invoices_invoicesummary invoices_invoicesummary_invoice_id_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicesummary
    ADD CONSTRAINT invoices_invoicesummary_invoice_id_key UNIQUE (invoice_id);


--
-- TOC entry 3555 (class 2606 OID 22407)
-- Name: invoices_invoicesummary invoices_invoicesummary_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicesummary
    ADD CONSTRAINT invoices_invoicesummary_pkey PRIMARY KEY (id);


--
-- TOC entry 3557 (class 2606 OID 22409)
-- Name: maildb_emailconfiguration maildb_emailconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.maildb_emailconfiguration
    ADD CONSTRAINT maildb_emailconfiguration_pkey PRIMARY KEY (id);


--
-- TOC entry 3562 (class 2606 OID 22411)
-- Name: news_feed_groups news_feed_groups_newsfeed_id_usergroup_id_96fb0730_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.news_feed_groups
    ADD CONSTRAINT news_feed_groups_newsfeed_id_usergroup_id_96fb0730_uniq UNIQUE (newsfeed_id, usergroup_id);


--
-- TOC entry 3564 (class 2606 OID 22413)
-- Name: news_feed_groups news_feed_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.news_feed_groups
    ADD CONSTRAINT news_feed_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3559 (class 2606 OID 22415)
-- Name: news_feed news_feed_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.news_feed
    ADD CONSTRAINT news_feed_pkey PRIMARY KEY (id);


--
-- TOC entry 3567 (class 2606 OID 22417)
-- Name: otp_email_emaildevice otp_email_emaildevice_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_email_emaildevice
    ADD CONSTRAINT otp_email_emaildevice_pkey PRIMARY KEY (id);


--
-- TOC entry 3570 (class 2606 OID 22419)
-- Name: otp_static_staticdevice otp_static_staticdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_static_staticdevice
    ADD CONSTRAINT otp_static_staticdevice_pkey PRIMARY KEY (id);


--
-- TOC entry 3574 (class 2606 OID 22421)
-- Name: otp_static_statictoken otp_static_statictoken_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_static_statictoken
    ADD CONSTRAINT otp_static_statictoken_pkey PRIMARY KEY (id);


--
-- TOC entry 3578 (class 2606 OID 22423)
-- Name: otp_totp_totpdevice otp_totp_totpdevice_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_totp_totpdevice
    ADD CONSTRAINT otp_totp_totpdevice_pkey PRIMARY KEY (id);


--
-- TOC entry 3581 (class 2606 OID 22425)
-- Name: two_factor_phonedevice two_factor_phonedevice_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.two_factor_phonedevice
    ADD CONSTRAINT two_factor_phonedevice_pkey PRIMARY KEY (id);


--
-- TOC entry 3585 (class 2606 OID 22427)
-- Name: users_user users_user_email_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_email_key UNIQUE (email);


--
-- TOC entry 3591 (class 2606 OID 22429)
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 3594 (class 2606 OID 22431)
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- TOC entry 3587 (class 2606 OID 22433)
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3597 (class 2606 OID 22435)
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3600 (class 2606 OID 22437)
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- TOC entry 3603 (class 2606 OID 22439)
-- Name: users_usergroup users_usergroup_name_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_usergroup
    ADD CONSTRAINT users_usergroup_name_key UNIQUE (name);


--
-- TOC entry 3605 (class 2606 OID 22441)
-- Name: users_usergroup users_usergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_usergroup
    ADD CONSTRAINT users_usergroup_pkey PRIMARY KEY (id);


--
-- TOC entry 3611 (class 2606 OID 22443)
-- Name: vouchers_package_groups vouchers_package_group_package_id_usergroup_id_98888e5d_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_package_groups
    ADD CONSTRAINT vouchers_package_group_package_id_usergroup_id_98888e5d_uniq UNIQUE (package_id, usergroup_id);


--
-- TOC entry 3613 (class 2606 OID 22445)
-- Name: vouchers_package_groups vouchers_package_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_package_groups
    ADD CONSTRAINT vouchers_package_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3607 (class 2606 OID 22447)
-- Name: vouchers_package vouchers_package_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_package
    ADD CONSTRAINT vouchers_package_pkey PRIMARY KEY (id);


--
-- TOC entry 3616 (class 2606 OID 22449)
-- Name: vouchers_server vouchers_server_endpoint_realm_id_37708e6b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_server
    ADD CONSTRAINT vouchers_server_endpoint_realm_id_37708e6b_uniq UNIQUE (endpoint, realm_id);


--
-- TOC entry 3618 (class 2606 OID 22451)
-- Name: vouchers_server vouchers_server_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_server
    ADD CONSTRAINT vouchers_server_pkey PRIMARY KEY (id);


--
-- TOC entry 3624 (class 2606 OID 22453)
-- Name: vouchers_servergroup_client_group vouchers_servergroup_cli_servergroup_id_usergroup_24ef611b_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_servergroup_client_group
    ADD CONSTRAINT vouchers_servergroup_cli_servergroup_id_usergroup_24ef611b_uniq UNIQUE (servergroup_id, usergroup_id);


--
-- TOC entry 3626 (class 2606 OID 22455)
-- Name: vouchers_servergroup_client_group vouchers_servergroup_client_group_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_servergroup_client_group
    ADD CONSTRAINT vouchers_servergroup_client_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3620 (class 2606 OID 22457)
-- Name: vouchers_servergroup vouchers_servergroup_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_servergroup
    ADD CONSTRAINT vouchers_servergroup_pkey PRIMARY KEY (id);


--
-- TOC entry 3622 (class 2606 OID 22459)
-- Name: vouchers_servergroup vouchers_servergroup_server_id_36605e02_uniq; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_servergroup
    ADD CONSTRAINT vouchers_servergroup_server_id_36605e02_uniq UNIQUE (server_id);


--
-- TOC entry 3632 (class 2606 OID 22461)
-- Name: vouchers_voucher vouchers_voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_voucher
    ADD CONSTRAINT vouchers_voucher_pkey PRIMARY KEY (id);


--
-- TOC entry 3453 (class 1259 OID 22462)
-- Name: auditlog_logentry_action_229afe39; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auditlog_logentry_action_229afe39 ON public.auditlog_logentry USING btree (action);


--
-- TOC entry 3454 (class 1259 OID 22463)
-- Name: auditlog_logentry_actor_id_959271d2; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auditlog_logentry_actor_id_959271d2 ON public.auditlog_logentry USING btree (actor_id);


--
-- TOC entry 3455 (class 1259 OID 22464)
-- Name: auditlog_logentry_content_type_id_75830218; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auditlog_logentry_content_type_id_75830218 ON public.auditlog_logentry USING btree (content_type_id);


--
-- TOC entry 3456 (class 1259 OID 22465)
-- Name: auditlog_logentry_object_id_09c2eee8; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auditlog_logentry_object_id_09c2eee8 ON public.auditlog_logentry USING btree (object_id);


--
-- TOC entry 3457 (class 1259 OID 22466)
-- Name: auditlog_logentry_object_pk_6e3219c0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auditlog_logentry_object_pk_6e3219c0 ON public.auditlog_logentry USING btree (object_pk);


--
-- TOC entry 3458 (class 1259 OID 22467)
-- Name: auditlog_logentry_object_pk_6e3219c0_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auditlog_logentry_object_pk_6e3219c0_like ON public.auditlog_logentry USING btree (object_pk varchar_pattern_ops);


--
-- TOC entry 3461 (class 1259 OID 22468)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 3466 (class 1259 OID 22469)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 3469 (class 1259 OID 22470)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 3472 (class 1259 OID 22471)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 3477 (class 1259 OID 22472)
-- Name: axes_accessattempt_ip_address_10922d9c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accessattempt_ip_address_10922d9c ON public.axes_accessattempt USING btree (ip_address);


--
-- TOC entry 3480 (class 1259 OID 22473)
-- Name: axes_accessattempt_user_agent_ad89678b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accessattempt_user_agent_ad89678b ON public.axes_accessattempt USING btree (user_agent);


--
-- TOC entry 3481 (class 1259 OID 22474)
-- Name: axes_accessattempt_user_agent_ad89678b_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accessattempt_user_agent_ad89678b_like ON public.axes_accessattempt USING btree (user_agent varchar_pattern_ops);


--
-- TOC entry 3482 (class 1259 OID 22475)
-- Name: axes_accessattempt_username_3f2d4ca0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accessattempt_username_3f2d4ca0 ON public.axes_accessattempt USING btree (username);


--
-- TOC entry 3483 (class 1259 OID 22476)
-- Name: axes_accessattempt_username_3f2d4ca0_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accessattempt_username_3f2d4ca0_like ON public.axes_accessattempt USING btree (username varchar_pattern_ops);


--
-- TOC entry 3486 (class 1259 OID 22477)
-- Name: axes_accessfailurelog_ip_address_2e9f5a7f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accessfailurelog_ip_address_2e9f5a7f ON public.axes_accessfailurelog USING btree (ip_address);


--
-- TOC entry 3489 (class 1259 OID 22478)
-- Name: axes_accessfailurelog_user_agent_ea145dda; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accessfailurelog_user_agent_ea145dda ON public.axes_accessfailurelog USING btree (user_agent);


--
-- TOC entry 3490 (class 1259 OID 22479)
-- Name: axes_accessfailurelog_user_agent_ea145dda_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accessfailurelog_user_agent_ea145dda_like ON public.axes_accessfailurelog USING btree (user_agent varchar_pattern_ops);


--
-- TOC entry 3491 (class 1259 OID 22480)
-- Name: axes_accessfailurelog_username_a8b7e8a4; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accessfailurelog_username_a8b7e8a4 ON public.axes_accessfailurelog USING btree (username);


--
-- TOC entry 3492 (class 1259 OID 22481)
-- Name: axes_accessfailurelog_username_a8b7e8a4_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accessfailurelog_username_a8b7e8a4_like ON public.axes_accessfailurelog USING btree (username varchar_pattern_ops);


--
-- TOC entry 3493 (class 1259 OID 22482)
-- Name: axes_accesslog_ip_address_86b417e5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accesslog_ip_address_86b417e5 ON public.axes_accesslog USING btree (ip_address);


--
-- TOC entry 3496 (class 1259 OID 22483)
-- Name: axes_accesslog_user_agent_0e659004; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accesslog_user_agent_0e659004 ON public.axes_accesslog USING btree (user_agent);


--
-- TOC entry 3497 (class 1259 OID 22484)
-- Name: axes_accesslog_user_agent_0e659004_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accesslog_user_agent_0e659004_like ON public.axes_accesslog USING btree (user_agent varchar_pattern_ops);


--
-- TOC entry 3498 (class 1259 OID 22485)
-- Name: axes_accesslog_username_df93064b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accesslog_username_df93064b ON public.axes_accesslog USING btree (username);


--
-- TOC entry 3499 (class 1259 OID 22486)
-- Name: axes_accesslog_username_df93064b_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX axes_accesslog_username_df93064b_like ON public.axes_accesslog USING btree (username varchar_pattern_ops);


--
-- TOC entry 3500 (class 1259 OID 22487)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 3503 (class 1259 OID 22488)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 3510 (class 1259 OID 22489)
-- Name: django_celery_beat_periodictask_clocked_id_47a69f82; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_celery_beat_periodictask_clocked_id_47a69f82 ON public.django_celery_beat_periodictask USING btree (clocked_id);


--
-- TOC entry 3511 (class 1259 OID 22490)
-- Name: django_celery_beat_periodictask_crontab_id_d3cba168; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_celery_beat_periodictask_crontab_id_d3cba168 ON public.django_celery_beat_periodictask USING btree (crontab_id);


--
-- TOC entry 3512 (class 1259 OID 22491)
-- Name: django_celery_beat_periodictask_interval_id_a8ca27da; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_celery_beat_periodictask_interval_id_a8ca27da ON public.django_celery_beat_periodictask USING btree (interval_id);


--
-- TOC entry 3513 (class 1259 OID 22492)
-- Name: django_celery_beat_periodictask_name_265a36b7_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_celery_beat_periodictask_name_265a36b7_like ON public.django_celery_beat_periodictask USING btree (name varchar_pattern_ops);


--
-- TOC entry 3518 (class 1259 OID 22493)
-- Name: django_celery_beat_periodictask_solar_id_a87ce72c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_celery_beat_periodictask_solar_id_a87ce72c ON public.django_celery_beat_periodictask USING btree (solar_id);


--
-- TOC entry 3531 (class 1259 OID 22494)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 3534 (class 1259 OID 22495)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 3535 (class 1259 OID 22496)
-- Name: invoices_invoice_client_id_b83ca539; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX invoices_invoice_client_id_b83ca539 ON public.invoices_invoice USING btree (client_id);


--
-- TOC entry 3542 (class 1259 OID 22497)
-- Name: invoices_invoiceitem_invoice_id_5ce05433; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX invoices_invoiceitem_invoice_id_5ce05433 ON public.invoices_invoiceitem USING btree (invoice_id);


--
-- TOC entry 3545 (class 1259 OID 22498)
-- Name: invoices_invoicepayment_invoice_id_2cade89c; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX invoices_invoicepayment_invoice_id_2cade89c ON public.invoices_invoicepayment USING btree (invoice_id);


--
-- TOC entry 3560 (class 1259 OID 22499)
-- Name: news_feed_groups_newsfeed_id_fe9af838; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX news_feed_groups_newsfeed_id_fe9af838 ON public.news_feed_groups USING btree (newsfeed_id);


--
-- TOC entry 3565 (class 1259 OID 22500)
-- Name: news_feed_groups_usergroup_id_6adf9fa0; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX news_feed_groups_usergroup_id_6adf9fa0 ON public.news_feed_groups USING btree (usergroup_id);


--
-- TOC entry 3568 (class 1259 OID 22501)
-- Name: otp_email_emaildevice_user_id_0215c274; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX otp_email_emaildevice_user_id_0215c274 ON public.otp_email_emaildevice USING btree (user_id);


--
-- TOC entry 3571 (class 1259 OID 22502)
-- Name: otp_static_staticdevice_user_id_7f9cff2b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX otp_static_staticdevice_user_id_7f9cff2b ON public.otp_static_staticdevice USING btree (user_id);


--
-- TOC entry 3572 (class 1259 OID 22503)
-- Name: otp_static_statictoken_device_id_74b7c7d1; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX otp_static_statictoken_device_id_74b7c7d1 ON public.otp_static_statictoken USING btree (device_id);


--
-- TOC entry 3575 (class 1259 OID 22504)
-- Name: otp_static_statictoken_token_d0a51866; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX otp_static_statictoken_token_d0a51866 ON public.otp_static_statictoken USING btree (token);


--
-- TOC entry 3576 (class 1259 OID 22505)
-- Name: otp_static_statictoken_token_d0a51866_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX otp_static_statictoken_token_d0a51866_like ON public.otp_static_statictoken USING btree (token varchar_pattern_ops);


--
-- TOC entry 3579 (class 1259 OID 22506)
-- Name: otp_totp_totpdevice_user_id_0fb18292; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX otp_totp_totpdevice_user_id_0fb18292 ON public.otp_totp_totpdevice USING btree (user_id);


--
-- TOC entry 3582 (class 1259 OID 22507)
-- Name: two_factor_phonedevice_user_id_54718003; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX two_factor_phonedevice_user_id_54718003 ON public.two_factor_phonedevice USING btree (user_id);


--
-- TOC entry 3583 (class 1259 OID 22508)
-- Name: users_user_email_243f6e77_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX users_user_email_243f6e77_like ON public.users_user USING btree (email varchar_pattern_ops);


--
-- TOC entry 3589 (class 1259 OID 22509)
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- TOC entry 3592 (class 1259 OID 22510)
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- TOC entry 3588 (class 1259 OID 22511)
-- Name: users_user_user_group_id_000c69ff; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX users_user_user_group_id_000c69ff ON public.users_user USING btree (user_group_id);


--
-- TOC entry 3595 (class 1259 OID 22512)
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- TOC entry 3598 (class 1259 OID 22513)
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- TOC entry 3601 (class 1259 OID 22514)
-- Name: users_usergroup_name_5fc66df0_like; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX users_usergroup_name_5fc66df0_like ON public.users_usergroup USING btree (name varchar_pattern_ops);


--
-- TOC entry 3609 (class 1259 OID 22515)
-- Name: vouchers_package_group_package_id_0680cd64; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX vouchers_package_group_package_id_0680cd64 ON public.vouchers_package_groups USING btree (package_id);


--
-- TOC entry 3614 (class 1259 OID 22516)
-- Name: vouchers_package_group_usergroup_id_630a41a5; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX vouchers_package_group_usergroup_id_630a41a5 ON public.vouchers_package_groups USING btree (usergroup_id);


--
-- TOC entry 3608 (class 1259 OID 22517)
-- Name: vouchers_package_server_id_1aa3362f; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX vouchers_package_server_id_1aa3362f ON public.vouchers_package USING btree (server_id);


--
-- TOC entry 3627 (class 1259 OID 22518)
-- Name: vouchers_servergroup_client_group_servergroup_id_7e2c275b; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX vouchers_servergroup_client_group_servergroup_id_7e2c275b ON public.vouchers_servergroup_client_group USING btree (servergroup_id);


--
-- TOC entry 3628 (class 1259 OID 22519)
-- Name: vouchers_servergroup_client_group_usergroup_id_75416991; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX vouchers_servergroup_client_group_usergroup_id_75416991 ON public.vouchers_servergroup_client_group USING btree (usergroup_id);


--
-- TOC entry 3629 (class 1259 OID 22520)
-- Name: vouchers_voucher_owner_id_bc9e2c18; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX vouchers_voucher_owner_id_bc9e2c18 ON public.vouchers_voucher USING btree (owner_id);


--
-- TOC entry 3630 (class 1259 OID 22521)
-- Name: vouchers_voucher_package_id_634a54e7; Type: INDEX; Schema: public; Owner: root
--

CREATE INDEX vouchers_voucher_package_id_634a54e7 ON public.vouchers_voucher USING btree (package_id);


--
-- TOC entry 3633 (class 2606 OID 22522)
-- Name: auditlog_logentry auditlog_logentry_actor_id_959271d2_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auditlog_logentry
    ADD CONSTRAINT auditlog_logentry_actor_id_959271d2_fk_users_user_id FOREIGN KEY (actor_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3634 (class 2606 OID 22527)
-- Name: auditlog_logentry auditlog_logentry_content_type_id_75830218_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auditlog_logentry
    ADD CONSTRAINT auditlog_logentry_content_type_id_75830218_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3635 (class 2606 OID 22532)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3636 (class 2606 OID 22537)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3637 (class 2606 OID 22542)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3638 (class 2606 OID 22547)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3639 (class 2606 OID 22552)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3640 (class 2606 OID 22557)
-- Name: django_celery_beat_periodictask django_celery_beat_p_clocked_id_47a69f82_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_clocked_id_47a69f82_fk_django_ce FOREIGN KEY (clocked_id) REFERENCES public.django_celery_beat_clockedschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3641 (class 2606 OID 22562)
-- Name: django_celery_beat_periodictask django_celery_beat_p_crontab_id_d3cba168_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_crontab_id_d3cba168_fk_django_ce FOREIGN KEY (crontab_id) REFERENCES public.django_celery_beat_crontabschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3642 (class 2606 OID 22567)
-- Name: django_celery_beat_periodictask django_celery_beat_p_interval_id_a8ca27da_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_interval_id_a8ca27da_fk_django_ce FOREIGN KEY (interval_id) REFERENCES public.django_celery_beat_intervalschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3643 (class 2606 OID 22572)
-- Name: django_celery_beat_periodictask django_celery_beat_p_solar_id_a87ce72c_fk_django_ce; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.django_celery_beat_periodictask
    ADD CONSTRAINT django_celery_beat_p_solar_id_a87ce72c_fk_django_ce FOREIGN KEY (solar_id) REFERENCES public.django_celery_beat_solarschedule(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3644 (class 2606 OID 22577)
-- Name: invoices_invoice invoices_invoice_client_id_b83ca539_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoice
    ADD CONSTRAINT invoices_invoice_client_id_b83ca539_fk_users_user_id FOREIGN KEY (client_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3645 (class 2606 OID 22582)
-- Name: invoices_invoicecommission invoices_invoicecomm_invoice_id_fcf4a16c_fk_invoices_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicecommission
    ADD CONSTRAINT invoices_invoicecomm_invoice_id_fcf4a16c_fk_invoices_ FOREIGN KEY (invoice_id) REFERENCES public.invoices_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3646 (class 2606 OID 22587)
-- Name: invoices_invoiceitem invoices_invoiceitem_invoice_id_5ce05433_fk_invoices_invoice_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoiceitem
    ADD CONSTRAINT invoices_invoiceitem_invoice_id_5ce05433_fk_invoices_invoice_id FOREIGN KEY (invoice_id) REFERENCES public.invoices_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3647 (class 2606 OID 22592)
-- Name: invoices_invoicepayment invoices_invoicepaym_invoice_id_2cade89c_fk_invoices_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicepayment
    ADD CONSTRAINT invoices_invoicepaym_invoice_id_2cade89c_fk_invoices_ FOREIGN KEY (invoice_id) REFERENCES public.invoices_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3648 (class 2606 OID 22597)
-- Name: invoices_invoicestatus invoices_invoicestat_invoice_id_cbffa76d_fk_invoices_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicestatus
    ADD CONSTRAINT invoices_invoicestat_invoice_id_cbffa76d_fk_invoices_ FOREIGN KEY (invoice_id) REFERENCES public.invoices_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3649 (class 2606 OID 22602)
-- Name: invoices_invoicesummary invoices_invoicesumm_invoice_id_71168f09_fk_invoices_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.invoices_invoicesummary
    ADD CONSTRAINT invoices_invoicesumm_invoice_id_71168f09_fk_invoices_ FOREIGN KEY (invoice_id) REFERENCES public.invoices_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3650 (class 2606 OID 22607)
-- Name: news_feed_groups news_feed_groups_newsfeed_id_fe9af838_fk_news_feed_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.news_feed_groups
    ADD CONSTRAINT news_feed_groups_newsfeed_id_fe9af838_fk_news_feed_id FOREIGN KEY (newsfeed_id) REFERENCES public.news_feed(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3651 (class 2606 OID 22612)
-- Name: news_feed_groups news_feed_groups_usergroup_id_6adf9fa0_fk_users_usergroup_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.news_feed_groups
    ADD CONSTRAINT news_feed_groups_usergroup_id_6adf9fa0_fk_users_usergroup_id FOREIGN KEY (usergroup_id) REFERENCES public.users_usergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3652 (class 2606 OID 22617)
-- Name: otp_email_emaildevice otp_email_emaildevice_user_id_0215c274_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_email_emaildevice
    ADD CONSTRAINT otp_email_emaildevice_user_id_0215c274_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3653 (class 2606 OID 22622)
-- Name: otp_static_staticdevice otp_static_staticdevice_user_id_7f9cff2b_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_static_staticdevice
    ADD CONSTRAINT otp_static_staticdevice_user_id_7f9cff2b_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3654 (class 2606 OID 22627)
-- Name: otp_static_statictoken otp_static_statictok_device_id_74b7c7d1_fk_otp_stati; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_static_statictoken
    ADD CONSTRAINT otp_static_statictok_device_id_74b7c7d1_fk_otp_stati FOREIGN KEY (device_id) REFERENCES public.otp_static_staticdevice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3655 (class 2606 OID 22632)
-- Name: otp_totp_totpdevice otp_totp_totpdevice_user_id_0fb18292_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.otp_totp_totpdevice
    ADD CONSTRAINT otp_totp_totpdevice_user_id_0fb18292_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3656 (class 2606 OID 22637)
-- Name: two_factor_phonedevice two_factor_phonedevice_user_id_54718003_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.two_factor_phonedevice
    ADD CONSTRAINT two_factor_phonedevice_user_id_54718003_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3658 (class 2606 OID 22642)
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3659 (class 2606 OID 22647)
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3657 (class 2606 OID 22652)
-- Name: users_user users_user_user_group_id_000c69ff_fk_users_usergroup_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_user_group_id_000c69ff_fk_users_usergroup_id FOREIGN KEY (user_group_id) REFERENCES public.users_usergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3660 (class 2606 OID 22657)
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3661 (class 2606 OID 22662)
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3663 (class 2606 OID 22667)
-- Name: vouchers_package_groups vouchers_package_gro_package_id_0680cd64_fk_vouchers_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_package_groups
    ADD CONSTRAINT vouchers_package_gro_package_id_0680cd64_fk_vouchers_ FOREIGN KEY (package_id) REFERENCES public.vouchers_package(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3664 (class 2606 OID 22672)
-- Name: vouchers_package_groups vouchers_package_gro_usergroup_id_630a41a5_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_package_groups
    ADD CONSTRAINT vouchers_package_gro_usergroup_id_630a41a5_fk_users_use FOREIGN KEY (usergroup_id) REFERENCES public.users_usergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3662 (class 2606 OID 22677)
-- Name: vouchers_package vouchers_package_server_id_1aa3362f_fk_vouchers_server_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_package
    ADD CONSTRAINT vouchers_package_server_id_1aa3362f_fk_vouchers_server_id FOREIGN KEY (server_id) REFERENCES public.vouchers_server(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3665 (class 2606 OID 22682)
-- Name: vouchers_servergroup vouchers_servergroup_server_id_36605e02_fk_vouchers_server_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_servergroup
    ADD CONSTRAINT vouchers_servergroup_server_id_36605e02_fk_vouchers_server_id FOREIGN KEY (server_id) REFERENCES public.vouchers_server(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3666 (class 2606 OID 22687)
-- Name: vouchers_servergroup_client_group vouchers_servergroup_servergroup_id_7e2c275b_fk_vouchers_; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_servergroup_client_group
    ADD CONSTRAINT vouchers_servergroup_servergroup_id_7e2c275b_fk_vouchers_ FOREIGN KEY (servergroup_id) REFERENCES public.vouchers_servergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3667 (class 2606 OID 22692)
-- Name: vouchers_servergroup_client_group vouchers_servergroup_usergroup_id_75416991_fk_users_use; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_servergroup_client_group
    ADD CONSTRAINT vouchers_servergroup_usergroup_id_75416991_fk_users_use FOREIGN KEY (usergroup_id) REFERENCES public.users_usergroup(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3668 (class 2606 OID 22697)
-- Name: vouchers_voucher vouchers_voucher_owner_id_bc9e2c18_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_voucher
    ADD CONSTRAINT vouchers_voucher_owner_id_bc9e2c18_fk_users_user_id FOREIGN KEY (owner_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3669 (class 2606 OID 22702)
-- Name: vouchers_voucher vouchers_voucher_package_id_634a54e7_fk_vouchers_package_id; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY public.vouchers_voucher
    ADD CONSTRAINT vouchers_voucher_package_id_634a54e7_fk_vouchers_package_id FOREIGN KEY (package_id) REFERENCES public.vouchers_package(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-08-24 23:57:15 WIB

--
-- PostgreSQL database dump complete
--

