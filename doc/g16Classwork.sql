--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

DROP INDEX public.unique_schema_migrations;
ALTER TABLE ONLY public.testtypes DROP CONSTRAINT testtypes_pkey;
ALTER TABLE ONLY public.tests DROP CONSTRAINT tests_pkey;
ALTER TABLE ONLY public.test_events DROP CONSTRAINT test_events_pkey;
ALTER TABLE ONLY public.studenttests DROP CONSTRAINT studenttests_pkey;
ALTER TABLE ONLY public.studenttest_events DROP CONSTRAINT studenttest_events_pkey;
ALTER TABLE ONLY public.studentanswers DROP CONSTRAINT studentanswers_pkey;
ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
ALTER TABLE ONLY public.answers DROP CONSTRAINT answers_pkey;
ALTER TABLE public.testtypes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.tests ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.test_events ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.studenttests ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.studenttest_events ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.studentanswers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.questions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.answers ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.testtypes_id_seq;
DROP TABLE public.testtypes;
DROP SEQUENCE public.tests_id_seq;
DROP TABLE public.tests;
DROP SEQUENCE public.test_events_id_seq;
DROP TABLE public.test_events;
DROP SEQUENCE public.studenttests_id_seq;
DROP TABLE public.studenttests;
DROP SEQUENCE public.studenttest_events_id_seq;
DROP TABLE public.studenttest_events;
DROP SEQUENCE public.studentanswers_id_seq;
DROP TABLE public.studentanswers;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.questions_id_seq;
DROP TABLE public.questions;
DROP SEQUENCE public.answers_id_seq;
DROP TABLE public.answers;
DROP EXTENSION plpgsql;
DROP SCHEMA public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


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
-- Name: answers; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE answers (
    id integer NOT NULL,
    title text,
    points integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    question_id integer,
    "order" character varying(255) DEFAULT 'o'::character varying
);


ALTER TABLE public.answers OWNER TO tb;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: public; Owner: tb
--

CREATE SEQUENCE answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.answers_id_seq OWNER TO tb;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tb
--

ALTER SEQUENCE answers_id_seq OWNED BY answers.id;


--
-- Name: questions; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE questions (
    id integer NOT NULL,
    title text,
    category character varying(255),
    testtype_id integer,
    points integer DEFAULT 5,
    image character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "order" character varying(255) DEFAULT 'o'::character varying
);


ALTER TABLE public.questions OWNER TO tb;

--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: public; Owner: tb
--

CREATE SEQUENCE questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.questions_id_seq OWNER TO tb;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tb
--

ALTER SEQUENCE questions_id_seq OWNED BY questions.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO tb;

