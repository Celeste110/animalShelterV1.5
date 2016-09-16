--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: animal; Type: TABLE; Schema: public; Owner: katherine_celeste
--

CREATE TABLE animal (
    animal_id integer NOT NULL,
    animal_name character varying(20),
    animal_type_id integer NOT NULL,
    breed character varying(20),
    description character varying(100)
);


ALTER TABLE animal OWNER TO katherine_celeste;

--
-- Name: animal_animal_id_seq; Type: SEQUENCE; Schema: public; Owner: katherine_celeste
--

CREATE SEQUENCE animal_animal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE animal_animal_id_seq OWNER TO katherine_celeste;

--
-- Name: animal_animal_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: katherine_celeste
--

ALTER SEQUENCE animal_animal_id_seq OWNED BY animal.animal_id;


--
-- Name: animal_type; Type: TABLE; Schema: public; Owner: katherine_celeste
--

CREATE TABLE animal_type (
    animal_type_id integer NOT NULL,
    species character varying(30)
);


ALTER TABLE animal_type OWNER TO katherine_celeste;

--
-- Name: animal_type_animal_type_id_seq; Type: SEQUENCE; Schema: public; Owner: katherine_celeste
--

CREATE SEQUENCE animal_type_animal_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE animal_type_animal_type_id_seq OWNER TO katherine_celeste;

--
-- Name: animal_type_animal_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: katherine_celeste
--

ALTER SEQUENCE animal_type_animal_type_id_seq OWNED BY animal_type.animal_type_id;


--
-- Name: note; Type: TABLE; Schema: public; Owner: katherine_celeste
--

CREATE TABLE note (
    animal_id integer,
    note_text character varying(2000) NOT NULL,
    date_time date DEFAULT now() NOT NULL,
    note_id integer NOT NULL
);


ALTER TABLE note OWNER TO katherine_celeste;

--
-- Name: note_note_id_seq; Type: SEQUENCE; Schema: public; Owner: katherine_celeste
--

CREATE SEQUENCE note_note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE note_note_id_seq OWNER TO katherine_celeste;

--
-- Name: note_note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: katherine_celeste
--

ALTER SEQUENCE note_note_id_seq OWNED BY note.note_id;


--
-- Name: animal_id; Type: DEFAULT; Schema: public; Owner: katherine_celeste
--

ALTER TABLE ONLY animal ALTER COLUMN animal_id SET DEFAULT nextval('animal_animal_id_seq'::regclass);


--
-- Name: animal_type_id; Type: DEFAULT; Schema: public; Owner: katherine_celeste
--

ALTER TABLE ONLY animal_type ALTER COLUMN animal_type_id SET DEFAULT nextval('animal_type_animal_type_id_seq'::regclass);


--
-- Name: note_id; Type: DEFAULT; Schema: public; Owner: katherine_celeste
--

ALTER TABLE ONLY note ALTER COLUMN note_id SET DEFAULT nextval('note_note_id_seq'::regclass);


--
-- Data for Name: animal; Type: TABLE DATA; Schema: public; Owner: katherine_celeste
--

COPY animal (animal_id, animal_name, animal_type_id, breed, description) FROM stdin;
474	Mark	16		Fat and happy.
895	Kyle	14		meow
536	Arnold	14	Tabby	small and energetic
662	Sandy	14		cute
455	Molle	14		d
702	Zach	14	Tabby	adorable
744	Kitty-Kat	14		t
461	Chrissie	14	Tabby	Meow! I'm adorable
321	Julie	14	Tabby	h
5	Bob	14	Tabby	cute
6	Lovely Lucy	16	Tabby	Lovely!
11	w	14	w	w 
12	Chelsea	14	Tabby	Gorgeous!!! 
13	Chelsea	14	Tabby	Gorgeous!!! 
14	Chelsea	14	Tabby	Gorgeous!!! 
15	w	14	w	w 
16	w	14	w	w 
17	w	14	w	w 
18	w	14	w	w 
19	Mary	17	Parakeet	Fluffy 
20	Billy Bod	15	N/A	Likes grass 
21	Zilly	14	Tabby	Meow! She's adorable:D 
22	Zilly	14	Tabby	Meow! She's adorable:D 
23	Katherine Celeste	14	Tabby	Meow!!!! 
24	Jonathan	14	Tab	Be careful with this one... 
25	Laura	14	Tabby	Smart n' cunning 
\.


--
-- Name: animal_animal_id_seq; Type: SEQUENCE SET; Schema: public; Owner: katherine_celeste
--

SELECT pg_catalog.setval('animal_animal_id_seq', 25, true);


--
-- Data for Name: animal_type; Type: TABLE DATA; Schema: public; Owner: katherine_celeste
--

COPY animal_type (animal_type_id, species) FROM stdin;
14	cat
15	goat
16	dog
17	bird
18	frog
\.


--
-- Name: animal_type_animal_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: katherine_celeste
--

SELECT pg_catalog.setval('animal_type_animal_type_id_seq', 18, true);


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: katherine_celeste
--

COPY note (animal_id, note_text, date_time, note_id) FROM stdin;
455	in excellent health!	2016-09-03	10
702	healthy	2016-09-03	11
702	perfectly healthy	2016-09-03	12
321	healthy. No checkup required	2016-09-03	13
895	in perfect health	2016-09-03	14
474	in perfect health!	2016-09-04	15
321	Latest checkup reveals that she is in great health!	2016-09-06	17
6	A quick note to test....	2016-09-08	18
\.


--
-- Name: note_note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: katherine_celeste
--

SELECT pg_catalog.setval('note_note_id_seq', 18, true);


--
-- Name: animal_pkey; Type: CONSTRAINT; Schema: public; Owner: katherine_celeste
--

ALTER TABLE ONLY animal
    ADD CONSTRAINT animal_pkey PRIMARY KEY (animal_id);


--
-- Name: animal_type_pkey; Type: CONSTRAINT; Schema: public; Owner: katherine_celeste
--

ALTER TABLE ONLY animal_type
    ADD CONSTRAINT animal_type_pkey PRIMARY KEY (animal_type_id);


--
-- Name: note_note_id_pk; Type: CONSTRAINT; Schema: public; Owner: katherine_celeste
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_note_id_pk PRIMARY KEY (note_id);


--
-- Name: animal_animal_id_uindex; Type: INDEX; Schema: public; Owner: katherine_celeste
--

CREATE UNIQUE INDEX animal_animal_id_uindex ON animal USING btree (animal_id);


--
-- Name: animal_type_animal_type_id_uindex; Type: INDEX; Schema: public; Owner: katherine_celeste
--

CREATE UNIQUE INDEX animal_type_animal_type_id_uindex ON animal_type USING btree (animal_type_id);


--
-- Name: note_note_id_uindex; Type: INDEX; Schema: public; Owner: katherine_celeste
--

CREATE UNIQUE INDEX note_note_id_uindex ON note USING btree (note_id);


--
-- Name: animal_animal_type_animal_type_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: katherine_celeste
--

ALTER TABLE ONLY animal
    ADD CONSTRAINT animal_animal_type_animal_type_id_fk FOREIGN KEY (animal_type_id) REFERENCES animal_type(animal_type_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: note_animal_animal_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: katherine_celeste
--

ALTER TABLE ONLY note
    ADD CONSTRAINT note_animal_animal_id_fk FOREIGN KEY (animal_id) REFERENCES animal(animal_id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

