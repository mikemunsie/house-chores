--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chores (
    id integer NOT NULL,
    "dueDate" timestamp without time zone,
    recurring boolean DEFAULT false NOT NULL,
    frequency integer,
    "frequencyRange" text,
    name text,
    description text
);


ALTER TABLE chores OWNER TO postgres;

--
-- Name: chores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE chores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chores_id_seq OWNER TO postgres;

--
-- Name: chores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE chores_id_seq OWNED BY chores.id;


--
-- Name: chores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chores ALTER COLUMN id SET DEFAULT nextval('chores_id_seq'::regclass);


--
-- Data for Name: chores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY chores (id, "dueDate", recurring, frequency, "frequencyRange", name, description) FROM stdin;
1	\N	t	1	week	First Chore	This is a chore homie.
\.


--
-- Name: chores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('chores_id_seq', 1, true);


--
-- Name: chores chores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chores
    ADD CONSTRAINT chores_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: chores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE chores (
    id integer NOT NULL,
    "dueDate" timestamp without time zone,
    recurring boolean DEFAULT false NOT NULL,
    frequency integer,
    "frequencyRange" text,
    name text,
    description text
);


ALTER TABLE chores OWNER TO postgres;

--
-- Name: chores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE chores_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE chores_id_seq OWNER TO postgres;

--
-- Name: chores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE chores_id_seq OWNED BY chores.id;


--
-- Name: completed_chores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE completed_chores (
    chore_id integer,
    "dateCompleted" timestamp without time zone DEFAULT now()
);


ALTER TABLE completed_chores OWNER TO postgres;

--
-- Name: chores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chores ALTER COLUMN id SET DEFAULT nextval('chores_id_seq'::regclass);


--
-- Data for Name: chores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY chores (id, "dueDate", recurring, frequency, "frequencyRange", name, description) FROM stdin;
1	\N	t	1	week	First Chore	This is a chore homie.
\.


--
-- Name: chores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('chores_id_seq', 1, true);


--
-- Data for Name: completed_chores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY completed_chores (chore_id, "dateCompleted") FROM stdin;
\.


--
-- Name: chores chores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY chores
    ADD CONSTRAINT chores_pkey PRIMARY KEY (id);


--
-- Name: completed_chores id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY completed_chores
    ADD CONSTRAINT id FOREIGN KEY (chore_id) REFERENCES chores(id);


--
-- PostgreSQL database dump complete
--