--
-- Name: studentanswers; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE studentanswers (
    id integer NOT NULL,
    question_id integer,
    studenttest_id integer,
    points integer DEFAULT 0,
    title character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.studentanswers OWNER TO tb;

--
-- Name: studentanswers_id_seq; Type: SEQUENCE; Schema: public; Owner: tb
--

CREATE SEQUENCE studentanswers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studentanswers_id_seq OWNER TO tb;

--
-- Name: studentanswers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tb
--

ALTER SEQUENCE studentanswers_id_seq OWNED BY studentanswers.id;


--
-- Name: studenttest_events; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE studenttest_events (
    id integer NOT NULL,
    state character varying(255),
    studenttest_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.studenttest_events OWNER TO tb;

--
-- Name: studenttest_events_id_seq; Type: SEQUENCE; Schema: public; Owner: tb
--

CREATE SEQUENCE studenttest_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studenttest_events_id_seq OWNER TO tb;

--
-- Name: studenttest_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tb
--

ALTER SEQUENCE studenttest_events_id_seq OWNED BY studenttest_events.id;


--
-- Name: studenttests; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE studenttests (
    id integer NOT NULL,
    test_id integer,
    student_id integer,
    start timestamp without time zone,
    "end" timestamp without time zone,
    points integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.studenttests OWNER TO tb;

--
-- Name: studenttests_id_seq; Type: SEQUENCE; Schema: public; Owner: tb
--

CREATE SEQUENCE studenttests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.studenttests_id_seq OWNER TO tb;

--
-- Name: studenttests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tb
--

ALTER SEQUENCE studenttests_id_seq OWNED BY studenttests.id;


--
-- Name: test_events; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE test_events (
    id integer NOT NULL,
    state character varying(255),
    test_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.test_events OWNER TO tb;

--
-- Name: test_events_id_seq; Type: SEQUENCE; Schema: public; Owner: tb
--

CREATE SEQUENCE test_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_events_id_seq OWNER TO tb;

--
-- Name: test_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tb
--

ALTER SEQUENCE test_events_id_seq OWNED BY test_events.id;


--
-- Name: tests; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE tests (
    id integer NOT NULL,
    title character varying(255),
    description character varying(255),
    category character varying(255),
    testtype_id integer,
    lecture_id integer,
    duration integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tests OWNER TO tb;

--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: public; Owner: tb
--

CREATE SEQUENCE tests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tests_id_seq OWNER TO tb;

--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tb
--

ALTER SEQUENCE tests_id_seq OWNED BY tests.id;


--
-- Name: testtypes; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE testtypes (
    id integer NOT NULL,
    coursetype character varying(255),
    title character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.testtypes OWNER TO tb;

--
-- Name: testtypes_id_seq; Type: SEQUENCE; Schema: public; Owner: tb
--

CREATE SEQUENCE testtypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.testtypes_id_seq OWNER TO tb;

--
-- Name: testtypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tb
--

ALTER SEQUENCE testtypes_id_seq OWNED BY testtypes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tb
--

ALTER TABLE ONLY answers ALTER COLUMN id SET DEFAULT nextval('answers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tb
--

ALTER TABLE ONLY questions ALTER COLUMN id SET DEFAULT nextval('questions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tb
--

ALTER TABLE ONLY studentanswers ALTER COLUMN id SET DEFAULT nextval('studentanswers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tb
--

ALTER TABLE ONLY studenttest_events ALTER COLUMN id SET DEFAULT nextval('studenttest_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tb
--

ALTER TABLE ONLY studenttests ALTER COLUMN id SET DEFAULT nextval('studenttests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tb
--

ALTER TABLE ONLY test_events ALTER COLUMN id SET DEFAULT nextval('test_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tb
--

ALTER TABLE ONLY tests ALTER COLUMN id SET DEFAULT nextval('tests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tb
--

ALTER TABLE ONLY testtypes ALTER COLUMN id SET DEFAULT nextval('testtypes_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY answers (id, title, points, created_at, updated_at, question_id, "order") FROM stdin;
1	mkdir versuch cd versuch touch datei echo "hallo Welt" > datei echo `less datei`	5	2014-02-09 12:23:59.350983	2014-02-09 12:23:59.350983	2	o
2	#!/bin/bash\r\nif grep "^$1" /etc/passwd\r\nthen\r\n\techo "User $1 existiert."\r\n\texit 0;\r\nfi\r\n\r\necho "User $1 existiert nicht."	5	2014-02-09 14:12:51.370658	2014-02-09 14:12:51.370658	9	o
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('answers_id_seq', 2, true);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY questions (id, title, category, testtype_id, points, image, created_at, updated_at, "order") FROM stdin;
2	Legen Sie im Homeverzeichnis des angemeldeten Benutzers das Verzeichnis classwork an, erstellen eine Datei 'versuch.txt', schreiben den Text 'Ich bin gut' hinein, lesen den Inhalt der Datei ein und geben diesen auf der Console aus. Nennen SIe die Datei: datei_neu.sh	Text	1	5	\N	2014-02-09 10:43:34.901248	2014-02-09 10:43:34.901248	o
1	Geben Sie den Inhalt des Verzeichnisses Dokumente des angemeldeten Benutzers auf der Console aus. Nennen Sie die Datei 'verzeichnis.sh'	Text	1	5	\N	2014-02-09 10:31:02.245716	2014-02-09 11:57:13.197696	o
4	Legen Sie eine Datei parameter.sh an. Wenn diese Datei aufgerufen wird, dann soll der Name der Datei und des 1. Parameters auf der Console ausgegeben werden. Rufen Sie die Datei anschließend mit: './paramter.sh DiesIstEinVersuch' auf	Text	1	5	\N	2014-02-09 12:40:45.976074	2014-02-09 12:40:45.976074	o
5	Das Skript verzeichnis_exists.sh testet ob das Verzeichnis 'NewDir'  im aktuellen Home-Verzeichnis des Users existiert. Ist dies nicht der Fall, so wird dieses Verzeichnis angelegt. Existiert es bereits, gibt es den Namen des Verzeichnisses auf der Konsole aus.	Text	1	10	\N	2014-02-09 13:32:13.011013	2014-02-09 13:32:13.011013	o
6	Das Skript dateien_anlegen.sh in den Ordner 'NewDir'. Es schaut nach, ob dort die Dateien datei1.txt und datei2.txt existiert. Falls die Dateien existieren werden Sie gemeinsam, also mit einem Befehl gelöscht. In die neuerstellte Datei datei1.txt wird mit Hilfe einer while-schleife 30 mal die Zeichenfolge 'Achtung, Achtung, wilder Affe trampelt alles nieder.'	Text	1	10	\N	2014-02-09 13:34:17.071033	2014-02-09 13:38:45.484561	o
7	Das Programm 'systemzeit.sh' schreibt die  Systemzeit und die auf dem Rechner angemeldeten Benutzer in die Ausgabe.	Text	1	5	\N	2014-02-09 13:41:00.814199	2014-02-09 13:41:00.814199	o
8	Schreiben Sie ein Shellskript 'pseudocode.sh', das den größten gemeinsamen Teiler (GGT) zweier\r\nganzzahliger Argumente berechnet und ausgibt. Nutzen Sie den Pseudocode:\r\n     GGT(a,b)\r\n     Wenn a = 0\r\n         Dann gebe b aus\r\n         Sonst solange b <> 0\r\n                   Wenn a > b\r\n                           Dann a = a – b\r\n                           Sonst b = b - a\r\n     Gebe a aus	Text	1	10	\N	2014-02-09 13:43:50.708277	2014-02-09 13:49:03.188089	o
9	Überprüfen Sie mit dem Skript 'exists_user.sh', ob der Benutzer 'theo' auf ihrem System existiert. Falls ja soll die ID des Users ausgegeben werden, falls nein soll das Skript mit der Fehlermeldung: 'User existiert nicht' terminieren.	Multiplechoice	1	10	\N	2014-02-09 14:12:20.505371	2014-02-09 14:12:20.505371	o
10	Das Skript 'datum_speichern.sh' speichert das aktuelle Datum in der Form: '10.02.2014' in der Variable datum. Dann wird der Inhalt der Variablen auf der Console ausgegeben.	Text	1	5	\N	2014-02-09 14:37:57.248718	2014-02-09 14:37:57.248718	o
11	Ermitteln SIe die Anzahl der Dateien, die sich in dem Verzeichnis /etc befinden in der Variable datei_count. Skriptname datei_count.sh. 	Text	1	5	\N	2014-02-09 14:40:16.164066	2014-02-09 14:40:16.164066	o
12	Downloaden Sie die Datei mr-universum.txt von der Dokumentenseite. Geben SIe die Zeilen dieser Datei zeilenweise aus. Das Skript heißt: zeilen_ausgeben.sh	Text	1	10	\N	2014-02-09 14:42:47.88349	2014-02-09 14:52:31.715965	o
13	Nutzen Sie die Datei mr-universum. Das Skript mr_universum.sh sucht in dieser Datei mit dem Befehl grep nach dem Mr. Universum des Jahres 1976 und gibt ihn auf der Console aus.	Text	1	10	\N	2014-02-09 14:56:12.611659	2014-02-09 14:56:12.611659	o
14	Programmieren Sie einen kleinen Rechner. Das Bash-Skript 'rechner.sh' fordert den Benutzer auf nacheinander zwei Zahlen einzugeben. Sie überprüfen, ob der User tatsächlich Zahlen eingegeben hat. Dann multiplizieren Sie die Zahlen und geben das Ergebnis aus. Dananch wird der User wieder aufgefordert zwei Zahlen einzugeben. Das Programm läuft solange, bis der User 'exit' eingibt.	Text	1	10	\N	2014-02-09 16:37:14.790767	2014-02-09 16:37:14.790767	o
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('questions_id_seq', 14, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY schema_migrations (version) FROM stdin;
20140208054559
20140208055657
20140208060400
20140208061006
20140208061057
20140208061605
20140208063107
20140208063425
20140208163711
20140209121833
20140209124858
\.


--
-- Data for Name: studentanswers; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY studentanswers (id, question_id, studenttest_id, points, title, created_at, updated_at) FROM stdin;
\.


--
-- Name: studentanswers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('studentanswers_id_seq', 1, false);


--
-- Data for Name: studenttest_events; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY studenttest_events (id, state, studenttest_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: studenttest_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('studenttest_events_id_seq', 1, false);


--
-- Data for Name: studenttests; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY studenttests (id, test_id, student_id, start, "end", points, created_at, updated_at) FROM stdin;
\.


--
-- Name: studenttests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('studenttests_id_seq', 1, false);


--
-- Data for Name: test_events; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY test_events (id, state, test_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: test_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('test_events_id_seq', 1, false);


--
-- Data for Name: tests; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY tests (id, title, description, category, testtype_id, lecture_id, duration, created_at, updated_at) FROM stdin;
1	KuA FIT2AH BashSkripting	KuA FIT2AH BashSkripting	Text	1	\N	120	2014-02-10 10:45:31.219952	2014-02-10 10:45:31.219952
\.


--
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('tests_id_seq', 1, true);


--
-- Data for Name: testtypes; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY testtypes (id, coursetype, title, description, created_at, updated_at) FROM stdin;
1	Skripting	Aufgaben zum Bash-Skripting	Aufgaben zum Bash-Skripting	2014-02-09 10:28:44.060046	2014-02-09 17:50:28.8853
\.


--
-- Name: testtypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('testtypes_id_seq', 1, true);


--
-- Name: answers_pkey; Type: CONSTRAINT; Schema: public; Owner: tb; Tablespace: 
--

ALTER TABLE ONLY answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: questions_pkey; Type: CONSTRAINT; Schema: public; Owner: tb; Tablespace: 
--

ALTER TABLE ONLY questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: studentanswers_pkey; Type: CONSTRAINT; Schema: public; Owner: tb; Tablespace: 
--

ALTER TABLE ONLY studentanswers
    ADD CONSTRAINT studentanswers_pkey PRIMARY KEY (id);


--
-- Name: studenttest_events_pkey; Type: CONSTRAINT; Schema: public; Owner: tb; Tablespace: 
--

ALTER TABLE ONLY studenttest_events
    ADD CONSTRAINT studenttest_events_pkey PRIMARY KEY (id);


--
-- Name: studenttests_pkey; Type: CONSTRAINT; Schema: public; Owner: tb; Tablespace: 
--

ALTER TABLE ONLY studenttests
    ADD CONSTRAINT studenttests_pkey PRIMARY KEY (id);


--
-- Name: test_events_pkey; Type: CONSTRAINT; Schema: public; Owner: tb; Tablespace: 
--

ALTER TABLE ONLY test_events
    ADD CONSTRAINT test_events_pkey PRIMARY KEY (id);


--
-- Name: tests_pkey; Type: CONSTRAINT; Schema: public; Owner: tb; Tablespace: 
--

ALTER TABLE ONLY tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: testtypes_pkey; Type: CONSTRAINT; Schema: public; Owner: tb; Tablespace: 
--

ALTER TABLE ONLY testtypes
    ADD CONSTRAINT testtypes_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: tb; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


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

