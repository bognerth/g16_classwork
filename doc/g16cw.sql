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
ALTER TABLE ONLY public.classtests DROP CONSTRAINT tests_pkey;
ALTER TABLE ONLY public.classtest_events DROP CONSTRAINT test_events_pkey;
ALTER TABLE ONLY public.studenttests DROP CONSTRAINT studenttests_pkey;
ALTER TABLE ONLY public.studenttest_events DROP CONSTRAINT studenttest_events_pkey;
ALTER TABLE ONLY public.studentanswers DROP CONSTRAINT studentanswers_pkey;
ALTER TABLE ONLY public.questions DROP CONSTRAINT questions_pkey;
ALTER TABLE ONLY public.answers DROP CONSTRAINT answers_pkey;
ALTER TABLE public.testtypes ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.studenttests ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.studenttest_events ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.studentanswers ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.questions ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.classtests ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.classtest_events ALTER COLUMN id DROP DEFAULT;
ALTER TABLE public.answers ALTER COLUMN id DROP DEFAULT;
DROP SEQUENCE public.testtypes_id_seq;
DROP TABLE public.testtypes;
DROP SEQUENCE public.studenttests_id_seq;
DROP TABLE public.studenttests;
DROP SEQUENCE public.studenttest_events_id_seq;
DROP TABLE public.studenttest_events;
DROP SEQUENCE public.studentanswers_id_seq;
DROP TABLE public.studentanswers;
DROP TABLE public.schema_migrations;
DROP SEQUENCE public.questions_id_seq;
DROP TABLE public.questions;
DROP SEQUENCE public.classtests_id_seq;
DROP TABLE public.classtests;
DROP SEQUENCE public.classtest_events_id_seq;
DROP TABLE public.classtest_events;
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
-- Name: classtest_events; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE classtest_events (
    id integer NOT NULL,
    state character varying(255),
    classtest_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.classtest_events OWNER TO tb;

--
-- Name: classtest_events_id_seq; Type: SEQUENCE; Schema: public; Owner: tb
--

CREATE SEQUENCE classtest_events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classtest_events_id_seq OWNER TO tb;

--
-- Name: classtest_events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tb
--

ALTER SEQUENCE classtest_events_id_seq OWNED BY classtest_events.id;


--
-- Name: classtests; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE classtests (
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


ALTER TABLE public.classtests OWNER TO tb;

--
-- Name: classtests_id_seq; Type: SEQUENCE; Schema: public; Owner: tb
--

CREATE SEQUENCE classtests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.classtests_id_seq OWNER TO tb;

--
-- Name: classtests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tb
--

ALTER SEQUENCE classtests_id_seq OWNED BY classtests.id;


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
    "order" character varying(255) DEFAULT 'o'::character varying,
    help character varying(255)
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
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    answer_id integer,
    result text,
    selected boolean DEFAULT false
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
    classtest_id integer,
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
-- Name: testtypes; Type: TABLE; Schema: public; Owner: tb; Tablespace: 
--

CREATE TABLE testtypes (
    id integer NOT NULL,
    coursetype character varying(255),
    title character varying(255),
    description character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    test_avatar character varying(255),
    create_questions boolean DEFAULT false
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

ALTER TABLE ONLY classtest_events ALTER COLUMN id SET DEFAULT nextval('classtest_events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: tb
--

ALTER TABLE ONLY classtests ALTER COLUMN id SET DEFAULT nextval('classtests_id_seq'::regclass);


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

ALTER TABLE ONLY testtypes ALTER COLUMN id SET DEFAULT nextval('testtypes_id_seq'::regclass);


--
-- Data for Name: answers; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY answers (id, title, points, created_at, updated_at, question_id, "order") FROM stdin;
1	mkdir versuch cd versuch touch datei echo "hallo Welt" > datei echo `less datei`	5	2014-02-09 12:23:59.350983	2014-02-09 12:23:59.350983	2	o
2	#!/bin/bash\r\nif grep "^$1" /etc/passwd\r\nthen\r\n\techo "User $1 existiert."\r\n\texit 0;\r\nfi\r\n\r\necho "User $1 existiert nicht."	5	2014-02-09 14:12:51.370658	2014-02-09 14:12:51.370658	9	o
3	Verarbeitung von Daten gemaess einer Folge von automatisch ausgefuehrten Instruktionen\n	0	2014-02-15 10:31:44.892236	2014-02-15 10:31:44.892236	15	o
4	Programme erlauben Entscheidungen und Wiederholungen\n	0	2014-02-15 10:31:44.900116	2014-02-15 10:31:44.900116	15	o
5	Programme können geändert oder ausgetauscht werden\n	0	2014-02-15 10:31:44.905411	2014-02-15 10:31:44.905411	15	o
6	Benutzt X-Server zur Ausgabe\n	2	2014-02-15 10:31:44.910615	2014-02-15 10:31:44.910615	15	o
7	Ein- und Ausgabegeräte\n	0	2014-02-15 10:31:44.923378	2014-02-15 10:31:44.923378	16	o
8	Zentraleinheit und Peripherie\n	2	2014-02-15 10:31:44.930107	2014-02-15 10:31:44.930107	16	o
9	Eingabegeräte und Peripherie\n	0	2014-02-15 10:31:44.936815	2014-02-15 10:31:44.936815	16	o
10	Zentraleinheit und Ausgabegeräte\n	0	2014-02-15 10:31:44.943258	2014-02-15 10:31:44.943258	16	o
11	CPU\n	0	2014-02-15 10:31:44.956801	2014-02-15 10:31:44.956801	17	o
12	BIOS\n	0	2014-02-15 10:31:44.963228	2014-02-15 10:31:44.963228	17	o
13	Ausgabegeräte\n	2	2014-02-15 10:31:44.969667	2014-02-15 10:31:44.969667	17	o
14	Chipsatz\n	0	2014-02-15 10:31:44.976087	2014-02-15 10:31:44.976087	17	o
15	ADAM-Prinzip\n	0	2014-02-15 10:31:44.98972	2014-02-15 10:31:44.98972	18	o
16	EVA-Prinzip\n	2	2014-02-15 10:31:44.996299	2014-02-15 10:31:44.996299	18	o
17	NOAH-Prinzip\n	0	2014-02-15 10:31:45.003098	2014-02-15 10:31:45.003098	18	o
18	MOSES-Prinzip\n	0	2014-02-15 10:31:45.009845	2014-02-15 10:31:45.009845	18	o
19	TIMICS\n	0	2014-02-15 10:31:45.021655	2014-02-15 10:31:45.021655	19	o
20	MULTICS\n	2	2014-02-15 10:31:45.025394	2014-02-15 10:31:45.025394	19	o
21	COMPLICS\n	0	2014-02-15 10:31:45.029289	2014-02-15 10:31:45.029289	19	o
22	ULTRICS\n	0	2014-02-15 10:31:45.035166	2014-02-15 10:31:45.035166	19	o
23	Pascal\n	0	2014-02-15 10:31:45.04902	2014-02-15 10:31:45.04902	20	o
24	BASIC\n	0	2014-02-15 10:31:45.055569	2014-02-15 10:31:45.055569	20	o
25	C\n	2	2014-02-15 10:31:45.062089	2014-02-15 10:31:45.062089	20	o
26	SmallTalk\n	0	2014-02-15 10:31:45.068739	2014-02-15 10:31:45.068739	20	o
27	Massachusetts Institute of Technology\n	0	2014-02-15 10:31:45.082332	2014-02-15 10:31:45.082332	21	o
28	University of California, Berkely\n	2	2014-02-15 10:31:45.088871	2014-02-15 10:31:45.088871	21	o
29	University of Illinois\n	0	2014-02-15 10:31:45.095334	2014-02-15 10:31:45.095334	21	o
30	Harvard\n	0	2014-02-15 10:31:45.101944	2014-02-15 10:31:45.101944	21	o
31	Eine UNIX-Variante\n	0	2014-02-15 10:31:45.115299	2014-02-15 10:31:45.115299	22	o
32	Eine Programmiersprache\n	0	2014-02-15 10:31:45.12193	2014-02-15 10:31:45.12193	22	o
33	Der kleinste gemeinsame Nenner aller UNIX-Systeme\n	2	2014-02-15 10:31:45.128526	2014-02-15 10:31:45.128526	22	o
34	Eine jährliche UNIX-Entwicklerkonferenz in San Francisco\n	0	2014-02-15 10:31:45.134962	2014-02-15 10:31:45.134962	22	o
35	Windows\n	0	2014-02-15 10:31:45.148385	2014-02-15 10:31:45.148385	23	o
36	Linux\n	0	2014-02-15 10:31:45.155033	2014-02-15 10:31:45.155033	23	o
37	CP/M\n	2	2014-02-15 10:31:45.161676	2014-02-15 10:31:45.161676	23	o
38	MS-DOS\n	0	2014-02-15 10:31:45.168282	2014-02-15 10:31:45.168282	23	o
39	Graphical User Interface (Grafische Benutzeroberfläche)\n	2	2014-02-15 10:31:45.181923	2014-02-15 10:31:45.181923	24	o
40	Generic UNIX Interface (UNIX-Standard-Systemschnittstelle)\n	0	2014-02-15 10:31:45.188558	2014-02-15 10:31:45.188558	24	o
41	Globally Unique Identity (Weltweit einmalige Registriernummer)\n	0	2014-02-15 10:31:45.195173	2014-02-15 10:31:45.195173	24	o
42	Gate Undefined Issue (Sicherheitslücke in Betriebssystemen)\n	0	2014-02-15 10:31:45.201846	2014-02-15 10:31:45.201846	24	o
43	Georgia Newton University\n	0	2014-02-15 10:31:45.215468	2014-02-15 10:31:45.215468	25	o
44	GNU's Not UNIX\n	2	2014-02-15 10:31:45.222154	2014-02-15 10:31:45.222154	25	o
45	Graphical Network Usage\n	0	2014-02-15 10:31:45.228844	2014-02-15 10:31:45.228844	25	o
46	Global Networking Union\n	0	2014-02-15 10:31:45.23544	2014-02-15 10:31:45.23544	25	o
47	Monolithische Kernel sind schneller als Mikrokernel\n	0	2014-02-15 10:31:45.24923	2014-02-15 10:31:45.24923	26	o
48	Alle modernen Kernel sind Mikrokernel\n	0	2014-02-15 10:31:45.255887	2014-02-15 10:31:45.255887	26	o
49	Der Kernel führt die Prozess- und Speicherverwaltung durch\n	2	2014-02-15 10:31:45.262476	2014-02-15 10:31:45.262476	26	o
50	Der Kernel stellt die grafische Benutzeroberfläche bereit\n	0	2014-02-15 10:31:45.269159	2014-02-15 10:31:45.269159	26	o
51	Kontrolle des Bootvorgangs eines PCs über das Netzwerk\n	0	2014-02-15 10:31:45.282812	2014-02-15 10:31:45.282812	27	o
52	Installation eines Gerätetreibers\n	0	2014-02-15 10:31:45.289445	2014-02-15 10:31:45.289445	27	o
53	Im Hintergrund laufende Programme während des Bootvorgangs\n	0	2014-02-15 10:31:45.296127	2014-02-15 10:31:45.296127	27	o
54	Anderes Wort für das Booten des Betriebssystems\n	2	2014-02-15 10:31:45.302707	2014-02-15 10:31:45.302707	27	o
55	Es gibt vier verschiedene Betriebsmodi\n	0	2014-02-15 10:31:45.362332	2014-02-15 10:31:45.362332	28	o
56	Prozesse im Kernelmodus können jederzeit unterbrochen werden\n	0	2014-02-15 10:31:45.36815	2014-02-15 10:31:45.36815	28	o
57	Prozesse im Benutzermodus genießen einen stärkeren Zugriffsschutz\n	0	2014-02-15 10:31:45.374751	2014-02-15 10:31:45.374751	28	o
58	Prozesse im Kernelmodus haben Priorität\n	2	2014-02-15 10:31:45.381472	2014-02-15 10:31:45.381472	28	o
59	Offset\n	0	2014-02-15 10:31:45.395342	2014-02-15 10:31:45.395342	29	o
60	Page Directory\n	0	2014-02-15 10:31:45.402044	2014-02-15 10:31:45.402044	29	o
61	Page Table\n	0	2014-02-15 10:31:45.408732	2014-02-15 10:31:45.408732	29	o
62	Page File\n	2	2014-02-15 10:31:45.41523	2014-02-15 10:31:45.41523	29	o
71	das Systemverzeichnis\n	0	2014-02-15 10:31:45.49468	2014-02-15 10:31:45.49468	32	o
72	das Home-Verzeichnis des aktuellen Benutzers\n	2	2014-02-15 10:31:45.501266	2014-02-15 10:31:45.501266	32	o
73	das Wurzelverzeichnis\n	0	2014-02-15 10:31:45.507827	2014-02-15 10:31:45.507827	32	o
74	das Verzeichnis /usr/sbin\n	0	2014-02-15 10:31:45.514274	2014-02-15 10:31:45.514274	32	o
250	SMTP\n	0	2014-02-19 21:13:34.136265	2014-02-19 21:13:34.136265	78	o
251	TCP\n	0	2014-02-19 21:13:34.142845	2014-02-19 21:13:34.142845	78	o
252	IP\n	0	2014-02-19 21:13:34.1493	2014-02-19 21:13:34.1493	78	o
253	keines der genannten\n	0	2014-02-19 21:13:34.155668	2014-02-19 21:13:34.155668	78	o
254	ICMP\n	1	2014-02-19 21:13:34.169269	2014-02-19 21:13:34.169269	79	o
255	UDP\n	0	2014-02-19 21:13:34.175761	2014-02-19 21:13:34.175761	79	o
256	SMTP\n	0	2014-02-19 21:13:34.182125	2014-02-19 21:13:34.182125	79	o
257	TCP\n	0	2014-02-19 21:13:34.188513	2014-02-19 21:13:34.188513	79	o
258	keines der genannten\n	0	2014-02-19 21:13:34.194886	2014-02-19 21:13:34.194886	79	o
259	ICMP\n	0	2014-02-19 21:13:34.208434	2014-02-19 21:13:34.208434	80	o
260	UDP\n	0	2014-02-19 21:13:34.214848	2014-02-19 21:13:34.214848	80	o
261	TCP\n	1	2014-02-19 21:13:34.2213	2014-02-19 21:13:34.2213	80	o
262	IP\n	0	2014-02-19 21:13:34.227731	2014-02-19 21:13:34.227731	80	o
263	keines der genannten\n	0	2014-02-19 21:13:34.23408	2014-02-19 21:13:34.23408	80	o
264	ICMP\n	0	2014-02-19 21:13:34.247661	2014-02-19 21:13:34.247661	81	o
265	UDP\n	0	2014-02-19 21:13:34.254174	2014-02-19 21:13:34.254174	81	o
87	Ist auf der Hauptplatine des Computers gespeichert\n	0	2014-02-15 10:31:45.626561	2014-02-15 10:31:45.626561	36	o
88	Versetzt den Computer beim Einschalten in einen bestimmten Zustand\n	0	2014-02-15 10:31:45.633123	2014-02-15 10:31:45.633123	36	o
89	ermöglicht das Starten des Betriebssystems\n	0	2014-02-15 10:31:45.639544	2014-02-15 10:31:45.639544	36	o
90	alle Aussagen charakterisieren Firmware\n	2	2014-02-15 10:31:45.646065	2014-02-15 10:31:45.646065	36	o
91	hat eine grafische Bedienoberfläche\n	0	2014-02-15 10:31:45.659378	2014-02-15 10:31:45.659378	37	o
92	alles ist eine Datei \n	0	2014-02-15 10:31:45.66592	2014-02-15 10:31:45.66592	37	o
93	ermöglicht das gleichzeitige Arbeiten mehrerer Benutzer\n	2	2014-02-15 10:31:45.672406	2014-02-15 10:31:45.672406	37	o
94	ermöglicht vielen Benutzern das Arbeiten\n	0	2014-02-15 10:31:45.67896	2014-02-15 10:31:45.67896	37	o
95	Verwaltet die Ressourcen\n	0	2014-02-15 10:31:45.692327	2014-02-15 10:31:45.692327	38	o
96	Ermoeglicht grafischen Output\n	2	2014-02-15 10:31:45.698801	2014-02-15 10:31:45.698801	38	o
97	Sorgt dafür dass Programme gestartet und beendet werden können\n	0	2014-02-15 10:31:45.705295	2014-02-15 10:31:45.705295	38	o
98	Enthält eine Benutzerschnittstelle\n	0	2014-02-15 10:31:45.711789	2014-02-15 10:31:45.711789	38	o
99	Regelt die Netzwerkfähigkeit auf einer elementaren Ebene\n	0	2014-02-15 10:31:45.718235	2014-02-15 10:31:45.718235	38	o
100	Ken Thompson\n	0	2014-02-15 10:31:45.73152	2014-02-15 10:31:45.73152	39	o
101	Bill Gates\n	0	2014-02-15 10:31:45.738065	2014-02-15 10:31:45.738065	39	o
102	Steve Balmer\n	0	2014-02-15 10:31:45.744494	2014-02-15 10:31:45.744494	39	o
103	Linus Torvalds\n	2	2014-02-15 10:31:45.750917	2014-02-15 10:31:45.750917	39	o
104	1969\n	0	2014-02-15 10:31:45.764581	2014-02-15 10:31:45.764581	40	o
105	1970\n	0	2014-02-15 10:31:45.771002	2014-02-15 10:31:45.771002	40	o
106	1991\n	2	2014-02-15 10:31:45.777522	2014-02-15 10:31:45.777522	40	o
107	1993\n	0	2014-02-15 10:31:45.783995	2014-02-15 10:31:45.783995	40	o
108	Was man allgemein als Linux bezeichnet, ist nicht Linux, sondern der Linux-Kernel plus GNU?\n	0	2014-02-15 10:31:45.797204	2014-02-15 10:31:45.797204	41	o
109	Minux ist ein Unix-ähnliches Betriebssystem.\n	0	2014-02-15 10:31:45.803657	2014-02-15 10:31:45.803657	41	o
110	Shareware ist Open Source.\n	2	2014-02-15 10:31:45.810106	2014-02-15 10:31:45.810106	41	o
111	Linux basiert auf Unix.\n	0	2014-02-15 10:31:45.816537	2014-02-15 10:31:45.816537	41	o
112	DOS\n	0	2014-02-15 10:31:45.829736	2014-02-15 10:31:45.829736	42	o
113	Windows NT\n	0	2014-02-15 10:31:45.836223	2014-02-15 10:31:45.836223	42	o
114	Unix\n	2	2014-02-15 10:31:45.842604	2014-02-15 10:31:45.842604	42	o
115	Linux-Kernel\n	2	2014-02-15 10:31:45.855838	2014-02-15 10:31:45.855838	43	o
116	Linux als Ganzes\n	0	2014-02-15 10:31:45.862251	2014-02-15 10:31:45.862251	43	o
117	Unix\n	0	2014-02-15 10:31:45.868682	2014-02-15 10:31:45.868682	43	o
118	MS-DOS\n	0	2014-02-15 10:31:45.875046	2014-02-15 10:31:45.875046	43	o
119	Richard Stallman\n	0	2014-02-15 10:31:45.888268	2014-02-15 10:31:45.888268	44	o
120	Ken Thompson\n	2	2014-02-15 10:31:45.89471	2014-02-15 10:31:45.89471	44	o
121	Dennis M. Ritchie\n	0	2014-02-15 10:31:45.901092	2014-02-15 10:31:45.901092	44	o
122	Brian W. Kernighan\n	0	2014-02-15 10:31:45.907448	2014-02-15 10:31:45.907448	44	o
123	1969\n	2	2014-02-15 10:31:45.920673	2014-02-15 10:31:45.920673	45	o
124	1970\n	0	2014-02-15 10:31:45.927066	2014-02-15 10:31:45.927066	45	o
125	1991\n	0	2014-02-15 10:31:45.933468	2014-02-15 10:31:45.933468	45	o
126	1993\n	0	2014-02-15 10:31:45.939881	2014-02-15 10:31:45.939881	45	o
127	Der Beginn der Unix-Zeitzählung.\n	2	2014-02-15 10:31:45.953064	2014-02-15 10:31:45.953064	46	o
128	Der Tag der ersten Veröffentlichung eines Unix-Systems.\n	0	2014-02-15 10:31:45.959462	2014-02-15 10:31:45.959462	46	o
129	Die Zeit, in der der erste Linux-Kernel entwickelt wurde.\n	0	2014-02-15 10:31:45.965879	2014-02-15 10:31:45.965879	46	o
130	1. August 1969\n	0	2014-02-15 10:31:45.979129	2014-02-15 10:31:45.979129	47	o
131	1. Januar 1970\n	2	2014-02-15 10:31:45.985666	2014-02-15 10:31:45.985666	47	o
132	1. Januar 1969\n	0	2014-02-15 10:31:45.992159	2014-02-15 10:31:45.992159	47	o
133	1. Januar 1991\n	0	2014-02-15 10:31:45.99859	2014-02-15 10:31:45.99859	47	o
134	Von Anfang an\n	0	2014-02-15 10:31:46.012244	2014-02-15 10:31:46.012244	48	o
135	1999\n	0	2014-02-15 10:31:46.018828	2014-02-15 10:31:46.018828	48	o
136	1992\n	2	2014-02-15 10:31:46.025368	2014-02-15 10:31:46.025368	48	o
137	2003\n	0	2014-02-15 10:31:46.031935	2014-02-15 10:31:46.031935	48	o
138	klein aber fein\n	0	2014-02-15 10:31:46.045438	2014-02-15 10:31:46.045438	49	o
139	Programme sollten nach Möglichkeit kompativel zu Microsoft-Betriebssystemen sein\n	2	2014-02-15 10:31:46.05209	2014-02-15 10:31:46.05209	49	o
140	Portabilität ist wichtiger als Effizienz\n	0	2014-02-15 10:31:46.058618	2014-02-15 10:31:46.058618	49	o
141	Schweigen ist Gold\n	0	2014-02-15 10:31:46.06523	2014-02-15 10:31:46.06523	49	o
142	Jedes Programm ist ein Filter\n	0	2014-02-15 10:31:46.071868	2014-02-15 10:31:46.071868	49	o
143	die in menschenlesbarer Form vorliegt.\n	0	2014-02-15 10:31:46.085416	2014-02-15 10:31:46.085416	50	o
144	die beliebig oft kopiert, verbreitet und genutzt werden darf.\n	0	2014-02-15 10:31:46.091985	2014-02-15 10:31:46.091985	50	o
145	die zunächst kostenlos ist. Zahlen muss man, wenn die SW regelmäßig nutzt.\n	2	2014-02-15 10:31:46.098507	2014-02-15 10:31:46.098507	50	o
146	die verändert und in veränderter Form weitergegeben werden darf.\n	0	2014-02-15 10:31:46.105099	2014-02-15 10:31:46.105099	50	o
147	General Public License\n	0	2014-02-15 10:31:46.118606	2014-02-15 10:31:46.118606	51	o
148	Gnu is not Unix\n	2	2014-02-15 10:31:46.125291	2014-02-15 10:31:46.125291	51	o
149	Generally not Unix\n	0	2014-02-15 10:31:46.131808	2014-02-15 10:31:46.131808	51	o
150	Linux Torvalds\n	0	2014-02-15 10:31:46.145287	2014-02-15 10:31:46.145287	52	o
151	Richard Stallman gründete zusammen mit Linux Torvalds das GNU-Projekt\n	0	2014-02-15 10:31:46.151827	2014-02-15 10:31:46.151827	52	o
152	Richard Stallman\n	2	2014-02-15 10:31:46.158408	2014-02-15 10:31:46.158408	52	o
153	AT&T\n	0	2014-02-15 10:31:46.164883	2014-02-15 10:31:46.164883	52	o
154	der Open-Source-Bewegung\n	0	2014-02-15 10:31:46.178363	2014-02-15 10:31:46.178363	53	o
155	der Freie-Software-Bewegung\n	0	2014-02-15 10:31:46.184937	2014-02-15 10:31:46.184937	53	o
156	der Free Software Foundation\n	0	2014-02-15 10:31:46.191464	2014-02-15 10:31:46.191464	53	o
157	des GNU-Projektes\n	0	2014-02-15 10:31:46.198109	2014-02-15 10:31:46.198109	53	o
158	von Red Hat\n	2	2014-02-15 10:31:46.20468	2014-02-15 10:31:46.20468	53	o
159	Unics\n	2	2014-02-15 10:31:46.218301	2014-02-15 10:31:46.218301	54	o
160	Multics\n	0	2014-02-15 10:31:46.224879	2014-02-15 10:31:46.224879	54	o
161	DR-DOS\n	0	2014-02-15 10:31:46.231484	2014-02-15 10:31:46.231484	54	o
162	SINIX\n	0	2014-02-15 10:31:46.238043	2014-02-15 10:31:46.238043	54	o
163	Von Anfang an\n	0	2014-02-15 10:31:46.25156	2014-02-15 10:31:46.25156	55	o
164	1991\n	0	2014-02-15 10:31:46.258176	2014-02-15 10:31:46.258176	55	o
165	1992\n	2	2014-02-15 10:31:46.264727	2014-02-15 10:31:46.264727	55	o
166	2000\n	0	2014-02-15 10:31:46.271239	2014-02-15 10:31:46.271239	55	o
167	Linus Torvald\n	0	2014-02-15 10:31:46.28465	2014-02-15 10:31:46.28465	56	o
168	Andrew Tannenbaum\n	0	2014-02-15 10:31:46.291234	2014-02-15 10:31:46.291234	56	o
169	Dennis Ritchie\n	2	2014-02-15 10:31:46.297794	2014-02-15 10:31:46.297794	56	o
170	Richard Stallman\n	0	2014-02-15 10:31:46.304434	2014-02-15 10:31:46.304434	56	o
171	Linus Torvald\n	2	2014-02-15 10:31:46.347108	2014-02-15 10:31:46.347108	57	o
172	Andrew Tannenbaum\n	0	2014-02-15 10:31:46.350812	2014-02-15 10:31:46.350812	57	o
173	Dennis Ritchie\n	0	2014-02-15 10:31:46.354537	2014-02-15 10:31:46.354537	57	o
174	Richard Stallman\n	0	2014-02-15 10:31:46.358215	2014-02-15 10:31:46.358215	57	o
175	Linus Torvald\n	0	2014-02-15 10:31:46.366615	2014-02-15 10:31:46.366615	58	o
266	SMTP\n	0	2014-02-19 21:13:34.260582	2014-02-19 21:13:34.260582	81	o
267	TCP\n	1	2014-02-19 21:13:34.267168	2014-02-19 21:13:34.267168	81	o
268	IP\n	0	2014-02-19 21:13:34.273674	2014-02-19 21:13:34.273674	81	o
269	keines der genannten\n	0	2014-02-19 21:13:34.280098	2014-02-19 21:13:34.280098	81	o
176	Andrew Tannenbaum\n	2	2014-02-15 10:31:46.370841	2014-02-15 10:31:46.370841	58	o
177	Dennis Ritchie\n	0	2014-02-15 10:31:46.375419	2014-02-15 10:31:46.375419	58	o
178	Richard Stallman\n	0	2014-02-15 10:31:46.380033	2014-02-15 10:31:46.380033	58	o
179	Unix wurde von Andrew S. Tanenbaum an der Uni Amsterdam für Unterrichtszwecke geschrieben.\n	0	2014-02-15 10:31:46.389473	2014-02-15 10:31:46.389473	59	o
180	Unix wurde Ender der 70er von Studenten in Berkley auf die Vax transferiert.\n	0	2014-02-15 10:31:46.394073	2014-02-15 10:31:46.394073	59	o
181	Unix war ein HobbyProjekt von Ken Thompson und Dennis Ritchie, Entwickler bei den Bell Laboratories (AT&T).\n	2	2014-02-15 10:31:46.398657	2014-02-15 10:31:46.398657	59	o
182	Unix wurde als Terminalemulator fuer einen 386er PC entwickelt.\n	0	2014-02-15 10:31:46.403272	2014-02-15 10:31:46.403272	59	o
183	Keine der Aussagen trifft zu\n	0	2014-02-15 10:31:46.40795	2014-02-15 10:31:46.40795	59	o
184	Unix wurde von Andrew S. Tanenbaum an der Uni Amsterdam für Unterrichtszwecke geschrieben.\n	0	2014-02-15 10:31:46.417352	2014-02-15 10:31:46.417352	60	o
185	Unix wurde Ender der 70er von Studenten in Berkley auf die Vax transferiert.\n	2	2014-02-15 10:31:46.421991	2014-02-15 10:31:46.421991	60	o
186	Unix war ein HobbyProjekt von Ken Thompson und Dennis Ritchie, Entwickler bei den Bell Laboratories (AT&T).\n	0	2014-02-15 10:31:46.426563	2014-02-15 10:31:46.426563	60	o
187	Unix wurde als Terminalemulator fuer einen 386er PC entwickelt.\n	0	2014-02-15 10:31:46.431158	2014-02-15 10:31:46.431158	60	o
188	Keine der Aussagen trifft zu\n	0	2014-02-15 10:31:46.435776	2014-02-15 10:31:46.435776	60	o
189	Minix wurde von Andrew S. Tanenbaum an der Uni Amsterdam für Unterrichtszwecke geschrieben.\n	2	2014-02-15 10:31:46.44517	2014-02-15 10:31:46.44517	61	o
190	Minix wurde Ender der 70er von Studenten in Berkley auf die Vax transferiert.\n	0	2014-02-15 10:31:46.44981	2014-02-15 10:31:46.44981	61	o
191	Minix war ein HobbyProjekt von Ken Thompson und Dennis Ritchie, Entwickler bei den Bell Laboratories (AT&T).\n	0	2014-02-15 10:31:46.454378	2014-02-15 10:31:46.454378	61	o
192	Minix wurde als Terminalemulator fuer einen 386er PC entwickelt.\n	0	2014-02-15 10:31:46.458937	2014-02-15 10:31:46.458937	61	o
193	Keine der Aussagen trifft zu\n	0	2014-02-15 10:31:46.463514	2014-02-15 10:31:46.463514	61	o
194	Alles ist eine Datei, z.B. die PCI-Geräte des Computers in der Datei/proc/pci \n	0	2014-02-15 10:31:46.47303	2014-02-15 10:31:46.47303	62	o
195	Kleine, spezialisierte Programme.Ein Programm erledigt nur eine Aufgabe, aber die perfekt: less kann nur Ordnerinhalte anzeigen\n	2	2014-02-15 10:31:46.477627	2014-02-15 10:31:46.477627	62	o
196	Vermeidung von Redundanz: wenn ein Programm eine Aufgabe erfolgreich erledigt hat, gibt es keine Ausgabe: touch datei.\n	0	2014-02-15 10:31:46.482224	2014-02-15 10:31:46.482224	62	o
197	Der Urheber eines Werks hat als einziger das Verfügungsrecht über das Erzeugnis\n	0	2014-02-15 10:31:46.491615	2014-02-15 10:31:46.491615	63	o
198	Der Urheber ist verpflichtet \n	2	2014-02-15 10:31:46.496285	2014-02-15 10:31:46.496285	63	o
199	Software wurde nicht verkauft, sondern war Bestandteil der Hardware\n	2	2014-02-15 10:31:46.50564	2014-02-15 10:31:46.50564	64	o
200	Programme kopieren und zu tauschen war selbstverständlich\n	0	2014-02-15 10:31:46.510238	2014-02-15 10:31:46.510238	64	o
201	Software war unbezahlbar teuer\n	0	2014-02-15 10:31:46.514817	2014-02-15 10:31:46.514817	64	o
202	Software wurde in den 70ern und 80ern zur Ware\n	0	2014-02-15 10:31:46.524252	2014-02-15 10:31:46.524252	65	o
203	Der Quellcode des gekauften Produktes war nicht mehr einsehbar\n	0	2014-02-15 10:31:46.528907	2014-02-15 10:31:46.528907	65	o
204	Linus Torvald wollte Linux eine Basis in der Community geben\n	2	2014-02-15 10:31:46.533431	2014-02-15 10:31:46.533431	65	o
205	Richard M.Stallman wollte ein System implementieren, das auf der Kultur des Teilens basiert\n	0	2014-02-15 10:31:46.538027	2014-02-15 10:31:46.538027	65	o
206	das Programm muss für jeden beliebigen Zweck benutzt werden dürfen\n	0	2014-02-15 10:31:46.547423	2014-02-15 10:31:46.547423	66	o
207	der Quellcode muss einsehbar und veränderbar sein\n	0	2014-02-15 10:31:46.552083	2014-02-15 10:31:46.552083	66	o
208	die Arbeit des Programmierers soll geschützt werden\n	2	2014-02-15 10:31:46.556641	2014-02-15 10:31:46.556641	66	o
209	das veränderte Programm muss veröffentlicht und  weitergegeben werden können\n	0	2014-02-15 10:31:46.561243	2014-02-15 10:31:46.561243	66	o
210	Training\n	0	2014-02-15 10:31:46.570665	2014-02-15 10:31:46.570665	67	o
211	Dokumentation\n	0	2014-02-15 10:31:46.57523	2014-02-15 10:31:46.57523	67	o
212	Kundenspezifische Weiterentwicklung und Anpassung\n	0	2014-02-15 10:31:46.579876	2014-02-15 10:31:46.579876	67	o
213	Mit allen genannten Tätigkeiten kann eine Firma Geld verdienen\n	2	2014-02-15 10:31:46.584451	2014-02-15 10:31:46.584451	67	o
214	die eigene Software unter der GPL veröffentlichen\n	0	2014-02-15 10:31:46.593902	2014-02-15 10:31:46.593902	68	o
215	den Quellcode verschlüsseln\n	2	2014-02-15 10:31:46.598452	2014-02-15 10:31:46.598452	68	o
216	Apache-Lizenz\n	0	2014-02-15 10:31:46.607935	2014-02-15 10:31:46.607935	69	o
217	Mozilla Public Lizenz\n	0	2014-02-15 10:31:46.612557	2014-02-15 10:31:46.612557	69	o
218	Eula\n	2	2014-02-15 10:31:46.617139	2014-02-15 10:31:46.617139	69	o
219	BSD Lizenz\n	0	2014-02-15 10:31:46.621704	2014-02-15 10:31:46.621704	69	o
220	Enthalten neben dem betriebssystem eine komplette Softwareumgebung\n	0	2014-02-15 10:31:46.631138	2014-02-15 10:31:46.631138	70	o
221	Arbeiten mit der Bash als Shell\n	0	2014-02-15 10:31:46.635808	2014-02-15 10:31:46.635808	70	o
222	Bieten eine grafische Benutzeroberfläche an\n	2	2014-02-15 10:31:46.640377	2014-02-15 10:31:46.640377	70	o
223	Red Hat\n	0	2014-02-15 10:31:46.649815	2014-02-15 10:31:46.649815	71	o
224	Suse\n	0	2014-02-15 10:31:46.654393	2014-02-15 10:31:46.654393	71	o
225	Debian\n	2	2014-02-15 10:31:46.658975	2014-02-15 10:31:46.658975	71	o
226	Red Hat\n	0	2014-02-15 10:31:46.668451	2014-02-15 10:31:46.668451	72	o
227	Suse\n	0	2014-02-15 10:31:46.673066	2014-02-15 10:31:46.673066	72	o
228	Debian\n	2	2014-02-15 10:31:46.677672	2014-02-15 10:31:46.677672	72	o
229	Red Hat\n	2	2014-02-15 10:31:46.687097	2014-02-15 10:31:46.687097	73	o
230	Suse\n	0	2014-02-15 10:31:46.691701	2014-02-15 10:31:46.691701	73	o
231	Debian\n	0	2014-02-15 10:31:46.696367	2014-02-15 10:31:46.696367	73	o
232	RPM (Suse, RedHat, Ubuntu)\n	0	2014-02-15 10:31:46.705747	2014-02-15 10:31:46.705747	74	o
233	DEB (Debian, ubuntu)\n	2	2014-02-15 10:31:46.710365	2014-02-15 10:31:46.710365	74	o
234	DEB (Debian, Arch-Linux)\n	0	2014-02-15 10:31:46.714972	2014-02-15 10:31:46.714972	74	o
235	Der Kernel bildet die hardwareabstrahierende Schicht (Hardwareabstraktionsschicht), das heißt, er stellt der auf dieser Basis aufsetzenden Software eine einheitliche Schnittstelle (API) zur Verfügung, die unabhängig von der Rechnerarchitektur ist.\n	0	2014-02-15 10:31:46.724453	2014-02-15 10:31:46.724453	75	o
236	 Der modulare Aufbau ds Kernel ermöglicht es, im laufenden Betrieb Komponenten hinzu zu fügen und zu entfernen \n	0	2014-02-15 10:31:46.729123	2014-02-15 10:31:46.729123	75	o
237	Beide Aussagen sind korrekt\n	2	2014-02-15 10:31:46.733763	2014-02-15 10:31:46.733763	75	o
238	Gnome,LXDE, KDE vollwertig\n	0	2014-02-15 10:31:46.743201	2014-02-15 10:31:46.743201	76	o
239	Gnome + KDE vollwertig\n	2	2014-02-15 10:31:46.747892	2014-02-15 10:31:46.747892	76	o
240	KDE leichtgewichtig\n	0	2014-02-15 10:31:46.752458	2014-02-15 10:31:46.752458	76	o
241	XFCE vollwertig\n	0	2014-02-15 10:31:46.757086	2014-02-15 10:31:46.757086	76	o
242	ICMP\n	0	2014-02-19 21:13:34.083747	2014-02-19 21:13:34.083747	77	o
243	UDP\n	0	2014-02-19 21:13:34.090711	2014-02-19 21:13:34.090711	77	o
244	SMTP\n	0	2014-02-19 21:13:34.095781	2014-02-19 21:13:34.095781	77	o
245	TCP\n	0	2014-02-19 21:13:34.100695	2014-02-19 21:13:34.100695	77	o
246	IP\n	0	2014-02-19 21:13:34.105613	2014-02-19 21:13:34.105613	77	o
247	keines der genannten\n	1	2014-02-19 21:13:34.110658	2014-02-19 21:13:34.110658	77	o
248	ICMP\n	0	2014-02-19 21:13:34.123259	2014-02-19 21:13:34.123259	78	o
249	UDP\n	1	2014-02-19 21:13:34.129825	2014-02-19 21:13:34.129825	78	o
270	ICMP\n	0	2014-02-19 21:13:34.293701	2014-02-19 21:13:34.293701	82	o
271	UDP\n	0	2014-02-19 21:13:34.300339	2014-02-19 21:13:34.300339	82	o
272	SMTP\n	0	2014-02-19 21:13:34.306729	2014-02-19 21:13:34.306729	82	o
273	TCP\n	0	2014-02-19 21:13:34.313174	2014-02-19 21:13:34.313174	82	o
274	IP\n	0	2014-02-19 21:13:34.319646	2014-02-19 21:13:34.319646	82	o
275	keines der genannten \n	1	2014-02-19 21:13:34.326157	2014-02-19 21:13:34.326157	82	o
276	ICMP\n	0	2014-02-19 21:13:34.33971	2014-02-19 21:13:34.33971	83	o
277	UDP\n	0	2014-02-19 21:13:34.346182	2014-02-19 21:13:34.346182	83	o
278	SMTP\n	1	2014-02-19 21:13:34.352629	2014-02-19 21:13:34.352629	83	o
279	TCP\n	0	2014-02-19 21:13:34.359087	2014-02-19 21:13:34.359087	83	o
280	IP\n	0	2014-02-19 21:13:34.365439	2014-02-19 21:13:34.365439	83	o
281	keines der genannten\n	0	2014-02-19 21:13:34.371913	2014-02-19 21:13:34.371913	83	o
282	ICMP\n	0	2014-02-19 21:13:34.385461	2014-02-19 21:13:34.385461	84	o
283	UDP\n	0	2014-02-19 21:13:34.391955	2014-02-19 21:13:34.391955	84	o
284	SMTP\n	0	2014-02-19 21:13:34.398414	2014-02-19 21:13:34.398414	84	o
285	TCP\n	0	2014-02-19 21:13:34.404845	2014-02-19 21:13:34.404845	84	o
286	IP\n	1	2014-02-19 21:13:34.411246	2014-02-19 21:13:34.411246	84	o
287	keines der genannten\n	0	2014-02-19 21:13:34.417657	2014-02-19 21:13:34.417657	84	o
288	/etc/network/interface\n	0	2014-02-19 21:13:34.431258	2014-02-19 21:13:34.431258	85	o
289	/etc/network/interfaces\n	1	2014-02-19 21:13:34.437744	2014-02-19 21:13:34.437744	85	o
290	/etc/interface\n	0	2014-02-19 21:13:34.444186	2014-02-19 21:13:34.444186	85	o
291	/etc/hosts\n	0	2014-02-19 21:13:34.450562	2014-02-19 21:13:34.450562	85	o
292	dhcp 172.16.1.1\n	0	2014-02-19 21:13:34.463981	2014-02-19 21:13:34.463981	86	o
293	iface eth1 inet dhcp\n	1	2014-02-19 21:13:34.470483	2014-02-19 21:13:34.470483	86	o
294	iface eth0 dhcp\n	0	2014-02-19 21:13:34.476861	2014-02-19 21:13:34.476861	86	o
295	iface dhcp\n	0	2014-02-19 21:13:34.483299	2014-02-19 21:13:34.483299	86	o
296	DNS-Serverkoennen in dieser Datei nicht konfiguriert werden\n	0	2014-02-19 21:13:34.496711	2014-02-19 21:13:34.496711	87	o
297	dns-nameservers 172.16.1.201 172.16.1.202\n	1	2014-02-19 21:13:34.503258	2014-02-19 21:13:34.503258	87	o
298	dns 172.16.1.201 172.16.1.202\n	0	2014-02-19 21:13:34.50971	2014-02-19 21:13:34.50971	87	o
299	gateway 172.16.1.253\n	1	2014-02-19 21:13:34.523116	2014-02-19 21:13:34.523116	88	o
300	gw 172.16.1.253\n	0	2014-02-19 21:13:34.529582	2014-02-19 21:13:34.529582	88	o
301	gw 172.161.253\n	0	2014-02-19 21:13:34.535957	2014-02-19 21:13:34.535957	88	o
302	alle sind nicht korrekt\n	1	2014-02-19 21:13:34.542307	2014-02-19 21:13:34.542307	88	o
303	iface eth0 inet static\n	1	2014-02-19 21:13:34.555637	2014-02-19 21:13:34.555637	89	o
304	iface eth1 inet static\n	0	2014-02-19 21:13:34.562084	2014-02-19 21:13:34.562084	89	o
305	eth0 auto\n	0	2014-02-19 21:13:34.568485	2014-02-19 21:13:34.568485	89	o
306	/etc/hostname\n	1	2014-02-19 21:13:34.582053	2014-02-19 21:13:34.582053	90	o
307	/etc/network/host\n	0	2014-02-19 21:13:34.588572	2014-02-19 21:13:34.588572	90	o
308	/etc/host\n	0	2014-02-19 21:13:34.59492	2014-02-19 21:13:34.59492	90	o
309	ipconfig\n	0	2014-02-19 21:13:34.608403	2014-02-19 21:13:34.608403	91	o
310	ifconfig\n	1	2014-02-19 21:13:34.614881	2014-02-19 21:13:34.614881	91	o
311	ifconfig eth0 192.168.3.100 netmask 255.255.0.0\n	1	2014-02-19 21:13:34.628409	2014-02-19 21:13:34.628409	92	o
312	ifconfig eth0 192.168.3.100 netmask: 255.255.0.0\n	0	2014-02-19 21:13:34.634924	2014-02-19 21:13:34.634924	92	o
313	ipconfig eth0 192.168.3.100 netmask 255.255.0.0\n	0	2014-02-19 21:13:34.641421	2014-02-19 21:13:34.641421	92	o
314	keiner\n	0	2014-02-19 21:13:34.647837	2014-02-19 21:13:34.647837	92	o
315	route\n	1	2014-02-19 21:13:34.661251	2014-02-19 21:13:34.661251	93	o
316	gateway\n	0	2014-02-19 21:13:34.667769	2014-02-19 21:13:34.667769	93	o
317	es gibt keinen Befehl der beide Kriterien erfuellt\n	0	2014-02-19 21:13:34.674122	2014-02-19 21:13:34.674122	93	o
318	1024\n	0	2014-02-19 21:13:34.687543	2014-02-19 21:13:34.687543	94	o
319	65536\n	1	2014-02-19 21:13:34.694024	2014-02-19 21:13:34.694024	94	o
320	2048\n	0	2014-02-19 21:13:34.700435	2014-02-19 21:13:34.700435	94	o
321	16384\n	0	2014-02-19 21:13:34.706806	2014-02-19 21:13:34.706806	94	o
322	/etc/services/ports\n	0	2014-02-19 21:13:34.720601	2014-02-19 21:13:34.720601	95	o
323	/etc/services\n	1	2014-02-19 21:13:34.727269	2014-02-19 21:13:34.727269	95	o
324	/system/ports\n	0	2014-02-19 21:13:34.733823	2014-02-19 21:13:34.733823	95	o
325	nicht definiert\n	0	2014-02-19 21:13:34.74754	2014-02-19 21:13:34.74754	96	o
326	Reverse-Lookup\n	1	2014-02-19 21:13:34.754247	2014-02-19 21:13:34.754247	96	o
327	DNS-Lookup\n	0	2014-02-19 21:13:34.760814	2014-02-19 21:13:34.760814	96	o
328	nicht aufgefuehrt\n	0	2014-02-19 21:13:34.774654	2014-02-19 21:13:34.774654	97	o
329	nmap g16-hh.de\n	1	2014-02-19 21:13:34.781366	2014-02-19 21:13:34.781366	97	o
330	route localhost\n	0	2014-02-19 21:13:34.78804	2014-02-19 21:13:34.78804	97	o
331	route g16-hh.de\n	0	2014-02-19 21:13:34.794518	2014-02-19 21:13:34.794518	97	o
332	Zuordnung von IP-Adresse und FQDN\n	1	2014-02-19 21:13:34.80836	2014-02-19 21:13:34.80836	98	o
333	ist nicht aufgefuehrt\n	0	2014-02-19 21:13:34.815033	2014-02-19 21:13:34.815033	98	o
334	Der Rechnername wird als IP ausgegeben\n	0	2014-02-19 21:13:34.821616	2014-02-19 21:13:34.821616	98	o
335	traceroute\n	1	2014-02-19 21:13:34.835658	2014-02-19 21:13:34.835658	99	o
336	ping\n	0	2014-02-19 21:13:34.842345	2014-02-19 21:13:34.842345	99	o
337	router\n	0	2014-02-19 21:13:34.848976	2014-02-19 21:13:34.848976	99	o
338	keines ist geeignet\n	0	2014-02-19 21:13:34.855553	2014-02-19 21:13:34.855553	99	o
339	nichts brauchbares\n	0	2014-02-19 21:13:34.869467	2014-02-19 21:13:34.869467	100	o
340	die IP-Adresse von heise.de\n	1	2014-02-19 21:13:34.876147	2014-02-19 21:13:34.876147	100	o
341	die komplette DNS-Information von heise.de\n	0	2014-02-19 21:13:34.882783	2014-02-19 21:13:34.882783	100	o
342	den Befehl gibt es nicht\n	0	2014-02-19 21:13:34.896668	2014-02-19 21:13:34.896668	101	o
343	die IP-Adresse von heise.de\n	0	2014-02-19 21:13:34.903319	2014-02-19 21:13:34.903319	101	o
344	alle in Frage kommenden DNS-Informationen\n	1	2014-02-19 21:13:34.90989	2014-02-19 21:13:34.90989	101	o
345	Domain-Name in IP-Adresse\n	0	2014-02-19 21:13:34.923656	2014-02-19 21:13:34.923656	102	o
346	MAC-Adresse in IP-Adresse\n	0	2014-02-19 21:13:34.930249	2014-02-19 21:13:34.930249	102	o
347	IP-Adresse in MAC-Adresse\n	1	2014-02-19 21:13:34.936928	2014-02-19 21:13:34.936928	102	o
348	Domain-Name in MAC-Adresse\n	0	2014-02-19 21:13:34.943598	2014-02-19 21:13:34.943598	102	o
349	0\n	0	2014-02-19 21:13:34.957388	2014-02-19 21:13:34.957388	103	o
350	10\n	0	2014-02-19 21:13:34.964103	2014-02-19 21:13:34.964103	103	o
351	110\n	1	2014-02-19 21:13:34.970699	2014-02-19 21:13:34.970699	103	o
352	1110\n	0	2014-02-19 21:13:34.977333	2014-02-19 21:13:34.977333	103	o
353	64 bis 127\n	0	2014-02-19 21:13:34.991142	2014-02-19 21:13:34.991142	104	o
354	128 bis 191\n	1	2014-02-19 21:13:34.997794	2014-02-19 21:13:34.997794	104	o
355	192 bis 223\n	0	2014-02-19 21:13:35.004458	2014-02-19 21:13:35.004458	104	o
356	128 bis 159\n	0	2014-02-19 21:13:35.01104	2014-02-19 21:13:35.01104	104	o
357	187.15.16.17\n	0	2014-02-19 21:13:35.024703	2014-02-19 21:13:35.024703	105	o
358	187.15.17.18\n	0	2014-02-19 21:13:35.031325	2014-02-19 21:13:35.031325	105	o
359	187.16.17.18\n	1	2014-02-19 21:13:35.037922	2014-02-19 21:13:35.037922	105	o
360	187.15.16.18\n	0	2014-02-19 21:13:35.044445	2014-02-19 21:13:35.044445	105	o
361	152.14.0.0\n	1	2014-02-19 21:13:35.058314	2014-02-19 21:13:35.058314	106	o
362	152.14.21.0\n	0	2014-02-19 21:13:35.098488	2014-02-19 21:13:35.098488	106	o
363	152.0.0.0\n	0	2014-02-19 21:13:35.102264	2014-02-19 21:13:35.102264	106	o
364	152.14.16.0\n	0	2014-02-19 21:13:35.105956	2014-02-19 21:13:35.105956	106	o
365	\N	0	2014-02-19 21:13:35.109645	2014-02-19 21:13:35.109645	106	o
366	192.168.27.11\n	0	2014-02-19 21:13:35.11368	2014-02-19 21:13:35.11368	106	o
367	172.21.47.11\n	0	2014-02-19 21:13:35.117893	2014-02-19 21:13:35.117893	106	o
368	10.0.8.15\n	0	2014-02-19 21:13:35.122049	2014-02-19 21:13:35.122049	106	o
369	172.47.11.12\n	1	2014-02-19 21:13:35.126486	2014-02-19 21:13:35.126486	106	o
370	196.17.0.0/16\n	0	2014-02-19 21:13:35.136176	2014-02-19 21:13:35.136176	107	o
371	196.17.0.0/17\n	0	2014-02-19 21:13:35.140806	2014-02-19 21:13:35.140806	107	o
372	196.17.8.0/26\n	1	2014-02-19 21:13:35.14553	2014-02-19 21:13:35.14553	107	o
373	196.17.8.0/25\n	0	2014-02-19 21:13:35.150132	2014-02-19 21:13:35.150132	107	o
374	156.19.0.0/20\n	0	2014-02-19 21:13:35.159722	2014-02-19 21:13:35.159722	108	o
375	156.19.16.0/18\n	0	2014-02-19 21:13:35.164331	2014-02-19 21:13:35.164331	108	o
376	156.19.64.0/18\n	1	2014-02-19 21:13:35.168861	2014-02-19 21:13:35.168861	108	o
377	156.19.128.0/19\n	0	2014-02-19 21:13:35.173475	2014-02-19 21:13:35.173475	108	o
378	62\n	1	2014-02-19 21:13:35.182938	2014-02-19 21:13:35.182938	109	o
379	128\n	0	2014-02-19 21:13:35.187654	2014-02-19 21:13:35.187654	109	o
380	127\n	0	2014-02-19 21:13:35.192145	2014-02-19 21:13:35.192145	109	o
381	64\n	0	2014-02-19 21:13:35.196712	2014-02-19 21:13:35.196712	109	o
382	Er gibt die Uhrzeit an, wann das Datagramm erzeugt wurde\n	0	2014-02-19 21:13:35.206237	2014-02-19 21:13:35.206237	110	o
383	Er gibt die Uhrzeit an, bis zu der das Datagramm bestehen wird\n	0	2014-02-19 21:13:35.210901	2014-02-19 21:13:35.210901	110	o
384	Er zählt die Sekunden, die das Datagramm bereits existiert\n	0	2014-02-19 21:13:35.215481	2014-02-19 21:13:35.215481	110	o
385	Er zählt die Hops, die das Datagramm erlebt, bis 0 herunter\n	1	2014-02-19 21:13:35.220053	2014-02-19 21:13:35.220053	110	o
386	Die Datagramme können nicht weitergeleitet werden\n	0	2014-02-19 21:13:35.229607	2014-02-19 21:13:35.229607	111	o
387	Die Datagramme werden fragmentiert\n	1	2014-02-19 21:13:35.23423	2014-02-19 21:13:35.23423	111	o
388	Die Datagramme müssen erneut gesender werden\n	0	2014-02-19 21:13:35.238786	2014-02-19 21:13:35.238786	111	o
389	Die Datagramme werden langsamer transportiert\n	0	2014-02-19 21:13:35.243444	2014-02-19 21:13:35.243444	111	o
390	Der Router ins nächstgelegene Netz\n	0	2014-02-19 21:13:35.252892	2014-02-19 21:13:35.252892	112	o
391	Der Router ins Internet\n	0	2014-02-19 21:13:35.257578	2014-02-19 21:13:35.257578	112	o
392	Der Router für Verbindungen in alle Netze, für die kein separater Router existiert\n	1	2014-02-19 21:13:35.262176	2014-02-19 21:13:35.262176	112	o
393	Der Router in einem Netz, in dem kein weiterer Router existiert\n	0	2014-02-19 21:13:35.266735	2014-02-19 21:13:35.266735	112	o
394	156.81.9.18\n	0	2014-02-19 21:13:35.276375	2014-02-19 21:13:35.276375	113	o
395	156.81.18.9\n	0	2014-02-19 21:13:35.281028	2014-02-19 21:13:35.281028	113	o
396	156.81.81.9\n	1	2014-02-19 21:13:35.285546	2014-02-19 21:13:35.285546	113	o
397	156.81.0.9\n	0	2014-02-19 21:13:35.29016	2014-02-19 21:13:35.29016	113	o
398	r1\n	0	2014-02-19 21:13:35.299694	2014-02-19 21:13:35.299694	114	o
399	r2\n	1	2014-02-19 21:13:35.304326	2014-02-19 21:13:35.304326	114	o
400	r3\n	0	2014-02-19 21:13:35.308853	2014-02-19 21:13:35.308853	114	o
401	Keiner	0	2014-02-19 21:13:35.313345	2014-02-19 21:13:35.313345	114	o
402	Ein Rechner, der nicht an ein Netzwerk angeschlossen ist\n	0	2014-02-19 21:13:35.322855	2014-02-19 21:13:35.322855	115	o
403	Ein lokales Netzwerk ohne Verbindung zu anderen Teilnetzen\n	0	2014-02-19 21:13:35.327552	2014-02-19 21:13:35.327552	115	o
404	Die Gesamtheit aller Netzwerke eines Betreibers\n	1	2014-02-19 21:13:35.332118	2014-02-19 21:13:35.332118	115	o
405	Ein allein stehender Router\n	0	2014-02-19 21:13:35.336682	2014-02-19 21:13:35.336682	115	o
406	Für das Routing innerhalb eines Teilnetzes\n	0	2014-02-19 21:13:35.346235	2014-02-19 21:13:35.346235	116	o
407	Für das Routing innerhalb eines autonomen Systems\n	1	2014-02-19 21:13:35.350855	2014-02-19 21:13:35.350855	116	o
408	Für das Routing innerhalb eines Netzes ohne Außenverbindung\n	0	2014-02-19 21:13:35.355552	2014-02-19 21:13:35.355552	116	o
409	Für das Routing zwischen mehreren virtuellen Netzwerkschnittstellen auf einem einzelnen Rechner\n	0	2014-02-19 21:13:35.36055	2014-02-19 21:13:35.36055	116	o
410	RIP\n	0	2014-02-19 21:13:35.370254	2014-02-19 21:13:35.370254	117	o
411	OSPF\n	0	2014-02-19 21:13:35.37485	2014-02-19 21:13:35.37485	117	o
412	BGP\n	1	2014-02-19 21:13:35.379594	2014-02-19 21:13:35.379594	117	o
413	Keines der genannten\n	0	2014-02-19 21:13:35.384176	2014-02-19 21:13:35.384176	117	o
414	8\n	0	2014-02-19 21:13:35.393695	2014-02-19 21:13:35.393695	118	o
415	15\n	1	2014-02-19 21:13:35.398289	2014-02-19 21:13:35.398289	118	o
416	20\n	0	2014-02-19 21:13:35.402908	2014-02-19 21:13:35.402908	118	o
417	31\n	0	2014-02-19 21:13:35.407512	2014-02-19 21:13:35.407512	118	o
418	BOOTP\n	0	2014-02-19 21:13:35.417011	2014-02-19 21:13:35.417011	119	o
419	NAT\n	0	2014-02-19 21:13:35.421615	2014-02-19 21:13:35.421615	119	o
420	DHCP\n	1	2014-02-19 21:13:35.426196	2014-02-19 21:13:35.426196	119	o
421	ARP\n	0	2014-02-19 21:13:35.430815	2014-02-19 21:13:35.430815	119	o
422	64 Bit\n	0	2014-02-19 21:13:35.440401	2014-02-19 21:13:35.440401	120	o
423	128 Bit\n	1	2014-02-19 21:13:35.44501	2014-02-19 21:13:35.44501	120	o
424	32 Bit\n	0	2014-02-19 21:13:35.449606	2014-02-19 21:13:35.449606	120	o
425	variabel\n	0	2014-02-19 21:13:35.454204	2014-02-19 21:13:35.454204	120	o
426	UDP\n	0	2014-02-19 21:13:35.463811	2014-02-19 21:13:35.463811	121	o
427	ICMP\n	1	2014-02-19 21:13:35.514007	2014-02-19 21:13:35.514007	121	o
428	TCP\n	0	2014-02-19 21:13:35.52627	2014-02-19 21:13:35.52627	121	o
429	Keins, sondern RawIP\n	0	2014-02-19 21:13:35.530766	2014-02-19 21:13:35.530766	121	o
430	SYN, ACK, SYN\n	0	2014-02-19 21:13:35.540431	2014-02-19 21:13:35.540431	122	o
431	SYN, SYN, ACK\n	0	2014-02-19 21:13:35.545071	2014-02-19 21:13:35.545071	122	o
432	SYN, SYN/ACK, ACK\n	1	2014-02-19 21:13:35.549596	2014-02-19 21:13:35.549596	122	o
433	SYN, ACK, SYN/ACK\n	0	2014-02-19 21:13:35.55418	2014-02-19 21:13:35.55418	122	o
434	0 bis 255\n	0	2014-02-19 21:13:35.563787	2014-02-19 21:13:35.563787	123	o
435	0 bis 1023\n	1	2014-02-19 21:13:35.568401	2014-02-19 21:13:35.568401	123	o
436	0 bis 16383\n	0	2014-02-19 21:13:35.572937	2014-02-19 21:13:35.572937	123	o
437	0 bis 32767\n	0	2014-02-19 21:13:35.577464	2014-02-19 21:13:35.577464	123	o
438	Schnellere Übertragung auf Kosten der Zuverlässigkeit\n	1	2014-02-19 21:13:35.586959	2014-02-19 21:13:35.586959	124	o
439	Schnellere Übertragung durch höhere Übertragungsraten\n	0	2014-02-19 21:13:35.591659	2014-02-19 21:13:35.591659	124	o
440	Sichere Übertragung durch Verschlüsselung\n	0	2014-02-19 21:13:35.59621	2014-02-19 21:13:35.59621	124	o
441	Möglichkeit der Übertragung in Nicht-IP-Netze\n	0	2014-02-19 21:13:35.600745	2014-02-19 21:13:35.600745	124	o
442	21\n	0	2014-02-19 21:13:35.610181	2014-02-19 21:13:35.610181	125	o
443	53\n	0	2014-02-19 21:13:35.61483	2014-02-19 21:13:35.61483	125	o
444	80\n	1	2014-02-19 21:13:35.619425	2014-02-19 21:13:35.619425	125	o
445	110\n	0	2014-02-19 21:13:35.62394	2014-02-19 21:13:35.62394	125	o
446	echo\n	0	2014-02-19 21:13:35.633453	2014-02-19 21:13:35.633453	126	o
447	ftp\n	0	2014-02-19 21:13:35.637991	2014-02-19 21:13:35.637991	126	o
448	smtp\n	0	2014-02-19 21:13:35.642506	2014-02-19 21:13:35.642506	126	o
449	telnet\n	1	2014-02-19 21:13:35.64701	2014-02-19 21:13:35.64701	126	o
450	/var/hosts.txt\n	0	2014-02-19 21:13:35.656446	2014-02-19 21:13:35.656446	127	o
451	/etc/services.txt\n	0	2014-02-19 21:13:35.660971	2014-02-19 21:13:35.660971	127	o
452	/etc/hosts\n	1	2014-02-19 21:13:35.665448	2014-02-19 21:13:35.665448	127	o
453	/var/addresses\n	0	2014-02-19 21:13:35.669894	2014-02-19 21:13:35.669894	127	o
454	Kommunikation zwischen seinen Benutzern\n	0	2014-02-19 21:13:35.679271	2014-02-19 21:13:35.679271	128	o
455	Gemeinsame Stromversorgung mehrerer Rechner\n	1	2014-02-19 21:13:35.683802	2014-02-19 21:13:35.683802	128	o
456	Austausch von Daten\n	0	2014-02-19 21:13:35.688322	2014-02-19 21:13:35.688322	128	o
457	Verteilte Anwendungen\n	0	2014-02-19 21:13:35.692795	2014-02-19 21:13:35.692795	128	o
458	Absender- und Empfängeradresse in jedem Paket\n	0	2014-02-19 21:13:35.702098	2014-02-19 21:13:35.702098	129	o
459	Die Unterteilung der Daten in kleinere Einheiten\n	0	2014-02-19 21:13:35.706679	2014-02-19 21:13:35.706679	129	o
460	Ein Bestätigungsverfahren, das die Datenauslieferung garantiert\n	1	2014-02-19 21:13:35.711218	2014-02-19 21:13:35.711218	129	o
461	Die Fähigkeit zur Weiterleitung der Datenpakekte über verschiedene Wege\n	0	2014-02-19 21:13:35.715754	2014-02-19 21:13:35.715754	129	o
462	40\n	0	2014-02-19 21:13:35.725186	2014-02-19 21:13:35.725186	130	o
463	4\n	1	2014-02-19 21:13:35.729703	2014-02-19 21:13:35.729703	130	o
464	400\n	0	2014-02-19 21:13:35.734213	2014-02-19 21:13:35.734213	130	o
465	800\n	0	2014-02-19 21:13:35.738827	2014-02-19 21:13:35.738827	130	o
466	CGI\n	0	2014-02-19 21:13:35.748205	2014-02-19 21:13:35.748205	131	o
467	World Wide Web\n	0	2014-02-19 21:13:35.752741	2014-02-19 21:13:35.752741	131	o
468	Newsgroups\n	0	2014-02-19 21:13:35.757254	2014-02-19 21:13:35.757254	131	o
469	E-Mail\n	1	2014-02-19 21:13:35.761769	2014-02-19 21:13:35.761769	131	o
470	An der Universität von Hawaii\n	0	2014-02-19 21:13:35.771265	2014-02-19 21:13:35.771265	132	o
471	Im XEROX PARC\n	1	2014-02-19 21:13:35.775822	2014-02-19 21:13:35.775822	132	o
472	An der University of California, Berkeley\n	0	2014-02-19 21:13:35.78035	2014-02-19 21:13:35.78035	132	o
473	Bei IBM\n	0	2014-02-19 21:13:35.784805	2014-02-19 21:13:35.784805	132	o
474	In Patentschriften\n	0	2014-02-19 21:13:35.794108	2014-02-19 21:13:35.794108	133	o
475	In IEEE-Drafts\n	0	2014-02-19 21:13:35.798624	2014-02-19 21:13:35.798624	133	o
476	In Diplom- und Doktorarbeiten\n	0	2014-02-19 21:13:35.803159	2014-02-19 21:13:35.803159	133	o
477	In öffentlich verfügbaren RFC-Dokumenten\n	1	2014-02-19 21:13:35.807658	2014-02-19 21:13:35.807658	133	o
478	FidoNet\n	0	2014-02-19 21:13:35.816918	2014-02-19 21:13:35.816918	134	o
479	CompuServe\n	0	2014-02-19 21:13:35.821478	2014-02-19 21:13:35.821478	134	o
480	NSFNet\n	1	2014-02-19 21:13:35.825897	2014-02-19 21:13:35.825897	134	o
481	BTX\n	0	2014-02-19 21:13:35.830397	2014-02-19 21:13:35.830397	134	o
482	Funkgeräte\n	0	2014-02-19 21:13:35.839792	2014-02-19 21:13:35.839792	135	o
483	Akustikkoppler\n	1	2014-02-19 21:13:35.844367	2014-02-19 21:13:35.844367	135	o
484	Telegraphen\n	0	2014-02-19 21:13:35.848822	2014-02-19 21:13:35.848822	135	o
485	Modems\n	0	2014-02-19 21:13:35.853294	2014-02-19 21:13:35.853294	135	o
486	Die Einführung von Hypertext\n	0	2014-02-19 21:13:35.863574	2014-02-19 21:13:35.863574	136	o
487	Wissenschaftliche Internet-Anwendung\n	0	2014-02-19 21:13:35.868115	2014-02-19 21:13:35.868115	136	o
488	Die Verwendung eines textbasierten Kommunikationsprotokolls\n	0	2014-02-19 21:13:35.872595	2014-02-19 21:13:35.872595	136	o
489	Die Anwendung von Hypertext über ein Netzwerk\n	1	2014-02-19 21:13:35.877082	2014-02-19 21:13:35.877082	136	o
490	LWP\n	0	2014-02-19 21:13:35.88643	2014-02-19 21:13:35.88643	137	o
491	WWWP\n	0	2014-02-19 21:13:35.890947	2014-02-19 21:13:35.890947	137	o
492	HTTP\n	1	2014-02-19 21:13:35.895462	2014-02-19 21:13:35.895462	137	o
493	HTML\n	0	2014-02-19 21:13:35.899951	2014-02-19 21:13:35.899951	137	o
494	Bitübertragungsschicht\n	0	2014-02-19 21:13:35.909268	2014-02-19 21:13:35.909268	138	o
495	Vermittlungsschicht\n	1	2014-02-19 21:13:35.913778	2014-02-19 21:13:35.913778	138	o
496	Sicherungsschicht\n	0	2014-02-19 21:13:35.918265	2014-02-19 21:13:35.918265	138	o
497	Transportschicht\n	0	2014-02-19 21:13:35.922776	2014-02-19 21:13:35.922776	138	o
498	6\n	1	2014-02-19 21:13:35.93218	2014-02-19 21:13:35.93218	139	o
499	5\n	0	2014-02-19 21:13:35.936679	2014-02-19 21:13:35.936679	139	o
500	7\n	0	2014-02-19 21:13:35.941159	2014-02-19 21:13:35.941159	139	o
501	4\n	0	2014-02-19 21:13:35.945623	2014-02-19 21:13:35.945623	139	o
502	Datenstromverschlüsselung\n	0	2014-02-19 21:13:35.954969	2014-02-19 21:13:35.954969	140	o
503	Erzeugung von Datenpaketen\n	0	2014-02-19 21:13:35.959511	2014-02-19 21:13:35.959511	140	o
504	Steuerung des Zugriffs auf das Übertragungsmedium\n	1	2014-02-19 21:13:35.963969	2014-02-19 21:13:35.963969	140	o
505	Routing\n	0	2014-02-19 21:13:35.968498	2014-02-19 21:13:35.968498	140	o
506	Netzzugangsschicht\n	0	2014-02-19 21:13:35.977828	2014-02-19 21:13:35.977828	141	o
507	Internetschicht\n	0	2014-02-19 21:13:35.98239	2014-02-19 21:13:35.98239	141	o
508	Sitzungsschicht\n	1	2014-02-19 21:13:35.986829	2014-02-19 21:13:35.986829	141	o
509	Anwendungsschicht\n	0	2014-02-19 21:13:35.991394	2014-02-19 21:13:35.991394	141	o
510	Sicherungsschicht\n	0	2014-02-19 21:13:36.000765	2014-02-19 21:13:36.000765	142	o
511	Vermittlungsschicht\n	1	2014-02-19 21:13:36.006878	2014-02-19 21:13:36.006878	142	o
512	Transportschicht\n	0	2014-02-19 21:13:36.013465	2014-02-19 21:13:36.013465	142	o
513	\N	0	2014-02-19 21:13:36.020005	2014-02-19 21:13:36.020005	142	o
514	FTP\n	0	2014-02-19 21:13:36.033577	2014-02-19 21:13:36.033577	143	o
515	TCP\n	1	2014-02-19 21:13:36.04015	2014-02-19 21:13:36.04015	143	o
516	IP\n	0	2014-02-19 21:13:36.046648	2014-02-19 21:13:36.046648	143	o
517	ARP\n	0	2014-02-19 21:13:36.053173	2014-02-19 21:13:36.053173	143	o
518	MAN\n	0	2014-02-19 21:13:36.066755	2014-02-19 21:13:36.066755	144	o
519	WAN\n	0	2014-02-19 21:13:36.0733	2014-02-19 21:13:36.0733	144	o
520	GAN\n	1	2014-02-19 21:13:36.079985	2014-02-19 21:13:36.079985	144	o
521	LAN\n	0	2014-02-19 21:13:36.086453	2014-02-19 21:13:36.086453	144	o
522	Baum\n	0	2014-02-19 21:13:36.099939	2014-02-19 21:13:36.099939	145	o
523	Stern\n	1	2014-02-19 21:13:36.106333	2014-02-19 21:13:36.106333	145	o
524	Ring\n	0	2014-02-19 21:13:36.112766	2014-02-19 21:13:36.112766	145	o
525	Bus\n	0	2014-02-19 21:13:36.11914	2014-02-19 21:13:36.11914	145	o
526	Token Ring\n	1	2014-02-19 21:13:36.13255	2014-02-19 21:13:36.13255	146	o
527	Ethernet über BNC\n	0	2014-02-19 21:13:36.138969	2014-02-19 21:13:36.138969	146	o
528	WAN\n	0	2014-02-19 21:13:36.145345	2014-02-19 21:13:36.145345	146	o
529	Internet\n	0	2014-02-19 21:13:36.151716	2014-02-19 21:13:36.151716	146	o
530	E-Mail\n	0	2014-02-19 21:13:36.165112	2014-02-19 21:13:36.165112	147	o
531	Internetzugang\n	0	2014-02-19 21:13:36.17161	2014-02-19 21:13:36.17161	147	o
532	Druckerfreigabe\n	1	2014-02-19 21:13:36.177934	2014-02-19 21:13:36.177934	147	o
533	Datenbankzugriff\n	0	2014-02-19 21:13:36.18437	2014-02-19 21:13:36.18437	147	o
534	ping\n	0	2014-02-19 21:13:36.197736	2014-02-19 21:13:36.197736	148	o
535	ifconfig\n	1	2014-02-19 21:13:36.204273	2014-02-19 21:13:36.204273	148	o
536	netstat\n	0	2014-02-19 21:13:36.210635	2014-02-19 21:13:36.210635	148	o
537	insmod\n	0	2014-02-19 21:13:36.217142	2014-02-19 21:13:36.217142	148	o
538	router 192.168.1.1\n	0	2014-02-19 21:13:36.230621	2014-02-19 21:13:36.230621	149	o
539	\N	0	2014-02-19 21:13:36.237093	2014-02-19 21:13:36.237093	149	o
540	route add default gw 192.168.1.1\n	1	2014-02-19 21:13:36.243539	2014-02-19 21:13:36.243539	149	o
541	router -d 192.168.1.1\n	0	2014-02-19 21:13:36.249922	2014-02-19 21:13:36.249922	149	o
542	Überprüfen der Nameserverkonfiguration\n	0	2014-02-19 21:13:36.263369	2014-02-19 21:13:36.263369	150	o
543	Einstellen der IP-Adresse\n	0	2014-02-19 21:13:36.269827	2014-02-19 21:13:36.269827	150	o
544	Start des File-Servers\n	0	2014-02-19 21:13:36.276206	2014-02-19 21:13:36.276206	150	o
545	Überprüfen, ob ein bestimmter Host erreichbar ist\n	1	2014-02-19 21:13:36.282545	2014-02-19 21:13:36.282545	150	o
546	Alle Router im Netz des Providers werden befragt\n	0	2014-02-19 21:13:36.295945	2014-02-19 21:13:36.295945	151	o
547	Der Nameserver, der Auskunft über den angefragten Host geben kann, kennt auch die Route dorthin\n	0	2014-02-19 21:13:36.302394	2014-02-19 21:13:36.302394	151	o
548	Der TTL-Wert der ICMP-Testpakete wird nacheinander jeweils um 1 erhöht\n	1	2014-02-19 21:13:36.308783	2014-02-19 21:13:36.308783	151	o
549	Gar nicht - die Antwort kommt vom letzten Router, der alle anderen aus dem Paketinhalt liest\n	0	2014-02-19 21:13:36.315198	2014-02-19 21:13:36.315198	151	o
550	netstat -rn\n	1	2014-02-19 21:13:36.357314	2014-02-19 21:13:36.357314	152	o
551	netstat --route\n	0	2014-02-19 21:13:36.361048	2014-02-19 21:13:36.361048	152	o
552	netstat -i routing\n	0	2014-02-19 21:13:36.364715	2014-02-19 21:13:36.364715	152	o
553	netstat |grep route\n	0	2014-02-19 21:13:36.368414	2014-02-19 21:13:36.368414	152	o
554	netstat\n	0	2014-02-19 21:13:36.376051	2014-02-19 21:13:36.376051	153	o
555	finger\n	0	2014-02-19 21:13:36.379923	2014-02-19 21:13:36.379923	153	o
556	dig\n	1	2014-02-19 21:13:36.384128	2014-02-19 21:13:36.384128	153	o
557	named\n	0	2014-02-19 21:13:36.38829	2014-02-19 21:13:36.38829	153	o
558	Ein Rechner muss immer eine weltweit eindeutige IP-Adresse besitzen.\n	1	2014-02-19 21:13:36.397177	2014-02-19 21:13:36.397177	154	o
559	Die Aufgabe von IP-Adressen ist es, Rechner in einem Netz eindeutig zu identifizieren. \n	0	2014-02-19 21:13:36.401813	2014-02-19 21:13:36.401813	154	o
560	Eine IPv4-Adresse besteht aus 4 Byte, die mit Punkten getrennt notiert werden\n	0	2014-02-19 21:13:36.406413	2014-02-19 21:13:36.406413	154	o
561	network\n	0	2014-02-19 21:13:36.415972	2014-02-19 21:13:36.415972	155	o
562	ipconfig\n	0	2014-02-19 21:13:36.420688	2014-02-19 21:13:36.420688	155	o
563	ifconfig\n	1	2014-02-19 21:13:36.425234	2014-02-19 21:13:36.425234	155	o
564	mask\n	0	2014-02-19 21:13:36.4298	2014-02-19 21:13:36.4298	155	o
565	Zu jeder Domain gibt es eine eindeutige IP-Adresse\n	0	2014-02-19 21:13:36.439383	2014-02-19 21:13:36.439383	156	o
566	Jeder IP-Adresse ist eine eindeutige Domain zugeordnet.\n	1	2014-02-19 21:13:36.444007	2014-02-19 21:13:36.444007	156	o
567	Das Domain Name System (DNS) hat die Aufgabe symbolische Namen (Domain-Name) in IP-Adressen abzubilden.\n	0	2014-02-19 21:13:36.448592	2014-02-19 21:13:36.448592	156	o
568	Adressen, die von der Firma Apple für ihre Mac-Rechner vergeben werden.\n	0	2014-02-19 21:13:36.458073	2014-02-19 21:13:36.458073	157	o
569	Adressen, die ursprünglich von der Firma Apple für ihre Mac-Rechner vergeben wurden und dann auf alle anderen Rechner von Appel ausgedehnt wurden.\n	0	2014-02-19 21:13:36.462709	2014-02-19 21:13:36.462709	157	o
570	Eine MAC-Adresse ist die eindeutige Hardware-Adresse jedes einzelnen Netzwerkadapters, die zur eindeutigen Identifikation des Gerätes im Netzwerk dient.\n	1	2014-02-19 21:13:36.467377	2014-02-19 21:13:36.467377	157	o
571	Ein Programm, welches ein Netzwerk bei Zugriffen auf das Internet maskiert und vor unberechtigten Zugriffen schützt.\n	0	2014-02-19 21:13:36.476903	2014-02-19 21:13:36.476903	158	o
572	Eine Netzmaske ist eine Bitmaske, die IP-Adressen in eine Net-ID und einen Hostteil trennt.\n	1	2014-02-19 21:13:36.481562	2014-02-19 21:13:36.481562	158	o
573	Netzmaske ist die falsche Bezeichnung. Korrekt heißt es Netzwerkmaske.\n	0	2014-02-19 21:13:36.486193	2014-02-19 21:13:36.486193	158	o
574	Diese Notation bezeichnet einen IP-Nummernbereich und zwar die IP-Adressen 192.168.100.22, 192.168.100.23, 192.168.100.24 und 192.168.100.25\n	0	2014-02-19 21:13:36.495781	2014-02-19 21:13:36.495781	159	o
575	Diese Notation besagt, dass die IP-Adresse 192.168.100.22 einem Subnetz mit 25 Teilnehmern angehört.\n	0	2014-02-19 21:13:36.500434	2014-02-19 21:13:36.500434	159	o
576	Diese Schreibweise steht für die IPv4-Adresse 192.168.100.22 und die Netzwerkadresse 255.255.255.128\n	1	2014-02-19 21:13:36.505026	2014-02-19 21:13:36.505026	159	o
577	Ein Netzwerk, welches kein Verbindung zum öffentlichen Netz hat\n	0	2014-02-19 21:13:36.514539	2014-02-19 21:13:36.514539	160	o
578	privat im Sinne von geheim\n	0	2014-02-19 21:13:36.519228	2014-02-19 21:13:36.519228	160	o
579	Private Netzwerke werden benutzt, wenn ein Netzwerk, in welchem mehr Geräte angeschlossen sind, als vom Internetprovider IP-Adressen zur Verfügung stehen, mit dem Internet verbunden wird.\n	1	2014-02-19 21:13:36.523832	2014-02-19 21:13:36.523832	160	o
580	20: FTP\n	1	2014-02-19 21:13:36.533404	2014-02-19 21:13:36.533404	161	o
581	21: FTP\n	0	2014-02-19 21:13:36.538017	2014-02-19 21:13:36.538017	161	o
582	22: SSH\n	0	2014-02-19 21:13:36.542604	2014-02-19 21:13:36.542604	161	o
583	25: SMTP\n	0	2014-02-19 21:13:36.547197	2014-02-19 21:13:36.547197	161	o
584	10.0.0.0/8\n	0	2014-02-19 21:13:36.556809	2014-02-19 21:13:36.556809	162	o
585	10.0.0.0/12\n	0	2014-02-19 21:13:36.5614	2014-02-19 21:13:36.5614	162	o
586	172.16.0.0/12\n	0	2014-02-19 21:13:36.565975	2014-02-19 21:13:36.565975	162	o
587	191.168.0.0/16\n	1	2014-02-19 21:13:36.570521	2014-02-19 21:13:36.570521	162	o
588	192.168.0.0/16\n	0	2014-02-19 21:13:36.575157	2014-02-19 21:13:36.575157	162	o
589	53: DNS\n	0	2014-02-19 21:13:36.584724	2014-02-19 21:13:36.584724	163	o
590	80: HTTP\n	0	2014-02-19 21:13:36.589389	2014-02-19 21:13:36.589389	163	o
591	110: POP3\n	0	2014-02-19 21:13:36.593978	2014-02-19 21:13:36.593978	163	o
592	442: HTTP\n	1	2014-02-19 21:13:36.598513	2014-02-19 21:13:36.598513	163	o
593	443: HTTPS\n	0	2014-02-19 21:13:36.603168	2014-02-19 21:13:36.603168	163	o
594	23: telnet\n	0	2014-02-19 21:13:36.607748	2014-02-19 21:13:36.607748	163	o
595	/etc/services\n	1	2014-02-19 21:13:36.61734	2014-02-19 21:13:36.61734	164	o
596	/etc/ports\n	0	2014-02-19 21:13:36.621965	2014-02-19 21:13:36.621965	164	o
597	/etc/ports.conf\n	0	2014-02-19 21:13:36.62657	2014-02-19 21:13:36.62657	164	o
598	/etc/portlist\n	0	2014-02-19 21:13:36.631276	2014-02-19 21:13:36.631276	164	o
599	/etc/named.conf\n	0	2014-02-19 21:13:36.640828	2014-02-19 21:13:36.640828	165	o
600	/etc/bindd.conf\n	0	2014-02-19 21:13:36.645406	2014-02-19 21:13:36.645406	165	o
601	/etc/hosts\n	1	2014-02-19 21:13:36.649929	2014-02-19 21:13:36.649929	165	o
602	/etc/resolv.conf\n	0	2014-02-19 21:13:36.654494	2014-02-19 21:13:36.654494	165	o
603	/etc/dns.conf\n	0	2014-02-19 21:13:36.659135	2014-02-19 21:13:36.659135	165	o
604	/usr\n	0	2014-02-19 21:13:36.668682	2014-02-19 21:13:36.668682	166	o
605	/etc\n	0	2014-02-19 21:13:36.673323	2014-02-19 21:13:36.673323	166	o
606	/home\n	1	2014-02-19 21:13:36.67785	2014-02-19 21:13:36.67785	166	o
607	/usr/bin\n	0	2014-02-19 21:13:36.682425	2014-02-19 21:13:36.682425	166	o
608	winservd\n	0	2014-02-19 21:13:36.691946	2014-02-19 21:13:36.691946	167	o
609	winserver\n	0	2014-02-19 21:13:36.696572	2014-02-19 21:13:36.696572	167	o
610	smbd\n	1	2014-02-19 21:13:36.701116	2014-02-19 21:13:36.701116	167	o
611	windd\n	0	2014-02-19 21:13:36.705663	2014-02-19 21:13:36.705663	167	o
612	\N	\N	2014-02-19 21:13:36.710235	2014-02-19 21:13:36.710235	167	o
613	\N	\N	2014-02-19 21:13:36.714805	2014-02-19 21:13:36.714805	167	o
\.


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('answers_id_seq', 613, true);


--
-- Data for Name: classtest_events; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY classtest_events (id, state, classtest_id, created_at, updated_at) FROM stdin;
1	open	6	2014-02-17 07:40:56.780271	2014-02-17 07:40:56.780271
2	canceled	6	2014-02-17 16:52:20.470052	2014-02-17 16:52:20.470052
3	shipped	6	2014-02-24 08:32:23.100803	2014-02-24 08:32:23.100803
\.


--
-- Name: classtest_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('classtest_events_id_seq', 3, true);


--
-- Data for Name: classtests; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY classtests (id, title, description, category, testtype_id, lecture_id, duration, created_at, updated_at) FROM stdin;
6	KuA_Fit3h: Allgemeine Fragen im Bereich Linux	KuA_Fit3h: Allgemeine Fragen im Bereich Linux	Multiplechoice	2	9	20	2014-02-17 07:39:29.050792	2014-02-17 07:39:29.050792
\.


--
-- Name: classtests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('classtests_id_seq', 6, true);


--
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY questions (id, title, category, testtype_id, points, image, created_at, updated_at, "order", help) FROM stdin;
2	Legen Sie im Homeverzeichnis des angemeldeten Benutzers das Verzeichnis classwork an, erstellen eine Datei 'versuch.txt', schreiben den Text 'Ich bin gut' hinein, lesen den Inhalt der Datei ein und geben diesen auf der Console aus. Nennen SIe die Datei: datei_neu.sh	Text	1	5	\N	2014-02-09 10:43:34.901248	2014-02-09 10:43:34.901248	o	\N
1	Geben Sie den Inhalt des Verzeichnisses Dokumente des angemeldeten Benutzers auf der Console aus. Nennen Sie die Datei 'verzeichnis.sh'	Text	1	5	\N	2014-02-09 10:31:02.245716	2014-02-09 11:57:13.197696	o	\N
4	Legen Sie eine Datei parameter.sh an. Wenn diese Datei aufgerufen wird, dann soll der Name der Datei und des 1. Parameters auf der Console ausgegeben werden. Rufen Sie die Datei anschließend mit: './paramter.sh DiesIstEinVersuch' auf	Text	1	5	\N	2014-02-09 12:40:45.976074	2014-02-09 12:40:45.976074	o	\N
5	Das Skript verzeichnis_exists.sh testet ob das Verzeichnis 'NewDir'  im aktuellen Home-Verzeichnis des Users existiert. Ist dies nicht der Fall, so wird dieses Verzeichnis angelegt. Existiert es bereits, gibt es den Namen des Verzeichnisses auf der Konsole aus.	Text	1	10	\N	2014-02-09 13:32:13.011013	2014-02-09 13:32:13.011013	o	\N
6	Das Skript dateien_anlegen.sh in den Ordner 'NewDir'. Es schaut nach, ob dort die Dateien datei1.txt und datei2.txt existiert. Falls die Dateien existieren werden Sie gemeinsam, also mit einem Befehl gelöscht. In die neuerstellte Datei datei1.txt wird mit Hilfe einer while-schleife 30 mal die Zeichenfolge 'Achtung, Achtung, wilder Affe trampelt alles nieder.'	Text	1	10	\N	2014-02-09 13:34:17.071033	2014-02-09 13:38:45.484561	o	\N
7	Das Programm 'systemzeit.sh' schreibt die  Systemzeit und die auf dem Rechner angemeldeten Benutzer in die Ausgabe.	Text	1	5	\N	2014-02-09 13:41:00.814199	2014-02-09 13:41:00.814199	o	\N
8	Schreiben Sie ein Shellskript 'pseudocode.sh', das den größten gemeinsamen Teiler (GGT) zweier\r\nganzzahliger Argumente berechnet und ausgibt. Nutzen Sie den Pseudocode:\r\n     GGT(a,b)\r\n     Wenn a = 0\r\n         Dann gebe b aus\r\n         Sonst solange b <> 0\r\n                   Wenn a > b\r\n                           Dann a = a – b\r\n                           Sonst b = b - a\r\n     Gebe a aus	Text	1	10	\N	2014-02-09 13:43:50.708277	2014-02-09 13:49:03.188089	o	\N
9	Überprüfen Sie mit dem Skript 'exists_user.sh', ob der Benutzer 'theo' auf ihrem System existiert. Falls ja soll die ID des Users ausgegeben werden, falls nein soll das Skript mit der Fehlermeldung: 'User existiert nicht' terminieren.	Multiplechoice	1	10	\N	2014-02-09 14:12:20.505371	2014-02-09 14:12:20.505371	o	\N
10	Das Skript 'datum_speichern.sh' speichert das aktuelle Datum in der Form: '10.02.2014' in der Variable datum. Dann wird der Inhalt der Variablen auf der Console ausgegeben.	Text	1	5	\N	2014-02-09 14:37:57.248718	2014-02-09 14:37:57.248718	o	\N
11	Ermitteln SIe die Anzahl der Dateien, die sich in dem Verzeichnis /etc befinden in der Variable datei_count. Skriptname datei_count.sh. 	Text	1	5	\N	2014-02-09 14:40:16.164066	2014-02-09 14:40:16.164066	o	\N
12	Downloaden Sie die Datei mr-universum.txt von der Dokumentenseite. Geben SIe die Zeilen dieser Datei zeilenweise aus. Das Skript heißt: zeilen_ausgeben.sh	Text	1	10	\N	2014-02-09 14:42:47.88349	2014-02-09 14:52:31.715965	o	\N
13	Nutzen Sie die Datei mr-universum. Das Skript mr_universum.sh sucht in dieser Datei mit dem Befehl grep nach dem Mr. Universum des Jahres 1976 und gibt ihn auf der Console aus.	Text	1	10	\N	2014-02-09 14:56:12.611659	2014-02-09 14:56:12.611659	o	\N
14	Programmieren Sie einen kleinen Rechner. Das Bash-Skript 'rechner.sh' fordert den Benutzer auf nacheinander zwei Zahlen einzugeben. Sie überprüfen, ob der User tatsächlich Zahlen eingegeben hat. Dann multiplizieren Sie die Zahlen und geben das Ergebnis aus. Dananch wird der User wieder aufgefordert zwei Zahlen einzugeben. Das Programm läuft solange, bis der User 'exit' eingibt.	Text	1	10	\N	2014-02-09 16:37:14.790767	2014-02-09 16:37:14.790767	o	\N
32	Für welches Verzeichnis im UNIX-Verzeichnisbaum steht die Abkürzung ~ ?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.487719	2014-02-15 10:34:52.00392	o	\N
18	Nach welchem Prinzip arbeiten Computer?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:44.982657	2014-02-15 10:34:59.809083	o	\N
27	Was bedeutet "Bootstrapping" beim Betriebssytem?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.275803	2014-02-15 10:35:22.445118	o	\N
28	Welche Aussage über die Betriebsmodi eines Betriebssystems trifft zu?\n	Multiplechoice	2	1	\N	2014-02-15 10:31:45.350827	2014-02-15 14:40:08.94733	o	\N
24	Was ist eine GUI?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.174989	2014-02-15 10:35:35.220984	o	\N
29	Was ist kein Bestandteil einer Speicheradresse der Memory Management Unit (MMU) eines Intel-Prozessors?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.388412	2014-02-15 10:35:37.579212	o	\N
23	Welches Betriebssystem gilt als das erste echte PC-Betriebssystem?\n	Multiplechoice	2	1	\N	2014-02-15 10:31:45.141531	2014-02-15 14:39:54.526522	o	\N
22	Was ist POSIX?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.108485	2014-02-15 10:35:42.206809	o	\N
36	Was zaehlt nicht zu den Merkmalen von Firmware\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.619825	2014-02-15 10:35:54.320746	o	\N
15	Welche Aussage muss nicht erfuellt sein, damit ein Geraet als Computer bezeichnet werden kann\n	Multiplechoice	2	2	\N	2014-02-15 10:31:44.86523	2014-02-15 10:36:05.62479	o	\N
39	Der erste Linux-Kernel wurde von folgender Person geschrieben:\n	Multiplechoice	2	1	\N	2014-02-15 10:31:45.724757	2014-02-15 14:42:27.033145	o	\N
20	Welche Prgrammiersprache wurde 1971 zur Neuimplementierung von UNIX entwickelt?\n	Multiplechoice	2	1	\N	2014-02-15 10:31:45.041991	2014-02-15 14:41:50.500664	o	\N
16	Welche beiden Bestandteile machen die Hardware eines Computers aus?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:44.916244	2014-02-15 10:36:28.996016	o	\N
26	Welche der folgenden Aussagen über den Kernel trifft zu?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.242168	2014-02-15 10:36:35.410196	o	\N
37	Welche Eigenschaft beschreibt am besten ein multiuserfaehiges Betriebssystem:\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.652613	2014-02-15 10:36:44.35616	o	\N
17	Welches der folgenden Elemente ist kein Bestandteil der Zentraleinheit?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:44.949835	2014-02-15 10:37:16.320769	o	\N
19	Wie hieß das Betriebssystem, das die Entwicklung von UNIX inspirierte?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.016463	2014-02-15 10:37:36.137297	o	\N
25	Wofür steht die Abkürzung GNU?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.208535	2014-02-15 10:37:40.478761	o	\N
21	An welcher Universität wurde UNIX weiterentwickelt?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.075372	2014-02-15 10:32:07.062297	o	\N
67	Auf der Basis von OpenSourceSoftware kann man kein Geld verdienen mit ...\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.565887	2014-02-15 10:32:12.597124	o	\N
46	Was versteht man unter "The EPOCHE" im Linux/Unix-Umfeld?\n	Multiplechoice	2	1	\N	2014-02-15 10:31:45.946313	2014-02-15 14:40:28.572379	o	\N
76	Welche Zuordnung stimmt für grafische Arbeitsumgebungen\n	Multiplechoice	2	1	\N	2014-02-15 10:31:46.738352	2014-02-15 14:41:56.347293	o	\N
75	Welche Aussage zum Thema Kernel ist falsch:\n	Multiplechoice	2	1	\N	2014-02-15 10:31:46.719573	2014-02-15 14:42:14.413079	o	\N
53	Richard Stallman ist nicht der Begründer\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.171476	2014-02-15 10:35:02.195941	o	\N
54	Unix hieß ursprünglich\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.211295	2014-02-15 10:35:04.280795	o	\N
63	Urheberrecht bedeutet nicht:\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.48685	2014-02-15 10:35:11.017638	o	\N
52	Von wem wurde das GNU-Projekt gegründet?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.138399	2014-02-15 10:35:12.956751	o	\N
44	Von wem wurde die erste Version von Unix geschrieben?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.881525	2014-02-15 10:35:15.480849	o	\N
55	Wann wurde Linux unter die GNU GPL gestellt?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.244724	2014-02-15 10:35:20.125104	o	\N
51	Was bedeutet GNU?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.111625	2014-02-15 10:35:28.734075	o	\N
43	Was wurde von Linux Torvalds entwickelt?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.849096	2014-02-15 10:35:52.754281	o	\N
61	Welche Aussage charakterisiert den Zusammenhang von Unix und Minix\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.440377	2014-02-15 10:35:58.73757	o	\N
62	Welche Aussage ist falsch. Bei Linux gilt grundsätzlich ... \n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.468208	2014-02-15 10:36:00.563709	o	\N
59	Welche Aussage stimmt fuer die Entstehung von Unix\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.384661	2014-02-15 10:36:10.729356	o	\N
50	Welche Aussage stimmt nicht? Freie Software / OpenSource-Software ist Sofware, \n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.078424	2014-02-15 10:36:12.941957	o	\N
85	Datei und Pfad zur Konfiguration einer Netzwerkkarte heissen:\n	0	3	5	\N	2014-02-19 21:13:34.424195	2014-02-19 21:13:34.424195	o	\N
78	Welches Protokoll ist auf Geschwindigkeit des Versands von Datenpaketen konzipiert\n	0	3	5	\N	2014-02-19 21:13:34.116868	2014-02-19 21:13:34.116868	o	\N
49	Welche der folgenden Aussagen stehen nicht im Einklang mit der Linux bzw. Unix-Philosophie?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.03853	2014-02-15 10:36:33.172427	o	\N
71	Welche Distribution basiert auf der Paketverwaltung DEB\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.644995	2014-02-15 10:36:37.545823	o	\N
73	Welche Distribution ist auf Server spezialisiert?\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.682302	2014-02-15 10:36:39.638911	o	\N
72	Welche Distribution wird von einer nicht firmengebundenen Community gepflegt\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.663626	2014-02-15 10:36:42.042805	o	\N
86	Der korrekte Eintrag in der Netzwerk-Konfigurations-Datei fuer die Aktivierung eines dhcp-Servers fuer die zweite Netzwerkkarte lautet:\n	0	3	5	\N	2014-02-19 21:13:34.457095	2014-02-19 21:13:34.457095	o	\N
74	Welche Zuordnung von Paketverwaltungen und Distribution trifft zu:\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.701006	2014-02-15 10:36:55.26226	o	\N
57	Welcher Entwickler hat entscheidenden Anteil am Entstehen von Linux\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.310945	2014-02-15 10:36:59.488281	o	\N
56	Welcher Entwickler hat entscheidenden Anteil am Entstehen von Unix\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.277778	2014-02-15 10:37:03.315359	o	\N
65	Welcher Grund hat am Entstehen des GNU-Systems keinen Anteil\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.519446	2014-02-15 10:37:06.360443	o	\N
60	Welches Aussage charakterisiert den Zusammenhang zwischen BSD und Unix\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.412515	2014-02-15 10:37:08.562187	o	\N
64	Welches Aussage charakterisiert die Softwareproduktion in den 60er und 70er Jahren am Besten\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.500877	2014-02-15 10:37:12.21257	o	\N
69	Welches Lizenzmodelle ist nicht im Umfeld von OpenSource\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.60311	2014-02-15 10:37:18.545624	o	\N
38	Welches Merkmal charakterisiert am wenigsten die wesentlichen Funktionen eines Betriebsystems\n	Multiplechoice	2	2	\N	2014-02-15 10:31:45.685484	2014-02-15 10:37:26.933079	o	\N
70	Welches Merkmal gilt nicht für alle Linux-Distributionen \n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.626349	2014-02-15 10:37:29.912277	o	\N
66	Welches Merkmal trifft für freie Software im Sinne des GNU-Systems nicht zu\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.542663	2014-02-15 10:37:31.9068	o	\N
68	Wozu ist man verpflichtet, wenn man unter der GPL (General Public License) veröffentlichte Software weiterentwickelt\n	Multiplechoice	2	2	\N	2014-02-15 10:31:46.589109	2014-02-15 10:37:42.812308	o	\N
40	Linux gibt es seit\n	Multiplechoice	2	1	\N	2014-02-15 10:31:45.757424	2014-02-15 10:38:14.973436	o	\N
45	In welchem Jahr entstand die erste Version von Unix?\n	Multiplechoice	2	1	\N	2014-02-15 10:31:45.913926	2014-02-15 10:38:20.655496	o	\N
48	Die erste X-Oberfläche gibt es in Linux seit:\n	Multiplechoice	2	1	\N	2014-02-15 10:31:46.005283	2014-02-15 10:39:25.92398	o	\N
47	Wann beginnt die offzielle Unixzeit?\n	Multiplechoice	2	1	\N	2014-02-15 10:31:45.97237	2014-02-15 14:37:03.552238	o	\N
42	Welchem Betriebssystem ist Linux ähnlich?\n	Multiplechoice	2	1	\N	2014-02-15 10:31:45.822975	2014-02-15 14:38:35.781559	o	\N
58	Welcher Entwickler hat entscheidenden Anteil am Entstehen von Minix\n	Multiplechoice	2	1	\N	2014-02-15 10:31:46.362266	2014-02-15 14:39:43.941909	o	\N
41	Welche der folgenden Aussagen ist nicht korrekt?\n	Multiplechoice	2	1	\N	2014-02-15 10:31:45.790453	2014-02-15 14:40:17.497905	o	\N
87	Der korrekte Eintrag in der Netzwerk-Konfigurations-Datei  fuer die DNS-Server lautet:\n	0	3	5	\N	2014-02-19 21:13:34.489763	2014-02-19 21:13:34.489763	o	\N
88	Der korrekte Eintrag in der Netzwerk-Konfigurations-Datei  fuer die Standardgateway lautet:\n	0	3	5	\N	2014-02-19 21:13:34.516207	2014-02-19 21:13:34.516207	o	\N
89	Der korrekte Eintrag in der Netzwerk-Konfigurations-Datei  fuer die Konfiguration der ersten Netzwerkkarte mit einer festen IP-Adresse lautet:\n	0	3	5	\N	2014-02-19 21:13:34.548739	2014-02-19 21:13:34.548739	o	\N
84	Welches Protokoll ermittelt den Endpunkt einer Kommunikation\n	0	3	5	\N	2014-02-19 21:13:34.378468	2014-02-20 04:49:19.62131	f	\N
79	Welches Protokoll nutzt der ping-Befehl\n	0	3	5	\N	2014-02-19 21:13:34.162128	2014-02-20 04:49:37.297189	f	\N
83	Welches Protokoll wird zum Transport von Mail-Nachrichten verwendet\n	0	3	5	\N	2014-02-19 21:13:34.332676	2014-02-20 04:49:41.971173	f	\N
82	Welches Protokoll wird speziell zur Uebertragung von Dateien verwendet\n	0	3	5	\N	2014-02-19 21:13:34.286617	2014-02-20 04:49:46.055623	f	\N
81	Welches Protokoll wird als verbindungsorientiertes Transportprotokoll bezeichnet\n	0	3	5	\N	2014-02-19 21:13:34.240573	2014-02-20 04:49:49.721263	f	\N
80	Welches Protokoll sorgt fuer einen zuverlässigen Transport der Datenpakete\n	0	3	5	\N	2014-02-19 21:13:34.201404	2014-02-20 04:49:54.546114	f	\N
90	Der Name des Rechners steht in der Datei:\n	0	3	5	\N	2014-02-19 21:13:34.574903	2014-02-19 21:13:34.574903	o	\N
91	Der Befehl zum Anzeigen der aktuellen Netzwerkkonfiguration lautet:\n	0	3	5	\N	2014-02-19 21:13:34.601486	2014-02-19 21:13:34.601486	o	\N
92	Der Befehl zur temporären Konfiguration der 1. Netzwerkkarte lautet:\n	0	3	5	\N	2014-02-19 21:13:34.621461	2014-02-19 21:13:34.621461	o	\N
93	Der Befehl zum Anzeigen und Ändern der Standardgateway lautet:\n	0	3	5	\N	2014-02-19 21:13:34.65428	2014-02-19 21:13:34.65428	o	\N
95	Eine Liste der Wellknown-Ports ist in der Datei:\n	0	3	5	\N	2014-02-19 21:13:34.713523	2014-02-19 21:13:34.713523	o	\N
96	Eine DNS-Abfrage bei der zu einer IP-Adresse ein Name ermittelt wird heisst:\n	0	3	5	\N	2014-02-19 21:13:34.740484	2014-02-19 21:13:34.740484	o	\N
97	Das Kommando, das die aktuell offenen Ports von g16-hh.de anzeigt lautet:\n	0	3	5	\N	2014-02-19 21:13:34.767591	2014-02-19 21:13:34.767591	o	\N
98	Die Aufgabe des DNS-Servers besteht in:\n	0	3	5	\N	2014-02-19 21:13:34.801248	2014-02-19 21:13:34.801248	o	\N
99	Das Programm zur effizienten Identifikation eines defekten Routers heisst:\n	0	3	5	\N	2014-02-19 21:13:34.828472	2014-02-19 21:13:34.828472	o	\N
100	Der Befehl <host heise.de> liefert:\n	0	3	5	\N	2014-02-19 21:13:34.862248	2014-02-19 21:13:34.862248	o	\N
101	Der Befehl dig heise.de liefert:\n	0	3	5	\N	2014-02-19 21:13:34.889546	2014-02-19 21:13:34.889546	o	\N
102	Welche Art der Adressauflösung führt ARP durch?\n	0	3	5	\N	2014-02-19 21:13:34.916568	2014-02-19 21:13:34.916568	o	\N
103	Mit welchem Bitmuster beginnt eine IP-Adresse der Klasse C?\n	0	3	5	\N	2014-02-19 21:13:34.95028	2014-02-19 21:13:34.95028	o	\N
104	In welchem Bereich liegt das erste Byte einer IP-Adresse der Klasse B?\n	0	3	5	\N	2014-02-19 21:13:34.984002	2014-02-19 21:13:34.984002	o	\N
105	Welche der folgenden IP-Adressen gehört nach Klassenlogik nicht mit den drei anderen in ein Teilnetz?\n	0	3	5	\N	2014-02-19 21:13:35.017712	2014-02-19 21:13:35.017712	o	\N
106	Zu welchem Netzwerk gehört die IP-Adresse 152.14.21.7 nach Klassenlogik?\n	0	3	5	\N	2014-02-19 21:13:35.051177	2014-02-19 21:13:35.051177	o	\N
107	Zu welchem der folgenden Netze gehört die IP-Adresse 196.17.8.92 nicht?\n	0	3	5	\N	2014-02-19 21:13:35.131184	2014-02-19 21:13:35.131184	o	\N
108	Das Netz 156.19.0.0/16 wird per CIDR in vier gleich große Netze unterteilt. Welches der folgenden ist eines der neuen Teilnetze?\n	0	3	5	\N	2014-02-19 21:13:35.154762	2014-02-19 21:13:35.154762	o	\N
109	Wie viele Hosts kann jedes Teilnetz maximal enthalten, wenn ein Klasse-C-Netz in vier Teile unterteilt wird?\n	0	3	5	\N	2014-02-19 21:13:35.178058	2014-02-19 21:13:35.178058	o	\N
110	Welche Bedeutung besitzt der TTL-Wert (Time To Live) im IP-Datagramm?\n	0	3	5	\N	2014-02-19 21:13:35.201347	2014-02-19 21:13:35.201347	o	\N
111	Zu welchem Problem können unterschiedliche MTUs verschiedener Netzwerkschnittstellen bei IP-Datagrammen führen?\n	0	3	5	\N	2014-02-19 21:13:35.224711	2014-02-19 21:13:35.224711	o	\N
112	Was ist die genaue Definition eines Default Gateway?\n	0	3	5	\N	2014-02-19 21:13:35.248043	2014-02-19 21:13:35.248043	o	\N
113	Welche Adresse ist von dem Netzwerk 156.81.0.0/19 aus nur über einen Router zu erreichen?\n	0	3	5	\N	2014-02-19 21:13:35.271489	2014-02-19 21:13:35.271489	o	\N
114	Das Netzwerk 152.17.0.0/17 ist über drei Router mit anderen Netzen verbunden: r1 für das Netzwerk 152.17.128.0/17, r2 für 152.18.0.0/16 und r3 für alle anderen Netze. Welcher Router wird für eine Verbindung zur Adresse 152.18.210.22 verwendet?\n	0	3	5	\N	2014-02-19 21:13:35.294767	2014-02-19 21:13:35.294767	o	\N
115	Was wird im Zusammenhang mit IP-Routing als autonomes System bezeichnet?\n	0	3	5	\N	2014-02-19 21:13:35.317975	2014-02-19 21:13:35.317975	o	\N
116	Zu welchem Zweck wird ein internes Routing-Protokoll eingesetzt?\n	0	3	5	\N	2014-02-19 21:13:35.341349	2014-02-19 21:13:35.341349	o	\N
117	Welches der folgenden Routing-Protokolle ist ein externes Routing-Protokoll?\n	0	3	5	\N	2014-02-19 21:13:35.365385	2014-02-19 21:13:35.365385	o	\N
118	Wie viele Hops sind die maximalen Kosten, die ein RIP-Router für eine Verbindung speichert?\n	0	3	5	\N	2014-02-19 21:13:35.388763	2014-02-19 21:13:35.388763	o	\N
119	Welcher TCP/IP-Dienst ermöglicht die automatische Vergabe von IP-Adressen?\n	0	3	5	\N	2014-02-19 21:13:35.412107	2014-02-19 21:13:35.412107	o	\N
120	Wie lang ist eine IPv6-Adresse?\n	0	3	5	\N	2014-02-19 21:13:35.435537	2014-02-19 21:13:35.435537	o	\N
122	Welche Flags sind (nacheinander) bei den drei Datenpaketen gesetzt, die den Drei-Wege-Handshake bei TCP bilden?\n	0	3	5	\N	2014-02-19 21:13:35.535504	2014-02-19 21:13:35.535504	o	\N
123	Welche TCP-Portnummern sind "Well-known Ports" - festgelegte Portnummern für Serverdienste?\n	0	3	5	\N	2014-02-19 21:13:35.558826	2014-02-19 21:13:35.558826	o	\N
124	Was ist der Vorteil von UDP gegenüber TCP als Transportprotokoll?\n	0	3	5	\N	2014-02-19 21:13:35.58206	2014-02-19 21:13:35.58206	o	\N
125	Welchen TCP-Port verwendet ein Webserver?\n	0	3	5	\N	2014-02-19 21:13:35.605364	2014-02-19 21:13:35.605364	o	\N
126	Welcher Serverdienst verwendet den TCP-Port 23?\n	0	3	5	\N	2014-02-19 21:13:35.628601	2014-02-19 21:13:35.628601	o	\N
127	Aus welcher Datei können auf einem UNIX-System Adressauflösungen von Hostnamen gelesen werden?\n	0	3	5	\N	2014-02-19 21:13:35.651633	2014-02-19 21:13:35.651633	o	\N
128	Was ist keine Aufgabe eines Netzwerks?\n	0	3	5	\N	2014-02-19 21:13:35.674432	2014-02-19 21:13:35.674432	o	\N
131	Welcher bis heute bedeutende Internetdienst wurde 1972 erfunden?\n	0	3	5	\N	2014-02-19 21:13:35.743423	2014-02-19 21:13:35.743423	o	\N
132	Wo wurde das kabelbasierte Ethernet entwickelt?\n	0	3	5	\N	2014-02-19 21:13:35.766403	2014-02-19 21:13:35.766403	o	\N
136	Was war die entscheidende Neuerung am World Wide Web?\n	0	3	5	\N	2014-02-19 21:13:35.858731	2014-02-19 21:13:35.858731	o	\N
137	Wie heißt das Protokoll, das für die WWW-Kommunikation verwendet wird?\n	0	3	5	\N	2014-02-19 21:13:35.881653	2014-02-19 21:13:35.881653	o	\N
138	Welche OSI-Schicht ist Nummer 3?\n	0	3	5	\N	2014-02-19 21:13:35.904474	2014-02-19 21:13:35.904474	o	\N
130	Aus wie vielen Computern bestand das ARPANet bei seiner Einführung?\n	0	3	5	\N	2014-02-19 21:13:35.720356	2014-02-20 04:46:01.927938	a	\N
140	Was ist eine Aufgabe der OSI-Sicherungsschicht?\n	0	3	5	\N	2014-02-19 21:13:35.950161	2014-02-20 04:47:21.596508	a	\N
134	Mit welchem Netz wurde der zivile Teil des ARPANet zum Internet zusammengeschlossen?\n	0	3	5	\N	2014-02-19 21:13:35.812177	2014-02-20 04:47:10.304948	a	\N
139	Welche Nummer hat die OSI-Darstellungsschicht\n	0	3	5	\N	2014-02-19 21:13:35.927404	2014-02-20 04:48:18.796206	a	\N
135	Welche Geräte wurden als erste zur Datenfernübertragung verwendet?\n	0	3	5	\N	2014-02-19 21:13:35.834974	2014-02-20 04:48:08.679656	aa	\N
142	Welcher OSI-Schicht entspricht die DDN-Internetschicht in etwa?\n	0	3	5	\N	2014-02-19 21:13:35.995895	2014-02-20 04:48:36.862851	a	\N
143	Welches der folgenden Protokolle arbeitet auf der DDN-Transportschicht?\n	0	3	5	\N	2014-02-19 21:13:36.026596	2014-02-20 04:49:01.454538	d	\N
141	Welches ist keine Schicht im Schichtenmodell nach dem DDN Standard Protocol Handbook?\n	0	3	5	\N	2014-02-19 21:13:35.972999	2014-02-20 04:49:28.671161	d	\N
121	Welches Transportprotokoll verwendet das Verbindungstestprogramm Ping?\n	0	3	5	\N	2014-02-19 21:13:35.458823	2014-02-20 04:50:13.637042	f	\N
133	Wie werden die Standards des Internets dokumentiert?\n	0	3	5	\N	2014-02-19 21:13:35.789333	2014-02-20 04:50:21.562572	b	\N
144	Welche Netzwerkarte hat die größte Reichweite?\n	0	3	5	\N	2014-02-19 21:13:36.059764	2014-02-19 21:13:36.059764	o	\N
147	Welcher der folgenden Netzwerkdienste wird typischerweise als Peer-to-Peer- und nicht als Client-Server-Dienst bereitgestellt?\n	0	3	5	\N	2014-02-19 21:13:36.158249	2014-02-19 21:13:36.158249	o	\N
148	Welcher Linux-Befehl ermöglicht die Konfiguration von Netzwerkschnittstellen?\n	0	3	5	\N	2014-02-19 21:13:36.190769	2014-02-19 21:13:36.190769	o	\N
149	Mit welchem Befehl lässt sich unter Linux 192.168.1.1 als Default Gateway festlegen?\n	0	3	5	\N	2014-02-19 21:13:36.223681	2014-02-19 21:13:36.223681	o	\N
150	Welche Aufgabe erfüllt das Dienstprogramm ping?\n	0	3	5	\N	2014-02-19 21:13:36.256431	2014-02-19 21:13:36.256431	o	\N
152	Welche netstat-Variante gibt unter UNIX die Routing-Tabellen aus?\n	0	3	5	\N	2014-02-19 21:13:36.353429	2014-02-19 21:13:36.353429	o	\N
154	Welche der folgenden Aussagen treffen für IP-Adressen  nicht zu?\n	0	3	5	\N	2014-02-19 21:13:36.392531	2014-02-19 21:13:36.392531	o	\N
155	Mit welchem Befehl (ohne Angabe von Parametern) kann man die Interfaces vom Ehternet-Netzwerk konfigurieren?\n	0	3	5	\N	2014-02-19 21:13:36.411093	2014-02-19 21:13:36.411093	o	\N
156	Welche Zusammenhänge bestehen nicht zwischen einem Domain-Namen und einer IP-Adresse?\n	0	3	5	\N	2014-02-19 21:13:36.434385	2014-02-19 21:13:36.434385	o	\N
157	Was versteht man unter der MAC-Adresse?\n	0	3	5	\N	2014-02-19 21:13:36.453137	2014-02-19 21:13:36.453137	o	\N
158	Was versteht man unter eine Netzmaske?\n	0	3	5	\N	2014-02-19 21:13:36.472011	2014-02-19 21:13:36.472011	o	\N
159	Wie kann man die Schreibweise 192.168.100.22/25 interpretieren?\n	0	3	5	\N	2014-02-19 21:13:36.49081	2014-02-19 21:13:36.49081	o	\N
160	Was versteht man unter einem privaten Netzwerk?\n	0	3	5	\N	2014-02-19 21:13:36.509641	2014-02-19 21:13:36.509641	o	\N
161	Welche der folgenden Portzuordnung ist falsch?\n	0	3	5	\N	2014-02-19 21:13:36.528489	2014-02-19 21:13:36.528489	o	\N
162	Bei welchem der folgenden Subnetze handelt es sich um kein privates Netzwerk?\n	0	3	5	\N	2014-02-19 21:13:36.551852	2014-02-19 21:13:36.551852	o	\N
163	Welche der folgenden Portzuordnung ist nicht korrekt?\n	0	3	5	\N	2014-02-19 21:13:36.579818	2014-02-19 21:13:36.579818	o	\N
164	In welcher Datei findet man auf einem Unix- oder Linux-System die Liste der Ports?\n	0	3	5	\N	2014-02-19 21:13:36.612428	2014-02-19 21:13:36.612428	o	\N
166	Ein Netzwerk soll so konfiguriert werden, dass sich ein Nutzer mit seiner gewohnten Arbeitsumgebung an einem beliebigen Rechner einloggen kann. Welche Verzeichnis sollte dazu per NFS exportiert werden?\n	0	3	5	\N	2014-02-19 21:13:36.663744	2014-02-19 21:13:36.663744	o	\N
167	Welchen der folgenden Dienste benötigt man, wenn man einen Linuxrechner in ein Windows-Netzwerk mit WINS-Server integrieren will?\n	0	3	5	\N	2014-02-19 21:13:36.687089	2014-02-19 21:13:36.687089	o	\N
94	Ein Standard Linux-System hat an aktiven Ports:	Multiplechoice	3	5	\N	2014-02-19 21:13:34.680639	2014-02-19 21:15:16.284337	o	\N
151	Auf welche Weise erreicht es traceroute, dass ein Router nach dem anderen antwortet?\r\n	Multiplechoice	3	1	\N	2014-02-19 21:13:36.289078	2014-02-20 04:25:04.838667	o	\N
145	Bei welcher Netzwerktopologie sind alle Stationen mit einem zentralen Verteiler verbunden?\n	0	3	5	\N	2014-02-19 21:13:36.092984	2014-02-20 04:45:39.403605	dd	\N
146	Bei welchem Netzwerk unterscheidet sich die physikalische von der logischen Topologie?\n	0	3	5	\N	2014-02-19 21:13:36.125552	2014-02-20 04:45:54.923653	d	\N
129	Welches der folgenden Merkmale gehört nicht zwangsläufig zur paketvermittelten Datenübertragung?\n	0	3	5	\N	2014-02-19 21:13:35.697338	2014-02-20 04:48:54.154405	d	\N
77	Welches Protokoll ist speziell fuer VoiceOverIp konzipiert\n	0	3	5	\N	2014-02-19 21:13:34.049047	2014-02-20 04:49:16.077492	f	\N
153	Welches TCP/IP-Dienstprogramm befragt Nameserver?\n	0	3	5	\N	2014-02-19 21:13:36.372158	2014-02-20 04:50:04.376339	f	\N
165	Mit Hilfe von welcher Datei kann man in einem kleinen Netzwerk eine Namensauflösung realisieren, ohnen einen Nameserver zu benutzen?\n	0	3	1	\N	2014-02-19 21:13:36.635942	2014-02-20 04:51:51.787216	o	\N
\.


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('questions_id_seq', 167, true);


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
20140210142133
20140211080023
20140211083442
20140211090645
20140212063144
20140212071911
20140214121444
20140216065219
\.


--
-- Data for Name: studentanswers; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY studentanswers (id, question_id, studenttest_id, points, created_at, updated_at, answer_id, result, selected) FROM stdin;
1	15	1	0	2014-02-15 10:33:06.600447	2014-02-15 10:33:06.600447	3	\N	f
2	15	1	0	2014-02-15 10:33:06.604872	2014-02-15 10:33:06.604872	4	\N	f
3	15	1	0	2014-02-15 10:33:06.607136	2014-02-15 10:33:06.607136	5	\N	f
4	15	1	2	2014-02-15 10:33:06.609338	2014-02-15 10:33:06.609338	6	\N	f
5	16	1	0	2014-02-15 10:33:06.613579	2014-02-15 10:33:06.613579	7	\N	f
6	16	1	2	2014-02-15 10:33:06.615876	2014-02-15 10:33:06.615876	8	\N	f
7	16	1	0	2014-02-15 10:33:06.618057	2014-02-15 10:33:06.618057	9	\N	f
8	16	1	0	2014-02-15 10:33:06.620163	2014-02-15 10:33:06.620163	10	\N	f
9	17	1	0	2014-02-15 10:33:06.624027	2014-02-15 10:33:06.624027	11	\N	f
10	17	1	0	2014-02-15 10:33:06.626116	2014-02-15 10:33:06.626116	12	\N	f
11	17	1	2	2014-02-15 10:33:06.628268	2014-02-15 10:33:06.628268	13	\N	f
12	17	1	0	2014-02-15 10:33:06.630343	2014-02-15 10:33:06.630343	14	\N	f
13	18	1	0	2014-02-15 10:33:06.634137	2014-02-15 10:33:06.634137	15	\N	f
14	18	1	2	2014-02-15 10:33:06.636259	2014-02-15 10:33:06.636259	16	\N	f
15	18	1	0	2014-02-15 10:33:06.638374	2014-02-15 10:33:06.638374	17	\N	f
16	18	1	0	2014-02-15 10:33:06.640497	2014-02-15 10:33:06.640497	18	\N	f
17	19	1	0	2014-02-15 10:33:06.644308	2014-02-15 10:33:06.644308	19	\N	f
18	19	1	2	2014-02-15 10:33:06.646399	2014-02-15 10:33:06.646399	20	\N	f
19	19	1	0	2014-02-15 10:33:06.64849	2014-02-15 10:33:06.64849	21	\N	f
20	19	1	0	2014-02-15 10:33:06.650584	2014-02-15 10:33:06.650584	22	\N	f
21	20	1	0	2014-02-15 10:33:06.654437	2014-02-15 10:33:06.654437	23	\N	f
22	20	1	0	2014-02-15 10:33:06.656574	2014-02-15 10:33:06.656574	24	\N	f
23	20	1	2	2014-02-15 10:33:06.658653	2014-02-15 10:33:06.658653	25	\N	f
24	20	1	0	2014-02-15 10:33:06.660764	2014-02-15 10:33:06.660764	26	\N	f
25	22	1	0	2014-02-15 10:33:06.664804	2014-02-15 10:33:06.664804	31	\N	f
26	22	1	0	2014-02-15 10:33:06.667247	2014-02-15 10:33:06.667247	32	\N	f
27	22	1	2	2014-02-15 10:33:06.669722	2014-02-15 10:33:06.669722	33	\N	f
28	22	1	0	2014-02-15 10:33:06.672177	2014-02-15 10:33:06.672177	34	\N	f
29	23	1	0	2014-02-15 10:33:06.676582	2014-02-15 10:33:06.676582	35	\N	f
30	23	1	0	2014-02-15 10:33:06.67902	2014-02-15 10:33:06.67902	36	\N	f
31	23	1	2	2014-02-15 10:33:06.681472	2014-02-15 10:33:06.681472	37	\N	f
32	23	1	0	2014-02-15 10:33:06.683922	2014-02-15 10:33:06.683922	38	\N	f
33	24	1	2	2014-02-15 10:33:06.688318	2014-02-15 10:33:06.688318	39	\N	f
34	24	1	0	2014-02-15 10:33:06.690762	2014-02-15 10:33:06.690762	40	\N	f
35	24	1	0	2014-02-15 10:33:06.693236	2014-02-15 10:33:06.693236	41	\N	f
36	24	1	0	2014-02-15 10:33:06.695663	2014-02-15 10:33:06.695663	42	\N	f
37	25	1	0	2014-02-15 10:33:06.700092	2014-02-15 10:33:06.700092	43	\N	f
38	25	1	2	2014-02-15 10:33:06.702545	2014-02-15 10:33:06.702545	44	\N	f
39	25	1	0	2014-02-15 10:33:06.705044	2014-02-15 10:33:06.705044	45	\N	f
40	25	1	0	2014-02-15 10:33:06.707459	2014-02-15 10:33:06.707459	46	\N	f
41	26	1	0	2014-02-15 10:33:06.711858	2014-02-15 10:33:06.711858	47	\N	f
42	26	1	0	2014-02-15 10:33:06.714306	2014-02-15 10:33:06.714306	48	\N	f
43	26	1	2	2014-02-15 10:33:06.716768	2014-02-15 10:33:06.716768	49	\N	f
44	26	1	0	2014-02-15 10:33:06.719198	2014-02-15 10:33:06.719198	50	\N	f
45	27	1	0	2014-02-15 10:33:06.723551	2014-02-15 10:33:06.723551	51	\N	f
46	27	1	0	2014-02-15 10:33:06.72606	2014-02-15 10:33:06.72606	52	\N	f
47	27	1	0	2014-02-15 10:33:06.728511	2014-02-15 10:33:06.728511	53	\N	f
48	27	1	2	2014-02-15 10:33:06.730932	2014-02-15 10:33:06.730932	54	\N	f
49	28	1	0	2014-02-15 10:33:06.73529	2014-02-15 10:33:06.73529	55	\N	f
50	28	1	0	2014-02-15 10:33:06.737813	2014-02-15 10:33:06.737813	56	\N	f
51	28	1	0	2014-02-15 10:33:06.740276	2014-02-15 10:33:06.740276	57	\N	f
52	28	1	2	2014-02-15 10:33:06.74271	2014-02-15 10:33:06.74271	58	\N	f
53	29	1	0	2014-02-15 10:33:06.747083	2014-02-15 10:33:06.747083	59	\N	f
54	29	1	0	2014-02-15 10:33:06.749579	2014-02-15 10:33:06.749579	60	\N	f
55	29	1	0	2014-02-15 10:33:06.752025	2014-02-15 10:33:06.752025	61	\N	f
56	29	1	2	2014-02-15 10:33:06.754453	2014-02-15 10:33:06.754453	62	\N	f
57	30	1	0	2014-02-15 10:33:06.758841	2014-02-15 10:33:06.758841	63	\N	f
58	30	1	0	2014-02-15 10:33:06.761331	2014-02-15 10:33:06.761331	64	\N	f
59	30	1	2	2014-02-15 10:33:06.763789	2014-02-15 10:33:06.763789	65	\N	f
60	30	1	0	2014-02-15 10:33:06.766216	2014-02-15 10:33:06.766216	66	\N	f
61	31	1	0	2014-02-15 10:33:06.770537	2014-02-15 10:33:06.770537	67	\N	f
62	31	1	0	2014-02-15 10:33:06.773026	2014-02-15 10:33:06.773026	68	\N	f
63	31	1	0	2014-02-15 10:33:06.775451	2014-02-15 10:33:06.775451	69	\N	f
64	31	1	2	2014-02-15 10:33:06.777943	2014-02-15 10:33:06.777943	70	\N	f
65	32	1	0	2014-02-15 10:33:06.782282	2014-02-15 10:33:06.782282	71	\N	f
66	32	1	2	2014-02-15 10:33:06.784729	2014-02-15 10:33:06.784729	72	\N	f
67	32	1	0	2014-02-15 10:33:06.787164	2014-02-15 10:33:06.787164	73	\N	f
68	32	1	0	2014-02-15 10:33:06.789677	2014-02-15 10:33:06.789677	74	\N	f
69	33	1	0	2014-02-15 10:33:06.794027	2014-02-15 10:33:06.794027	75	\N	f
70	33	1	0	2014-02-15 10:33:06.796621	2014-02-15 10:33:06.796621	76	\N	f
71	33	1	2	2014-02-15 10:33:06.799307	2014-02-15 10:33:06.799307	77	\N	f
72	33	1	0	2014-02-15 10:33:06.80202	2014-02-15 10:33:06.80202	78	\N	f
73	34	1	0	2014-02-15 10:33:06.806774	2014-02-15 10:33:06.806774	79	\N	f
74	34	1	0	2014-02-15 10:33:06.809523	2014-02-15 10:33:06.809523	80	\N	f
75	34	1	2	2014-02-15 10:33:06.812237	2014-02-15 10:33:06.812237	81	\N	f
76	34	1	0	2014-02-15 10:33:06.81492	2014-02-15 10:33:06.81492	82	\N	f
77	35	1	0	2014-02-15 10:33:06.819641	2014-02-15 10:33:06.819641	83	\N	f
78	35	1	0	2014-02-15 10:33:06.822413	2014-02-15 10:33:06.822413	84	\N	f
79	35	1	2	2014-02-15 10:33:06.82515	2014-02-15 10:33:06.82515	85	\N	f
80	35	1	0	2014-02-15 10:33:06.827854	2014-02-15 10:33:06.827854	86	\N	f
81	36	1	0	2014-02-15 10:33:06.832616	2014-02-15 10:33:06.832616	87	\N	f
82	36	1	0	2014-02-15 10:33:06.835314	2014-02-15 10:33:06.835314	88	\N	f
83	36	1	0	2014-02-15 10:33:06.838021	2014-02-15 10:33:06.838021	89	\N	f
84	36	1	2	2014-02-15 10:33:06.840725	2014-02-15 10:33:06.840725	90	\N	f
85	37	1	0	2014-02-15 10:33:06.845494	2014-02-15 10:33:06.845494	91	\N	f
86	37	1	0	2014-02-15 10:33:06.848254	2014-02-15 10:33:06.848254	92	\N	f
87	37	1	2	2014-02-15 10:33:06.850947	2014-02-15 10:33:06.850947	93	\N	f
88	37	1	0	2014-02-15 10:33:06.853655	2014-02-15 10:33:06.853655	94	\N	f
89	38	1	0	2014-02-15 10:33:06.858502	2014-02-15 10:33:06.858502	95	\N	f
90	38	1	2	2014-02-15 10:33:06.861244	2014-02-15 10:33:06.861244	96	\N	f
91	38	1	0	2014-02-15 10:33:06.863954	2014-02-15 10:33:06.863954	97	\N	f
92	38	1	0	2014-02-15 10:33:06.866656	2014-02-15 10:33:06.866656	98	\N	f
93	38	1	0	2014-02-15 10:33:06.869344	2014-02-15 10:33:06.869344	99	\N	f
94	39	1	0	2014-02-15 10:33:06.874074	2014-02-15 10:33:06.874074	100	\N	f
95	39	1	0	2014-02-15 10:33:06.876798	2014-02-15 10:33:06.876798	101	\N	f
96	39	1	0	2014-02-15 10:33:06.879489	2014-02-15 10:33:06.879489	102	\N	f
97	39	1	2	2014-02-15 10:33:06.882236	2014-02-15 10:33:06.882236	103	\N	f
98	40	1	0	2014-02-15 10:33:06.887013	2014-02-15 10:33:06.887013	104	\N	f
99	40	1	0	2014-02-15 10:33:06.88975	2014-02-15 10:33:06.88975	105	\N	f
100	40	1	2	2014-02-15 10:33:06.892499	2014-02-15 10:33:06.892499	106	\N	f
101	40	1	0	2014-02-15 10:33:06.89518	2014-02-15 10:33:06.89518	107	\N	f
102	41	1	0	2014-02-15 10:33:06.899956	2014-02-15 10:33:06.899956	108	\N	f
103	41	1	0	2014-02-15 10:33:06.902657	2014-02-15 10:33:06.902657	109	\N	f
104	41	1	2	2014-02-15 10:33:06.905351	2014-02-15 10:33:06.905351	110	\N	f
105	41	1	0	2014-02-15 10:33:06.908065	2014-02-15 10:33:06.908065	111	\N	f
106	42	1	0	2014-02-15 10:33:06.91272	2014-02-15 10:33:06.91272	112	\N	f
107	42	1	0	2014-02-15 10:33:06.915448	2014-02-15 10:33:06.915448	113	\N	f
108	42	1	2	2014-02-15 10:33:06.918205	2014-02-15 10:33:06.918205	114	\N	f
109	43	1	2	2014-02-15 10:33:06.96916	2014-02-15 10:33:06.96916	115	\N	f
110	43	1	0	2014-02-15 10:33:06.972171	2014-02-15 10:33:06.972171	116	\N	f
111	43	1	0	2014-02-15 10:33:06.974973	2014-02-15 10:33:06.974973	117	\N	f
112	43	1	0	2014-02-15 10:33:06.977834	2014-02-15 10:33:06.977834	118	\N	f
113	44	1	0	2014-02-15 10:33:06.982772	2014-02-15 10:33:06.982772	119	\N	f
114	44	1	2	2014-02-15 10:33:06.985621	2014-02-15 10:33:06.985621	120	\N	f
115	44	1	0	2014-02-15 10:33:06.988488	2014-02-15 10:33:06.988488	121	\N	f
116	44	1	0	2014-02-15 10:33:06.991282	2014-02-15 10:33:06.991282	122	\N	f
117	45	1	2	2014-02-15 10:33:06.996179	2014-02-15 10:33:06.996179	123	\N	f
118	45	1	0	2014-02-15 10:33:06.99901	2014-02-15 10:33:06.99901	124	\N	f
119	45	1	0	2014-02-15 10:33:07.002574	2014-02-15 10:33:07.002574	125	\N	f
120	45	1	0	2014-02-15 10:33:07.006858	2014-02-15 10:33:07.006858	126	\N	f
121	46	1	2	2014-02-15 10:33:07.013813	2014-02-15 10:33:07.013813	127	\N	f
122	46	1	0	2014-02-15 10:33:07.018038	2014-02-15 10:33:07.018038	128	\N	f
123	46	1	0	2014-02-15 10:33:07.022264	2014-02-15 10:33:07.022264	129	\N	f
124	47	1	0	2014-02-15 10:33:07.029322	2014-02-15 10:33:07.029322	130	\N	f
125	47	1	2	2014-02-15 10:33:07.033528	2014-02-15 10:33:07.033528	131	\N	f
126	47	1	0	2014-02-15 10:33:07.037762	2014-02-15 10:33:07.037762	132	\N	f
127	47	1	0	2014-02-15 10:33:07.041247	2014-02-15 10:33:07.041247	133	\N	f
128	48	1	0	2014-02-15 10:33:07.047562	2014-02-15 10:33:07.047562	134	\N	f
129	48	1	0	2014-02-15 10:33:07.051866	2014-02-15 10:33:07.051866	135	\N	f
130	48	1	2	2014-02-15 10:33:07.056069	2014-02-15 10:33:07.056069	136	\N	f
131	48	1	0	2014-02-15 10:33:07.060292	2014-02-15 10:33:07.060292	137	\N	f
132	49	1	0	2014-02-15 10:33:07.067335	2014-02-15 10:33:07.067335	138	\N	f
133	49	1	2	2014-02-15 10:33:07.071537	2014-02-15 10:33:07.071537	139	\N	f
134	49	1	0	2014-02-15 10:33:07.075835	2014-02-15 10:33:07.075835	140	\N	f
135	49	1	0	2014-02-15 10:33:07.079471	2014-02-15 10:33:07.079471	141	\N	f
136	49	1	0	2014-02-15 10:33:07.083518	2014-02-15 10:33:07.083518	142	\N	f
137	50	1	0	2014-02-15 10:33:07.090702	2014-02-15 10:33:07.090702	143	\N	f
138	50	1	0	2014-02-15 10:33:07.094902	2014-02-15 10:33:07.094902	144	\N	f
139	50	1	2	2014-02-15 10:33:07.099131	2014-02-15 10:33:07.099131	145	\N	f
140	50	1	0	2014-02-15 10:33:07.103362	2014-02-15 10:33:07.103362	146	\N	f
141	51	1	0	2014-02-15 10:33:07.110311	2014-02-15 10:33:07.110311	147	\N	f
142	51	1	2	2014-02-15 10:33:07.114541	2014-02-15 10:33:07.114541	148	\N	f
143	51	1	0	2014-02-15 10:33:07.118695	2014-02-15 10:33:07.118695	149	\N	f
144	52	1	0	2014-02-15 10:33:07.126573	2014-02-15 10:33:07.126573	150	\N	f
145	52	1	0	2014-02-15 10:33:07.130764	2014-02-15 10:33:07.130764	151	\N	f
146	52	1	2	2014-02-15 10:33:07.134952	2014-02-15 10:33:07.134952	152	\N	f
147	52	1	0	2014-02-15 10:33:07.139155	2014-02-15 10:33:07.139155	153	\N	f
148	53	1	0	2014-02-15 10:33:07.14625	2014-02-15 10:33:07.14625	154	\N	f
149	53	1	0	2014-02-15 10:33:07.150454	2014-02-15 10:33:07.150454	155	\N	f
150	53	1	0	2014-02-15 10:33:07.154621	2014-02-15 10:33:07.154621	156	\N	f
151	53	1	0	2014-02-15 10:33:07.158783	2014-02-15 10:33:07.158783	157	\N	f
152	53	1	2	2014-02-15 10:33:07.162918	2014-02-15 10:33:07.162918	158	\N	f
153	54	1	2	2014-02-15 10:33:07.169837	2014-02-15 10:33:07.169837	159	\N	f
154	54	1	0	2014-02-15 10:33:07.173992	2014-02-15 10:33:07.173992	160	\N	f
155	54	1	0	2014-02-15 10:33:07.178123	2014-02-15 10:33:07.178123	161	\N	f
156	54	1	0	2014-02-15 10:33:07.182284	2014-02-15 10:33:07.182284	162	\N	f
157	55	1	0	2014-02-15 10:33:07.189198	2014-02-15 10:33:07.189198	163	\N	f
158	55	1	0	2014-02-15 10:33:07.1934	2014-02-15 10:33:07.1934	164	\N	f
159	55	1	2	2014-02-15 10:33:07.197567	2014-02-15 10:33:07.197567	165	\N	f
160	55	1	0	2014-02-15 10:33:07.201685	2014-02-15 10:33:07.201685	166	\N	f
161	56	1	0	2014-02-15 10:33:07.20872	2014-02-15 10:33:07.20872	167	\N	f
162	56	1	0	2014-02-15 10:33:07.212896	2014-02-15 10:33:07.212896	168	\N	f
163	56	1	2	2014-02-15 10:33:07.217077	2014-02-15 10:33:07.217077	169	\N	f
164	56	1	0	2014-02-15 10:33:07.221209	2014-02-15 10:33:07.221209	170	\N	f
165	57	1	2	2014-02-15 10:33:07.228178	2014-02-15 10:33:07.228178	171	\N	f
166	57	1	0	2014-02-15 10:33:07.232368	2014-02-15 10:33:07.232368	172	\N	f
167	57	1	0	2014-02-15 10:33:07.236493	2014-02-15 10:33:07.236493	173	\N	f
168	57	1	0	2014-02-15 10:33:07.240671	2014-02-15 10:33:07.240671	174	\N	f
169	58	1	0	2014-02-15 10:33:07.247571	2014-02-15 10:33:07.247571	175	\N	f
170	58	1	2	2014-02-15 10:33:07.251791	2014-02-15 10:33:07.251791	176	\N	f
171	58	1	0	2014-02-15 10:33:07.255959	2014-02-15 10:33:07.255959	177	\N	f
172	58	1	0	2014-02-15 10:33:07.260125	2014-02-15 10:33:07.260125	178	\N	f
173	59	1	0	2014-02-15 10:33:07.267147	2014-02-15 10:33:07.267147	179	\N	f
174	59	1	0	2014-02-15 10:33:07.271332	2014-02-15 10:33:07.271332	180	\N	f
175	59	1	2	2014-02-15 10:33:07.275475	2014-02-15 10:33:07.275475	181	\N	f
176	59	1	0	2014-02-15 10:33:07.27966	2014-02-15 10:33:07.27966	182	\N	f
177	59	1	0	2014-02-15 10:33:07.283827	2014-02-15 10:33:07.283827	183	\N	f
178	60	1	0	2014-02-15 10:33:07.290998	2014-02-15 10:33:07.290998	184	\N	f
179	60	1	2	2014-02-15 10:33:07.295201	2014-02-15 10:33:07.295201	185	\N	f
180	60	1	0	2014-02-15 10:33:07.299463	2014-02-15 10:33:07.299463	186	\N	f
181	60	1	0	2014-02-15 10:33:07.303713	2014-02-15 10:33:07.303713	187	\N	f
182	60	1	0	2014-02-15 10:33:07.307901	2014-02-15 10:33:07.307901	188	\N	f
183	61	1	2	2014-02-15 10:33:07.314929	2014-02-15 10:33:07.314929	189	\N	f
184	61	1	0	2014-02-15 10:33:07.319084	2014-02-15 10:33:07.319084	190	\N	f
185	61	1	0	2014-02-15 10:33:07.32322	2014-02-15 10:33:07.32322	191	\N	f
186	61	1	0	2014-02-15 10:33:07.327365	2014-02-15 10:33:07.327365	192	\N	f
187	61	1	0	2014-02-15 10:33:07.331476	2014-02-15 10:33:07.331476	193	\N	f
188	62	1	0	2014-02-15 10:33:07.338285	2014-02-15 10:33:07.338285	194	\N	f
189	62	1	2	2014-02-15 10:33:07.342482	2014-02-15 10:33:07.342482	195	\N	f
190	62	1	0	2014-02-15 10:33:07.34677	2014-02-15 10:33:07.34677	196	\N	f
191	63	1	0	2014-02-15 10:33:07.353633	2014-02-15 10:33:07.353633	197	\N	f
192	63	1	2	2014-02-15 10:33:07.35783	2014-02-15 10:33:07.35783	198	\N	f
193	64	1	2	2014-02-15 10:33:07.364683	2014-02-15 10:33:07.364683	199	\N	f
194	64	1	0	2014-02-15 10:33:07.368851	2014-02-15 10:33:07.368851	200	\N	f
195	64	1	0	2014-02-15 10:33:07.373003	2014-02-15 10:33:07.373003	201	\N	f
196	65	1	0	2014-02-15 10:33:07.380008	2014-02-15 10:33:07.380008	202	\N	f
197	65	1	0	2014-02-15 10:33:07.384215	2014-02-15 10:33:07.384215	203	\N	f
198	65	1	2	2014-02-15 10:33:07.388353	2014-02-15 10:33:07.388353	204	\N	f
199	65	1	0	2014-02-15 10:33:07.392507	2014-02-15 10:33:07.392507	205	\N	f
200	66	1	0	2014-02-15 10:33:07.399566	2014-02-15 10:33:07.399566	206	\N	f
201	66	1	0	2014-02-15 10:33:07.40371	2014-02-15 10:33:07.40371	207	\N	f
202	66	1	2	2014-02-15 10:33:07.407911	2014-02-15 10:33:07.407911	208	\N	f
203	66	1	0	2014-02-15 10:33:07.412036	2014-02-15 10:33:07.412036	209	\N	f
204	68	1	0	2014-02-15 10:33:07.418692	2014-02-15 10:33:07.418692	214	\N	f
205	68	1	2	2014-02-15 10:33:07.422848	2014-02-15 10:33:07.422848	215	\N	f
206	69	1	0	2014-02-15 10:33:07.42978	2014-02-15 10:33:07.42978	216	\N	f
207	69	1	0	2014-02-15 10:33:07.433957	2014-02-15 10:33:07.433957	217	\N	f
208	69	1	2	2014-02-15 10:33:07.438067	2014-02-15 10:33:07.438067	218	\N	f
209	69	1	0	2014-02-15 10:33:07.442177	2014-02-15 10:33:07.442177	219	\N	f
210	70	1	0	2014-02-15 10:33:07.449005	2014-02-15 10:33:07.449005	220	\N	f
211	70	1	0	2014-02-15 10:33:07.453169	2014-02-15 10:33:07.453169	221	\N	f
212	70	1	2	2014-02-15 10:33:07.457314	2014-02-15 10:33:07.457314	222	\N	f
213	71	1	0	2014-02-15 10:33:07.464073	2014-02-15 10:33:07.464073	223	\N	f
214	71	1	0	2014-02-15 10:33:07.468255	2014-02-15 10:33:07.468255	224	\N	f
215	71	1	2	2014-02-15 10:33:07.472389	2014-02-15 10:33:07.472389	225	\N	f
216	72	1	0	2014-02-15 10:33:07.479284	2014-02-15 10:33:07.479284	226	\N	f
217	72	1	0	2014-02-15 10:33:07.483483	2014-02-15 10:33:07.483483	227	\N	f
218	72	1	2	2014-02-15 10:33:07.487605	2014-02-15 10:33:07.487605	228	\N	f
219	73	1	2	2014-02-15 10:33:07.494399	2014-02-15 10:33:07.494399	229	\N	f
220	73	1	0	2014-02-15 10:33:07.498574	2014-02-15 10:33:07.498574	230	\N	f
221	73	1	0	2014-02-15 10:33:07.502662	2014-02-15 10:33:07.502662	231	\N	f
222	74	1	0	2014-02-15 10:33:07.509458	2014-02-15 10:33:07.509458	232	\N	f
223	74	1	2	2014-02-15 10:33:07.513577	2014-02-15 10:33:07.513577	233	\N	f
224	74	1	0	2014-02-15 10:33:07.517686	2014-02-15 10:33:07.517686	234	\N	f
225	75	1	0	2014-02-15 10:33:07.524479	2014-02-15 10:33:07.524479	235	\N	f
226	75	1	0	2014-02-15 10:33:07.528741	2014-02-15 10:33:07.528741	236	\N	f
227	75	1	2	2014-02-15 10:33:07.532878	2014-02-15 10:33:07.532878	237	\N	f
228	76	1	0	2014-02-15 10:33:07.539827	2014-02-15 10:33:07.539827	238	\N	f
229	76	1	2	2014-02-15 10:33:07.543993	2014-02-15 10:33:07.543993	239	\N	f
230	76	1	0	2014-02-15 10:33:07.548128	2014-02-15 10:33:07.548128	240	\N	f
231	76	1	0	2014-02-15 10:33:07.552293	2014-02-15 10:33:07.552293	241	\N	f
232	21	1	0	2014-02-15 10:33:07.559183	2014-02-15 10:33:07.559183	27	\N	f
233	21	1	2	2014-02-15 10:33:07.563349	2014-02-15 10:33:07.563349	28	\N	f
234	21	1	0	2014-02-15 10:33:07.56752	2014-02-15 10:33:07.56752	29	\N	f
235	21	1	0	2014-02-15 10:33:07.57162	2014-02-15 10:33:07.57162	30	\N	f
236	67	1	0	2014-02-15 10:33:07.578501	2014-02-15 10:33:07.578501	210	\N	f
237	67	1	0	2014-02-15 10:33:07.58267	2014-02-15 10:33:07.58267	211	\N	f
238	67	1	0	2014-02-15 10:33:07.586779	2014-02-15 10:33:07.586779	212	\N	f
239	67	1	2	2014-02-15 10:33:07.59091	2014-02-15 10:33:07.59091	213	\N	f
240	15	2	0	2014-02-15 10:33:07.618395	2014-02-15 10:33:07.618395	3	\N	f
241	15	2	0	2014-02-15 10:33:07.622636	2014-02-15 10:33:07.622636	4	\N	f
242	15	2	0	2014-02-15 10:33:07.626823	2014-02-15 10:33:07.626823	5	\N	f
243	15	2	2	2014-02-15 10:33:07.630934	2014-02-15 10:33:07.630934	6	\N	f
244	16	2	0	2014-02-15 10:33:07.637814	2014-02-15 10:33:07.637814	7	\N	f
245	16	2	2	2014-02-15 10:33:07.641943	2014-02-15 10:33:07.641943	8	\N	f
246	16	2	0	2014-02-15 10:33:07.64605	2014-02-15 10:33:07.64605	9	\N	f
247	16	2	0	2014-02-15 10:33:07.650171	2014-02-15 10:33:07.650171	10	\N	f
248	17	2	0	2014-02-15 10:33:07.657014	2014-02-15 10:33:07.657014	11	\N	f
249	17	2	0	2014-02-15 10:33:07.661182	2014-02-15 10:33:07.661182	12	\N	f
250	17	2	2	2014-02-15 10:33:07.665298	2014-02-15 10:33:07.665298	13	\N	f
251	17	2	0	2014-02-15 10:33:07.669405	2014-02-15 10:33:07.669405	14	\N	f
252	18	2	0	2014-02-15 10:33:07.676358	2014-02-15 10:33:07.676358	15	\N	f
253	18	2	2	2014-02-15 10:33:07.680538	2014-02-15 10:33:07.680538	16	\N	f
254	18	2	0	2014-02-15 10:33:07.684685	2014-02-15 10:33:07.684685	17	\N	f
255	18	2	0	2014-02-15 10:33:07.688812	2014-02-15 10:33:07.688812	18	\N	f
256	19	2	0	2014-02-15 10:33:07.695612	2014-02-15 10:33:07.695612	19	\N	f
257	19	2	2	2014-02-15 10:33:07.699809	2014-02-15 10:33:07.699809	20	\N	f
258	19	2	0	2014-02-15 10:33:07.703931	2014-02-15 10:33:07.703931	21	\N	f
259	19	2	0	2014-02-15 10:33:07.708076	2014-02-15 10:33:07.708076	22	\N	f
260	20	2	0	2014-02-15 10:33:07.714914	2014-02-15 10:33:07.714914	23	\N	f
261	20	2	0	2014-02-15 10:33:07.719061	2014-02-15 10:33:07.719061	24	\N	f
262	20	2	2	2014-02-15 10:33:07.723212	2014-02-15 10:33:07.723212	25	\N	f
263	20	2	0	2014-02-15 10:33:07.727368	2014-02-15 10:33:07.727368	26	\N	f
264	22	2	0	2014-02-15 10:33:07.734291	2014-02-15 10:33:07.734291	31	\N	f
265	22	2	0	2014-02-15 10:33:07.738509	2014-02-15 10:33:07.738509	32	\N	f
266	22	2	2	2014-02-15 10:33:07.742621	2014-02-15 10:33:07.742621	33	\N	f
267	22	2	0	2014-02-15 10:33:07.746766	2014-02-15 10:33:07.746766	34	\N	f
268	23	2	0	2014-02-15 10:33:07.753676	2014-02-15 10:33:07.753676	35	\N	f
269	23	2	0	2014-02-15 10:33:07.757815	2014-02-15 10:33:07.757815	36	\N	f
270	23	2	2	2014-02-15 10:33:07.761889	2014-02-15 10:33:07.761889	37	\N	f
271	23	2	0	2014-02-15 10:33:07.765966	2014-02-15 10:33:07.765966	38	\N	f
272	24	2	2	2014-02-15 10:33:07.810089	2014-02-15 10:33:07.810089	39	\N	f
273	24	2	0	2014-02-15 10:33:07.81245	2014-02-15 10:33:07.81245	40	\N	f
274	24	2	0	2014-02-15 10:33:07.815903	2014-02-15 10:33:07.815903	41	\N	f
275	24	2	0	2014-02-15 10:33:07.82025	2014-02-15 10:33:07.82025	42	\N	f
276	25	2	0	2014-02-15 10:33:07.827371	2014-02-15 10:33:07.827371	43	\N	f
277	25	2	2	2014-02-15 10:33:07.831771	2014-02-15 10:33:07.831771	44	\N	f
278	25	2	0	2014-02-15 10:33:07.836039	2014-02-15 10:33:07.836039	45	\N	f
279	25	2	0	2014-02-15 10:33:07.84038	2014-02-15 10:33:07.84038	46	\N	f
280	26	2	0	2014-02-15 10:33:07.847451	2014-02-15 10:33:07.847451	47	\N	f
281	26	2	0	2014-02-15 10:33:07.851993	2014-02-15 10:33:07.851993	48	\N	f
282	26	2	2	2014-02-15 10:33:07.856517	2014-02-15 10:33:07.856517	49	\N	f
283	26	2	0	2014-02-15 10:33:07.86081	2014-02-15 10:33:07.86081	50	\N	f
284	27	2	0	2014-02-15 10:33:07.868066	2014-02-15 10:33:07.868066	51	\N	f
285	27	2	0	2014-02-15 10:33:07.872356	2014-02-15 10:33:07.872356	52	\N	f
286	27	2	0	2014-02-15 10:33:07.876658	2014-02-15 10:33:07.876658	53	\N	f
287	27	2	2	2014-02-15 10:33:07.880914	2014-02-15 10:33:07.880914	54	\N	f
288	28	2	0	2014-02-15 10:33:07.888122	2014-02-15 10:33:07.888122	55	\N	f
289	28	2	0	2014-02-15 10:33:07.89241	2014-02-15 10:33:07.89241	56	\N	f
290	28	2	0	2014-02-15 10:33:07.896687	2014-02-15 10:33:07.896687	57	\N	f
291	28	2	2	2014-02-15 10:33:07.900967	2014-02-15 10:33:07.900967	58	\N	f
292	29	2	0	2014-02-15 10:33:07.908127	2014-02-15 10:33:07.908127	59	\N	f
293	29	2	0	2014-02-15 10:33:07.912449	2014-02-15 10:33:07.912449	60	\N	f
294	29	2	0	2014-02-15 10:33:07.916688	2014-02-15 10:33:07.916688	61	\N	f
295	29	2	2	2014-02-15 10:33:07.92095	2014-02-15 10:33:07.92095	62	\N	f
296	30	2	0	2014-02-15 10:33:07.928103	2014-02-15 10:33:07.928103	63	\N	f
297	30	2	0	2014-02-15 10:33:07.932426	2014-02-15 10:33:07.932426	64	\N	f
298	30	2	2	2014-02-15 10:33:07.93681	2014-02-15 10:33:07.93681	65	\N	f
299	30	2	0	2014-02-15 10:33:07.94106	2014-02-15 10:33:07.94106	66	\N	f
300	31	2	0	2014-02-15 10:33:07.948227	2014-02-15 10:33:07.948227	67	\N	f
301	31	2	0	2014-02-15 10:33:07.952485	2014-02-15 10:33:07.952485	68	\N	f
302	31	2	0	2014-02-15 10:33:07.956722	2014-02-15 10:33:07.956722	69	\N	f
303	31	2	2	2014-02-15 10:33:07.960986	2014-02-15 10:33:07.960986	70	\N	f
304	32	2	0	2014-02-15 10:33:07.968127	2014-02-15 10:33:07.968127	71	\N	f
305	32	2	2	2014-02-15 10:33:07.972474	2014-02-15 10:33:07.972474	72	\N	f
306	32	2	0	2014-02-15 10:33:07.976778	2014-02-15 10:33:07.976778	73	\N	f
307	32	2	0	2014-02-15 10:33:07.981119	2014-02-15 10:33:07.981119	74	\N	f
308	33	2	0	2014-02-15 10:33:07.988333	2014-02-15 10:33:07.988333	75	\N	f
309	33	2	0	2014-02-15 10:33:07.992608	2014-02-15 10:33:07.992608	76	\N	f
310	33	2	2	2014-02-15 10:33:07.996899	2014-02-15 10:33:07.996899	77	\N	f
311	33	2	0	2014-02-15 10:33:08.001139	2014-02-15 10:33:08.001139	78	\N	f
312	34	2	0	2014-02-15 10:33:08.008469	2014-02-15 10:33:08.008469	79	\N	f
313	34	2	0	2014-02-15 10:33:08.012787	2014-02-15 10:33:08.012787	80	\N	f
314	34	2	2	2014-02-15 10:33:08.017042	2014-02-15 10:33:08.017042	81	\N	f
315	34	2	0	2014-02-15 10:33:08.021306	2014-02-15 10:33:08.021306	82	\N	f
316	35	2	0	2014-02-15 10:33:08.02851	2014-02-15 10:33:08.02851	83	\N	f
317	35	2	0	2014-02-15 10:33:08.032836	2014-02-15 10:33:08.032836	84	\N	f
318	35	2	2	2014-02-15 10:33:08.037157	2014-02-15 10:33:08.037157	85	\N	f
319	35	2	0	2014-02-15 10:33:08.041401	2014-02-15 10:33:08.041401	86	\N	f
320	36	2	0	2014-02-15 10:33:08.048533	2014-02-15 10:33:08.048533	87	\N	f
321	36	2	0	2014-02-15 10:33:08.052793	2014-02-15 10:33:08.052793	88	\N	f
322	36	2	0	2014-02-15 10:33:08.057077	2014-02-15 10:33:08.057077	89	\N	f
323	36	2	2	2014-02-15 10:33:08.061425	2014-02-15 10:33:08.061425	90	\N	f
324	37	2	0	2014-02-15 10:33:08.068601	2014-02-15 10:33:08.068601	91	\N	f
325	37	2	0	2014-02-15 10:33:08.072874	2014-02-15 10:33:08.072874	92	\N	f
326	37	2	2	2014-02-15 10:33:08.077143	2014-02-15 10:33:08.077143	93	\N	f
327	37	2	0	2014-02-15 10:33:08.081428	2014-02-15 10:33:08.081428	94	\N	f
328	38	2	0	2014-02-15 10:33:08.088684	2014-02-15 10:33:08.088684	95	\N	f
329	38	2	2	2014-02-15 10:33:08.093034	2014-02-15 10:33:08.093034	96	\N	f
330	38	2	0	2014-02-15 10:33:08.097308	2014-02-15 10:33:08.097308	97	\N	f
331	38	2	0	2014-02-15 10:33:08.10153	2014-02-15 10:33:08.10153	98	\N	f
332	38	2	0	2014-02-15 10:33:08.105798	2014-02-15 10:33:08.105798	99	\N	f
333	39	2	0	2014-02-15 10:33:08.112863	2014-02-15 10:33:08.112863	100	\N	f
334	39	2	0	2014-02-15 10:33:08.11714	2014-02-15 10:33:08.11714	101	\N	f
335	39	2	0	2014-02-15 10:33:08.121408	2014-02-15 10:33:08.121408	102	\N	f
336	39	2	2	2014-02-15 10:33:08.125674	2014-02-15 10:33:08.125674	103	\N	f
337	40	2	0	2014-02-15 10:33:08.132872	2014-02-15 10:33:08.132872	104	\N	f
338	40	2	0	2014-02-15 10:33:08.137216	2014-02-15 10:33:08.137216	105	\N	f
339	40	2	2	2014-02-15 10:33:08.141524	2014-02-15 10:33:08.141524	106	\N	f
340	40	2	0	2014-02-15 10:33:08.145789	2014-02-15 10:33:08.145789	107	\N	f
341	41	2	0	2014-02-15 10:33:08.15289	2014-02-15 10:33:08.15289	108	\N	f
342	41	2	0	2014-02-15 10:33:08.157306	2014-02-15 10:33:08.157306	109	\N	f
343	41	2	2	2014-02-15 10:33:08.161558	2014-02-15 10:33:08.161558	110	\N	f
344	41	2	0	2014-02-15 10:33:08.165831	2014-02-15 10:33:08.165831	111	\N	f
345	42	2	0	2014-02-15 10:33:08.172824	2014-02-15 10:33:08.172824	112	\N	f
346	42	2	0	2014-02-15 10:33:08.177099	2014-02-15 10:33:08.177099	113	\N	f
347	42	2	2	2014-02-15 10:33:08.181337	2014-02-15 10:33:08.181337	114	\N	f
348	43	2	2	2014-02-15 10:33:08.188464	2014-02-15 10:33:08.188464	115	\N	f
349	43	2	0	2014-02-15 10:33:08.192846	2014-02-15 10:33:08.192846	116	\N	f
350	43	2	0	2014-02-15 10:33:08.197104	2014-02-15 10:33:08.197104	117	\N	f
351	43	2	0	2014-02-15 10:33:08.201388	2014-02-15 10:33:08.201388	118	\N	f
352	44	2	0	2014-02-15 10:33:08.208483	2014-02-15 10:33:08.208483	119	\N	f
353	44	2	2	2014-02-15 10:33:08.212807	2014-02-15 10:33:08.212807	120	\N	f
354	44	2	0	2014-02-15 10:33:08.217066	2014-02-15 10:33:08.217066	121	\N	f
355	44	2	0	2014-02-15 10:33:08.221306	2014-02-15 10:33:08.221306	122	\N	f
356	45	2	2	2014-02-15 10:33:08.228511	2014-02-15 10:33:08.228511	123	\N	f
357	45	2	0	2014-02-15 10:33:08.232838	2014-02-15 10:33:08.232838	124	\N	f
358	45	2	0	2014-02-15 10:33:08.237121	2014-02-15 10:33:08.237121	125	\N	f
359	45	2	0	2014-02-15 10:33:08.24134	2014-02-15 10:33:08.24134	126	\N	f
360	46	2	2	2014-02-15 10:33:08.248337	2014-02-15 10:33:08.248337	127	\N	f
361	46	2	0	2014-02-15 10:33:08.252639	2014-02-15 10:33:08.252639	128	\N	f
362	46	2	0	2014-02-15 10:33:08.256919	2014-02-15 10:33:08.256919	129	\N	f
363	47	2	0	2014-02-15 10:33:08.264042	2014-02-15 10:33:08.264042	130	\N	f
364	47	2	2	2014-02-15 10:33:08.268403	2014-02-15 10:33:08.268403	131	\N	f
365	47	2	0	2014-02-15 10:33:08.272708	2014-02-15 10:33:08.272708	132	\N	f
366	47	2	0	2014-02-15 10:33:08.276961	2014-02-15 10:33:08.276961	133	\N	f
367	48	2	0	2014-02-15 10:33:08.284108	2014-02-15 10:33:08.284108	134	\N	f
368	48	2	0	2014-02-15 10:33:08.288446	2014-02-15 10:33:08.288446	135	\N	f
369	48	2	2	2014-02-15 10:33:08.292715	2014-02-15 10:33:08.292715	136	\N	f
370	48	2	0	2014-02-15 10:33:08.297022	2014-02-15 10:33:08.297022	137	\N	f
371	49	2	0	2014-02-15 10:33:08.304241	2014-02-15 10:33:08.304241	138	\N	f
372	49	2	2	2014-02-15 10:33:08.308618	2014-02-15 10:33:08.308618	139	\N	f
373	49	2	0	2014-02-15 10:33:08.31299	2014-02-15 10:33:08.31299	140	\N	f
374	49	2	0	2014-02-15 10:33:08.317256	2014-02-15 10:33:08.317256	141	\N	f
375	49	2	0	2014-02-15 10:33:08.321515	2014-02-15 10:33:08.321515	142	\N	f
376	50	2	0	2014-02-15 10:33:08.328719	2014-02-15 10:33:08.328719	143	\N	f
377	50	2	0	2014-02-15 10:33:08.333058	2014-02-15 10:33:08.333058	144	\N	f
378	50	2	2	2014-02-15 10:33:08.337351	2014-02-15 10:33:08.337351	145	\N	f
379	50	2	0	2014-02-15 10:33:08.341612	2014-02-15 10:33:08.341612	146	\N	f
380	51	2	0	2014-02-15 10:33:08.348678	2014-02-15 10:33:08.348678	147	\N	f
381	51	2	2	2014-02-15 10:33:08.353016	2014-02-15 10:33:08.353016	148	\N	f
382	51	2	0	2014-02-15 10:33:08.357297	2014-02-15 10:33:08.357297	149	\N	f
383	52	2	0	2014-02-15 10:33:08.364379	2014-02-15 10:33:08.364379	150	\N	f
384	52	2	0	2014-02-15 10:33:08.368758	2014-02-15 10:33:08.368758	151	\N	f
385	52	2	2	2014-02-15 10:33:08.373054	2014-02-15 10:33:08.373054	152	\N	f
386	52	2	0	2014-02-15 10:33:08.377336	2014-02-15 10:33:08.377336	153	\N	f
387	53	2	0	2014-02-15 10:33:08.384567	2014-02-15 10:33:08.384567	154	\N	f
388	53	2	0	2014-02-15 10:33:08.38885	2014-02-15 10:33:08.38885	155	\N	f
389	53	2	0	2014-02-15 10:33:08.39318	2014-02-15 10:33:08.39318	156	\N	f
390	53	2	0	2014-02-15 10:33:08.397488	2014-02-15 10:33:08.397488	157	\N	f
391	53	2	2	2014-02-15 10:33:08.401785	2014-02-15 10:33:08.401785	158	\N	f
392	54	2	2	2014-02-15 10:33:08.408912	2014-02-15 10:33:08.408912	159	\N	f
393	54	2	0	2014-02-15 10:33:08.413407	2014-02-15 10:33:08.413407	160	\N	f
394	54	2	0	2014-02-15 10:33:08.417856	2014-02-15 10:33:08.417856	161	\N	f
395	54	2	0	2014-02-15 10:33:08.422122	2014-02-15 10:33:08.422122	162	\N	f
396	55	2	0	2014-02-15 10:33:08.42927	2014-02-15 10:33:08.42927	163	\N	f
397	55	2	0	2014-02-15 10:33:08.433644	2014-02-15 10:33:08.433644	164	\N	f
398	55	2	2	2014-02-15 10:33:08.437942	2014-02-15 10:33:08.437942	165	\N	f
399	55	2	0	2014-02-15 10:33:08.442312	2014-02-15 10:33:08.442312	166	\N	f
400	56	2	0	2014-02-15 10:33:08.449421	2014-02-15 10:33:08.449421	167	\N	f
401	56	2	0	2014-02-15 10:33:08.453759	2014-02-15 10:33:08.453759	168	\N	f
402	56	2	2	2014-02-15 10:33:08.457995	2014-02-15 10:33:08.457995	169	\N	f
403	56	2	0	2014-02-15 10:33:08.462364	2014-02-15 10:33:08.462364	170	\N	f
404	57	2	2	2014-02-15 10:33:08.469569	2014-02-15 10:33:08.469569	171	\N	f
405	57	2	0	2014-02-15 10:33:08.473871	2014-02-15 10:33:08.473871	172	\N	f
406	57	2	0	2014-02-15 10:33:08.478237	2014-02-15 10:33:08.478237	173	\N	f
407	57	2	0	2014-02-15 10:33:08.482483	2014-02-15 10:33:08.482483	174	\N	f
408	58	2	0	2014-02-15 10:33:08.489678	2014-02-15 10:33:08.489678	175	\N	f
409	58	2	2	2014-02-15 10:33:08.494334	2014-02-15 10:33:08.494334	176	\N	f
410	58	2	0	2014-02-15 10:33:08.498771	2014-02-15 10:33:08.498771	177	\N	f
411	58	2	0	2014-02-15 10:33:08.503126	2014-02-15 10:33:08.503126	178	\N	f
412	59	2	0	2014-02-15 10:33:08.510426	2014-02-15 10:33:08.510426	179	\N	f
413	59	2	0	2014-02-15 10:33:08.514883	2014-02-15 10:33:08.514883	180	\N	f
414	59	2	2	2014-02-15 10:33:08.519219	2014-02-15 10:33:08.519219	181	\N	f
415	59	2	0	2014-02-15 10:33:08.523495	2014-02-15 10:33:08.523495	182	\N	f
416	59	2	0	2014-02-15 10:33:08.528019	2014-02-15 10:33:08.528019	183	\N	f
417	60	2	0	2014-02-15 10:33:08.535264	2014-02-15 10:33:08.535264	184	\N	f
418	60	2	2	2014-02-15 10:33:08.539663	2014-02-15 10:33:08.539663	185	\N	f
419	60	2	0	2014-02-15 10:33:08.544042	2014-02-15 10:33:08.544042	186	\N	f
420	60	2	0	2014-02-15 10:33:08.548434	2014-02-15 10:33:08.548434	187	\N	f
421	60	2	0	2014-02-15 10:33:08.552754	2014-02-15 10:33:08.552754	188	\N	f
422	61	2	2	2014-02-15 10:33:08.560216	2014-02-15 10:33:08.560216	189	\N	f
423	61	2	0	2014-02-15 10:33:08.564608	2014-02-15 10:33:08.564608	190	\N	f
424	61	2	0	2014-02-15 10:33:08.568935	2014-02-15 10:33:08.568935	191	\N	f
425	61	2	0	2014-02-15 10:33:08.573342	2014-02-15 10:33:08.573342	192	\N	f
426	61	2	0	2014-02-15 10:33:08.577647	2014-02-15 10:33:08.577647	193	\N	f
427	62	2	0	2014-02-15 10:33:08.584858	2014-02-15 10:33:08.584858	194	\N	f
428	62	2	2	2014-02-15 10:33:08.589248	2014-02-15 10:33:08.589248	195	\N	f
429	62	2	0	2014-02-15 10:33:08.593674	2014-02-15 10:33:08.593674	196	\N	f
430	63	2	0	2014-02-15 10:33:08.600965	2014-02-15 10:33:08.600965	197	\N	f
431	63	2	2	2014-02-15 10:33:08.605435	2014-02-15 10:33:08.605435	198	\N	f
432	64	2	2	2014-02-15 10:33:08.613018	2014-02-15 10:33:08.613018	199	\N	f
433	64	2	0	2014-02-15 10:33:08.653878	2014-02-15 10:33:08.653878	200	\N	f
434	64	2	0	2014-02-15 10:33:08.657352	2014-02-15 10:33:08.657352	201	\N	f
435	65	2	0	2014-02-15 10:33:08.66463	2014-02-15 10:33:08.66463	202	\N	f
436	65	2	0	2014-02-15 10:33:08.669065	2014-02-15 10:33:08.669065	203	\N	f
437	65	2	2	2014-02-15 10:33:08.673387	2014-02-15 10:33:08.673387	204	\N	f
438	65	2	0	2014-02-15 10:33:08.677607	2014-02-15 10:33:08.677607	205	\N	f
439	66	2	0	2014-02-15 10:33:08.684808	2014-02-15 10:33:08.684808	206	\N	f
440	66	2	0	2014-02-15 10:33:08.689093	2014-02-15 10:33:08.689093	207	\N	f
441	66	2	2	2014-02-15 10:33:08.69337	2014-02-15 10:33:08.69337	208	\N	f
442	66	2	0	2014-02-15 10:33:08.697623	2014-02-15 10:33:08.697623	209	\N	f
443	68	2	0	2014-02-15 10:33:08.704581	2014-02-15 10:33:08.704581	214	\N	f
444	68	2	2	2014-02-15 10:33:08.708908	2014-02-15 10:33:08.708908	215	\N	f
445	69	2	0	2014-02-15 10:33:08.716053	2014-02-15 10:33:08.716053	216	\N	f
446	69	2	0	2014-02-15 10:33:08.720361	2014-02-15 10:33:08.720361	217	\N	f
447	69	2	2	2014-02-15 10:33:08.724653	2014-02-15 10:33:08.724653	218	\N	f
448	69	2	0	2014-02-15 10:33:08.729038	2014-02-15 10:33:08.729038	219	\N	f
449	70	2	0	2014-02-15 10:33:08.736159	2014-02-15 10:33:08.736159	220	\N	f
450	70	2	0	2014-02-15 10:33:08.740481	2014-02-15 10:33:08.740481	221	\N	f
451	70	2	2	2014-02-15 10:33:08.744739	2014-02-15 10:33:08.744739	222	\N	f
452	71	2	0	2014-02-15 10:33:08.751693	2014-02-15 10:33:08.751693	223	\N	f
453	71	2	0	2014-02-15 10:33:08.756086	2014-02-15 10:33:08.756086	224	\N	f
454	71	2	2	2014-02-15 10:33:08.7605	2014-02-15 10:33:08.7605	225	\N	f
455	72	2	0	2014-02-15 10:33:08.767516	2014-02-15 10:33:08.767516	226	\N	f
456	72	2	0	2014-02-15 10:33:08.771831	2014-02-15 10:33:08.771831	227	\N	f
457	72	2	2	2014-02-15 10:33:08.776108	2014-02-15 10:33:08.776108	228	\N	f
458	73	2	2	2014-02-15 10:33:08.783072	2014-02-15 10:33:08.783072	229	\N	f
459	73	2	0	2014-02-15 10:33:08.787384	2014-02-15 10:33:08.787384	230	\N	f
460	73	2	0	2014-02-15 10:33:08.791689	2014-02-15 10:33:08.791689	231	\N	f
461	74	2	0	2014-02-15 10:33:08.798718	2014-02-15 10:33:08.798718	232	\N	f
462	74	2	2	2014-02-15 10:33:08.803051	2014-02-15 10:33:08.803051	233	\N	f
463	74	2	0	2014-02-15 10:33:08.807339	2014-02-15 10:33:08.807339	234	\N	f
464	75	2	0	2014-02-15 10:33:08.814397	2014-02-15 10:33:08.814397	235	\N	f
465	75	2	0	2014-02-15 10:33:08.8187	2014-02-15 10:33:08.8187	236	\N	f
466	75	2	2	2014-02-15 10:33:08.822996	2014-02-15 10:33:08.822996	237	\N	f
467	76	2	0	2014-02-15 10:33:08.830219	2014-02-15 10:33:08.830219	238	\N	f
468	76	2	2	2014-02-15 10:33:08.834473	2014-02-15 10:33:08.834473	239	\N	f
469	76	2	0	2014-02-15 10:33:08.838764	2014-02-15 10:33:08.838764	240	\N	f
470	76	2	0	2014-02-15 10:33:08.843021	2014-02-15 10:33:08.843021	241	\N	f
471	21	2	0	2014-02-15 10:33:08.850219	2014-02-15 10:33:08.850219	27	\N	f
472	21	2	2	2014-02-15 10:33:08.854534	2014-02-15 10:33:08.854534	28	\N	f
473	21	2	0	2014-02-15 10:33:08.858805	2014-02-15 10:33:08.858805	29	\N	f
474	21	2	0	2014-02-15 10:33:08.863192	2014-02-15 10:33:08.863192	30	\N	f
475	67	2	0	2014-02-15 10:33:08.870337	2014-02-15 10:33:08.870337	210	\N	f
476	67	2	0	2014-02-15 10:33:08.87464	2014-02-15 10:33:08.87464	211	\N	f
477	67	2	0	2014-02-15 10:33:08.878965	2014-02-15 10:33:08.878965	212	\N	f
478	67	2	2	2014-02-15 10:33:08.883285	2014-02-15 10:33:08.883285	213	\N	f
479	15	3	0	2014-02-15 10:33:08.909893	2014-02-15 10:33:08.909893	3	\N	f
480	15	3	0	2014-02-15 10:33:08.912146	2014-02-15 10:33:08.912146	4	\N	f
481	15	3	0	2014-02-15 10:33:08.914309	2014-02-15 10:33:08.914309	5	\N	f
482	15	3	2	2014-02-15 10:33:08.916491	2014-02-15 10:33:08.916491	6	\N	f
483	16	3	0	2014-02-15 10:33:08.920626	2014-02-15 10:33:08.920626	7	\N	f
484	16	3	2	2014-02-15 10:33:08.923172	2014-02-15 10:33:08.923172	8	\N	f
485	16	3	0	2014-02-15 10:33:08.925753	2014-02-15 10:33:08.925753	9	\N	f
486	16	3	0	2014-02-15 10:33:08.928282	2014-02-15 10:33:08.928282	10	\N	f
487	17	3	0	2014-02-15 10:33:08.932759	2014-02-15 10:33:08.932759	11	\N	f
488	17	3	0	2014-02-15 10:33:08.93529	2014-02-15 10:33:08.93529	12	\N	f
489	17	3	2	2014-02-15 10:33:08.937867	2014-02-15 10:33:08.937867	13	\N	f
490	17	3	0	2014-02-15 10:33:08.940407	2014-02-15 10:33:08.940407	14	\N	f
491	18	3	0	2014-02-15 10:33:08.944889	2014-02-15 10:33:08.944889	15	\N	f
492	18	3	2	2014-02-15 10:33:08.947415	2014-02-15 10:33:08.947415	16	\N	f
493	18	3	0	2014-02-15 10:33:08.949978	2014-02-15 10:33:08.949978	17	\N	f
494	18	3	0	2014-02-15 10:33:08.952508	2014-02-15 10:33:08.952508	18	\N	f
495	19	3	0	2014-02-15 10:33:08.957018	2014-02-15 10:33:08.957018	19	\N	f
496	19	3	2	2014-02-15 10:33:08.959565	2014-02-15 10:33:08.959565	20	\N	f
497	19	3	0	2014-02-15 10:33:08.962179	2014-02-15 10:33:08.962179	21	\N	f
498	19	3	0	2014-02-15 10:33:08.964686	2014-02-15 10:33:08.964686	22	\N	f
499	20	3	0	2014-02-15 10:33:08.969197	2014-02-15 10:33:08.969197	23	\N	f
500	20	3	0	2014-02-15 10:33:08.971802	2014-02-15 10:33:08.971802	24	\N	f
501	20	3	2	2014-02-15 10:33:08.974335	2014-02-15 10:33:08.974335	25	\N	f
502	20	3	0	2014-02-15 10:33:08.976866	2014-02-15 10:33:08.976866	26	\N	f
503	22	3	0	2014-02-15 10:33:08.981392	2014-02-15 10:33:08.981392	31	\N	f
504	22	3	0	2014-02-15 10:33:08.984004	2014-02-15 10:33:08.984004	32	\N	f
505	22	3	2	2014-02-15 10:33:08.986533	2014-02-15 10:33:08.986533	33	\N	f
506	22	3	0	2014-02-15 10:33:08.989102	2014-02-15 10:33:08.989102	34	\N	f
507	23	3	0	2014-02-15 10:33:08.9936	2014-02-15 10:33:08.9936	35	\N	f
508	23	3	0	2014-02-15 10:33:08.996198	2014-02-15 10:33:08.996198	36	\N	f
509	23	3	2	2014-02-15 10:33:08.998713	2014-02-15 10:33:08.998713	37	\N	f
510	23	3	0	2014-02-15 10:33:09.001255	2014-02-15 10:33:09.001255	38	\N	f
511	24	3	2	2014-02-15 10:33:09.005766	2014-02-15 10:33:09.005766	39	\N	f
512	24	3	0	2014-02-15 10:33:09.008315	2014-02-15 10:33:09.008315	40	\N	f
513	24	3	0	2014-02-15 10:33:09.010849	2014-02-15 10:33:09.010849	41	\N	f
514	24	3	0	2014-02-15 10:33:09.013368	2014-02-15 10:33:09.013368	42	\N	f
515	25	3	0	2014-02-15 10:33:09.017917	2014-02-15 10:33:09.017917	43	\N	f
516	25	3	2	2014-02-15 10:33:09.020497	2014-02-15 10:33:09.020497	44	\N	f
517	25	3	0	2014-02-15 10:33:09.023052	2014-02-15 10:33:09.023052	45	\N	f
518	25	3	0	2014-02-15 10:33:09.025572	2014-02-15 10:33:09.025572	46	\N	f
519	26	3	0	2014-02-15 10:33:09.030072	2014-02-15 10:33:09.030072	47	\N	f
520	26	3	0	2014-02-15 10:33:09.032641	2014-02-15 10:33:09.032641	48	\N	f
521	26	3	2	2014-02-15 10:33:09.03516	2014-02-15 10:33:09.03516	49	\N	f
522	26	3	0	2014-02-15 10:33:09.037698	2014-02-15 10:33:09.037698	50	\N	f
523	27	3	0	2014-02-15 10:33:09.042227	2014-02-15 10:33:09.042227	51	\N	f
524	27	3	0	2014-02-15 10:33:09.044766	2014-02-15 10:33:09.044766	52	\N	f
525	27	3	0	2014-02-15 10:33:09.047268	2014-02-15 10:33:09.047268	53	\N	f
526	27	3	2	2014-02-15 10:33:09.049806	2014-02-15 10:33:09.049806	54	\N	f
527	28	3	0	2014-02-15 10:33:09.054321	2014-02-15 10:33:09.054321	55	\N	f
528	28	3	0	2014-02-15 10:33:09.056899	2014-02-15 10:33:09.056899	56	\N	f
529	28	3	0	2014-02-15 10:33:09.059423	2014-02-15 10:33:09.059423	57	\N	f
530	28	3	2	2014-02-15 10:33:09.061966	2014-02-15 10:33:09.061966	58	\N	f
531	29	3	0	2014-02-15 10:33:09.06647	2014-02-15 10:33:09.06647	59	\N	f
532	29	3	0	2014-02-15 10:33:09.069069	2014-02-15 10:33:09.069069	60	\N	f
533	29	3	0	2014-02-15 10:33:09.071583	2014-02-15 10:33:09.071583	61	\N	f
534	29	3	2	2014-02-15 10:33:09.074146	2014-02-15 10:33:09.074146	62	\N	f
535	30	3	0	2014-02-15 10:33:09.078629	2014-02-15 10:33:09.078629	63	\N	f
536	30	3	0	2014-02-15 10:33:09.081247	2014-02-15 10:33:09.081247	64	\N	f
537	30	3	2	2014-02-15 10:33:09.083942	2014-02-15 10:33:09.083942	65	\N	f
538	30	3	0	2014-02-15 10:33:09.086447	2014-02-15 10:33:09.086447	66	\N	f
539	31	3	0	2014-02-15 10:33:09.09097	2014-02-15 10:33:09.09097	67	\N	f
540	31	3	0	2014-02-15 10:33:09.093545	2014-02-15 10:33:09.093545	68	\N	f
541	31	3	0	2014-02-15 10:33:09.096079	2014-02-15 10:33:09.096079	69	\N	f
542	31	3	2	2014-02-15 10:33:09.098602	2014-02-15 10:33:09.098602	70	\N	f
543	32	3	0	2014-02-15 10:33:09.103122	2014-02-15 10:33:09.103122	71	\N	f
544	32	3	2	2014-02-15 10:33:09.105717	2014-02-15 10:33:09.105717	72	\N	f
545	32	3	0	2014-02-15 10:33:09.108281	2014-02-15 10:33:09.108281	73	\N	f
546	32	3	0	2014-02-15 10:33:09.110786	2014-02-15 10:33:09.110786	74	\N	f
547	33	3	0	2014-02-15 10:33:09.115315	2014-02-15 10:33:09.115315	75	\N	f
548	33	3	0	2014-02-15 10:33:09.117886	2014-02-15 10:33:09.117886	76	\N	f
549	33	3	2	2014-02-15 10:33:09.120473	2014-02-15 10:33:09.120473	77	\N	f
550	33	3	0	2014-02-15 10:33:09.123035	2014-02-15 10:33:09.123035	78	\N	f
551	34	3	0	2014-02-15 10:33:09.127647	2014-02-15 10:33:09.127647	79	\N	f
552	34	3	0	2014-02-15 10:33:09.130245	2014-02-15 10:33:09.130245	80	\N	f
553	34	3	2	2014-02-15 10:33:09.132838	2014-02-15 10:33:09.132838	81	\N	f
554	34	3	0	2014-02-15 10:33:09.135376	2014-02-15 10:33:09.135376	82	\N	f
555	35	3	0	2014-02-15 10:33:09.140361	2014-02-15 10:33:09.140361	83	\N	f
556	35	3	0	2014-02-15 10:33:09.143155	2014-02-15 10:33:09.143155	84	\N	f
557	35	3	2	2014-02-15 10:33:09.146024	2014-02-15 10:33:09.146024	85	\N	f
558	35	3	0	2014-02-15 10:33:09.148849	2014-02-15 10:33:09.148849	86	\N	f
559	36	3	0	2014-02-15 10:33:09.154822	2014-02-15 10:33:09.154822	87	\N	f
560	36	3	0	2014-02-15 10:33:09.159289	2014-02-15 10:33:09.159289	88	\N	f
561	36	3	0	2014-02-15 10:33:09.163667	2014-02-15 10:33:09.163667	89	\N	f
562	36	3	2	2014-02-15 10:33:09.168082	2014-02-15 10:33:09.168082	90	\N	f
563	37	3	0	2014-02-15 10:33:09.175308	2014-02-15 10:33:09.175308	91	\N	f
564	37	3	0	2014-02-15 10:33:09.179682	2014-02-15 10:33:09.179682	92	\N	f
565	37	3	2	2014-02-15 10:33:09.184082	2014-02-15 10:33:09.184082	93	\N	f
566	37	3	0	2014-02-15 10:33:09.188465	2014-02-15 10:33:09.188465	94	\N	f
567	38	3	0	2014-02-15 10:33:09.195697	2014-02-15 10:33:09.195697	95	\N	f
568	38	3	2	2014-02-15 10:33:09.200197	2014-02-15 10:33:09.200197	96	\N	f
569	38	3	0	2014-02-15 10:33:09.204563	2014-02-15 10:33:09.204563	97	\N	f
570	38	3	0	2014-02-15 10:33:09.208962	2014-02-15 10:33:09.208962	98	\N	f
571	38	3	0	2014-02-15 10:33:09.213281	2014-02-15 10:33:09.213281	99	\N	f
572	39	3	0	2014-02-15 10:33:09.220548	2014-02-15 10:33:09.220548	100	\N	f
573	39	3	0	2014-02-15 10:33:09.224927	2014-02-15 10:33:09.224927	101	\N	f
574	39	3	0	2014-02-15 10:33:09.229297	2014-02-15 10:33:09.229297	102	\N	f
575	39	3	2	2014-02-15 10:33:09.233644	2014-02-15 10:33:09.233644	103	\N	f
576	40	3	0	2014-02-15 10:33:09.240978	2014-02-15 10:33:09.240978	104	\N	f
577	40	3	0	2014-02-15 10:33:09.245433	2014-02-15 10:33:09.245433	105	\N	f
578	40	3	2	2014-02-15 10:33:09.249854	2014-02-15 10:33:09.249854	106	\N	f
579	40	3	0	2014-02-15 10:33:09.254328	2014-02-15 10:33:09.254328	107	\N	f
580	41	3	0	2014-02-15 10:33:09.301384	2014-02-15 10:33:09.301384	108	\N	f
581	41	3	0	2014-02-15 10:33:09.303549	2014-02-15 10:33:09.303549	109	\N	f
582	41	3	2	2014-02-15 10:33:09.305595	2014-02-15 10:33:09.305595	110	\N	f
583	41	3	0	2014-02-15 10:33:09.307575	2014-02-15 10:33:09.307575	111	\N	f
584	42	3	0	2014-02-15 10:33:09.311013	2014-02-15 10:33:09.311013	112	\N	f
585	42	3	0	2014-02-15 10:33:09.313016	2014-02-15 10:33:09.313016	113	\N	f
586	42	3	2	2014-02-15 10:33:09.314997	2014-02-15 10:33:09.314997	114	\N	f
587	43	3	2	2014-02-15 10:33:09.318432	2014-02-15 10:33:09.318432	115	\N	f
588	43	3	0	2014-02-15 10:33:09.320471	2014-02-15 10:33:09.320471	116	\N	f
589	43	3	0	2014-02-15 10:33:09.322439	2014-02-15 10:33:09.322439	117	\N	f
590	43	3	0	2014-02-15 10:33:09.324423	2014-02-15 10:33:09.324423	118	\N	f
591	44	3	0	2014-02-15 10:33:09.327896	2014-02-15 10:33:09.327896	119	\N	f
592	44	3	2	2014-02-15 10:33:09.32993	2014-02-15 10:33:09.32993	120	\N	f
593	44	3	0	2014-02-15 10:33:09.331915	2014-02-15 10:33:09.331915	121	\N	f
594	44	3	0	2014-02-15 10:33:09.333879	2014-02-15 10:33:09.333879	122	\N	f
595	45	3	2	2014-02-15 10:33:09.337333	2014-02-15 10:33:09.337333	123	\N	f
596	45	3	0	2014-02-15 10:33:09.339332	2014-02-15 10:33:09.339332	124	\N	f
597	45	3	0	2014-02-15 10:33:09.341349	2014-02-15 10:33:09.341349	125	\N	f
598	45	3	0	2014-02-15 10:33:09.343307	2014-02-15 10:33:09.343307	126	\N	f
599	46	3	2	2014-02-15 10:33:09.346745	2014-02-15 10:33:09.346745	127	\N	f
600	46	3	0	2014-02-15 10:33:09.348898	2014-02-15 10:33:09.348898	128	\N	f
601	46	3	0	2014-02-15 10:33:09.351057	2014-02-15 10:33:09.351057	129	\N	f
602	47	3	0	2014-02-15 10:33:09.355064	2014-02-15 10:33:09.355064	130	\N	f
603	47	3	2	2014-02-15 10:33:09.357265	2014-02-15 10:33:09.357265	131	\N	f
604	47	3	0	2014-02-15 10:33:09.359464	2014-02-15 10:33:09.359464	132	\N	f
605	47	3	0	2014-02-15 10:33:09.361647	2014-02-15 10:33:09.361647	133	\N	f
606	48	3	0	2014-02-15 10:33:09.365647	2014-02-15 10:33:09.365647	134	\N	f
607	48	3	0	2014-02-15 10:33:09.367869	2014-02-15 10:33:09.367869	135	\N	f
608	48	3	2	2014-02-15 10:33:09.370045	2014-02-15 10:33:09.370045	136	\N	f
609	48	3	0	2014-02-15 10:33:09.37225	2014-02-15 10:33:09.37225	137	\N	f
610	49	3	0	2014-02-15 10:33:09.376422	2014-02-15 10:33:09.376422	138	\N	f
611	49	3	2	2014-02-15 10:33:09.378994	2014-02-15 10:33:09.378994	139	\N	f
612	49	3	0	2014-02-15 10:33:09.381747	2014-02-15 10:33:09.381747	140	\N	f
613	49	3	0	2014-02-15 10:33:09.384347	2014-02-15 10:33:09.384347	141	\N	f
614	49	3	0	2014-02-15 10:33:09.386908	2014-02-15 10:33:09.386908	142	\N	f
615	50	3	0	2014-02-15 10:33:09.391464	2014-02-15 10:33:09.391464	143	\N	f
616	50	3	0	2014-02-15 10:33:09.394035	2014-02-15 10:33:09.394035	144	\N	f
617	50	3	2	2014-02-15 10:33:09.396613	2014-02-15 10:33:09.396613	145	\N	f
618	50	3	0	2014-02-15 10:33:09.399135	2014-02-15 10:33:09.399135	146	\N	f
619	51	3	0	2014-02-15 10:33:09.403622	2014-02-15 10:33:09.403622	147	\N	f
620	51	3	2	2014-02-15 10:33:09.406209	2014-02-15 10:33:09.406209	148	\N	f
621	51	3	0	2014-02-15 10:33:09.408742	2014-02-15 10:33:09.408742	149	\N	f
622	52	3	0	2014-02-15 10:33:09.413297	2014-02-15 10:33:09.413297	150	\N	f
623	52	3	0	2014-02-15 10:33:09.415919	2014-02-15 10:33:09.415919	151	\N	f
624	52	3	2	2014-02-15 10:33:09.418707	2014-02-15 10:33:09.418707	152	\N	f
625	52	3	0	2014-02-15 10:33:09.421493	2014-02-15 10:33:09.421493	153	\N	f
626	53	3	0	2014-02-15 10:33:09.426493	2014-02-15 10:33:09.426493	154	\N	f
627	53	3	0	2014-02-15 10:33:09.429339	2014-02-15 10:33:09.429339	155	\N	f
628	53	3	0	2014-02-15 10:33:09.432195	2014-02-15 10:33:09.432195	156	\N	f
629	53	3	0	2014-02-15 10:33:09.434961	2014-02-15 10:33:09.434961	157	\N	f
630	53	3	2	2014-02-15 10:33:09.437816	2014-02-15 10:33:09.437816	158	\N	f
631	54	3	2	2014-02-15 10:33:09.442752	2014-02-15 10:33:09.442752	159	\N	f
632	54	3	0	2014-02-15 10:33:09.445629	2014-02-15 10:33:09.445629	160	\N	f
633	54	3	0	2014-02-15 10:33:09.448484	2014-02-15 10:33:09.448484	161	\N	f
634	54	3	0	2014-02-15 10:33:09.45127	2014-02-15 10:33:09.45127	162	\N	f
635	55	3	0	2014-02-15 10:33:09.45624	2014-02-15 10:33:09.45624	163	\N	f
636	55	3	0	2014-02-15 10:33:09.459026	2014-02-15 10:33:09.459026	164	\N	f
637	55	3	2	2014-02-15 10:33:09.461927	2014-02-15 10:33:09.461927	165	\N	f
638	55	3	0	2014-02-15 10:33:09.464729	2014-02-15 10:33:09.464729	166	\N	f
639	56	3	0	2014-02-15 10:33:09.469674	2014-02-15 10:33:09.469674	167	\N	f
640	56	3	0	2014-02-15 10:33:09.472531	2014-02-15 10:33:09.472531	168	\N	f
641	56	3	2	2014-02-15 10:33:09.47531	2014-02-15 10:33:09.47531	169	\N	f
642	56	3	0	2014-02-15 10:33:09.478145	2014-02-15 10:33:09.478145	170	\N	f
643	57	3	2	2014-02-15 10:33:09.483048	2014-02-15 10:33:09.483048	171	\N	f
644	57	3	0	2014-02-15 10:33:09.486053	2014-02-15 10:33:09.486053	172	\N	f
645	57	3	0	2014-02-15 10:33:09.488875	2014-02-15 10:33:09.488875	173	\N	f
646	57	3	0	2014-02-15 10:33:09.491692	2014-02-15 10:33:09.491692	174	\N	f
647	58	3	0	2014-02-15 10:33:09.496674	2014-02-15 10:33:09.496674	175	\N	f
648	58	3	2	2014-02-15 10:33:09.499513	2014-02-15 10:33:09.499513	176	\N	f
649	58	3	0	2014-02-15 10:33:09.502359	2014-02-15 10:33:09.502359	177	\N	f
650	58	3	0	2014-02-15 10:33:09.505196	2014-02-15 10:33:09.505196	178	\N	f
651	59	3	0	2014-02-15 10:33:09.510184	2014-02-15 10:33:09.510184	179	\N	f
652	59	3	0	2014-02-15 10:33:09.513055	2014-02-15 10:33:09.513055	180	\N	f
653	59	3	2	2014-02-15 10:33:09.515907	2014-02-15 10:33:09.515907	181	\N	f
654	59	3	0	2014-02-15 10:33:09.518697	2014-02-15 10:33:09.518697	182	\N	f
655	59	3	0	2014-02-15 10:33:09.521544	2014-02-15 10:33:09.521544	183	\N	f
656	60	3	0	2014-02-15 10:33:09.526533	2014-02-15 10:33:09.526533	184	\N	f
657	60	3	2	2014-02-15 10:33:09.529387	2014-02-15 10:33:09.529387	185	\N	f
658	60	3	0	2014-02-15 10:33:09.532238	2014-02-15 10:33:09.532238	186	\N	f
659	60	3	0	2014-02-15 10:33:09.535084	2014-02-15 10:33:09.535084	187	\N	f
660	60	3	0	2014-02-15 10:33:09.537913	2014-02-15 10:33:09.537913	188	\N	f
661	61	3	2	2014-02-15 10:33:09.542892	2014-02-15 10:33:09.542892	189	\N	f
662	61	3	0	2014-02-15 10:33:09.545787	2014-02-15 10:33:09.545787	190	\N	f
663	61	3	0	2014-02-15 10:33:09.548595	2014-02-15 10:33:09.548595	191	\N	f
664	61	3	0	2014-02-15 10:33:09.551387	2014-02-15 10:33:09.551387	192	\N	f
665	61	3	0	2014-02-15 10:33:09.554227	2014-02-15 10:33:09.554227	193	\N	f
666	62	3	0	2014-02-15 10:33:09.559103	2014-02-15 10:33:09.559103	194	\N	f
667	62	3	2	2014-02-15 10:33:09.562019	2014-02-15 10:33:09.562019	195	\N	f
668	62	3	0	2014-02-15 10:33:09.564856	2014-02-15 10:33:09.564856	196	\N	f
669	63	3	0	2014-02-15 10:33:09.569627	2014-02-15 10:33:09.569627	197	\N	f
670	63	3	2	2014-02-15 10:33:09.572492	2014-02-15 10:33:09.572492	198	\N	f
671	64	3	2	2014-02-15 10:33:09.577381	2014-02-15 10:33:09.577381	199	\N	f
672	64	3	0	2014-02-15 10:33:09.580243	2014-02-15 10:33:09.580243	200	\N	f
673	64	3	0	2014-02-15 10:33:09.583024	2014-02-15 10:33:09.583024	201	\N	f
674	65	3	0	2014-02-15 10:33:09.587973	2014-02-15 10:33:09.587973	202	\N	f
675	65	3	0	2014-02-15 10:33:09.590782	2014-02-15 10:33:09.590782	203	\N	f
676	65	3	2	2014-02-15 10:33:09.593643	2014-02-15 10:33:09.593643	204	\N	f
677	65	3	0	2014-02-15 10:33:09.596504	2014-02-15 10:33:09.596504	205	\N	f
678	66	3	0	2014-02-15 10:33:09.601464	2014-02-15 10:33:09.601464	206	\N	f
679	66	3	0	2014-02-15 10:33:09.604397	2014-02-15 10:33:09.604397	207	\N	f
680	66	3	2	2014-02-15 10:33:09.607215	2014-02-15 10:33:09.607215	208	\N	f
681	66	3	0	2014-02-15 10:33:09.61002	2014-02-15 10:33:09.61002	209	\N	f
682	68	3	0	2014-02-15 10:33:09.61483	2014-02-15 10:33:09.61483	214	\N	f
683	68	3	2	2014-02-15 10:33:09.617685	2014-02-15 10:33:09.617685	215	\N	f
684	69	3	0	2014-02-15 10:33:09.622579	2014-02-15 10:33:09.622579	216	\N	f
685	69	3	0	2014-02-15 10:33:09.625414	2014-02-15 10:33:09.625414	217	\N	f
686	69	3	2	2014-02-15 10:33:09.628296	2014-02-15 10:33:09.628296	218	\N	f
687	69	3	0	2014-02-15 10:33:09.631081	2014-02-15 10:33:09.631081	219	\N	f
688	70	3	0	2014-02-15 10:33:09.635967	2014-02-15 10:33:09.635967	220	\N	f
689	70	3	0	2014-02-15 10:33:09.638804	2014-02-15 10:33:09.638804	221	\N	f
690	70	3	2	2014-02-15 10:33:09.641687	2014-02-15 10:33:09.641687	222	\N	f
691	71	3	0	2014-02-15 10:33:09.646526	2014-02-15 10:33:09.646526	223	\N	f
692	71	3	0	2014-02-15 10:33:09.649392	2014-02-15 10:33:09.649392	224	\N	f
693	71	3	2	2014-02-15 10:33:09.652262	2014-02-15 10:33:09.652262	225	\N	f
694	72	3	0	2014-02-15 10:33:09.657163	2014-02-15 10:33:09.657163	226	\N	f
695	72	3	0	2014-02-15 10:33:09.659986	2014-02-15 10:33:09.659986	227	\N	f
696	72	3	2	2014-02-15 10:33:09.662827	2014-02-15 10:33:09.662827	228	\N	f
697	73	3	2	2014-02-15 10:33:09.667811	2014-02-15 10:33:09.667811	229	\N	f
698	73	3	0	2014-02-15 10:33:09.670667	2014-02-15 10:33:09.670667	230	\N	f
699	73	3	0	2014-02-15 10:33:09.673505	2014-02-15 10:33:09.673505	231	\N	f
700	74	3	0	2014-02-15 10:33:09.678413	2014-02-15 10:33:09.678413	232	\N	f
701	74	3	2	2014-02-15 10:33:09.681295	2014-02-15 10:33:09.681295	233	\N	f
702	74	3	0	2014-02-15 10:33:09.684122	2014-02-15 10:33:09.684122	234	\N	f
703	75	3	0	2014-02-15 10:33:09.689012	2014-02-15 10:33:09.689012	235	\N	f
704	75	3	0	2014-02-15 10:33:09.691887	2014-02-15 10:33:09.691887	236	\N	f
705	75	3	2	2014-02-15 10:33:09.694711	2014-02-15 10:33:09.694711	237	\N	f
706	76	3	0	2014-02-15 10:33:09.699633	2014-02-15 10:33:09.699633	238	\N	f
707	76	3	2	2014-02-15 10:33:09.702548	2014-02-15 10:33:09.702548	239	\N	f
708	76	3	0	2014-02-15 10:33:09.705422	2014-02-15 10:33:09.705422	240	\N	f
709	76	3	0	2014-02-15 10:33:09.708223	2014-02-15 10:33:09.708223	241	\N	f
710	21	3	0	2014-02-15 10:33:09.713179	2014-02-15 10:33:09.713179	27	\N	f
711	21	3	2	2014-02-15 10:33:09.716083	2014-02-15 10:33:09.716083	28	\N	f
712	21	3	0	2014-02-15 10:33:09.718922	2014-02-15 10:33:09.718922	29	\N	f
713	21	3	0	2014-02-15 10:33:09.721753	2014-02-15 10:33:09.721753	30	\N	f
714	67	3	0	2014-02-15 10:33:09.726729	2014-02-15 10:33:09.726729	210	\N	f
715	67	3	0	2014-02-15 10:33:09.729586	2014-02-15 10:33:09.729586	211	\N	f
716	67	3	0	2014-02-15 10:33:09.732455	2014-02-15 10:33:09.732455	212	\N	f
717	67	3	2	2014-02-15 10:33:09.735271	2014-02-15 10:33:09.735271	213	\N	f
718	15	4	0	2014-02-15 10:33:09.754553	2014-02-15 10:33:09.754553	3	\N	f
719	15	4	0	2014-02-15 10:33:09.757487	2014-02-15 10:33:09.757487	4	\N	f
720	15	4	0	2014-02-15 10:33:09.760435	2014-02-15 10:33:09.760435	5	\N	f
721	15	4	2	2014-02-15 10:33:09.763358	2014-02-15 10:33:09.763358	6	\N	f
722	16	4	0	2014-02-15 10:33:09.804084	2014-02-15 10:33:09.804084	7	\N	f
723	16	4	2	2014-02-15 10:33:09.806288	2014-02-15 10:33:09.806288	8	\N	f
724	16	4	0	2014-02-15 10:33:09.808502	2014-02-15 10:33:09.808502	9	\N	f
725	16	4	0	2014-02-15 10:33:09.810672	2014-02-15 10:33:09.810672	10	\N	f
726	17	4	0	2014-02-15 10:33:09.814684	2014-02-15 10:33:09.814684	11	\N	f
727	17	4	0	2014-02-15 10:33:09.816869	2014-02-15 10:33:09.816869	12	\N	f
728	17	4	2	2014-02-15 10:33:09.819031	2014-02-15 10:33:09.819031	13	\N	f
729	17	4	0	2014-02-15 10:33:09.82123	2014-02-15 10:33:09.82123	14	\N	f
730	18	4	0	2014-02-15 10:33:09.825187	2014-02-15 10:33:09.825187	15	\N	f
731	18	4	2	2014-02-15 10:33:09.827349	2014-02-15 10:33:09.827349	16	\N	f
732	18	4	0	2014-02-15 10:33:09.829557	2014-02-15 10:33:09.829557	17	\N	f
733	18	4	0	2014-02-15 10:33:09.831784	2014-02-15 10:33:09.831784	18	\N	f
734	19	4	0	2014-02-15 10:33:09.83569	2014-02-15 10:33:09.83569	19	\N	f
735	19	4	2	2014-02-15 10:33:09.8379	2014-02-15 10:33:09.8379	20	\N	f
736	19	4	0	2014-02-15 10:33:09.840104	2014-02-15 10:33:09.840104	21	\N	f
737	19	4	0	2014-02-15 10:33:09.842249	2014-02-15 10:33:09.842249	22	\N	f
738	20	4	0	2014-02-15 10:33:09.846215	2014-02-15 10:33:09.846215	23	\N	f
739	20	4	0	2014-02-15 10:33:09.848438	2014-02-15 10:33:09.848438	24	\N	f
740	20	4	2	2014-02-15 10:33:09.850623	2014-02-15 10:33:09.850623	25	\N	f
741	20	4	0	2014-02-15 10:33:09.852814	2014-02-15 10:33:09.852814	26	\N	f
742	22	4	0	2014-02-15 10:33:09.856771	2014-02-15 10:33:09.856771	31	\N	f
743	22	4	0	2014-02-15 10:33:09.858948	2014-02-15 10:33:09.858948	32	\N	f
744	22	4	2	2014-02-15 10:33:09.86118	2014-02-15 10:33:09.86118	33	\N	f
745	22	4	0	2014-02-15 10:33:09.863336	2014-02-15 10:33:09.863336	34	\N	f
746	23	4	0	2014-02-15 10:33:09.867292	2014-02-15 10:33:09.867292	35	\N	f
747	23	4	0	2014-02-15 10:33:09.869769	2014-02-15 10:33:09.869769	36	\N	f
748	23	4	2	2014-02-15 10:33:09.872325	2014-02-15 10:33:09.872325	37	\N	f
749	23	4	0	2014-02-15 10:33:09.874839	2014-02-15 10:33:09.874839	38	\N	f
750	24	4	2	2014-02-15 10:33:09.879356	2014-02-15 10:33:09.879356	39	\N	f
751	24	4	0	2014-02-15 10:33:09.882085	2014-02-15 10:33:09.882085	40	\N	f
752	24	4	0	2014-02-15 10:33:09.884622	2014-02-15 10:33:09.884622	41	\N	f
753	24	4	0	2014-02-15 10:33:09.887137	2014-02-15 10:33:09.887137	42	\N	f
754	25	4	0	2014-02-15 10:33:09.891668	2014-02-15 10:33:09.891668	43	\N	f
755	25	4	2	2014-02-15 10:33:09.894553	2014-02-15 10:33:09.894553	44	\N	f
756	25	4	0	2014-02-15 10:33:09.897434	2014-02-15 10:33:09.897434	45	\N	f
757	25	4	0	2014-02-15 10:33:09.900244	2014-02-15 10:33:09.900244	46	\N	f
758	26	4	0	2014-02-15 10:33:09.905176	2014-02-15 10:33:09.905176	47	\N	f
759	26	4	0	2014-02-15 10:33:09.908064	2014-02-15 10:33:09.908064	48	\N	f
760	26	4	2	2014-02-15 10:33:09.910881	2014-02-15 10:33:09.910881	49	\N	f
761	26	4	0	2014-02-15 10:33:09.913691	2014-02-15 10:33:09.913691	50	\N	f
762	27	4	0	2014-02-15 10:33:09.918644	2014-02-15 10:33:09.918644	51	\N	f
763	27	4	0	2014-02-15 10:33:09.921469	2014-02-15 10:33:09.921469	52	\N	f
764	27	4	0	2014-02-15 10:33:09.924286	2014-02-15 10:33:09.924286	53	\N	f
765	27	4	2	2014-02-15 10:33:09.927137	2014-02-15 10:33:09.927137	54	\N	f
766	28	4	0	2014-02-15 10:33:09.93215	2014-02-15 10:33:09.93215	55	\N	f
767	28	4	0	2014-02-15 10:33:09.93496	2014-02-15 10:33:09.93496	56	\N	f
768	28	4	0	2014-02-15 10:33:09.937785	2014-02-15 10:33:09.937785	57	\N	f
769	28	4	2	2014-02-15 10:33:09.940715	2014-02-15 10:33:09.940715	58	\N	f
770	29	4	0	2014-02-15 10:33:09.945854	2014-02-15 10:33:09.945854	59	\N	f
771	29	4	0	2014-02-15 10:33:09.94869	2014-02-15 10:33:09.94869	60	\N	f
772	29	4	0	2014-02-15 10:33:09.951502	2014-02-15 10:33:09.951502	61	\N	f
773	29	4	2	2014-02-15 10:33:09.954406	2014-02-15 10:33:09.954406	62	\N	f
774	30	4	0	2014-02-15 10:33:09.959325	2014-02-15 10:33:09.959325	63	\N	f
775	30	4	0	2014-02-15 10:33:09.962449	2014-02-15 10:33:09.962449	64	\N	f
776	30	4	2	2014-02-15 10:33:09.96529	2014-02-15 10:33:09.96529	65	\N	f
777	30	4	0	2014-02-15 10:33:09.968187	2014-02-15 10:33:09.968187	66	\N	f
778	31	4	0	2014-02-15 10:33:09.973081	2014-02-15 10:33:09.973081	67	\N	f
779	31	4	0	2014-02-15 10:33:09.976023	2014-02-15 10:33:09.976023	68	\N	f
780	31	4	0	2014-02-15 10:33:09.978823	2014-02-15 10:33:09.978823	69	\N	f
781	31	4	2	2014-02-15 10:33:09.981634	2014-02-15 10:33:09.981634	70	\N	f
782	32	4	0	2014-02-15 10:33:09.986595	2014-02-15 10:33:09.986595	71	\N	f
783	32	4	2	2014-02-15 10:33:09.990375	2014-02-15 10:33:09.990375	72	\N	f
784	32	4	0	2014-02-15 10:33:09.994752	2014-02-15 10:33:09.994752	73	\N	f
785	32	4	0	2014-02-15 10:33:09.999059	2014-02-15 10:33:09.999059	74	\N	f
786	33	4	0	2014-02-15 10:33:10.006558	2014-02-15 10:33:10.006558	75	\N	f
787	33	4	0	2014-02-15 10:33:10.010949	2014-02-15 10:33:10.010949	76	\N	f
788	33	4	2	2014-02-15 10:33:10.015527	2014-02-15 10:33:10.015527	77	\N	f
789	33	4	0	2014-02-15 10:33:10.019921	2014-02-15 10:33:10.019921	78	\N	f
790	34	4	0	2014-02-15 10:33:10.027266	2014-02-15 10:33:10.027266	79	\N	f
791	34	4	0	2014-02-15 10:33:10.031625	2014-02-15 10:33:10.031625	80	\N	f
792	34	4	2	2014-02-15 10:33:10.036102	2014-02-15 10:33:10.036102	81	\N	f
793	34	4	0	2014-02-15 10:33:10.04046	2014-02-15 10:33:10.04046	82	\N	f
794	35	4	0	2014-02-15 10:33:10.047601	2014-02-15 10:33:10.047601	83	\N	f
795	35	4	0	2014-02-15 10:33:10.052084	2014-02-15 10:33:10.052084	84	\N	f
796	35	4	2	2014-02-15 10:33:10.056421	2014-02-15 10:33:10.056421	85	\N	f
797	35	4	0	2014-02-15 10:33:10.060833	2014-02-15 10:33:10.060833	86	\N	f
798	36	4	0	2014-02-15 10:33:10.068018	2014-02-15 10:33:10.068018	87	\N	f
799	36	4	0	2014-02-15 10:33:10.072382	2014-02-15 10:33:10.072382	88	\N	f
800	36	4	0	2014-02-15 10:33:10.076806	2014-02-15 10:33:10.076806	89	\N	f
801	36	4	2	2014-02-15 10:33:10.081263	2014-02-15 10:33:10.081263	90	\N	f
802	37	4	0	2014-02-15 10:33:10.088467	2014-02-15 10:33:10.088467	91	\N	f
803	37	4	0	2014-02-15 10:33:10.092807	2014-02-15 10:33:10.092807	92	\N	f
804	37	4	2	2014-02-15 10:33:10.097109	2014-02-15 10:33:10.097109	93	\N	f
805	37	4	0	2014-02-15 10:33:10.101495	2014-02-15 10:33:10.101495	94	\N	f
806	38	4	0	2014-02-15 10:33:10.109003	2014-02-15 10:33:10.109003	95	\N	f
807	38	4	2	2014-02-15 10:33:10.113328	2014-02-15 10:33:10.113328	96	\N	f
808	38	4	0	2014-02-15 10:33:10.117609	2014-02-15 10:33:10.117609	97	\N	f
809	38	4	0	2014-02-15 10:33:10.121964	2014-02-15 10:33:10.121964	98	\N	f
810	38	4	0	2014-02-15 10:33:10.126263	2014-02-15 10:33:10.126263	99	\N	f
811	39	4	0	2014-02-15 10:33:10.133672	2014-02-15 10:33:10.133672	100	\N	f
812	39	4	0	2014-02-15 10:33:10.138014	2014-02-15 10:33:10.138014	101	\N	f
813	39	4	0	2014-02-15 10:33:10.142366	2014-02-15 10:33:10.142366	102	\N	f
814	39	4	2	2014-02-15 10:33:10.146787	2014-02-15 10:33:10.146787	103	\N	f
815	40	4	0	2014-02-15 10:33:10.154008	2014-02-15 10:33:10.154008	104	\N	f
816	40	4	0	2014-02-15 10:33:10.158486	2014-02-15 10:33:10.158486	105	\N	f
817	40	4	2	2014-02-15 10:33:10.162829	2014-02-15 10:33:10.162829	106	\N	f
818	40	4	0	2014-02-15 10:33:10.167202	2014-02-15 10:33:10.167202	107	\N	f
819	41	4	0	2014-02-15 10:33:10.174463	2014-02-15 10:33:10.174463	108	\N	f
820	41	4	0	2014-02-15 10:33:10.178778	2014-02-15 10:33:10.178778	109	\N	f
821	41	4	2	2014-02-15 10:33:10.183147	2014-02-15 10:33:10.183147	110	\N	f
822	41	4	0	2014-02-15 10:33:10.187522	2014-02-15 10:33:10.187522	111	\N	f
823	42	4	0	2014-02-15 10:33:10.194646	2014-02-15 10:33:10.194646	112	\N	f
824	42	4	0	2014-02-15 10:33:10.198948	2014-02-15 10:33:10.198948	113	\N	f
825	42	4	2	2014-02-15 10:33:10.203274	2014-02-15 10:33:10.203274	114	\N	f
826	43	4	2	2014-02-15 10:33:10.21055	2014-02-15 10:33:10.21055	115	\N	f
827	43	4	0	2014-02-15 10:33:10.214957	2014-02-15 10:33:10.214957	116	\N	f
828	43	4	0	2014-02-15 10:33:10.219375	2014-02-15 10:33:10.219375	117	\N	f
829	43	4	0	2014-02-15 10:33:10.223878	2014-02-15 10:33:10.223878	118	\N	f
830	44	4	0	2014-02-15 10:33:10.231041	2014-02-15 10:33:10.231041	119	\N	f
831	44	4	2	2014-02-15 10:33:10.235393	2014-02-15 10:33:10.235393	120	\N	f
832	44	4	0	2014-02-15 10:33:10.239704	2014-02-15 10:33:10.239704	121	\N	f
833	44	4	0	2014-02-15 10:33:10.244168	2014-02-15 10:33:10.244168	122	\N	f
834	45	4	2	2014-02-15 10:33:10.25133	2014-02-15 10:33:10.25133	123	\N	f
835	45	4	0	2014-02-15 10:33:10.255797	2014-02-15 10:33:10.255797	124	\N	f
836	45	4	0	2014-02-15 10:33:10.260218	2014-02-15 10:33:10.260218	125	\N	f
837	45	4	0	2014-02-15 10:33:10.264622	2014-02-15 10:33:10.264622	126	\N	f
838	46	4	2	2014-02-15 10:33:10.271694	2014-02-15 10:33:10.271694	127	\N	f
839	46	4	0	2014-02-15 10:33:10.276182	2014-02-15 10:33:10.276182	128	\N	f
840	46	4	0	2014-02-15 10:33:10.280517	2014-02-15 10:33:10.280517	129	\N	f
841	47	4	0	2014-02-15 10:33:10.287652	2014-02-15 10:33:10.287652	130	\N	f
842	47	4	2	2014-02-15 10:33:10.292134	2014-02-15 10:33:10.292134	131	\N	f
843	47	4	0	2014-02-15 10:33:10.296513	2014-02-15 10:33:10.296513	132	\N	f
844	47	4	0	2014-02-15 10:33:10.300861	2014-02-15 10:33:10.300861	133	\N	f
845	48	4	0	2014-02-15 10:33:10.308115	2014-02-15 10:33:10.308115	134	\N	f
846	48	4	0	2014-02-15 10:33:10.312511	2014-02-15 10:33:10.312511	135	\N	f
847	48	4	2	2014-02-15 10:33:10.31687	2014-02-15 10:33:10.31687	136	\N	f
848	48	4	0	2014-02-15 10:33:10.321236	2014-02-15 10:33:10.321236	137	\N	f
849	49	4	0	2014-02-15 10:33:10.32857	2014-02-15 10:33:10.32857	138	\N	f
850	49	4	2	2014-02-15 10:33:10.33296	2014-02-15 10:33:10.33296	139	\N	f
851	49	4	0	2014-02-15 10:33:10.337322	2014-02-15 10:33:10.337322	140	\N	f
852	49	4	0	2014-02-15 10:33:10.341641	2014-02-15 10:33:10.341641	141	\N	f
853	49	4	0	2014-02-15 10:33:10.345904	2014-02-15 10:33:10.345904	142	\N	f
854	50	4	0	2014-02-15 10:33:10.353147	2014-02-15 10:33:10.353147	143	\N	f
855	50	4	0	2014-02-15 10:33:10.357514	2014-02-15 10:33:10.357514	144	\N	f
856	50	4	2	2014-02-15 10:33:10.361821	2014-02-15 10:33:10.361821	145	\N	f
857	50	4	0	2014-02-15 10:33:10.366165	2014-02-15 10:33:10.366165	146	\N	f
858	51	4	0	2014-02-15 10:33:10.373482	2014-02-15 10:33:10.373482	147	\N	f
859	51	4	2	2014-02-15 10:33:10.377887	2014-02-15 10:33:10.377887	148	\N	f
860	51	4	0	2014-02-15 10:33:10.382247	2014-02-15 10:33:10.382247	149	\N	f
861	52	4	0	2014-02-15 10:33:10.38959	2014-02-15 10:33:10.38959	150	\N	f
862	52	4	0	2014-02-15 10:33:10.394028	2014-02-15 10:33:10.394028	151	\N	f
863	52	4	2	2014-02-15 10:33:10.398475	2014-02-15 10:33:10.398475	152	\N	f
864	52	4	0	2014-02-15 10:33:10.402987	2014-02-15 10:33:10.402987	153	\N	f
865	53	4	0	2014-02-15 10:33:10.448671	2014-02-15 10:33:10.448671	154	\N	f
866	53	4	0	2014-02-15 10:33:10.452008	2014-02-15 10:33:10.452008	155	\N	f
867	53	4	0	2014-02-15 10:33:10.45635	2014-02-15 10:33:10.45635	156	\N	f
868	53	4	0	2014-02-15 10:33:10.460636	2014-02-15 10:33:10.460636	157	\N	f
869	53	4	2	2014-02-15 10:33:10.465052	2014-02-15 10:33:10.465052	158	\N	f
870	54	4	2	2014-02-15 10:33:10.472322	2014-02-15 10:33:10.472322	159	\N	f
871	54	4	0	2014-02-15 10:33:10.476719	2014-02-15 10:33:10.476719	160	\N	f
872	54	4	0	2014-02-15 10:33:10.481006	2014-02-15 10:33:10.481006	161	\N	f
873	54	4	0	2014-02-15 10:33:10.48536	2014-02-15 10:33:10.48536	162	\N	f
874	55	4	0	2014-02-15 10:33:10.492637	2014-02-15 10:33:10.492637	163	\N	f
875	55	4	0	2014-02-15 10:33:10.497002	2014-02-15 10:33:10.497002	164	\N	f
876	55	4	2	2014-02-15 10:33:10.501279	2014-02-15 10:33:10.501279	165	\N	f
877	55	4	0	2014-02-15 10:33:10.505587	2014-02-15 10:33:10.505587	166	\N	f
878	56	4	0	2014-02-15 10:33:10.512755	2014-02-15 10:33:10.512755	167	\N	f
879	56	4	0	2014-02-15 10:33:10.517127	2014-02-15 10:33:10.517127	168	\N	f
880	56	4	2	2014-02-15 10:33:10.521406	2014-02-15 10:33:10.521406	169	\N	f
881	56	4	0	2014-02-15 10:33:10.525775	2014-02-15 10:33:10.525775	170	\N	f
882	57	4	2	2014-02-15 10:33:10.533014	2014-02-15 10:33:10.533014	171	\N	f
883	57	4	0	2014-02-15 10:33:10.537348	2014-02-15 10:33:10.537348	172	\N	f
884	57	4	0	2014-02-15 10:33:10.541682	2014-02-15 10:33:10.541682	173	\N	f
885	57	4	0	2014-02-15 10:33:10.545957	2014-02-15 10:33:10.545957	174	\N	f
886	58	4	0	2014-02-15 10:33:10.553142	2014-02-15 10:33:10.553142	175	\N	f
887	58	4	2	2014-02-15 10:33:10.557469	2014-02-15 10:33:10.557469	176	\N	f
888	58	4	0	2014-02-15 10:33:10.561801	2014-02-15 10:33:10.561801	177	\N	f
889	58	4	0	2014-02-15 10:33:10.566122	2014-02-15 10:33:10.566122	178	\N	f
890	59	4	0	2014-02-15 10:33:10.573535	2014-02-15 10:33:10.573535	179	\N	f
891	59	4	0	2014-02-15 10:33:10.577877	2014-02-15 10:33:10.577877	180	\N	f
892	59	4	2	2014-02-15 10:33:10.582165	2014-02-15 10:33:10.582165	181	\N	f
893	59	4	0	2014-02-15 10:33:10.586434	2014-02-15 10:33:10.586434	182	\N	f
894	59	4	0	2014-02-15 10:33:10.590799	2014-02-15 10:33:10.590799	183	\N	f
895	60	4	0	2014-02-15 10:33:10.59807	2014-02-15 10:33:10.59807	184	\N	f
896	60	4	2	2014-02-15 10:33:10.602479	2014-02-15 10:33:10.602479	185	\N	f
897	60	4	0	2014-02-15 10:33:10.60675	2014-02-15 10:33:10.60675	186	\N	f
898	60	4	0	2014-02-15 10:33:10.611084	2014-02-15 10:33:10.611084	187	\N	f
899	60	4	0	2014-02-15 10:33:10.615381	2014-02-15 10:33:10.615381	188	\N	f
900	61	4	2	2014-02-15 10:33:10.622801	2014-02-15 10:33:10.622801	189	\N	f
901	61	4	0	2014-02-15 10:33:10.627149	2014-02-15 10:33:10.627149	190	\N	f
902	61	4	0	2014-02-15 10:33:10.631514	2014-02-15 10:33:10.631514	191	\N	f
903	61	4	0	2014-02-15 10:33:10.635948	2014-02-15 10:33:10.635948	192	\N	f
904	61	4	0	2014-02-15 10:33:10.640297	2014-02-15 10:33:10.640297	193	\N	f
905	62	4	0	2014-02-15 10:33:10.647369	2014-02-15 10:33:10.647369	194	\N	f
906	62	4	2	2014-02-15 10:33:10.651798	2014-02-15 10:33:10.651798	195	\N	f
907	62	4	0	2014-02-15 10:33:10.656084	2014-02-15 10:33:10.656084	196	\N	f
908	63	4	0	2014-02-15 10:33:10.663062	2014-02-15 10:33:10.663062	197	\N	f
909	63	4	2	2014-02-15 10:33:10.667406	2014-02-15 10:33:10.667406	198	\N	f
910	64	4	2	2014-02-15 10:33:10.674556	2014-02-15 10:33:10.674556	199	\N	f
911	64	4	0	2014-02-15 10:33:10.678967	2014-02-15 10:33:10.678967	200	\N	f
912	64	4	0	2014-02-15 10:33:10.683268	2014-02-15 10:33:10.683268	201	\N	f
913	65	4	0	2014-02-15 10:33:10.690483	2014-02-15 10:33:10.690483	202	\N	f
914	65	4	0	2014-02-15 10:33:10.69484	2014-02-15 10:33:10.69484	203	\N	f
915	65	4	2	2014-02-15 10:33:10.699215	2014-02-15 10:33:10.699215	204	\N	f
916	65	4	0	2014-02-15 10:33:10.7035	2014-02-15 10:33:10.7035	205	\N	f
917	66	4	0	2014-02-15 10:33:10.710677	2014-02-15 10:33:10.710677	206	\N	f
918	66	4	0	2014-02-15 10:33:10.715078	2014-02-15 10:33:10.715078	207	\N	f
919	66	4	2	2014-02-15 10:33:10.719359	2014-02-15 10:33:10.719359	208	\N	f
920	66	4	0	2014-02-15 10:33:10.723763	2014-02-15 10:33:10.723763	209	\N	f
921	68	4	0	2014-02-15 10:33:10.730684	2014-02-15 10:33:10.730684	214	\N	f
922	68	4	2	2014-02-15 10:33:10.735115	2014-02-15 10:33:10.735115	215	\N	f
923	69	4	0	2014-02-15 10:33:10.742337	2014-02-15 10:33:10.742337	216	\N	f
924	69	4	0	2014-02-15 10:33:10.746664	2014-02-15 10:33:10.746664	217	\N	f
925	69	4	2	2014-02-15 10:33:10.750989	2014-02-15 10:33:10.750989	218	\N	f
926	69	4	0	2014-02-15 10:33:10.755283	2014-02-15 10:33:10.755283	219	\N	f
927	70	4	0	2014-02-15 10:33:10.762456	2014-02-15 10:33:10.762456	220	\N	f
928	70	4	0	2014-02-15 10:33:10.766814	2014-02-15 10:33:10.766814	221	\N	f
929	70	4	2	2014-02-15 10:33:10.771153	2014-02-15 10:33:10.771153	222	\N	f
930	71	4	0	2014-02-15 10:33:10.778254	2014-02-15 10:33:10.778254	223	\N	f
931	71	4	0	2014-02-15 10:33:10.782598	2014-02-15 10:33:10.782598	224	\N	f
932	71	4	2	2014-02-15 10:33:10.786857	2014-02-15 10:33:10.786857	225	\N	f
933	72	4	0	2014-02-15 10:33:10.793979	2014-02-15 10:33:10.793979	226	\N	f
934	72	4	0	2014-02-15 10:33:10.798378	2014-02-15 10:33:10.798378	227	\N	f
935	72	4	2	2014-02-15 10:33:10.802662	2014-02-15 10:33:10.802662	228	\N	f
936	73	4	2	2014-02-15 10:33:10.809698	2014-02-15 10:33:10.809698	229	\N	f
937	73	4	0	2014-02-15 10:33:10.814028	2014-02-15 10:33:10.814028	230	\N	f
938	73	4	0	2014-02-15 10:33:10.818435	2014-02-15 10:33:10.818435	231	\N	f
939	74	4	0	2014-02-15 10:33:10.825474	2014-02-15 10:33:10.825474	232	\N	f
940	74	4	2	2014-02-15 10:33:10.829759	2014-02-15 10:33:10.829759	233	\N	f
941	74	4	0	2014-02-15 10:33:10.834085	2014-02-15 10:33:10.834085	234	\N	f
942	75	4	0	2014-02-15 10:33:10.841196	2014-02-15 10:33:10.841196	235	\N	f
943	75	4	0	2014-02-15 10:33:10.845521	2014-02-15 10:33:10.845521	236	\N	f
944	75	4	2	2014-02-15 10:33:10.849782	2014-02-15 10:33:10.849782	237	\N	f
945	76	4	0	2014-02-15 10:33:10.8571	2014-02-15 10:33:10.8571	238	\N	f
946	76	4	2	2014-02-15 10:33:10.861435	2014-02-15 10:33:10.861435	239	\N	f
947	76	4	0	2014-02-15 10:33:10.86578	2014-02-15 10:33:10.86578	240	\N	f
948	76	4	0	2014-02-15 10:33:10.870088	2014-02-15 10:33:10.870088	241	\N	f
949	21	4	0	2014-02-15 10:33:10.877314	2014-02-15 10:33:10.877314	27	\N	f
950	21	4	2	2014-02-15 10:33:10.881614	2014-02-15 10:33:10.881614	28	\N	f
951	21	4	0	2014-02-15 10:33:10.885942	2014-02-15 10:33:10.885942	29	\N	f
952	21	4	0	2014-02-15 10:33:10.890261	2014-02-15 10:33:10.890261	30	\N	f
953	67	4	0	2014-02-15 10:33:10.897434	2014-02-15 10:33:10.897434	210	\N	f
954	67	4	0	2014-02-15 10:33:10.901749	2014-02-15 10:33:10.901749	211	\N	f
955	67	4	0	2014-02-15 10:33:10.906036	2014-02-15 10:33:10.906036	212	\N	f
956	67	4	2	2014-02-15 10:33:10.910339	2014-02-15 10:33:10.910339	213	\N	f
957	15	5	0	2014-02-15 10:33:10.938615	2014-02-15 10:33:10.938615	3	\N	f
958	15	5	0	2014-02-15 10:33:10.943124	2014-02-15 10:33:10.943124	4	\N	f
959	15	5	0	2014-02-15 10:33:10.947429	2014-02-15 10:33:10.947429	5	\N	f
960	15	5	2	2014-02-15 10:33:10.951863	2014-02-15 10:33:10.951863	6	\N	f
961	16	5	0	2014-02-15 10:33:10.959047	2014-02-15 10:33:10.959047	7	\N	f
962	16	5	2	2014-02-15 10:33:10.963419	2014-02-15 10:33:10.963419	8	\N	f
963	16	5	0	2014-02-15 10:33:10.967854	2014-02-15 10:33:10.967854	9	\N	f
964	16	5	0	2014-02-15 10:33:10.972196	2014-02-15 10:33:10.972196	10	\N	f
965	17	5	0	2014-02-15 10:33:10.979454	2014-02-15 10:33:10.979454	11	\N	f
966	17	5	0	2014-02-15 10:33:10.983882	2014-02-15 10:33:10.983882	12	\N	f
967	17	5	2	2014-02-15 10:33:10.988215	2014-02-15 10:33:10.988215	13	\N	f
968	17	5	0	2014-02-15 10:33:10.992531	2014-02-15 10:33:10.992531	14	\N	f
969	18	5	0	2014-02-15 10:33:10.999772	2014-02-15 10:33:10.999772	15	\N	f
970	18	5	2	2014-02-15 10:33:11.00413	2014-02-15 10:33:11.00413	16	\N	f
971	18	5	0	2014-02-15 10:33:11.008517	2014-02-15 10:33:11.008517	17	\N	f
972	18	5	0	2014-02-15 10:33:11.012836	2014-02-15 10:33:11.012836	18	\N	f
973	19	5	0	2014-02-15 10:33:11.020131	2014-02-15 10:33:11.020131	19	\N	f
974	19	5	2	2014-02-15 10:33:11.024471	2014-02-15 10:33:11.024471	20	\N	f
975	19	5	0	2014-02-15 10:33:11.028786	2014-02-15 10:33:11.028786	21	\N	f
976	19	5	0	2014-02-15 10:33:11.033133	2014-02-15 10:33:11.033133	22	\N	f
977	20	5	0	2014-02-15 10:33:11.040302	2014-02-15 10:33:11.040302	23	\N	f
978	20	5	0	2014-02-15 10:33:11.044667	2014-02-15 10:33:11.044667	24	\N	f
979	20	5	2	2014-02-15 10:33:11.048969	2014-02-15 10:33:11.048969	25	\N	f
980	20	5	0	2014-02-15 10:33:11.053327	2014-02-15 10:33:11.053327	26	\N	f
981	22	5	0	2014-02-15 10:33:11.060548	2014-02-15 10:33:11.060548	31	\N	f
982	22	5	0	2014-02-15 10:33:11.064908	2014-02-15 10:33:11.064908	32	\N	f
983	22	5	2	2014-02-15 10:33:11.069275	2014-02-15 10:33:11.069275	33	\N	f
984	22	5	0	2014-02-15 10:33:11.073611	2014-02-15 10:33:11.073611	34	\N	f
985	23	5	0	2014-02-15 10:33:11.080878	2014-02-15 10:33:11.080878	35	\N	f
986	23	5	0	2014-02-15 10:33:11.085221	2014-02-15 10:33:11.085221	36	\N	f
987	23	5	2	2014-02-15 10:33:11.089502	2014-02-15 10:33:11.089502	37	\N	f
988	23	5	0	2014-02-15 10:33:11.093825	2014-02-15 10:33:11.093825	38	\N	f
989	24	5	2	2014-02-15 10:33:11.101183	2014-02-15 10:33:11.101183	39	\N	f
990	24	5	0	2014-02-15 10:33:11.105615	2014-02-15 10:33:11.105615	40	\N	f
991	24	5	0	2014-02-15 10:33:11.110028	2014-02-15 10:33:11.110028	41	\N	f
992	24	5	0	2014-02-15 10:33:11.114449	2014-02-15 10:33:11.114449	42	\N	f
993	25	5	0	2014-02-15 10:33:11.12181	2014-02-15 10:33:11.12181	43	\N	f
994	25	5	2	2014-02-15 10:33:11.126281	2014-02-15 10:33:11.126281	44	\N	f
995	25	5	0	2014-02-15 10:33:11.132924	2014-02-15 10:33:11.132924	45	\N	f
996	25	5	0	2014-02-15 10:33:11.178841	2014-02-15 10:33:11.178841	46	\N	f
997	26	5	0	2014-02-15 10:33:11.184986	2014-02-15 10:33:11.184986	47	\N	f
998	26	5	0	2014-02-15 10:33:11.187168	2014-02-15 10:33:11.187168	48	\N	f
999	26	5	2	2014-02-15 10:33:11.190814	2014-02-15 10:33:11.190814	49	\N	f
1000	26	5	0	2014-02-15 10:33:11.195123	2014-02-15 10:33:11.195123	50	\N	f
1001	27	5	0	2014-02-15 10:33:11.202302	2014-02-15 10:33:11.202302	51	\N	f
1002	27	5	0	2014-02-15 10:33:11.206686	2014-02-15 10:33:11.206686	52	\N	f
1003	27	5	0	2014-02-15 10:33:11.210947	2014-02-15 10:33:11.210947	53	\N	f
1004	27	5	2	2014-02-15 10:33:11.215333	2014-02-15 10:33:11.215333	54	\N	f
1005	28	5	0	2014-02-15 10:33:11.222528	2014-02-15 10:33:11.222528	55	\N	f
1006	28	5	0	2014-02-15 10:33:11.226938	2014-02-15 10:33:11.226938	56	\N	f
1007	28	5	0	2014-02-15 10:33:11.231179	2014-02-15 10:33:11.231179	57	\N	f
1008	28	5	2	2014-02-15 10:33:11.235522	2014-02-15 10:33:11.235522	58	\N	f
1009	29	5	0	2014-02-15 10:33:11.242737	2014-02-15 10:33:11.242737	59	\N	f
1010	29	5	0	2014-02-15 10:33:11.24708	2014-02-15 10:33:11.24708	60	\N	f
1011	29	5	0	2014-02-15 10:33:11.251415	2014-02-15 10:33:11.251415	61	\N	f
1012	29	5	2	2014-02-15 10:33:11.255834	2014-02-15 10:33:11.255834	62	\N	f
1013	30	5	0	2014-02-15 10:33:11.262963	2014-02-15 10:33:11.262963	63	\N	f
1014	30	5	0	2014-02-15 10:33:11.267289	2014-02-15 10:33:11.267289	64	\N	f
1015	30	5	2	2014-02-15 10:33:11.271617	2014-02-15 10:33:11.271617	65	\N	f
1016	30	5	0	2014-02-15 10:33:11.275976	2014-02-15 10:33:11.275976	66	\N	f
1017	31	5	0	2014-02-15 10:33:11.283206	2014-02-15 10:33:11.283206	67	\N	f
1018	31	5	0	2014-02-15 10:33:11.287564	2014-02-15 10:33:11.287564	68	\N	f
1019	31	5	0	2014-02-15 10:33:11.291955	2014-02-15 10:33:11.291955	69	\N	f
1020	31	5	2	2014-02-15 10:33:11.296251	2014-02-15 10:33:11.296251	70	\N	f
1021	32	5	0	2014-02-15 10:33:11.303391	2014-02-15 10:33:11.303391	71	\N	f
1022	32	5	2	2014-02-15 10:33:11.307823	2014-02-15 10:33:11.307823	72	\N	f
1023	32	5	0	2014-02-15 10:33:11.31211	2014-02-15 10:33:11.31211	73	\N	f
1024	32	5	0	2014-02-15 10:33:11.316502	2014-02-15 10:33:11.316502	74	\N	f
1025	33	5	0	2014-02-15 10:33:11.323621	2014-02-15 10:33:11.323621	75	\N	f
1026	33	5	0	2014-02-15 10:33:11.32804	2014-02-15 10:33:11.32804	76	\N	f
1027	33	5	2	2014-02-15 10:33:11.332409	2014-02-15 10:33:11.332409	77	\N	f
1028	33	5	0	2014-02-15 10:33:11.336742	2014-02-15 10:33:11.336742	78	\N	f
1029	34	5	0	2014-02-15 10:33:11.343969	2014-02-15 10:33:11.343969	79	\N	f
1030	34	5	0	2014-02-15 10:33:11.348335	2014-02-15 10:33:11.348335	80	\N	f
1031	34	5	2	2014-02-15 10:33:11.352652	2014-02-15 10:33:11.352652	81	\N	f
1032	34	5	0	2014-02-15 10:33:11.357016	2014-02-15 10:33:11.357016	82	\N	f
1033	35	5	0	2014-02-15 10:33:11.364241	2014-02-15 10:33:11.364241	83	\N	f
1034	35	5	0	2014-02-15 10:33:11.368614	2014-02-15 10:33:11.368614	84	\N	f
1035	35	5	2	2014-02-15 10:33:11.372938	2014-02-15 10:33:11.372938	85	\N	f
1036	35	5	0	2014-02-15 10:33:11.377274	2014-02-15 10:33:11.377274	86	\N	f
1037	36	5	0	2014-02-15 10:33:11.384479	2014-02-15 10:33:11.384479	87	\N	f
1038	36	5	0	2014-02-15 10:33:11.388809	2014-02-15 10:33:11.388809	88	\N	f
1039	36	5	0	2014-02-15 10:33:11.393108	2014-02-15 10:33:11.393108	89	\N	f
1040	36	5	2	2014-02-15 10:33:11.397439	2014-02-15 10:33:11.397439	90	\N	f
1041	37	5	0	2014-02-15 10:33:11.404734	2014-02-15 10:33:11.404734	91	\N	f
1042	37	5	0	2014-02-15 10:33:11.409044	2014-02-15 10:33:11.409044	92	\N	f
1043	37	5	2	2014-02-15 10:33:11.413376	2014-02-15 10:33:11.413376	93	\N	f
1044	37	5	0	2014-02-15 10:33:11.41759	2014-02-15 10:33:11.41759	94	\N	f
1045	38	5	0	2014-02-15 10:33:11.42499	2014-02-15 10:33:11.42499	95	\N	f
1046	38	5	2	2014-02-15 10:33:11.429321	2014-02-15 10:33:11.429321	96	\N	f
1047	38	5	0	2014-02-15 10:33:11.433618	2014-02-15 10:33:11.433618	97	\N	f
1048	38	5	0	2014-02-15 10:33:11.437847	2014-02-15 10:33:11.437847	98	\N	f
1049	38	5	0	2014-02-15 10:33:11.442162	2014-02-15 10:33:11.442162	99	\N	f
1050	39	5	0	2014-02-15 10:33:11.449279	2014-02-15 10:33:11.449279	100	\N	f
1051	39	5	0	2014-02-15 10:33:11.453691	2014-02-15 10:33:11.453691	101	\N	f
1052	39	5	0	2014-02-15 10:33:11.457952	2014-02-15 10:33:11.457952	102	\N	f
1053	39	5	2	2014-02-15 10:33:11.462294	2014-02-15 10:33:11.462294	103	\N	f
1054	40	5	0	2014-02-15 10:33:11.469549	2014-02-15 10:33:11.469549	104	\N	f
1055	40	5	0	2014-02-15 10:33:11.473897	2014-02-15 10:33:11.473897	105	\N	f
1056	40	5	2	2014-02-15 10:33:11.478248	2014-02-15 10:33:11.478248	106	\N	f
1057	40	5	0	2014-02-15 10:33:11.482561	2014-02-15 10:33:11.482561	107	\N	f
1058	41	5	0	2014-02-15 10:33:11.489898	2014-02-15 10:33:11.489898	108	\N	f
1059	41	5	0	2014-02-15 10:33:11.494193	2014-02-15 10:33:11.494193	109	\N	f
1060	41	5	2	2014-02-15 10:33:11.498508	2014-02-15 10:33:11.498508	110	\N	f
1061	41	5	0	2014-02-15 10:33:11.502849	2014-02-15 10:33:11.502849	111	\N	f
1062	42	5	0	2014-02-15 10:33:11.50989	2014-02-15 10:33:11.50989	112	\N	f
1063	42	5	0	2014-02-15 10:33:11.514254	2014-02-15 10:33:11.514254	113	\N	f
1064	42	5	2	2014-02-15 10:33:11.518518	2014-02-15 10:33:11.518518	114	\N	f
1065	43	5	2	2014-02-15 10:33:11.525746	2014-02-15 10:33:11.525746	115	\N	f
1066	43	5	0	2014-02-15 10:33:11.53027	2014-02-15 10:33:11.53027	116	\N	f
1067	43	5	0	2014-02-15 10:33:11.534537	2014-02-15 10:33:11.534537	117	\N	f
1068	43	5	0	2014-02-15 10:33:11.538893	2014-02-15 10:33:11.538893	118	\N	f
1069	44	5	0	2014-02-15 10:33:11.546081	2014-02-15 10:33:11.546081	119	\N	f
1070	44	5	2	2014-02-15 10:33:11.550547	2014-02-15 10:33:11.550547	120	\N	f
1071	44	5	0	2014-02-15 10:33:11.554832	2014-02-15 10:33:11.554832	121	\N	f
1072	44	5	0	2014-02-15 10:33:11.559302	2014-02-15 10:33:11.559302	122	\N	f
1073	45	5	2	2014-02-15 10:33:11.566541	2014-02-15 10:33:11.566541	123	\N	f
1074	45	5	0	2014-02-15 10:33:11.570831	2014-02-15 10:33:11.570831	124	\N	f
1075	45	5	0	2014-02-15 10:33:11.575215	2014-02-15 10:33:11.575215	125	\N	f
1076	45	5	0	2014-02-15 10:33:11.579508	2014-02-15 10:33:11.579508	126	\N	f
1077	46	5	2	2014-02-15 10:33:11.586597	2014-02-15 10:33:11.586597	127	\N	f
1078	46	5	0	2014-02-15 10:33:11.590988	2014-02-15 10:33:11.590988	128	\N	f
1079	46	5	0	2014-02-15 10:33:11.595288	2014-02-15 10:33:11.595288	129	\N	f
1080	47	5	0	2014-02-15 10:33:11.6026	2014-02-15 10:33:11.6026	130	\N	f
1081	47	5	2	2014-02-15 10:33:11.606959	2014-02-15 10:33:11.606959	131	\N	f
1082	47	5	0	2014-02-15 10:33:11.611345	2014-02-15 10:33:11.611345	132	\N	f
1083	47	5	0	2014-02-15 10:33:11.615616	2014-02-15 10:33:11.615616	133	\N	f
1084	48	5	0	2014-02-15 10:33:11.622915	2014-02-15 10:33:11.622915	134	\N	f
1085	48	5	0	2014-02-15 10:33:11.627242	2014-02-15 10:33:11.627242	135	\N	f
1086	48	5	2	2014-02-15 10:33:11.631564	2014-02-15 10:33:11.631564	136	\N	f
1087	48	5	0	2014-02-15 10:33:11.635943	2014-02-15 10:33:11.635943	137	\N	f
1088	49	5	0	2014-02-15 10:33:11.643171	2014-02-15 10:33:11.643171	138	\N	f
1089	49	5	2	2014-02-15 10:33:11.647636	2014-02-15 10:33:11.647636	139	\N	f
1090	49	5	0	2014-02-15 10:33:11.65201	2014-02-15 10:33:11.65201	140	\N	f
1091	49	5	0	2014-02-15 10:33:11.656293	2014-02-15 10:33:11.656293	141	\N	f
1092	49	5	0	2014-02-15 10:33:11.660601	2014-02-15 10:33:11.660601	142	\N	f
1093	50	5	0	2014-02-15 10:33:11.667892	2014-02-15 10:33:11.667892	143	\N	f
1094	50	5	0	2014-02-15 10:33:11.672313	2014-02-15 10:33:11.672313	144	\N	f
1095	50	5	2	2014-02-15 10:33:11.676621	2014-02-15 10:33:11.676621	145	\N	f
1096	50	5	0	2014-02-15 10:33:11.680946	2014-02-15 10:33:11.680946	146	\N	f
1097	51	5	0	2014-02-15 10:33:11.687996	2014-02-15 10:33:11.687996	147	\N	f
1098	51	5	2	2014-02-15 10:33:11.6924	2014-02-15 10:33:11.6924	148	\N	f
1099	51	5	0	2014-02-15 10:33:11.696738	2014-02-15 10:33:11.696738	149	\N	f
1100	52	5	0	2014-02-15 10:33:11.703985	2014-02-15 10:33:11.703985	150	\N	f
1101	52	5	0	2014-02-15 10:33:11.708404	2014-02-15 10:33:11.708404	151	\N	f
1102	52	5	2	2014-02-15 10:33:11.712711	2014-02-15 10:33:11.712711	152	\N	f
1103	52	5	0	2014-02-15 10:33:11.717023	2014-02-15 10:33:11.717023	153	\N	f
1104	53	5	0	2014-02-15 10:33:11.724381	2014-02-15 10:33:11.724381	154	\N	f
1105	53	5	0	2014-02-15 10:33:11.728778	2014-02-15 10:33:11.728778	155	\N	f
1106	53	5	0	2014-02-15 10:33:11.733091	2014-02-15 10:33:11.733091	156	\N	f
1107	53	5	0	2014-02-15 10:33:11.737386	2014-02-15 10:33:11.737386	157	\N	f
1108	53	5	2	2014-02-15 10:33:11.741704	2014-02-15 10:33:11.741704	158	\N	f
1109	54	5	2	2014-02-15 10:33:11.748925	2014-02-15 10:33:11.748925	159	\N	f
1110	54	5	0	2014-02-15 10:33:11.753332	2014-02-15 10:33:11.753332	160	\N	f
1111	54	5	0	2014-02-15 10:33:11.757631	2014-02-15 10:33:11.757631	161	\N	f
1112	54	5	0	2014-02-15 10:33:11.761937	2014-02-15 10:33:11.761937	162	\N	f
1113	55	5	0	2014-02-15 10:33:11.769293	2014-02-15 10:33:11.769293	163	\N	f
1114	55	5	0	2014-02-15 10:33:11.773636	2014-02-15 10:33:11.773636	164	\N	f
1115	55	5	2	2014-02-15 10:33:11.777926	2014-02-15 10:33:11.777926	165	\N	f
1116	55	5	0	2014-02-15 10:33:11.782263	2014-02-15 10:33:11.782263	166	\N	f
1117	56	5	0	2014-02-15 10:33:11.789485	2014-02-15 10:33:11.789485	167	\N	f
1118	56	5	0	2014-02-15 10:33:11.793838	2014-02-15 10:33:11.793838	168	\N	f
1119	56	5	2	2014-02-15 10:33:11.798171	2014-02-15 10:33:11.798171	169	\N	f
1120	56	5	0	2014-02-15 10:33:11.802526	2014-02-15 10:33:11.802526	170	\N	f
1121	57	5	2	2014-02-15 10:33:11.810026	2014-02-15 10:33:11.810026	171	\N	f
1122	57	5	0	2014-02-15 10:33:11.814491	2014-02-15 10:33:11.814491	172	\N	f
1123	57	5	0	2014-02-15 10:33:11.818872	2014-02-15 10:33:11.818872	173	\N	f
1124	57	5	0	2014-02-15 10:33:11.82329	2014-02-15 10:33:11.82329	174	\N	f
1125	58	5	0	2014-02-15 10:33:11.830697	2014-02-15 10:33:11.830697	175	\N	f
1126	58	5	2	2014-02-15 10:33:11.835216	2014-02-15 10:33:11.835216	176	\N	f
1127	58	5	0	2014-02-15 10:33:11.839959	2014-02-15 10:33:11.839959	177	\N	f
1128	58	5	0	2014-02-15 10:33:11.881658	2014-02-15 10:33:11.881658	178	\N	f
1129	59	5	0	2014-02-15 10:33:11.888051	2014-02-15 10:33:11.888051	179	\N	f
1130	59	5	0	2014-02-15 10:33:11.892518	2014-02-15 10:33:11.892518	180	\N	f
1131	59	5	2	2014-02-15 10:33:11.896867	2014-02-15 10:33:11.896867	181	\N	f
1132	59	5	0	2014-02-15 10:33:11.901219	2014-02-15 10:33:11.901219	182	\N	f
1133	59	5	0	2014-02-15 10:33:11.905532	2014-02-15 10:33:11.905532	183	\N	f
1134	60	5	0	2014-02-15 10:33:11.912926	2014-02-15 10:33:11.912926	184	\N	f
1135	60	5	2	2014-02-15 10:33:11.917221	2014-02-15 10:33:11.917221	185	\N	f
1136	60	5	0	2014-02-15 10:33:11.921588	2014-02-15 10:33:11.921588	186	\N	f
1137	60	5	0	2014-02-15 10:33:11.925884	2014-02-15 10:33:11.925884	187	\N	f
1138	60	5	0	2014-02-15 10:33:11.930235	2014-02-15 10:33:11.930235	188	\N	f
1139	61	5	2	2014-02-15 10:33:11.937648	2014-02-15 10:33:11.937648	189	\N	f
1140	61	5	0	2014-02-15 10:33:11.942074	2014-02-15 10:33:11.942074	190	\N	f
1141	61	5	0	2014-02-15 10:33:11.946655	2014-02-15 10:33:11.946655	191	\N	f
1142	61	5	0	2014-02-15 10:33:11.950939	2014-02-15 10:33:11.950939	192	\N	f
1143	61	5	0	2014-02-15 10:33:11.955272	2014-02-15 10:33:11.955272	193	\N	f
1144	62	5	0	2014-02-15 10:33:11.962435	2014-02-15 10:33:11.962435	194	\N	f
1145	62	5	2	2014-02-15 10:33:11.967017	2014-02-15 10:33:11.967017	195	\N	f
1146	62	5	0	2014-02-15 10:33:11.971534	2014-02-15 10:33:11.971534	196	\N	f
1147	63	5	0	2014-02-15 10:33:11.978518	2014-02-15 10:33:11.978518	197	\N	f
1148	63	5	2	2014-02-15 10:33:11.98295	2014-02-15 10:33:11.98295	198	\N	f
1149	64	5	2	2014-02-15 10:33:11.99006	2014-02-15 10:33:11.99006	199	\N	f
1150	64	5	0	2014-02-15 10:33:11.994433	2014-02-15 10:33:11.994433	200	\N	f
1151	64	5	0	2014-02-15 10:33:11.998709	2014-02-15 10:33:11.998709	201	\N	f
1152	65	5	0	2014-02-15 10:33:12.005984	2014-02-15 10:33:12.005984	202	\N	f
1153	65	5	0	2014-02-15 10:33:12.010299	2014-02-15 10:33:12.010299	203	\N	f
1154	65	5	2	2014-02-15 10:33:12.01463	2014-02-15 10:33:12.01463	204	\N	f
1155	65	5	0	2014-02-15 10:33:12.019006	2014-02-15 10:33:12.019006	205	\N	f
1156	66	5	0	2014-02-15 10:33:12.026258	2014-02-15 10:33:12.026258	206	\N	f
1157	66	5	0	2014-02-15 10:33:12.03069	2014-02-15 10:33:12.03069	207	\N	f
1158	66	5	2	2014-02-15 10:33:12.03497	2014-02-15 10:33:12.03497	208	\N	f
1159	66	5	0	2014-02-15 10:33:12.039289	2014-02-15 10:33:12.039289	209	\N	f
1160	68	5	0	2014-02-15 10:33:12.046317	2014-02-15 10:33:12.046317	214	\N	f
1161	68	5	2	2014-02-15 10:33:12.050646	2014-02-15 10:33:12.050646	215	\N	f
1162	69	5	0	2014-02-15 10:33:12.057845	2014-02-15 10:33:12.057845	216	\N	f
1163	69	5	0	2014-02-15 10:33:12.062225	2014-02-15 10:33:12.062225	217	\N	f
1164	69	5	2	2014-02-15 10:33:12.066561	2014-02-15 10:33:12.066561	218	\N	f
1165	69	5	0	2014-02-15 10:33:12.070892	2014-02-15 10:33:12.070892	219	\N	f
1166	70	5	0	2014-02-15 10:33:12.078091	2014-02-15 10:33:12.078091	220	\N	f
1167	70	5	0	2014-02-15 10:33:12.082504	2014-02-15 10:33:12.082504	221	\N	f
1168	70	5	2	2014-02-15 10:33:12.086874	2014-02-15 10:33:12.086874	222	\N	f
1169	71	5	0	2014-02-15 10:33:12.09405	2014-02-15 10:33:12.09405	223	\N	f
1170	71	5	0	2014-02-15 10:33:12.098412	2014-02-15 10:33:12.098412	224	\N	f
1171	71	5	2	2014-02-15 10:33:12.102764	2014-02-15 10:33:12.102764	225	\N	f
1172	72	5	0	2014-02-15 10:33:12.109862	2014-02-15 10:33:12.109862	226	\N	f
1173	72	5	0	2014-02-15 10:33:12.114259	2014-02-15 10:33:12.114259	227	\N	f
1174	72	5	2	2014-02-15 10:33:12.118572	2014-02-15 10:33:12.118572	228	\N	f
1175	73	5	2	2014-02-15 10:33:12.125747	2014-02-15 10:33:12.125747	229	\N	f
1176	73	5	0	2014-02-15 10:33:12.130101	2014-02-15 10:33:12.130101	230	\N	f
1177	73	5	0	2014-02-15 10:33:12.134468	2014-02-15 10:33:12.134468	231	\N	f
1178	74	5	0	2014-02-15 10:33:12.141666	2014-02-15 10:33:12.141666	232	\N	f
1179	74	5	2	2014-02-15 10:33:12.146255	2014-02-15 10:33:12.146255	233	\N	f
1180	74	5	0	2014-02-15 10:33:12.150624	2014-02-15 10:33:12.150624	234	\N	f
1181	75	5	0	2014-02-15 10:33:12.157727	2014-02-15 10:33:12.157727	235	\N	f
1182	75	5	0	2014-02-15 10:33:12.162207	2014-02-15 10:33:12.162207	236	\N	f
1183	75	5	2	2014-02-15 10:33:12.166532	2014-02-15 10:33:12.166532	237	\N	f
1184	76	5	0	2014-02-15 10:33:12.173797	2014-02-15 10:33:12.173797	238	\N	f
1185	76	5	2	2014-02-15 10:33:12.17816	2014-02-15 10:33:12.17816	239	\N	f
1186	76	5	0	2014-02-15 10:33:12.182444	2014-02-15 10:33:12.182444	240	\N	f
1187	76	5	0	2014-02-15 10:33:12.18679	2014-02-15 10:33:12.18679	241	\N	f
1188	21	5	0	2014-02-15 10:33:12.193906	2014-02-15 10:33:12.193906	27	\N	f
1189	21	5	2	2014-02-15 10:33:12.198275	2014-02-15 10:33:12.198275	28	\N	f
1190	21	5	0	2014-02-15 10:33:12.20259	2014-02-15 10:33:12.20259	29	\N	f
1191	21	5	0	2014-02-15 10:33:12.206874	2014-02-15 10:33:12.206874	30	\N	f
1192	67	5	0	2014-02-15 10:33:12.214129	2014-02-15 10:33:12.214129	210	\N	f
1193	67	5	0	2014-02-15 10:33:12.218491	2014-02-15 10:33:12.218491	211	\N	f
1194	67	5	0	2014-02-15 10:33:12.222855	2014-02-15 10:33:12.222855	212	\N	f
1195	67	5	2	2014-02-15 10:33:12.2271	2014-02-15 10:33:12.2271	213	\N	f
1196	15	6	0	2014-02-15 10:33:12.255574	2014-02-15 10:33:12.255574	3	\N	f
1197	15	6	0	2014-02-15 10:33:12.260111	2014-02-15 10:33:12.260111	4	\N	f
1198	15	6	0	2014-02-15 10:33:12.264485	2014-02-15 10:33:12.264485	5	\N	f
1199	15	6	2	2014-02-15 10:33:12.268801	2014-02-15 10:33:12.268801	6	\N	f
1200	16	6	0	2014-02-15 10:33:12.276006	2014-02-15 10:33:12.276006	7	\N	f
1201	16	6	2	2014-02-15 10:33:12.280424	2014-02-15 10:33:12.280424	8	\N	f
1202	16	6	0	2014-02-15 10:33:12.284799	2014-02-15 10:33:12.284799	9	\N	f
1203	16	6	0	2014-02-15 10:33:12.289086	2014-02-15 10:33:12.289086	10	\N	f
1204	17	6	0	2014-02-15 10:33:12.296353	2014-02-15 10:33:12.296353	11	\N	f
1205	17	6	0	2014-02-15 10:33:12.300702	2014-02-15 10:33:12.300702	12	\N	f
1206	17	6	2	2014-02-15 10:33:12.305074	2014-02-15 10:33:12.305074	13	\N	f
1207	17	6	0	2014-02-15 10:33:12.30938	2014-02-15 10:33:12.30938	14	\N	f
1208	18	6	0	2014-02-15 10:33:12.316604	2014-02-15 10:33:12.316604	15	\N	f
1209	18	6	2	2014-02-15 10:33:12.320947	2014-02-15 10:33:12.320947	16	\N	f
1210	18	6	0	2014-02-15 10:33:12.325295	2014-02-15 10:33:12.325295	17	\N	f
1211	18	6	0	2014-02-15 10:33:12.329593	2014-02-15 10:33:12.329593	18	\N	f
1212	19	6	0	2014-02-15 10:33:12.336849	2014-02-15 10:33:12.336849	19	\N	f
1213	19	6	2	2014-02-15 10:33:12.341228	2014-02-15 10:33:12.341228	20	\N	f
1214	19	6	0	2014-02-15 10:33:12.345478	2014-02-15 10:33:12.345478	21	\N	f
1215	19	6	0	2014-02-15 10:33:12.349849	2014-02-15 10:33:12.349849	22	\N	f
1216	20	6	0	2014-02-15 10:33:12.356958	2014-02-15 10:33:12.356958	23	\N	f
1217	20	6	0	2014-02-15 10:33:12.361307	2014-02-15 10:33:12.361307	24	\N	f
1218	20	6	2	2014-02-15 10:33:12.365572	2014-02-15 10:33:12.365572	25	\N	f
1219	20	6	0	2014-02-15 10:33:12.369926	2014-02-15 10:33:12.369926	26	\N	f
1220	22	6	0	2014-02-15 10:33:12.377111	2014-02-15 10:33:12.377111	31	\N	f
1221	22	6	0	2014-02-15 10:33:12.381499	2014-02-15 10:33:12.381499	32	\N	f
1222	22	6	2	2014-02-15 10:33:12.38579	2014-02-15 10:33:12.38579	33	\N	f
1223	22	6	0	2014-02-15 10:33:12.390107	2014-02-15 10:33:12.390107	34	\N	f
1224	23	6	0	2014-02-15 10:33:12.39725	2014-02-15 10:33:12.39725	35	\N	f
1225	23	6	0	2014-02-15 10:33:12.401652	2014-02-15 10:33:12.401652	36	\N	f
1226	23	6	2	2014-02-15 10:33:12.405935	2014-02-15 10:33:12.405935	37	\N	f
1227	23	6	0	2014-02-15 10:33:12.410233	2014-02-15 10:33:12.410233	38	\N	f
1228	24	6	2	2014-02-15 10:33:12.417459	2014-02-15 10:33:12.417459	39	\N	f
1229	24	6	0	2014-02-15 10:33:12.421826	2014-02-15 10:33:12.421826	40	\N	f
1230	24	6	0	2014-02-15 10:33:12.426157	2014-02-15 10:33:12.426157	41	\N	f
1231	24	6	0	2014-02-15 10:33:12.430437	2014-02-15 10:33:12.430437	42	\N	f
1232	25	6	0	2014-02-15 10:33:12.437622	2014-02-15 10:33:12.437622	43	\N	f
1233	25	6	2	2014-02-15 10:33:12.441953	2014-02-15 10:33:12.441953	44	\N	f
1234	25	6	0	2014-02-15 10:33:12.446306	2014-02-15 10:33:12.446306	45	\N	f
1235	25	6	0	2014-02-15 10:33:12.450626	2014-02-15 10:33:12.450626	46	\N	f
1236	26	6	0	2014-02-15 10:33:12.457783	2014-02-15 10:33:12.457783	47	\N	f
1237	26	6	0	2014-02-15 10:33:12.462169	2014-02-15 10:33:12.462169	48	\N	f
1238	26	6	2	2014-02-15 10:33:12.466498	2014-02-15 10:33:12.466498	49	\N	f
1239	26	6	0	2014-02-15 10:33:12.470815	2014-02-15 10:33:12.470815	50	\N	f
1240	27	6	0	2014-02-15 10:33:12.478064	2014-02-15 10:33:12.478064	51	\N	f
1241	27	6	0	2014-02-15 10:33:12.482481	2014-02-15 10:33:12.482481	52	\N	f
1242	27	6	0	2014-02-15 10:33:12.486868	2014-02-15 10:33:12.486868	53	\N	f
1243	27	6	2	2014-02-15 10:33:12.49126	2014-02-15 10:33:12.49126	54	\N	f
1244	28	6	0	2014-02-15 10:33:12.498608	2014-02-15 10:33:12.498608	55	\N	f
1245	28	6	0	2014-02-15 10:33:12.503077	2014-02-15 10:33:12.503077	56	\N	f
1246	28	6	0	2014-02-15 10:33:12.507526	2014-02-15 10:33:12.507526	57	\N	f
1247	28	6	2	2014-02-15 10:33:12.512248	2014-02-15 10:33:12.512248	58	\N	f
1248	29	6	0	2014-02-15 10:33:12.556706	2014-02-15 10:33:12.556706	59	\N	f
1249	29	6	0	2014-02-15 10:33:12.558919	2014-02-15 10:33:12.558919	60	\N	f
1250	29	6	0	2014-02-15 10:33:12.561098	2014-02-15 10:33:12.561098	61	\N	f
1251	29	6	2	2014-02-15 10:33:12.563287	2014-02-15 10:33:12.563287	62	\N	f
1252	30	6	0	2014-02-15 10:33:12.567276	2014-02-15 10:33:12.567276	63	\N	f
1253	30	6	0	2014-02-15 10:33:12.56954	2014-02-15 10:33:12.56954	64	\N	f
1254	30	6	2	2014-02-15 10:33:12.571704	2014-02-15 10:33:12.571704	65	\N	f
1255	30	6	0	2014-02-15 10:33:12.573914	2014-02-15 10:33:12.573914	66	\N	f
1256	31	6	0	2014-02-15 10:33:12.577847	2014-02-15 10:33:12.577847	67	\N	f
1257	31	6	0	2014-02-15 10:33:12.580114	2014-02-15 10:33:12.580114	68	\N	f
1258	31	6	0	2014-02-15 10:33:12.58238	2014-02-15 10:33:12.58238	69	\N	f
1259	31	6	2	2014-02-15 10:33:12.584552	2014-02-15 10:33:12.584552	70	\N	f
1260	32	6	0	2014-02-15 10:33:12.588888	2014-02-15 10:33:12.588888	71	\N	f
1261	32	6	2	2014-02-15 10:33:12.59107	2014-02-15 10:33:12.59107	72	\N	f
1262	32	6	0	2014-02-15 10:33:12.593301	2014-02-15 10:33:12.593301	73	\N	f
1263	32	6	0	2014-02-15 10:33:12.595492	2014-02-15 10:33:12.595492	74	\N	f
1264	33	6	0	2014-02-15 10:33:12.599488	2014-02-15 10:33:12.599488	75	\N	f
1265	33	6	0	2014-02-15 10:33:12.601671	2014-02-15 10:33:12.601671	76	\N	f
1266	33	6	2	2014-02-15 10:33:12.603909	2014-02-15 10:33:12.603909	77	\N	f
1267	33	6	0	2014-02-15 10:33:12.606091	2014-02-15 10:33:12.606091	78	\N	f
1268	34	6	0	2014-02-15 10:33:12.610053	2014-02-15 10:33:12.610053	79	\N	f
1269	34	6	0	2014-02-15 10:33:12.612257	2014-02-15 10:33:12.612257	80	\N	f
1270	34	6	2	2014-02-15 10:33:12.614454	2014-02-15 10:33:12.614454	81	\N	f
1271	34	6	0	2014-02-15 10:33:12.616653	2014-02-15 10:33:12.616653	82	\N	f
1272	35	6	0	2014-02-15 10:33:12.620817	2014-02-15 10:33:12.620817	83	\N	f
1273	35	6	0	2014-02-15 10:33:12.623341	2014-02-15 10:33:12.623341	84	\N	f
1274	35	6	2	2014-02-15 10:33:12.625902	2014-02-15 10:33:12.625902	85	\N	f
1275	35	6	0	2014-02-15 10:33:12.62848	2014-02-15 10:33:12.62848	86	\N	f
1276	36	6	0	2014-02-15 10:33:12.633059	2014-02-15 10:33:12.633059	87	\N	f
1277	36	6	0	2014-02-15 10:33:12.635623	2014-02-15 10:33:12.635623	88	\N	f
1278	36	6	0	2014-02-15 10:33:12.638288	2014-02-15 10:33:12.638288	89	\N	f
1279	36	6	2	2014-02-15 10:33:12.640877	2014-02-15 10:33:12.640877	90	\N	f
1280	37	6	0	2014-02-15 10:33:12.645457	2014-02-15 10:33:12.645457	91	\N	f
1281	37	6	0	2014-02-15 10:33:12.648083	2014-02-15 10:33:12.648083	92	\N	f
1282	37	6	2	2014-02-15 10:33:12.650621	2014-02-15 10:33:12.650621	93	\N	f
1283	37	6	0	2014-02-15 10:33:12.653225	2014-02-15 10:33:12.653225	94	\N	f
1284	38	6	0	2014-02-15 10:33:12.657828	2014-02-15 10:33:12.657828	95	\N	f
1285	38	6	2	2014-02-15 10:33:12.66038	2014-02-15 10:33:12.66038	96	\N	f
1286	38	6	0	2014-02-15 10:33:12.663061	2014-02-15 10:33:12.663061	97	\N	f
1287	38	6	0	2014-02-15 10:33:12.665678	2014-02-15 10:33:12.665678	98	\N	f
1288	38	6	0	2014-02-15 10:33:12.668243	2014-02-15 10:33:12.668243	99	\N	f
1289	39	6	0	2014-02-15 10:33:12.672817	2014-02-15 10:33:12.672817	100	\N	f
1290	39	6	0	2014-02-15 10:33:12.67537	2014-02-15 10:33:12.67537	101	\N	f
1291	39	6	0	2014-02-15 10:33:12.677995	2014-02-15 10:33:12.677995	102	\N	f
1292	39	6	2	2014-02-15 10:33:12.680547	2014-02-15 10:33:12.680547	103	\N	f
1293	40	6	0	2014-02-15 10:33:12.685072	2014-02-15 10:33:12.685072	104	\N	f
1294	40	6	0	2014-02-15 10:33:12.687634	2014-02-15 10:33:12.687634	105	\N	f
1295	40	6	2	2014-02-15 10:33:12.690235	2014-02-15 10:33:12.690235	106	\N	f
1296	40	6	0	2014-02-15 10:33:12.692747	2014-02-15 10:33:12.692747	107	\N	f
1297	41	6	0	2014-02-15 10:33:12.697338	2014-02-15 10:33:12.697338	108	\N	f
1298	41	6	0	2014-02-15 10:33:12.699974	2014-02-15 10:33:12.699974	109	\N	f
1299	41	6	2	2014-02-15 10:33:12.702536	2014-02-15 10:33:12.702536	110	\N	f
1300	41	6	0	2014-02-15 10:33:12.705129	2014-02-15 10:33:12.705129	111	\N	f
1301	42	6	0	2014-02-15 10:33:12.709577	2014-02-15 10:33:12.709577	112	\N	f
1302	42	6	0	2014-02-15 10:33:12.712168	2014-02-15 10:33:12.712168	113	\N	f
1303	42	6	2	2014-02-15 10:33:12.714737	2014-02-15 10:33:12.714737	114	\N	f
1304	43	6	2	2014-02-15 10:33:12.719232	2014-02-15 10:33:12.719232	115	\N	f
1305	43	6	0	2014-02-15 10:33:12.721788	2014-02-15 10:33:12.721788	116	\N	f
1306	43	6	0	2014-02-15 10:33:12.724398	2014-02-15 10:33:12.724398	117	\N	f
1307	43	6	0	2014-02-15 10:33:12.726913	2014-02-15 10:33:12.726913	118	\N	f
1308	44	6	0	2014-02-15 10:33:12.731452	2014-02-15 10:33:12.731452	119	\N	f
1309	44	6	2	2014-02-15 10:33:12.734078	2014-02-15 10:33:12.734078	120	\N	f
1310	44	6	0	2014-02-15 10:33:12.736681	2014-02-15 10:33:12.736681	121	\N	f
1311	44	6	0	2014-02-15 10:33:12.73918	2014-02-15 10:33:12.73918	122	\N	f
1312	45	6	2	2014-02-15 10:33:12.743721	2014-02-15 10:33:12.743721	123	\N	f
1313	45	6	0	2014-02-15 10:33:12.746316	2014-02-15 10:33:12.746316	124	\N	f
1314	45	6	0	2014-02-15 10:33:12.748902	2014-02-15 10:33:12.748902	125	\N	f
1315	45	6	0	2014-02-15 10:33:12.751443	2014-02-15 10:33:12.751443	126	\N	f
1316	46	6	2	2014-02-15 10:33:12.75601	2014-02-15 10:33:12.75601	127	\N	f
1317	46	6	0	2014-02-15 10:33:12.758562	2014-02-15 10:33:12.758562	128	\N	f
1318	46	6	0	2014-02-15 10:33:12.761177	2014-02-15 10:33:12.761177	129	\N	f
1319	47	6	0	2014-02-15 10:33:12.765745	2014-02-15 10:33:12.765745	130	\N	f
1320	47	6	2	2014-02-15 10:33:12.768315	2014-02-15 10:33:12.768315	131	\N	f
1321	47	6	0	2014-02-15 10:33:12.770828	2014-02-15 10:33:12.770828	132	\N	f
1322	47	6	0	2014-02-15 10:33:12.773425	2014-02-15 10:33:12.773425	133	\N	f
1323	48	6	0	2014-02-15 10:33:12.777975	2014-02-15 10:33:12.777975	134	\N	f
1324	48	6	0	2014-02-15 10:33:12.78052	2014-02-15 10:33:12.78052	135	\N	f
1325	48	6	2	2014-02-15 10:33:12.783075	2014-02-15 10:33:12.783075	136	\N	f
1326	48	6	0	2014-02-15 10:33:12.785689	2014-02-15 10:33:12.785689	137	\N	f
1327	49	6	0	2014-02-15 10:33:12.790254	2014-02-15 10:33:12.790254	138	\N	f
1328	49	6	2	2014-02-15 10:33:12.792884	2014-02-15 10:33:12.792884	139	\N	f
1329	49	6	0	2014-02-15 10:33:12.795434	2014-02-15 10:33:12.795434	140	\N	f
1330	49	6	0	2014-02-15 10:33:12.798061	2014-02-15 10:33:12.798061	141	\N	f
1331	49	6	0	2014-02-15 10:33:12.800672	2014-02-15 10:33:12.800672	142	\N	f
1332	50	6	0	2014-02-15 10:33:12.805437	2014-02-15 10:33:12.805437	143	\N	f
1333	50	6	0	2014-02-15 10:33:12.808025	2014-02-15 10:33:12.808025	144	\N	f
1334	50	6	2	2014-02-15 10:33:12.810595	2014-02-15 10:33:12.810595	145	\N	f
1335	50	6	0	2014-02-15 10:33:12.813182	2014-02-15 10:33:12.813182	146	\N	f
1336	51	6	0	2014-02-15 10:33:12.817693	2014-02-15 10:33:12.817693	147	\N	f
1337	51	6	2	2014-02-15 10:33:12.820315	2014-02-15 10:33:12.820315	148	\N	f
1338	51	6	0	2014-02-15 10:33:12.822844	2014-02-15 10:33:12.822844	149	\N	f
1339	52	6	0	2014-02-15 10:33:12.82739	2014-02-15 10:33:12.82739	150	\N	f
1340	52	6	0	2014-02-15 10:33:12.829944	2014-02-15 10:33:12.829944	151	\N	f
1341	52	6	2	2014-02-15 10:33:12.832524	2014-02-15 10:33:12.832524	152	\N	f
1342	52	6	0	2014-02-15 10:33:12.835061	2014-02-15 10:33:12.835061	153	\N	f
1343	53	6	0	2014-02-15 10:33:12.839747	2014-02-15 10:33:12.839747	154	\N	f
1344	53	6	0	2014-02-15 10:33:12.842324	2014-02-15 10:33:12.842324	155	\N	f
1345	53	6	0	2014-02-15 10:33:12.8449	2014-02-15 10:33:12.8449	156	\N	f
1346	53	6	0	2014-02-15 10:33:12.847442	2014-02-15 10:33:12.847442	157	\N	f
1347	53	6	2	2014-02-15 10:33:12.850037	2014-02-15 10:33:12.850037	158	\N	f
1348	54	6	2	2014-02-15 10:33:12.854571	2014-02-15 10:33:12.854571	159	\N	f
1349	54	6	0	2014-02-15 10:33:12.85733	2014-02-15 10:33:12.85733	160	\N	f
1350	54	6	0	2014-02-15 10:33:12.859934	2014-02-15 10:33:12.859934	161	\N	f
1351	54	6	0	2014-02-15 10:33:12.862773	2014-02-15 10:33:12.862773	162	\N	f
1352	55	6	0	2014-02-15 10:33:12.867699	2014-02-15 10:33:12.867699	163	\N	f
1353	55	6	0	2014-02-15 10:33:12.870614	2014-02-15 10:33:12.870614	164	\N	f
1354	55	6	2	2014-02-15 10:33:12.873416	2014-02-15 10:33:12.873416	165	\N	f
1355	55	6	0	2014-02-15 10:33:12.87627	2014-02-15 10:33:12.87627	166	\N	f
1356	56	6	0	2014-02-15 10:33:12.881229	2014-02-15 10:33:12.881229	167	\N	f
1357	56	6	0	2014-02-15 10:33:12.884123	2014-02-15 10:33:12.884123	168	\N	f
1358	56	6	2	2014-02-15 10:33:12.886939	2014-02-15 10:33:12.886939	169	\N	f
1359	56	6	0	2014-02-15 10:33:12.889806	2014-02-15 10:33:12.889806	170	\N	f
1360	57	6	2	2014-02-15 10:33:12.894774	2014-02-15 10:33:12.894774	171	\N	f
1361	57	6	0	2014-02-15 10:33:12.897645	2014-02-15 10:33:12.897645	172	\N	f
1362	57	6	0	2014-02-15 10:33:12.900511	2014-02-15 10:33:12.900511	173	\N	f
1363	57	6	0	2014-02-15 10:33:12.903336	2014-02-15 10:33:12.903336	174	\N	f
1364	58	6	0	2014-02-15 10:33:12.908394	2014-02-15 10:33:12.908394	175	\N	f
1365	58	6	2	2014-02-15 10:33:12.911269	2014-02-15 10:33:12.911269	176	\N	f
1366	58	6	0	2014-02-15 10:33:12.914168	2014-02-15 10:33:12.914168	177	\N	f
1367	58	6	0	2014-02-15 10:33:12.91707	2014-02-15 10:33:12.91707	178	\N	f
1368	59	6	0	2014-02-15 10:33:12.922249	2014-02-15 10:33:12.922249	179	\N	f
1369	59	6	0	2014-02-15 10:33:12.925363	2014-02-15 10:33:12.925363	180	\N	f
1370	59	6	2	2014-02-15 10:33:12.968783	2014-02-15 10:33:12.968783	181	\N	f
1371	59	6	0	2014-02-15 10:33:12.972206	2014-02-15 10:33:12.972206	182	\N	f
1372	59	6	0	2014-02-15 10:33:12.976603	2014-02-15 10:33:12.976603	183	\N	f
1373	60	6	0	2014-02-15 10:33:12.983975	2014-02-15 10:33:12.983975	184	\N	f
1374	60	6	2	2014-02-15 10:33:12.988485	2014-02-15 10:33:12.988485	185	\N	f
1375	60	6	0	2014-02-15 10:33:12.992797	2014-02-15 10:33:12.992797	186	\N	f
1376	60	6	0	2014-02-15 10:33:12.99709	2014-02-15 10:33:12.99709	187	\N	f
1377	60	6	0	2014-02-15 10:33:13.001373	2014-02-15 10:33:13.001373	188	\N	f
1378	61	6	2	2014-02-15 10:33:13.008744	2014-02-15 10:33:13.008744	189	\N	f
1379	61	6	0	2014-02-15 10:33:13.013131	2014-02-15 10:33:13.013131	190	\N	f
1380	61	6	0	2014-02-15 10:33:13.017429	2014-02-15 10:33:13.017429	191	\N	f
1381	61	6	0	2014-02-15 10:33:13.021676	2014-02-15 10:33:13.021676	192	\N	f
1382	61	6	0	2014-02-15 10:33:13.025996	2014-02-15 10:33:13.025996	193	\N	f
1383	62	6	0	2014-02-15 10:33:13.033122	2014-02-15 10:33:13.033122	194	\N	f
1384	62	6	2	2014-02-15 10:33:13.037472	2014-02-15 10:33:13.037472	195	\N	f
1385	62	6	0	2014-02-15 10:33:13.041736	2014-02-15 10:33:13.041736	196	\N	f
1386	63	6	0	2014-02-15 10:33:13.048752	2014-02-15 10:33:13.048752	197	\N	f
1387	63	6	2	2014-02-15 10:33:13.053018	2014-02-15 10:33:13.053018	198	\N	f
1388	64	6	2	2014-02-15 10:33:13.060133	2014-02-15 10:33:13.060133	199	\N	f
1389	64	6	0	2014-02-15 10:33:13.064555	2014-02-15 10:33:13.064555	200	\N	f
1390	64	6	0	2014-02-15 10:33:13.068925	2014-02-15 10:33:13.068925	201	\N	f
1391	65	6	0	2014-02-15 10:33:13.076129	2014-02-15 10:33:13.076129	202	\N	f
1392	65	6	0	2014-02-15 10:33:13.080438	2014-02-15 10:33:13.080438	203	\N	f
1393	65	6	2	2014-02-15 10:33:13.084948	2014-02-15 10:33:13.084948	204	\N	f
1394	65	6	0	2014-02-15 10:33:13.089288	2014-02-15 10:33:13.089288	205	\N	f
1395	66	6	0	2014-02-15 10:33:13.09645	2014-02-15 10:33:13.09645	206	\N	f
1396	66	6	0	2014-02-15 10:33:13.100829	2014-02-15 10:33:13.100829	207	\N	f
1397	66	6	2	2014-02-15 10:33:13.10516	2014-02-15 10:33:13.10516	208	\N	f
1398	66	6	0	2014-02-15 10:33:13.109484	2014-02-15 10:33:13.109484	209	\N	f
1399	68	6	0	2014-02-15 10:33:13.116393	2014-02-15 10:33:13.116393	214	\N	f
1400	68	6	2	2014-02-15 10:33:13.120771	2014-02-15 10:33:13.120771	215	\N	f
1401	69	6	0	2014-02-15 10:33:13.127928	2014-02-15 10:33:13.127928	216	\N	f
1402	69	6	0	2014-02-15 10:33:13.132341	2014-02-15 10:33:13.132341	217	\N	f
1403	69	6	2	2014-02-15 10:33:13.136686	2014-02-15 10:33:13.136686	218	\N	f
1404	69	6	0	2014-02-15 10:33:13.141024	2014-02-15 10:33:13.141024	219	\N	f
1405	70	6	0	2014-02-15 10:33:13.148133	2014-02-15 10:33:13.148133	220	\N	f
1406	70	6	0	2014-02-15 10:33:13.152474	2014-02-15 10:33:13.152474	221	\N	f
1407	70	6	2	2014-02-15 10:33:13.156826	2014-02-15 10:33:13.156826	222	\N	f
1408	71	6	0	2014-02-15 10:33:13.163852	2014-02-15 10:33:13.163852	223	\N	f
1409	71	6	0	2014-02-15 10:33:13.167229	2014-02-15 10:33:13.167229	224	\N	f
1410	71	6	2	2014-02-15 10:33:13.170961	2014-02-15 10:33:13.170961	225	\N	f
1411	72	6	0	2014-02-15 10:33:13.178025	2014-02-15 10:33:13.178025	226	\N	f
1412	72	6	0	2014-02-15 10:33:13.182399	2014-02-15 10:33:13.182399	227	\N	f
1413	72	6	2	2014-02-15 10:33:13.186716	2014-02-15 10:33:13.186716	228	\N	f
1414	73	6	2	2014-02-15 10:33:13.193732	2014-02-15 10:33:13.193732	229	\N	f
1415	73	6	0	2014-02-15 10:33:13.198067	2014-02-15 10:33:13.198067	230	\N	f
1416	73	6	0	2014-02-15 10:33:13.202344	2014-02-15 10:33:13.202344	231	\N	f
1417	74	6	0	2014-02-15 10:33:13.209445	2014-02-15 10:33:13.209445	232	\N	f
1418	74	6	2	2014-02-15 10:33:13.213791	2014-02-15 10:33:13.213791	233	\N	f
1419	74	6	0	2014-02-15 10:33:13.218133	2014-02-15 10:33:13.218133	234	\N	f
1420	75	6	0	2014-02-15 10:33:13.225223	2014-02-15 10:33:13.225223	235	\N	f
1421	75	6	0	2014-02-15 10:33:13.229553	2014-02-15 10:33:13.229553	236	\N	f
1422	75	6	2	2014-02-15 10:33:13.233874	2014-02-15 10:33:13.233874	237	\N	f
1423	76	6	0	2014-02-15 10:33:13.24109	2014-02-15 10:33:13.24109	238	\N	f
1424	76	6	2	2014-02-15 10:33:13.245445	2014-02-15 10:33:13.245445	239	\N	f
1425	76	6	0	2014-02-15 10:33:13.249765	2014-02-15 10:33:13.249765	240	\N	f
1426	76	6	0	2014-02-15 10:33:13.253985	2014-02-15 10:33:13.253985	241	\N	f
1427	21	6	0	2014-02-15 10:33:13.261208	2014-02-15 10:33:13.261208	27	\N	f
1428	21	6	2	2014-02-15 10:33:13.2656	2014-02-15 10:33:13.2656	28	\N	f
1429	21	6	0	2014-02-15 10:33:13.269958	2014-02-15 10:33:13.269958	29	\N	f
1430	21	6	0	2014-02-15 10:33:13.27425	2014-02-15 10:33:13.27425	30	\N	f
1431	67	6	0	2014-02-15 10:33:13.2815	2014-02-15 10:33:13.2815	210	\N	f
1432	67	6	0	2014-02-15 10:33:13.285874	2014-02-15 10:33:13.285874	211	\N	f
1433	67	6	0	2014-02-15 10:33:13.290099	2014-02-15 10:33:13.290099	212	\N	f
1434	67	6	2	2014-02-15 10:33:13.294404	2014-02-15 10:33:13.294404	213	\N	f
1435	15	7	0	2014-02-15 10:33:13.322635	2014-02-15 10:33:13.322635	3	\N	f
1436	15	7	0	2014-02-15 10:33:13.327073	2014-02-15 10:33:13.327073	4	\N	f
1437	15	7	0	2014-02-15 10:33:13.331328	2014-02-15 10:33:13.331328	5	\N	f
1438	15	7	2	2014-02-15 10:33:13.335617	2014-02-15 10:33:13.335617	6	\N	f
1439	16	7	0	2014-02-15 10:33:13.342857	2014-02-15 10:33:13.342857	7	\N	f
1440	16	7	2	2014-02-15 10:33:13.347198	2014-02-15 10:33:13.347198	8	\N	f
1441	16	7	0	2014-02-15 10:33:13.351533	2014-02-15 10:33:13.351533	9	\N	f
1442	16	7	0	2014-02-15 10:33:13.355902	2014-02-15 10:33:13.355902	10	\N	f
1443	17	7	0	2014-02-15 10:33:13.363043	2014-02-15 10:33:13.363043	11	\N	f
1444	17	7	0	2014-02-15 10:33:13.367469	2014-02-15 10:33:13.367469	12	\N	f
1445	17	7	2	2014-02-15 10:33:13.371906	2014-02-15 10:33:13.371906	13	\N	f
1446	17	7	0	2014-02-15 10:33:13.376224	2014-02-15 10:33:13.376224	14	\N	f
1447	18	7	0	2014-02-15 10:33:13.383404	2014-02-15 10:33:13.383404	15	\N	f
1448	18	7	2	2014-02-15 10:33:13.387863	2014-02-15 10:33:13.387863	16	\N	f
1449	18	7	0	2014-02-15 10:33:13.392199	2014-02-15 10:33:13.392199	17	\N	f
1450	18	7	0	2014-02-15 10:33:13.396529	2014-02-15 10:33:13.396529	18	\N	f
1451	19	7	0	2014-02-15 10:33:13.403671	2014-02-15 10:33:13.403671	19	\N	f
1452	19	7	2	2014-02-15 10:33:13.408106	2014-02-15 10:33:13.408106	20	\N	f
1453	19	7	0	2014-02-15 10:33:13.412418	2014-02-15 10:33:13.412418	21	\N	f
1454	19	7	0	2014-02-15 10:33:13.416698	2014-02-15 10:33:13.416698	22	\N	f
1455	20	7	0	2014-02-15 10:33:13.423922	2014-02-15 10:33:13.423922	23	\N	f
1456	20	7	0	2014-02-15 10:33:13.428245	2014-02-15 10:33:13.428245	24	\N	f
1457	20	7	2	2014-02-15 10:33:13.432643	2014-02-15 10:33:13.432643	25	\N	f
1458	20	7	0	2014-02-15 10:33:13.436937	2014-02-15 10:33:13.436937	26	\N	f
1459	22	7	0	2014-02-15 10:33:13.444213	2014-02-15 10:33:13.444213	31	\N	f
1460	22	7	0	2014-02-15 10:33:13.448558	2014-02-15 10:33:13.448558	32	\N	f
1461	22	7	2	2014-02-15 10:33:13.452853	2014-02-15 10:33:13.452853	33	\N	f
1462	22	7	0	2014-02-15 10:33:13.457177	2014-02-15 10:33:13.457177	34	\N	f
1463	23	7	0	2014-02-15 10:33:13.464359	2014-02-15 10:33:13.464359	35	\N	f
1464	23	7	0	2014-02-15 10:33:13.468843	2014-02-15 10:33:13.468843	36	\N	f
1465	23	7	2	2014-02-15 10:33:13.473134	2014-02-15 10:33:13.473134	37	\N	f
1466	23	7	0	2014-02-15 10:33:13.477487	2014-02-15 10:33:13.477487	38	\N	f
1467	24	7	2	2014-02-15 10:33:13.484839	2014-02-15 10:33:13.484839	39	\N	f
1468	24	7	0	2014-02-15 10:33:13.48921	2014-02-15 10:33:13.48921	40	\N	f
1469	24	7	0	2014-02-15 10:33:13.49352	2014-02-15 10:33:13.49352	41	\N	f
1470	24	7	0	2014-02-15 10:33:13.497877	2014-02-15 10:33:13.497877	42	\N	f
1471	25	7	0	2014-02-15 10:33:13.505137	2014-02-15 10:33:13.505137	43	\N	f
1472	25	7	2	2014-02-15 10:33:13.509507	2014-02-15 10:33:13.509507	44	\N	f
1473	25	7	0	2014-02-15 10:33:13.513882	2014-02-15 10:33:13.513882	45	\N	f
1474	25	7	0	2014-02-15 10:33:13.518212	2014-02-15 10:33:13.518212	46	\N	f
1475	26	7	0	2014-02-15 10:33:13.5255	2014-02-15 10:33:13.5255	47	\N	f
1476	26	7	0	2014-02-15 10:33:13.529924	2014-02-15 10:33:13.529924	48	\N	f
1477	26	7	2	2014-02-15 10:33:13.534354	2014-02-15 10:33:13.534354	49	\N	f
1478	26	7	0	2014-02-15 10:33:13.538739	2014-02-15 10:33:13.538739	50	\N	f
1479	27	7	0	2014-02-15 10:33:13.546291	2014-02-15 10:33:13.546291	51	\N	f
1480	27	7	0	2014-02-15 10:33:13.595359	2014-02-15 10:33:13.595359	52	\N	f
1481	27	7	0	2014-02-15 10:33:13.59872	2014-02-15 10:33:13.59872	53	\N	f
1482	27	7	2	2014-02-15 10:33:13.603072	2014-02-15 10:33:13.603072	54	\N	f
1483	28	7	0	2014-02-15 10:33:13.610376	2014-02-15 10:33:13.610376	55	\N	f
1484	28	7	0	2014-02-15 10:33:13.614749	2014-02-15 10:33:13.614749	56	\N	f
1485	28	7	0	2014-02-15 10:33:13.618969	2014-02-15 10:33:13.618969	57	\N	f
1486	28	7	2	2014-02-15 10:33:13.623279	2014-02-15 10:33:13.623279	58	\N	f
1487	29	7	0	2014-02-15 10:33:13.630496	2014-02-15 10:33:13.630496	59	\N	f
1488	29	7	0	2014-02-15 10:33:13.634887	2014-02-15 10:33:13.634887	60	\N	f
1489	29	7	0	2014-02-15 10:33:13.639195	2014-02-15 10:33:13.639195	61	\N	f
1490	29	7	2	2014-02-15 10:33:13.643457	2014-02-15 10:33:13.643457	62	\N	f
1491	30	7	0	2014-02-15 10:33:13.650675	2014-02-15 10:33:13.650675	63	\N	f
1492	30	7	0	2014-02-15 10:33:13.655053	2014-02-15 10:33:13.655053	64	\N	f
1493	30	7	2	2014-02-15 10:33:13.659431	2014-02-15 10:33:13.659431	65	\N	f
1494	30	7	0	2014-02-15 10:33:13.66382	2014-02-15 10:33:13.66382	66	\N	f
1495	31	7	0	2014-02-15 10:33:13.671051	2014-02-15 10:33:13.671051	67	\N	f
1496	31	7	0	2014-02-15 10:33:13.675447	2014-02-15 10:33:13.675447	68	\N	f
1497	31	7	0	2014-02-15 10:33:13.679804	2014-02-15 10:33:13.679804	69	\N	f
1498	31	7	2	2014-02-15 10:33:13.683269	2014-02-15 10:33:13.683269	70	\N	f
1499	32	7	0	2014-02-15 10:33:13.689928	2014-02-15 10:33:13.689928	71	\N	f
1500	32	7	2	2014-02-15 10:33:13.694396	2014-02-15 10:33:13.694396	72	\N	f
1501	32	7	0	2014-02-15 10:33:13.698779	2014-02-15 10:33:13.698779	73	\N	f
1502	32	7	0	2014-02-15 10:33:13.703053	2014-02-15 10:33:13.703053	74	\N	f
1503	33	7	0	2014-02-15 10:33:13.710307	2014-02-15 10:33:13.710307	75	\N	f
1504	33	7	0	2014-02-15 10:33:13.714713	2014-02-15 10:33:13.714713	76	\N	f
1505	33	7	2	2014-02-15 10:33:13.719004	2014-02-15 10:33:13.719004	77	\N	f
1506	33	7	0	2014-02-15 10:33:13.723375	2014-02-15 10:33:13.723375	78	\N	f
1507	34	7	0	2014-02-15 10:33:13.73088	2014-02-15 10:33:13.73088	79	\N	f
1508	34	7	0	2014-02-15 10:33:13.73537	2014-02-15 10:33:13.73537	80	\N	f
1509	34	7	2	2014-02-15 10:33:13.739698	2014-02-15 10:33:13.739698	81	\N	f
1510	34	7	0	2014-02-15 10:33:13.744103	2014-02-15 10:33:13.744103	82	\N	f
1511	35	7	0	2014-02-15 10:33:13.751289	2014-02-15 10:33:13.751289	83	\N	f
1512	35	7	0	2014-02-15 10:33:13.755655	2014-02-15 10:33:13.755655	84	\N	f
1513	35	7	2	2014-02-15 10:33:13.760101	2014-02-15 10:33:13.760101	85	\N	f
1514	35	7	0	2014-02-15 10:33:13.764418	2014-02-15 10:33:13.764418	86	\N	f
1515	36	7	0	2014-02-15 10:33:13.771621	2014-02-15 10:33:13.771621	87	\N	f
1516	36	7	0	2014-02-15 10:33:13.776002	2014-02-15 10:33:13.776002	88	\N	f
1517	36	7	0	2014-02-15 10:33:13.780372	2014-02-15 10:33:13.780372	89	\N	f
1518	36	7	2	2014-02-15 10:33:13.784708	2014-02-15 10:33:13.784708	90	\N	f
1519	37	7	0	2014-02-15 10:33:13.791977	2014-02-15 10:33:13.791977	91	\N	f
1520	37	7	0	2014-02-15 10:33:13.796378	2014-02-15 10:33:13.796378	92	\N	f
1521	37	7	2	2014-02-15 10:33:13.800657	2014-02-15 10:33:13.800657	93	\N	f
1522	37	7	0	2014-02-15 10:33:13.804975	2014-02-15 10:33:13.804975	94	\N	f
1523	38	7	0	2014-02-15 10:33:13.812394	2014-02-15 10:33:13.812394	95	\N	f
1524	38	7	2	2014-02-15 10:33:13.816798	2014-02-15 10:33:13.816798	96	\N	f
1525	38	7	0	2014-02-15 10:33:13.821329	2014-02-15 10:33:13.821329	97	\N	f
1526	38	7	0	2014-02-15 10:33:13.825827	2014-02-15 10:33:13.825827	98	\N	f
1527	38	7	0	2014-02-15 10:33:13.830164	2014-02-15 10:33:13.830164	99	\N	f
1528	39	7	0	2014-02-15 10:33:13.837461	2014-02-15 10:33:13.837461	100	\N	f
1529	39	7	0	2014-02-15 10:33:13.841935	2014-02-15 10:33:13.841935	101	\N	f
1530	39	7	0	2014-02-15 10:33:13.846398	2014-02-15 10:33:13.846398	102	\N	f
1531	39	7	2	2014-02-15 10:33:13.850839	2014-02-15 10:33:13.850839	103	\N	f
1532	40	7	0	2014-02-15 10:33:13.858224	2014-02-15 10:33:13.858224	104	\N	f
1533	40	7	0	2014-02-15 10:33:13.862556	2014-02-15 10:33:13.862556	105	\N	f
1534	40	7	2	2014-02-15 10:33:13.86701	2014-02-15 10:33:13.86701	106	\N	f
1535	40	7	0	2014-02-15 10:33:13.871361	2014-02-15 10:33:13.871361	107	\N	f
1536	41	7	0	2014-02-15 10:33:13.878628	2014-02-15 10:33:13.878628	108	\N	f
1537	41	7	0	2014-02-15 10:33:13.883029	2014-02-15 10:33:13.883029	109	\N	f
1538	41	7	2	2014-02-15 10:33:13.887339	2014-02-15 10:33:13.887339	110	\N	f
1539	41	7	0	2014-02-15 10:33:13.89179	2014-02-15 10:33:13.89179	111	\N	f
1540	42	7	0	2014-02-15 10:33:13.898851	2014-02-15 10:33:13.898851	112	\N	f
1541	42	7	0	2014-02-15 10:33:13.903229	2014-02-15 10:33:13.903229	113	\N	f
1542	42	7	2	2014-02-15 10:33:13.907523	2014-02-15 10:33:13.907523	114	\N	f
1543	43	7	2	2014-02-15 10:33:13.914807	2014-02-15 10:33:13.914807	115	\N	f
1544	43	7	0	2014-02-15 10:33:13.919537	2014-02-15 10:33:13.919537	116	\N	f
1545	43	7	0	2014-02-15 10:33:13.924016	2014-02-15 10:33:13.924016	117	\N	f
1546	43	7	0	2014-02-15 10:33:13.928323	2014-02-15 10:33:13.928323	118	\N	f
1547	44	7	0	2014-02-15 10:33:13.935477	2014-02-15 10:33:13.935477	119	\N	f
1548	44	7	2	2014-02-15 10:33:13.939898	2014-02-15 10:33:13.939898	120	\N	f
1549	44	7	0	2014-02-15 10:33:13.944238	2014-02-15 10:33:13.944238	121	\N	f
1550	44	7	0	2014-02-15 10:33:13.948622	2014-02-15 10:33:13.948622	122	\N	f
1551	45	7	2	2014-02-15 10:33:13.955716	2014-02-15 10:33:13.955716	123	\N	f
1552	45	7	0	2014-02-15 10:33:13.960153	2014-02-15 10:33:13.960153	124	\N	f
1553	45	7	0	2014-02-15 10:33:13.96445	2014-02-15 10:33:13.96445	125	\N	f
1554	45	7	0	2014-02-15 10:33:13.968777	2014-02-15 10:33:13.968777	126	\N	f
1555	46	7	2	2014-02-15 10:33:13.975889	2014-02-15 10:33:13.975889	127	\N	f
1556	46	7	0	2014-02-15 10:33:13.980216	2014-02-15 10:33:13.980216	128	\N	f
1557	46	7	0	2014-02-15 10:33:13.984541	2014-02-15 10:33:13.984541	129	\N	f
1558	47	7	0	2014-02-15 10:33:13.991649	2014-02-15 10:33:13.991649	130	\N	f
1559	47	7	2	2014-02-15 10:33:13.996075	2014-02-15 10:33:13.996075	131	\N	f
1560	47	7	0	2014-02-15 10:33:14.000401	2014-02-15 10:33:14.000401	132	\N	f
1561	47	7	0	2014-02-15 10:33:14.004654	2014-02-15 10:33:14.004654	133	\N	f
1562	48	7	0	2014-02-15 10:33:14.01186	2014-02-15 10:33:14.01186	134	\N	f
1563	48	7	0	2014-02-15 10:33:14.016201	2014-02-15 10:33:14.016201	135	\N	f
1564	48	7	2	2014-02-15 10:33:14.020562	2014-02-15 10:33:14.020562	136	\N	f
1565	48	7	0	2014-02-15 10:33:14.024884	2014-02-15 10:33:14.024884	137	\N	f
1566	49	7	0	2014-02-15 10:33:14.032179	2014-02-15 10:33:14.032179	138	\N	f
1567	49	7	2	2014-02-15 10:33:14.036502	2014-02-15 10:33:14.036502	139	\N	f
1568	49	7	0	2014-02-15 10:33:14.040818	2014-02-15 10:33:14.040818	140	\N	f
1569	49	7	0	2014-02-15 10:33:14.04515	2014-02-15 10:33:14.04515	141	\N	f
1570	49	7	0	2014-02-15 10:33:14.049453	2014-02-15 10:33:14.049453	142	\N	f
1571	50	7	0	2014-02-15 10:33:14.056644	2014-02-15 10:33:14.056644	143	\N	f
1572	50	7	0	2014-02-15 10:33:14.060929	2014-02-15 10:33:14.060929	144	\N	f
1573	50	7	2	2014-02-15 10:33:14.065266	2014-02-15 10:33:14.065266	145	\N	f
1574	50	7	0	2014-02-15 10:33:14.069608	2014-02-15 10:33:14.069608	146	\N	f
1575	51	7	0	2014-02-15 10:33:14.076697	2014-02-15 10:33:14.076697	147	\N	f
1576	51	7	2	2014-02-15 10:33:14.081089	2014-02-15 10:33:14.081089	148	\N	f
1577	51	7	0	2014-02-15 10:33:14.085413	2014-02-15 10:33:14.085413	149	\N	f
1578	52	7	0	2014-02-15 10:33:14.092625	2014-02-15 10:33:14.092625	150	\N	f
1579	52	7	0	2014-02-15 10:33:14.096994	2014-02-15 10:33:14.096994	151	\N	f
1580	52	7	2	2014-02-15 10:33:14.101347	2014-02-15 10:33:14.101347	152	\N	f
1581	52	7	0	2014-02-15 10:33:14.105642	2014-02-15 10:33:14.105642	153	\N	f
1582	53	7	0	2014-02-15 10:33:14.112955	2014-02-15 10:33:14.112955	154	\N	f
1583	53	7	0	2014-02-15 10:33:14.117367	2014-02-15 10:33:14.117367	155	\N	f
1584	53	7	0	2014-02-15 10:33:14.121723	2014-02-15 10:33:14.121723	156	\N	f
1585	53	7	0	2014-02-15 10:33:14.126044	2014-02-15 10:33:14.126044	157	\N	f
1586	53	7	2	2014-02-15 10:33:14.130398	2014-02-15 10:33:14.130398	158	\N	f
1587	54	7	2	2014-02-15 10:33:14.137699	2014-02-15 10:33:14.137699	159	\N	f
1588	54	7	0	2014-02-15 10:33:14.142118	2014-02-15 10:33:14.142118	160	\N	f
1589	54	7	0	2014-02-15 10:33:14.146539	2014-02-15 10:33:14.146539	161	\N	f
1590	54	7	0	2014-02-15 10:33:14.15087	2014-02-15 10:33:14.15087	162	\N	f
1591	55	7	0	2014-02-15 10:33:14.158186	2014-02-15 10:33:14.158186	163	\N	f
1592	55	7	0	2014-02-15 10:33:14.162742	2014-02-15 10:33:14.162742	164	\N	f
1593	55	7	2	2014-02-15 10:33:14.168194	2014-02-15 10:33:14.168194	165	\N	f
1594	55	7	0	2014-02-15 10:33:14.214508	2014-02-15 10:33:14.214508	166	\N	f
1595	56	7	0	2014-02-15 10:33:14.22055	2014-02-15 10:33:14.22055	167	\N	f
1596	56	7	0	2014-02-15 10:33:14.222765	2014-02-15 10:33:14.222765	168	\N	f
1597	56	7	2	2014-02-15 10:33:14.224993	2014-02-15 10:33:14.224993	169	\N	f
1598	56	7	0	2014-02-15 10:33:14.227171	2014-02-15 10:33:14.227171	170	\N	f
1599	57	7	2	2014-02-15 10:33:14.231957	2014-02-15 10:33:14.231957	171	\N	f
1600	57	7	0	2014-02-15 10:33:14.234827	2014-02-15 10:33:14.234827	172	\N	f
1601	57	7	0	2014-02-15 10:33:14.237656	2014-02-15 10:33:14.237656	173	\N	f
1602	57	7	0	2014-02-15 10:33:14.240524	2014-02-15 10:33:14.240524	174	\N	f
1603	58	7	0	2014-02-15 10:33:14.245522	2014-02-15 10:33:14.245522	175	\N	f
1604	58	7	2	2014-02-15 10:33:14.248433	2014-02-15 10:33:14.248433	176	\N	f
1605	58	7	0	2014-02-15 10:33:14.251245	2014-02-15 10:33:14.251245	177	\N	f
1606	58	7	0	2014-02-15 10:33:14.254093	2014-02-15 10:33:14.254093	178	\N	f
1607	59	7	0	2014-02-15 10:33:14.259304	2014-02-15 10:33:14.259304	179	\N	f
1608	59	7	0	2014-02-15 10:33:14.26224	2014-02-15 10:33:14.26224	180	\N	f
1609	59	7	2	2014-02-15 10:33:14.2651	2014-02-15 10:33:14.2651	181	\N	f
1610	59	7	0	2014-02-15 10:33:14.267936	2014-02-15 10:33:14.267936	182	\N	f
1611	59	7	0	2014-02-15 10:33:14.270748	2014-02-15 10:33:14.270748	183	\N	f
1612	60	7	0	2014-02-15 10:33:14.275804	2014-02-15 10:33:14.275804	184	\N	f
1613	60	7	2	2014-02-15 10:33:14.278651	2014-02-15 10:33:14.278651	185	\N	f
1614	60	7	0	2014-02-15 10:33:14.281494	2014-02-15 10:33:14.281494	186	\N	f
1615	60	7	0	2014-02-15 10:33:14.284366	2014-02-15 10:33:14.284366	187	\N	f
1616	60	7	0	2014-02-15 10:33:14.287197	2014-02-15 10:33:14.287197	188	\N	f
1617	61	7	2	2014-02-15 10:33:14.292253	2014-02-15 10:33:14.292253	189	\N	f
1618	61	7	0	2014-02-15 10:33:14.295101	2014-02-15 10:33:14.295101	190	\N	f
1619	61	7	0	2014-02-15 10:33:14.298011	2014-02-15 10:33:14.298011	191	\N	f
1620	61	7	0	2014-02-15 10:33:14.300828	2014-02-15 10:33:14.300828	192	\N	f
1621	61	7	0	2014-02-15 10:33:14.303635	2014-02-15 10:33:14.303635	193	\N	f
1622	62	7	0	2014-02-15 10:33:14.308613	2014-02-15 10:33:14.308613	194	\N	f
1623	62	7	2	2014-02-15 10:33:14.311469	2014-02-15 10:33:14.311469	195	\N	f
1624	62	7	0	2014-02-15 10:33:14.314357	2014-02-15 10:33:14.314357	196	\N	f
1625	63	7	0	2014-02-15 10:33:14.319184	2014-02-15 10:33:14.319184	197	\N	f
1626	63	7	2	2014-02-15 10:33:14.322057	2014-02-15 10:33:14.322057	198	\N	f
1627	64	7	2	2014-02-15 10:33:14.327033	2014-02-15 10:33:14.327033	199	\N	f
1628	64	7	0	2014-02-15 10:33:14.329889	2014-02-15 10:33:14.329889	200	\N	f
1629	64	7	0	2014-02-15 10:33:14.332775	2014-02-15 10:33:14.332775	201	\N	f
1630	65	7	0	2014-02-15 10:33:14.337754	2014-02-15 10:33:14.337754	202	\N	f
1631	65	7	0	2014-02-15 10:33:14.340639	2014-02-15 10:33:14.340639	203	\N	f
1632	65	7	2	2014-02-15 10:33:14.343422	2014-02-15 10:33:14.343422	204	\N	f
1633	65	7	0	2014-02-15 10:33:14.346318	2014-02-15 10:33:14.346318	205	\N	f
1634	66	7	0	2014-02-15 10:33:14.351303	2014-02-15 10:33:14.351303	206	\N	f
1635	66	7	0	2014-02-15 10:33:14.354204	2014-02-15 10:33:14.354204	207	\N	f
1636	66	7	2	2014-02-15 10:33:14.357044	2014-02-15 10:33:14.357044	208	\N	f
1637	66	7	0	2014-02-15 10:33:14.359909	2014-02-15 10:33:14.359909	209	\N	f
1638	68	7	0	2014-02-15 10:33:14.364716	2014-02-15 10:33:14.364716	214	\N	f
1639	68	7	2	2014-02-15 10:33:14.367578	2014-02-15 10:33:14.367578	215	\N	f
1640	69	7	0	2014-02-15 10:33:14.372594	2014-02-15 10:33:14.372594	216	\N	f
1641	69	7	0	2014-02-15 10:33:14.375419	2014-02-15 10:33:14.375419	217	\N	f
1642	69	7	2	2014-02-15 10:33:14.378252	2014-02-15 10:33:14.378252	218	\N	f
1643	69	7	0	2014-02-15 10:33:14.381126	2014-02-15 10:33:14.381126	219	\N	f
1644	70	7	0	2014-02-15 10:33:14.386018	2014-02-15 10:33:14.386018	220	\N	f
1645	70	7	0	2014-02-15 10:33:14.388882	2014-02-15 10:33:14.388882	221	\N	f
1646	70	7	2	2014-02-15 10:33:14.391677	2014-02-15 10:33:14.391677	222	\N	f
1647	71	7	0	2014-02-15 10:33:14.396666	2014-02-15 10:33:14.396666	223	\N	f
1648	71	7	0	2014-02-15 10:33:14.399506	2014-02-15 10:33:14.399506	224	\N	f
1649	71	7	2	2014-02-15 10:33:14.402336	2014-02-15 10:33:14.402336	225	\N	f
1650	72	7	0	2014-02-15 10:33:14.407256	2014-02-15 10:33:14.407256	226	\N	f
1651	72	7	0	2014-02-15 10:33:14.410181	2014-02-15 10:33:14.410181	227	\N	f
1652	72	7	2	2014-02-15 10:33:14.413006	2014-02-15 10:33:14.413006	228	\N	f
1653	73	7	2	2014-02-15 10:33:14.417932	2014-02-15 10:33:14.417932	229	\N	f
1654	73	7	0	2014-02-15 10:33:14.420778	2014-02-15 10:33:14.420778	230	\N	f
1655	73	7	0	2014-02-15 10:33:14.423592	2014-02-15 10:33:14.423592	231	\N	f
1656	74	7	0	2014-02-15 10:33:14.428574	2014-02-15 10:33:14.428574	232	\N	f
1657	74	7	2	2014-02-15 10:33:14.431477	2014-02-15 10:33:14.431477	233	\N	f
1658	74	7	0	2014-02-15 10:33:14.434329	2014-02-15 10:33:14.434329	234	\N	f
1659	75	7	0	2014-02-15 10:33:14.439259	2014-02-15 10:33:14.439259	235	\N	f
1660	75	7	0	2014-02-15 10:33:14.442172	2014-02-15 10:33:14.442172	236	\N	f
1661	75	7	2	2014-02-15 10:33:14.445075	2014-02-15 10:33:14.445075	237	\N	f
1662	76	7	0	2014-02-15 10:33:14.450026	2014-02-15 10:33:14.450026	238	\N	f
1663	76	7	2	2014-02-15 10:33:14.452916	2014-02-15 10:33:14.452916	239	\N	f
1664	76	7	0	2014-02-15 10:33:14.455762	2014-02-15 10:33:14.455762	240	\N	f
1665	76	7	0	2014-02-15 10:33:14.4586	2014-02-15 10:33:14.4586	241	\N	f
1666	21	7	0	2014-02-15 10:33:14.463507	2014-02-15 10:33:14.463507	27	\N	f
1667	21	7	2	2014-02-15 10:33:14.46642	2014-02-15 10:33:14.46642	28	\N	f
1668	21	7	0	2014-02-15 10:33:14.469317	2014-02-15 10:33:14.469317	29	\N	f
1669	21	7	0	2014-02-15 10:33:14.47216	2014-02-15 10:33:14.47216	30	\N	f
1670	67	7	0	2014-02-15 10:33:14.477096	2014-02-15 10:33:14.477096	210	\N	f
1671	67	7	0	2014-02-15 10:33:14.480011	2014-02-15 10:33:14.480011	211	\N	f
1672	67	7	0	2014-02-15 10:33:14.482837	2014-02-15 10:33:14.482837	212	\N	f
1673	67	7	2	2014-02-15 10:33:14.485678	2014-02-15 10:33:14.485678	213	\N	f
1674	15	8	0	2014-02-15 10:33:14.50469	2014-02-15 10:33:14.50469	3	\N	f
1675	15	8	0	2014-02-15 10:33:14.507558	2014-02-15 10:33:14.507558	4	\N	f
1676	15	8	0	2014-02-15 10:33:14.510456	2014-02-15 10:33:14.510456	5	\N	f
1677	15	8	2	2014-02-15 10:33:14.513314	2014-02-15 10:33:14.513314	6	\N	f
1678	16	8	0	2014-02-15 10:33:14.51831	2014-02-15 10:33:14.51831	7	\N	f
1679	16	8	2	2014-02-15 10:33:14.521175	2014-02-15 10:33:14.521175	8	\N	f
1680	16	8	0	2014-02-15 10:33:14.524071	2014-02-15 10:33:14.524071	9	\N	f
1681	16	8	0	2014-02-15 10:33:14.526896	2014-02-15 10:33:14.526896	10	\N	f
1682	17	8	0	2014-02-15 10:33:14.531853	2014-02-15 10:33:14.531853	11	\N	f
1683	17	8	0	2014-02-15 10:33:14.534754	2014-02-15 10:33:14.534754	12	\N	f
1684	17	8	2	2014-02-15 10:33:14.537649	2014-02-15 10:33:14.537649	13	\N	f
1685	17	8	0	2014-02-15 10:33:14.54052	2014-02-15 10:33:14.54052	14	\N	f
1686	18	8	0	2014-02-15 10:33:14.545492	2014-02-15 10:33:14.545492	15	\N	f
1687	18	8	2	2014-02-15 10:33:14.548422	2014-02-15 10:33:14.548422	16	\N	f
1688	18	8	0	2014-02-15 10:33:14.55127	2014-02-15 10:33:14.55127	17	\N	f
1689	18	8	0	2014-02-15 10:33:14.554157	2014-02-15 10:33:14.554157	18	\N	f
1690	19	8	0	2014-02-15 10:33:14.559136	2014-02-15 10:33:14.559136	19	\N	f
1691	19	8	2	2014-02-15 10:33:14.562157	2014-02-15 10:33:14.562157	20	\N	f
1692	19	8	0	2014-02-15 10:33:14.565081	2014-02-15 10:33:14.565081	21	\N	f
1693	19	8	0	2014-02-15 10:33:14.567974	2014-02-15 10:33:14.567974	22	\N	f
1694	20	8	0	2014-02-15 10:33:14.574985	2014-02-15 10:33:14.574985	23	\N	f
1695	20	8	0	2014-02-15 10:33:14.622547	2014-02-15 10:33:14.622547	24	\N	f
1696	20	8	2	2014-02-15 10:33:14.6254	2014-02-15 10:33:14.6254	25	\N	f
1697	20	8	0	2014-02-15 10:33:14.628691	2014-02-15 10:33:14.628691	26	\N	f
1698	22	8	0	2014-02-15 10:33:14.635971	2014-02-15 10:33:14.635971	31	\N	f
1699	22	8	0	2014-02-15 10:33:14.640341	2014-02-15 10:33:14.640341	32	\N	f
1700	22	8	2	2014-02-15 10:33:14.644713	2014-02-15 10:33:14.644713	33	\N	f
1701	22	8	0	2014-02-15 10:33:14.649061	2014-02-15 10:33:14.649061	34	\N	f
1702	23	8	0	2014-02-15 10:33:14.656262	2014-02-15 10:33:14.656262	35	\N	f
1703	23	8	0	2014-02-15 10:33:14.660669	2014-02-15 10:33:14.660669	36	\N	f
1704	23	8	2	2014-02-15 10:33:14.665	2014-02-15 10:33:14.665	37	\N	f
1705	23	8	0	2014-02-15 10:33:14.669375	2014-02-15 10:33:14.669375	38	\N	f
1706	24	8	2	2014-02-15 10:33:14.676634	2014-02-15 10:33:14.676634	39	\N	f
1707	24	8	0	2014-02-15 10:33:14.681061	2014-02-15 10:33:14.681061	40	\N	f
1708	24	8	0	2014-02-15 10:33:14.685433	2014-02-15 10:33:14.685433	41	\N	f
1709	24	8	0	2014-02-15 10:33:14.689768	2014-02-15 10:33:14.689768	42	\N	f
1710	25	8	0	2014-02-15 10:33:14.69702	2014-02-15 10:33:14.69702	43	\N	f
1711	25	8	2	2014-02-15 10:33:14.701379	2014-02-15 10:33:14.701379	44	\N	f
1712	25	8	0	2014-02-15 10:33:14.705748	2014-02-15 10:33:14.705748	45	\N	f
1713	25	8	0	2014-02-15 10:33:14.710063	2014-02-15 10:33:14.710063	46	\N	f
1714	26	8	0	2014-02-15 10:33:14.717525	2014-02-15 10:33:14.717525	47	\N	f
1715	26	8	0	2014-02-15 10:33:14.721904	2014-02-15 10:33:14.721904	48	\N	f
1716	26	8	2	2014-02-15 10:33:14.726237	2014-02-15 10:33:14.726237	49	\N	f
1717	26	8	0	2014-02-15 10:33:14.730602	2014-02-15 10:33:14.730602	50	\N	f
1718	27	8	0	2014-02-15 10:33:14.737899	2014-02-15 10:33:14.737899	51	\N	f
1719	27	8	0	2014-02-15 10:33:14.742291	2014-02-15 10:33:14.742291	52	\N	f
1720	27	8	0	2014-02-15 10:33:14.746644	2014-02-15 10:33:14.746644	53	\N	f
1721	27	8	2	2014-02-15 10:33:14.750956	2014-02-15 10:33:14.750956	54	\N	f
1722	28	8	0	2014-02-15 10:33:14.758263	2014-02-15 10:33:14.758263	55	\N	f
1723	28	8	0	2014-02-15 10:33:14.762592	2014-02-15 10:33:14.762592	56	\N	f
1724	28	8	0	2014-02-15 10:33:14.766901	2014-02-15 10:33:14.766901	57	\N	f
1725	28	8	2	2014-02-15 10:33:14.77126	2014-02-15 10:33:14.77126	58	\N	f
1726	29	8	0	2014-02-15 10:33:14.778462	2014-02-15 10:33:14.778462	59	\N	f
1727	29	8	0	2014-02-15 10:33:14.782894	2014-02-15 10:33:14.782894	60	\N	f
1728	29	8	0	2014-02-15 10:33:14.78721	2014-02-15 10:33:14.78721	61	\N	f
1729	29	8	2	2014-02-15 10:33:14.791558	2014-02-15 10:33:14.791558	62	\N	f
1730	30	8	0	2014-02-15 10:33:14.798793	2014-02-15 10:33:14.798793	63	\N	f
1731	30	8	0	2014-02-15 10:33:14.803279	2014-02-15 10:33:14.803279	64	\N	f
1732	30	8	2	2014-02-15 10:33:14.807624	2014-02-15 10:33:14.807624	65	\N	f
1733	30	8	0	2014-02-15 10:33:14.812008	2014-02-15 10:33:14.812008	66	\N	f
1734	31	8	0	2014-02-15 10:33:14.819187	2014-02-15 10:33:14.819187	67	\N	f
1735	31	8	0	2014-02-15 10:33:14.823525	2014-02-15 10:33:14.823525	68	\N	f
1736	31	8	0	2014-02-15 10:33:14.827961	2014-02-15 10:33:14.827961	69	\N	f
1737	31	8	2	2014-02-15 10:33:14.832264	2014-02-15 10:33:14.832264	70	\N	f
1738	32	8	0	2014-02-15 10:33:14.839469	2014-02-15 10:33:14.839469	71	\N	f
1739	32	8	2	2014-02-15 10:33:14.843868	2014-02-15 10:33:14.843868	72	\N	f
1740	32	8	0	2014-02-15 10:33:14.848294	2014-02-15 10:33:14.848294	73	\N	f
1741	32	8	0	2014-02-15 10:33:14.852636	2014-02-15 10:33:14.852636	74	\N	f
1742	33	8	0	2014-02-15 10:33:14.859875	2014-02-15 10:33:14.859875	75	\N	f
1743	33	8	0	2014-02-15 10:33:14.864234	2014-02-15 10:33:14.864234	76	\N	f
1744	33	8	2	2014-02-15 10:33:14.868624	2014-02-15 10:33:14.868624	77	\N	f
1745	33	8	0	2014-02-15 10:33:14.872953	2014-02-15 10:33:14.872953	78	\N	f
1746	34	8	0	2014-02-15 10:33:14.880157	2014-02-15 10:33:14.880157	79	\N	f
1747	34	8	0	2014-02-15 10:33:14.88461	2014-02-15 10:33:14.88461	80	\N	f
1748	34	8	2	2014-02-15 10:33:14.888893	2014-02-15 10:33:14.888893	81	\N	f
1749	34	8	0	2014-02-15 10:33:14.893227	2014-02-15 10:33:14.893227	82	\N	f
1750	35	8	0	2014-02-15 10:33:14.900463	2014-02-15 10:33:14.900463	83	\N	f
1751	35	8	0	2014-02-15 10:33:14.904811	2014-02-15 10:33:14.904811	84	\N	f
1752	35	8	2	2014-02-15 10:33:14.909158	2014-02-15 10:33:14.909158	85	\N	f
1753	35	8	0	2014-02-15 10:33:14.913535	2014-02-15 10:33:14.913535	86	\N	f
1754	36	8	0	2014-02-15 10:33:14.920772	2014-02-15 10:33:14.920772	87	\N	f
1755	36	8	0	2014-02-15 10:33:14.925153	2014-02-15 10:33:14.925153	88	\N	f
1756	36	8	0	2014-02-15 10:33:14.929494	2014-02-15 10:33:14.929494	89	\N	f
1757	36	8	2	2014-02-15 10:33:14.933917	2014-02-15 10:33:14.933917	90	\N	f
1758	37	8	0	2014-02-15 10:33:14.941552	2014-02-15 10:33:14.941552	91	\N	f
1759	37	8	0	2014-02-15 10:33:14.945937	2014-02-15 10:33:14.945937	92	\N	f
1760	37	8	2	2014-02-15 10:33:14.950304	2014-02-15 10:33:14.950304	93	\N	f
1761	37	8	0	2014-02-15 10:33:14.954625	2014-02-15 10:33:14.954625	94	\N	f
1762	38	8	0	2014-02-15 10:33:14.961987	2014-02-15 10:33:14.961987	95	\N	f
1763	38	8	2	2014-02-15 10:33:14.966349	2014-02-15 10:33:14.966349	96	\N	f
1764	38	8	0	2014-02-15 10:33:14.97069	2014-02-15 10:33:14.97069	97	\N	f
1765	38	8	0	2014-02-15 10:33:14.97497	2014-02-15 10:33:14.97497	98	\N	f
1766	38	8	0	2014-02-15 10:33:14.979285	2014-02-15 10:33:14.979285	99	\N	f
1767	39	8	0	2014-02-15 10:33:14.986545	2014-02-15 10:33:14.986545	100	\N	f
1768	39	8	0	2014-02-15 10:33:14.990873	2014-02-15 10:33:14.990873	101	\N	f
1769	39	8	0	2014-02-15 10:33:14.995214	2014-02-15 10:33:14.995214	102	\N	f
1770	39	8	2	2014-02-15 10:33:14.999531	2014-02-15 10:33:14.999531	103	\N	f
1771	40	8	0	2014-02-15 10:33:15.007274	2014-02-15 10:33:15.007274	104	\N	f
1772	40	8	0	2014-02-15 10:33:15.011925	2014-02-15 10:33:15.011925	105	\N	f
1773	40	8	2	2014-02-15 10:33:15.016498	2014-02-15 10:33:15.016498	106	\N	f
1774	40	8	0	2014-02-15 10:33:15.0199	2014-02-15 10:33:15.0199	107	\N	f
1775	41	8	0	2014-02-15 10:33:15.023926	2014-02-15 10:33:15.023926	108	\N	f
1776	41	8	0	2014-02-15 10:33:15.026143	2014-02-15 10:33:15.026143	109	\N	f
1777	41	8	2	2014-02-15 10:33:15.028418	2014-02-15 10:33:15.028418	110	\N	f
1778	41	8	0	2014-02-15 10:33:15.030616	2014-02-15 10:33:15.030616	111	\N	f
1779	42	8	0	2014-02-15 10:33:15.034569	2014-02-15 10:33:15.034569	112	\N	f
1780	42	8	0	2014-02-15 10:33:15.036832	2014-02-15 10:33:15.036832	113	\N	f
1781	42	8	2	2014-02-15 10:33:15.039021	2014-02-15 10:33:15.039021	114	\N	f
1782	43	8	2	2014-02-15 10:33:15.043129	2014-02-15 10:33:15.043129	115	\N	f
1783	43	8	0	2014-02-15 10:33:15.045396	2014-02-15 10:33:15.045396	116	\N	f
1784	43	8	0	2014-02-15 10:33:15.047571	2014-02-15 10:33:15.047571	117	\N	f
1785	43	8	0	2014-02-15 10:33:15.049774	2014-02-15 10:33:15.049774	118	\N	f
1786	44	8	0	2014-02-15 10:33:15.053794	2014-02-15 10:33:15.053794	119	\N	f
1787	44	8	2	2014-02-15 10:33:15.056043	2014-02-15 10:33:15.056043	120	\N	f
1788	44	8	0	2014-02-15 10:33:15.058242	2014-02-15 10:33:15.058242	121	\N	f
1789	44	8	0	2014-02-15 10:33:15.060487	2014-02-15 10:33:15.060487	122	\N	f
1790	45	8	2	2014-02-15 10:33:15.064629	2014-02-15 10:33:15.064629	123	\N	f
1791	45	8	0	2014-02-15 10:33:15.067199	2014-02-15 10:33:15.067199	124	\N	f
1792	45	8	0	2014-02-15 10:33:15.069806	2014-02-15 10:33:15.069806	125	\N	f
1793	45	8	0	2014-02-15 10:33:15.073408	2014-02-15 10:33:15.073408	126	\N	f
1794	46	8	2	2014-02-15 10:33:15.080722	2014-02-15 10:33:15.080722	127	\N	f
1795	46	8	0	2014-02-15 10:33:15.085193	2014-02-15 10:33:15.085193	128	\N	f
1796	46	8	0	2014-02-15 10:33:15.089671	2014-02-15 10:33:15.089671	129	\N	f
1797	47	8	0	2014-02-15 10:33:15.097119	2014-02-15 10:33:15.097119	130	\N	f
1798	47	8	2	2014-02-15 10:33:15.101612	2014-02-15 10:33:15.101612	131	\N	f
1799	47	8	0	2014-02-15 10:33:15.106295	2014-02-15 10:33:15.106295	132	\N	f
1800	47	8	0	2014-02-15 10:33:15.154026	2014-02-15 10:33:15.154026	133	\N	f
1801	48	8	0	2014-02-15 10:33:15.158014	2014-02-15 10:33:15.158014	134	\N	f
1802	48	8	0	2014-02-15 10:33:15.160379	2014-02-15 10:33:15.160379	135	\N	f
1803	48	8	2	2014-02-15 10:33:15.162989	2014-02-15 10:33:15.162989	136	\N	f
1804	48	8	0	2014-02-15 10:33:15.165567	2014-02-15 10:33:15.165567	137	\N	f
1805	49	8	0	2014-02-15 10:33:15.170174	2014-02-15 10:33:15.170174	138	\N	f
1806	49	8	2	2014-02-15 10:33:15.173796	2014-02-15 10:33:15.173796	139	\N	f
1807	49	8	0	2014-02-15 10:33:15.178002	2014-02-15 10:33:15.178002	140	\N	f
1808	49	8	0	2014-02-15 10:33:15.182188	2014-02-15 10:33:15.182188	141	\N	f
1809	49	8	0	2014-02-15 10:33:15.186417	2014-02-15 10:33:15.186417	142	\N	f
1810	50	8	0	2014-02-15 10:33:15.193315	2014-02-15 10:33:15.193315	143	\N	f
1811	50	8	0	2014-02-15 10:33:15.197543	2014-02-15 10:33:15.197543	144	\N	f
1812	50	8	2	2014-02-15 10:33:15.201705	2014-02-15 10:33:15.201705	145	\N	f
1813	50	8	0	2014-02-15 10:33:15.205997	2014-02-15 10:33:15.205997	146	\N	f
1814	51	8	0	2014-02-15 10:33:15.213069	2014-02-15 10:33:15.213069	147	\N	f
1815	51	8	2	2014-02-15 10:33:15.217488	2014-02-15 10:33:15.217488	148	\N	f
1816	51	8	0	2014-02-15 10:33:15.221824	2014-02-15 10:33:15.221824	149	\N	f
1817	52	8	0	2014-02-15 10:33:15.22903	2014-02-15 10:33:15.22903	150	\N	f
1818	52	8	0	2014-02-15 10:33:15.233445	2014-02-15 10:33:15.233445	151	\N	f
1819	52	8	2	2014-02-15 10:33:15.237745	2014-02-15 10:33:15.237745	152	\N	f
1820	52	8	0	2014-02-15 10:33:15.242017	2014-02-15 10:33:15.242017	153	\N	f
1821	53	8	0	2014-02-15 10:33:15.249556	2014-02-15 10:33:15.249556	154	\N	f
1822	53	8	0	2014-02-15 10:33:15.25389	2014-02-15 10:33:15.25389	155	\N	f
1823	53	8	0	2014-02-15 10:33:15.258211	2014-02-15 10:33:15.258211	156	\N	f
1824	53	8	0	2014-02-15 10:33:15.262521	2014-02-15 10:33:15.262521	157	\N	f
1825	53	8	2	2014-02-15 10:33:15.266808	2014-02-15 10:33:15.266808	158	\N	f
1826	54	8	2	2014-02-15 10:33:15.27416	2014-02-15 10:33:15.27416	159	\N	f
1827	54	8	0	2014-02-15 10:33:15.278539	2014-02-15 10:33:15.278539	160	\N	f
1828	54	8	0	2014-02-15 10:33:15.282879	2014-02-15 10:33:15.282879	161	\N	f
1829	54	8	0	2014-02-15 10:33:15.287195	2014-02-15 10:33:15.287195	162	\N	f
1830	55	8	0	2014-02-15 10:33:15.294419	2014-02-15 10:33:15.294419	163	\N	f
1831	55	8	0	2014-02-15 10:33:15.298808	2014-02-15 10:33:15.298808	164	\N	f
1832	55	8	2	2014-02-15 10:33:15.303115	2014-02-15 10:33:15.303115	165	\N	f
1833	55	8	0	2014-02-15 10:33:15.307535	2014-02-15 10:33:15.307535	166	\N	f
1834	56	8	0	2014-02-15 10:33:15.314731	2014-02-15 10:33:15.314731	167	\N	f
1835	56	8	0	2014-02-15 10:33:15.319122	2014-02-15 10:33:15.319122	168	\N	f
1836	56	8	2	2014-02-15 10:33:15.323457	2014-02-15 10:33:15.323457	169	\N	f
1837	56	8	0	2014-02-15 10:33:15.327846	2014-02-15 10:33:15.327846	170	\N	f
1838	57	8	2	2014-02-15 10:33:15.33506	2014-02-15 10:33:15.33506	171	\N	f
1839	57	8	0	2014-02-15 10:33:15.339483	2014-02-15 10:33:15.339483	172	\N	f
1840	57	8	0	2014-02-15 10:33:15.343887	2014-02-15 10:33:15.343887	173	\N	f
1841	57	8	0	2014-02-15 10:33:15.348236	2014-02-15 10:33:15.348236	174	\N	f
1842	58	8	0	2014-02-15 10:33:15.355486	2014-02-15 10:33:15.355486	175	\N	f
1843	58	8	2	2014-02-15 10:33:15.35989	2014-02-15 10:33:15.35989	176	\N	f
1844	58	8	0	2014-02-15 10:33:15.364274	2014-02-15 10:33:15.364274	177	\N	f
1845	58	8	0	2014-02-15 10:33:15.368591	2014-02-15 10:33:15.368591	178	\N	f
1846	59	8	0	2014-02-15 10:33:15.375992	2014-02-15 10:33:15.375992	179	\N	f
1847	59	8	0	2014-02-15 10:33:15.380348	2014-02-15 10:33:15.380348	180	\N	f
1848	59	8	2	2014-02-15 10:33:15.384671	2014-02-15 10:33:15.384671	181	\N	f
1849	59	8	0	2014-02-15 10:33:15.389068	2014-02-15 10:33:15.389068	182	\N	f
1850	59	8	0	2014-02-15 10:33:15.393379	2014-02-15 10:33:15.393379	183	\N	f
1851	60	8	0	2014-02-15 10:33:15.400719	2014-02-15 10:33:15.400719	184	\N	f
1852	60	8	2	2014-02-15 10:33:15.405063	2014-02-15 10:33:15.405063	185	\N	f
1853	60	8	0	2014-02-15 10:33:15.409402	2014-02-15 10:33:15.409402	186	\N	f
1854	60	8	0	2014-02-15 10:33:15.413698	2014-02-15 10:33:15.413698	187	\N	f
1855	60	8	0	2014-02-15 10:33:15.417963	2014-02-15 10:33:15.417963	188	\N	f
1856	61	8	2	2014-02-15 10:33:15.425343	2014-02-15 10:33:15.425343	189	\N	f
1857	61	8	0	2014-02-15 10:33:15.42979	2014-02-15 10:33:15.42979	190	\N	f
1858	61	8	0	2014-02-15 10:33:15.434083	2014-02-15 10:33:15.434083	191	\N	f
1859	61	8	0	2014-02-15 10:33:15.43841	2014-02-15 10:33:15.43841	192	\N	f
1860	61	8	0	2014-02-15 10:33:15.442732	2014-02-15 10:33:15.442732	193	\N	f
1861	62	8	0	2014-02-15 10:33:15.449928	2014-02-15 10:33:15.449928	194	\N	f
1862	62	8	2	2014-02-15 10:33:15.454332	2014-02-15 10:33:15.454332	195	\N	f
1863	62	8	0	2014-02-15 10:33:15.458682	2014-02-15 10:33:15.458682	196	\N	f
1864	63	8	0	2014-02-15 10:33:15.465928	2014-02-15 10:33:15.465928	197	\N	f
1865	63	8	2	2014-02-15 10:33:15.470315	2014-02-15 10:33:15.470315	198	\N	f
1866	64	8	2	2014-02-15 10:33:15.477472	2014-02-15 10:33:15.477472	199	\N	f
1867	64	8	0	2014-02-15 10:33:15.481854	2014-02-15 10:33:15.481854	200	\N	f
1868	64	8	0	2014-02-15 10:33:15.486155	2014-02-15 10:33:15.486155	201	\N	f
1869	65	8	0	2014-02-15 10:33:15.493623	2014-02-15 10:33:15.493623	202	\N	f
1870	65	8	0	2014-02-15 10:33:15.497974	2014-02-15 10:33:15.497974	203	\N	f
1871	65	8	2	2014-02-15 10:33:15.502297	2014-02-15 10:33:15.502297	204	\N	f
1872	65	8	0	2014-02-15 10:33:15.506611	2014-02-15 10:33:15.506611	205	\N	f
1873	66	8	0	2014-02-15 10:33:15.514077	2014-02-15 10:33:15.514077	206	\N	f
1874	66	8	0	2014-02-15 10:33:15.518495	2014-02-15 10:33:15.518495	207	\N	f
1875	66	8	2	2014-02-15 10:33:15.52294	2014-02-15 10:33:15.52294	208	\N	f
1876	66	8	0	2014-02-15 10:33:15.527274	2014-02-15 10:33:15.527274	209	\N	f
1877	68	8	0	2014-02-15 10:33:15.534267	2014-02-15 10:33:15.534267	214	\N	f
1878	68	8	2	2014-02-15 10:33:15.538783	2014-02-15 10:33:15.538783	215	\N	f
1879	69	8	0	2014-02-15 10:33:15.54613	2014-02-15 10:33:15.54613	216	\N	f
1880	69	8	0	2014-02-15 10:33:15.550567	2014-02-15 10:33:15.550567	217	\N	f
1881	69	8	2	2014-02-15 10:33:15.554896	2014-02-15 10:33:15.554896	218	\N	f
1882	69	8	0	2014-02-15 10:33:15.559326	2014-02-15 10:33:15.559326	219	\N	f
1883	70	8	0	2014-02-15 10:33:15.566491	2014-02-15 10:33:15.566491	220	\N	f
1884	70	8	0	2014-02-15 10:33:15.570942	2014-02-15 10:33:15.570942	221	\N	f
1885	70	8	2	2014-02-15 10:33:15.575295	2014-02-15 10:33:15.575295	222	\N	f
1886	71	8	0	2014-02-15 10:33:15.582448	2014-02-15 10:33:15.582448	223	\N	f
1887	71	8	0	2014-02-15 10:33:15.586871	2014-02-15 10:33:15.586871	224	\N	f
1888	71	8	2	2014-02-15 10:33:15.591147	2014-02-15 10:33:15.591147	225	\N	f
1889	72	8	0	2014-02-15 10:33:15.598297	2014-02-15 10:33:15.598297	226	\N	f
1890	72	8	0	2014-02-15 10:33:15.602645	2014-02-15 10:33:15.602645	227	\N	f
1891	72	8	2	2014-02-15 10:33:15.607063	2014-02-15 10:33:15.607063	228	\N	f
1892	73	8	2	2014-02-15 10:33:15.614213	2014-02-15 10:33:15.614213	229	\N	f
1893	73	8	0	2014-02-15 10:33:15.618629	2014-02-15 10:33:15.618629	230	\N	f
1894	73	8	0	2014-02-15 10:33:15.622966	2014-02-15 10:33:15.622966	231	\N	f
1895	74	8	0	2014-02-15 10:33:15.630073	2014-02-15 10:33:15.630073	232	\N	f
1896	74	8	2	2014-02-15 10:33:15.634548	2014-02-15 10:33:15.634548	233	\N	f
1897	74	8	0	2014-02-15 10:33:15.638934	2014-02-15 10:33:15.638934	234	\N	f
1898	75	8	0	2014-02-15 10:33:15.646311	2014-02-15 10:33:15.646311	235	\N	f
1899	75	8	0	2014-02-15 10:33:15.650994	2014-02-15 10:33:15.650994	236	\N	f
1900	75	8	2	2014-02-15 10:33:15.701895	2014-02-15 10:33:15.701895	237	\N	f
1901	76	8	0	2014-02-15 10:33:15.70591	2014-02-15 10:33:15.70591	238	\N	f
1902	76	8	2	2014-02-15 10:33:15.708126	2014-02-15 10:33:15.708126	239	\N	f
1903	76	8	0	2014-02-15 10:33:15.710317	2014-02-15 10:33:15.710317	240	\N	f
1904	76	8	0	2014-02-15 10:33:15.712512	2014-02-15 10:33:15.712512	241	\N	f
1905	21	8	0	2014-02-15 10:33:15.716462	2014-02-15 10:33:15.716462	27	\N	f
1906	21	8	2	2014-02-15 10:33:15.71866	2014-02-15 10:33:15.71866	28	\N	f
1907	21	8	0	2014-02-15 10:33:15.720905	2014-02-15 10:33:15.720905	29	\N	f
1908	21	8	0	2014-02-15 10:33:15.723068	2014-02-15 10:33:15.723068	30	\N	f
1909	67	8	0	2014-02-15 10:33:15.727077	2014-02-15 10:33:15.727077	210	\N	f
1910	67	8	0	2014-02-15 10:33:15.729284	2014-02-15 10:33:15.729284	211	\N	f
1911	67	8	0	2014-02-15 10:33:15.731452	2014-02-15 10:33:15.731452	212	\N	f
1912	67	8	2	2014-02-15 10:33:15.733662	2014-02-15 10:33:15.733662	213	\N	f
1913	15	9	0	2014-02-15 10:33:15.748755	2014-02-15 10:33:15.748755	3	\N	f
1914	15	9	0	2014-02-15 10:33:15.751388	2014-02-15 10:33:15.751388	4	\N	f
1915	15	9	0	2014-02-15 10:33:15.753947	2014-02-15 10:33:15.753947	5	\N	f
1916	15	9	2	2014-02-15 10:33:15.756504	2014-02-15 10:33:15.756504	6	\N	f
1917	16	9	0	2014-02-15 10:33:15.761086	2014-02-15 10:33:15.761086	7	\N	f
1918	16	9	2	2014-02-15 10:33:15.763645	2014-02-15 10:33:15.763645	8	\N	f
1919	16	9	0	2014-02-15 10:33:15.766283	2014-02-15 10:33:15.766283	9	\N	f
1920	16	9	0	2014-02-15 10:33:15.768824	2014-02-15 10:33:15.768824	10	\N	f
1921	17	9	0	2014-02-15 10:33:15.77339	2014-02-15 10:33:15.77339	11	\N	f
1922	17	9	0	2014-02-15 10:33:15.776053	2014-02-15 10:33:15.776053	12	\N	f
1923	17	9	2	2014-02-15 10:33:15.778592	2014-02-15 10:33:15.778592	13	\N	f
1924	17	9	0	2014-02-15 10:33:15.781132	2014-02-15 10:33:15.781132	14	\N	f
1925	18	9	0	2014-02-15 10:33:15.78568	2014-02-15 10:33:15.78568	15	\N	f
1926	18	9	2	2014-02-15 10:33:15.788308	2014-02-15 10:33:15.788308	16	\N	f
1927	18	9	0	2014-02-15 10:33:15.790839	2014-02-15 10:33:15.790839	17	\N	f
1928	18	9	0	2014-02-15 10:33:15.793537	2014-02-15 10:33:15.793537	18	\N	f
1929	19	9	0	2014-02-15 10:33:15.798136	2014-02-15 10:33:15.798136	19	\N	f
1930	19	9	2	2014-02-15 10:33:15.80071	2014-02-15 10:33:15.80071	20	\N	f
1931	19	9	0	2014-02-15 10:33:15.803258	2014-02-15 10:33:15.803258	21	\N	f
1932	19	9	0	2014-02-15 10:33:15.805791	2014-02-15 10:33:15.805791	22	\N	f
1933	20	9	0	2014-02-15 10:33:15.810366	2014-02-15 10:33:15.810366	23	\N	f
1934	20	9	0	2014-02-15 10:33:15.81298	2014-02-15 10:33:15.81298	24	\N	f
1935	20	9	2	2014-02-15 10:33:15.815514	2014-02-15 10:33:15.815514	25	\N	f
1936	20	9	0	2014-02-15 10:33:15.818069	2014-02-15 10:33:15.818069	26	\N	f
1937	22	9	0	2014-02-15 10:33:15.82267	2014-02-15 10:33:15.82267	31	\N	f
1938	22	9	0	2014-02-15 10:33:15.825272	2014-02-15 10:33:15.825272	32	\N	f
1939	22	9	2	2014-02-15 10:33:15.827834	2014-02-15 10:33:15.827834	33	\N	f
1940	22	9	0	2014-02-15 10:33:15.83039	2014-02-15 10:33:15.83039	34	\N	f
1941	23	9	0	2014-02-15 10:33:15.834914	2014-02-15 10:33:15.834914	35	\N	f
1942	23	9	0	2014-02-15 10:33:15.837535	2014-02-15 10:33:15.837535	36	\N	f
1943	23	9	2	2014-02-15 10:33:15.840094	2014-02-15 10:33:15.840094	37	\N	f
1944	23	9	0	2014-02-15 10:33:15.842628	2014-02-15 10:33:15.842628	38	\N	f
1945	24	9	2	2014-02-15 10:33:15.847189	2014-02-15 10:33:15.847189	39	\N	f
1946	24	9	0	2014-02-15 10:33:15.849813	2014-02-15 10:33:15.849813	40	\N	f
1947	24	9	0	2014-02-15 10:33:15.852384	2014-02-15 10:33:15.852384	41	\N	f
1948	24	9	0	2014-02-15 10:33:15.854934	2014-02-15 10:33:15.854934	42	\N	f
1949	25	9	0	2014-02-15 10:33:15.859519	2014-02-15 10:33:15.859519	43	\N	f
1950	25	9	2	2014-02-15 10:33:15.862099	2014-02-15 10:33:15.862099	44	\N	f
1951	25	9	0	2014-02-15 10:33:15.864702	2014-02-15 10:33:15.864702	45	\N	f
1952	25	9	0	2014-02-15 10:33:15.867264	2014-02-15 10:33:15.867264	46	\N	f
1953	26	9	0	2014-02-15 10:33:15.87188	2014-02-15 10:33:15.87188	47	\N	f
1954	26	9	0	2014-02-15 10:33:15.874472	2014-02-15 10:33:15.874472	48	\N	f
1955	26	9	2	2014-02-15 10:33:15.877071	2014-02-15 10:33:15.877071	49	\N	f
1956	26	9	0	2014-02-15 10:33:15.879606	2014-02-15 10:33:15.879606	50	\N	f
1957	27	9	0	2014-02-15 10:33:15.884201	2014-02-15 10:33:15.884201	51	\N	f
1958	27	9	0	2014-02-15 10:33:15.886783	2014-02-15 10:33:15.886783	52	\N	f
1959	27	9	0	2014-02-15 10:33:15.88936	2014-02-15 10:33:15.88936	53	\N	f
1960	27	9	2	2014-02-15 10:33:15.891993	2014-02-15 10:33:15.891993	54	\N	f
1961	28	9	0	2014-02-15 10:33:15.896495	2014-02-15 10:33:15.896495	55	\N	f
1962	28	9	0	2014-02-15 10:33:15.899065	2014-02-15 10:33:15.899065	56	\N	f
1963	28	9	0	2014-02-15 10:33:15.90169	2014-02-15 10:33:15.90169	57	\N	f
1964	28	9	2	2014-02-15 10:33:15.90431	2014-02-15 10:33:15.90431	58	\N	f
1965	29	9	0	2014-02-15 10:33:15.908855	2014-02-15 10:33:15.908855	59	\N	f
1966	29	9	0	2014-02-15 10:33:15.911449	2014-02-15 10:33:15.911449	60	\N	f
1967	29	9	0	2014-02-15 10:33:15.914011	2014-02-15 10:33:15.914011	61	\N	f
1968	29	9	2	2014-02-15 10:33:15.916626	2014-02-15 10:33:15.916626	62	\N	f
1969	30	9	0	2014-02-15 10:33:15.921209	2014-02-15 10:33:15.921209	63	\N	f
1970	30	9	0	2014-02-15 10:33:15.923829	2014-02-15 10:33:15.923829	64	\N	f
1971	30	9	2	2014-02-15 10:33:15.926398	2014-02-15 10:33:15.926398	65	\N	f
1972	30	9	0	2014-02-15 10:33:15.928988	2014-02-15 10:33:15.928988	66	\N	f
1973	31	9	0	2014-02-15 10:33:15.933511	2014-02-15 10:33:15.933511	67	\N	f
1974	31	9	0	2014-02-15 10:33:15.936231	2014-02-15 10:33:15.936231	68	\N	f
1975	31	9	0	2014-02-15 10:33:15.938816	2014-02-15 10:33:15.938816	69	\N	f
1976	31	9	2	2014-02-15 10:33:15.941421	2014-02-15 10:33:15.941421	70	\N	f
1977	32	9	0	2014-02-15 10:33:15.946043	2014-02-15 10:33:15.946043	71	\N	f
1978	32	9	2	2014-02-15 10:33:15.948641	2014-02-15 10:33:15.948641	72	\N	f
1979	32	9	0	2014-02-15 10:33:15.951174	2014-02-15 10:33:15.951174	73	\N	f
1980	32	9	0	2014-02-15 10:33:15.953762	2014-02-15 10:33:15.953762	74	\N	f
1981	33	9	0	2014-02-15 10:33:15.958269	2014-02-15 10:33:15.958269	75	\N	f
1982	33	9	0	2014-02-15 10:33:15.96092	2014-02-15 10:33:15.96092	76	\N	f
1983	33	9	2	2014-02-15 10:33:15.963463	2014-02-15 10:33:15.963463	77	\N	f
1984	33	9	0	2014-02-15 10:33:15.966083	2014-02-15 10:33:15.966083	78	\N	f
1985	34	9	0	2014-02-15 10:33:15.970648	2014-02-15 10:33:15.970648	79	\N	f
1986	34	9	0	2014-02-15 10:33:15.973363	2014-02-15 10:33:15.973363	80	\N	f
1987	34	9	2	2014-02-15 10:33:15.976024	2014-02-15 10:33:15.976024	81	\N	f
1988	34	9	0	2014-02-15 10:33:15.978605	2014-02-15 10:33:15.978605	82	\N	f
1989	35	9	0	2014-02-15 10:33:15.983442	2014-02-15 10:33:15.983442	83	\N	f
1990	35	9	0	2014-02-15 10:33:16.031671	2014-02-15 10:33:16.031671	84	\N	f
1991	35	9	2	2014-02-15 10:33:16.033905	2014-02-15 10:33:16.033905	85	\N	f
1992	35	9	0	2014-02-15 10:33:16.036129	2014-02-15 10:33:16.036129	86	\N	f
1993	36	9	0	2014-02-15 10:33:16.040124	2014-02-15 10:33:16.040124	87	\N	f
1994	36	9	0	2014-02-15 10:33:16.042321	2014-02-15 10:33:16.042321	88	\N	f
1995	36	9	0	2014-02-15 10:33:16.044517	2014-02-15 10:33:16.044517	89	\N	f
1996	36	9	2	2014-02-15 10:33:16.046687	2014-02-15 10:33:16.046687	90	\N	f
1997	37	9	0	2014-02-15 10:33:16.050684	2014-02-15 10:33:16.050684	91	\N	f
1998	37	9	0	2014-02-15 10:33:16.052886	2014-02-15 10:33:16.052886	92	\N	f
1999	37	9	2	2014-02-15 10:33:16.055095	2014-02-15 10:33:16.055095	93	\N	f
2000	37	9	0	2014-02-15 10:33:16.057301	2014-02-15 10:33:16.057301	94	\N	f
2001	38	9	0	2014-02-15 10:33:16.061352	2014-02-15 10:33:16.061352	95	\N	f
2002	38	9	2	2014-02-15 10:33:16.063538	2014-02-15 10:33:16.063538	96	\N	f
2003	38	9	0	2014-02-15 10:33:16.066123	2014-02-15 10:33:16.066123	97	\N	f
2004	38	9	0	2014-02-15 10:33:16.068699	2014-02-15 10:33:16.068699	98	\N	f
2005	38	9	0	2014-02-15 10:33:16.071254	2014-02-15 10:33:16.071254	99	\N	f
2006	39	9	0	2014-02-15 10:33:16.075843	2014-02-15 10:33:16.075843	100	\N	f
2007	39	9	0	2014-02-15 10:33:16.078421	2014-02-15 10:33:16.078421	101	\N	f
2008	39	9	0	2014-02-15 10:33:16.081029	2014-02-15 10:33:16.081029	102	\N	f
2009	39	9	2	2014-02-15 10:33:16.083578	2014-02-15 10:33:16.083578	103	\N	f
2010	40	9	0	2014-02-15 10:33:16.088146	2014-02-15 10:33:16.088146	104	\N	f
2011	40	9	0	2014-02-15 10:33:16.090737	2014-02-15 10:33:16.090737	105	\N	f
2012	40	9	2	2014-02-15 10:33:16.093303	2014-02-15 10:33:16.093303	106	\N	f
2013	40	9	0	2014-02-15 10:33:16.095883	2014-02-15 10:33:16.095883	107	\N	f
2014	41	9	0	2014-02-15 10:33:16.10042	2014-02-15 10:33:16.10042	108	\N	f
2015	41	9	0	2014-02-15 10:33:16.102989	2014-02-15 10:33:16.102989	109	\N	f
2016	41	9	2	2014-02-15 10:33:16.105594	2014-02-15 10:33:16.105594	110	\N	f
2017	41	9	0	2014-02-15 10:33:16.108241	2014-02-15 10:33:16.108241	111	\N	f
2018	42	9	0	2014-02-15 10:33:16.112713	2014-02-15 10:33:16.112713	112	\N	f
2019	42	9	0	2014-02-15 10:33:16.115265	2014-02-15 10:33:16.115265	113	\N	f
2020	42	9	2	2014-02-15 10:33:16.11787	2014-02-15 10:33:16.11787	114	\N	f
2021	43	9	2	2014-02-15 10:33:16.122406	2014-02-15 10:33:16.122406	115	\N	f
2022	43	9	0	2014-02-15 10:33:16.125048	2014-02-15 10:33:16.125048	116	\N	f
2023	43	9	0	2014-02-15 10:33:16.127621	2014-02-15 10:33:16.127621	117	\N	f
2024	43	9	0	2014-02-15 10:33:16.130185	2014-02-15 10:33:16.130185	118	\N	f
2025	44	9	0	2014-02-15 10:33:16.134748	2014-02-15 10:33:16.134748	119	\N	f
2026	44	9	2	2014-02-15 10:33:16.137394	2014-02-15 10:33:16.137394	120	\N	f
2027	44	9	0	2014-02-15 10:33:16.140033	2014-02-15 10:33:16.140033	121	\N	f
2028	44	9	0	2014-02-15 10:33:16.142577	2014-02-15 10:33:16.142577	122	\N	f
2029	45	9	2	2014-02-15 10:33:16.147124	2014-02-15 10:33:16.147124	123	\N	f
2030	45	9	0	2014-02-15 10:33:16.149767	2014-02-15 10:33:16.149767	124	\N	f
2031	45	9	0	2014-02-15 10:33:16.152331	2014-02-15 10:33:16.152331	125	\N	f
2032	45	9	0	2014-02-15 10:33:16.154846	2014-02-15 10:33:16.154846	126	\N	f
2033	46	9	2	2014-02-15 10:33:16.159327	2014-02-15 10:33:16.159327	127	\N	f
2034	46	9	0	2014-02-15 10:33:16.161913	2014-02-15 10:33:16.161913	128	\N	f
2035	46	9	0	2014-02-15 10:33:16.16461	2014-02-15 10:33:16.16461	129	\N	f
2036	47	9	0	2014-02-15 10:33:16.169136	2014-02-15 10:33:16.169136	130	\N	f
2037	47	9	2	2014-02-15 10:33:16.171713	2014-02-15 10:33:16.171713	131	\N	f
2038	47	9	0	2014-02-15 10:33:16.174609	2014-02-15 10:33:16.174609	132	\N	f
2039	47	9	0	2014-02-15 10:33:16.177457	2014-02-15 10:33:16.177457	133	\N	f
2040	48	9	0	2014-02-15 10:33:16.182413	2014-02-15 10:33:16.182413	134	\N	f
2041	48	9	0	2014-02-15 10:33:16.18532	2014-02-15 10:33:16.18532	135	\N	f
2042	48	9	2	2014-02-15 10:33:16.188151	2014-02-15 10:33:16.188151	136	\N	f
2043	48	9	0	2014-02-15 10:33:16.190998	2014-02-15 10:33:16.190998	137	\N	f
2044	49	9	0	2014-02-15 10:33:16.196035	2014-02-15 10:33:16.196035	138	\N	f
2045	49	9	2	2014-02-15 10:33:16.198903	2014-02-15 10:33:16.198903	139	\N	f
2046	49	9	0	2014-02-15 10:33:16.20179	2014-02-15 10:33:16.20179	140	\N	f
2047	49	9	0	2014-02-15 10:33:16.204633	2014-02-15 10:33:16.204633	141	\N	f
2048	49	9	0	2014-02-15 10:33:16.207447	2014-02-15 10:33:16.207447	142	\N	f
2049	50	9	0	2014-02-15 10:33:16.212465	2014-02-15 10:33:16.212465	143	\N	f
2050	50	9	0	2014-02-15 10:33:16.215335	2014-02-15 10:33:16.215335	144	\N	f
2051	50	9	2	2014-02-15 10:33:16.218213	2014-02-15 10:33:16.218213	145	\N	f
2052	50	9	0	2014-02-15 10:33:16.221084	2014-02-15 10:33:16.221084	146	\N	f
2053	51	9	0	2014-02-15 10:33:16.225966	2014-02-15 10:33:16.225966	147	\N	f
2054	51	9	2	2014-02-15 10:33:16.228881	2014-02-15 10:33:16.228881	148	\N	f
2055	51	9	0	2014-02-15 10:33:16.231691	2014-02-15 10:33:16.231691	149	\N	f
2056	52	9	0	2014-02-15 10:33:16.236646	2014-02-15 10:33:16.236646	150	\N	f
2057	52	9	0	2014-02-15 10:33:16.239475	2014-02-15 10:33:16.239475	151	\N	f
2058	52	9	2	2014-02-15 10:33:16.242396	2014-02-15 10:33:16.242396	152	\N	f
2059	52	9	0	2014-02-15 10:33:16.24525	2014-02-15 10:33:16.24525	153	\N	f
2060	53	9	0	2014-02-15 10:33:16.25026	2014-02-15 10:33:16.25026	154	\N	f
2061	53	9	0	2014-02-15 10:33:16.253215	2014-02-15 10:33:16.253215	155	\N	f
2062	53	9	0	2014-02-15 10:33:16.256256	2014-02-15 10:33:16.256256	156	\N	f
2063	53	9	0	2014-02-15 10:33:16.259117	2014-02-15 10:33:16.259117	157	\N	f
2064	53	9	2	2014-02-15 10:33:16.261986	2014-02-15 10:33:16.261986	158	\N	f
2065	54	9	2	2014-02-15 10:33:16.26694	2014-02-15 10:33:16.26694	159	\N	f
2066	54	9	0	2014-02-15 10:33:16.269821	2014-02-15 10:33:16.269821	160	\N	f
2067	54	9	0	2014-02-15 10:33:16.272694	2014-02-15 10:33:16.272694	161	\N	f
2068	54	9	0	2014-02-15 10:33:16.275511	2014-02-15 10:33:16.275511	162	\N	f
2069	55	9	0	2014-02-15 10:33:16.28055	2014-02-15 10:33:16.28055	163	\N	f
2070	55	9	0	2014-02-15 10:33:16.283364	2014-02-15 10:33:16.283364	164	\N	f
2071	55	9	2	2014-02-15 10:33:16.286247	2014-02-15 10:33:16.286247	165	\N	f
2072	55	9	0	2014-02-15 10:33:16.289107	2014-02-15 10:33:16.289107	166	\N	f
2073	56	9	0	2014-02-15 10:33:16.294069	2014-02-15 10:33:16.294069	167	\N	f
2074	56	9	0	2014-02-15 10:33:16.296901	2014-02-15 10:33:16.296901	168	\N	f
2075	56	9	2	2014-02-15 10:33:16.299793	2014-02-15 10:33:16.299793	169	\N	f
2076	56	9	0	2014-02-15 10:33:16.302663	2014-02-15 10:33:16.302663	170	\N	f
2077	57	9	2	2014-02-15 10:33:16.307625	2014-02-15 10:33:16.307625	171	\N	f
2078	57	9	0	2014-02-15 10:33:16.310539	2014-02-15 10:33:16.310539	172	\N	f
2079	57	9	0	2014-02-15 10:33:16.313439	2014-02-15 10:33:16.313439	173	\N	f
2080	57	9	0	2014-02-15 10:33:16.316382	2014-02-15 10:33:16.316382	174	\N	f
2081	58	9	0	2014-02-15 10:33:16.321426	2014-02-15 10:33:16.321426	175	\N	f
2082	58	9	2	2014-02-15 10:33:16.324477	2014-02-15 10:33:16.324477	176	\N	f
2083	58	9	0	2014-02-15 10:33:16.373506	2014-02-15 10:33:16.373506	177	\N	f
2084	58	9	0	2014-02-15 10:33:16.377048	2014-02-15 10:33:16.377048	178	\N	f
2085	59	9	0	2014-02-15 10:33:16.383899	2014-02-15 10:33:16.383899	179	\N	f
2086	59	9	0	2014-02-15 10:33:16.388438	2014-02-15 10:33:16.388438	180	\N	f
2087	59	9	2	2014-02-15 10:33:16.392782	2014-02-15 10:33:16.392782	181	\N	f
2088	59	9	0	2014-02-15 10:33:16.39718	2014-02-15 10:33:16.39718	182	\N	f
2089	59	9	0	2014-02-15 10:33:16.401506	2014-02-15 10:33:16.401506	183	\N	f
2090	60	9	0	2014-02-15 10:33:16.408991	2014-02-15 10:33:16.408991	184	\N	f
2091	60	9	2	2014-02-15 10:33:16.413357	2014-02-15 10:33:16.413357	185	\N	f
2092	60	9	0	2014-02-15 10:33:16.417657	2014-02-15 10:33:16.417657	186	\N	f
2093	60	9	0	2014-02-15 10:33:16.422022	2014-02-15 10:33:16.422022	187	\N	f
2094	60	9	0	2014-02-15 10:33:16.426427	2014-02-15 10:33:16.426427	188	\N	f
2095	61	9	2	2014-02-15 10:33:16.433821	2014-02-15 10:33:16.433821	189	\N	f
2096	61	9	0	2014-02-15 10:33:16.438205	2014-02-15 10:33:16.438205	190	\N	f
2097	61	9	0	2014-02-15 10:33:16.442555	2014-02-15 10:33:16.442555	191	\N	f
2098	61	9	0	2014-02-15 10:33:16.446897	2014-02-15 10:33:16.446897	192	\N	f
2099	61	9	0	2014-02-15 10:33:16.451312	2014-02-15 10:33:16.451312	193	\N	f
2100	62	9	0	2014-02-15 10:33:16.458514	2014-02-15 10:33:16.458514	194	\N	f
2101	62	9	2	2014-02-15 10:33:16.462945	2014-02-15 10:33:16.462945	195	\N	f
2102	62	9	0	2014-02-15 10:33:16.46733	2014-02-15 10:33:16.46733	196	\N	f
2103	63	9	0	2014-02-15 10:33:16.474413	2014-02-15 10:33:16.474413	197	\N	f
2104	63	9	2	2014-02-15 10:33:16.478807	2014-02-15 10:33:16.478807	198	\N	f
2105	64	9	2	2014-02-15 10:33:16.48595	2014-02-15 10:33:16.48595	199	\N	f
2106	64	9	0	2014-02-15 10:33:16.490418	2014-02-15 10:33:16.490418	200	\N	f
2107	64	9	0	2014-02-15 10:33:16.494795	2014-02-15 10:33:16.494795	201	\N	f
2108	65	9	0	2014-02-15 10:33:16.502082	2014-02-15 10:33:16.502082	202	\N	f
2109	65	9	0	2014-02-15 10:33:16.506516	2014-02-15 10:33:16.506516	203	\N	f
2110	65	9	2	2014-02-15 10:33:16.510878	2014-02-15 10:33:16.510878	204	\N	f
2111	65	9	0	2014-02-15 10:33:16.515213	2014-02-15 10:33:16.515213	205	\N	f
2112	66	9	0	2014-02-15 10:33:16.522536	2014-02-15 10:33:16.522536	206	\N	f
2113	66	9	0	2014-02-15 10:33:16.526965	2014-02-15 10:33:16.526965	207	\N	f
2114	66	9	2	2014-02-15 10:33:16.531372	2014-02-15 10:33:16.531372	208	\N	f
2115	66	9	0	2014-02-15 10:33:16.535686	2014-02-15 10:33:16.535686	209	\N	f
2116	68	9	0	2014-02-15 10:33:16.542923	2014-02-15 10:33:16.542923	214	\N	f
2117	68	9	2	2014-02-15 10:33:16.547333	2014-02-15 10:33:16.547333	215	\N	f
2118	69	9	0	2014-02-15 10:33:16.554604	2014-02-15 10:33:16.554604	216	\N	f
2119	69	9	0	2014-02-15 10:33:16.559016	2014-02-15 10:33:16.559016	217	\N	f
2120	69	9	2	2014-02-15 10:33:16.563371	2014-02-15 10:33:16.563371	218	\N	f
2121	69	9	0	2014-02-15 10:33:16.56782	2014-02-15 10:33:16.56782	219	\N	f
2122	70	9	0	2014-02-15 10:33:16.57495	2014-02-15 10:33:16.57495	220	\N	f
2123	70	9	0	2014-02-15 10:33:16.579367	2014-02-15 10:33:16.579367	221	\N	f
2124	70	9	2	2014-02-15 10:33:16.583936	2014-02-15 10:33:16.583936	222	\N	f
2125	71	9	0	2014-02-15 10:33:16.5912	2014-02-15 10:33:16.5912	223	\N	f
2126	71	9	0	2014-02-15 10:33:16.595577	2014-02-15 10:33:16.595577	224	\N	f
2127	71	9	2	2014-02-15 10:33:16.60001	2014-02-15 10:33:16.60001	225	\N	f
2128	72	9	0	2014-02-15 10:33:16.607119	2014-02-15 10:33:16.607119	226	\N	f
2129	72	9	0	2014-02-15 10:33:16.611485	2014-02-15 10:33:16.611485	227	\N	f
2130	72	9	2	2014-02-15 10:33:16.615967	2014-02-15 10:33:16.615967	228	\N	f
2131	73	9	2	2014-02-15 10:33:16.62311	2014-02-15 10:33:16.62311	229	\N	f
2132	73	9	0	2014-02-15 10:33:16.627541	2014-02-15 10:33:16.627541	230	\N	f
2133	73	9	0	2014-02-15 10:33:16.631899	2014-02-15 10:33:16.631899	231	\N	f
2134	74	9	0	2014-02-15 10:33:16.639052	2014-02-15 10:33:16.639052	232	\N	f
2135	74	9	2	2014-02-15 10:33:16.643456	2014-02-15 10:33:16.643456	233	\N	f
2136	74	9	0	2014-02-15 10:33:16.647897	2014-02-15 10:33:16.647897	234	\N	f
2137	75	9	0	2014-02-15 10:33:16.655092	2014-02-15 10:33:16.655092	235	\N	f
2138	75	9	0	2014-02-15 10:33:16.659508	2014-02-15 10:33:16.659508	236	\N	f
2139	75	9	2	2014-02-15 10:33:16.663956	2014-02-15 10:33:16.663956	237	\N	f
2140	76	9	0	2014-02-15 10:33:16.671153	2014-02-15 10:33:16.671153	238	\N	f
2141	76	9	2	2014-02-15 10:33:16.675646	2014-02-15 10:33:16.675646	239	\N	f
2142	76	9	0	2014-02-15 10:33:16.680193	2014-02-15 10:33:16.680193	240	\N	f
2143	76	9	0	2014-02-15 10:33:16.68458	2014-02-15 10:33:16.68458	241	\N	f
2144	21	9	0	2014-02-15 10:33:16.691806	2014-02-15 10:33:16.691806	27	\N	f
2145	21	9	2	2014-02-15 10:33:16.696272	2014-02-15 10:33:16.696272	28	\N	f
2146	21	9	0	2014-02-15 10:33:16.700664	2014-02-15 10:33:16.700664	29	\N	f
2147	21	9	0	2014-02-15 10:33:16.705005	2014-02-15 10:33:16.705005	30	\N	f
2148	67	9	0	2014-02-15 10:33:16.71229	2014-02-15 10:33:16.71229	210	\N	f
2149	67	9	0	2014-02-15 10:33:16.716718	2014-02-15 10:33:16.716718	211	\N	f
2150	67	9	0	2014-02-15 10:33:16.72109	2014-02-15 10:33:16.72109	212	\N	f
2151	67	9	2	2014-02-15 10:33:16.725503	2014-02-15 10:33:16.725503	213	\N	f
2152	15	10	0	2014-02-15 10:33:16.754178	2014-02-15 10:33:16.754178	3	\N	f
2153	15	10	0	2014-02-15 10:33:16.758692	2014-02-15 10:33:16.758692	4	\N	f
2154	15	10	0	2014-02-15 10:33:16.763038	2014-02-15 10:33:16.763038	5	\N	f
2155	15	10	2	2014-02-15 10:33:16.767412	2014-02-15 10:33:16.767412	6	\N	f
2156	16	10	0	2014-02-15 10:33:16.774756	2014-02-15 10:33:16.774756	7	\N	f
2157	16	10	2	2014-02-15 10:33:16.779142	2014-02-15 10:33:16.779142	8	\N	f
2158	16	10	0	2014-02-15 10:33:16.783554	2014-02-15 10:33:16.783554	9	\N	f
2159	16	10	0	2014-02-15 10:33:16.787971	2014-02-15 10:33:16.787971	10	\N	f
2160	17	10	0	2014-02-15 10:33:16.795467	2014-02-15 10:33:16.795467	11	\N	f
2161	17	10	0	2014-02-15 10:33:16.800129	2014-02-15 10:33:16.800129	12	\N	f
2162	17	10	2	2014-02-15 10:33:16.804645	2014-02-15 10:33:16.804645	13	\N	f
2163	17	10	0	2014-02-15 10:33:16.809088	2014-02-15 10:33:16.809088	14	\N	f
2164	18	10	0	2014-02-15 10:33:16.816578	2014-02-15 10:33:16.816578	15	\N	f
2165	18	10	2	2014-02-15 10:33:16.822679	2014-02-15 10:33:16.822679	16	\N	f
2166	18	10	0	2014-02-15 10:33:16.872622	2014-02-15 10:33:16.872622	17	\N	f
2167	18	10	0	2014-02-15 10:33:16.877001	2014-02-15 10:33:16.877001	18	\N	f
2168	19	10	0	2014-02-15 10:33:16.882672	2014-02-15 10:33:16.882672	19	\N	f
2169	19	10	2	2014-02-15 10:33:16.885554	2014-02-15 10:33:16.885554	20	\N	f
2170	19	10	0	2014-02-15 10:33:16.888461	2014-02-15 10:33:16.888461	21	\N	f
2171	19	10	0	2014-02-15 10:33:16.891297	2014-02-15 10:33:16.891297	22	\N	f
2172	20	10	0	2014-02-15 10:33:16.896315	2014-02-15 10:33:16.896315	23	\N	f
2173	20	10	0	2014-02-15 10:33:16.899176	2014-02-15 10:33:16.899176	24	\N	f
2174	20	10	2	2014-02-15 10:33:16.902062	2014-02-15 10:33:16.902062	25	\N	f
2175	20	10	0	2014-02-15 10:33:16.904875	2014-02-15 10:33:16.904875	26	\N	f
2176	22	10	0	2014-02-15 10:33:16.909869	2014-02-15 10:33:16.909869	31	\N	f
2177	22	10	0	2014-02-15 10:33:16.912795	2014-02-15 10:33:16.912795	32	\N	f
2178	22	10	2	2014-02-15 10:33:16.915606	2014-02-15 10:33:16.915606	33	\N	f
2179	22	10	0	2014-02-15 10:33:16.91848	2014-02-15 10:33:16.91848	34	\N	f
2180	23	10	0	2014-02-15 10:33:16.923687	2014-02-15 10:33:16.923687	35	\N	f
2181	23	10	0	2014-02-15 10:33:16.926634	2014-02-15 10:33:16.926634	36	\N	f
2182	23	10	2	2014-02-15 10:33:16.929511	2014-02-15 10:33:16.929511	37	\N	f
2183	23	10	0	2014-02-15 10:33:16.932368	2014-02-15 10:33:16.932368	38	\N	f
2184	24	10	2	2014-02-15 10:33:16.93742	2014-02-15 10:33:16.93742	39	\N	f
2185	24	10	0	2014-02-15 10:33:16.940336	2014-02-15 10:33:16.940336	40	\N	f
2186	24	10	0	2014-02-15 10:33:16.943175	2014-02-15 10:33:16.943175	41	\N	f
2187	24	10	0	2014-02-15 10:33:16.946038	2014-02-15 10:33:16.946038	42	\N	f
2188	25	10	0	2014-02-15 10:33:16.951034	2014-02-15 10:33:16.951034	43	\N	f
2189	25	10	2	2014-02-15 10:33:16.9539	2014-02-15 10:33:16.9539	44	\N	f
2190	25	10	0	2014-02-15 10:33:16.956742	2014-02-15 10:33:16.956742	45	\N	f
2191	25	10	0	2014-02-15 10:33:16.959584	2014-02-15 10:33:16.959584	46	\N	f
2192	26	10	0	2014-02-15 10:33:16.964606	2014-02-15 10:33:16.964606	47	\N	f
2193	26	10	0	2014-02-15 10:33:16.96746	2014-02-15 10:33:16.96746	48	\N	f
2194	26	10	2	2014-02-15 10:33:16.970319	2014-02-15 10:33:16.970319	49	\N	f
2195	26	10	0	2014-02-15 10:33:16.973199	2014-02-15 10:33:16.973199	50	\N	f
2196	27	10	0	2014-02-15 10:33:16.978237	2014-02-15 10:33:16.978237	51	\N	f
2197	27	10	0	2014-02-15 10:33:16.9811	2014-02-15 10:33:16.9811	52	\N	f
2198	27	10	0	2014-02-15 10:33:16.983995	2014-02-15 10:33:16.983995	53	\N	f
2199	27	10	2	2014-02-15 10:33:16.986825	2014-02-15 10:33:16.986825	54	\N	f
2200	28	10	0	2014-02-15 10:33:16.991827	2014-02-15 10:33:16.991827	55	\N	f
2201	28	10	0	2014-02-15 10:33:16.994689	2014-02-15 10:33:16.994689	56	\N	f
2202	28	10	0	2014-02-15 10:33:16.997589	2014-02-15 10:33:16.997589	57	\N	f
2203	28	10	2	2014-02-15 10:33:17.000576	2014-02-15 10:33:17.000576	58	\N	f
2204	29	10	0	2014-02-15 10:33:17.005562	2014-02-15 10:33:17.005562	59	\N	f
2205	29	10	0	2014-02-15 10:33:17.00861	2014-02-15 10:33:17.00861	60	\N	f
2206	29	10	0	2014-02-15 10:33:17.011434	2014-02-15 10:33:17.011434	61	\N	f
2207	29	10	2	2014-02-15 10:33:17.014276	2014-02-15 10:33:17.014276	62	\N	f
2208	30	10	0	2014-02-15 10:33:17.019316	2014-02-15 10:33:17.019316	63	\N	f
2209	30	10	0	2014-02-15 10:33:17.022244	2014-02-15 10:33:17.022244	64	\N	f
2210	30	10	2	2014-02-15 10:33:17.02513	2014-02-15 10:33:17.02513	65	\N	f
2211	30	10	0	2014-02-15 10:33:17.028005	2014-02-15 10:33:17.028005	66	\N	f
2212	31	10	0	2014-02-15 10:33:17.033002	2014-02-15 10:33:17.033002	67	\N	f
2213	31	10	0	2014-02-15 10:33:17.035901	2014-02-15 10:33:17.035901	68	\N	f
2214	31	10	0	2014-02-15 10:33:17.038738	2014-02-15 10:33:17.038738	69	\N	f
2215	31	10	2	2014-02-15 10:33:17.041576	2014-02-15 10:33:17.041576	70	\N	f
2216	32	10	0	2014-02-15 10:33:17.046559	2014-02-15 10:33:17.046559	71	\N	f
2217	32	10	2	2014-02-15 10:33:17.049446	2014-02-15 10:33:17.049446	72	\N	f
2218	32	10	0	2014-02-15 10:33:17.052305	2014-02-15 10:33:17.052305	73	\N	f
2219	32	10	0	2014-02-15 10:33:17.055159	2014-02-15 10:33:17.055159	74	\N	f
2220	33	10	0	2014-02-15 10:33:17.060181	2014-02-15 10:33:17.060181	75	\N	f
2221	33	10	0	2014-02-15 10:33:17.063035	2014-02-15 10:33:17.063035	76	\N	f
2222	33	10	2	2014-02-15 10:33:17.065904	2014-02-15 10:33:17.065904	77	\N	f
2223	33	10	0	2014-02-15 10:33:17.068767	2014-02-15 10:33:17.068767	78	\N	f
2224	34	10	0	2014-02-15 10:33:17.073779	2014-02-15 10:33:17.073779	79	\N	f
2225	34	10	0	2014-02-15 10:33:17.07665	2014-02-15 10:33:17.07665	80	\N	f
2226	34	10	2	2014-02-15 10:33:17.079484	2014-02-15 10:33:17.079484	81	\N	f
2227	34	10	0	2014-02-15 10:33:17.082395	2014-02-15 10:33:17.082395	82	\N	f
2228	35	10	0	2014-02-15 10:33:17.087382	2014-02-15 10:33:17.087382	83	\N	f
2229	35	10	0	2014-02-15 10:33:17.090263	2014-02-15 10:33:17.090263	84	\N	f
2230	35	10	2	2014-02-15 10:33:17.09314	2014-02-15 10:33:17.09314	85	\N	f
2231	35	10	0	2014-02-15 10:33:17.096001	2014-02-15 10:33:17.096001	86	\N	f
2232	36	10	0	2014-02-15 10:33:17.100967	2014-02-15 10:33:17.100967	87	\N	f
2233	36	10	0	2014-02-15 10:33:17.103879	2014-02-15 10:33:17.103879	88	\N	f
2234	36	10	0	2014-02-15 10:33:17.106736	2014-02-15 10:33:17.106736	89	\N	f
2235	36	10	2	2014-02-15 10:33:17.109634	2014-02-15 10:33:17.109634	90	\N	f
2236	37	10	0	2014-02-15 10:33:17.114626	2014-02-15 10:33:17.114626	91	\N	f
2237	37	10	0	2014-02-15 10:33:17.117529	2014-02-15 10:33:17.117529	92	\N	f
2238	37	10	2	2014-02-15 10:33:17.120373	2014-02-15 10:33:17.120373	93	\N	f
2239	37	10	0	2014-02-15 10:33:17.123443	2014-02-15 10:33:17.123443	94	\N	f
2240	38	10	0	2014-02-15 10:33:17.12953	2014-02-15 10:33:17.12953	95	\N	f
2241	38	10	2	2014-02-15 10:33:17.132532	2014-02-15 10:33:17.132532	96	\N	f
2242	38	10	0	2014-02-15 10:33:17.135355	2014-02-15 10:33:17.135355	97	\N	f
2243	38	10	0	2014-02-15 10:33:17.13837	2014-02-15 10:33:17.13837	98	\N	f
2244	38	10	0	2014-02-15 10:33:17.141272	2014-02-15 10:33:17.141272	99	\N	f
2245	39	10	0	2014-02-15 10:33:17.146329	2014-02-15 10:33:17.146329	100	\N	f
2246	39	10	0	2014-02-15 10:33:17.149221	2014-02-15 10:33:17.149221	101	\N	f
2247	39	10	0	2014-02-15 10:33:17.152625	2014-02-15 10:33:17.152625	102	\N	f
2248	39	10	2	2014-02-15 10:33:17.157194	2014-02-15 10:33:17.157194	103	\N	f
2249	40	10	0	2014-02-15 10:33:17.164827	2014-02-15 10:33:17.164827	104	\N	f
2250	40	10	0	2014-02-15 10:33:17.169265	2014-02-15 10:33:17.169265	105	\N	f
2251	40	10	2	2014-02-15 10:33:17.173841	2014-02-15 10:33:17.173841	106	\N	f
2252	40	10	0	2014-02-15 10:33:17.227999	2014-02-15 10:33:17.227999	107	\N	f
2253	41	10	0	2014-02-15 10:33:17.234425	2014-02-15 10:33:17.234425	108	\N	f
2254	41	10	0	2014-02-15 10:33:17.237926	2014-02-15 10:33:17.237926	109	\N	f
2255	41	10	2	2014-02-15 10:33:17.240362	2014-02-15 10:33:17.240362	110	\N	f
2256	41	10	0	2014-02-15 10:33:17.243184	2014-02-15 10:33:17.243184	111	\N	f
2257	42	10	0	2014-02-15 10:33:17.249234	2014-02-15 10:33:17.249234	112	\N	f
2258	42	10	0	2014-02-15 10:33:17.253646	2014-02-15 10:33:17.253646	113	\N	f
2259	42	10	2	2014-02-15 10:33:17.257975	2014-02-15 10:33:17.257975	114	\N	f
2260	43	10	2	2014-02-15 10:33:17.265238	2014-02-15 10:33:17.265238	115	\N	f
2261	43	10	0	2014-02-15 10:33:17.269648	2014-02-15 10:33:17.269648	116	\N	f
2262	43	10	0	2014-02-15 10:33:17.274029	2014-02-15 10:33:17.274029	117	\N	f
2263	43	10	0	2014-02-15 10:33:17.278412	2014-02-15 10:33:17.278412	118	\N	f
2264	44	10	0	2014-02-15 10:33:17.285704	2014-02-15 10:33:17.285704	119	\N	f
2265	44	10	2	2014-02-15 10:33:17.29009	2014-02-15 10:33:17.29009	120	\N	f
2266	44	10	0	2014-02-15 10:33:17.294501	2014-02-15 10:33:17.294501	121	\N	f
2267	44	10	0	2014-02-15 10:33:17.298867	2014-02-15 10:33:17.298867	122	\N	f
2268	45	10	2	2014-02-15 10:33:17.306196	2014-02-15 10:33:17.306196	123	\N	f
2269	45	10	0	2014-02-15 10:33:17.310639	2014-02-15 10:33:17.310639	124	\N	f
2270	45	10	0	2014-02-15 10:33:17.315003	2014-02-15 10:33:17.315003	125	\N	f
2271	45	10	0	2014-02-15 10:33:17.319292	2014-02-15 10:33:17.319292	126	\N	f
2272	46	10	2	2014-02-15 10:33:17.326549	2014-02-15 10:33:17.326549	127	\N	f
2273	46	10	0	2014-02-15 10:33:17.330927	2014-02-15 10:33:17.330927	128	\N	f
2274	46	10	0	2014-02-15 10:33:17.335351	2014-02-15 10:33:17.335351	129	\N	f
2275	47	10	0	2014-02-15 10:33:17.342629	2014-02-15 10:33:17.342629	130	\N	f
2276	47	10	2	2014-02-15 10:33:17.347068	2014-02-15 10:33:17.347068	131	\N	f
2277	47	10	0	2014-02-15 10:33:17.351428	2014-02-15 10:33:17.351428	132	\N	f
2278	47	10	0	2014-02-15 10:33:17.35585	2014-02-15 10:33:17.35585	133	\N	f
2279	48	10	0	2014-02-15 10:33:17.363075	2014-02-15 10:33:17.363075	134	\N	f
2280	48	10	0	2014-02-15 10:33:17.367431	2014-02-15 10:33:17.367431	135	\N	f
2281	48	10	2	2014-02-15 10:33:17.371857	2014-02-15 10:33:17.371857	136	\N	f
2282	48	10	0	2014-02-15 10:33:17.376202	2014-02-15 10:33:17.376202	137	\N	f
2283	49	10	0	2014-02-15 10:33:17.383558	2014-02-15 10:33:17.383558	138	\N	f
2284	49	10	2	2014-02-15 10:33:17.38805	2014-02-15 10:33:17.38805	139	\N	f
2285	49	10	0	2014-02-15 10:33:17.392534	2014-02-15 10:33:17.392534	140	\N	f
2286	49	10	0	2014-02-15 10:33:17.396856	2014-02-15 10:33:17.396856	141	\N	f
2287	49	10	0	2014-02-15 10:33:17.401192	2014-02-15 10:33:17.401192	142	\N	f
2288	50	10	0	2014-02-15 10:33:17.408553	2014-02-15 10:33:17.408553	143	\N	f
2289	50	10	0	2014-02-15 10:33:17.412915	2014-02-15 10:33:17.412915	144	\N	f
2290	50	10	2	2014-02-15 10:33:17.417275	2014-02-15 10:33:17.417275	145	\N	f
2291	50	10	0	2014-02-15 10:33:17.421622	2014-02-15 10:33:17.421622	146	\N	f
2292	51	10	0	2014-02-15 10:33:17.428838	2014-02-15 10:33:17.428838	147	\N	f
2293	51	10	2	2014-02-15 10:33:17.433233	2014-02-15 10:33:17.433233	148	\N	f
2294	51	10	0	2014-02-15 10:33:17.437569	2014-02-15 10:33:17.437569	149	\N	f
2295	52	10	0	2014-02-15 10:33:17.444885	2014-02-15 10:33:17.444885	150	\N	f
2296	52	10	0	2014-02-15 10:33:17.449258	2014-02-15 10:33:17.449258	151	\N	f
2297	52	10	2	2014-02-15 10:33:17.453629	2014-02-15 10:33:17.453629	152	\N	f
2298	52	10	0	2014-02-15 10:33:17.457995	2014-02-15 10:33:17.457995	153	\N	f
2299	53	10	0	2014-02-15 10:33:17.465346	2014-02-15 10:33:17.465346	154	\N	f
2300	53	10	0	2014-02-15 10:33:17.469683	2014-02-15 10:33:17.469683	155	\N	f
2301	53	10	0	2014-02-15 10:33:17.474012	2014-02-15 10:33:17.474012	156	\N	f
2302	53	10	0	2014-02-15 10:33:17.478441	2014-02-15 10:33:17.478441	157	\N	f
2303	53	10	2	2014-02-15 10:33:17.482774	2014-02-15 10:33:17.482774	158	\N	f
2304	54	10	2	2014-02-15 10:33:17.490223	2014-02-15 10:33:17.490223	159	\N	f
2305	54	10	0	2014-02-15 10:33:17.494622	2014-02-15 10:33:17.494622	160	\N	f
2306	54	10	0	2014-02-15 10:33:17.498945	2014-02-15 10:33:17.498945	161	\N	f
2307	54	10	0	2014-02-15 10:33:17.50332	2014-02-15 10:33:17.50332	162	\N	f
2308	55	10	0	2014-02-15 10:33:17.510555	2014-02-15 10:33:17.510555	163	\N	f
2309	55	10	0	2014-02-15 10:33:17.514951	2014-02-15 10:33:17.514951	164	\N	f
2310	55	10	2	2014-02-15 10:33:17.519251	2014-02-15 10:33:17.519251	165	\N	f
2311	55	10	0	2014-02-15 10:33:17.523594	2014-02-15 10:33:17.523594	166	\N	f
2312	56	10	0	2014-02-15 10:33:17.530885	2014-02-15 10:33:17.530885	167	\N	f
2313	56	10	0	2014-02-15 10:33:17.535247	2014-02-15 10:33:17.535247	168	\N	f
2314	56	10	2	2014-02-15 10:33:17.539665	2014-02-15 10:33:17.539665	169	\N	f
2315	56	10	0	2014-02-15 10:33:17.544005	2014-02-15 10:33:17.544005	170	\N	f
2316	57	10	2	2014-02-15 10:33:17.551209	2014-02-15 10:33:17.551209	171	\N	f
2317	57	10	0	2014-02-15 10:33:17.555584	2014-02-15 10:33:17.555584	172	\N	f
2318	57	10	0	2014-02-15 10:33:17.560025	2014-02-15 10:33:17.560025	173	\N	f
2319	57	10	0	2014-02-15 10:33:17.564401	2014-02-15 10:33:17.564401	174	\N	f
2320	58	10	0	2014-02-15 10:33:17.571683	2014-02-15 10:33:17.571683	175	\N	f
2321	58	10	2	2014-02-15 10:33:17.57621	2014-02-15 10:33:17.57621	176	\N	f
2322	58	10	0	2014-02-15 10:33:17.58062	2014-02-15 10:33:17.58062	177	\N	f
2323	58	10	0	2014-02-15 10:33:17.58505	2014-02-15 10:33:17.58505	178	\N	f
2324	59	10	0	2014-02-15 10:33:17.592451	2014-02-15 10:33:17.592451	179	\N	f
2325	59	10	0	2014-02-15 10:33:17.596891	2014-02-15 10:33:17.596891	180	\N	f
2326	59	10	2	2014-02-15 10:33:17.601291	2014-02-15 10:33:17.601291	181	\N	f
2327	59	10	0	2014-02-15 10:33:17.605678	2014-02-15 10:33:17.605678	182	\N	f
2328	59	10	0	2014-02-15 10:33:17.610003	2014-02-15 10:33:17.610003	183	\N	f
2329	60	10	0	2014-02-15 10:33:17.617431	2014-02-15 10:33:17.617431	184	\N	f
2330	60	10	2	2014-02-15 10:33:17.621881	2014-02-15 10:33:17.621881	185	\N	f
2331	60	10	0	2014-02-15 10:33:17.626288	2014-02-15 10:33:17.626288	186	\N	f
2332	60	10	0	2014-02-15 10:33:17.630778	2014-02-15 10:33:17.630778	187	\N	f
2333	60	10	0	2014-02-15 10:33:17.635274	2014-02-15 10:33:17.635274	188	\N	f
2334	61	10	2	2014-02-15 10:33:17.643293	2014-02-15 10:33:17.643293	189	\N	f
2335	61	10	0	2014-02-15 10:33:17.697813	2014-02-15 10:33:17.697813	190	\N	f
2336	61	10	0	2014-02-15 10:33:17.700051	2014-02-15 10:33:17.700051	191	\N	f
2337	61	10	0	2014-02-15 10:33:17.702209	2014-02-15 10:33:17.702209	192	\N	f
2338	61	10	0	2014-02-15 10:33:17.704435	2014-02-15 10:33:17.704435	193	\N	f
2339	62	10	0	2014-02-15 10:33:17.708384	2014-02-15 10:33:17.708384	194	\N	f
2340	62	10	2	2014-02-15 10:33:17.710569	2014-02-15 10:33:17.710569	195	\N	f
2341	62	10	0	2014-02-15 10:33:17.712854	2014-02-15 10:33:17.712854	196	\N	f
2342	63	10	0	2014-02-15 10:33:17.716785	2014-02-15 10:33:17.716785	197	\N	f
2343	63	10	2	2014-02-15 10:33:17.718996	2014-02-15 10:33:17.718996	198	\N	f
2344	64	10	2	2014-02-15 10:33:17.72293	2014-02-15 10:33:17.72293	199	\N	f
2345	64	10	0	2014-02-15 10:33:17.725155	2014-02-15 10:33:17.725155	200	\N	f
2346	64	10	0	2014-02-15 10:33:17.727327	2014-02-15 10:33:17.727327	201	\N	f
2347	65	10	0	2014-02-15 10:33:17.731841	2014-02-15 10:33:17.731841	202	\N	f
2348	65	10	0	2014-02-15 10:33:17.734424	2014-02-15 10:33:17.734424	203	\N	f
2349	65	10	2	2014-02-15 10:33:17.737048	2014-02-15 10:33:17.737048	204	\N	f
2350	65	10	0	2014-02-15 10:33:17.739624	2014-02-15 10:33:17.739624	205	\N	f
2351	66	10	0	2014-02-15 10:33:17.744233	2014-02-15 10:33:17.744233	206	\N	f
2352	66	10	0	2014-02-15 10:33:17.7468	2014-02-15 10:33:17.7468	207	\N	f
2353	66	10	2	2014-02-15 10:33:17.749355	2014-02-15 10:33:17.749355	208	\N	f
2354	66	10	0	2014-02-15 10:33:17.751955	2014-02-15 10:33:17.751955	209	\N	f
2355	68	10	0	2014-02-15 10:33:17.756392	2014-02-15 10:33:17.756392	214	\N	f
2356	68	10	2	2014-02-15 10:33:17.759066	2014-02-15 10:33:17.759066	215	\N	f
2357	69	10	0	2014-02-15 10:33:17.763628	2014-02-15 10:33:17.763628	216	\N	f
2358	69	10	0	2014-02-15 10:33:17.766517	2014-02-15 10:33:17.766517	217	\N	f
2359	69	10	2	2014-02-15 10:33:17.76939	2014-02-15 10:33:17.76939	218	\N	f
2360	69	10	0	2014-02-15 10:33:17.772254	2014-02-15 10:33:17.772254	219	\N	f
2361	70	10	0	2014-02-15 10:33:17.777168	2014-02-15 10:33:17.777168	220	\N	f
2362	70	10	0	2014-02-15 10:33:17.780056	2014-02-15 10:33:17.780056	221	\N	f
2363	70	10	2	2014-02-15 10:33:17.782884	2014-02-15 10:33:17.782884	222	\N	f
2364	71	10	0	2014-02-15 10:33:17.787857	2014-02-15 10:33:17.787857	223	\N	f
2365	71	10	0	2014-02-15 10:33:17.790728	2014-02-15 10:33:17.790728	224	\N	f
2366	71	10	2	2014-02-15 10:33:17.79363	2014-02-15 10:33:17.79363	225	\N	f
2367	72	10	0	2014-02-15 10:33:17.798539	2014-02-15 10:33:17.798539	226	\N	f
2368	72	10	0	2014-02-15 10:33:17.801462	2014-02-15 10:33:17.801462	227	\N	f
2369	72	10	2	2014-02-15 10:33:17.80433	2014-02-15 10:33:17.80433	228	\N	f
2370	73	10	2	2014-02-15 10:33:17.809201	2014-02-15 10:33:17.809201	229	\N	f
2371	73	10	0	2014-02-15 10:33:17.812095	2014-02-15 10:33:17.812095	230	\N	f
2372	73	10	0	2014-02-15 10:33:17.814937	2014-02-15 10:33:17.814937	231	\N	f
2373	74	10	0	2014-02-15 10:33:17.819842	2014-02-15 10:33:17.819842	232	\N	f
2374	74	10	2	2014-02-15 10:33:17.822702	2014-02-15 10:33:17.822702	233	\N	f
2375	74	10	0	2014-02-15 10:33:17.825575	2014-02-15 10:33:17.825575	234	\N	f
2376	75	10	0	2014-02-15 10:33:17.830475	2014-02-15 10:33:17.830475	235	\N	f
2377	75	10	0	2014-02-15 10:33:17.833385	2014-02-15 10:33:17.833385	236	\N	f
2378	75	10	2	2014-02-15 10:33:17.836293	2014-02-15 10:33:17.836293	237	\N	f
2379	76	10	0	2014-02-15 10:33:17.841319	2014-02-15 10:33:17.841319	238	\N	f
2380	76	10	2	2014-02-15 10:33:17.844191	2014-02-15 10:33:17.844191	239	\N	f
2381	76	10	0	2014-02-15 10:33:17.847015	2014-02-15 10:33:17.847015	240	\N	f
2382	76	10	0	2014-02-15 10:33:17.849901	2014-02-15 10:33:17.849901	241	\N	f
2383	21	10	0	2014-02-15 10:33:17.854897	2014-02-15 10:33:17.854897	27	\N	f
2384	21	10	2	2014-02-15 10:33:17.857798	2014-02-15 10:33:17.857798	28	\N	f
2385	21	10	0	2014-02-15 10:33:17.860649	2014-02-15 10:33:17.860649	29	\N	f
2386	21	10	0	2014-02-15 10:33:17.863445	2014-02-15 10:33:17.863445	30	\N	f
2387	67	10	0	2014-02-15 10:33:17.868438	2014-02-15 10:33:17.868438	210	\N	f
2388	67	10	0	2014-02-15 10:33:17.871327	2014-02-15 10:33:17.871327	211	\N	f
2389	67	10	0	2014-02-15 10:33:17.874207	2014-02-15 10:33:17.874207	212	\N	f
2390	67	10	2	2014-02-15 10:33:17.877069	2014-02-15 10:33:17.877069	213	\N	f
2391	15	11	0	2014-02-15 10:33:17.896012	2014-02-15 10:33:17.896012	3	\N	f
2392	15	11	0	2014-02-15 10:33:17.898916	2014-02-15 10:33:17.898916	4	\N	f
2393	15	11	0	2014-02-15 10:33:17.901808	2014-02-15 10:33:17.901808	5	\N	f
2394	15	11	2	2014-02-15 10:33:17.904695	2014-02-15 10:33:17.904695	6	\N	f
2395	16	11	0	2014-02-15 10:33:17.909702	2014-02-15 10:33:17.909702	7	\N	f
2396	16	11	2	2014-02-15 10:33:17.912661	2014-02-15 10:33:17.912661	8	\N	f
2397	16	11	0	2014-02-15 10:33:17.915523	2014-02-15 10:33:17.915523	9	\N	f
2398	16	11	0	2014-02-15 10:33:17.918387	2014-02-15 10:33:17.918387	10	\N	f
2399	17	11	0	2014-02-15 10:33:17.923397	2014-02-15 10:33:17.923397	11	\N	f
2400	17	11	0	2014-02-15 10:33:17.926366	2014-02-15 10:33:17.926366	12	\N	f
2401	17	11	2	2014-02-15 10:33:17.929202	2014-02-15 10:33:17.929202	13	\N	f
2402	17	11	0	2014-02-15 10:33:17.932133	2014-02-15 10:33:17.932133	14	\N	f
2403	18	11	0	2014-02-15 10:33:17.93712	2014-02-15 10:33:17.93712	15	\N	f
2404	18	11	2	2014-02-15 10:33:17.940083	2014-02-15 10:33:17.940083	16	\N	f
2405	18	11	0	2014-02-15 10:33:17.943011	2014-02-15 10:33:17.943011	17	\N	f
2406	18	11	0	2014-02-15 10:33:17.94606	2014-02-15 10:33:17.94606	18	\N	f
2407	19	11	0	2014-02-15 10:33:18.0017	2014-02-15 10:33:18.0017	19	\N	f
2408	19	11	2	2014-02-15 10:33:18.004084	2014-02-15 10:33:18.004084	20	\N	f
2409	19	11	0	2014-02-15 10:33:18.006303	2014-02-15 10:33:18.006303	21	\N	f
2410	19	11	0	2014-02-15 10:33:18.008503	2014-02-15 10:33:18.008503	22	\N	f
2411	20	11	0	2014-02-15 10:33:18.012518	2014-02-15 10:33:18.012518	23	\N	f
2412	20	11	0	2014-02-15 10:33:18.014737	2014-02-15 10:33:18.014737	24	\N	f
2413	20	11	2	2014-02-15 10:33:18.017034	2014-02-15 10:33:18.017034	25	\N	f
2414	20	11	0	2014-02-15 10:33:18.01927	2014-02-15 10:33:18.01927	26	\N	f
2415	22	11	0	2014-02-15 10:33:18.023328	2014-02-15 10:33:18.023328	31	\N	f
2416	22	11	0	2014-02-15 10:33:18.025595	2014-02-15 10:33:18.025595	32	\N	f
2417	22	11	2	2014-02-15 10:33:18.027846	2014-02-15 10:33:18.027846	33	\N	f
2418	22	11	0	2014-02-15 10:33:18.030444	2014-02-15 10:33:18.030444	34	\N	f
2419	23	11	0	2014-02-15 10:33:18.035068	2014-02-15 10:33:18.035068	35	\N	f
2420	23	11	0	2014-02-15 10:33:18.037681	2014-02-15 10:33:18.037681	36	\N	f
2421	23	11	2	2014-02-15 10:33:18.040311	2014-02-15 10:33:18.040311	37	\N	f
2422	23	11	0	2014-02-15 10:33:18.042851	2014-02-15 10:33:18.042851	38	\N	f
2423	24	11	2	2014-02-15 10:33:18.047444	2014-02-15 10:33:18.047444	39	\N	f
2424	24	11	0	2014-02-15 10:33:18.050041	2014-02-15 10:33:18.050041	40	\N	f
2425	24	11	0	2014-02-15 10:33:18.052647	2014-02-15 10:33:18.052647	41	\N	f
2426	24	11	0	2014-02-15 10:33:18.05522	2014-02-15 10:33:18.05522	42	\N	f
2427	25	11	0	2014-02-15 10:33:18.05981	2014-02-15 10:33:18.05981	43	\N	f
2428	25	11	2	2014-02-15 10:33:18.062381	2014-02-15 10:33:18.062381	44	\N	f
2429	25	11	0	2014-02-15 10:33:18.065043	2014-02-15 10:33:18.065043	45	\N	f
2430	25	11	0	2014-02-15 10:33:18.067587	2014-02-15 10:33:18.067587	46	\N	f
2431	26	11	0	2014-02-15 10:33:18.072218	2014-02-15 10:33:18.072218	47	\N	f
2432	26	11	0	2014-02-15 10:33:18.074811	2014-02-15 10:33:18.074811	48	\N	f
2433	26	11	2	2014-02-15 10:33:18.077471	2014-02-15 10:33:18.077471	49	\N	f
2434	26	11	0	2014-02-15 10:33:18.080045	2014-02-15 10:33:18.080045	50	\N	f
2435	27	11	0	2014-02-15 10:33:18.084641	2014-02-15 10:33:18.084641	51	\N	f
2436	27	11	0	2014-02-15 10:33:18.087223	2014-02-15 10:33:18.087223	52	\N	f
2437	27	11	0	2014-02-15 10:33:18.089831	2014-02-15 10:33:18.089831	53	\N	f
2438	27	11	2	2014-02-15 10:33:18.092413	2014-02-15 10:33:18.092413	54	\N	f
2439	28	11	0	2014-02-15 10:33:18.09705	2014-02-15 10:33:18.09705	55	\N	f
2440	28	11	0	2014-02-15 10:33:18.09961	2014-02-15 10:33:18.09961	56	\N	f
2441	28	11	0	2014-02-15 10:33:18.102259	2014-02-15 10:33:18.102259	57	\N	f
2442	28	11	2	2014-02-15 10:33:18.104841	2014-02-15 10:33:18.104841	58	\N	f
2443	29	11	0	2014-02-15 10:33:18.109359	2014-02-15 10:33:18.109359	59	\N	f
2444	29	11	0	2014-02-15 10:33:18.112013	2014-02-15 10:33:18.112013	60	\N	f
2445	29	11	0	2014-02-15 10:33:18.114582	2014-02-15 10:33:18.114582	61	\N	f
2446	29	11	2	2014-02-15 10:33:18.11716	2014-02-15 10:33:18.11716	62	\N	f
2447	30	11	0	2014-02-15 10:33:18.121738	2014-02-15 10:33:18.121738	63	\N	f
2448	30	11	0	2014-02-15 10:33:18.124369	2014-02-15 10:33:18.124369	64	\N	f
2449	30	11	2	2014-02-15 10:33:18.126958	2014-02-15 10:33:18.126958	65	\N	f
2450	30	11	0	2014-02-15 10:33:18.129534	2014-02-15 10:33:18.129534	66	\N	f
2451	31	11	0	2014-02-15 10:33:18.134134	2014-02-15 10:33:18.134134	67	\N	f
2452	31	11	0	2014-02-15 10:33:18.136794	2014-02-15 10:33:18.136794	68	\N	f
2453	31	11	0	2014-02-15 10:33:18.139367	2014-02-15 10:33:18.139367	69	\N	f
2454	31	11	2	2014-02-15 10:33:18.14201	2014-02-15 10:33:18.14201	70	\N	f
2455	32	11	0	2014-02-15 10:33:18.146656	2014-02-15 10:33:18.146656	71	\N	f
2456	32	11	2	2014-02-15 10:33:18.149286	2014-02-15 10:33:18.149286	72	\N	f
2457	32	11	0	2014-02-15 10:33:18.151912	2014-02-15 10:33:18.151912	73	\N	f
2458	32	11	0	2014-02-15 10:33:18.15447	2014-02-15 10:33:18.15447	74	\N	f
2459	33	11	0	2014-02-15 10:33:18.159002	2014-02-15 10:33:18.159002	75	\N	f
2460	33	11	0	2014-02-15 10:33:18.161726	2014-02-15 10:33:18.161726	76	\N	f
2461	33	11	2	2014-02-15 10:33:18.16433	2014-02-15 10:33:18.16433	77	\N	f
2462	33	11	0	2014-02-15 10:33:18.166874	2014-02-15 10:33:18.166874	78	\N	f
2463	34	11	0	2014-02-15 10:33:18.171627	2014-02-15 10:33:18.171627	79	\N	f
2464	34	11	0	2014-02-15 10:33:18.174544	2014-02-15 10:33:18.174544	80	\N	f
2465	34	11	2	2014-02-15 10:33:18.17747	2014-02-15 10:33:18.17747	81	\N	f
2466	34	11	0	2014-02-15 10:33:18.180325	2014-02-15 10:33:18.180325	82	\N	f
2467	35	11	0	2014-02-15 10:33:18.185364	2014-02-15 10:33:18.185364	83	\N	f
2468	35	11	0	2014-02-15 10:33:18.188344	2014-02-15 10:33:18.188344	84	\N	f
2469	35	11	2	2014-02-15 10:33:18.19129	2014-02-15 10:33:18.19129	85	\N	f
2470	35	11	0	2014-02-15 10:33:18.194283	2014-02-15 10:33:18.194283	86	\N	f
2471	36	11	0	2014-02-15 10:33:18.199295	2014-02-15 10:33:18.199295	87	\N	f
2472	36	11	0	2014-02-15 10:33:18.202242	2014-02-15 10:33:18.202242	88	\N	f
2473	36	11	0	2014-02-15 10:33:18.205092	2014-02-15 10:33:18.205092	89	\N	f
2474	36	11	2	2014-02-15 10:33:18.208018	2014-02-15 10:33:18.208018	90	\N	f
2475	37	11	0	2014-02-15 10:33:18.213009	2014-02-15 10:33:18.213009	91	\N	f
2476	37	11	0	2014-02-15 10:33:18.215893	2014-02-15 10:33:18.215893	92	\N	f
2477	37	11	2	2014-02-15 10:33:18.218726	2014-02-15 10:33:18.218726	93	\N	f
2478	37	11	0	2014-02-15 10:33:18.221628	2014-02-15 10:33:18.221628	94	\N	f
2479	38	11	0	2014-02-15 10:33:18.22673	2014-02-15 10:33:18.22673	95	\N	f
2480	38	11	2	2014-02-15 10:33:18.229651	2014-02-15 10:33:18.229651	96	\N	f
2481	38	11	0	2014-02-15 10:33:18.232602	2014-02-15 10:33:18.232602	97	\N	f
2482	38	11	0	2014-02-15 10:33:18.235497	2014-02-15 10:33:18.235497	98	\N	f
2483	38	11	0	2014-02-15 10:33:18.238448	2014-02-15 10:33:18.238448	99	\N	f
2484	39	11	0	2014-02-15 10:33:18.293574	2014-02-15 10:33:18.293574	100	\N	f
2485	39	11	0	2014-02-15 10:33:18.297089	2014-02-15 10:33:18.297089	101	\N	f
2486	39	11	0	2014-02-15 10:33:18.301209	2014-02-15 10:33:18.301209	102	\N	f
2487	39	11	2	2014-02-15 10:33:18.305404	2014-02-15 10:33:18.305404	103	\N	f
2488	40	11	0	2014-02-15 10:33:18.312062	2014-02-15 10:33:18.312062	104	\N	f
2489	40	11	0	2014-02-15 10:33:18.31627	2014-02-15 10:33:18.31627	105	\N	f
2490	40	11	2	2014-02-15 10:33:18.320404	2014-02-15 10:33:18.320404	106	\N	f
2491	40	11	0	2014-02-15 10:33:18.32452	2014-02-15 10:33:18.32452	107	\N	f
2492	41	11	0	2014-02-15 10:33:18.33118	2014-02-15 10:33:18.33118	108	\N	f
2493	41	11	0	2014-02-15 10:33:18.335331	2014-02-15 10:33:18.335331	109	\N	f
2494	41	11	2	2014-02-15 10:33:18.339541	2014-02-15 10:33:18.339541	110	\N	f
2495	41	11	0	2014-02-15 10:33:18.343887	2014-02-15 10:33:18.343887	111	\N	f
2496	42	11	0	2014-02-15 10:33:18.351075	2014-02-15 10:33:18.351075	112	\N	f
2497	42	11	0	2014-02-15 10:33:18.355481	2014-02-15 10:33:18.355481	113	\N	f
2498	42	11	2	2014-02-15 10:33:18.359825	2014-02-15 10:33:18.359825	114	\N	f
2499	43	11	2	2014-02-15 10:33:18.36704	2014-02-15 10:33:18.36704	115	\N	f
2500	43	11	0	2014-02-15 10:33:18.371421	2014-02-15 10:33:18.371421	116	\N	f
2501	43	11	0	2014-02-15 10:33:18.375831	2014-02-15 10:33:18.375831	117	\N	f
2502	43	11	0	2014-02-15 10:33:18.380194	2014-02-15 10:33:18.380194	118	\N	f
2503	44	11	0	2014-02-15 10:33:18.38736	2014-02-15 10:33:18.38736	119	\N	f
2504	44	11	2	2014-02-15 10:33:18.391782	2014-02-15 10:33:18.391782	120	\N	f
2505	44	11	0	2014-02-15 10:33:18.39613	2014-02-15 10:33:18.39613	121	\N	f
2506	44	11	0	2014-02-15 10:33:18.400502	2014-02-15 10:33:18.400502	122	\N	f
2507	45	11	2	2014-02-15 10:33:18.407784	2014-02-15 10:33:18.407784	123	\N	f
2508	45	11	0	2014-02-15 10:33:18.412228	2014-02-15 10:33:18.412228	124	\N	f
2509	45	11	0	2014-02-15 10:33:18.41655	2014-02-15 10:33:18.41655	125	\N	f
2510	45	11	0	2014-02-15 10:33:18.42087	2014-02-15 10:33:18.42087	126	\N	f
2511	46	11	2	2014-02-15 10:33:18.428072	2014-02-15 10:33:18.428072	127	\N	f
2512	46	11	0	2014-02-15 10:33:18.432448	2014-02-15 10:33:18.432448	128	\N	f
2513	46	11	0	2014-02-15 10:33:18.436795	2014-02-15 10:33:18.436795	129	\N	f
2514	47	11	0	2014-02-15 10:33:18.444003	2014-02-15 10:33:18.444003	130	\N	f
2515	47	11	2	2014-02-15 10:33:18.448468	2014-02-15 10:33:18.448468	131	\N	f
2516	47	11	0	2014-02-15 10:33:18.452771	2014-02-15 10:33:18.452771	132	\N	f
2517	47	11	0	2014-02-15 10:33:18.457117	2014-02-15 10:33:18.457117	133	\N	f
2518	48	11	0	2014-02-15 10:33:18.464363	2014-02-15 10:33:18.464363	134	\N	f
2519	48	11	0	2014-02-15 10:33:18.468711	2014-02-15 10:33:18.468711	135	\N	f
2520	48	11	2	2014-02-15 10:33:18.473073	2014-02-15 10:33:18.473073	136	\N	f
2521	48	11	0	2014-02-15 10:33:18.477484	2014-02-15 10:33:18.477484	137	\N	f
2522	49	11	0	2014-02-15 10:33:18.484934	2014-02-15 10:33:18.484934	138	\N	f
2523	49	11	2	2014-02-15 10:33:18.489331	2014-02-15 10:33:18.489331	139	\N	f
2524	49	11	0	2014-02-15 10:33:18.49365	2014-02-15 10:33:18.49365	140	\N	f
2525	49	11	0	2014-02-15 10:33:18.49798	2014-02-15 10:33:18.49798	141	\N	f
2526	49	11	0	2014-02-15 10:33:18.50233	2014-02-15 10:33:18.50233	142	\N	f
2527	50	11	0	2014-02-15 10:33:18.509621	2014-02-15 10:33:18.509621	143	\N	f
2528	50	11	0	2014-02-15 10:33:18.513968	2014-02-15 10:33:18.513968	144	\N	f
2529	50	11	2	2014-02-15 10:33:18.518307	2014-02-15 10:33:18.518307	145	\N	f
2530	50	11	0	2014-02-15 10:33:18.522695	2014-02-15 10:33:18.522695	146	\N	f
2531	51	11	0	2014-02-15 10:33:18.529765	2014-02-15 10:33:18.529765	147	\N	f
2532	51	11	2	2014-02-15 10:33:18.534115	2014-02-15 10:33:18.534115	148	\N	f
2533	51	11	0	2014-02-15 10:33:18.538419	2014-02-15 10:33:18.538419	149	\N	f
2534	52	11	0	2014-02-15 10:33:18.54583	2014-02-15 10:33:18.54583	150	\N	f
2535	52	11	0	2014-02-15 10:33:18.550173	2014-02-15 10:33:18.550173	151	\N	f
2536	52	11	2	2014-02-15 10:33:18.554511	2014-02-15 10:33:18.554511	152	\N	f
2537	52	11	0	2014-02-15 10:33:18.558928	2014-02-15 10:33:18.558928	153	\N	f
2538	53	11	0	2014-02-15 10:33:18.566338	2014-02-15 10:33:18.566338	154	\N	f
2539	53	11	0	2014-02-15 10:33:18.570743	2014-02-15 10:33:18.570743	155	\N	f
2540	53	11	0	2014-02-15 10:33:18.575067	2014-02-15 10:33:18.575067	156	\N	f
2541	53	11	0	2014-02-15 10:33:18.579418	2014-02-15 10:33:18.579418	157	\N	f
2542	53	11	2	2014-02-15 10:33:18.583897	2014-02-15 10:33:18.583897	158	\N	f
2543	54	11	2	2014-02-15 10:33:18.591136	2014-02-15 10:33:18.591136	159	\N	f
2544	54	11	0	2014-02-15 10:33:18.59555	2014-02-15 10:33:18.59555	160	\N	f
2545	54	11	0	2014-02-15 10:33:18.599974	2014-02-15 10:33:18.599974	161	\N	f
2546	54	11	0	2014-02-15 10:33:18.604387	2014-02-15 10:33:18.604387	162	\N	f
2547	55	11	0	2014-02-15 10:33:18.61157	2014-02-15 10:33:18.61157	163	\N	f
2548	55	11	0	2014-02-15 10:33:18.616041	2014-02-15 10:33:18.616041	164	\N	f
2549	55	11	2	2014-02-15 10:33:18.620425	2014-02-15 10:33:18.620425	165	\N	f
2550	55	11	0	2014-02-15 10:33:18.624767	2014-02-15 10:33:18.624767	166	\N	f
2551	56	11	0	2014-02-15 10:33:18.632051	2014-02-15 10:33:18.632051	167	\N	f
2552	56	11	0	2014-02-15 10:33:18.636441	2014-02-15 10:33:18.636441	168	\N	f
2553	56	11	2	2014-02-15 10:33:18.640879	2014-02-15 10:33:18.640879	169	\N	f
2554	56	11	0	2014-02-15 10:33:18.645252	2014-02-15 10:33:18.645252	170	\N	f
2555	57	11	2	2014-02-15 10:33:18.652633	2014-02-15 10:33:18.652633	171	\N	f
2556	57	11	0	2014-02-15 10:33:18.657087	2014-02-15 10:33:18.657087	172	\N	f
2557	57	11	0	2014-02-15 10:33:18.661637	2014-02-15 10:33:18.661637	173	\N	f
2558	57	11	0	2014-02-15 10:33:18.719937	2014-02-15 10:33:18.719937	174	\N	f
2559	58	11	0	2014-02-15 10:33:18.72594	2014-02-15 10:33:18.72594	175	\N	f
2560	58	11	2	2014-02-15 10:33:18.728402	2014-02-15 10:33:18.728402	176	\N	f
2561	58	11	0	2014-02-15 10:33:18.731221	2014-02-15 10:33:18.731221	177	\N	f
2562	58	11	0	2014-02-15 10:33:18.734096	2014-02-15 10:33:18.734096	178	\N	f
2563	59	11	0	2014-02-15 10:33:18.739146	2014-02-15 10:33:18.739146	179	\N	f
2564	59	11	0	2014-02-15 10:33:18.74205	2014-02-15 10:33:18.74205	180	\N	f
2565	59	11	2	2014-02-15 10:33:18.744906	2014-02-15 10:33:18.744906	181	\N	f
2566	59	11	0	2014-02-15 10:33:18.747792	2014-02-15 10:33:18.747792	182	\N	f
2567	59	11	0	2014-02-15 10:33:18.750642	2014-02-15 10:33:18.750642	183	\N	f
2568	60	11	0	2014-02-15 10:33:18.755657	2014-02-15 10:33:18.755657	184	\N	f
2569	60	11	2	2014-02-15 10:33:18.758536	2014-02-15 10:33:18.758536	185	\N	f
2570	60	11	0	2014-02-15 10:33:18.761562	2014-02-15 10:33:18.761562	186	\N	f
2571	60	11	0	2014-02-15 10:33:18.76439	2014-02-15 10:33:18.76439	187	\N	f
2572	60	11	0	2014-02-15 10:33:18.767222	2014-02-15 10:33:18.767222	188	\N	f
2573	61	11	2	2014-02-15 10:33:18.772372	2014-02-15 10:33:18.772372	189	\N	f
2574	61	11	0	2014-02-15 10:33:18.77524	2014-02-15 10:33:18.77524	190	\N	f
2575	61	11	0	2014-02-15 10:33:18.778098	2014-02-15 10:33:18.778098	191	\N	f
2576	61	11	0	2014-02-15 10:33:18.780929	2014-02-15 10:33:18.780929	192	\N	f
2577	61	11	0	2014-02-15 10:33:18.783838	2014-02-15 10:33:18.783838	193	\N	f
2578	62	11	0	2014-02-15 10:33:18.788766	2014-02-15 10:33:18.788766	194	\N	f
2579	62	11	2	2014-02-15 10:33:18.791634	2014-02-15 10:33:18.791634	195	\N	f
2580	62	11	0	2014-02-15 10:33:18.794574	2014-02-15 10:33:18.794574	196	\N	f
2581	63	11	0	2014-02-15 10:33:18.799437	2014-02-15 10:33:18.799437	197	\N	f
2582	63	11	2	2014-02-15 10:33:18.802335	2014-02-15 10:33:18.802335	198	\N	f
2583	64	11	2	2014-02-15 10:33:18.807222	2014-02-15 10:33:18.807222	199	\N	f
2584	64	11	0	2014-02-15 10:33:18.810192	2014-02-15 10:33:18.810192	200	\N	f
2585	64	11	0	2014-02-15 10:33:18.813037	2014-02-15 10:33:18.813037	201	\N	f
2586	65	11	0	2014-02-15 10:33:18.817987	2014-02-15 10:33:18.817987	202	\N	f
2587	65	11	0	2014-02-15 10:33:18.820891	2014-02-15 10:33:18.820891	203	\N	f
2588	65	11	2	2014-02-15 10:33:18.823721	2014-02-15 10:33:18.823721	204	\N	f
2589	65	11	0	2014-02-15 10:33:18.826579	2014-02-15 10:33:18.826579	205	\N	f
2590	66	11	0	2014-02-15 10:33:18.831545	2014-02-15 10:33:18.831545	206	\N	f
2591	66	11	0	2014-02-15 10:33:18.834465	2014-02-15 10:33:18.834465	207	\N	f
2592	66	11	2	2014-02-15 10:33:18.837362	2014-02-15 10:33:18.837362	208	\N	f
2593	66	11	0	2014-02-15 10:33:18.840208	2014-02-15 10:33:18.840208	209	\N	f
2594	68	11	0	2014-02-15 10:33:18.845034	2014-02-15 10:33:18.845034	214	\N	f
2595	68	11	2	2014-02-15 10:33:18.848003	2014-02-15 10:33:18.848003	215	\N	f
2596	69	11	0	2014-02-15 10:33:18.852955	2014-02-15 10:33:18.852955	216	\N	f
2597	69	11	0	2014-02-15 10:33:18.855872	2014-02-15 10:33:18.855872	217	\N	f
2598	69	11	2	2014-02-15 10:33:18.858734	2014-02-15 10:33:18.858734	218	\N	f
2599	69	11	0	2014-02-15 10:33:18.861609	2014-02-15 10:33:18.861609	219	\N	f
2600	70	11	0	2014-02-15 10:33:18.866481	2014-02-15 10:33:18.866481	220	\N	f
2601	70	11	0	2014-02-15 10:33:18.86942	2014-02-15 10:33:18.86942	221	\N	f
2602	70	11	2	2014-02-15 10:33:18.872294	2014-02-15 10:33:18.872294	222	\N	f
2603	71	11	0	2014-02-15 10:33:18.877264	2014-02-15 10:33:18.877264	223	\N	f
2604	71	11	0	2014-02-15 10:33:18.880161	2014-02-15 10:33:18.880161	224	\N	f
2605	71	11	2	2014-02-15 10:33:18.883222	2014-02-15 10:33:18.883222	225	\N	f
2606	72	11	0	2014-02-15 10:33:18.888182	2014-02-15 10:33:18.888182	226	\N	f
2607	72	11	0	2014-02-15 10:33:18.891026	2014-02-15 10:33:18.891026	227	\N	f
2608	72	11	2	2014-02-15 10:33:18.893934	2014-02-15 10:33:18.893934	228	\N	f
2609	73	11	2	2014-02-15 10:33:18.898866	2014-02-15 10:33:18.898866	229	\N	f
2610	73	11	0	2014-02-15 10:33:18.901737	2014-02-15 10:33:18.901737	230	\N	f
2611	73	11	0	2014-02-15 10:33:18.904608	2014-02-15 10:33:18.904608	231	\N	f
2612	74	11	0	2014-02-15 10:33:18.909458	2014-02-15 10:33:18.909458	232	\N	f
2613	74	11	2	2014-02-15 10:33:18.912353	2014-02-15 10:33:18.912353	233	\N	f
2614	74	11	0	2014-02-15 10:33:18.915236	2014-02-15 10:33:18.915236	234	\N	f
2615	75	11	0	2014-02-15 10:33:18.9203	2014-02-15 10:33:18.9203	235	\N	f
2616	75	11	0	2014-02-15 10:33:18.92315	2014-02-15 10:33:18.92315	236	\N	f
2617	75	11	2	2014-02-15 10:33:18.92602	2014-02-15 10:33:18.92602	237	\N	f
2618	76	11	0	2014-02-15 10:33:18.930993	2014-02-15 10:33:18.930993	238	\N	f
2619	76	11	2	2014-02-15 10:33:18.933896	2014-02-15 10:33:18.933896	239	\N	f
2620	76	11	0	2014-02-15 10:33:18.936764	2014-02-15 10:33:18.936764	240	\N	f
2621	76	11	0	2014-02-15 10:33:18.939617	2014-02-15 10:33:18.939617	241	\N	f
2622	21	11	0	2014-02-15 10:33:18.94475	2014-02-15 10:33:18.94475	27	\N	f
2623	21	11	2	2014-02-15 10:33:18.947633	2014-02-15 10:33:18.947633	28	\N	f
2624	21	11	0	2014-02-15 10:33:18.950547	2014-02-15 10:33:18.950547	29	\N	f
2625	21	11	0	2014-02-15 10:33:18.953475	2014-02-15 10:33:18.953475	30	\N	f
2626	67	11	0	2014-02-15 10:33:18.958582	2014-02-15 10:33:18.958582	210	\N	f
2627	67	11	0	2014-02-15 10:33:18.961597	2014-02-15 10:33:18.961597	211	\N	f
2628	67	11	0	2014-02-15 10:33:19.017	2014-02-15 10:33:19.017	212	\N	f
2629	67	11	2	2014-02-15 10:33:19.02037	2014-02-15 10:33:19.02037	213	\N	f
2630	15	12	0	2014-02-15 10:33:19.037506	2014-02-15 10:33:19.037506	3	\N	f
2631	15	12	0	2014-02-15 10:33:19.040529	2014-02-15 10:33:19.040529	4	\N	f
2632	15	12	0	2014-02-15 10:33:19.043353	2014-02-15 10:33:19.043353	5	\N	f
2633	15	12	2	2014-02-15 10:33:19.046229	2014-02-15 10:33:19.046229	6	\N	f
2634	16	12	0	2014-02-15 10:33:19.051207	2014-02-15 10:33:19.051207	7	\N	f
2635	16	12	2	2014-02-15 10:33:19.054138	2014-02-15 10:33:19.054138	8	\N	f
2636	16	12	0	2014-02-15 10:33:19.057027	2014-02-15 10:33:19.057027	9	\N	f
2637	16	12	0	2014-02-15 10:33:19.059911	2014-02-15 10:33:19.059911	10	\N	f
2638	17	12	0	2014-02-15 10:33:19.064885	2014-02-15 10:33:19.064885	11	\N	f
2639	17	12	0	2014-02-15 10:33:19.067767	2014-02-15 10:33:19.067767	12	\N	f
2640	17	12	2	2014-02-15 10:33:19.070628	2014-02-15 10:33:19.070628	13	\N	f
2641	17	12	0	2014-02-15 10:33:19.073512	2014-02-15 10:33:19.073512	14	\N	f
2642	18	12	0	2014-02-15 10:33:19.078507	2014-02-15 10:33:19.078507	15	\N	f
2643	18	12	2	2014-02-15 10:33:19.081438	2014-02-15 10:33:19.081438	16	\N	f
2644	18	12	0	2014-02-15 10:33:19.084361	2014-02-15 10:33:19.084361	17	\N	f
2645	18	12	0	2014-02-15 10:33:19.087198	2014-02-15 10:33:19.087198	18	\N	f
2646	19	12	0	2014-02-15 10:33:19.092209	2014-02-15 10:33:19.092209	19	\N	f
2647	19	12	2	2014-02-15 10:33:19.095048	2014-02-15 10:33:19.095048	20	\N	f
2648	19	12	0	2014-02-15 10:33:19.097929	2014-02-15 10:33:19.097929	21	\N	f
2649	19	12	0	2014-02-15 10:33:19.10079	2014-02-15 10:33:19.10079	22	\N	f
2650	20	12	0	2014-02-15 10:33:19.105789	2014-02-15 10:33:19.105789	23	\N	f
2651	20	12	0	2014-02-15 10:33:19.108704	2014-02-15 10:33:19.108704	24	\N	f
2652	20	12	2	2014-02-15 10:33:19.111511	2014-02-15 10:33:19.111511	25	\N	f
2653	20	12	0	2014-02-15 10:33:19.11437	2014-02-15 10:33:19.11437	26	\N	f
2654	22	12	0	2014-02-15 10:33:19.119348	2014-02-15 10:33:19.119348	31	\N	f
2655	22	12	0	2014-02-15 10:33:19.122302	2014-02-15 10:33:19.122302	32	\N	f
2656	22	12	2	2014-02-15 10:33:19.125174	2014-02-15 10:33:19.125174	33	\N	f
2657	22	12	0	2014-02-15 10:33:19.12805	2014-02-15 10:33:19.12805	34	\N	f
2658	23	12	0	2014-02-15 10:33:19.133052	2014-02-15 10:33:19.133052	35	\N	f
2659	23	12	0	2014-02-15 10:33:19.135935	2014-02-15 10:33:19.135935	36	\N	f
2660	23	12	2	2014-02-15 10:33:19.138774	2014-02-15 10:33:19.138774	37	\N	f
2661	23	12	0	2014-02-15 10:33:19.141633	2014-02-15 10:33:19.141633	38	\N	f
2662	24	12	2	2014-02-15 10:33:19.146637	2014-02-15 10:33:19.146637	39	\N	f
2663	24	12	0	2014-02-15 10:33:19.14951	2014-02-15 10:33:19.14951	40	\N	f
2664	24	12	0	2014-02-15 10:33:19.152345	2014-02-15 10:33:19.152345	41	\N	f
2665	24	12	0	2014-02-15 10:33:19.155178	2014-02-15 10:33:19.155178	42	\N	f
2666	25	12	0	2014-02-15 10:33:19.16025	2014-02-15 10:33:19.16025	43	\N	f
2667	25	12	2	2014-02-15 10:33:19.163093	2014-02-15 10:33:19.163093	44	\N	f
2668	25	12	0	2014-02-15 10:33:19.16597	2014-02-15 10:33:19.16597	45	\N	f
2669	25	12	0	2014-02-15 10:33:19.168838	2014-02-15 10:33:19.168838	46	\N	f
2670	26	12	0	2014-02-15 10:33:19.173805	2014-02-15 10:33:19.173805	47	\N	f
2671	26	12	0	2014-02-15 10:33:19.176778	2014-02-15 10:33:19.176778	48	\N	f
2672	26	12	2	2014-02-15 10:33:19.179624	2014-02-15 10:33:19.179624	49	\N	f
2673	26	12	0	2014-02-15 10:33:19.182542	2014-02-15 10:33:19.182542	50	\N	f
2674	27	12	0	2014-02-15 10:33:19.187538	2014-02-15 10:33:19.187538	51	\N	f
2675	27	12	0	2014-02-15 10:33:19.190449	2014-02-15 10:33:19.190449	52	\N	f
2676	27	12	0	2014-02-15 10:33:19.193336	2014-02-15 10:33:19.193336	53	\N	f
2677	27	12	2	2014-02-15 10:33:19.19637	2014-02-15 10:33:19.19637	54	\N	f
2678	28	12	0	2014-02-15 10:33:19.201382	2014-02-15 10:33:19.201382	55	\N	f
2679	28	12	0	2014-02-15 10:33:19.204321	2014-02-15 10:33:19.204321	56	\N	f
2680	28	12	0	2014-02-15 10:33:19.207179	2014-02-15 10:33:19.207179	57	\N	f
2681	28	12	2	2014-02-15 10:33:19.210023	2014-02-15 10:33:19.210023	58	\N	f
2682	29	12	0	2014-02-15 10:33:19.215019	2014-02-15 10:33:19.215019	59	\N	f
2683	29	12	0	2014-02-15 10:33:19.217943	2014-02-15 10:33:19.217943	60	\N	f
2684	29	12	0	2014-02-15 10:33:19.220831	2014-02-15 10:33:19.220831	61	\N	f
2685	29	12	2	2014-02-15 10:33:19.223689	2014-02-15 10:33:19.223689	62	\N	f
2686	30	12	0	2014-02-15 10:33:19.228792	2014-02-15 10:33:19.228792	63	\N	f
2687	30	12	0	2014-02-15 10:33:19.23175	2014-02-15 10:33:19.23175	64	\N	f
2688	30	12	2	2014-02-15 10:33:19.23468	2014-02-15 10:33:19.23468	65	\N	f
2689	30	12	0	2014-02-15 10:33:19.237789	2014-02-15 10:33:19.237789	66	\N	f
2690	31	12	0	2014-02-15 10:33:19.296311	2014-02-15 10:33:19.296311	67	\N	f
2691	31	12	0	2014-02-15 10:33:19.299637	2014-02-15 10:33:19.299637	68	\N	f
2692	31	12	0	2014-02-15 10:33:19.302522	2014-02-15 10:33:19.302522	69	\N	f
2693	31	12	2	2014-02-15 10:33:19.305437	2014-02-15 10:33:19.305437	70	\N	f
2694	32	12	0	2014-02-15 10:33:19.31042	2014-02-15 10:33:19.31042	71	\N	f
2695	32	12	2	2014-02-15 10:33:19.313333	2014-02-15 10:33:19.313333	72	\N	f
2696	32	12	0	2014-02-15 10:33:19.316227	2014-02-15 10:33:19.316227	73	\N	f
2697	32	12	0	2014-02-15 10:33:19.319096	2014-02-15 10:33:19.319096	74	\N	f
2698	33	12	0	2014-02-15 10:33:19.324128	2014-02-15 10:33:19.324128	75	\N	f
2699	33	12	0	2014-02-15 10:33:19.326988	2014-02-15 10:33:19.326988	76	\N	f
2700	33	12	2	2014-02-15 10:33:19.329841	2014-02-15 10:33:19.329841	77	\N	f
2701	33	12	0	2014-02-15 10:33:19.332697	2014-02-15 10:33:19.332697	78	\N	f
2702	34	12	0	2014-02-15 10:33:19.337704	2014-02-15 10:33:19.337704	79	\N	f
2703	34	12	0	2014-02-15 10:33:19.34063	2014-02-15 10:33:19.34063	80	\N	f
2704	34	12	2	2014-02-15 10:33:19.34351	2014-02-15 10:33:19.34351	81	\N	f
2705	34	12	0	2014-02-15 10:33:19.346396	2014-02-15 10:33:19.346396	82	\N	f
2706	35	12	0	2014-02-15 10:33:19.351381	2014-02-15 10:33:19.351381	83	\N	f
2707	35	12	0	2014-02-15 10:33:19.354315	2014-02-15 10:33:19.354315	84	\N	f
2708	35	12	2	2014-02-15 10:33:19.357188	2014-02-15 10:33:19.357188	85	\N	f
2709	35	12	0	2014-02-15 10:33:19.360127	2014-02-15 10:33:19.360127	86	\N	f
2710	36	12	0	2014-02-15 10:33:19.365097	2014-02-15 10:33:19.365097	87	\N	f
2711	36	12	0	2014-02-15 10:33:19.367969	2014-02-15 10:33:19.367969	88	\N	f
2712	36	12	0	2014-02-15 10:33:19.370809	2014-02-15 10:33:19.370809	89	\N	f
2713	36	12	2	2014-02-15 10:33:19.373708	2014-02-15 10:33:19.373708	90	\N	f
2714	37	12	0	2014-02-15 10:33:19.378678	2014-02-15 10:33:19.378678	91	\N	f
2715	37	12	0	2014-02-15 10:33:19.38156	2014-02-15 10:33:19.38156	92	\N	f
2716	37	12	2	2014-02-15 10:33:19.3845	2014-02-15 10:33:19.3845	93	\N	f
2717	37	12	0	2014-02-15 10:33:19.387326	2014-02-15 10:33:19.387326	94	\N	f
2718	38	12	0	2014-02-15 10:33:19.392383	2014-02-15 10:33:19.392383	95	\N	f
2719	38	12	2	2014-02-15 10:33:19.395272	2014-02-15 10:33:19.395272	96	\N	f
2720	38	12	0	2014-02-15 10:33:19.398184	2014-02-15 10:33:19.398184	97	\N	f
2721	38	12	0	2014-02-15 10:33:19.401046	2014-02-15 10:33:19.401046	98	\N	f
2722	38	12	0	2014-02-15 10:33:19.403896	2014-02-15 10:33:19.403896	99	\N	f
2723	39	12	0	2014-02-15 10:33:19.408898	2014-02-15 10:33:19.408898	100	\N	f
2724	39	12	0	2014-02-15 10:33:19.411825	2014-02-15 10:33:19.411825	101	\N	f
2725	39	12	0	2014-02-15 10:33:19.414669	2014-02-15 10:33:19.414669	102	\N	f
2726	39	12	2	2014-02-15 10:33:19.417491	2014-02-15 10:33:19.417491	103	\N	f
2727	40	12	0	2014-02-15 10:33:19.422606	2014-02-15 10:33:19.422606	104	\N	f
2728	40	12	0	2014-02-15 10:33:19.425486	2014-02-15 10:33:19.425486	105	\N	f
2729	40	12	2	2014-02-15 10:33:19.42835	2014-02-15 10:33:19.42835	106	\N	f
2730	40	12	0	2014-02-15 10:33:19.431184	2014-02-15 10:33:19.431184	107	\N	f
2731	41	12	0	2014-02-15 10:33:19.436283	2014-02-15 10:33:19.436283	108	\N	f
2732	41	12	0	2014-02-15 10:33:19.439123	2014-02-15 10:33:19.439123	109	\N	f
2733	41	12	2	2014-02-15 10:33:19.441989	2014-02-15 10:33:19.441989	110	\N	f
2734	41	12	0	2014-02-15 10:33:19.44487	2014-02-15 10:33:19.44487	111	\N	f
2735	42	12	0	2014-02-15 10:33:19.449806	2014-02-15 10:33:19.449806	112	\N	f
2736	42	12	0	2014-02-15 10:33:19.45272	2014-02-15 10:33:19.45272	113	\N	f
2737	42	12	2	2014-02-15 10:33:19.455561	2014-02-15 10:33:19.455561	114	\N	f
2738	43	12	2	2014-02-15 10:33:19.460834	2014-02-15 10:33:19.460834	115	\N	f
2739	43	12	0	2014-02-15 10:33:19.46368	2014-02-15 10:33:19.46368	116	\N	f
2740	43	12	0	2014-02-15 10:33:19.466534	2014-02-15 10:33:19.466534	117	\N	f
2741	43	12	0	2014-02-15 10:33:19.469423	2014-02-15 10:33:19.469423	118	\N	f
2742	44	12	0	2014-02-15 10:33:19.474414	2014-02-15 10:33:19.474414	119	\N	f
2743	44	12	2	2014-02-15 10:33:19.477299	2014-02-15 10:33:19.477299	120	\N	f
2744	44	12	0	2014-02-15 10:33:19.480222	2014-02-15 10:33:19.480222	121	\N	f
2745	44	12	0	2014-02-15 10:33:19.483062	2014-02-15 10:33:19.483062	122	\N	f
2746	45	12	2	2014-02-15 10:33:19.488082	2014-02-15 10:33:19.488082	123	\N	f
2747	45	12	0	2014-02-15 10:33:19.490952	2014-02-15 10:33:19.490952	124	\N	f
2748	45	12	0	2014-02-15 10:33:19.493867	2014-02-15 10:33:19.493867	125	\N	f
2749	45	12	0	2014-02-15 10:33:19.496706	2014-02-15 10:33:19.496706	126	\N	f
2750	46	12	2	2014-02-15 10:33:19.501636	2014-02-15 10:33:19.501636	127	\N	f
2751	46	12	0	2014-02-15 10:33:19.504555	2014-02-15 10:33:19.504555	128	\N	f
2752	46	12	0	2014-02-15 10:33:19.507423	2014-02-15 10:33:19.507423	129	\N	f
2753	47	12	0	2014-02-15 10:33:19.512518	2014-02-15 10:33:19.512518	130	\N	f
2754	47	12	2	2014-02-15 10:33:19.515484	2014-02-15 10:33:19.515484	131	\N	f
2755	47	12	0	2014-02-15 10:33:19.570303	2014-02-15 10:33:19.570303	132	\N	f
2756	47	12	0	2014-02-15 10:33:19.573721	2014-02-15 10:33:19.573721	133	\N	f
2757	48	12	0	2014-02-15 10:33:19.581051	2014-02-15 10:33:19.581051	134	\N	f
2758	48	12	0	2014-02-15 10:33:19.585336	2014-02-15 10:33:19.585336	135	\N	f
2759	48	12	2	2014-02-15 10:33:19.589677	2014-02-15 10:33:19.589677	136	\N	f
2760	48	12	0	2014-02-15 10:33:19.593939	2014-02-15 10:33:19.593939	137	\N	f
2761	49	12	0	2014-02-15 10:33:19.601246	2014-02-15 10:33:19.601246	138	\N	f
2762	49	12	2	2014-02-15 10:33:19.60559	2014-02-15 10:33:19.60559	139	\N	f
2763	49	12	0	2014-02-15 10:33:19.609861	2014-02-15 10:33:19.609861	140	\N	f
2764	49	12	0	2014-02-15 10:33:19.614162	2014-02-15 10:33:19.614162	141	\N	f
2765	49	12	0	2014-02-15 10:33:19.618429	2014-02-15 10:33:19.618429	142	\N	f
2766	50	12	0	2014-02-15 10:33:19.625596	2014-02-15 10:33:19.625596	143	\N	f
2767	50	12	0	2014-02-15 10:33:19.62995	2014-02-15 10:33:19.62995	144	\N	f
2768	50	12	2	2014-02-15 10:33:19.634218	2014-02-15 10:33:19.634218	145	\N	f
2769	50	12	0	2014-02-15 10:33:19.63852	2014-02-15 10:33:19.63852	146	\N	f
2770	51	12	0	2014-02-15 10:33:19.645575	2014-02-15 10:33:19.645575	147	\N	f
2771	51	12	2	2014-02-15 10:33:19.649899	2014-02-15 10:33:19.649899	148	\N	f
2772	51	12	0	2014-02-15 10:33:19.65425	2014-02-15 10:33:19.65425	149	\N	f
2773	52	12	0	2014-02-15 10:33:19.661642	2014-02-15 10:33:19.661642	150	\N	f
2774	52	12	0	2014-02-15 10:33:19.665947	2014-02-15 10:33:19.665947	151	\N	f
2775	52	12	2	2014-02-15 10:33:19.670287	2014-02-15 10:33:19.670287	152	\N	f
2776	52	12	0	2014-02-15 10:33:19.674568	2014-02-15 10:33:19.674568	153	\N	f
2777	53	12	0	2014-02-15 10:33:19.68193	2014-02-15 10:33:19.68193	154	\N	f
2778	53	12	0	2014-02-15 10:33:19.686213	2014-02-15 10:33:19.686213	155	\N	f
2779	53	12	0	2014-02-15 10:33:19.690467	2014-02-15 10:33:19.690467	156	\N	f
2780	53	12	0	2014-02-15 10:33:19.694799	2014-02-15 10:33:19.694799	157	\N	f
2781	53	12	2	2014-02-15 10:33:19.699112	2014-02-15 10:33:19.699112	158	\N	f
2782	54	12	2	2014-02-15 10:33:19.706333	2014-02-15 10:33:19.706333	159	\N	f
2783	54	12	0	2014-02-15 10:33:19.710619	2014-02-15 10:33:19.710619	160	\N	f
2784	54	12	0	2014-02-15 10:33:19.715001	2014-02-15 10:33:19.715001	161	\N	f
2785	54	12	0	2014-02-15 10:33:19.719345	2014-02-15 10:33:19.719345	162	\N	f
2786	55	12	0	2014-02-15 10:33:19.726579	2014-02-15 10:33:19.726579	163	\N	f
2787	55	12	0	2014-02-15 10:33:19.730946	2014-02-15 10:33:19.730946	164	\N	f
2788	55	12	2	2014-02-15 10:33:19.735257	2014-02-15 10:33:19.735257	165	\N	f
2789	55	12	0	2014-02-15 10:33:19.739519	2014-02-15 10:33:19.739519	166	\N	f
2790	56	12	0	2014-02-15 10:33:19.746829	2014-02-15 10:33:19.746829	167	\N	f
2791	56	12	0	2014-02-15 10:33:19.75113	2014-02-15 10:33:19.75113	168	\N	f
2792	56	12	2	2014-02-15 10:33:19.755425	2014-02-15 10:33:19.755425	169	\N	f
2793	56	12	0	2014-02-15 10:33:19.759825	2014-02-15 10:33:19.759825	170	\N	f
2794	57	12	2	2014-02-15 10:33:19.766905	2014-02-15 10:33:19.766905	171	\N	f
2795	57	12	0	2014-02-15 10:33:19.77127	2014-02-15 10:33:19.77127	172	\N	f
2796	57	12	0	2014-02-15 10:33:19.775574	2014-02-15 10:33:19.775574	173	\N	f
2797	57	12	0	2014-02-15 10:33:19.779947	2014-02-15 10:33:19.779947	174	\N	f
2798	58	12	0	2014-02-15 10:33:19.787023	2014-02-15 10:33:19.787023	175	\N	f
2799	58	12	2	2014-02-15 10:33:19.791374	2014-02-15 10:33:19.791374	176	\N	f
2800	58	12	0	2014-02-15 10:33:19.795709	2014-02-15 10:33:19.795709	177	\N	f
2801	58	12	0	2014-02-15 10:33:19.799968	2014-02-15 10:33:19.799968	178	\N	f
2802	59	12	0	2014-02-15 10:33:19.80736	2014-02-15 10:33:19.80736	179	\N	f
2803	59	12	0	2014-02-15 10:33:19.811648	2014-02-15 10:33:19.811648	180	\N	f
2804	59	12	2	2014-02-15 10:33:19.816025	2014-02-15 10:33:19.816025	181	\N	f
2805	59	12	0	2014-02-15 10:33:19.820385	2014-02-15 10:33:19.820385	182	\N	f
2806	59	12	0	2014-02-15 10:33:19.824666	2014-02-15 10:33:19.824666	183	\N	f
2807	60	12	0	2014-02-15 10:33:19.831921	2014-02-15 10:33:19.831921	184	\N	f
2808	60	12	2	2014-02-15 10:33:19.836321	2014-02-15 10:33:19.836321	185	\N	f
2809	60	12	0	2014-02-15 10:33:19.840669	2014-02-15 10:33:19.840669	186	\N	f
2810	60	12	0	2014-02-15 10:33:19.844987	2014-02-15 10:33:19.844987	187	\N	f
2811	60	12	0	2014-02-15 10:33:19.849222	2014-02-15 10:33:19.849222	188	\N	f
2812	61	12	2	2014-02-15 10:33:19.856491	2014-02-15 10:33:19.856491	189	\N	f
2813	61	12	0	2014-02-15 10:33:19.860916	2014-02-15 10:33:19.860916	190	\N	f
2814	61	12	0	2014-02-15 10:33:19.865235	2014-02-15 10:33:19.865235	191	\N	f
2815	61	12	0	2014-02-15 10:33:19.86967	2014-02-15 10:33:19.86967	192	\N	f
2816	61	12	0	2014-02-15 10:33:19.873943	2014-02-15 10:33:19.873943	193	\N	f
2817	62	12	0	2014-02-15 10:33:19.881028	2014-02-15 10:33:19.881028	194	\N	f
2818	62	12	2	2014-02-15 10:33:19.885289	2014-02-15 10:33:19.885289	195	\N	f
2819	62	12	0	2014-02-15 10:33:19.889649	2014-02-15 10:33:19.889649	196	\N	f
2820	63	12	0	2014-02-15 10:33:19.896605	2014-02-15 10:33:19.896605	197	\N	f
2821	63	12	2	2014-02-15 10:33:19.900909	2014-02-15 10:33:19.900909	198	\N	f
2822	64	12	2	2014-02-15 10:33:19.907982	2014-02-15 10:33:19.907982	199	\N	f
2823	64	12	0	2014-02-15 10:33:19.912394	2014-02-15 10:33:19.912394	200	\N	f
2824	64	12	0	2014-02-15 10:33:19.916636	2014-02-15 10:33:19.916636	201	\N	f
2825	65	12	0	2014-02-15 10:33:19.923791	2014-02-15 10:33:19.923791	202	\N	f
2826	65	12	0	2014-02-15 10:33:19.928187	2014-02-15 10:33:19.928187	203	\N	f
2827	65	12	2	2014-02-15 10:33:19.932464	2014-02-15 10:33:19.932464	204	\N	f
2828	65	12	0	2014-02-15 10:33:19.936841	2014-02-15 10:33:19.936841	205	\N	f
2829	66	12	0	2014-02-15 10:33:19.94404	2014-02-15 10:33:19.94404	206	\N	f
2830	66	12	0	2014-02-15 10:33:19.948376	2014-02-15 10:33:19.948376	207	\N	f
2831	66	12	2	2014-02-15 10:33:19.952702	2014-02-15 10:33:19.952702	208	\N	f
2832	66	12	0	2014-02-15 10:33:19.956968	2014-02-15 10:33:19.956968	209	\N	f
2833	68	12	0	2014-02-15 10:33:19.963891	2014-02-15 10:33:19.963891	214	\N	f
2834	68	12	2	2014-02-15 10:33:19.968182	2014-02-15 10:33:19.968182	215	\N	f
2835	69	12	0	2014-02-15 10:33:19.975437	2014-02-15 10:33:19.975437	216	\N	f
2836	69	12	0	2014-02-15 10:33:19.979718	2014-02-15 10:33:19.979718	217	\N	f
2837	69	12	2	2014-02-15 10:33:19.984049	2014-02-15 10:33:19.984049	218	\N	f
2838	69	12	0	2014-02-15 10:33:19.988508	2014-02-15 10:33:19.988508	219	\N	f
2839	70	12	0	2014-02-15 10:33:19.995566	2014-02-15 10:33:19.995566	220	\N	f
2840	70	12	0	2014-02-15 10:33:19.999947	2014-02-15 10:33:19.999947	221	\N	f
2841	70	12	2	2014-02-15 10:33:20.004602	2014-02-15 10:33:20.004602	222	\N	f
2842	71	12	0	2014-02-15 10:33:20.011805	2014-02-15 10:33:20.011805	223	\N	f
2843	71	12	0	2014-02-15 10:33:20.016138	2014-02-15 10:33:20.016138	224	\N	f
2844	71	12	2	2014-02-15 10:33:20.020692	2014-02-15 10:33:20.020692	225	\N	f
2845	72	12	0	2014-02-15 10:33:20.025764	2014-02-15 10:33:20.025764	226	\N	f
2846	72	12	0	2014-02-15 10:33:20.027999	2014-02-15 10:33:20.027999	227	\N	f
2847	72	12	2	2014-02-15 10:33:20.030191	2014-02-15 10:33:20.030191	228	\N	f
2848	73	12	2	2014-02-15 10:33:20.034842	2014-02-15 10:33:20.034842	229	\N	f
2849	73	12	0	2014-02-15 10:33:20.037691	2014-02-15 10:33:20.037691	230	\N	f
2850	73	12	0	2014-02-15 10:33:20.040578	2014-02-15 10:33:20.040578	231	\N	f
2851	74	12	0	2014-02-15 10:33:20.045476	2014-02-15 10:33:20.045476	232	\N	f
2852	74	12	2	2014-02-15 10:33:20.0483	2014-02-15 10:33:20.0483	233	\N	f
2853	74	12	0	2014-02-15 10:33:20.051115	2014-02-15 10:33:20.051115	234	\N	f
2854	75	12	0	2014-02-15 10:33:20.056174	2014-02-15 10:33:20.056174	235	\N	f
2855	75	12	0	2014-02-15 10:33:20.05898	2014-02-15 10:33:20.05898	236	\N	f
2856	75	12	2	2014-02-15 10:33:20.061927	2014-02-15 10:33:20.061927	237	\N	f
2857	76	12	0	2014-02-15 10:33:20.066902	2014-02-15 10:33:20.066902	238	\N	f
2858	76	12	2	2014-02-15 10:33:20.069956	2014-02-15 10:33:20.069956	239	\N	f
2859	76	12	0	2014-02-15 10:33:20.073048	2014-02-15 10:33:20.073048	240	\N	f
2860	76	12	0	2014-02-15 10:33:20.076066	2014-02-15 10:33:20.076066	241	\N	f
2861	21	12	0	2014-02-15 10:33:20.081204	2014-02-15 10:33:20.081204	27	\N	f
2862	21	12	2	2014-02-15 10:33:20.084882	2014-02-15 10:33:20.084882	28	\N	f
2863	21	12	0	2014-02-15 10:33:20.089241	2014-02-15 10:33:20.089241	29	\N	f
2864	21	12	0	2014-02-15 10:33:20.09362	2014-02-15 10:33:20.09362	30	\N	f
2865	67	12	0	2014-02-15 10:33:20.100939	2014-02-15 10:33:20.100939	210	\N	f
2866	67	12	0	2014-02-15 10:33:20.10537	2014-02-15 10:33:20.10537	211	\N	f
2867	67	12	0	2014-02-15 10:33:20.109659	2014-02-15 10:33:20.109659	212	\N	f
2868	67	12	2	2014-02-15 10:33:20.114047	2014-02-15 10:33:20.114047	213	\N	f
2869	15	13	0	2014-02-15 10:33:20.141979	2014-02-15 10:33:20.141979	3	\N	f
2870	15	13	0	2014-02-15 10:33:20.146468	2014-02-15 10:33:20.146468	4	\N	f
2871	15	13	0	2014-02-15 10:33:20.150726	2014-02-15 10:33:20.150726	5	\N	f
2872	15	13	2	2014-02-15 10:33:20.155092	2014-02-15 10:33:20.155092	6	\N	f
2873	16	13	0	2014-02-15 10:33:20.162269	2014-02-15 10:33:20.162269	7	\N	f
2874	16	13	2	2014-02-15 10:33:20.166576	2014-02-15 10:33:20.166576	8	\N	f
2875	16	13	0	2014-02-15 10:33:20.17095	2014-02-15 10:33:20.17095	9	\N	f
2876	16	13	0	2014-02-15 10:33:20.175194	2014-02-15 10:33:20.175194	10	\N	f
2877	17	13	0	2014-02-15 10:33:20.182359	2014-02-15 10:33:20.182359	11	\N	f
2878	17	13	0	2014-02-15 10:33:20.186666	2014-02-15 10:33:20.186666	12	\N	f
2879	17	13	2	2014-02-15 10:33:20.190975	2014-02-15 10:33:20.190975	13	\N	f
2880	17	13	0	2014-02-15 10:33:20.195207	2014-02-15 10:33:20.195207	14	\N	f
2881	18	13	0	2014-02-15 10:33:20.202484	2014-02-15 10:33:20.202484	15	\N	f
2882	18	13	2	2014-02-15 10:33:20.206765	2014-02-15 10:33:20.206765	16	\N	f
2883	18	13	0	2014-02-15 10:33:20.211051	2014-02-15 10:33:20.211051	17	\N	f
2884	18	13	0	2014-02-15 10:33:20.215392	2014-02-15 10:33:20.215392	18	\N	f
2885	19	13	0	2014-02-15 10:33:20.222587	2014-02-15 10:33:20.222587	19	\N	f
2886	19	13	2	2014-02-15 10:33:20.226935	2014-02-15 10:33:20.226935	20	\N	f
2887	19	13	0	2014-02-15 10:33:20.231259	2014-02-15 10:33:20.231259	21	\N	f
2888	19	13	0	2014-02-15 10:33:20.235502	2014-02-15 10:33:20.235502	22	\N	f
2889	20	13	0	2014-02-15 10:33:20.242725	2014-02-15 10:33:20.242725	23	\N	f
2890	20	13	0	2014-02-15 10:33:20.247098	2014-02-15 10:33:20.247098	24	\N	f
2891	20	13	2	2014-02-15 10:33:20.251618	2014-02-15 10:33:20.251618	25	\N	f
2892	20	13	0	2014-02-15 10:33:20.255905	2014-02-15 10:33:20.255905	26	\N	f
2893	22	13	0	2014-02-15 10:33:20.263142	2014-02-15 10:33:20.263142	31	\N	f
2894	22	13	0	2014-02-15 10:33:20.267439	2014-02-15 10:33:20.267439	32	\N	f
2895	22	13	2	2014-02-15 10:33:20.271694	2014-02-15 10:33:20.271694	33	\N	f
2896	22	13	0	2014-02-15 10:33:20.276109	2014-02-15 10:33:20.276109	34	\N	f
2897	23	13	0	2014-02-15 10:33:20.283214	2014-02-15 10:33:20.283214	35	\N	f
2898	23	13	0	2014-02-15 10:33:20.287525	2014-02-15 10:33:20.287525	36	\N	f
2899	23	13	2	2014-02-15 10:33:20.291888	2014-02-15 10:33:20.291888	37	\N	f
2900	23	13	0	2014-02-15 10:33:20.296199	2014-02-15 10:33:20.296199	38	\N	f
2901	24	13	2	2014-02-15 10:33:20.303256	2014-02-15 10:33:20.303256	39	\N	f
2902	24	13	0	2014-02-15 10:33:20.30764	2014-02-15 10:33:20.30764	40	\N	f
2903	24	13	0	2014-02-15 10:33:20.312205	2014-02-15 10:33:20.312205	41	\N	f
2904	24	13	0	2014-02-15 10:33:20.316473	2014-02-15 10:33:20.316473	42	\N	f
2905	25	13	0	2014-02-15 10:33:20.323822	2014-02-15 10:33:20.323822	43	\N	f
2906	25	13	2	2014-02-15 10:33:20.328095	2014-02-15 10:33:20.328095	44	\N	f
2907	25	13	0	2014-02-15 10:33:20.332459	2014-02-15 10:33:20.332459	45	\N	f
2908	25	13	0	2014-02-15 10:33:20.336767	2014-02-15 10:33:20.336767	46	\N	f
2909	26	13	0	2014-02-15 10:33:20.344048	2014-02-15 10:33:20.344048	47	\N	f
2910	26	13	0	2014-02-15 10:33:20.348376	2014-02-15 10:33:20.348376	48	\N	f
2911	26	13	2	2014-02-15 10:33:20.352645	2014-02-15 10:33:20.352645	49	\N	f
2912	26	13	0	2014-02-15 10:33:20.356962	2014-02-15 10:33:20.356962	50	\N	f
2913	27	13	0	2014-02-15 10:33:20.364161	2014-02-15 10:33:20.364161	51	\N	f
2914	27	13	0	2014-02-15 10:33:20.368558	2014-02-15 10:33:20.368558	52	\N	f
2915	27	13	0	2014-02-15 10:33:20.372798	2014-02-15 10:33:20.372798	53	\N	f
2916	27	13	2	2014-02-15 10:33:20.377124	2014-02-15 10:33:20.377124	54	\N	f
2917	28	13	0	2014-02-15 10:33:20.384267	2014-02-15 10:33:20.384267	55	\N	f
2918	28	13	0	2014-02-15 10:33:20.388547	2014-02-15 10:33:20.388547	56	\N	f
2919	28	13	0	2014-02-15 10:33:20.392932	2014-02-15 10:33:20.392932	57	\N	f
2920	28	13	2	2014-02-15 10:33:20.397166	2014-02-15 10:33:20.397166	58	\N	f
2921	29	13	0	2014-02-15 10:33:20.404407	2014-02-15 10:33:20.404407	59	\N	f
2922	29	13	0	2014-02-15 10:33:20.408718	2014-02-15 10:33:20.408718	60	\N	f
2923	29	13	0	2014-02-15 10:33:20.41297	2014-02-15 10:33:20.41297	61	\N	f
2924	29	13	2	2014-02-15 10:33:20.417318	2014-02-15 10:33:20.417318	62	\N	f
2925	30	13	0	2014-02-15 10:33:20.424444	2014-02-15 10:33:20.424444	63	\N	f
2926	30	13	0	2014-02-15 10:33:20.428776	2014-02-15 10:33:20.428776	64	\N	f
2927	30	13	2	2014-02-15 10:33:20.433081	2014-02-15 10:33:20.433081	65	\N	f
2928	30	13	0	2014-02-15 10:33:20.43734	2014-02-15 10:33:20.43734	66	\N	f
2929	31	13	0	2014-02-15 10:33:20.44453	2014-02-15 10:33:20.44453	67	\N	f
2930	31	13	0	2014-02-15 10:33:20.44892	2014-02-15 10:33:20.44892	68	\N	f
2931	31	13	0	2014-02-15 10:33:20.453225	2014-02-15 10:33:20.453225	69	\N	f
2932	31	13	2	2014-02-15 10:33:20.457456	2014-02-15 10:33:20.457456	70	\N	f
2933	32	13	0	2014-02-15 10:33:20.46463	2014-02-15 10:33:20.46463	71	\N	f
2934	32	13	2	2014-02-15 10:33:20.469007	2014-02-15 10:33:20.469007	72	\N	f
2935	32	13	0	2014-02-15 10:33:20.473249	2014-02-15 10:33:20.473249	73	\N	f
2936	32	13	0	2014-02-15 10:33:20.477514	2014-02-15 10:33:20.477514	74	\N	f
2937	33	13	0	2014-02-15 10:33:20.484786	2014-02-15 10:33:20.484786	75	\N	f
2938	33	13	0	2014-02-15 10:33:20.48911	2014-02-15 10:33:20.48911	76	\N	f
2939	33	13	2	2014-02-15 10:33:20.493412	2014-02-15 10:33:20.493412	77	\N	f
2940	33	13	0	2014-02-15 10:33:20.497641	2014-02-15 10:33:20.497641	78	\N	f
2941	34	13	0	2014-02-15 10:33:20.504825	2014-02-15 10:33:20.504825	79	\N	f
2942	34	13	0	2014-02-15 10:33:20.509154	2014-02-15 10:33:20.509154	80	\N	f
2943	34	13	2	2014-02-15 10:33:20.513427	2014-02-15 10:33:20.513427	81	\N	f
2944	34	13	0	2014-02-15 10:33:20.517762	2014-02-15 10:33:20.517762	82	\N	f
2945	35	13	0	2014-02-15 10:33:20.524969	2014-02-15 10:33:20.524969	83	\N	f
2946	35	13	0	2014-02-15 10:33:20.52924	2014-02-15 10:33:20.52924	84	\N	f
2947	35	13	2	2014-02-15 10:33:20.533537	2014-02-15 10:33:20.533537	85	\N	f
2948	35	13	0	2014-02-15 10:33:20.537869	2014-02-15 10:33:20.537869	86	\N	f
2949	36	13	0	2014-02-15 10:33:20.545094	2014-02-15 10:33:20.545094	87	\N	f
2950	36	13	0	2014-02-15 10:33:20.549492	2014-02-15 10:33:20.549492	88	\N	f
2951	36	13	0	2014-02-15 10:33:20.553721	2014-02-15 10:33:20.553721	89	\N	f
2952	36	13	2	2014-02-15 10:33:20.558021	2014-02-15 10:33:20.558021	90	\N	f
2953	37	13	0	2014-02-15 10:33:20.565184	2014-02-15 10:33:20.565184	91	\N	f
2954	37	13	0	2014-02-15 10:33:20.56942	2014-02-15 10:33:20.56942	92	\N	f
2955	37	13	2	2014-02-15 10:33:20.573776	2014-02-15 10:33:20.573776	93	\N	f
2956	37	13	0	2014-02-15 10:33:20.57799	2014-02-15 10:33:20.57799	94	\N	f
2957	38	13	0	2014-02-15 10:33:20.585383	2014-02-15 10:33:20.585383	95	\N	f
2958	38	13	2	2014-02-15 10:33:20.58966	2014-02-15 10:33:20.58966	96	\N	f
2959	38	13	0	2014-02-15 10:33:20.593986	2014-02-15 10:33:20.593986	97	\N	f
2960	38	13	0	2014-02-15 10:33:20.59825	2014-02-15 10:33:20.59825	98	\N	f
2961	38	13	0	2014-02-15 10:33:20.60258	2014-02-15 10:33:20.60258	99	\N	f
2962	39	13	0	2014-02-15 10:33:20.609717	2014-02-15 10:33:20.609717	100	\N	f
2963	39	13	0	2014-02-15 10:33:20.613961	2014-02-15 10:33:20.613961	101	\N	f
2964	39	13	0	2014-02-15 10:33:20.618271	2014-02-15 10:33:20.618271	102	\N	f
2965	39	13	2	2014-02-15 10:33:20.62253	2014-02-15 10:33:20.62253	103	\N	f
2966	40	13	0	2014-02-15 10:33:20.62979	2014-02-15 10:33:20.62979	104	\N	f
2967	40	13	0	2014-02-15 10:33:20.634066	2014-02-15 10:33:20.634066	105	\N	f
2968	40	13	2	2014-02-15 10:33:20.638389	2014-02-15 10:33:20.638389	106	\N	f
2969	40	13	0	2014-02-15 10:33:20.642625	2014-02-15 10:33:20.642625	107	\N	f
2970	41	13	0	2014-02-15 10:33:20.649861	2014-02-15 10:33:20.649861	108	\N	f
2971	41	13	0	2014-02-15 10:33:20.654497	2014-02-15 10:33:20.654497	109	\N	f
2972	41	13	2	2014-02-15 10:33:20.658767	2014-02-15 10:33:20.658767	110	\N	f
2973	41	13	0	2014-02-15 10:33:20.663099	2014-02-15 10:33:20.663099	111	\N	f
2974	42	13	0	2014-02-15 10:33:20.670162	2014-02-15 10:33:20.670162	112	\N	f
2975	42	13	0	2014-02-15 10:33:20.674545	2014-02-15 10:33:20.674545	113	\N	f
2976	42	13	2	2014-02-15 10:33:20.678794	2014-02-15 10:33:20.678794	114	\N	f
2977	43	13	2	2014-02-15 10:33:20.686065	2014-02-15 10:33:20.686065	115	\N	f
2978	43	13	0	2014-02-15 10:33:20.69036	2014-02-15 10:33:20.69036	116	\N	f
2979	43	13	0	2014-02-15 10:33:20.694718	2014-02-15 10:33:20.694718	117	\N	f
2980	43	13	0	2014-02-15 10:33:20.698965	2014-02-15 10:33:20.698965	118	\N	f
2981	44	13	0	2014-02-15 10:33:20.70613	2014-02-15 10:33:20.70613	119	\N	f
2982	44	13	2	2014-02-15 10:33:20.71042	2014-02-15 10:33:20.71042	120	\N	f
2983	44	13	0	2014-02-15 10:33:20.714748	2014-02-15 10:33:20.714748	121	\N	f
2984	44	13	0	2014-02-15 10:33:20.719034	2014-02-15 10:33:20.719034	122	\N	f
2985	45	13	2	2014-02-15 10:33:20.726213	2014-02-15 10:33:20.726213	123	\N	f
2986	45	13	0	2014-02-15 10:33:20.730617	2014-02-15 10:33:20.730617	124	\N	f
2987	45	13	0	2014-02-15 10:33:20.734847	2014-02-15 10:33:20.734847	125	\N	f
2988	45	13	0	2014-02-15 10:33:20.739132	2014-02-15 10:33:20.739132	126	\N	f
2989	46	13	2	2014-02-15 10:33:20.746302	2014-02-15 10:33:20.746302	127	\N	f
2990	46	13	0	2014-02-15 10:33:20.750637	2014-02-15 10:33:20.750637	128	\N	f
2991	46	13	0	2014-02-15 10:33:20.754989	2014-02-15 10:33:20.754989	129	\N	f
2992	47	13	0	2014-02-15 10:33:20.762172	2014-02-15 10:33:20.762172	130	\N	f
2993	47	13	2	2014-02-15 10:33:20.76646	2014-02-15 10:33:20.76646	131	\N	f
2994	47	13	0	2014-02-15 10:33:20.770746	2014-02-15 10:33:20.770746	132	\N	f
2995	47	13	0	2014-02-15 10:33:20.77502	2014-02-15 10:33:20.77502	133	\N	f
2996	48	13	0	2014-02-15 10:33:20.782292	2014-02-15 10:33:20.782292	134	\N	f
2997	48	13	0	2014-02-15 10:33:20.786517	2014-02-15 10:33:20.786517	135	\N	f
2998	48	13	2	2014-02-15 10:33:20.790976	2014-02-15 10:33:20.790976	136	\N	f
2999	48	13	0	2014-02-15 10:33:20.795286	2014-02-15 10:33:20.795286	137	\N	f
3000	49	13	0	2014-02-15 10:33:20.802598	2014-02-15 10:33:20.802598	138	\N	f
3001	49	13	2	2014-02-15 10:33:20.806905	2014-02-15 10:33:20.806905	139	\N	f
3002	49	13	0	2014-02-15 10:33:20.811142	2014-02-15 10:33:20.811142	140	\N	f
3003	49	13	0	2014-02-15 10:33:20.81547	2014-02-15 10:33:20.81547	141	\N	f
3004	49	13	0	2014-02-15 10:33:20.819688	2014-02-15 10:33:20.819688	142	\N	f
3005	50	13	0	2014-02-15 10:33:20.826926	2014-02-15 10:33:20.826926	143	\N	f
3006	50	13	0	2014-02-15 10:33:20.831271	2014-02-15 10:33:20.831271	144	\N	f
3007	50	13	2	2014-02-15 10:33:20.835477	2014-02-15 10:33:20.835477	145	\N	f
3008	50	13	0	2014-02-15 10:33:20.839859	2014-02-15 10:33:20.839859	146	\N	f
3009	51	13	0	2014-02-15 10:33:20.846886	2014-02-15 10:33:20.846886	147	\N	f
3010	51	13	2	2014-02-15 10:33:20.851211	2014-02-15 10:33:20.851211	148	\N	f
3011	51	13	0	2014-02-15 10:33:20.855488	2014-02-15 10:33:20.855488	149	\N	f
3012	52	13	0	2014-02-15 10:33:20.862648	2014-02-15 10:33:20.862648	150	\N	f
3013	52	13	0	2014-02-15 10:33:20.86701	2014-02-15 10:33:20.86701	151	\N	f
3014	52	13	2	2014-02-15 10:33:20.871317	2014-02-15 10:33:20.871317	152	\N	f
3015	52	13	0	2014-02-15 10:33:20.875553	2014-02-15 10:33:20.875553	153	\N	f
3016	53	13	0	2014-02-15 10:33:20.882797	2014-02-15 10:33:20.882797	154	\N	f
3017	53	13	0	2014-02-15 10:33:20.887149	2014-02-15 10:33:20.887149	155	\N	f
3018	53	13	0	2014-02-15 10:33:20.891428	2014-02-15 10:33:20.891428	156	\N	f
3019	53	13	0	2014-02-15 10:33:20.895663	2014-02-15 10:33:20.895663	157	\N	f
3020	53	13	2	2014-02-15 10:33:20.900041	2014-02-15 10:33:20.900041	158	\N	f
3021	54	13	2	2014-02-15 10:33:20.907106	2014-02-15 10:33:20.907106	159	\N	f
3022	54	13	0	2014-02-15 10:33:20.911472	2014-02-15 10:33:20.911472	160	\N	f
3023	54	13	0	2014-02-15 10:33:20.915799	2014-02-15 10:33:20.915799	161	\N	f
3024	54	13	0	2014-02-15 10:33:20.920123	2014-02-15 10:33:20.920123	162	\N	f
3025	55	13	0	2014-02-15 10:33:20.927286	2014-02-15 10:33:20.927286	163	\N	f
3026	55	13	0	2014-02-15 10:33:20.93159	2014-02-15 10:33:20.93159	164	\N	f
3027	55	13	2	2014-02-15 10:33:20.935947	2014-02-15 10:33:20.935947	165	\N	f
3028	55	13	0	2014-02-15 10:33:20.940231	2014-02-15 10:33:20.940231	166	\N	f
3029	56	13	0	2014-02-15 10:33:20.94731	2014-02-15 10:33:20.94731	167	\N	f
3030	56	13	0	2014-02-15 10:33:20.951611	2014-02-15 10:33:20.951611	168	\N	f
3031	56	13	2	2014-02-15 10:33:20.956014	2014-02-15 10:33:20.956014	169	\N	f
3032	56	13	0	2014-02-15 10:33:20.960322	2014-02-15 10:33:20.960322	170	\N	f
3033	57	13	2	2014-02-15 10:33:20.96752	2014-02-15 10:33:20.96752	171	\N	f
3034	57	13	0	2014-02-15 10:33:20.971913	2014-02-15 10:33:20.971913	172	\N	f
3035	57	13	0	2014-02-15 10:33:20.976228	2014-02-15 10:33:20.976228	173	\N	f
3036	57	13	0	2014-02-15 10:33:20.980544	2014-02-15 10:33:20.980544	174	\N	f
3037	58	13	0	2014-02-15 10:33:20.987667	2014-02-15 10:33:20.987667	175	\N	f
3038	58	13	2	2014-02-15 10:33:20.992019	2014-02-15 10:33:20.992019	176	\N	f
3039	58	13	0	2014-02-15 10:33:20.996325	2014-02-15 10:33:20.996325	177	\N	f
3040	58	13	0	2014-02-15 10:33:21.000589	2014-02-15 10:33:21.000589	178	\N	f
3041	59	13	0	2014-02-15 10:33:21.007926	2014-02-15 10:33:21.007926	179	\N	f
3042	59	13	0	2014-02-15 10:33:21.012207	2014-02-15 10:33:21.012207	180	\N	f
3043	59	13	2	2014-02-15 10:33:21.016535	2014-02-15 10:33:21.016535	181	\N	f
3044	59	13	0	2014-02-15 10:33:21.020828	2014-02-15 10:33:21.020828	182	\N	f
3045	59	13	0	2014-02-15 10:33:21.025054	2014-02-15 10:33:21.025054	183	\N	f
3046	60	13	0	2014-02-15 10:33:21.032363	2014-02-15 10:33:21.032363	184	\N	f
3047	60	13	2	2014-02-15 10:33:21.036642	2014-02-15 10:33:21.036642	185	\N	f
3048	60	13	0	2014-02-15 10:33:21.040894	2014-02-15 10:33:21.040894	186	\N	f
3049	60	13	0	2014-02-15 10:33:21.045164	2014-02-15 10:33:21.045164	187	\N	f
3050	60	13	0	2014-02-15 10:33:21.049378	2014-02-15 10:33:21.049378	188	\N	f
3051	61	13	2	2014-02-15 10:33:21.056633	2014-02-15 10:33:21.056633	189	\N	f
3052	61	13	0	2014-02-15 10:33:21.060924	2014-02-15 10:33:21.060924	190	\N	f
3053	61	13	0	2014-02-15 10:33:21.065202	2014-02-15 10:33:21.065202	191	\N	f
3054	61	13	0	2014-02-15 10:33:21.069426	2014-02-15 10:33:21.069426	192	\N	f
3055	61	13	0	2014-02-15 10:33:21.073696	2014-02-15 10:33:21.073696	193	\N	f
3056	62	13	0	2014-02-15 10:33:21.080846	2014-02-15 10:33:21.080846	194	\N	f
3057	62	13	2	2014-02-15 10:33:21.085127	2014-02-15 10:33:21.085127	195	\N	f
3058	62	13	0	2014-02-15 10:33:21.089368	2014-02-15 10:33:21.089368	196	\N	f
3059	63	13	0	2014-02-15 10:33:21.096208	2014-02-15 10:33:21.096208	197	\N	f
3060	63	13	2	2014-02-15 10:33:21.100537	2014-02-15 10:33:21.100537	198	\N	f
3061	64	13	2	2014-02-15 10:33:21.107491	2014-02-15 10:33:21.107491	199	\N	f
3062	64	13	0	2014-02-15 10:33:21.111864	2014-02-15 10:33:21.111864	200	\N	f
3063	64	13	0	2014-02-15 10:33:21.116132	2014-02-15 10:33:21.116132	201	\N	f
3064	65	13	0	2014-02-15 10:33:21.12328	2014-02-15 10:33:21.12328	202	\N	f
3065	65	13	0	2014-02-15 10:33:21.127625	2014-02-15 10:33:21.127625	203	\N	f
3066	65	13	2	2014-02-15 10:33:21.131946	2014-02-15 10:33:21.131946	204	\N	f
3067	65	13	0	2014-02-15 10:33:21.136218	2014-02-15 10:33:21.136218	205	\N	f
3068	66	13	0	2014-02-15 10:33:21.143382	2014-02-15 10:33:21.143382	206	\N	f
3069	66	13	0	2014-02-15 10:33:21.147629	2014-02-15 10:33:21.147629	207	\N	f
3070	66	13	2	2014-02-15 10:33:21.151958	2014-02-15 10:33:21.151958	208	\N	f
3071	66	13	0	2014-02-15 10:33:21.156248	2014-02-15 10:33:21.156248	209	\N	f
3072	68	13	0	2014-02-15 10:33:21.163267	2014-02-15 10:33:21.163267	214	\N	f
3073	68	13	2	2014-02-15 10:33:21.167566	2014-02-15 10:33:21.167566	215	\N	f
3074	69	13	0	2014-02-15 10:33:21.174706	2014-02-15 10:33:21.174706	216	\N	f
3075	69	13	0	2014-02-15 10:33:21.178985	2014-02-15 10:33:21.178985	217	\N	f
3076	69	13	2	2014-02-15 10:33:21.183274	2014-02-15 10:33:21.183274	218	\N	f
3077	69	13	0	2014-02-15 10:33:21.187586	2014-02-15 10:33:21.187586	219	\N	f
3078	70	13	0	2014-02-15 10:33:21.194588	2014-02-15 10:33:21.194588	220	\N	f
3079	70	13	0	2014-02-15 10:33:21.198947	2014-02-15 10:33:21.198947	221	\N	f
3080	70	13	2	2014-02-15 10:33:21.203197	2014-02-15 10:33:21.203197	222	\N	f
3081	71	13	0	2014-02-15 10:33:21.267536	2014-02-15 10:33:21.267536	223	\N	f
3082	71	13	0	2014-02-15 10:33:21.271971	2014-02-15 10:33:21.271971	224	\N	f
3083	71	13	2	2014-02-15 10:33:21.275183	2014-02-15 10:33:21.275183	225	\N	f
3084	72	13	0	2014-02-15 10:33:21.279903	2014-02-15 10:33:21.279903	226	\N	f
3085	72	13	0	2014-02-15 10:33:21.282728	2014-02-15 10:33:21.282728	227	\N	f
3086	72	13	2	2014-02-15 10:33:21.285523	2014-02-15 10:33:21.285523	228	\N	f
3087	73	13	2	2014-02-15 10:33:21.2903	2014-02-15 10:33:21.2903	229	\N	f
3088	73	13	0	2014-02-15 10:33:21.29315	2014-02-15 10:33:21.29315	230	\N	f
3089	73	13	0	2014-02-15 10:33:21.295984	2014-02-15 10:33:21.295984	231	\N	f
3090	74	13	0	2014-02-15 10:33:21.300815	2014-02-15 10:33:21.300815	232	\N	f
3091	74	13	2	2014-02-15 10:33:21.303594	2014-02-15 10:33:21.303594	233	\N	f
3092	74	13	0	2014-02-15 10:33:21.306464	2014-02-15 10:33:21.306464	234	\N	f
3093	75	13	0	2014-02-15 10:33:21.31134	2014-02-15 10:33:21.31134	235	\N	f
3094	75	13	0	2014-02-15 10:33:21.314168	2014-02-15 10:33:21.314168	236	\N	f
3095	75	13	2	2014-02-15 10:33:21.31698	2014-02-15 10:33:21.31698	237	\N	f
3096	76	13	0	2014-02-15 10:33:21.321855	2014-02-15 10:33:21.321855	238	\N	f
3097	76	13	2	2014-02-15 10:33:21.324673	2014-02-15 10:33:21.324673	239	\N	f
3098	76	13	0	2014-02-15 10:33:21.327449	2014-02-15 10:33:21.327449	240	\N	f
3099	76	13	0	2014-02-15 10:33:21.330301	2014-02-15 10:33:21.330301	241	\N	f
3100	21	13	0	2014-02-15 10:33:21.335199	2014-02-15 10:33:21.335199	27	\N	f
3101	21	13	2	2014-02-15 10:33:21.338034	2014-02-15 10:33:21.338034	28	\N	f
3102	21	13	0	2014-02-15 10:33:21.340848	2014-02-15 10:33:21.340848	29	\N	f
3103	21	13	0	2014-02-15 10:33:21.343596	2014-02-15 10:33:21.343596	30	\N	f
3104	67	13	0	2014-02-15 10:33:21.348503	2014-02-15 10:33:21.348503	210	\N	f
3105	67	13	0	2014-02-15 10:33:21.351454	2014-02-15 10:33:21.351454	211	\N	f
3106	67	13	0	2014-02-15 10:33:21.354286	2014-02-15 10:33:21.354286	212	\N	f
3107	67	13	2	2014-02-15 10:33:21.357101	2014-02-15 10:33:21.357101	213	\N	f
3108	15	14	0	2014-02-15 10:33:21.37559	2014-02-15 10:33:21.37559	3	\N	f
3109	15	14	0	2014-02-15 10:33:21.378523	2014-02-15 10:33:21.378523	4	\N	f
3110	15	14	0	2014-02-15 10:33:21.38136	2014-02-15 10:33:21.38136	5	\N	f
3111	15	14	2	2014-02-15 10:33:21.384148	2014-02-15 10:33:21.384148	6	\N	f
3112	16	14	0	2014-02-15 10:33:21.389019	2014-02-15 10:33:21.389019	7	\N	f
3113	16	14	2	2014-02-15 10:33:21.391829	2014-02-15 10:33:21.391829	8	\N	f
3114	16	14	0	2014-02-15 10:33:21.394601	2014-02-15 10:33:21.394601	9	\N	f
3115	16	14	0	2014-02-15 10:33:21.397397	2014-02-15 10:33:21.397397	10	\N	f
3116	17	14	0	2014-02-15 10:33:21.402268	2014-02-15 10:33:21.402268	11	\N	f
3117	17	14	0	2014-02-15 10:33:21.405113	2014-02-15 10:33:21.405113	12	\N	f
3118	17	14	2	2014-02-15 10:33:21.40791	2014-02-15 10:33:21.40791	13	\N	f
3119	17	14	0	2014-02-15 10:33:21.410703	2014-02-15 10:33:21.410703	14	\N	f
3120	18	14	0	2014-02-15 10:33:21.415597	2014-02-15 10:33:21.415597	15	\N	f
3121	18	14	2	2014-02-15 10:33:21.418416	2014-02-15 10:33:21.418416	16	\N	f
3122	18	14	0	2014-02-15 10:33:21.421239	2014-02-15 10:33:21.421239	17	\N	f
3123	18	14	0	2014-02-15 10:33:21.424074	2014-02-15 10:33:21.424074	18	\N	f
3124	19	14	0	2014-02-15 10:33:21.429137	2014-02-15 10:33:21.429137	19	\N	f
3125	19	14	2	2014-02-15 10:33:21.431974	2014-02-15 10:33:21.431974	20	\N	f
3126	19	14	0	2014-02-15 10:33:21.434806	2014-02-15 10:33:21.434806	21	\N	f
3127	19	14	0	2014-02-15 10:33:21.437665	2014-02-15 10:33:21.437665	22	\N	f
3128	20	14	0	2014-02-15 10:33:21.442535	2014-02-15 10:33:21.442535	23	\N	f
3129	20	14	0	2014-02-15 10:33:21.445366	2014-02-15 10:33:21.445366	24	\N	f
3130	20	14	2	2014-02-15 10:33:21.448213	2014-02-15 10:33:21.448213	25	\N	f
3131	20	14	0	2014-02-15 10:33:21.450984	2014-02-15 10:33:21.450984	26	\N	f
3132	22	14	0	2014-02-15 10:33:21.455854	2014-02-15 10:33:21.455854	31	\N	f
3133	22	14	0	2014-02-15 10:33:21.45865	2014-02-15 10:33:21.45865	32	\N	f
3134	22	14	2	2014-02-15 10:33:21.461423	2014-02-15 10:33:21.461423	33	\N	f
3135	22	14	0	2014-02-15 10:33:21.46421	2014-02-15 10:33:21.46421	34	\N	f
3136	23	14	0	2014-02-15 10:33:21.469033	2014-02-15 10:33:21.469033	35	\N	f
3137	23	14	0	2014-02-15 10:33:21.471903	2014-02-15 10:33:21.471903	36	\N	f
3138	23	14	2	2014-02-15 10:33:21.474694	2014-02-15 10:33:21.474694	37	\N	f
3139	23	14	0	2014-02-15 10:33:21.477466	2014-02-15 10:33:21.477466	38	\N	f
3140	24	14	2	2014-02-15 10:33:21.482357	2014-02-15 10:33:21.482357	39	\N	f
3141	24	14	0	2014-02-15 10:33:21.485191	2014-02-15 10:33:21.485191	40	\N	f
3142	24	14	0	2014-02-15 10:33:21.488081	2014-02-15 10:33:21.488081	41	\N	f
3143	24	14	0	2014-02-15 10:33:21.490868	2014-02-15 10:33:21.490868	42	\N	f
3144	25	14	0	2014-02-15 10:33:21.495858	2014-02-15 10:33:21.495858	43	\N	f
3145	25	14	2	2014-02-15 10:33:21.498661	2014-02-15 10:33:21.498661	44	\N	f
3146	25	14	0	2014-02-15 10:33:21.501444	2014-02-15 10:33:21.501444	45	\N	f
3147	25	14	0	2014-02-15 10:33:21.504225	2014-02-15 10:33:21.504225	46	\N	f
3148	26	14	0	2014-02-15 10:33:21.509121	2014-02-15 10:33:21.509121	47	\N	f
3149	26	14	0	2014-02-15 10:33:21.511977	2014-02-15 10:33:21.511977	48	\N	f
3150	26	14	2	2014-02-15 10:33:21.514752	2014-02-15 10:33:21.514752	49	\N	f
3151	26	14	0	2014-02-15 10:33:21.517541	2014-02-15 10:33:21.517541	50	\N	f
3152	27	14	0	2014-02-15 10:33:21.52247	2014-02-15 10:33:21.52247	51	\N	f
3153	27	14	0	2014-02-15 10:33:21.525295	2014-02-15 10:33:21.525295	52	\N	f
3154	27	14	0	2014-02-15 10:33:21.528104	2014-02-15 10:33:21.528104	53	\N	f
3155	27	14	2	2014-02-15 10:33:21.530882	2014-02-15 10:33:21.530882	54	\N	f
3156	28	14	0	2014-02-15 10:33:21.535861	2014-02-15 10:33:21.535861	55	\N	f
3157	28	14	0	2014-02-15 10:33:21.538677	2014-02-15 10:33:21.538677	56	\N	f
3158	28	14	0	2014-02-15 10:33:21.541448	2014-02-15 10:33:21.541448	57	\N	f
3159	28	14	2	2014-02-15 10:33:21.544304	2014-02-15 10:33:21.544304	58	\N	f
3160	29	14	0	2014-02-15 10:33:21.549224	2014-02-15 10:33:21.549224	59	\N	f
3161	29	14	0	2014-02-15 10:33:21.552022	2014-02-15 10:33:21.552022	60	\N	f
3162	29	14	0	2014-02-15 10:33:21.554789	2014-02-15 10:33:21.554789	61	\N	f
3163	29	14	2	2014-02-15 10:33:21.557613	2014-02-15 10:33:21.557613	62	\N	f
3164	30	14	0	2014-02-15 10:33:21.562484	2014-02-15 10:33:21.562484	63	\N	f
3165	30	14	0	2014-02-15 10:33:21.565365	2014-02-15 10:33:21.565365	64	\N	f
3166	30	14	2	2014-02-15 10:33:21.568188	2014-02-15 10:33:21.568188	65	\N	f
3167	30	14	0	2014-02-15 10:33:21.57098	2014-02-15 10:33:21.57098	66	\N	f
3168	31	14	0	2014-02-15 10:33:21.575861	2014-02-15 10:33:21.575861	67	\N	f
3169	31	14	0	2014-02-15 10:33:21.578648	2014-02-15 10:33:21.578648	68	\N	f
3170	31	14	0	2014-02-15 10:33:21.581455	2014-02-15 10:33:21.581455	69	\N	f
3171	31	14	2	2014-02-15 10:33:21.58424	2014-02-15 10:33:21.58424	70	\N	f
3172	32	14	0	2014-02-15 10:33:21.589133	2014-02-15 10:33:21.589133	71	\N	f
3173	32	14	2	2014-02-15 10:33:21.592003	2014-02-15 10:33:21.592003	72	\N	f
3174	32	14	0	2014-02-15 10:33:21.594859	2014-02-15 10:33:21.594859	73	\N	f
3175	32	14	0	2014-02-15 10:33:21.597651	2014-02-15 10:33:21.597651	74	\N	f
3176	33	14	0	2014-02-15 10:33:21.602537	2014-02-15 10:33:21.602537	75	\N	f
3177	33	14	0	2014-02-15 10:33:21.605382	2014-02-15 10:33:21.605382	76	\N	f
3178	33	14	2	2014-02-15 10:33:21.608231	2014-02-15 10:33:21.608231	77	\N	f
3179	33	14	0	2014-02-15 10:33:21.611	2014-02-15 10:33:21.611	78	\N	f
3180	34	14	0	2014-02-15 10:33:21.615925	2014-02-15 10:33:21.615925	79	\N	f
3181	34	14	0	2014-02-15 10:33:21.618752	2014-02-15 10:33:21.618752	80	\N	f
3182	34	14	2	2014-02-15 10:33:21.621536	2014-02-15 10:33:21.621536	81	\N	f
3183	34	14	0	2014-02-15 10:33:21.624307	2014-02-15 10:33:21.624307	82	\N	f
3184	35	14	0	2014-02-15 10:33:21.629204	2014-02-15 10:33:21.629204	83	\N	f
3185	35	14	0	2014-02-15 10:33:21.632037	2014-02-15 10:33:21.632037	84	\N	f
3186	35	14	2	2014-02-15 10:33:21.634815	2014-02-15 10:33:21.634815	85	\N	f
3187	35	14	0	2014-02-15 10:33:21.637746	2014-02-15 10:33:21.637746	86	\N	f
3188	36	14	0	2014-02-15 10:33:21.642698	2014-02-15 10:33:21.642698	87	\N	f
3189	36	14	0	2014-02-15 10:33:21.645574	2014-02-15 10:33:21.645574	88	\N	f
3190	36	14	0	2014-02-15 10:33:21.648377	2014-02-15 10:33:21.648377	89	\N	f
3191	36	14	2	2014-02-15 10:33:21.651141	2014-02-15 10:33:21.651141	90	\N	f
3192	37	14	0	2014-02-15 10:33:21.656092	2014-02-15 10:33:21.656092	91	\N	f
3193	37	14	0	2014-02-15 10:33:21.658902	2014-02-15 10:33:21.658902	92	\N	f
3194	37	14	2	2014-02-15 10:33:21.661683	2014-02-15 10:33:21.661683	93	\N	f
3195	37	14	0	2014-02-15 10:33:21.664515	2014-02-15 10:33:21.664515	94	\N	f
3196	38	14	0	2014-02-15 10:33:21.669525	2014-02-15 10:33:21.669525	95	\N	f
3197	38	14	2	2014-02-15 10:33:21.672351	2014-02-15 10:33:21.672351	96	\N	f
3198	38	14	0	2014-02-15 10:33:21.67513	2014-02-15 10:33:21.67513	97	\N	f
3199	38	14	0	2014-02-15 10:33:21.677938	2014-02-15 10:33:21.677938	98	\N	f
3200	38	14	0	2014-02-15 10:33:21.680757	2014-02-15 10:33:21.680757	99	\N	f
3201	39	14	0	2014-02-15 10:33:21.685716	2014-02-15 10:33:21.685716	100	\N	f
3202	39	14	0	2014-02-15 10:33:21.688569	2014-02-15 10:33:21.688569	101	\N	f
3203	39	14	0	2014-02-15 10:33:21.691361	2014-02-15 10:33:21.691361	102	\N	f
3204	39	14	2	2014-02-15 10:33:21.694156	2014-02-15 10:33:21.694156	103	\N	f
3205	40	14	0	2014-02-15 10:33:21.699038	2014-02-15 10:33:21.699038	104	\N	f
3206	40	14	0	2014-02-15 10:33:21.701913	2014-02-15 10:33:21.701913	105	\N	f
3207	40	14	2	2014-02-15 10:33:21.704711	2014-02-15 10:33:21.704711	106	\N	f
3208	40	14	0	2014-02-15 10:33:21.707485	2014-02-15 10:33:21.707485	107	\N	f
3209	41	14	0	2014-02-15 10:33:21.712401	2014-02-15 10:33:21.712401	108	\N	f
3210	41	14	0	2014-02-15 10:33:21.715199	2014-02-15 10:33:21.715199	109	\N	f
3211	41	14	2	2014-02-15 10:33:21.717982	2014-02-15 10:33:21.717982	110	\N	f
3212	41	14	0	2014-02-15 10:33:21.720938	2014-02-15 10:33:21.720938	111	\N	f
3213	42	14	0	2014-02-15 10:33:21.725766	2014-02-15 10:33:21.725766	112	\N	f
3214	42	14	0	2014-02-15 10:33:21.728623	2014-02-15 10:33:21.728623	113	\N	f
3215	42	14	2	2014-02-15 10:33:21.731395	2014-02-15 10:33:21.731395	114	\N	f
3216	43	14	2	2014-02-15 10:33:21.736361	2014-02-15 10:33:21.736361	115	\N	f
3217	43	14	0	2014-02-15 10:33:21.739153	2014-02-15 10:33:21.739153	116	\N	f
3218	43	14	0	2014-02-15 10:33:21.741991	2014-02-15 10:33:21.741991	117	\N	f
3219	43	14	0	2014-02-15 10:33:21.74477	2014-02-15 10:33:21.74477	118	\N	f
3220	44	14	0	2014-02-15 10:33:21.749695	2014-02-15 10:33:21.749695	119	\N	f
3221	44	14	2	2014-02-15 10:33:21.752536	2014-02-15 10:33:21.752536	120	\N	f
3222	44	14	0	2014-02-15 10:33:21.755316	2014-02-15 10:33:21.755316	121	\N	f
3223	44	14	0	2014-02-15 10:33:21.758129	2014-02-15 10:33:21.758129	122	\N	f
3224	45	14	2	2014-02-15 10:33:21.762967	2014-02-15 10:33:21.762967	123	\N	f
3225	45	14	0	2014-02-15 10:33:21.765823	2014-02-15 10:33:21.765823	124	\N	f
3226	45	14	0	2014-02-15 10:33:21.768626	2014-02-15 10:33:21.768626	125	\N	f
3227	45	14	0	2014-02-15 10:33:21.771383	2014-02-15 10:33:21.771383	126	\N	f
3228	46	14	2	2014-02-15 10:33:21.776286	2014-02-15 10:33:21.776286	127	\N	f
3229	46	14	0	2014-02-15 10:33:21.779079	2014-02-15 10:33:21.779079	128	\N	f
3230	46	14	0	2014-02-15 10:33:21.781879	2014-02-15 10:33:21.781879	129	\N	f
3231	47	14	0	2014-02-15 10:33:21.786777	2014-02-15 10:33:21.786777	130	\N	f
3232	47	14	2	2014-02-15 10:33:21.789602	2014-02-15 10:33:21.789602	131	\N	f
3233	47	14	0	2014-02-15 10:33:21.792409	2014-02-15 10:33:21.792409	132	\N	f
3234	47	14	0	2014-02-15 10:33:21.795216	2014-02-15 10:33:21.795216	133	\N	f
3235	48	14	0	2014-02-15 10:33:21.800146	2014-02-15 10:33:21.800146	134	\N	f
3236	48	14	0	2014-02-15 10:33:21.802988	2014-02-15 10:33:21.802988	135	\N	f
3237	48	14	2	2014-02-15 10:33:21.805808	2014-02-15 10:33:21.805808	136	\N	f
3238	48	14	0	2014-02-15 10:33:21.808645	2014-02-15 10:33:21.808645	137	\N	f
3239	49	14	0	2014-02-15 10:33:21.813577	2014-02-15 10:33:21.813577	138	\N	f
3240	49	14	2	2014-02-15 10:33:21.816411	2014-02-15 10:33:21.816411	139	\N	f
3241	49	14	0	2014-02-15 10:33:21.819169	2014-02-15 10:33:21.819169	140	\N	f
3242	49	14	0	2014-02-15 10:33:21.822008	2014-02-15 10:33:21.822008	141	\N	f
3243	49	14	0	2014-02-15 10:33:21.824772	2014-02-15 10:33:21.824772	142	\N	f
3244	50	14	0	2014-02-15 10:33:21.829681	2014-02-15 10:33:21.829681	143	\N	f
3245	50	14	0	2014-02-15 10:33:21.832576	2014-02-15 10:33:21.832576	144	\N	f
3246	50	14	2	2014-02-15 10:33:21.835328	2014-02-15 10:33:21.835328	145	\N	f
3247	50	14	0	2014-02-15 10:33:21.838136	2014-02-15 10:33:21.838136	146	\N	f
3248	51	14	0	2014-02-15 10:33:21.842896	2014-02-15 10:33:21.842896	147	\N	f
3249	51	14	2	2014-02-15 10:33:21.845857	2014-02-15 10:33:21.845857	148	\N	f
3250	51	14	0	2014-02-15 10:33:21.848658	2014-02-15 10:33:21.848658	149	\N	f
3251	52	14	0	2014-02-15 10:33:21.853749	2014-02-15 10:33:21.853749	150	\N	f
3252	52	14	0	2014-02-15 10:33:21.85661	2014-02-15 10:33:21.85661	151	\N	f
3253	52	14	2	2014-02-15 10:33:21.859428	2014-02-15 10:33:21.859428	152	\N	f
3254	52	14	0	2014-02-15 10:33:21.862201	2014-02-15 10:33:21.862201	153	\N	f
3255	53	14	0	2014-02-15 10:33:21.867145	2014-02-15 10:33:21.867145	154	\N	f
3256	53	14	0	2014-02-15 10:33:21.870006	2014-02-15 10:33:21.870006	155	\N	f
3257	53	14	0	2014-02-15 10:33:21.872788	2014-02-15 10:33:21.872788	156	\N	f
3258	53	14	0	2014-02-15 10:33:21.87556	2014-02-15 10:33:21.87556	157	\N	f
3259	53	14	2	2014-02-15 10:33:21.878366	2014-02-15 10:33:21.878366	158	\N	f
3260	54	14	2	2014-02-15 10:33:21.883268	2014-02-15 10:33:21.883268	159	\N	f
3261	54	14	0	2014-02-15 10:33:21.886126	2014-02-15 10:33:21.886126	160	\N	f
3262	54	14	0	2014-02-15 10:33:21.888881	2014-02-15 10:33:21.888881	161	\N	f
3263	54	14	0	2014-02-15 10:33:21.891666	2014-02-15 10:33:21.891666	162	\N	f
3264	55	14	0	2014-02-15 10:33:21.896596	2014-02-15 10:33:21.896596	163	\N	f
3265	55	14	0	2014-02-15 10:33:21.899413	2014-02-15 10:33:21.899413	164	\N	f
3266	55	14	2	2014-02-15 10:33:21.902213	2014-02-15 10:33:21.902213	165	\N	f
3267	55	14	0	2014-02-15 10:33:21.905031	2014-02-15 10:33:21.905031	166	\N	f
3268	56	14	0	2014-02-15 10:33:21.909889	2014-02-15 10:33:21.909889	167	\N	f
3269	56	14	0	2014-02-15 10:33:21.912679	2014-02-15 10:33:21.912679	168	\N	f
3270	56	14	2	2014-02-15 10:33:21.915487	2014-02-15 10:33:21.915487	169	\N	f
3271	56	14	0	2014-02-15 10:33:21.918337	2014-02-15 10:33:21.918337	170	\N	f
3272	57	14	2	2014-02-15 10:33:21.923268	2014-02-15 10:33:21.923268	171	\N	f
3273	57	14	0	2014-02-15 10:33:21.926082	2014-02-15 10:33:21.926082	172	\N	f
3274	57	14	0	2014-02-15 10:33:21.928892	2014-02-15 10:33:21.928892	173	\N	f
3275	57	14	0	2014-02-15 10:33:21.931651	2014-02-15 10:33:21.931651	174	\N	f
3276	58	14	0	2014-02-15 10:33:21.93659	2014-02-15 10:33:21.93659	175	\N	f
3277	58	14	2	2014-02-15 10:33:21.939392	2014-02-15 10:33:21.939392	176	\N	f
3278	58	14	0	2014-02-15 10:33:21.942256	2014-02-15 10:33:21.942256	177	\N	f
3279	58	14	0	2014-02-15 10:33:21.945063	2014-02-15 10:33:21.945063	178	\N	f
3280	59	14	0	2014-02-15 10:33:21.949993	2014-02-15 10:33:21.949993	179	\N	f
3281	59	14	0	2014-02-15 10:33:21.952828	2014-02-15 10:33:21.952828	180	\N	f
3282	59	14	2	2014-02-15 10:33:21.955604	2014-02-15 10:33:21.955604	181	\N	f
3283	59	14	0	2014-02-15 10:33:21.958408	2014-02-15 10:33:21.958408	182	\N	f
3284	59	14	0	2014-02-15 10:33:21.961214	2014-02-15 10:33:21.961214	183	\N	f
3285	60	14	0	2014-02-15 10:33:21.966222	2014-02-15 10:33:21.966222	184	\N	f
3286	60	14	2	2014-02-15 10:33:21.969061	2014-02-15 10:33:21.969061	185	\N	f
3287	60	14	0	2014-02-15 10:33:21.971856	2014-02-15 10:33:21.971856	186	\N	f
3288	60	14	0	2014-02-15 10:33:21.974672	2014-02-15 10:33:21.974672	187	\N	f
3289	60	14	0	2014-02-15 10:33:21.977496	2014-02-15 10:33:21.977496	188	\N	f
3290	61	14	2	2014-02-15 10:33:21.982464	2014-02-15 10:33:21.982464	189	\N	f
3291	61	14	0	2014-02-15 10:33:21.985328	2014-02-15 10:33:21.985328	190	\N	f
3292	61	14	0	2014-02-15 10:33:21.988274	2014-02-15 10:33:21.988274	191	\N	f
3293	61	14	0	2014-02-15 10:33:21.991052	2014-02-15 10:33:21.991052	192	\N	f
3294	61	14	0	2014-02-15 10:33:21.993861	2014-02-15 10:33:21.993861	193	\N	f
3295	62	14	0	2014-02-15 10:33:21.998674	2014-02-15 10:33:21.998674	194	\N	f
3296	62	14	2	2014-02-15 10:33:22.001558	2014-02-15 10:33:22.001558	195	\N	f
3297	62	14	0	2014-02-15 10:33:22.004346	2014-02-15 10:33:22.004346	196	\N	f
3298	63	14	0	2014-02-15 10:33:22.009097	2014-02-15 10:33:22.009097	197	\N	f
3299	63	14	2	2014-02-15 10:33:22.011971	2014-02-15 10:33:22.011971	198	\N	f
3300	64	14	2	2014-02-15 10:33:22.016819	2014-02-15 10:33:22.016819	199	\N	f
3301	64	14	0	2014-02-15 10:33:22.019692	2014-02-15 10:33:22.019692	200	\N	f
3302	64	14	0	2014-02-15 10:33:22.022518	2014-02-15 10:33:22.022518	201	\N	f
3303	65	14	0	2014-02-15 10:33:22.027489	2014-02-15 10:33:22.027489	202	\N	f
3304	65	14	0	2014-02-15 10:33:22.030377	2014-02-15 10:33:22.030377	203	\N	f
3305	65	14	2	2014-02-15 10:33:22.033174	2014-02-15 10:33:22.033174	204	\N	f
3306	65	14	0	2014-02-15 10:33:22.036034	2014-02-15 10:33:22.036034	205	\N	f
3307	66	14	0	2014-02-15 10:33:22.040938	2014-02-15 10:33:22.040938	206	\N	f
3308	66	14	0	2014-02-15 10:33:22.043793	2014-02-15 10:33:22.043793	207	\N	f
3309	66	14	2	2014-02-15 10:33:22.046609	2014-02-15 10:33:22.046609	208	\N	f
3310	66	14	0	2014-02-15 10:33:22.049405	2014-02-15 10:33:22.049405	209	\N	f
3311	68	14	0	2014-02-15 10:33:22.054241	2014-02-15 10:33:22.054241	214	\N	f
3312	68	14	2	2014-02-15 10:33:22.057096	2014-02-15 10:33:22.057096	215	\N	f
3313	69	14	0	2014-02-15 10:33:22.06199	2014-02-15 10:33:22.06199	216	\N	f
3314	69	14	0	2014-02-15 10:33:22.064814	2014-02-15 10:33:22.064814	217	\N	f
3315	69	14	2	2014-02-15 10:33:22.067573	2014-02-15 10:33:22.067573	218	\N	f
3316	69	14	0	2014-02-15 10:33:22.070384	2014-02-15 10:33:22.070384	219	\N	f
3317	70	14	0	2014-02-15 10:33:22.075227	2014-02-15 10:33:22.075227	220	\N	f
3318	70	14	0	2014-02-15 10:33:22.078112	2014-02-15 10:33:22.078112	221	\N	f
3319	70	14	2	2014-02-15 10:33:22.081015	2014-02-15 10:33:22.081015	222	\N	f
3320	71	14	0	2014-02-15 10:33:22.086838	2014-02-15 10:33:22.086838	223	\N	f
3321	71	14	0	2014-02-15 10:33:22.091237	2014-02-15 10:33:22.091237	224	\N	f
3322	71	14	2	2014-02-15 10:33:22.095535	2014-02-15 10:33:22.095535	225	\N	f
3323	72	14	0	2014-02-15 10:33:22.102706	2014-02-15 10:33:22.102706	226	\N	f
3324	72	14	0	2014-02-15 10:33:22.10706	2014-02-15 10:33:22.10706	227	\N	f
3325	72	14	2	2014-02-15 10:33:22.111292	2014-02-15 10:33:22.111292	228	\N	f
3326	73	14	2	2014-02-15 10:33:22.118458	2014-02-15 10:33:22.118458	229	\N	f
3327	73	14	0	2014-02-15 10:33:22.123009	2014-02-15 10:33:22.123009	230	\N	f
3328	73	14	0	2014-02-15 10:33:22.127362	2014-02-15 10:33:22.127362	231	\N	f
3329	74	14	0	2014-02-15 10:33:22.134519	2014-02-15 10:33:22.134519	232	\N	f
3330	74	14	2	2014-02-15 10:33:22.139093	2014-02-15 10:33:22.139093	233	\N	f
3331	74	14	0	2014-02-15 10:33:22.143675	2014-02-15 10:33:22.143675	234	\N	f
3332	75	14	0	2014-02-15 10:33:22.150901	2014-02-15 10:33:22.150901	235	\N	f
3333	75	14	0	2014-02-15 10:33:22.15531	2014-02-15 10:33:22.15531	236	\N	f
3334	75	14	2	2014-02-15 10:33:22.15977	2014-02-15 10:33:22.15977	237	\N	f
3335	76	14	0	2014-02-15 10:33:22.166937	2014-02-15 10:33:22.166937	238	\N	f
3336	76	14	2	2014-02-15 10:33:22.171383	2014-02-15 10:33:22.171383	239	\N	f
3337	76	14	0	2014-02-15 10:33:22.175967	2014-02-15 10:33:22.175967	240	\N	f
3338	76	14	0	2014-02-15 10:33:22.180351	2014-02-15 10:33:22.180351	241	\N	f
3339	21	14	0	2014-02-15 10:33:22.187536	2014-02-15 10:33:22.187536	27	\N	f
3340	21	14	2	2014-02-15 10:33:22.191986	2014-02-15 10:33:22.191986	28	\N	f
3341	21	14	0	2014-02-15 10:33:22.196327	2014-02-15 10:33:22.196327	29	\N	f
3342	21	14	0	2014-02-15 10:33:22.200649	2014-02-15 10:33:22.200649	30	\N	f
3343	67	14	0	2014-02-15 10:33:22.207939	2014-02-15 10:33:22.207939	210	\N	f
3344	67	14	0	2014-02-15 10:33:22.212253	2014-02-15 10:33:22.212253	211	\N	f
3345	67	14	0	2014-02-15 10:33:22.216642	2014-02-15 10:33:22.216642	212	\N	f
3346	67	14	2	2014-02-15 10:33:22.220975	2014-02-15 10:33:22.220975	213	\N	f
3347	32	15	0	2014-02-17 07:39:29.185769	2014-02-17 07:39:29.185769	71	\N	f
3349	32	15	0	2014-02-17 07:39:29.192735	2014-02-17 07:39:29.192735	73	\N	f
3350	32	15	0	2014-02-17 07:39:29.196038	2014-02-17 07:39:29.196038	74	\N	f
3351	18	15	0	2014-02-17 07:39:29.203893	2014-02-17 07:39:29.203893	15	\N	f
3353	18	15	0	2014-02-17 07:39:29.212614	2014-02-17 07:39:29.212614	17	\N	f
3354	18	15	0	2014-02-17 07:39:29.216953	2014-02-17 07:39:29.216953	18	\N	f
3356	27	15	0	2014-02-17 07:39:29.22827	2014-02-17 07:39:29.22827	52	\N	f
3357	27	15	0	2014-02-17 07:39:29.232492	2014-02-17 07:39:29.232492	53	\N	f
3359	28	15	0	2014-02-17 07:39:29.243802	2014-02-17 07:39:29.243802	55	\N	f
3360	28	15	0	2014-02-17 07:39:29.248016	2014-02-17 07:39:29.248016	56	\N	f
3361	28	15	0	2014-02-17 07:39:29.252251	2014-02-17 07:39:29.252251	57	\N	f
3364	24	15	0	2014-02-17 07:39:29.267767	2014-02-17 07:39:29.267767	40	\N	f
3365	24	15	0	2014-02-17 07:39:29.271977	2014-02-17 07:39:29.271977	41	\N	f
3366	24	15	0	2014-02-17 07:39:29.276183	2014-02-17 07:39:29.276183	42	\N	f
3374	23	15	0	2014-02-17 07:39:29.315152	2014-02-17 07:39:29.315152	38	\N	f
3376	22	15	0	2014-02-17 07:39:29.32633	2014-02-17 07:39:29.32633	32	\N	f
3378	22	15	0	2014-02-17 07:39:29.334635	2014-02-17 07:39:29.334635	34	\N	f
3380	36	15	0	2014-02-17 07:39:29.345817	2014-02-17 07:39:29.345817	88	\N	f
3381	36	15	0	2014-02-17 07:39:29.34996	2014-02-17 07:39:29.34996	89	\N	f
3383	15	15	0	2014-02-17 07:39:29.361027	2014-02-17 07:39:29.361027	3	\N	f
3384	15	15	0	2014-02-17 07:39:29.365236	2014-02-17 07:39:29.365236	4	\N	f
3385	15	15	0	2014-02-17 07:39:29.369429	2014-02-17 07:39:29.369429	5	\N	f
3387	39	15	0	2014-02-17 07:39:29.380508	2014-02-17 07:39:29.380508	100	\N	f
3388	39	15	0	2014-02-17 07:39:29.384761	2014-02-17 07:39:29.384761	101	\N	f
3389	39	15	0	2014-02-17 07:39:29.388923	2014-02-17 07:39:29.388923	102	\N	f
3391	20	15	0	2014-02-17 07:39:29.400009	2014-02-17 07:39:29.400009	23	\N	f
3392	20	15	0	2014-02-17 07:39:29.40418	2014-02-17 07:39:29.40418	24	\N	f
3394	20	15	0	2014-02-17 07:39:29.412566	2014-02-17 07:39:29.412566	26	\N	f
3395	16	15	0	2014-02-17 07:39:29.419503	2014-02-17 07:39:29.419503	7	\N	f
3397	16	15	0	2014-02-17 07:39:29.427848	2014-02-17 07:39:29.427848	9	\N	f
3398	16	15	0	2014-02-17 07:39:29.432032	2014-02-17 07:39:29.432032	10	\N	f
3399	26	15	0	2014-02-17 07:39:29.439018	2014-02-17 07:39:29.439018	47	\N	f
3400	26	15	0	2014-02-17 07:39:29.443209	2014-02-17 07:39:29.443209	48	\N	f
3402	26	15	0	2014-02-17 07:39:29.451524	2014-02-17 07:39:29.451524	50	\N	f
3403	37	15	0	2014-02-17 07:39:29.458485	2014-02-17 07:39:29.458485	91	\N	f
3404	37	15	0	2014-02-17 07:39:29.462642	2014-02-17 07:39:29.462642	92	\N	f
3407	17	15	0	2014-02-17 07:39:29.477898	2014-02-17 07:39:29.477898	11	\N	f
3408	17	15	0	2014-02-17 07:39:29.482049	2014-02-17 07:39:29.482049	12	\N	f
3410	17	15	0	2014-02-17 07:39:29.49037	2014-02-17 07:39:29.49037	14	\N	f
3411	19	15	0	2014-02-17 07:39:29.497252	2014-02-17 07:39:29.497252	19	\N	f
3413	19	15	0	2014-02-17 07:39:29.505611	2014-02-17 07:39:29.505611	21	\N	f
3414	19	15	0	2014-02-17 07:39:29.509748	2014-02-17 07:39:29.509748	22	\N	f
3415	25	15	0	2014-02-17 07:39:29.516637	2014-02-17 07:39:29.516637	43	\N	f
3417	25	15	0	2014-02-17 07:39:29.525035	2014-02-17 07:39:29.525035	45	\N	f
3418	25	15	0	2014-02-17 07:39:29.529172	2014-02-17 07:39:29.529172	46	\N	f
3421	21	15	0	2014-02-17 07:39:29.544453	2014-02-17 07:39:29.544453	29	\N	f
3422	21	15	0	2014-02-17 07:39:29.548587	2014-02-17 07:39:29.548587	30	\N	f
3423	67	15	0	2014-02-17 07:39:29.55554	2014-02-17 07:39:29.55554	210	\N	f
3424	67	15	0	2014-02-17 07:39:29.559703	2014-02-17 07:39:29.559703	211	\N	f
3358	27	15	2	2014-02-17 07:39:29.236803	2014-02-17 09:16:35.309907	54	\N	t
3367	29	15	0	2014-02-17 07:39:29.283169	2014-02-17 09:17:45.665652	59	\N	f
3363	24	15	2	2014-02-17 07:39:29.263522	2014-02-17 08:58:28.548618	39	\N	t
3368	29	15	0	2014-02-17 07:39:29.287371	2014-02-17 09:18:22.24005	60	\N	t
3370	29	15	0	2014-02-17 07:39:29.295712	2014-02-17 09:18:05.460803	62	\N	f
3373	23	15	0	2014-02-17 07:39:29.31099	2014-02-17 08:56:41.323947	37	\N	f
3377	22	15	0	2014-02-17 07:39:29.330469	2014-02-17 08:56:41.34383	33	\N	f
3382	36	15	0	2014-02-17 07:39:29.354085	2014-02-17 08:56:41.372074	90	\N	f
3393	20	15	1	2014-02-17 07:39:29.408394	2014-02-17 09:00:34.946839	25	\N	t
3396	16	15	2	2014-02-17 07:39:29.423705	2014-02-17 09:01:09.027726	8	\N	t
3401	26	15	2	2014-02-17 07:39:29.44738	2014-02-17 09:01:31.006151	49	\N	t
3406	37	15	0	2014-02-17 07:39:29.470953	2014-02-17 09:02:06.813162	94	\N	t
3405	37	15	0	2014-02-17 07:39:29.466787	2014-02-17 08:56:41.502175	93	\N	f
3412	19	15	2	2014-02-17 07:39:29.501444	2014-02-17 09:02:35.066905	20	\N	t
3416	25	15	2	2014-02-17 07:39:29.52086	2014-02-17 09:02:40.576334	44	\N	t
3419	21	15	0	2014-02-17 07:39:29.536065	2014-02-17 09:02:51.583479	27	\N	t
3420	21	15	0	2014-02-17 07:39:29.540283	2014-02-17 08:56:41.593967	28	\N	f
3355	27	15	0	2014-02-17 07:39:29.223981	2014-02-17 09:16:35.260893	51	\N	f
3362	28	15	1	2014-02-17 07:39:29.25644	2014-02-17 08:58:17.049135	58	\N	t
3375	22	15	0	2014-02-17 07:39:29.322147	2014-02-17 08:59:20.978791	31	\N	t
3379	36	15	0	2014-02-17 07:39:29.341623	2014-02-17 08:59:53.114155	87	\N	t
3386	15	15	2	2014-02-17 07:39:29.373612	2014-02-17 09:00:17.609343	6	\N	t
3409	17	15	2	2014-02-17 07:39:29.486195	2014-02-17 09:02:21.573163	13	\N	t
3352	18	15	0	2014-02-17 07:39:29.208289	2014-02-17 09:16:01.534706	16	\N	f
3369	29	15	0	2014-02-17 07:39:29.291557	2014-02-17 09:18:22.19099	61	\N	f
3372	23	15	0	2014-02-17 07:39:29.306829	2014-02-17 09:20:01.939281	36	\N	f
3425	67	15	0	2014-02-17 07:39:29.563877	2014-02-17 07:39:29.563877	212	\N	f
3428	46	15	0	2014-02-17 07:39:29.579224	2014-02-17 07:39:29.579224	128	\N	f
3429	46	15	0	2014-02-17 07:39:29.583347	2014-02-17 07:39:29.583347	129	\N	f
3432	76	15	0	2014-02-17 07:39:29.598502	2014-02-17 07:39:29.598502	240	\N	f
3433	76	15	0	2014-02-17 07:39:29.602618	2014-02-17 07:39:29.602618	241	\N	f
3434	75	15	0	2014-02-17 07:39:29.609446	2014-02-17 07:39:29.609446	235	\N	f
3435	75	15	0	2014-02-17 07:39:29.613604	2014-02-17 07:39:29.613604	236	\N	f
3437	53	15	0	2014-02-17 07:39:29.624752	2014-02-17 07:39:29.624752	154	\N	f
3438	53	15	0	2014-02-17 07:39:29.628907	2014-02-17 07:39:29.628907	155	\N	f
3439	53	15	0	2014-02-17 07:39:29.633072	2014-02-17 07:39:29.633072	156	\N	f
3440	53	15	0	2014-02-17 07:39:29.637218	2014-02-17 07:39:29.637218	157	\N	f
3443	54	15	0	2014-02-17 07:39:29.652383	2014-02-17 07:39:29.652383	160	\N	f
3444	54	15	0	2014-02-17 07:39:29.65653	2014-02-17 07:39:29.65653	161	\N	f
3445	54	15	0	2014-02-17 07:39:29.660799	2014-02-17 07:39:29.660799	162	\N	f
3448	52	15	0	2014-02-17 07:39:29.67853	2014-02-17 07:39:29.67853	150	\N	f
3449	52	15	0	2014-02-17 07:39:29.682683	2014-02-17 07:39:29.682683	151	\N	f
3451	52	15	0	2014-02-17 07:39:29.690925	2014-02-17 07:39:29.690925	153	\N	f
3452	44	15	0	2014-02-17 07:39:29.69785	2014-02-17 07:39:29.69785	119	\N	f
3455	44	15	0	2014-02-17 07:39:29.710287	2014-02-17 07:39:29.710287	122	\N	f
3456	55	15	0	2014-02-17 07:39:29.717198	2014-02-17 07:39:29.717198	163	\N	f
3457	55	15	0	2014-02-17 07:39:29.721357	2014-02-17 07:39:29.721357	164	\N	f
3459	55	15	0	2014-02-17 07:39:29.729642	2014-02-17 07:39:29.729642	166	\N	f
3460	51	15	0	2014-02-17 07:39:29.736361	2014-02-17 07:39:29.736361	147	\N	f
3462	51	15	0	2014-02-17 07:39:29.744744	2014-02-17 07:39:29.744744	149	\N	f
3464	43	15	0	2014-02-17 07:39:29.755794	2014-02-17 07:39:29.755794	116	\N	f
3465	43	15	0	2014-02-17 07:39:29.759925	2014-02-17 07:39:29.759925	117	\N	f
3466	43	15	0	2014-02-17 07:39:29.764096	2014-02-17 07:39:29.764096	118	\N	f
3468	61	15	0	2014-02-17 07:39:29.775453	2014-02-17 07:39:29.775453	190	\N	f
3469	61	15	0	2014-02-17 07:39:29.779648	2014-02-17 07:39:29.779648	191	\N	f
3470	61	15	0	2014-02-17 07:39:29.783796	2014-02-17 07:39:29.783796	192	\N	f
3471	61	15	0	2014-02-17 07:39:29.787947	2014-02-17 07:39:29.787947	193	\N	f
3474	62	15	0	2014-02-17 07:39:29.80327	2014-02-17 07:39:29.80327	196	\N	f
3475	59	15	0	2014-02-17 07:39:29.810328	2014-02-17 07:39:29.810328	179	\N	f
3476	59	15	0	2014-02-17 07:39:29.814478	2014-02-17 07:39:29.814478	180	\N	f
3478	59	15	0	2014-02-17 07:39:29.822774	2014-02-17 07:39:29.822774	182	\N	f
3479	59	15	0	2014-02-17 07:39:29.826936	2014-02-17 07:39:29.826936	183	\N	f
3480	50	15	0	2014-02-17 07:39:29.83398	2014-02-17 07:39:29.83398	143	\N	f
3481	50	15	0	2014-02-17 07:39:29.83817	2014-02-17 07:39:29.83817	144	\N	f
3483	50	15	0	2014-02-17 07:39:29.846471	2014-02-17 07:39:29.846471	146	\N	f
3484	49	15	0	2014-02-17 07:39:29.853559	2014-02-17 07:39:29.853559	138	\N	f
3486	49	15	0	2014-02-17 07:39:29.861999	2014-02-17 07:39:29.861999	140	\N	f
3487	49	15	0	2014-02-17 07:39:29.866172	2014-02-17 07:39:29.866172	141	\N	f
3488	49	15	0	2014-02-17 07:39:29.870327	2014-02-17 07:39:29.870327	142	\N	f
3489	71	15	0	2014-02-17 07:39:29.877166	2014-02-17 07:39:29.877166	223	\N	f
3490	71	15	0	2014-02-17 07:39:29.881397	2014-02-17 07:39:29.881397	224	\N	f
3493	73	15	0	2014-02-17 07:39:29.896636	2014-02-17 07:39:29.896636	230	\N	f
3494	73	15	0	2014-02-17 07:39:29.900969	2014-02-17 07:39:29.900969	231	\N	f
3495	72	15	0	2014-02-17 07:39:29.907869	2014-02-17 07:39:29.907869	226	\N	f
3496	72	15	0	2014-02-17 07:39:29.912173	2014-02-17 07:39:29.912173	227	\N	f
3498	74	15	0	2014-02-17 07:39:29.923327	2014-02-17 07:39:29.923327	232	\N	f
3500	74	15	0	2014-02-17 07:39:29.931869	2014-02-17 07:39:29.931869	234	\N	f
3502	57	15	0	2014-02-17 07:39:29.943197	2014-02-17 07:39:29.943197	172	\N	f
3503	57	15	0	2014-02-17 07:39:29.947453	2014-02-17 07:39:29.947453	173	\N	f
3504	57	15	0	2014-02-17 07:39:29.951681	2014-02-17 07:39:29.951681	174	\N	f
3505	56	15	0	2014-02-17 07:39:29.958788	2014-02-17 07:39:29.958788	167	\N	f
3506	56	15	0	2014-02-17 07:39:29.96307	2014-02-17 07:39:29.96307	168	\N	f
3508	56	15	0	2014-02-17 07:39:29.971548	2014-02-17 07:39:29.971548	170	\N	f
3509	65	15	0	2014-02-17 07:39:29.978667	2014-02-17 07:39:29.978667	202	\N	f
3510	65	15	0	2014-02-17 07:39:29.982874	2014-02-17 07:39:29.982874	203	\N	f
3512	65	15	0	2014-02-17 07:39:29.991459	2014-02-17 07:39:29.991459	205	\N	f
3513	60	15	0	2014-02-17 07:39:29.998634	2014-02-17 07:39:29.998634	184	\N	f
3515	60	15	0	2014-02-17 07:39:30.007148	2014-02-17 07:39:30.007148	186	\N	f
3516	60	15	0	2014-02-17 07:39:30.011391	2014-02-17 07:39:30.011391	187	\N	f
3520	64	15	0	2014-02-17 07:39:30.031074	2014-02-17 07:39:30.031074	201	\N	f
3521	69	15	0	2014-02-17 07:39:30.038189	2014-02-17 07:39:30.038189	216	\N	f
3522	69	15	0	2014-02-17 07:39:30.042391	2014-02-17 07:39:30.042391	217	\N	f
3524	69	15	0	2014-02-17 07:39:30.050875	2014-02-17 07:39:30.050875	219	\N	f
3525	38	15	0	2014-02-17 07:39:30.058019	2014-02-17 07:39:30.058019	95	\N	f
3527	38	15	0	2014-02-17 07:39:30.066517	2014-02-17 07:39:30.066517	97	\N	f
3528	38	15	0	2014-02-17 07:39:30.070764	2014-02-17 07:39:30.070764	98	\N	f
3530	70	15	0	2014-02-17 07:39:30.082061	2014-02-17 07:39:30.082061	220	\N	f
3531	70	15	0	2014-02-17 07:39:30.086285	2014-02-17 07:39:30.086285	221	\N	f
3441	53	15	2	2014-02-17 07:39:29.641329	2014-02-17 09:04:40.778766	158	\N	t
3431	76	15	0	2014-02-17 07:39:29.5944	2014-02-17 08:56:41.652259	239	\N	f
3436	75	15	0	2014-02-17 07:39:29.617717	2014-02-17 09:04:23.278074	237	\N	f
3442	54	15	2	2014-02-17 07:39:29.648226	2014-02-17 09:04:49.279326	159	\N	t
3446	63	15	0	2014-02-17 07:39:29.667456	2014-02-17 09:05:25.152209	197	\N	t
3447	63	15	0	2014-02-17 07:39:29.67163	2014-02-17 08:56:41.738986	198	\N	f
3454	44	15	0	2014-02-17 07:39:29.706171	2014-02-17 09:05:51.221847	121	\N	t
3453	44	15	0	2014-02-17 07:39:29.702007	2014-02-17 08:56:41.774209	120	\N	f
3463	43	15	2	2014-02-17 07:39:29.751601	2014-02-17 09:07:10.669208	115	\N	t
3467	61	15	2	2014-02-17 07:39:29.771272	2014-02-17 09:07:49.201507	189	\N	t
3477	59	15	2	2014-02-17 07:39:29.818622	2014-02-17 09:09:09.932459	181	\N	t
3473	62	15	0	2014-02-17 07:39:29.799073	2014-02-17 08:56:41.883644	195	\N	f
3482	50	15	2	2014-02-17 07:39:29.842328	2014-02-17 09:09:28.610355	145	\N	t
3485	49	15	2	2014-02-17 07:39:29.857759	2014-02-17 09:09:42.488969	139	\N	t
3491	71	15	2	2014-02-17 07:39:29.8856	2014-02-17 09:10:03.908317	225	\N	t
3492	73	15	2	2014-02-17 07:39:29.892433	2014-02-17 09:10:20.84031	229	\N	t
3497	72	15	2	2014-02-17 07:39:29.91638	2014-02-17 09:10:33.463357	228	\N	t
3499	74	15	2	2014-02-17 07:39:29.927591	2014-02-17 09:10:53.99843	233	\N	t
3501	57	15	2	2014-02-17 07:39:29.938929	2014-02-17 09:11:07.44301	171	\N	t
3507	56	15	2	2014-02-17 07:39:29.967303	2014-02-17 09:11:18.730501	169	\N	t
3511	65	15	2	2014-02-17 07:39:29.98718	2014-02-17 09:12:04.367732	204	\N	t
3517	60	15	0	2014-02-17 07:39:30.015599	2014-02-17 09:12:32.459859	188	\N	t
3514	60	15	0	2014-02-17 07:39:30.002891	2014-02-17 08:56:42.10751	185	\N	f
3518	64	15	0	2014-02-17 07:39:30.022599	2014-02-17 08:56:42.127301	199	\N	f
3529	38	15	0	2014-02-17 07:39:30.075019	2014-02-17 09:13:44.528644	99	\N	t
3526	38	15	0	2014-02-17 07:39:30.062261	2014-02-17 08:56:42.197616	96	\N	f
3427	46	15	1	2014-02-17 07:39:29.575023	2014-02-17 09:03:24.396438	127	\N	t
3450	52	15	2	2014-02-17 07:39:29.686795	2014-02-17 09:05:33.987282	152	\N	t
3458	55	15	2	2014-02-17 07:39:29.725487	2014-02-17 09:05:58.929534	165	\N	t
3472	62	15	0	2014-02-17 07:39:29.794876	2014-02-17 09:08:49.861069	194	\N	f
3523	69	15	2	2014-02-17 07:39:30.046644	2014-02-17 09:13:11.563086	218	\N	t
3519	64	15	0	2014-02-17 07:39:30.026866	2014-02-17 09:13:01.841388	200	\N	f
3533	66	15	0	2014-02-17 07:39:30.125412	2014-02-17 07:39:30.125412	206	\N	f
3534	66	15	0	2014-02-17 07:39:30.127574	2014-02-17 07:39:30.127574	207	\N	f
3536	66	15	0	2014-02-17 07:39:30.131927	2014-02-17 07:39:30.131927	209	\N	f
3539	40	15	0	2014-02-17 07:39:30.141788	2014-02-17 07:39:30.141788	104	\N	f
3540	40	15	0	2014-02-17 07:39:30.143945	2014-02-17 07:39:30.143945	105	\N	f
3542	40	15	0	2014-02-17 07:39:30.148278	2014-02-17 07:39:30.148278	107	\N	f
3544	45	15	0	2014-02-17 07:39:30.154403	2014-02-17 07:39:30.154403	124	\N	f
3545	45	15	0	2014-02-17 07:39:30.15655	2014-02-17 07:39:30.15655	125	\N	f
3546	45	15	0	2014-02-17 07:39:30.158724	2014-02-17 07:39:30.158724	126	\N	f
3547	48	15	0	2014-02-17 07:39:30.162631	2014-02-17 07:39:30.162631	134	\N	f
3548	48	15	0	2014-02-17 07:39:30.164801	2014-02-17 07:39:30.164801	135	\N	f
3550	48	15	0	2014-02-17 07:39:30.169125	2014-02-17 07:39:30.169125	137	\N	f
3551	47	15	0	2014-02-17 07:39:30.173157	2014-02-17 07:39:30.173157	130	\N	f
3553	47	15	0	2014-02-17 07:39:30.178172	2014-02-17 07:39:30.178172	132	\N	f
3554	47	15	0	2014-02-17 07:39:30.180683	2014-02-17 07:39:30.180683	133	\N	f
3555	42	15	0	2014-02-17 07:39:30.185164	2014-02-17 07:39:30.185164	112	\N	f
3556	42	15	0	2014-02-17 07:39:30.187672	2014-02-17 07:39:30.187672	113	\N	f
3558	58	15	0	2014-02-17 07:39:30.194653	2014-02-17 07:39:30.194653	175	\N	f
3560	58	15	0	2014-02-17 07:39:30.199761	2014-02-17 07:39:30.199761	177	\N	f
3561	58	15	0	2014-02-17 07:39:30.20228	2014-02-17 07:39:30.20228	178	\N	f
3562	41	15	0	2014-02-17 07:39:30.206721	2014-02-17 07:39:30.206721	108	\N	f
3563	41	15	0	2014-02-17 07:39:30.209277	2014-02-17 07:39:30.209277	109	\N	f
3565	41	15	0	2014-02-17 07:39:30.214287	2014-02-17 07:39:30.214287	111	\N	f
3566	32	16	0	2014-02-17 07:39:30.231223	2014-02-17 07:39:30.231223	71	\N	f
3568	32	16	0	2014-02-17 07:39:30.23639	2014-02-17 07:39:30.23639	73	\N	f
3569	32	16	0	2014-02-17 07:39:30.23922	2014-02-17 07:39:30.23922	74	\N	f
3570	18	16	0	2014-02-17 07:39:30.244129	2014-02-17 07:39:30.244129	15	\N	f
3572	18	16	0	2014-02-17 07:39:30.249805	2014-02-17 07:39:30.249805	17	\N	f
3573	18	16	0	2014-02-17 07:39:30.252619	2014-02-17 07:39:30.252619	18	\N	f
3574	27	16	0	2014-02-17 07:39:30.257565	2014-02-17 07:39:30.257565	51	\N	f
3575	27	16	0	2014-02-17 07:39:30.260347	2014-02-17 07:39:30.260347	52	\N	f
3576	27	16	0	2014-02-17 07:39:30.263175	2014-02-17 07:39:30.263175	53	\N	f
3578	28	16	0	2014-02-17 07:39:30.270873	2014-02-17 07:39:30.270873	55	\N	f
3579	28	16	0	2014-02-17 07:39:30.273677	2014-02-17 07:39:30.273677	56	\N	f
3580	28	16	0	2014-02-17 07:39:30.276455	2014-02-17 07:39:30.276455	57	\N	f
3583	24	16	0	2014-02-17 07:39:30.28708	2014-02-17 07:39:30.28708	40	\N	f
3584	24	16	0	2014-02-17 07:39:30.289881	2014-02-17 07:39:30.289881	41	\N	f
3585	24	16	0	2014-02-17 07:39:30.292719	2014-02-17 07:39:30.292719	42	\N	f
3586	29	16	0	2014-02-17 07:39:30.297599	2014-02-17 07:39:30.297599	59	\N	f
3587	29	16	0	2014-02-17 07:39:30.300383	2014-02-17 07:39:30.300383	60	\N	f
3588	29	16	0	2014-02-17 07:39:30.303206	2014-02-17 07:39:30.303206	61	\N	f
3590	23	16	0	2014-02-17 07:39:30.310902	2014-02-17 07:39:30.310902	35	\N	f
3591	23	16	0	2014-02-17 07:39:30.313699	2014-02-17 07:39:30.313699	36	\N	f
3593	23	16	0	2014-02-17 07:39:30.319388	2014-02-17 07:39:30.319388	38	\N	f
3594	22	16	0	2014-02-17 07:39:30.324275	2014-02-17 07:39:30.324275	31	\N	f
3595	22	16	0	2014-02-17 07:39:30.327136	2014-02-17 07:39:30.327136	32	\N	f
3597	22	16	0	2014-02-17 07:39:30.332839	2014-02-17 07:39:30.332839	34	\N	f
3600	36	16	0	2014-02-17 07:39:30.343418	2014-02-17 07:39:30.343418	89	\N	f
3602	15	16	0	2014-02-17 07:39:30.351135	2014-02-17 07:39:30.351135	3	\N	f
3604	15	16	0	2014-02-17 07:39:30.356789	2014-02-17 07:39:30.356789	5	\N	f
3606	39	16	0	2014-02-17 07:39:30.364461	2014-02-17 07:39:30.364461	100	\N	f
3607	39	16	0	2014-02-17 07:39:30.367337	2014-02-17 07:39:30.367337	101	\N	f
3608	39	16	0	2014-02-17 07:39:30.370164	2014-02-17 07:39:30.370164	102	\N	f
3610	20	16	0	2014-02-17 07:39:30.377849	2014-02-17 07:39:30.377849	23	\N	f
3611	20	16	0	2014-02-17 07:39:30.380671	2014-02-17 07:39:30.380671	24	\N	f
3613	20	16	0	2014-02-17 07:39:30.386306	2014-02-17 07:39:30.386306	26	\N	f
3614	16	16	0	2014-02-17 07:39:30.391211	2014-02-17 07:39:30.391211	7	\N	f
3616	16	16	0	2014-02-17 07:39:30.396871	2014-02-17 07:39:30.396871	9	\N	f
3617	16	16	0	2014-02-17 07:39:30.399665	2014-02-17 07:39:30.399665	10	\N	f
3618	26	16	0	2014-02-17 07:39:30.404546	2014-02-17 07:39:30.404546	47	\N	f
3619	26	16	0	2014-02-17 07:39:30.407377	2014-02-17 07:39:30.407377	48	\N	f
3621	26	16	0	2014-02-17 07:39:30.413063	2014-02-17 07:39:30.413063	50	\N	f
3622	37	16	0	2014-02-17 07:39:30.4179	2014-02-17 07:39:30.4179	91	\N	f
3623	37	16	0	2014-02-17 07:39:30.42072	2014-02-17 07:39:30.42072	92	\N	f
3625	37	16	0	2014-02-17 07:39:30.426305	2014-02-17 07:39:30.426305	94	\N	f
3626	17	16	0	2014-02-17 07:39:30.431188	2014-02-17 07:39:30.431188	11	\N	f
3627	17	16	0	2014-02-17 07:39:30.434002	2014-02-17 07:39:30.434002	12	\N	f
3629	17	16	0	2014-02-17 07:39:30.439636	2014-02-17 07:39:30.439636	14	\N	f
3630	19	16	0	2014-02-17 07:39:30.444519	2014-02-17 07:39:30.444519	19	\N	f
3632	19	16	0	2014-02-17 07:39:30.45018	2014-02-17 07:39:30.45018	21	\N	f
3633	19	16	0	2014-02-17 07:39:30.453019	2014-02-17 07:39:30.453019	22	\N	f
3634	25	16	0	2014-02-17 07:39:30.457909	2014-02-17 07:39:30.457909	43	\N	f
3636	25	16	0	2014-02-17 07:39:30.463562	2014-02-17 07:39:30.463562	45	\N	f
3637	25	16	0	2014-02-17 07:39:30.466366	2014-02-17 07:39:30.466366	46	\N	f
3638	21	16	0	2014-02-17 07:39:30.471233	2014-02-17 07:39:30.471233	27	\N	f
3535	66	15	2	2014-02-17 07:39:30.129769	2014-02-17 09:14:17.100101	208	\N	t
3582	24	16	2	2014-02-17 07:39:30.284175	2014-02-17 08:57:35.797558	39	\N	t
3589	29	16	2	2014-02-17 07:39:30.30603	2014-02-17 08:57:53.0236	62	\N	t
3592	23	16	1	2014-02-17 07:39:30.316537	2014-02-17 08:58:12.584573	37	\N	t
3596	22	16	2	2014-02-17 07:39:30.329995	2014-02-17 08:58:32.191882	33	\N	t
3599	36	16	0	2014-02-17 07:39:30.340537	2014-02-17 09:00:02.893751	88	\N	t
3598	36	16	0	2014-02-17 07:39:30.337745	2014-02-17 09:00:02.794524	87	\N	f
3601	36	16	0	2014-02-17 07:39:30.346216	2014-02-17 08:53:19.369392	90	\N	f
3612	20	16	1	2014-02-17 07:39:30.383483	2014-02-17 09:02:47.004196	25	\N	t
3620	26	16	2	2014-02-17 07:39:30.410234	2014-02-17 09:03:44.501706	49	\N	t
3624	37	16	2	2014-02-17 07:39:30.423489	2014-02-17 09:05:02.157811	93	\N	t
3615	16	16	2	2014-02-17 07:39:30.394055	2014-02-17 09:04:36.477411	8	\N	t
3628	17	16	2	2014-02-17 07:39:30.436844	2014-02-17 09:05:21.10847	13	\N	t
3631	19	16	2	2014-02-17 07:39:30.447341	2014-02-17 09:05:45.512734	20	\N	t
3635	25	16	2	2014-02-17 07:39:30.460754	2014-02-17 09:06:04.741993	44	\N	t
3532	70	15	2	2014-02-17 07:39:30.090519	2014-02-17 09:13:55.410631	222	\N	t
3571	18	16	2	2014-02-17 07:39:30.246994	2014-02-17 08:56:13.257573	16	\N	t
3537	68	15	0	2014-02-17 07:39:30.135728	2014-02-17 09:14:28.367932	214	\N	t
3538	68	15	0	2014-02-17 07:39:30.13791	2014-02-17 08:56:42.276358	215	\N	f
3543	45	15	1	2014-02-17 07:39:30.152213	2014-02-17 09:14:42.678241	123	\N	t
3549	48	15	1	2014-02-17 07:39:30.166964	2014-02-17 09:14:56.498725	136	\N	t
3552	47	15	1	2014-02-17 07:39:30.175668	2014-02-17 09:15:03.167698	131	\N	t
3557	42	15	1	2014-02-17 07:39:30.190193	2014-02-17 09:15:12.167755	114	\N	t
3559	58	15	1	2014-02-17 07:39:30.197245	2014-02-17 09:15:22.319453	176	\N	t
3564	41	15	1	2014-02-17 07:39:30.211768	2014-02-17 09:15:52.147879	110	\N	t
3577	27	16	2	2014-02-17 07:39:30.265986	2014-02-17 08:56:50.375821	54	\N	t
3605	15	16	2	2014-02-17 07:39:30.359579	2014-02-17 09:01:07.23506	6	\N	t
3603	15	16	0	2014-02-17 07:39:30.353957	2014-02-17 09:01:07.16464	4	\N	f
3541	40	15	1	2014-02-17 07:39:30.146133	2014-02-17 09:14:34.961332	106	\N	t
3640	21	16	0	2014-02-17 07:39:30.477102	2014-02-17 07:39:30.477102	29	\N	f
3641	21	16	0	2014-02-17 07:39:30.479892	2014-02-17 07:39:30.479892	30	\N	f
3642	67	16	0	2014-02-17 07:39:30.484843	2014-02-17 07:39:30.484843	210	\N	f
3643	67	16	0	2014-02-17 07:39:30.487653	2014-02-17 07:39:30.487653	211	\N	f
3644	67	16	0	2014-02-17 07:39:30.490489	2014-02-17 07:39:30.490489	212	\N	f
3647	46	16	0	2014-02-17 07:39:30.501111	2014-02-17 07:39:30.501111	128	\N	f
3648	46	16	0	2014-02-17 07:39:30.50393	2014-02-17 07:39:30.50393	129	\N	f
3651	76	16	0	2014-02-17 07:39:30.51454	2014-02-17 07:39:30.51454	240	\N	f
3652	76	16	0	2014-02-17 07:39:30.517338	2014-02-17 07:39:30.517338	241	\N	f
3653	75	16	0	2014-02-17 07:39:30.522201	2014-02-17 07:39:30.522201	235	\N	f
3656	53	16	0	2014-02-17 07:39:30.532921	2014-02-17 07:39:30.532921	154	\N	f
3657	53	16	0	2014-02-17 07:39:30.535728	2014-02-17 07:39:30.535728	155	\N	f
3658	53	16	0	2014-02-17 07:39:30.538541	2014-02-17 07:39:30.538541	156	\N	f
3659	53	16	0	2014-02-17 07:39:30.541385	2014-02-17 07:39:30.541385	157	\N	f
3662	54	16	0	2014-02-17 07:39:30.551988	2014-02-17 07:39:30.551988	160	\N	f
3663	54	16	0	2014-02-17 07:39:30.554808	2014-02-17 07:39:30.554808	161	\N	f
3664	54	16	0	2014-02-17 07:39:30.557674	2014-02-17 07:39:30.557674	162	\N	f
3665	63	16	0	2014-02-17 07:39:30.562488	2014-02-17 07:39:30.562488	197	\N	f
3667	52	16	0	2014-02-17 07:39:30.570223	2014-02-17 07:39:30.570223	150	\N	f
3668	52	16	0	2014-02-17 07:39:30.573156	2014-02-17 07:39:30.573156	151	\N	f
3670	52	16	0	2014-02-17 07:39:30.578772	2014-02-17 07:39:30.578772	153	\N	f
3671	44	16	0	2014-02-17 07:39:30.583698	2014-02-17 07:39:30.583698	119	\N	f
3673	44	16	0	2014-02-17 07:39:30.589348	2014-02-17 07:39:30.589348	121	\N	f
3674	44	16	0	2014-02-17 07:39:30.592154	2014-02-17 07:39:30.592154	122	\N	f
3675	55	16	0	2014-02-17 07:39:30.597071	2014-02-17 07:39:30.597071	163	\N	f
3676	55	16	0	2014-02-17 07:39:30.599888	2014-02-17 07:39:30.599888	164	\N	f
3678	55	16	0	2014-02-17 07:39:30.605546	2014-02-17 07:39:30.605546	166	\N	f
3679	51	16	0	2014-02-17 07:39:30.610423	2014-02-17 07:39:30.610423	147	\N	f
3681	51	16	0	2014-02-17 07:39:30.616068	2014-02-17 07:39:30.616068	149	\N	f
3683	43	16	0	2014-02-17 07:39:30.623892	2014-02-17 07:39:30.623892	116	\N	f
3684	43	16	0	2014-02-17 07:39:30.626754	2014-02-17 07:39:30.626754	117	\N	f
3685	43	16	0	2014-02-17 07:39:30.629593	2014-02-17 07:39:30.629593	118	\N	f
3687	61	16	0	2014-02-17 07:39:30.637486	2014-02-17 07:39:30.637486	190	\N	f
3688	61	16	0	2014-02-17 07:39:30.640321	2014-02-17 07:39:30.640321	191	\N	f
3689	61	16	0	2014-02-17 07:39:30.643233	2014-02-17 07:39:30.643233	192	\N	f
3690	61	16	0	2014-02-17 07:39:30.646112	2014-02-17 07:39:30.646112	193	\N	f
3691	62	16	0	2014-02-17 07:39:30.651033	2014-02-17 07:39:30.651033	194	\N	f
3693	62	16	0	2014-02-17 07:39:30.656815	2014-02-17 07:39:30.656815	196	\N	f
3694	59	16	0	2014-02-17 07:39:30.661929	2014-02-17 07:39:30.661929	179	\N	f
3695	59	16	0	2014-02-17 07:39:30.664894	2014-02-17 07:39:30.664894	180	\N	f
3697	59	16	0	2014-02-17 07:39:30.717377	2014-02-17 07:39:30.717377	182	\N	f
3698	59	16	0	2014-02-17 07:39:30.720442	2014-02-17 07:39:30.720442	183	\N	f
3699	50	16	0	2014-02-17 07:39:30.725429	2014-02-17 07:39:30.725429	143	\N	f
3700	50	16	0	2014-02-17 07:39:30.728249	2014-02-17 07:39:30.728249	144	\N	f
3702	50	16	0	2014-02-17 07:39:30.73387	2014-02-17 07:39:30.73387	146	\N	f
3703	49	16	0	2014-02-17 07:39:30.739076	2014-02-17 07:39:30.739076	138	\N	f
3705	49	16	0	2014-02-17 07:39:30.74472	2014-02-17 07:39:30.74472	140	\N	f
3706	49	16	0	2014-02-17 07:39:30.747526	2014-02-17 07:39:30.747526	141	\N	f
3707	49	16	0	2014-02-17 07:39:30.750114	2014-02-17 07:39:30.750114	142	\N	f
3708	71	16	0	2014-02-17 07:39:30.754081	2014-02-17 07:39:30.754081	223	\N	f
3709	71	16	0	2014-02-17 07:39:30.756257	2014-02-17 07:39:30.756257	224	\N	f
3712	73	16	0	2014-02-17 07:39:30.768044	2014-02-17 07:39:30.768044	230	\N	f
3713	73	16	0	2014-02-17 07:39:30.772316	2014-02-17 07:39:30.772316	231	\N	f
3714	72	16	0	2014-02-17 07:39:30.779396	2014-02-17 07:39:30.779396	226	\N	f
3715	72	16	0	2014-02-17 07:39:30.783642	2014-02-17 07:39:30.783642	227	\N	f
3717	74	16	0	2014-02-17 07:39:30.79485	2014-02-17 07:39:30.79485	232	\N	f
3719	74	16	0	2014-02-17 07:39:30.803326	2014-02-17 07:39:30.803326	234	\N	f
3721	57	16	0	2014-02-17 07:39:30.814545	2014-02-17 07:39:30.814545	172	\N	f
3722	57	16	0	2014-02-17 07:39:30.818756	2014-02-17 07:39:30.818756	173	\N	f
3723	57	16	0	2014-02-17 07:39:30.822983	2014-02-17 07:39:30.822983	174	\N	f
3724	56	16	0	2014-02-17 07:39:30.830053	2014-02-17 07:39:30.830053	167	\N	f
3725	56	16	0	2014-02-17 07:39:30.834353	2014-02-17 07:39:30.834353	168	\N	f
3727	56	16	0	2014-02-17 07:39:30.842734	2014-02-17 07:39:30.842734	170	\N	f
3728	65	16	0	2014-02-17 07:39:30.849817	2014-02-17 07:39:30.849817	202	\N	f
3729	65	16	0	2014-02-17 07:39:30.854038	2014-02-17 07:39:30.854038	203	\N	f
3731	65	16	0	2014-02-17 07:39:30.862437	2014-02-17 07:39:30.862437	205	\N	f
3732	60	16	0	2014-02-17 07:39:30.869606	2014-02-17 07:39:30.869606	184	\N	f
3734	60	16	0	2014-02-17 07:39:30.878082	2014-02-17 07:39:30.878082	186	\N	f
3735	60	16	0	2014-02-17 07:39:30.882285	2014-02-17 07:39:30.882285	187	\N	f
3736	60	16	0	2014-02-17 07:39:30.886459	2014-02-17 07:39:30.886459	188	\N	f
3738	64	16	0	2014-02-17 07:39:30.897724	2014-02-17 07:39:30.897724	200	\N	f
3739	64	16	0	2014-02-17 07:39:30.901903	2014-02-17 07:39:30.901903	201	\N	f
3740	69	16	0	2014-02-17 07:39:30.908961	2014-02-17 07:39:30.908961	216	\N	f
3741	69	16	0	2014-02-17 07:39:30.91319	2014-02-17 07:39:30.91319	217	\N	f
3743	69	16	0	2014-02-17 07:39:30.921632	2014-02-17 07:39:30.921632	219	\N	f
3744	38	16	0	2014-02-17 07:39:30.928755	2014-02-17 07:39:30.928755	95	\N	f
3646	46	16	1	2014-02-17 07:39:30.498237	2014-02-17 09:07:46.999178	127	\N	t
3649	76	16	0	2014-02-17 07:39:30.508884	2014-02-17 09:08:37.849137	238	\N	t
3650	76	16	0	2014-02-17 07:39:30.511693	2014-02-17 08:53:19.715941	239	\N	f
3655	75	16	0	2014-02-17 07:39:30.527862	2014-02-17 08:53:19.744225	237	\N	f
3661	54	16	2	2014-02-17 07:39:30.549186	2014-02-17 09:11:01.927482	159	\N	t
3666	63	16	2	2014-02-17 07:39:30.565305	2014-02-17 09:11:20.781	198	\N	t
3669	52	16	2	2014-02-17 07:39:30.575963	2014-02-17 09:11:36.080646	152	\N	t
3672	44	16	2	2014-02-17 07:39:30.586526	2014-02-17 09:11:47.587327	120	\N	t
3680	51	16	2	2014-02-17 07:39:30.61327	2014-02-17 09:12:14.86827	148	\N	t
3682	43	16	2	2014-02-17 07:39:30.621029	2014-02-17 09:12:27.51953	115	\N	t
3686	61	16	2	2014-02-17 07:39:30.634638	2014-02-17 09:13:19.032227	189	\N	t
3696	59	16	2	2014-02-17 07:39:30.714724	2014-02-17 09:14:54.814333	181	\N	t
3692	62	16	0	2014-02-17 07:39:30.653907	2014-02-17 09:14:41.739947	195	\N	f
3701	50	16	2	2014-02-17 07:39:30.731072	2014-02-17 09:15:43.844697	145	\N	t
3704	49	16	2	2014-02-17 07:39:30.741867	2014-02-17 09:16:35.440029	139	\N	t
3710	71	16	2	2014-02-17 07:39:30.759338	2014-02-17 09:16:52.041901	225	\N	t
3711	73	16	2	2014-02-17 07:39:30.764122	2014-02-17 09:17:04.317978	229	\N	t
3716	72	16	2	2014-02-17 07:39:30.787919	2014-02-17 09:17:22.352931	228	\N	t
3718	74	16	2	2014-02-17 07:39:30.79907	2014-02-17 09:17:44.705758	233	\N	t
3720	57	16	2	2014-02-17 07:39:30.810348	2014-02-17 09:18:07.029651	171	\N	t
3726	56	16	2	2014-02-17 07:39:30.838523	2014-02-17 09:18:22.511977	169	\N	t
3730	65	16	2	2014-02-17 07:39:30.85826	2014-02-17 09:18:38.830978	204	\N	t
3733	60	16	2	2014-02-17 07:39:30.873855	2014-02-17 09:19:36.456537	185	\N	t
3737	64	16	2	2014-02-17 07:39:30.893482	2014-02-17 09:20:06.600637	199	\N	t
3742	69	16	2	2014-02-17 07:39:30.91743	2014-02-17 09:20:21.371915	218	\N	t
3745	38	16	2	2014-02-17 07:39:30.932988	2014-02-17 09:20:40.771433	96	\N	t
3654	75	16	0	2014-02-17 07:39:30.525068	2014-02-17 09:09:14.339626	236	\N	t
3660	53	16	2	2014-02-17 07:39:30.544201	2014-02-17 09:10:20.740009	158	\N	t
3746	38	16	0	2014-02-17 07:39:30.93718	2014-02-17 07:39:30.93718	97	\N	f
3747	38	16	0	2014-02-17 07:39:30.941517	2014-02-17 07:39:30.941517	98	\N	f
3748	38	16	0	2014-02-17 07:39:30.94571	2014-02-17 07:39:30.94571	99	\N	f
3749	70	16	0	2014-02-17 07:39:30.952563	2014-02-17 07:39:30.952563	220	\N	f
3750	70	16	0	2014-02-17 07:39:30.956857	2014-02-17 07:39:30.956857	221	\N	f
3752	66	16	0	2014-02-17 07:39:30.968037	2014-02-17 07:39:30.968037	206	\N	f
3753	66	16	0	2014-02-17 07:39:30.972229	2014-02-17 07:39:30.972229	207	\N	f
3755	66	16	0	2014-02-17 07:39:30.9807	2014-02-17 07:39:30.9807	209	\N	f
3756	68	16	0	2014-02-17 07:39:30.98738	2014-02-17 07:39:30.98738	214	\N	f
3758	40	16	0	2014-02-17 07:39:30.998543	2014-02-17 07:39:30.998543	104	\N	f
3759	40	16	0	2014-02-17 07:39:31.002823	2014-02-17 07:39:31.002823	105	\N	f
3761	40	16	0	2014-02-17 07:39:31.011279	2014-02-17 07:39:31.011279	107	\N	f
3763	45	16	0	2014-02-17 07:39:31.022558	2014-02-17 07:39:31.022558	124	\N	f
3764	45	16	0	2014-02-17 07:39:31.026754	2014-02-17 07:39:31.026754	125	\N	f
3765	45	16	0	2014-02-17 07:39:31.030912	2014-02-17 07:39:31.030912	126	\N	f
3766	48	16	0	2014-02-17 07:39:31.037964	2014-02-17 07:39:31.037964	134	\N	f
3767	48	16	0	2014-02-17 07:39:31.042154	2014-02-17 07:39:31.042154	135	\N	f
3772	47	16	0	2014-02-17 07:39:31.065938	2014-02-17 07:39:31.065938	132	\N	f
3773	47	16	0	2014-02-17 07:39:31.070104	2014-02-17 07:39:31.070104	133	\N	f
3775	42	16	0	2014-02-17 07:39:31.081433	2014-02-17 07:39:31.081433	113	\N	f
3777	58	16	0	2014-02-17 07:39:31.092627	2014-02-17 07:39:31.092627	175	\N	f
3779	58	16	0	2014-02-17 07:39:31.101082	2014-02-17 07:39:31.101082	177	\N	f
3780	58	16	0	2014-02-17 07:39:31.105228	2014-02-17 07:39:31.105228	178	\N	f
3781	41	16	0	2014-02-17 07:39:31.112136	2014-02-17 07:39:31.112136	108	\N	f
3784	41	16	0	2014-02-17 07:39:31.124761	2014-02-17 07:39:31.124761	111	\N	f
3785	32	17	0	2014-02-17 07:39:31.151314	2014-02-17 07:39:31.151314	71	\N	f
3787	32	17	0	2014-02-17 07:39:31.159777	2014-02-17 07:39:31.159777	73	\N	f
3788	32	17	0	2014-02-17 07:39:31.163926	2014-02-17 07:39:31.163926	74	\N	f
3789	18	17	0	2014-02-17 07:39:31.170863	2014-02-17 07:39:31.170863	15	\N	f
3791	18	17	0	2014-02-17 07:39:31.179204	2014-02-17 07:39:31.179204	17	\N	f
3792	18	17	0	2014-02-17 07:39:31.183379	2014-02-17 07:39:31.183379	18	\N	f
3793	27	17	0	2014-02-17 07:39:31.190315	2014-02-17 07:39:31.190315	51	\N	f
3794	27	17	0	2014-02-17 07:39:31.194526	2014-02-17 07:39:31.194526	52	\N	f
3795	27	17	0	2014-02-17 07:39:31.19867	2014-02-17 07:39:31.19867	53	\N	f
3797	28	17	0	2014-02-17 07:39:31.209759	2014-02-17 07:39:31.209759	55	\N	f
3798	28	17	0	2014-02-17 07:39:31.213913	2014-02-17 07:39:31.213913	56	\N	f
3799	28	17	0	2014-02-17 07:39:31.218082	2014-02-17 07:39:31.218082	57	\N	f
3802	24	17	0	2014-02-17 07:39:31.233354	2014-02-17 07:39:31.233354	40	\N	f
3803	24	17	0	2014-02-17 07:39:31.237514	2014-02-17 07:39:31.237514	41	\N	f
3804	24	17	0	2014-02-17 07:39:31.241703	2014-02-17 07:39:31.241703	42	\N	f
3805	29	17	0	2014-02-17 07:39:31.24858	2014-02-17 07:39:31.24858	59	\N	f
3806	29	17	0	2014-02-17 07:39:31.252845	2014-02-17 07:39:31.252845	60	\N	f
3807	29	17	0	2014-02-17 07:39:31.257001	2014-02-17 07:39:31.257001	61	\N	f
3809	23	17	0	2014-02-17 07:39:31.268071	2014-02-17 07:39:31.268071	35	\N	f
3810	23	17	0	2014-02-17 07:39:31.272235	2014-02-17 07:39:31.272235	36	\N	f
3812	23	17	0	2014-02-17 07:39:31.280693	2014-02-17 07:39:31.280693	38	\N	f
3813	22	17	0	2014-02-17 07:39:31.287604	2014-02-17 07:39:31.287604	31	\N	f
3814	22	17	0	2014-02-17 07:39:31.29183	2014-02-17 07:39:31.29183	32	\N	f
3816	22	17	0	2014-02-17 07:39:31.300126	2014-02-17 07:39:31.300126	34	\N	f
3817	36	17	0	2014-02-17 07:39:31.307105	2014-02-17 07:39:31.307105	87	\N	f
3818	36	17	0	2014-02-17 07:39:31.311298	2014-02-17 07:39:31.311298	88	\N	f
3819	36	17	0	2014-02-17 07:39:31.315487	2014-02-17 07:39:31.315487	89	\N	f
3821	15	17	0	2014-02-17 07:39:31.326584	2014-02-17 07:39:31.326584	3	\N	f
3822	15	17	0	2014-02-17 07:39:31.330798	2014-02-17 07:39:31.330798	4	\N	f
3823	15	17	0	2014-02-17 07:39:31.334955	2014-02-17 07:39:31.334955	5	\N	f
3826	39	17	0	2014-02-17 07:39:31.350153	2014-02-17 07:39:31.350153	101	\N	f
3827	39	17	0	2014-02-17 07:39:31.354278	2014-02-17 07:39:31.354278	102	\N	f
3829	20	17	0	2014-02-17 07:39:31.366192	2014-02-17 07:39:31.366192	23	\N	f
3830	20	17	0	2014-02-17 07:39:31.370331	2014-02-17 07:39:31.370331	24	\N	f
3832	20	17	0	2014-02-17 07:39:31.378629	2014-02-17 07:39:31.378629	26	\N	f
3833	16	17	0	2014-02-17 07:39:31.385608	2014-02-17 07:39:31.385608	7	\N	f
3835	16	17	0	2014-02-17 07:39:31.393941	2014-02-17 07:39:31.393941	9	\N	f
3836	16	17	0	2014-02-17 07:39:31.398083	2014-02-17 07:39:31.398083	10	\N	f
3837	26	17	0	2014-02-17 07:39:31.405048	2014-02-17 07:39:31.405048	47	\N	f
3838	26	17	0	2014-02-17 07:39:31.409299	2014-02-17 07:39:31.409299	48	\N	f
3840	26	17	0	2014-02-17 07:39:31.417616	2014-02-17 07:39:31.417616	50	\N	f
3841	37	17	0	2014-02-17 07:39:31.424548	2014-02-17 07:39:31.424548	91	\N	f
3842	37	17	0	2014-02-17 07:39:31.428749	2014-02-17 07:39:31.428749	92	\N	f
3845	17	17	0	2014-02-17 07:39:31.443942	2014-02-17 07:39:31.443942	11	\N	f
3846	17	17	0	2014-02-17 07:39:31.448168	2014-02-17 07:39:31.448168	12	\N	f
3848	17	17	0	2014-02-17 07:39:31.456535	2014-02-17 07:39:31.456535	14	\N	f
3849	19	17	0	2014-02-17 07:39:31.463467	2014-02-17 07:39:31.463467	19	\N	f
3851	19	17	0	2014-02-17 07:39:31.471791	2014-02-17 07:39:31.471791	21	\N	f
3852	19	17	0	2014-02-17 07:39:31.475967	2014-02-17 07:39:31.475967	22	\N	f
3757	68	16	2	2014-02-17 07:39:30.991617	2014-02-17 09:21:22.3896	215	\N	t
3760	40	16	1	2014-02-17 07:39:31.00707	2014-02-17 09:22:01.057885	106	\N	t
3762	45	16	1	2014-02-17 07:39:31.018341	2014-02-17 09:22:25.754795	123	\N	t
3769	48	16	0	2014-02-17 07:39:31.050507	2014-02-17 09:23:24.177809	137	\N	t
3768	48	16	0	2014-02-17 07:39:31.04633	2014-02-17 08:53:20.35655	136	\N	f
3771	47	16	0	2014-02-17 07:39:31.061768	2014-02-17 08:53:20.371573	131	\N	f
3776	42	16	0	2014-02-17 07:39:31.08566	2014-02-17 08:53:20.394867	114	\N	f
3782	41	16	0	2014-02-17 07:39:31.116318	2014-02-17 09:24:27.761409	109	\N	t
3783	41	16	0	2014-02-17 07:39:31.120482	2014-02-17 08:53:20.436449	110	\N	f
3790	18	17	0	2014-02-17 07:39:31.175047	2014-02-17 08:56:56.496051	16	\N	f
3796	27	17	0	2014-02-17 07:39:31.202789	2014-02-17 08:56:56.522063	54	\N	f
3800	28	17	0	2014-02-17 07:39:31.222218	2014-02-17 08:56:56.546051	58	\N	f
3801	24	17	0	2014-02-17 07:39:31.22918	2014-02-17 08:56:56.561377	39	\N	f
3808	29	17	0	2014-02-17 07:39:31.261157	2014-02-17 08:56:56.589114	62	\N	f
3811	23	17	0	2014-02-17 07:39:31.276419	2014-02-17 08:56:56.609715	37	\N	f
3815	22	17	0	2014-02-17 07:39:31.295987	2014-02-17 08:56:56.629394	33	\N	f
3820	36	17	0	2014-02-17 07:39:31.319637	2014-02-17 08:56:56.657629	90	\N	f
3825	39	17	0	2014-02-17 07:39:31.345979	2014-02-17 09:01:17.281003	100	\N	t
3828	39	17	0	2014-02-17 07:39:31.358394	2014-02-17 08:56:56.704422	103	\N	f
3831	20	17	0	2014-02-17 07:39:31.374504	2014-02-17 08:56:56.726282	25	\N	f
3834	16	17	0	2014-02-17 07:39:31.389794	2014-02-17 08:56:56.743027	8	\N	f
3847	17	17	2	2014-02-17 07:39:31.452324	2014-02-17 09:03:00.538384	13	\N	t
3843	37	17	0	2014-02-17 07:39:31.432936	2014-02-17 08:56:56.788055	93	\N	f
3754	66	16	2	2014-02-17 07:39:30.976444	2014-02-17 09:21:10.106012	208	\N	t
3850	19	17	0	2014-02-17 07:39:31.46761	2014-02-17 08:56:56.834714	20	\N	f
3824	15	17	2	2014-02-17 07:39:31.339106	2014-02-17 09:00:02.965876	6	\N	t
3839	26	17	2	2014-02-17 07:39:31.413444	2014-02-17 09:02:22.024276	49	\N	t
3770	47	16	0	2014-02-17 07:39:31.057534	2014-02-17 09:23:46.144352	130	\N	t
3774	42	16	0	2014-02-17 07:39:31.077203	2014-02-17 09:23:52.441115	112	\N	t
3778	58	16	1	2014-02-17 07:39:31.096894	2014-02-17 09:24:01.299992	176	\N	t
3853	25	17	0	2014-02-17 07:39:31.482889	2014-02-17 07:39:31.482889	43	\N	f
3855	25	17	0	2014-02-17 07:39:31.491358	2014-02-17 07:39:31.491358	45	\N	f
3856	25	17	0	2014-02-17 07:39:31.495522	2014-02-17 07:39:31.495522	46	\N	f
3857	21	17	0	2014-02-17 07:39:31.502426	2014-02-17 07:39:31.502426	27	\N	f
3859	21	17	0	2014-02-17 07:39:31.510713	2014-02-17 07:39:31.510713	29	\N	f
3860	21	17	0	2014-02-17 07:39:31.514839	2014-02-17 07:39:31.514839	30	\N	f
3861	67	17	0	2014-02-17 07:39:31.559804	2014-02-17 07:39:31.559804	210	\N	f
3862	67	17	0	2014-02-17 07:39:31.562121	2014-02-17 07:39:31.562121	211	\N	f
3863	67	17	0	2014-02-17 07:39:31.565482	2014-02-17 07:39:31.565482	212	\N	f
3866	46	17	0	2014-02-17 07:39:31.581175	2014-02-17 07:39:31.581175	128	\N	f
3870	76	17	0	2014-02-17 07:39:31.601253	2014-02-17 07:39:31.601253	240	\N	f
3871	76	17	0	2014-02-17 07:39:31.605537	2014-02-17 07:39:31.605537	241	\N	f
3872	75	17	0	2014-02-17 07:39:31.612474	2014-02-17 07:39:31.612474	235	\N	f
3873	75	17	0	2014-02-17 07:39:31.61683	2014-02-17 07:39:31.61683	236	\N	f
3875	53	17	0	2014-02-17 07:39:31.628276	2014-02-17 07:39:31.628276	154	\N	f
3876	53	17	0	2014-02-17 07:39:31.632592	2014-02-17 07:39:31.632592	155	\N	f
3877	53	17	0	2014-02-17 07:39:31.636955	2014-02-17 07:39:31.636955	156	\N	f
3882	54	17	0	2014-02-17 07:39:31.661269	2014-02-17 07:39:31.661269	161	\N	f
3883	54	17	0	2014-02-17 07:39:31.6655	2014-02-17 07:39:31.6655	162	\N	f
3886	52	17	0	2014-02-17 07:39:31.683857	2014-02-17 07:39:31.683857	150	\N	f
3887	52	17	0	2014-02-17 07:39:31.688202	2014-02-17 07:39:31.688202	151	\N	f
3889	52	17	0	2014-02-17 07:39:31.696805	2014-02-17 07:39:31.696805	153	\N	f
3890	44	17	0	2014-02-17 07:39:31.7039	2014-02-17 07:39:31.7039	119	\N	f
3893	44	17	0	2014-02-17 07:39:31.716795	2014-02-17 07:39:31.716795	122	\N	f
3895	55	17	0	2014-02-17 07:39:31.728554	2014-02-17 07:39:31.728554	164	\N	f
3897	55	17	0	2014-02-17 07:39:31.737223	2014-02-17 07:39:31.737223	166	\N	f
3898	51	17	0	2014-02-17 07:39:31.744137	2014-02-17 07:39:31.744137	147	\N	f
3900	51	17	0	2014-02-17 07:39:31.752755	2014-02-17 07:39:31.752755	149	\N	f
3902	43	17	0	2014-02-17 07:39:31.764163	2014-02-17 07:39:31.764163	116	\N	f
3903	43	17	0	2014-02-17 07:39:31.768415	2014-02-17 07:39:31.768415	117	\N	f
3904	43	17	0	2014-02-17 07:39:31.772776	2014-02-17 07:39:31.772776	118	\N	f
3906	61	17	0	2014-02-17 07:39:31.784351	2014-02-17 07:39:31.784351	190	\N	f
3907	61	17	0	2014-02-17 07:39:31.788615	2014-02-17 07:39:31.788615	191	\N	f
3908	61	17	0	2014-02-17 07:39:31.793052	2014-02-17 07:39:31.793052	192	\N	f
3909	61	17	0	2014-02-17 07:39:31.797333	2014-02-17 07:39:31.797333	193	\N	f
3910	62	17	0	2014-02-17 07:39:31.804335	2014-02-17 07:39:31.804335	194	\N	f
3912	62	17	0	2014-02-17 07:39:31.813046	2014-02-17 07:39:31.813046	196	\N	f
3913	59	17	0	2014-02-17 07:39:31.820248	2014-02-17 07:39:31.820248	179	\N	f
3914	59	17	0	2014-02-17 07:39:31.824508	2014-02-17 07:39:31.824508	180	\N	f
3916	59	17	0	2014-02-17 07:39:31.83333	2014-02-17 07:39:31.83333	182	\N	f
3917	59	17	0	2014-02-17 07:39:31.837603	2014-02-17 07:39:31.837603	183	\N	f
3918	50	17	0	2014-02-17 07:39:31.844714	2014-02-17 07:39:31.844714	143	\N	f
3921	50	17	0	2014-02-17 07:39:31.857651	2014-02-17 07:39:31.857651	146	\N	f
3924	49	17	0	2014-02-17 07:39:31.87352	2014-02-17 07:39:31.87352	140	\N	f
3925	49	17	0	2014-02-17 07:39:31.877798	2014-02-17 07:39:31.877798	141	\N	f
3926	49	17	0	2014-02-17 07:39:31.882025	2014-02-17 07:39:31.882025	142	\N	f
3927	71	17	0	2014-02-17 07:39:31.889121	2014-02-17 07:39:31.889121	223	\N	f
3928	71	17	0	2014-02-17 07:39:31.893413	2014-02-17 07:39:31.893413	224	\N	f
3931	73	17	0	2014-02-17 07:39:31.909104	2014-02-17 07:39:31.909104	230	\N	f
3932	73	17	0	2014-02-17 07:39:31.913437	2014-02-17 07:39:31.913437	231	\N	f
3933	72	17	0	2014-02-17 07:39:31.920408	2014-02-17 07:39:31.920408	226	\N	f
3934	72	17	0	2014-02-17 07:39:31.924749	2014-02-17 07:39:31.924749	227	\N	f
3936	74	17	0	2014-02-17 07:39:31.936064	2014-02-17 07:39:31.936064	232	\N	f
3938	74	17	0	2014-02-17 07:39:31.944725	2014-02-17 07:39:31.944725	234	\N	f
3940	57	17	0	2014-02-17 07:39:31.956161	2014-02-17 07:39:31.956161	172	\N	f
3941	57	17	0	2014-02-17 07:39:31.960476	2014-02-17 07:39:31.960476	173	\N	f
3942	57	17	0	2014-02-17 07:39:31.964844	2014-02-17 07:39:31.964844	174	\N	f
3943	56	17	0	2014-02-17 07:39:31.971925	2014-02-17 07:39:31.971925	167	\N	f
3944	56	17	0	2014-02-17 07:39:31.976307	2014-02-17 07:39:31.976307	168	\N	f
3948	65	17	0	2014-02-17 07:39:31.996372	2014-02-17 07:39:31.996372	203	\N	f
3950	65	17	0	2014-02-17 07:39:32.00513	2014-02-17 07:39:32.00513	205	\N	f
3951	60	17	0	2014-02-17 07:39:32.012394	2014-02-17 07:39:32.012394	184	\N	f
3953	60	17	0	2014-02-17 07:39:32.021063	2014-02-17 07:39:32.021063	186	\N	f
3954	60	17	0	2014-02-17 07:39:32.02535	2014-02-17 07:39:32.02535	187	\N	f
3958	64	17	0	2014-02-17 07:39:32.04548	2014-02-17 07:39:32.04548	201	\N	f
3867	46	17	0	2014-02-17 07:39:31.585522	2014-02-17 09:04:54.179644	129	\N	t
3869	76	17	1	2014-02-17 07:39:31.596967	2014-02-17 09:07:11.992274	239	\N	t
3865	46	17	0	2014-02-17 07:39:31.576885	2014-02-17 08:56:56.919922	127	\N	f
3899	51	17	2	2014-02-17 07:39:31.748438	2014-02-17 09:12:15.624428	148	\N	t
3874	75	17	0	2014-02-17 07:39:31.621066	2014-02-17 09:06:04.502189	237	\N	f
3879	53	17	0	2014-02-17 07:39:31.645498	2014-02-17 08:56:56.99109	158	\N	f
3880	54	17	0	2014-02-17 07:39:31.652604	2014-02-17 08:56:57.003194	159	\N	f
3885	63	17	0	2014-02-17 07:39:31.676703	2014-02-17 08:56:57.024507	198	\N	f
3892	44	17	0	2014-02-17 07:39:31.712508	2014-02-17 09:11:43.074986	121	\N	t
3896	55	17	0	2014-02-17 07:39:31.732919	2014-02-17 08:56:57.082861	165	\N	f
3901	43	17	2	2014-02-17 07:39:31.75987	2014-02-17 09:12:27.669842	115	\N	t
3905	61	17	2	2014-02-17 07:39:31.780033	2014-02-17 09:12:54.03851	189	\N	t
3919	50	17	0	2014-02-17 07:39:31.849054	2014-02-17 09:15:06.076614	144	\N	t
3915	59	17	2	2014-02-17 07:39:31.829003	2014-02-17 09:14:34.401917	181	\N	t
3911	62	17	0	2014-02-17 07:39:31.808703	2014-02-17 09:14:42.739779	195	\N	f
3920	50	17	0	2014-02-17 07:39:31.853391	2014-02-17 08:56:57.216042	145	\N	f
3923	49	17	0	2014-02-17 07:39:31.869169	2014-02-17 08:56:57.23459	139	\N	f
3930	73	17	2	2014-02-17 07:39:31.904738	2014-02-17 09:16:45.400176	229	\N	t
3935	72	17	2	2014-02-17 07:39:31.929028	2014-02-17 09:16:59.995704	228	\N	t
3937	74	17	2	2014-02-17 07:39:31.940367	2014-02-17 09:17:15.487179	233	\N	t
3939	57	17	2	2014-02-17 07:39:31.951876	2014-02-17 09:17:29.428489	171	\N	t
3946	56	17	0	2014-02-17 07:39:31.984995	2014-02-17 09:17:43.655742	170	\N	t
3945	56	17	0	2014-02-17 07:39:31.98063	2014-02-17 08:56:57.352782	169	\N	f
3949	65	17	0	2014-02-17 07:39:32.000787	2014-02-17 08:56:57.371239	204	\N	f
3952	60	17	0	2014-02-17 07:39:32.016746	2014-02-17 08:56:57.393024	185	\N	f
3956	64	17	0	2014-02-17 07:39:32.036804	2014-02-17 08:56:57.412936	199	\N	f
3858	21	17	2	2014-02-17 07:39:31.506583	2014-02-17 09:04:01.305959	28	\N	t
3868	76	17	0	2014-02-17 07:39:31.592646	2014-02-17 09:07:11.973021	238	\N	f
3878	53	17	0	2014-02-17 07:39:31.641264	2014-02-17 09:09:31.227338	157	\N	t
3881	54	17	0	2014-02-17 07:39:31.656939	2014-02-17 09:10:53.073721	160	\N	t
3884	63	17	0	2014-02-17 07:39:31.672353	2014-02-17 09:11:03.234123	197	\N	t
3888	52	17	2	2014-02-17 07:39:31.692467	2014-02-17 09:11:11.846131	152	\N	t
3894	55	17	0	2014-02-17 07:39:31.724048	2014-02-17 09:12:05.606566	163	\N	f
3922	49	17	0	2014-02-17 07:39:31.864899	2014-02-17 09:15:33.571385	138	\N	t
3929	71	17	2	2014-02-17 07:39:31.897725	2014-02-17 09:15:46.407759	225	\N	t
3947	65	17	0	2014-02-17 07:39:31.99204	2014-02-17 09:18:13.36502	202	\N	t
3959	69	17	0	2014-02-17 07:39:32.052582	2014-02-17 09:21:03.545617	216	\N	t
3955	60	17	0	2014-02-17 07:39:32.029687	2014-02-17 09:19:19.088943	188	\N	f
3957	64	17	0	2014-02-17 07:39:32.041114	2014-02-17 09:20:49.598451	200	\N	f
3960	69	17	0	2014-02-17 07:39:32.057032	2014-02-17 07:39:32.057032	217	\N	f
3962	69	17	0	2014-02-17 07:39:32.065842	2014-02-17 07:39:32.065842	219	\N	f
3965	38	17	0	2014-02-17 07:39:32.081868	2014-02-17 07:39:32.081868	97	\N	f
3966	38	17	0	2014-02-17 07:39:32.086156	2014-02-17 07:39:32.086156	98	\N	f
3967	38	17	0	2014-02-17 07:39:32.090405	2014-02-17 07:39:32.090405	99	\N	f
3969	70	17	0	2014-02-17 07:39:32.101844	2014-02-17 07:39:32.101844	221	\N	f
3971	66	17	0	2014-02-17 07:39:32.113346	2014-02-17 07:39:32.113346	206	\N	f
3972	66	17	0	2014-02-17 07:39:32.117796	2014-02-17 07:39:32.117796	207	\N	f
3974	66	17	0	2014-02-17 07:39:32.126368	2014-02-17 07:39:32.126368	209	\N	f
3977	40	17	0	2014-02-17 07:39:32.145025	2014-02-17 07:39:32.145025	104	\N	f
3978	40	17	0	2014-02-17 07:39:32.149335	2014-02-17 07:39:32.149335	105	\N	f
3980	40	17	0	2014-02-17 07:39:32.158097	2014-02-17 07:39:32.158097	107	\N	f
3983	45	17	0	2014-02-17 07:39:32.17407	2014-02-17 07:39:32.17407	125	\N	f
3984	45	17	0	2014-02-17 07:39:32.17839	2014-02-17 07:39:32.17839	126	\N	f
3985	48	17	0	2014-02-17 07:39:32.185631	2014-02-17 07:39:32.185631	134	\N	f
3986	48	17	0	2014-02-17 07:39:32.190002	2014-02-17 07:39:32.190002	135	\N	f
3988	48	17	0	2014-02-17 07:39:32.198528	2014-02-17 07:39:32.198528	137	\N	f
3989	47	17	0	2014-02-17 07:39:32.205798	2014-02-17 07:39:32.205798	130	\N	f
3991	47	17	0	2014-02-17 07:39:32.214564	2014-02-17 07:39:32.214564	132	\N	f
3992	47	17	0	2014-02-17 07:39:32.218857	2014-02-17 07:39:32.218857	133	\N	f
3993	42	17	0	2014-02-17 07:39:32.225962	2014-02-17 07:39:32.225962	112	\N	f
3994	42	17	0	2014-02-17 07:39:32.23029	2014-02-17 07:39:32.23029	113	\N	f
3996	58	17	0	2014-02-17 07:39:32.241956	2014-02-17 07:39:32.241956	175	\N	f
3998	58	17	0	2014-02-17 07:39:32.250658	2014-02-17 07:39:32.250658	177	\N	f
3999	58	17	0	2014-02-17 07:39:32.254995	2014-02-17 07:39:32.254995	178	\N	f
4000	41	17	0	2014-02-17 07:39:32.262333	2014-02-17 07:39:32.262333	108	\N	f
4001	41	17	0	2014-02-17 07:39:32.266696	2014-02-17 07:39:32.266696	109	\N	f
4003	41	17	0	2014-02-17 07:39:32.275399	2014-02-17 07:39:32.275399	111	\N	f
4004	32	18	0	2014-02-17 07:39:32.303802	2014-02-17 07:39:32.303802	71	\N	f
4006	32	18	0	2014-02-17 07:39:32.312777	2014-02-17 07:39:32.312777	73	\N	f
4007	32	18	0	2014-02-17 07:39:32.31713	2014-02-17 07:39:32.31713	74	\N	f
4008	18	18	0	2014-02-17 07:39:32.324451	2014-02-17 07:39:32.324451	15	\N	f
4010	18	18	0	2014-02-17 07:39:32.333494	2014-02-17 07:39:32.333494	17	\N	f
4011	18	18	0	2014-02-17 07:39:32.337963	2014-02-17 07:39:32.337963	18	\N	f
4012	27	18	0	2014-02-17 07:39:32.345359	2014-02-17 07:39:32.345359	51	\N	f
4013	27	18	0	2014-02-17 07:39:32.349891	2014-02-17 07:39:32.349891	52	\N	f
4016	28	18	0	2014-02-17 07:39:32.404282	2014-02-17 07:39:32.404282	55	\N	f
4017	28	18	0	2014-02-17 07:39:32.406641	2014-02-17 07:39:32.406641	56	\N	f
4018	28	18	0	2014-02-17 07:39:32.409922	2014-02-17 07:39:32.409922	57	\N	f
4021	24	18	0	2014-02-17 07:39:32.425884	2014-02-17 07:39:32.425884	40	\N	f
4022	24	18	0	2014-02-17 07:39:32.43019	2014-02-17 07:39:32.43019	41	\N	f
4023	24	18	0	2014-02-17 07:39:32.434477	2014-02-17 07:39:32.434477	42	\N	f
4024	29	18	0	2014-02-17 07:39:32.441718	2014-02-17 07:39:32.441718	59	\N	f
4025	29	18	0	2014-02-17 07:39:32.446031	2014-02-17 07:39:32.446031	60	\N	f
4028	23	18	0	2014-02-17 07:39:32.461851	2014-02-17 07:39:32.461851	35	\N	f
4029	23	18	0	2014-02-17 07:39:32.466261	2014-02-17 07:39:32.466261	36	\N	f
4032	22	18	0	2014-02-17 07:39:32.482064	2014-02-17 07:39:32.482064	31	\N	f
4035	22	18	0	2014-02-17 07:39:32.49504	2014-02-17 07:39:32.49504	34	\N	f
4036	36	18	0	2014-02-17 07:39:32.502201	2014-02-17 07:39:32.502201	87	\N	f
4037	36	18	0	2014-02-17 07:39:32.506529	2014-02-17 07:39:32.506529	88	\N	f
4038	36	18	0	2014-02-17 07:39:32.510826	2014-02-17 07:39:32.510826	89	\N	f
4040	15	18	0	2014-02-17 07:39:32.522248	2014-02-17 07:39:32.522248	3	\N	f
4041	15	18	0	2014-02-17 07:39:32.526537	2014-02-17 07:39:32.526537	4	\N	f
4042	15	18	0	2014-02-17 07:39:32.530795	2014-02-17 07:39:32.530795	5	\N	f
4044	39	18	0	2014-02-17 07:39:32.542255	2014-02-17 07:39:32.542255	100	\N	f
4045	39	18	0	2014-02-17 07:39:32.546534	2014-02-17 07:39:32.546534	101	\N	f
4046	39	18	0	2014-02-17 07:39:32.55089	2014-02-17 07:39:32.55089	102	\N	f
4048	20	18	0	2014-02-17 07:39:32.562403	2014-02-17 07:39:32.562403	23	\N	f
4049	20	18	0	2014-02-17 07:39:32.566728	2014-02-17 07:39:32.566728	24	\N	f
4051	20	18	0	2014-02-17 07:39:32.575371	2014-02-17 07:39:32.575371	26	\N	f
4052	16	18	0	2014-02-17 07:39:32.582571	2014-02-17 07:39:32.582571	7	\N	f
4054	16	18	0	2014-02-17 07:39:32.591249	2014-02-17 07:39:32.591249	9	\N	f
4055	16	18	0	2014-02-17 07:39:32.595521	2014-02-17 07:39:32.595521	10	\N	f
4056	26	18	0	2014-02-17 07:39:32.60274	2014-02-17 07:39:32.60274	47	\N	f
4057	26	18	0	2014-02-17 07:39:32.607056	2014-02-17 07:39:32.607056	48	\N	f
4059	26	18	0	2014-02-17 07:39:32.615732	2014-02-17 07:39:32.615732	50	\N	f
4060	37	18	0	2014-02-17 07:39:32.622853	2014-02-17 07:39:32.622853	91	\N	f
4061	37	18	0	2014-02-17 07:39:32.627252	2014-02-17 07:39:32.627252	92	\N	f
4064	17	18	0	2014-02-17 07:39:32.643024	2014-02-17 07:39:32.643024	11	\N	f
4065	17	18	0	2014-02-17 07:39:32.647362	2014-02-17 07:39:32.647362	12	\N	f
4019	28	18	0	2014-02-17 07:39:32.414268	2014-02-17 09:04:27.477383	58	\N	f
4015	27	18	0	2014-02-17 07:39:32.35875	2014-02-17 08:56:47.1351	54	\N	f
4030	23	18	1	2014-02-17 07:39:32.470538	2014-02-17 09:05:58.402833	37	\N	t
4026	29	18	0	2014-02-17 07:39:32.45031	2014-02-17 09:04:50.771493	61	\N	t
4027	29	18	0	2014-02-17 07:39:32.45468	2014-02-17 08:56:47.196588	62	\N	f
4033	22	18	0	2014-02-17 07:39:32.486375	2014-02-17 09:06:42.640001	32	\N	t
4034	22	18	0	2014-02-17 07:39:32.490715	2014-02-17 08:56:47.236953	33	\N	f
4043	15	18	2	2014-02-17 07:39:32.535028	2014-02-17 09:08:08.183766	6	\N	t
4050	20	18	1	2014-02-17 07:39:32.571042	2014-02-17 09:08:25.485578	25	\N	t
4053	16	18	2	2014-02-17 07:39:32.586936	2014-02-17 09:08:54.216418	8	\N	t
4058	26	18	2	2014-02-17 07:39:32.611371	2014-02-17 09:09:06.856374	49	\N	t
4063	37	18	0	2014-02-17 07:39:32.635875	2014-02-17 09:10:16.497046	94	\N	t
4062	37	18	0	2014-02-17 07:39:32.631547	2014-02-17 08:56:47.39554	93	\N	f
3968	70	17	0	2014-02-17 07:39:32.09755	2014-02-17 09:22:25.175961	220	\N	t
3961	69	17	0	2014-02-17 07:39:32.061544	2014-02-17 08:56:57.44107	218	\N	f
3964	38	17	0	2014-02-17 07:39:32.077508	2014-02-17 08:56:57.4597	96	\N	f
3970	70	17	0	2014-02-17 07:39:32.10616	2014-02-17 08:56:57.486054	222	\N	f
3975	68	17	0	2014-02-17 07:39:32.133432	2014-02-17 09:23:06.578938	214	\N	t
3976	68	17	0	2014-02-17 07:39:32.137778	2014-02-17 08:56:57.518097	215	\N	f
3995	42	17	1	2014-02-17 07:39:32.234733	2014-02-17 09:23:30.167095	114	\N	t
3981	45	17	0	2014-02-17 07:39:32.165302	2014-02-17 08:56:57.548267	123	\N	f
3987	48	17	0	2014-02-17 07:39:32.19426	2014-02-17 08:56:57.577868	136	\N	f
3990	47	17	0	2014-02-17 07:39:32.210133	2014-02-17 08:56:57.593138	131	\N	f
3982	45	17	0	2014-02-17 07:39:32.169631	2014-02-17 09:23:55.079246	124	\N	t
3997	58	17	0	2014-02-17 07:39:32.24625	2014-02-17 08:56:57.63153	176	\N	f
4002	41	17	0	2014-02-17 07:39:32.271034	2014-02-17 08:56:57.657867	110	\N	f
4014	27	18	0	2014-02-17 07:39:32.354296	2014-02-17 09:04:13.953713	53	\N	f
4009	18	18	0	2014-02-17 07:39:32.328978	2014-02-17 09:04:07.298517	16	\N	f
4031	23	18	0	2014-02-17 07:39:32.474807	2014-02-17 09:04:59.148347	38	\N	f
4039	36	18	2	2014-02-17 07:39:32.515088	2014-02-17 09:07:36.18621	90	\N	t
4066	17	18	2	2014-02-17 07:39:32.65169	2014-02-17 09:10:35.118757	13	\N	t
3963	38	17	0	2014-02-17 07:39:32.073164	2014-02-17 09:21:43.76175	95	\N	f
3973	66	17	2	2014-02-17 07:39:32.122104	2014-02-17 09:22:53.712924	208	\N	t
3979	40	17	1	2014-02-17 07:39:32.153641	2014-02-17 09:23:19.396092	106	\N	t
4067	17	18	0	2014-02-17 07:39:32.655973	2014-02-17 07:39:32.655973	14	\N	f
4068	19	18	0	2014-02-17 07:39:32.66333	2014-02-17 07:39:32.66333	19	\N	f
4070	19	18	0	2014-02-17 07:39:32.672359	2014-02-17 07:39:32.672359	21	\N	f
4071	19	18	0	2014-02-17 07:39:32.676752	2014-02-17 07:39:32.676752	22	\N	f
4072	25	18	0	2014-02-17 07:39:32.68393	2014-02-17 07:39:32.68393	43	\N	f
4074	25	18	0	2014-02-17 07:39:32.692609	2014-02-17 07:39:32.692609	45	\N	f
4075	25	18	0	2014-02-17 07:39:32.697039	2014-02-17 07:39:32.697039	46	\N	f
4076	21	18	0	2014-02-17 07:39:32.704225	2014-02-17 07:39:32.704225	27	\N	f
4078	21	18	0	2014-02-17 07:39:32.713022	2014-02-17 07:39:32.713022	29	\N	f
4079	21	18	0	2014-02-17 07:39:32.717381	2014-02-17 07:39:32.717381	30	\N	f
4080	67	18	0	2014-02-17 07:39:32.724467	2014-02-17 07:39:32.724467	210	\N	f
4081	67	18	0	2014-02-17 07:39:32.728893	2014-02-17 07:39:32.728893	211	\N	f
4082	67	18	0	2014-02-17 07:39:32.733271	2014-02-17 07:39:32.733271	212	\N	f
4085	46	18	0	2014-02-17 07:39:32.749022	2014-02-17 07:39:32.749022	128	\N	f
4086	46	18	0	2014-02-17 07:39:32.753356	2014-02-17 07:39:32.753356	129	\N	f
4089	76	18	0	2014-02-17 07:39:32.769241	2014-02-17 07:39:32.769241	240	\N	f
4090	76	18	0	2014-02-17 07:39:32.77354	2014-02-17 07:39:32.77354	241	\N	f
4091	75	18	0	2014-02-17 07:39:32.781138	2014-02-17 07:39:32.781138	235	\N	f
4094	53	18	0	2014-02-17 07:39:32.797181	2014-02-17 07:39:32.797181	154	\N	f
4095	53	18	0	2014-02-17 07:39:32.801558	2014-02-17 07:39:32.801558	155	\N	f
4097	53	18	0	2014-02-17 07:39:32.810246	2014-02-17 07:39:32.810246	157	\N	f
4101	54	18	0	2014-02-17 07:39:32.830501	2014-02-17 07:39:32.830501	161	\N	f
4102	54	18	0	2014-02-17 07:39:32.834802	2014-02-17 07:39:32.834802	162	\N	f
4103	63	18	0	2014-02-17 07:39:32.841752	2014-02-17 07:39:32.841752	197	\N	f
4105	52	18	0	2014-02-17 07:39:32.85327	2014-02-17 07:39:32.85327	150	\N	f
4106	52	18	0	2014-02-17 07:39:32.857612	2014-02-17 07:39:32.857612	151	\N	f
4108	52	18	0	2014-02-17 07:39:32.866243	2014-02-17 07:39:32.866243	153	\N	f
4109	44	18	0	2014-02-17 07:39:32.87352	2014-02-17 07:39:32.87352	119	\N	f
4111	44	18	0	2014-02-17 07:39:32.882243	2014-02-17 07:39:32.882243	121	\N	f
4112	44	18	0	2014-02-17 07:39:32.886561	2014-02-17 07:39:32.886561	122	\N	f
4113	55	18	0	2014-02-17 07:39:32.893778	2014-02-17 07:39:32.893778	163	\N	f
4114	55	18	0	2014-02-17 07:39:32.898125	2014-02-17 07:39:32.898125	164	\N	f
4116	55	18	0	2014-02-17 07:39:32.906745	2014-02-17 07:39:32.906745	166	\N	f
4117	51	18	0	2014-02-17 07:39:32.913768	2014-02-17 07:39:32.913768	147	\N	f
4119	51	18	0	2014-02-17 07:39:32.922381	2014-02-17 07:39:32.922381	149	\N	f
4121	43	18	0	2014-02-17 07:39:32.933905	2014-02-17 07:39:32.933905	116	\N	f
4122	43	18	0	2014-02-17 07:39:32.938248	2014-02-17 07:39:32.938248	117	\N	f
4123	43	18	0	2014-02-17 07:39:32.942611	2014-02-17 07:39:32.942611	118	\N	f
4125	61	18	0	2014-02-17 07:39:32.954323	2014-02-17 07:39:32.954323	190	\N	f
4127	61	18	0	2014-02-17 07:39:32.963004	2014-02-17 07:39:32.963004	192	\N	f
4128	61	18	0	2014-02-17 07:39:32.967392	2014-02-17 07:39:32.967392	193	\N	f
4129	62	18	0	2014-02-17 07:39:32.974507	2014-02-17 07:39:32.974507	194	\N	f
4132	59	18	0	2014-02-17 07:39:32.990667	2014-02-17 07:39:32.990667	179	\N	f
4133	59	18	0	2014-02-17 07:39:32.995082	2014-02-17 07:39:32.995082	180	\N	f
4136	59	18	0	2014-02-17 07:39:33.008181	2014-02-17 07:39:33.008181	183	\N	f
4138	50	18	0	2014-02-17 07:39:33.019851	2014-02-17 07:39:33.019851	144	\N	f
4140	50	18	0	2014-02-17 07:39:33.028594	2014-02-17 07:39:33.028594	146	\N	f
4141	49	18	0	2014-02-17 07:39:33.036014	2014-02-17 07:39:33.036014	138	\N	f
4143	49	18	0	2014-02-17 07:39:33.044817	2014-02-17 07:39:33.044817	140	\N	f
4145	49	18	0	2014-02-17 07:39:33.053572	2014-02-17 07:39:33.053572	142	\N	f
4146	71	18	0	2014-02-17 07:39:33.060705	2014-02-17 07:39:33.060705	223	\N	f
4147	71	18	0	2014-02-17 07:39:33.065126	2014-02-17 07:39:33.065126	224	\N	f
4151	73	18	0	2014-02-17 07:39:33.085516	2014-02-17 07:39:33.085516	231	\N	f
4153	72	18	0	2014-02-17 07:39:33.097092	2014-02-17 07:39:33.097092	227	\N	f
4155	74	18	0	2014-02-17 07:39:33.108685	2014-02-17 07:39:33.108685	232	\N	f
4159	57	18	0	2014-02-17 07:39:33.129226	2014-02-17 07:39:33.129226	172	\N	f
4160	57	18	0	2014-02-17 07:39:33.133678	2014-02-17 07:39:33.133678	173	\N	f
4161	57	18	0	2014-02-17 07:39:33.138117	2014-02-17 07:39:33.138117	174	\N	f
4162	56	18	0	2014-02-17 07:39:33.14543	2014-02-17 07:39:33.14543	167	\N	f
4163	56	18	0	2014-02-17 07:39:33.149917	2014-02-17 07:39:33.149917	168	\N	f
4167	65	18	0	2014-02-17 07:39:33.170449	2014-02-17 07:39:33.170449	203	\N	f
4169	65	18	0	2014-02-17 07:39:33.179436	2014-02-17 07:39:33.179436	205	\N	f
4170	60	18	0	2014-02-17 07:39:33.187117	2014-02-17 07:39:33.187117	184	\N	f
4172	60	18	0	2014-02-17 07:39:33.23003	2014-02-17 07:39:33.23003	186	\N	f
4173	60	18	0	2014-02-17 07:39:33.23441	2014-02-17 07:39:33.23441	187	\N	f
4083	67	18	2	2014-02-17 07:39:32.737567	2014-02-17 09:12:49.437889	213	\N	t
4084	46	18	1	2014-02-17 07:39:32.744702	2014-02-17 09:13:37.616408	127	\N	t
4087	76	18	0	2014-02-17 07:39:32.760522	2014-02-17 09:14:18.841516	238	\N	t
4092	75	18	0	2014-02-17 07:39:32.785515	2014-02-17 09:14:51.532579	236	\N	t
4088	76	18	0	2014-02-17 07:39:32.764927	2014-02-17 08:56:47.545378	239	\N	f
4093	75	18	0	2014-02-17 07:39:32.789866	2014-02-17 08:56:47.573745	237	\N	f
4098	53	18	0	2014-02-17 07:39:32.814575	2014-02-17 08:56:47.598816	158	\N	f
4099	54	18	0	2014-02-17 07:39:32.821762	2014-02-17 08:56:47.610689	159	\N	f
4110	44	18	2	2014-02-17 07:39:32.877849	2014-02-17 09:17:34.795534	120	\N	t
4115	55	18	2	2014-02-17 07:39:32.902427	2014-02-17 09:17:46.787202	165	\N	t
4135	59	18	0	2014-02-17 07:39:33.003819	2014-02-17 09:21:21.939926	182	\N	f
4120	43	18	2	2014-02-17 07:39:32.929564	2014-02-17 09:18:05.078763	115	\N	t
4126	61	18	0	2014-02-17 07:39:32.958686	2014-02-17 09:18:19.022809	191	\N	t
4124	61	18	0	2014-02-17 07:39:32.949978	2014-02-17 08:56:47.745479	189	\N	f
4130	62	18	0	2014-02-17 07:39:32.978892	2014-02-17 09:19:56.345026	195	\N	f
4134	59	18	0	2014-02-17 07:39:32.999452	2014-02-17 08:56:47.79546	181	\N	f
4139	50	18	0	2014-02-17 07:39:33.024171	2014-02-17 08:56:47.82388	145	\N	f
4142	49	18	0	2014-02-17 07:39:33.040353	2014-02-17 08:56:47.842196	139	\N	f
4150	73	18	0	2014-02-17 07:39:33.081099	2014-02-17 09:22:34.848132	230	\N	t
4149	73	18	0	2014-02-17 07:39:33.076645	2014-02-17 08:56:47.877322	229	\N	f
4154	72	18	0	2014-02-17 07:39:33.101507	2014-02-17 08:56:47.89861	228	\N	f
4156	74	18	0	2014-02-17 07:39:33.113145	2014-02-17 08:56:47.913883	233	\N	f
4165	56	18	0	2014-02-17 07:39:33.158712	2014-02-17 09:23:23.211524	170	\N	t
4164	56	18	0	2014-02-17 07:39:33.15428	2014-02-17 08:56:47.960229	169	\N	f
4168	65	18	0	2014-02-17 07:39:33.174983	2014-02-17 08:56:47.978766	204	\N	f
4171	60	18	0	2014-02-17 07:39:33.227003	2014-02-17 08:56:48.000478	185	\N	f
4073	25	18	2	2014-02-17 07:39:32.688247	2014-02-17 09:12:12.367157	44	\N	t
4096	53	18	0	2014-02-17 07:39:32.805913	2014-02-17 09:15:35.202974	156	\N	t
4100	54	18	0	2014-02-17 07:39:32.826136	2014-02-17 09:16:23.993655	160	\N	t
4104	63	18	2	2014-02-17 07:39:32.846096	2014-02-17 09:16:44.930416	198	\N	t
4131	62	18	0	2014-02-17 07:39:32.983286	2014-02-17 09:19:56.445248	196	\N	t
4144	49	18	0	2014-02-17 07:39:33.049127	2014-02-17 09:22:11.188071	141	\N	t
4118	51	18	0	2014-02-17 07:39:32.918068	2014-02-17 09:21:12.609248	148	\N	f
4137	50	18	0	2014-02-17 07:39:33.015497	2014-02-17 09:21:57.415805	143	\N	f
4148	71	18	2	2014-02-17 07:39:33.069538	2014-02-17 09:22:25.926395	225	\N	t
4152	72	18	0	2014-02-17 07:39:33.092693	2014-02-17 09:22:43.903212	226	\N	t
4157	74	18	0	2014-02-17 07:39:33.117503	2014-02-17 09:23:04.284191	234	\N	t
4158	57	18	2	2014-02-17 07:39:33.124788	2014-02-17 09:23:13.531176	171	\N	t
4166	65	18	0	2014-02-17 07:39:33.16603	2014-02-17 09:23:31.795807	202	\N	t
4174	60	18	0	2014-02-17 07:39:33.238708	2014-02-17 07:39:33.238708	188	\N	f
4176	64	18	0	2014-02-17 07:39:33.250397	2014-02-17 07:39:33.250397	200	\N	f
4177	64	18	0	2014-02-17 07:39:33.25472	2014-02-17 07:39:33.25472	201	\N	f
4178	69	18	0	2014-02-17 07:39:33.259767	2014-02-17 07:39:33.259767	216	\N	f
4179	69	18	0	2014-02-17 07:39:33.262006	2014-02-17 07:39:33.262006	217	\N	f
4181	69	18	0	2014-02-17 07:39:33.266374	2014-02-17 07:39:33.266374	219	\N	f
4182	38	18	0	2014-02-17 07:39:33.270438	2014-02-17 07:39:33.270438	95	\N	f
4184	38	18	0	2014-02-17 07:39:33.275262	2014-02-17 07:39:33.275262	97	\N	f
4185	38	18	0	2014-02-17 07:39:33.277818	2014-02-17 07:39:33.277818	98	\N	f
4186	38	18	0	2014-02-17 07:39:33.280375	2014-02-17 07:39:33.280375	99	\N	f
4187	70	18	0	2014-02-17 07:39:33.28563	2014-02-17 07:39:33.28563	220	\N	f
4188	70	18	0	2014-02-17 07:39:33.289192	2014-02-17 07:39:33.289192	221	\N	f
4190	66	18	0	2014-02-17 07:39:33.299887	2014-02-17 07:39:33.299887	206	\N	f
4191	66	18	0	2014-02-17 07:39:33.304189	2014-02-17 07:39:33.304189	207	\N	f
4193	66	18	0	2014-02-17 07:39:33.312944	2014-02-17 07:39:33.312944	209	\N	f
4196	40	18	0	2014-02-17 07:39:33.331548	2014-02-17 07:39:33.331548	104	\N	f
4197	40	18	0	2014-02-17 07:39:33.335953	2014-02-17 07:39:33.335953	105	\N	f
4199	40	18	0	2014-02-17 07:39:33.344826	2014-02-17 07:39:33.344826	107	\N	f
4201	45	18	0	2014-02-17 07:39:33.35632	2014-02-17 07:39:33.35632	124	\N	f
4202	45	18	0	2014-02-17 07:39:33.3609	2014-02-17 07:39:33.3609	125	\N	f
4203	45	18	0	2014-02-17 07:39:33.366143	2014-02-17 07:39:33.366143	126	\N	f
4204	48	18	0	2014-02-17 07:39:33.373372	2014-02-17 07:39:33.373372	134	\N	f
4207	48	18	0	2014-02-17 07:39:33.386421	2014-02-17 07:39:33.386421	137	\N	f
4208	47	18	0	2014-02-17 07:39:33.393583	2014-02-17 07:39:33.393583	130	\N	f
4211	47	18	0	2014-02-17 07:39:33.406529	2014-02-17 07:39:33.406529	133	\N	f
4212	42	18	0	2014-02-17 07:39:33.413626	2014-02-17 07:39:33.413626	112	\N	f
4213	42	18	0	2014-02-17 07:39:33.417976	2014-02-17 07:39:33.417976	113	\N	f
4215	58	18	0	2014-02-17 07:39:33.429477	2014-02-17 07:39:33.429477	175	\N	f
4217	58	18	0	2014-02-17 07:39:33.438164	2014-02-17 07:39:33.438164	177	\N	f
4218	58	18	0	2014-02-17 07:39:33.442482	2014-02-17 07:39:33.442482	178	\N	f
4219	41	18	0	2014-02-17 07:39:33.449731	2014-02-17 07:39:33.449731	108	\N	f
4222	41	18	0	2014-02-17 07:39:33.462718	2014-02-17 07:39:33.462718	111	\N	f
4223	32	19	0	2014-02-17 07:39:33.490654	2014-02-17 07:39:33.490654	71	\N	f
4225	32	19	0	2014-02-17 07:39:33.499501	2014-02-17 07:39:33.499501	73	\N	f
4226	32	19	0	2014-02-17 07:39:33.503782	2014-02-17 07:39:33.503782	74	\N	f
4227	18	19	0	2014-02-17 07:39:33.510966	2014-02-17 07:39:33.510966	15	\N	f
4229	18	19	0	2014-02-17 07:39:33.519614	2014-02-17 07:39:33.519614	17	\N	f
4230	18	19	0	2014-02-17 07:39:33.523982	2014-02-17 07:39:33.523982	18	\N	f
4231	27	19	0	2014-02-17 07:39:33.53115	2014-02-17 07:39:33.53115	51	\N	f
4232	27	19	0	2014-02-17 07:39:33.53549	2014-02-17 07:39:33.53549	52	\N	f
4233	27	19	0	2014-02-17 07:39:33.539873	2014-02-17 07:39:33.539873	53	\N	f
4235	28	19	0	2014-02-17 07:39:33.551433	2014-02-17 07:39:33.551433	55	\N	f
4236	28	19	0	2014-02-17 07:39:33.55578	2014-02-17 07:39:33.55578	56	\N	f
4237	28	19	0	2014-02-17 07:39:33.560159	2014-02-17 07:39:33.560159	57	\N	f
4240	24	19	0	2014-02-17 07:39:33.576096	2014-02-17 07:39:33.576096	40	\N	f
4241	24	19	0	2014-02-17 07:39:33.580456	2014-02-17 07:39:33.580456	41	\N	f
4242	24	19	0	2014-02-17 07:39:33.584848	2014-02-17 07:39:33.584848	42	\N	f
4243	29	19	0	2014-02-17 07:39:33.592013	2014-02-17 07:39:33.592013	59	\N	f
4245	29	19	0	2014-02-17 07:39:33.60082	2014-02-17 07:39:33.60082	61	\N	f
4247	23	19	0	2014-02-17 07:39:33.612252	2014-02-17 07:39:33.612252	35	\N	f
4248	23	19	0	2014-02-17 07:39:33.616624	2014-02-17 07:39:33.616624	36	\N	f
4250	23	19	0	2014-02-17 07:39:33.625376	2014-02-17 07:39:33.625376	38	\N	f
4251	22	19	0	2014-02-17 07:39:33.632611	2014-02-17 07:39:33.632611	31	\N	f
4252	22	19	0	2014-02-17 07:39:33.636987	2014-02-17 07:39:33.636987	32	\N	f
4254	22	19	0	2014-02-17 07:39:33.645696	2014-02-17 07:39:33.645696	34	\N	f
4255	36	19	0	2014-02-17 07:39:33.652986	2014-02-17 07:39:33.652986	87	\N	f
4256	36	19	0	2014-02-17 07:39:33.65731	2014-02-17 07:39:33.65731	88	\N	f
4257	36	19	0	2014-02-17 07:39:33.661606	2014-02-17 07:39:33.661606	89	\N	f
4259	15	19	0	2014-02-17 07:39:33.673205	2014-02-17 07:39:33.673205	3	\N	f
4260	15	19	0	2014-02-17 07:39:33.677632	2014-02-17 07:39:33.677632	4	\N	f
4261	15	19	0	2014-02-17 07:39:33.681967	2014-02-17 07:39:33.681967	5	\N	f
4263	39	19	0	2014-02-17 07:39:33.693495	2014-02-17 07:39:33.693495	100	\N	f
4264	39	19	0	2014-02-17 07:39:33.697827	2014-02-17 07:39:33.697827	101	\N	f
4265	39	19	0	2014-02-17 07:39:33.70225	2014-02-17 07:39:33.70225	102	\N	f
4267	20	19	0	2014-02-17 07:39:33.71383	2014-02-17 07:39:33.71383	23	\N	f
4268	20	19	0	2014-02-17 07:39:33.71813	2014-02-17 07:39:33.71813	24	\N	f
4270	20	19	0	2014-02-17 07:39:33.726782	2014-02-17 07:39:33.726782	26	\N	f
4271	16	19	0	2014-02-17 07:39:33.734004	2014-02-17 07:39:33.734004	7	\N	f
4273	16	19	0	2014-02-17 07:39:33.742737	2014-02-17 07:39:33.742737	9	\N	f
4274	16	19	0	2014-02-17 07:39:33.747038	2014-02-17 07:39:33.747038	10	\N	f
4275	26	19	0	2014-02-17 07:39:33.754279	2014-02-17 07:39:33.754279	47	\N	f
4276	26	19	0	2014-02-17 07:39:33.758583	2014-02-17 07:39:33.758583	48	\N	f
4278	26	19	0	2014-02-17 07:39:33.767307	2014-02-17 07:39:33.767307	50	\N	f
4279	37	19	0	2014-02-17 07:39:33.774598	2014-02-17 07:39:33.774598	91	\N	f
4280	37	19	0	2014-02-17 07:39:33.778949	2014-02-17 07:39:33.778949	92	\N	f
4239	24	19	2	2014-02-17 07:39:33.57169	2014-02-17 08:58:17.199015	39	\N	t
4244	29	19	0	2014-02-17 07:39:33.596405	2014-02-17 09:20:48.933776	60	\N	t
4249	23	19	1	2014-02-17 07:39:33.620997	2014-02-17 09:22:18.688108	37	\N	t
4269	20	19	1	2014-02-17 07:39:33.722508	2014-02-17 09:23:21.33082	25	\N	t
4246	29	19	0	2014-02-17 07:39:33.605163	2014-02-17 08:56:45.695978	62	\N	f
4253	22	19	2	2014-02-17 07:39:33.641314	2014-02-17 09:22:52.937892	33	\N	t
4258	36	19	0	2014-02-17 07:39:33.666004	2014-02-17 09:22:59.87351	90	\N	f
4262	15	19	2	2014-02-17 07:39:33.686257	2014-02-17 08:59:32.853797	6	\N	t
4272	16	19	2	2014-02-17 07:39:33.738327	2014-02-17 09:00:22.181422	8	\N	t
4175	64	18	2	2014-02-17 07:39:33.24603	2014-02-17 09:23:45.3109	199	\N	t
4220	41	18	0	2014-02-17 07:39:33.454051	2014-02-17 09:00:42.039885	109	\N	t
4214	42	18	1	2014-02-17 07:39:33.422299	2014-02-17 09:01:10.062444	114	\N	t
4180	69	18	0	2014-02-17 07:39:33.264201	2014-02-17 09:23:50.96903	218	\N	f
4228	18	19	0	2014-02-17 07:39:33.515286	2014-02-17 09:18:31.155739	16	\N	f
4183	38	18	0	2014-02-17 07:39:33.272615	2014-02-17 08:56:48.067379	96	\N	f
4192	66	18	0	2014-02-17 07:39:33.30851	2014-02-17 08:56:48.108857	208	\N	f
4195	68	18	0	2014-02-17 07:39:33.324284	2014-02-17 08:56:48.125594	215	\N	f
4194	68	18	0	2014-02-17 07:39:33.31992	2014-02-17 09:02:36.265114	214	\N	t
4210	47	18	0	2014-02-17 07:39:33.402259	2014-02-17 09:01:59.959967	132	\N	t
4206	48	18	0	2014-02-17 07:39:33.382078	2014-02-17 08:56:48.18528	136	\N	f
4209	47	18	0	2014-02-17 07:39:33.397958	2014-02-17 08:56:48.200544	131	\N	f
4205	48	18	0	2014-02-17 07:39:33.377779	2014-02-17 09:01:32.262944	135	\N	t
4200	45	18	1	2014-02-17 07:39:33.351928	2014-02-17 09:01:46.702814	123	\N	t
4221	41	18	0	2014-02-17 07:39:33.458368	2014-02-17 08:56:48.265224	110	\N	f
4234	27	19	2	2014-02-17 07:39:33.544175	2014-02-17 09:19:28.603558	54	\N	t
4277	26	19	2	2014-02-17 07:39:33.762928	2014-02-17 09:00:51.110668	49	\N	t
4198	40	18	1	2014-02-17 07:39:33.340335	2014-02-17 09:02:26.130563	106	\N	t
4189	70	18	2	2014-02-17 07:39:33.292622	2014-02-17 09:03:11.805053	222	\N	t
4238	28	19	1	2014-02-17 07:39:33.564438	2014-02-17 09:21:03.103633	58	\N	t
4282	37	19	0	2014-02-17 07:39:33.787907	2014-02-17 07:39:33.787907	94	\N	f
4283	17	19	0	2014-02-17 07:39:33.795161	2014-02-17 07:39:33.795161	11	\N	f
4284	17	19	0	2014-02-17 07:39:33.799573	2014-02-17 07:39:33.799573	12	\N	f
4286	17	19	0	2014-02-17 07:39:33.808305	2014-02-17 07:39:33.808305	14	\N	f
4287	19	19	0	2014-02-17 07:39:33.815603	2014-02-17 07:39:33.815603	19	\N	f
4289	19	19	0	2014-02-17 07:39:33.824395	2014-02-17 07:39:33.824395	21	\N	f
4290	19	19	0	2014-02-17 07:39:33.828908	2014-02-17 07:39:33.828908	22	\N	f
4291	25	19	0	2014-02-17 07:39:33.836128	2014-02-17 07:39:33.836128	43	\N	f
4293	25	19	0	2014-02-17 07:39:33.844964	2014-02-17 07:39:33.844964	45	\N	f
4294	25	19	0	2014-02-17 07:39:33.849331	2014-02-17 07:39:33.849331	46	\N	f
4295	21	19	0	2014-02-17 07:39:33.856755	2014-02-17 07:39:33.856755	27	\N	f
4297	21	19	0	2014-02-17 07:39:33.865502	2014-02-17 07:39:33.865502	29	\N	f
4298	21	19	0	2014-02-17 07:39:33.869906	2014-02-17 07:39:33.869906	30	\N	f
4299	67	19	0	2014-02-17 07:39:33.877163	2014-02-17 07:39:33.877163	210	\N	f
4300	67	19	0	2014-02-17 07:39:33.88163	2014-02-17 07:39:33.88163	211	\N	f
4301	67	19	0	2014-02-17 07:39:33.886013	2014-02-17 07:39:33.886013	212	\N	f
4304	46	19	0	2014-02-17 07:39:33.902112	2014-02-17 07:39:33.902112	128	\N	f
4305	46	19	0	2014-02-17 07:39:33.906539	2014-02-17 07:39:33.906539	129	\N	f
4306	76	19	0	2014-02-17 07:39:33.913892	2014-02-17 07:39:33.913892	238	\N	f
4308	76	19	0	2014-02-17 07:39:33.922695	2014-02-17 07:39:33.922695	240	\N	f
4309	76	19	0	2014-02-17 07:39:33.927094	2014-02-17 07:39:33.927094	241	\N	f
4311	75	19	0	2014-02-17 07:39:33.938852	2014-02-17 07:39:33.938852	236	\N	f
4313	53	19	0	2014-02-17 07:39:33.953334	2014-02-17 07:39:33.953334	154	\N	f
4314	53	19	0	2014-02-17 07:39:33.995263	2014-02-17 07:39:33.995263	155	\N	f
4315	53	19	0	2014-02-17 07:39:33.999634	2014-02-17 07:39:33.999634	156	\N	f
4316	53	19	0	2014-02-17 07:39:34.003025	2014-02-17 07:39:34.003025	157	\N	f
4319	54	19	0	2014-02-17 07:39:34.013383	2014-02-17 07:39:34.013383	160	\N	f
4320	54	19	0	2014-02-17 07:39:34.016196	2014-02-17 07:39:34.016196	161	\N	f
4321	54	19	0	2014-02-17 07:39:34.019039	2014-02-17 07:39:34.019039	162	\N	f
4322	63	19	0	2014-02-17 07:39:34.023848	2014-02-17 07:39:34.023848	197	\N	f
4324	52	19	0	2014-02-17 07:39:34.031702	2014-02-17 07:39:34.031702	150	\N	f
4325	52	19	0	2014-02-17 07:39:34.034563	2014-02-17 07:39:34.034563	151	\N	f
4327	52	19	0	2014-02-17 07:39:34.040245	2014-02-17 07:39:34.040245	153	\N	f
4328	44	19	0	2014-02-17 07:39:34.045194	2014-02-17 07:39:34.045194	119	\N	f
4330	44	19	0	2014-02-17 07:39:34.050937	2014-02-17 07:39:34.050937	121	\N	f
4331	44	19	0	2014-02-17 07:39:34.053743	2014-02-17 07:39:34.053743	122	\N	f
4332	55	19	0	2014-02-17 07:39:34.058703	2014-02-17 07:39:34.058703	163	\N	f
4333	55	19	0	2014-02-17 07:39:34.061622	2014-02-17 07:39:34.061622	164	\N	f
4335	55	19	0	2014-02-17 07:39:34.067238	2014-02-17 07:39:34.067238	166	\N	f
4336	51	19	0	2014-02-17 07:39:34.072154	2014-02-17 07:39:34.072154	147	\N	f
4338	51	19	0	2014-02-17 07:39:34.07798	2014-02-17 07:39:34.07798	149	\N	f
4340	43	19	0	2014-02-17 07:39:34.085845	2014-02-17 07:39:34.085845	116	\N	f
4341	43	19	0	2014-02-17 07:39:34.088759	2014-02-17 07:39:34.088759	117	\N	f
4342	43	19	0	2014-02-17 07:39:34.09161	2014-02-17 07:39:34.09161	118	\N	f
4345	61	19	0	2014-02-17 07:39:34.102379	2014-02-17 07:39:34.102379	191	\N	f
4346	61	19	0	2014-02-17 07:39:34.105189	2014-02-17 07:39:34.105189	192	\N	f
4347	61	19	0	2014-02-17 07:39:34.108039	2014-02-17 07:39:34.108039	193	\N	f
4348	62	19	0	2014-02-17 07:39:34.112968	2014-02-17 07:39:34.112968	194	\N	f
4350	62	19	0	2014-02-17 07:39:34.118649	2014-02-17 07:39:34.118649	196	\N	f
4351	59	19	0	2014-02-17 07:39:34.123751	2014-02-17 07:39:34.123751	179	\N	f
4352	59	19	0	2014-02-17 07:39:34.126598	2014-02-17 07:39:34.126598	180	\N	f
4354	59	19	0	2014-02-17 07:39:34.132259	2014-02-17 07:39:34.132259	182	\N	f
4355	59	19	0	2014-02-17 07:39:34.135114	2014-02-17 07:39:34.135114	183	\N	f
4356	50	19	0	2014-02-17 07:39:34.140076	2014-02-17 07:39:34.140076	143	\N	f
4357	50	19	0	2014-02-17 07:39:34.142932	2014-02-17 07:39:34.142932	144	\N	f
4359	50	19	0	2014-02-17 07:39:34.148593	2014-02-17 07:39:34.148593	146	\N	f
4360	49	19	0	2014-02-17 07:39:34.153665	2014-02-17 07:39:34.153665	138	\N	f
4362	49	19	0	2014-02-17 07:39:34.159428	2014-02-17 07:39:34.159428	140	\N	f
4364	49	19	0	2014-02-17 07:39:34.16515	2014-02-17 07:39:34.16515	142	\N	f
4365	71	19	0	2014-02-17 07:39:34.169999	2014-02-17 07:39:34.169999	223	\N	f
4366	71	19	0	2014-02-17 07:39:34.172898	2014-02-17 07:39:34.172898	224	\N	f
4369	73	19	0	2014-02-17 07:39:34.183566	2014-02-17 07:39:34.183566	230	\N	f
4370	73	19	0	2014-02-17 07:39:34.186441	2014-02-17 07:39:34.186441	231	\N	f
4371	72	19	0	2014-02-17 07:39:34.191311	2014-02-17 07:39:34.191311	226	\N	f
4372	72	19	0	2014-02-17 07:39:34.194177	2014-02-17 07:39:34.194177	227	\N	f
4374	74	19	0	2014-02-17 07:39:34.201922	2014-02-17 07:39:34.201922	232	\N	f
4376	74	19	0	2014-02-17 07:39:34.207653	2014-02-17 07:39:34.207653	234	\N	f
4378	57	19	0	2014-02-17 07:39:34.215495	2014-02-17 07:39:34.215495	172	\N	f
4379	57	19	0	2014-02-17 07:39:34.218333	2014-02-17 07:39:34.218333	173	\N	f
4380	57	19	0	2014-02-17 07:39:34.221205	2014-02-17 07:39:34.221205	174	\N	f
4381	56	19	0	2014-02-17 07:39:34.227986	2014-02-17 07:39:34.227986	167	\N	f
4382	56	19	0	2014-02-17 07:39:34.232419	2014-02-17 07:39:34.232419	168	\N	f
4384	56	19	0	2014-02-17 07:39:34.2417	2014-02-17 07:39:34.2417	170	\N	f
4385	65	19	0	2014-02-17 07:39:34.249125	2014-02-17 07:39:34.249125	202	\N	f
4386	65	19	0	2014-02-17 07:39:34.25379	2014-02-17 07:39:34.25379	203	\N	f
4292	25	19	2	2014-02-17 07:39:33.840489	2014-02-17 09:01:40.121997	44	\N	t
4288	19	19	0	2014-02-17 07:39:33.819981	2014-02-17 08:56:45.941416	20	\N	f
4296	21	19	2	2014-02-17 07:39:33.861181	2014-02-17 09:01:54.956051	28	\N	t
4302	67	19	2	2014-02-17 07:39:33.89043	2014-02-17 09:02:08.12564	213	\N	t
4303	46	19	1	2014-02-17 07:39:33.897695	2014-02-17 09:02:24.863009	127	\N	t
4307	76	19	1	2014-02-17 07:39:33.91831	2014-02-17 09:02:37.665775	239	\N	t
4312	75	19	1	2014-02-17 07:39:33.943337	2014-02-17 09:04:06.906406	237	\N	t
4317	53	19	2	2014-02-17 07:39:34.005498	2014-02-17 09:05:53.774084	158	\N	t
4323	63	19	2	2014-02-17 07:39:34.026748	2014-02-17 09:07:09.219664	198	\N	t
4326	52	19	2	2014-02-17 07:39:34.037408	2014-02-17 09:07:25.618226	152	\N	t
4337	51	19	2	2014-02-17 07:39:34.075073	2014-02-17 09:07:38.335932	148	\N	t
4329	44	19	0	2014-02-17 07:39:34.048022	2014-02-17 08:56:46.166518	120	\N	f
4334	55	19	0	2014-02-17 07:39:34.064407	2014-02-17 08:56:46.189733	165	\N	f
4339	43	19	2	2014-02-17 07:39:34.083006	2014-02-17 09:07:45.002641	115	\N	t
4343	61	19	2	2014-02-17 07:39:34.096613	2014-02-17 09:08:28.433853	189	\N	t
4353	59	19	2	2014-02-17 07:39:34.12946	2014-02-17 09:09:29.589424	181	\N	t
4349	62	19	0	2014-02-17 07:39:34.115828	2014-02-17 08:56:46.276148	195	\N	f
4358	50	19	2	2014-02-17 07:39:34.145771	2014-02-17 09:09:47.393736	145	\N	t
4363	49	19	0	2014-02-17 07:39:34.162287	2014-02-17 09:10:13.519636	141	\N	t
4361	49	19	0	2014-02-17 07:39:34.156484	2014-02-17 08:56:46.341505	139	\N	f
4368	73	19	2	2014-02-17 07:39:34.180625	2014-02-17 09:10:32.306932	229	\N	t
4373	72	19	2	2014-02-17 07:39:34.19705	2014-02-17 09:10:41.84932	228	\N	t
4375	74	19	2	2014-02-17 07:39:34.204824	2014-02-17 09:11:32.651875	233	\N	t
4377	57	19	2	2014-02-17 07:39:34.212608	2014-02-17 09:11:46.865554	171	\N	t
4383	56	19	2	2014-02-17 07:39:34.237057	2014-02-17 09:11:57.963477	169	\N	t
4387	65	19	2	2014-02-17 07:39:34.258185	2014-02-17 09:12:19.094579	204	\N	t
4310	75	19	0	2014-02-17 07:39:33.934408	2014-02-17 09:04:06.8512	235	\N	f
4344	61	19	0	2014-02-17 07:39:34.099554	2014-02-17 09:08:28.40932	190	\N	f
4367	71	19	2	2014-02-17 07:39:34.175755	2014-02-17 09:10:23.447284	225	\N	t
4388	65	19	0	2014-02-17 07:39:34.262536	2014-02-17 07:39:34.262536	205	\N	f
4389	60	19	0	2014-02-17 07:39:34.270179	2014-02-17 07:39:34.270179	184	\N	f
4391	60	19	0	2014-02-17 07:39:34.278969	2014-02-17 07:39:34.278969	186	\N	f
4392	60	19	0	2014-02-17 07:39:34.283315	2014-02-17 07:39:34.283315	187	\N	f
4393	60	19	0	2014-02-17 07:39:34.28766	2014-02-17 07:39:34.28766	188	\N	f
4396	64	19	0	2014-02-17 07:39:34.303911	2014-02-17 07:39:34.303911	201	\N	f
4397	69	19	0	2014-02-17 07:39:34.311099	2014-02-17 07:39:34.311099	216	\N	f
4398	69	19	0	2014-02-17 07:39:34.315512	2014-02-17 07:39:34.315512	217	\N	f
4400	69	19	0	2014-02-17 07:39:34.324219	2014-02-17 07:39:34.324219	219	\N	f
4401	38	19	0	2014-02-17 07:39:34.331675	2014-02-17 07:39:34.331675	95	\N	f
4403	38	19	0	2014-02-17 07:39:34.340482	2014-02-17 07:39:34.340482	97	\N	f
4404	38	19	0	2014-02-17 07:39:34.344843	2014-02-17 07:39:34.344843	98	\N	f
4405	38	19	0	2014-02-17 07:39:34.349169	2014-02-17 07:39:34.349169	99	\N	f
4406	70	19	0	2014-02-17 07:39:34.356354	2014-02-17 07:39:34.356354	220	\N	f
4409	66	19	0	2014-02-17 07:39:34.372372	2014-02-17 07:39:34.372372	206	\N	f
4410	66	19	0	2014-02-17 07:39:34.376813	2014-02-17 07:39:34.376813	207	\N	f
4412	66	19	0	2014-02-17 07:39:34.385552	2014-02-17 07:39:34.385552	209	\N	f
4415	40	19	0	2014-02-17 07:39:34.40413	2014-02-17 07:39:34.40413	104	\N	f
4416	40	19	0	2014-02-17 07:39:34.408504	2014-02-17 07:39:34.408504	105	\N	f
4418	40	19	0	2014-02-17 07:39:34.417311	2014-02-17 07:39:34.417311	107	\N	f
4421	45	19	0	2014-02-17 07:39:34.43334	2014-02-17 07:39:34.43334	125	\N	f
4422	45	19	0	2014-02-17 07:39:34.437658	2014-02-17 07:39:34.437658	126	\N	f
4423	48	19	0	2014-02-17 07:39:34.445038	2014-02-17 07:39:34.445038	134	\N	f
4424	48	19	0	2014-02-17 07:39:34.449349	2014-02-17 07:39:34.449349	135	\N	f
4426	48	19	0	2014-02-17 07:39:34.458045	2014-02-17 07:39:34.458045	137	\N	f
4427	47	19	0	2014-02-17 07:39:34.465258	2014-02-17 07:39:34.465258	130	\N	f
4429	47	19	0	2014-02-17 07:39:34.474014	2014-02-17 07:39:34.474014	132	\N	f
4430	47	19	0	2014-02-17 07:39:34.47831	2014-02-17 07:39:34.47831	133	\N	f
4431	42	19	0	2014-02-17 07:39:34.485478	2014-02-17 07:39:34.485478	112	\N	f
4432	42	19	0	2014-02-17 07:39:34.489776	2014-02-17 07:39:34.489776	113	\N	f
4434	58	19	0	2014-02-17 07:39:34.501311	2014-02-17 07:39:34.501311	175	\N	f
4436	58	19	0	2014-02-17 07:39:34.510409	2014-02-17 07:39:34.510409	177	\N	f
4437	58	19	0	2014-02-17 07:39:34.514704	2014-02-17 07:39:34.514704	178	\N	f
4438	41	19	0	2014-02-17 07:39:34.52218	2014-02-17 07:39:34.52218	108	\N	f
4441	41	19	0	2014-02-17 07:39:34.5353	2014-02-17 07:39:34.5353	111	\N	f
4442	32	20	0	2014-02-17 07:39:34.564096	2014-02-17 07:39:34.564096	71	\N	f
4444	32	20	0	2014-02-17 07:39:34.573102	2014-02-17 07:39:34.573102	73	\N	f
4445	32	20	0	2014-02-17 07:39:34.577514	2014-02-17 07:39:34.577514	74	\N	f
4446	18	20	0	2014-02-17 07:39:34.584877	2014-02-17 07:39:34.584877	15	\N	f
4449	18	20	0	2014-02-17 07:39:34.598165	2014-02-17 07:39:34.598165	18	\N	f
4450	27	20	0	2014-02-17 07:39:34.605962	2014-02-17 07:39:34.605962	51	\N	f
4451	27	20	0	2014-02-17 07:39:34.653523	2014-02-17 07:39:34.653523	52	\N	f
4454	28	20	0	2014-02-17 07:39:34.66948	2014-02-17 07:39:34.66948	55	\N	f
4455	28	20	0	2014-02-17 07:39:34.673862	2014-02-17 07:39:34.673862	56	\N	f
4456	28	20	0	2014-02-17 07:39:34.678208	2014-02-17 07:39:34.678208	57	\N	f
4459	24	20	0	2014-02-17 07:39:34.694244	2014-02-17 07:39:34.694244	40	\N	f
4460	24	20	0	2014-02-17 07:39:34.698563	2014-02-17 07:39:34.698563	41	\N	f
4461	24	20	0	2014-02-17 07:39:34.70288	2014-02-17 07:39:34.70288	42	\N	f
4462	29	20	0	2014-02-17 07:39:34.710206	2014-02-17 07:39:34.710206	59	\N	f
4463	29	20	0	2014-02-17 07:39:34.714546	2014-02-17 07:39:34.714546	60	\N	f
4466	23	20	0	2014-02-17 07:39:34.730475	2014-02-17 07:39:34.730475	35	\N	f
4467	23	20	0	2014-02-17 07:39:34.734871	2014-02-17 07:39:34.734871	36	\N	f
4469	23	20	0	2014-02-17 07:39:34.743613	2014-02-17 07:39:34.743613	38	\N	f
4470	22	20	0	2014-02-17 07:39:34.750869	2014-02-17 07:39:34.750869	31	\N	f
4471	22	20	0	2014-02-17 07:39:34.755221	2014-02-17 07:39:34.755221	32	\N	f
4474	36	20	0	2014-02-17 07:39:34.77131	2014-02-17 07:39:34.77131	87	\N	f
4475	36	20	0	2014-02-17 07:39:34.775713	2014-02-17 07:39:34.775713	88	\N	f
4478	15	20	0	2014-02-17 07:39:34.791688	2014-02-17 07:39:34.791688	3	\N	f
4479	15	20	0	2014-02-17 07:39:34.796175	2014-02-17 07:39:34.796175	4	\N	f
4480	15	20	0	2014-02-17 07:39:34.800513	2014-02-17 07:39:34.800513	5	\N	f
4482	39	20	0	2014-02-17 07:39:34.812117	2014-02-17 07:39:34.812117	100	\N	f
4483	39	20	0	2014-02-17 07:39:34.816474	2014-02-17 07:39:34.816474	101	\N	f
4484	39	20	0	2014-02-17 07:39:34.820973	2014-02-17 07:39:34.820973	102	\N	f
4486	20	20	0	2014-02-17 07:39:34.832433	2014-02-17 07:39:34.832433	23	\N	f
4487	20	20	0	2014-02-17 07:39:34.836872	2014-02-17 07:39:34.836872	24	\N	f
4489	20	20	0	2014-02-17 07:39:34.845532	2014-02-17 07:39:34.845532	26	\N	f
4490	16	20	0	2014-02-17 07:39:34.852772	2014-02-17 07:39:34.852772	7	\N	f
4492	16	20	0	2014-02-17 07:39:34.861553	2014-02-17 07:39:34.861553	9	\N	f
4494	26	20	0	2014-02-17 07:39:34.873083	2014-02-17 07:39:34.873083	47	\N	f
4394	64	19	0	2014-02-17 07:39:34.294955	2014-02-17 08:56:46.586466	199	\N	f
4402	38	19	2	2014-02-17 07:39:34.336038	2014-02-17 09:14:23.822548	96	\N	t
4407	70	19	0	2014-02-17 07:39:34.36084	2014-02-17 09:15:02.527732	221	\N	t
4408	70	19	0	2014-02-17 07:39:34.365179	2014-02-17 08:56:46.659542	222	\N	f
4413	68	19	0	2014-02-17 07:39:34.392504	2014-02-17 09:15:29.938562	214	\N	t
4414	68	19	0	2014-02-17 07:39:34.396986	2014-02-17 08:56:46.69158	215	\N	f
4417	40	19	0	2014-02-17 07:39:34.412948	2014-02-17 09:16:04.943157	106	\N	f
4419	45	19	0	2014-02-17 07:39:34.424512	2014-02-17 08:56:46.721785	123	\N	f
4425	48	19	0	2014-02-17 07:39:34.453663	2014-02-17 08:56:46.751337	136	\N	f
4435	58	19	1	2014-02-17 07:39:34.506012	2014-02-17 09:17:45.995581	176	\N	t
4439	41	19	0	2014-02-17 07:39:34.526548	2014-02-17 09:18:23.476962	109	\N	t
4440	41	19	0	2014-02-17 07:39:34.530889	2014-02-17 08:56:46.872472	110	\N	f
4443	32	20	0	2014-02-17 07:39:34.568625	2014-02-17 08:57:53.339401	72	\N	f
4447	18	20	0	2014-02-17 07:39:34.589345	2014-02-17 08:56:48.470325	16	\N	f
4453	27	20	0	2014-02-17 07:39:34.662247	2014-02-17 08:56:48.501767	54	\N	f
4458	24	20	2	2014-02-17 07:39:34.689917	2014-02-17 09:00:05.698825	39	\N	t
4464	29	20	0	2014-02-17 07:39:34.718823	2014-02-17 09:01:00.804237	61	\N	t
4465	29	20	0	2014-02-17 07:39:34.723247	2014-02-17 08:56:48.563711	62	\N	f
4473	22	20	0	2014-02-17 07:39:34.764007	2014-02-17 09:02:34.197644	34	\N	t
4472	22	20	0	2014-02-17 07:39:34.759711	2014-02-17 08:56:48.63544	33	\N	f
4477	36	20	0	2014-02-17 07:39:34.784423	2014-02-17 08:56:48.657007	90	\N	f
4485	39	20	1	2014-02-17 07:39:34.825254	2014-02-17 09:03:43.183189	103	\N	t
4488	20	20	1	2014-02-17 07:39:34.84121	2014-02-17 09:03:56.908077	25	\N	t
4493	16	20	0	2014-02-17 07:39:34.865909	2014-02-17 09:04:24.904903	10	\N	t
4491	16	20	0	2014-02-17 07:39:34.857211	2014-02-17 08:56:48.733941	8	\N	f
4448	18	20	0	2014-02-17 07:39:34.593769	2014-02-17 08:58:46.059587	17	\N	t
4452	27	20	0	2014-02-17 07:39:34.657906	2014-02-17 08:59:10.197209	53	\N	t
4468	23	20	1	2014-02-17 07:39:34.739227	2014-02-17 09:02:06.402602	37	\N	t
4476	36	20	0	2014-02-17 07:39:34.780101	2014-02-17 09:03:07.998872	89	\N	t
4481	15	20	2	2014-02-17 07:39:34.804957	2014-02-17 09:03:34.065876	6	\N	t
4399	69	19	2	2014-02-17 07:39:34.319916	2014-02-17 09:13:59.025933	218	\N	t
4395	64	19	0	2014-02-17 07:39:34.299378	2014-02-17 09:13:44.284634	200	\N	f
4411	66	19	2	2014-02-17 07:39:34.381209	2014-02-17 09:15:21.901818	208	\N	t
4420	45	19	0	2014-02-17 07:39:34.428944	2014-02-17 09:16:12.635469	124	\N	t
4433	42	19	1	2014-02-17 07:39:34.49414	2014-02-17 09:17:29.666958	114	\N	t
4495	26	20	0	2014-02-17 07:39:34.877489	2014-02-17 07:39:34.877489	48	\N	f
4497	26	20	0	2014-02-17 07:39:34.886274	2014-02-17 07:39:34.886274	50	\N	f
4498	37	20	0	2014-02-17 07:39:34.893565	2014-02-17 07:39:34.893565	91	\N	f
4499	37	20	0	2014-02-17 07:39:34.897865	2014-02-17 07:39:34.897865	92	\N	f
4501	37	20	0	2014-02-17 07:39:34.906734	2014-02-17 07:39:34.906734	94	\N	f
4502	17	20	0	2014-02-17 07:39:34.914168	2014-02-17 07:39:34.914168	11	\N	f
4503	17	20	0	2014-02-17 07:39:34.918499	2014-02-17 07:39:34.918499	12	\N	f
4505	17	20	0	2014-02-17 07:39:34.927225	2014-02-17 07:39:34.927225	14	\N	f
4506	19	20	0	2014-02-17 07:39:34.934477	2014-02-17 07:39:34.934477	19	\N	f
4509	19	20	0	2014-02-17 07:39:34.947583	2014-02-17 07:39:34.947583	22	\N	f
4510	25	20	0	2014-02-17 07:39:34.955	2014-02-17 07:39:34.955	43	\N	f
4512	25	20	0	2014-02-17 07:39:34.964016	2014-02-17 07:39:34.964016	45	\N	f
4513	25	20	0	2014-02-17 07:39:34.968428	2014-02-17 07:39:34.968428	46	\N	f
4514	21	20	0	2014-02-17 07:39:34.975752	2014-02-17 07:39:34.975752	27	\N	f
4516	21	20	0	2014-02-17 07:39:34.984718	2014-02-17 07:39:34.984718	29	\N	f
4517	21	20	0	2014-02-17 07:39:34.989126	2014-02-17 07:39:34.989126	30	\N	f
4518	67	20	0	2014-02-17 07:39:34.996359	2014-02-17 07:39:34.996359	210	\N	f
4519	67	20	0	2014-02-17 07:39:35.000795	2014-02-17 07:39:35.000795	211	\N	f
4520	67	20	0	2014-02-17 07:39:35.005208	2014-02-17 07:39:35.005208	212	\N	f
4524	46	20	0	2014-02-17 07:39:35.025698	2014-02-17 07:39:35.025698	129	\N	f
4525	76	20	0	2014-02-17 07:39:35.033112	2014-02-17 07:39:35.033112	238	\N	f
4527	76	20	0	2014-02-17 07:39:35.041876	2014-02-17 07:39:35.041876	240	\N	f
4528	76	20	0	2014-02-17 07:39:35.046255	2014-02-17 07:39:35.046255	241	\N	f
4529	75	20	0	2014-02-17 07:39:35.053458	2014-02-17 07:39:35.053458	235	\N	f
4530	75	20	0	2014-02-17 07:39:35.057908	2014-02-17 07:39:35.057908	236	\N	f
4532	53	20	0	2014-02-17 07:39:35.069674	2014-02-17 07:39:35.069674	154	\N	f
4533	53	20	0	2014-02-17 07:39:35.073982	2014-02-17 07:39:35.073982	155	\N	f
4534	53	20	0	2014-02-17 07:39:35.078335	2014-02-17 07:39:35.078335	156	\N	f
4535	53	20	0	2014-02-17 07:39:35.08264	2014-02-17 07:39:35.08264	157	\N	f
4538	54	20	0	2014-02-17 07:39:35.098742	2014-02-17 07:39:35.098742	160	\N	f
4539	54	20	0	2014-02-17 07:39:35.103042	2014-02-17 07:39:35.103042	161	\N	f
4540	54	20	0	2014-02-17 07:39:35.107449	2014-02-17 07:39:35.107449	162	\N	f
4541	63	20	0	2014-02-17 07:39:35.114409	2014-02-17 07:39:35.114409	197	\N	f
4543	52	20	0	2014-02-17 07:39:35.126012	2014-02-17 07:39:35.126012	150	\N	f
4544	52	20	0	2014-02-17 07:39:35.130434	2014-02-17 07:39:35.130434	151	\N	f
4546	52	20	0	2014-02-17 07:39:35.139137	2014-02-17 07:39:35.139137	153	\N	f
4549	44	20	0	2014-02-17 07:39:35.155235	2014-02-17 07:39:35.155235	121	\N	f
4550	44	20	0	2014-02-17 07:39:35.159597	2014-02-17 07:39:35.159597	122	\N	f
4552	55	20	0	2014-02-17 07:39:35.171168	2014-02-17 07:39:35.171168	164	\N	f
4554	55	20	0	2014-02-17 07:39:35.179915	2014-02-17 07:39:35.179915	166	\N	f
4555	51	20	0	2014-02-17 07:39:35.187187	2014-02-17 07:39:35.187187	147	\N	f
4559	43	20	0	2014-02-17 07:39:35.207751	2014-02-17 07:39:35.207751	116	\N	f
4560	43	20	0	2014-02-17 07:39:35.212074	2014-02-17 07:39:35.212074	117	\N	f
4561	43	20	0	2014-02-17 07:39:35.216508	2014-02-17 07:39:35.216508	118	\N	f
4563	61	20	0	2014-02-17 07:39:35.228415	2014-02-17 07:39:35.228415	190	\N	f
4564	61	20	0	2014-02-17 07:39:35.232777	2014-02-17 07:39:35.232777	191	\N	f
4566	61	20	0	2014-02-17 07:39:35.241568	2014-02-17 07:39:35.241568	193	\N	f
4567	62	20	0	2014-02-17 07:39:35.248761	2014-02-17 07:39:35.248761	194	\N	f
4570	59	20	0	2014-02-17 07:39:35.265069	2014-02-17 07:39:35.265069	179	\N	f
4571	59	20	0	2014-02-17 07:39:35.269493	2014-02-17 07:39:35.269493	180	\N	f
4573	59	20	0	2014-02-17 07:39:35.278273	2014-02-17 07:39:35.278273	182	\N	f
4574	59	20	0	2014-02-17 07:39:35.282698	2014-02-17 07:39:35.282698	183	\N	f
4575	50	20	0	2014-02-17 07:39:35.290019	2014-02-17 07:39:35.290019	143	\N	f
4576	50	20	0	2014-02-17 07:39:35.294414	2014-02-17 07:39:35.294414	144	\N	f
4578	50	20	0	2014-02-17 07:39:35.303203	2014-02-17 07:39:35.303203	146	\N	f
4579	49	20	0	2014-02-17 07:39:35.310697	2014-02-17 07:39:35.310697	138	\N	f
4581	49	20	0	2014-02-17 07:39:35.319617	2014-02-17 07:39:35.319617	140	\N	f
4583	49	20	0	2014-02-17 07:39:35.32848	2014-02-17 07:39:35.32848	142	\N	f
4584	71	20	0	2014-02-17 07:39:35.335755	2014-02-17 07:39:35.335755	223	\N	f
4585	71	20	0	2014-02-17 07:39:35.340262	2014-02-17 07:39:35.340262	224	\N	f
4588	73	20	0	2014-02-17 07:39:35.356585	2014-02-17 07:39:35.356585	230	\N	f
4589	73	20	0	2014-02-17 07:39:35.401545	2014-02-17 07:39:35.401545	231	\N	f
4590	72	20	0	2014-02-17 07:39:35.406894	2014-02-17 07:39:35.406894	226	\N	f
4591	72	20	0	2014-02-17 07:39:35.411273	2014-02-17 07:39:35.411273	227	\N	f
4593	74	20	0	2014-02-17 07:39:35.422812	2014-02-17 07:39:35.422812	232	\N	f
4595	74	20	0	2014-02-17 07:39:35.431565	2014-02-17 07:39:35.431565	234	\N	f
4597	57	20	0	2014-02-17 07:39:35.441249	2014-02-17 07:39:35.441249	172	\N	f
4599	57	20	0	2014-02-17 07:39:35.450015	2014-02-17 07:39:35.450015	174	\N	f
4600	56	20	0	2014-02-17 07:39:35.457252	2014-02-17 07:39:35.457252	167	\N	f
4508	19	20	0	2014-02-17 07:39:34.943237	2014-02-17 09:07:02.918178	21	\N	f
4511	25	20	2	2014-02-17 07:39:34.959553	2014-02-17 09:07:20.294617	44	\N	t
4507	19	20	0	2014-02-17 07:39:34.938923	2014-02-17 08:56:48.825604	20	\N	f
4515	21	20	2	2014-02-17 07:39:34.98015	2014-02-17 09:07:29.802457	28	\N	t
4521	67	20	2	2014-02-17 07:39:35.009624	2014-02-17 09:07:56.603075	213	\N	t
4523	46	20	0	2014-02-17 07:39:35.021303	2014-02-17 09:08:50.329144	128	\N	t
4522	46	20	0	2014-02-17 07:39:35.016867	2014-02-17 08:56:49.10265	127	\N	f
4531	75	20	1	2014-02-17 07:39:35.062224	2014-02-17 09:09:55.390316	237	\N	t
4537	54	20	2	2014-02-17 07:39:35.094312	2014-02-17 09:10:46.894585	159	\N	t
4542	63	20	2	2014-02-17 07:39:35.118809	2014-02-17 09:11:38.621389	198	\N	t
4545	52	20	2	2014-02-17 07:39:35.134776	2014-02-17 09:12:42.198223	152	\N	t
4547	44	20	0	2014-02-17 07:39:35.14643	2014-02-17 09:13:08.947727	119	\N	t
4548	44	20	0	2014-02-17 07:39:35.150835	2014-02-17 08:56:49.25085	120	\N	f
4553	55	20	0	2014-02-17 07:39:35.175558	2014-02-17 08:56:49.277472	165	\N	f
4556	51	20	0	2014-02-17 07:39:35.191574	2014-02-17 08:56:49.301148	148	\N	f
4565	61	20	0	2014-02-17 07:39:35.237207	2014-02-17 09:14:40.853192	192	\N	t
4562	61	20	0	2014-02-17 07:39:35.223954	2014-02-17 08:56:49.337638	189	\N	f
4568	62	20	0	2014-02-17 07:39:35.253241	2014-02-17 08:56:49.369211	195	\N	f
4577	50	20	2	2014-02-17 07:39:35.298824	2014-02-17 09:16:02.947075	145	\N	t
4582	49	20	0	2014-02-17 07:39:35.324086	2014-02-17 09:16:40.553917	141	\N	t
4580	49	20	0	2014-02-17 07:39:35.315113	2014-02-17 08:56:49.434327	139	\N	f
4587	73	20	2	2014-02-17 07:39:35.351991	2014-02-17 09:17:06.92548	229	\N	t
4592	72	20	2	2014-02-17 07:39:35.415653	2014-02-17 09:17:16.284152	228	\N	t
4594	74	20	2	2014-02-17 07:39:35.427192	2014-02-17 09:17:32.491975	233	\N	t
4598	57	20	0	2014-02-17 07:39:35.445641	2014-02-17 09:17:51.882255	173	\N	t
4596	57	20	0	2014-02-17 07:39:35.43683	2014-02-17 08:56:49.522587	171	\N	f
4504	17	20	0	2014-02-17 07:39:34.92289	2014-02-17 09:06:56.112148	13	\N	f
4526	76	20	1	2014-02-17 07:39:35.037473	2014-02-17 09:09:28.987972	239	\N	t
4551	55	20	0	2014-02-17 07:39:35.166799	2014-02-17 09:13:20.788183	163	\N	t
4557	51	20	0	2014-02-17 07:39:35.196101	2014-02-17 09:13:54.311157	149	\N	t
4558	43	20	2	2014-02-17 07:39:35.20337	2014-02-17 09:14:03.519466	115	\N	t
4569	62	20	0	2014-02-17 07:39:35.257623	2014-02-17 09:15:15.164529	196	\N	t
4572	59	20	2	2014-02-17 07:39:35.273921	2014-02-17 09:15:40.489261	181	\N	t
4586	71	20	2	2014-02-17 07:39:35.344749	2014-02-17 09:16:55.866915	225	\N	t
4601	56	20	0	2014-02-17 07:39:35.461758	2014-02-17 09:18:00.309492	168	\N	t
4603	56	20	0	2014-02-17 07:39:35.470587	2014-02-17 07:39:35.470587	170	\N	f
4604	65	20	0	2014-02-17 07:39:35.477836	2014-02-17 07:39:35.477836	202	\N	f
4605	65	20	0	2014-02-17 07:39:35.482237	2014-02-17 07:39:35.482237	203	\N	f
4607	65	20	0	2014-02-17 07:39:35.49094	2014-02-17 07:39:35.49094	205	\N	f
4608	60	20	0	2014-02-17 07:39:35.498308	2014-02-17 07:39:35.498308	184	\N	f
4610	60	20	0	2014-02-17 07:39:35.50706	2014-02-17 07:39:35.50706	186	\N	f
4611	60	20	0	2014-02-17 07:39:35.511515	2014-02-17 07:39:35.511515	187	\N	f
4612	60	20	0	2014-02-17 07:39:35.51584	2014-02-17 07:39:35.51584	188	\N	f
4614	64	20	0	2014-02-17 07:39:35.527432	2014-02-17 07:39:35.527432	200	\N	f
4615	64	20	0	2014-02-17 07:39:35.531806	2014-02-17 07:39:35.531806	201	\N	f
4616	69	20	0	2014-02-17 07:39:35.539062	2014-02-17 07:39:35.539062	216	\N	f
4617	69	20	0	2014-02-17 07:39:35.543492	2014-02-17 07:39:35.543492	217	\N	f
4619	69	20	0	2014-02-17 07:39:35.552227	2014-02-17 07:39:35.552227	219	\N	f
4620	38	20	0	2014-02-17 07:39:35.559688	2014-02-17 07:39:35.559688	95	\N	f
4622	38	20	0	2014-02-17 07:39:35.56843	2014-02-17 07:39:35.56843	97	\N	f
4623	38	20	0	2014-02-17 07:39:35.572928	2014-02-17 07:39:35.572928	98	\N	f
4624	38	20	0	2014-02-17 07:39:35.577226	2014-02-17 07:39:35.577226	99	\N	f
4625	70	20	0	2014-02-17 07:39:35.584351	2014-02-17 07:39:35.584351	220	\N	f
4626	70	20	0	2014-02-17 07:39:35.5888	2014-02-17 07:39:35.5888	221	\N	f
4628	66	20	0	2014-02-17 07:39:35.600402	2014-02-17 07:39:35.600402	206	\N	f
4629	66	20	0	2014-02-17 07:39:35.604836	2014-02-17 07:39:35.604836	207	\N	f
4631	66	20	0	2014-02-17 07:39:35.613554	2014-02-17 07:39:35.613554	209	\N	f
4634	40	20	0	2014-02-17 07:39:35.632204	2014-02-17 07:39:35.632204	104	\N	f
4635	40	20	0	2014-02-17 07:39:35.636634	2014-02-17 07:39:35.636634	105	\N	f
4637	40	20	0	2014-02-17 07:39:35.645433	2014-02-17 07:39:35.645433	107	\N	f
4640	45	20	0	2014-02-17 07:39:35.661638	2014-02-17 07:39:35.661638	125	\N	f
4641	45	20	0	2014-02-17 07:39:35.665918	2014-02-17 07:39:35.665918	126	\N	f
4643	48	20	0	2014-02-17 07:39:35.677613	2014-02-17 07:39:35.677613	135	\N	f
4645	48	20	0	2014-02-17 07:39:35.686369	2014-02-17 07:39:35.686369	137	\N	f
4648	47	20	0	2014-02-17 07:39:35.702391	2014-02-17 07:39:35.702391	132	\N	f
4649	47	20	0	2014-02-17 07:39:35.706788	2014-02-17 07:39:35.706788	133	\N	f
4650	42	20	0	2014-02-17 07:39:35.713862	2014-02-17 07:39:35.713862	112	\N	f
4651	42	20	0	2014-02-17 07:39:35.71824	2014-02-17 07:39:35.71824	113	\N	f
4653	58	20	0	2014-02-17 07:39:35.729848	2014-02-17 07:39:35.729848	175	\N	f
4655	58	20	0	2014-02-17 07:39:35.738577	2014-02-17 07:39:35.738577	177	\N	f
4656	58	20	0	2014-02-17 07:39:35.742943	2014-02-17 07:39:35.742943	178	\N	f
4657	41	20	0	2014-02-17 07:39:35.750242	2014-02-17 07:39:35.750242	108	\N	f
4658	41	20	0	2014-02-17 07:39:35.754626	2014-02-17 07:39:35.754626	109	\N	f
4660	41	20	0	2014-02-17 07:39:35.763389	2014-02-17 07:39:35.763389	111	\N	f
4661	32	21	0	2014-02-17 07:39:35.791369	2014-02-17 07:39:35.791369	71	\N	f
4663	32	21	0	2014-02-17 07:39:35.800317	2014-02-17 07:39:35.800317	73	\N	f
4664	32	21	0	2014-02-17 07:39:35.804789	2014-02-17 07:39:35.804789	74	\N	f
4665	18	21	0	2014-02-17 07:39:35.81206	2014-02-17 07:39:35.81206	15	\N	f
4668	18	21	0	2014-02-17 07:39:35.825227	2014-02-17 07:39:35.825227	18	\N	f
4670	27	21	0	2014-02-17 07:39:35.836914	2014-02-17 07:39:35.836914	52	\N	f
4671	27	21	0	2014-02-17 07:39:35.841335	2014-02-17 07:39:35.841335	53	\N	f
4673	28	21	0	2014-02-17 07:39:35.852984	2014-02-17 07:39:35.852984	55	\N	f
4674	28	21	0	2014-02-17 07:39:35.857381	2014-02-17 07:39:35.857381	56	\N	f
4675	28	21	0	2014-02-17 07:39:35.861749	2014-02-17 07:39:35.861749	57	\N	f
4678	24	21	0	2014-02-17 07:39:35.878083	2014-02-17 07:39:35.878083	40	\N	f
4679	24	21	0	2014-02-17 07:39:35.882457	2014-02-17 07:39:35.882457	41	\N	f
4680	24	21	0	2014-02-17 07:39:35.886842	2014-02-17 07:39:35.886842	42	\N	f
4681	29	21	0	2014-02-17 07:39:35.894154	2014-02-17 07:39:35.894154	59	\N	f
4682	29	21	0	2014-02-17 07:39:35.898552	2014-02-17 07:39:35.898552	60	\N	f
4683	29	21	0	2014-02-17 07:39:35.902926	2014-02-17 07:39:35.902926	61	\N	f
4686	23	21	0	2014-02-17 07:39:35.918943	2014-02-17 07:39:35.918943	36	\N	f
4688	23	21	0	2014-02-17 07:39:35.927668	2014-02-17 07:39:35.927668	38	\N	f
4689	22	21	0	2014-02-17 07:39:35.934935	2014-02-17 07:39:35.934935	31	\N	f
4692	22	21	0	2014-02-17 07:39:35.94815	2014-02-17 07:39:35.94815	34	\N	f
4693	36	21	0	2014-02-17 07:39:35.95546	2014-02-17 07:39:35.95546	87	\N	f
4694	36	21	0	2014-02-17 07:39:35.959888	2014-02-17 07:39:35.959888	88	\N	f
4695	36	21	0	2014-02-17 07:39:35.964278	2014-02-17 07:39:35.964278	89	\N	f
4697	15	21	0	2014-02-17 07:39:35.975943	2014-02-17 07:39:35.975943	3	\N	f
4698	15	21	0	2014-02-17 07:39:35.980386	2014-02-17 07:39:35.980386	4	\N	f
4699	15	21	0	2014-02-17 07:39:35.984827	2014-02-17 07:39:35.984827	5	\N	f
4701	39	21	0	2014-02-17 07:39:35.996489	2014-02-17 07:39:35.996489	100	\N	f
4702	39	21	0	2014-02-17 07:39:36.000933	2014-02-17 07:39:36.000933	101	\N	f
4703	39	21	0	2014-02-17 07:39:36.005488	2014-02-17 07:39:36.005488	102	\N	f
4705	20	21	0	2014-02-17 07:39:36.017391	2014-02-17 07:39:36.017391	23	\N	f
4706	20	21	0	2014-02-17 07:39:36.021847	2014-02-17 07:39:36.021847	24	\N	f
4708	20	21	0	2014-02-17 07:39:36.030737	2014-02-17 07:39:36.030737	26	\N	f
4609	60	20	2	2014-02-17 07:39:35.502668	2014-02-17 09:19:28.497493	185	\N	t
4666	18	21	2	2014-02-17 07:39:35.816436	2014-02-17 09:47:01.133974	16	\N	t
4613	64	20	0	2014-02-17 07:39:35.523006	2014-02-17 09:20:43.973773	199	\N	f
4676	28	21	1	2014-02-17 07:39:35.866091	2014-02-17 09:21:16.262407	58	\N	t
4627	70	20	2	2014-02-17 07:39:35.593173	2014-02-17 09:21:27.192964	222	\N	t
4630	66	20	2	2014-02-17 07:39:35.609191	2014-02-17 09:21:56.921504	208	\N	t
4687	23	21	1	2014-02-17 07:39:35.923316	2014-02-17 09:44:35.499272	37	\N	t
4633	68	20	0	2014-02-17 07:39:35.625012	2014-02-17 08:56:49.842825	215	\N	f
4691	22	21	2	2014-02-17 07:39:35.943731	2014-02-17 09:40:06.192326	33	\N	t
4644	48	20	0	2014-02-17 07:39:35.681996	2014-02-17 08:56:49.902347	136	\N	f
4647	47	20	0	2014-02-17 07:39:35.698065	2014-02-17 08:56:49.917561	131	\N	f
4654	58	20	1	2014-02-17 07:39:35.734237	2014-02-17 09:23:23.955925	176	\N	t
4659	41	20	1	2014-02-17 07:39:35.75898	2014-02-17 09:23:48.227722	110	\N	t
4690	22	21	0	2014-02-17 07:39:35.939358	2014-02-17 09:40:06.118511	32	\N	f
4696	36	21	2	2014-02-17 07:39:35.9686	2014-02-17 09:03:14.759026	90	\N	t
4672	27	21	0	2014-02-17 07:39:35.845701	2014-02-17 08:56:50.677698	54	\N	f
4621	38	20	2	2014-02-17 07:39:35.564095	2014-02-17 09:21:16.744022	96	\N	t
4700	15	21	2	2014-02-17 07:39:35.989193	2014-02-17 09:03:58.250216	6	\N	t
4684	29	21	0	2014-02-17 07:39:35.907266	2014-02-17 09:21:43.836483	62	\N	f
4667	18	21	0	2014-02-17 07:39:35.820854	2014-02-17 09:47:01.070404	17	\N	f
4685	23	21	0	2014-02-17 07:39:35.914517	2014-02-17 09:44:35.444124	35	\N	f
4704	39	21	1	2014-02-17 07:39:36.009917	2014-02-17 09:04:08.458278	103	\N	t
4707	20	21	1	2014-02-17 07:39:36.026292	2014-02-17 09:04:20.35338	25	\N	t
4606	65	20	2	2014-02-17 07:39:35.486577	2014-02-17 09:18:26.853743	204	\N	t
4669	27	21	0	2014-02-17 07:39:35.832504	2014-02-17 09:20:51.133509	51	\N	t
4662	32	21	2	2014-02-17 07:39:35.795886	2014-02-17 08:57:53.923788	72	\N	t
4618	69	20	2	2014-02-17 07:39:35.54786	2014-02-17 09:20:54.239711	218	\N	t
4632	68	20	0	2014-02-17 07:39:35.620516	2014-02-17 09:22:12.428198	214	\N	t
4636	40	20	1	2014-02-17 07:39:35.641031	2014-02-17 09:22:22.580241	106	\N	t
4639	45	20	0	2014-02-17 07:39:35.657074	2014-02-17 09:22:36.251466	124	\N	t
4642	48	20	0	2014-02-17 07:39:35.6733	2014-02-17 09:22:48.737096	134	\N	t
4646	47	20	0	2014-02-17 07:39:35.693688	2014-02-17 09:23:01.992905	130	\N	t
4652	42	20	1	2014-02-17 07:39:35.722562	2014-02-17 09:23:14.228598	114	\N	t
4709	16	21	0	2014-02-17 07:39:36.038166	2014-02-17 07:39:36.038166	7	\N	f
4711	16	21	0	2014-02-17 07:39:36.047328	2014-02-17 07:39:36.047328	9	\N	f
4712	16	21	0	2014-02-17 07:39:36.051785	2014-02-17 07:39:36.051785	10	\N	f
4713	26	21	0	2014-02-17 07:39:36.059392	2014-02-17 07:39:36.059392	47	\N	f
4714	26	21	0	2014-02-17 07:39:36.064002	2014-02-17 07:39:36.064002	48	\N	f
4716	26	21	0	2014-02-17 07:39:36.113924	2014-02-17 07:39:36.113924	50	\N	f
4717	37	21	0	2014-02-17 07:39:36.119916	2014-02-17 07:39:36.119916	91	\N	f
4718	37	21	0	2014-02-17 07:39:36.122487	2014-02-17 07:39:36.122487	92	\N	f
4721	17	21	0	2014-02-17 07:39:36.133317	2014-02-17 07:39:36.133317	11	\N	f
4722	17	21	0	2014-02-17 07:39:36.136209	2014-02-17 07:39:36.136209	12	\N	f
4724	17	21	0	2014-02-17 07:39:36.141962	2014-02-17 07:39:36.141962	14	\N	f
4725	19	21	0	2014-02-17 07:39:36.146914	2014-02-17 07:39:36.146914	19	\N	f
4727	19	21	0	2014-02-17 07:39:36.152639	2014-02-17 07:39:36.152639	21	\N	f
4728	19	21	0	2014-02-17 07:39:36.155477	2014-02-17 07:39:36.155477	22	\N	f
4729	25	21	0	2014-02-17 07:39:36.161531	2014-02-17 07:39:36.161531	43	\N	f
4731	25	21	0	2014-02-17 07:39:36.170207	2014-02-17 07:39:36.170207	45	\N	f
4733	21	21	0	2014-02-17 07:39:36.181805	2014-02-17 07:39:36.181805	27	\N	f
4735	21	21	0	2014-02-17 07:39:36.190542	2014-02-17 07:39:36.190542	29	\N	f
4736	21	21	0	2014-02-17 07:39:36.194858	2014-02-17 07:39:36.194858	30	\N	f
4737	67	21	0	2014-02-17 07:39:36.202073	2014-02-17 07:39:36.202073	210	\N	f
4738	67	21	0	2014-02-17 07:39:36.206432	2014-02-17 07:39:36.206432	211	\N	f
4739	67	21	0	2014-02-17 07:39:36.210788	2014-02-17 07:39:36.210788	212	\N	f
4742	46	21	0	2014-02-17 07:39:36.226522	2014-02-17 07:39:36.226522	128	\N	f
4743	46	21	0	2014-02-17 07:39:36.23085	2014-02-17 07:39:36.23085	129	\N	f
4744	76	21	0	2014-02-17 07:39:36.238035	2014-02-17 07:39:36.238035	238	\N	f
4746	76	21	0	2014-02-17 07:39:36.246795	2014-02-17 07:39:36.246795	240	\N	f
4747	76	21	0	2014-02-17 07:39:36.251079	2014-02-17 07:39:36.251079	241	\N	f
4749	75	21	0	2014-02-17 07:39:36.262515	2014-02-17 07:39:36.262515	236	\N	f
4751	53	21	0	2014-02-17 07:39:36.274283	2014-02-17 07:39:36.274283	154	\N	f
4752	53	21	0	2014-02-17 07:39:36.278664	2014-02-17 07:39:36.278664	155	\N	f
4753	53	21	0	2014-02-17 07:39:36.28301	2014-02-17 07:39:36.28301	156	\N	f
4754	53	21	0	2014-02-17 07:39:36.287322	2014-02-17 07:39:36.287322	157	\N	f
4758	54	21	0	2014-02-17 07:39:36.307738	2014-02-17 07:39:36.307738	161	\N	f
4759	54	21	0	2014-02-17 07:39:36.312102	2014-02-17 07:39:36.312102	162	\N	f
4760	63	21	0	2014-02-17 07:39:36.319058	2014-02-17 07:39:36.319058	197	\N	f
4762	52	21	0	2014-02-17 07:39:36.330751	2014-02-17 07:39:36.330751	150	\N	f
4763	52	21	0	2014-02-17 07:39:36.335092	2014-02-17 07:39:36.335092	151	\N	f
4765	52	21	0	2014-02-17 07:39:36.343719	2014-02-17 07:39:36.343719	153	\N	f
4766	44	21	0	2014-02-17 07:39:36.350959	2014-02-17 07:39:36.350959	119	\N	f
4768	44	21	0	2014-02-17 07:39:36.359686	2014-02-17 07:39:36.359686	121	\N	f
4769	44	21	0	2014-02-17 07:39:36.364033	2014-02-17 07:39:36.364033	122	\N	f
4770	55	21	0	2014-02-17 07:39:36.371331	2014-02-17 07:39:36.371331	163	\N	f
4771	55	21	0	2014-02-17 07:39:36.375623	2014-02-17 07:39:36.375623	164	\N	f
4773	55	21	0	2014-02-17 07:39:36.384319	2014-02-17 07:39:36.384319	166	\N	f
4774	51	21	0	2014-02-17 07:39:36.391399	2014-02-17 07:39:36.391399	147	\N	f
4776	51	21	0	2014-02-17 07:39:36.400052	2014-02-17 07:39:36.400052	149	\N	f
4778	43	21	0	2014-02-17 07:39:36.411688	2014-02-17 07:39:36.411688	116	\N	f
4779	43	21	0	2014-02-17 07:39:36.416093	2014-02-17 07:39:36.416093	117	\N	f
4780	43	21	0	2014-02-17 07:39:36.420392	2014-02-17 07:39:36.420392	118	\N	f
4782	61	21	0	2014-02-17 07:39:36.432181	2014-02-17 07:39:36.432181	190	\N	f
4783	61	21	0	2014-02-17 07:39:36.436552	2014-02-17 07:39:36.436552	191	\N	f
4784	61	21	0	2014-02-17 07:39:36.44096	2014-02-17 07:39:36.44096	192	\N	f
4785	61	21	0	2014-02-17 07:39:36.44535	2014-02-17 07:39:36.44535	193	\N	f
4786	62	21	0	2014-02-17 07:39:36.452434	2014-02-17 07:39:36.452434	194	\N	f
4788	62	21	0	2014-02-17 07:39:36.461178	2014-02-17 07:39:36.461178	196	\N	f
4789	59	21	0	2014-02-17 07:39:36.468506	2014-02-17 07:39:36.468506	179	\N	f
4790	59	21	0	2014-02-17 07:39:36.472994	2014-02-17 07:39:36.472994	180	\N	f
4792	59	21	0	2014-02-17 07:39:36.481709	2014-02-17 07:39:36.481709	182	\N	f
4793	59	21	0	2014-02-17 07:39:36.486023	2014-02-17 07:39:36.486023	183	\N	f
4794	50	21	0	2014-02-17 07:39:36.49331	2014-02-17 07:39:36.49331	143	\N	f
4795	50	21	0	2014-02-17 07:39:36.497698	2014-02-17 07:39:36.497698	144	\N	f
4797	50	21	0	2014-02-17 07:39:36.506397	2014-02-17 07:39:36.506397	146	\N	f
4798	49	21	0	2014-02-17 07:39:36.513791	2014-02-17 07:39:36.513791	138	\N	f
4800	49	21	0	2014-02-17 07:39:36.522422	2014-02-17 07:39:36.522422	140	\N	f
4801	49	21	0	2014-02-17 07:39:36.527021	2014-02-17 07:39:36.527021	141	\N	f
4802	49	21	0	2014-02-17 07:39:36.531376	2014-02-17 07:39:36.531376	142	\N	f
4803	71	21	0	2014-02-17 07:39:36.538544	2014-02-17 07:39:36.538544	223	\N	f
4804	71	21	0	2014-02-17 07:39:36.542884	2014-02-17 07:39:36.542884	224	\N	f
4807	73	21	0	2014-02-17 07:39:36.55876	2014-02-17 07:39:36.55876	230	\N	f
4808	73	21	0	2014-02-17 07:39:36.563079	2014-02-17 07:39:36.563079	231	\N	f
4809	72	21	0	2014-02-17 07:39:36.570224	2014-02-17 07:39:36.570224	226	\N	f
4810	72	21	0	2014-02-17 07:39:36.57454	2014-02-17 07:39:36.57454	227	\N	f
4812	74	21	0	2014-02-17 07:39:36.586	2014-02-17 07:39:36.586	232	\N	f
4814	74	21	0	2014-02-17 07:39:36.594632	2014-02-17 07:39:36.594632	234	\N	f
4720	37	21	0	2014-02-17 07:39:36.128339	2014-02-17 09:05:59.980385	94	\N	t
4719	37	21	0	2014-02-17 07:39:36.125519	2014-02-17 08:56:50.93764	93	\N	f
4732	25	21	0	2014-02-17 07:39:36.174548	2014-02-17 09:08:09.610676	46	\N	t
4726	19	21	0	2014-02-17 07:39:36.149814	2014-02-17 08:56:50.984385	20	\N	f
4730	25	21	0	2014-02-17 07:39:36.165869	2014-02-17 08:56:51.004281	44	\N	f
4740	67	21	2	2014-02-17 07:39:36.215038	2014-02-17 09:09:07.993894	213	\N	t
4748	75	21	0	2014-02-17 07:39:36.258249	2014-02-17 09:10:17.545803	235	\N	t
4741	46	21	0	2014-02-17 07:39:36.222184	2014-02-17 08:56:51.069431	127	\N	f
4745	76	21	0	2014-02-17 07:39:36.242438	2014-02-17 08:56:51.087605	239	\N	f
4755	53	21	0	2014-02-17 07:39:36.291678	2014-02-17 08:56:51.140876	158	\N	f
4756	54	21	0	2014-02-17 07:39:36.298951	2014-02-17 08:56:51.152865	159	\N	f
4761	63	21	0	2014-02-17 07:39:36.323431	2014-02-17 08:56:51.174224	198	\N	f
4764	52	21	0	2014-02-17 07:39:36.33941	2014-02-17 08:56:51.192719	152	\N	f
4767	44	21	0	2014-02-17 07:39:36.355402	2014-02-17 08:56:51.209516	120	\N	f
4772	55	21	0	2014-02-17 07:39:36.379987	2014-02-17 08:56:51.232428	165	\N	f
4757	54	21	0	2014-02-17 07:39:36.30335	2014-02-17 09:46:43.603647	160	\N	t
4781	61	21	2	2014-02-17 07:39:36.427786	2014-02-17 09:13:06.183549	189	\N	t
4791	59	21	2	2014-02-17 07:39:36.477334	2014-02-17 09:14:08.223341	181	\N	t
4787	62	21	0	2014-02-17 07:39:36.456809	2014-02-17 08:56:51.319294	195	\N	f
4775	51	21	2	2014-02-17 07:39:36.395776	2014-02-17 09:44:14.543755	148	\N	t
4796	50	21	0	2014-02-17 07:39:36.502054	2014-02-17 08:56:51.366252	145	\N	f
4799	49	21	0	2014-02-17 07:39:36.51808	2014-02-17 08:56:51.384436	139	\N	f
4805	71	21	0	2014-02-17 07:39:36.54732	2014-02-17 08:56:51.410872	225	\N	f
4806	73	21	0	2014-02-17 07:39:36.554413	2014-02-17 08:56:51.419506	229	\N	f
4811	72	21	0	2014-02-17 07:39:36.578861	2014-02-17 08:56:51.440967	228	\N	f
4813	74	21	0	2014-02-17 07:39:36.5903	2014-02-17 08:56:51.45627	233	\N	f
4815	57	21	0	2014-02-17 07:39:36.601846	2014-02-17 08:56:51.472851	171	\N	f
4723	17	21	2	2014-02-17 07:39:36.139107	2014-02-17 09:06:14.239833	13	\N	t
4734	21	21	2	2014-02-17 07:39:36.186219	2014-02-17 09:08:44.10299	28	\N	t
4777	43	21	2	2014-02-17 07:39:36.407378	2014-02-17 09:12:23.586218	115	\N	t
4816	57	21	0	2014-02-17 07:39:36.606271	2014-02-17 07:39:36.606271	172	\N	f
4817	57	21	0	2014-02-17 07:39:36.610723	2014-02-17 07:39:36.610723	173	\N	f
4818	57	21	0	2014-02-17 07:39:36.615024	2014-02-17 07:39:36.615024	174	\N	f
4819	56	21	0	2014-02-17 07:39:36.622295	2014-02-17 07:39:36.622295	167	\N	f
4820	56	21	0	2014-02-17 07:39:36.626676	2014-02-17 07:39:36.626676	168	\N	f
4822	56	21	0	2014-02-17 07:39:36.635355	2014-02-17 07:39:36.635355	170	\N	f
4823	65	21	0	2014-02-17 07:39:36.642613	2014-02-17 07:39:36.642613	202	\N	f
4824	65	21	0	2014-02-17 07:39:36.647044	2014-02-17 07:39:36.647044	203	\N	f
4826	65	21	0	2014-02-17 07:39:36.655738	2014-02-17 07:39:36.655738	205	\N	f
4827	60	21	0	2014-02-17 07:39:36.663138	2014-02-17 07:39:36.663138	184	\N	f
4829	60	21	0	2014-02-17 07:39:36.671982	2014-02-17 07:39:36.671982	186	\N	f
4830	60	21	0	2014-02-17 07:39:36.676345	2014-02-17 07:39:36.676345	187	\N	f
4831	60	21	0	2014-02-17 07:39:36.680774	2014-02-17 07:39:36.680774	188	\N	f
4833	64	21	0	2014-02-17 07:39:36.692785	2014-02-17 07:39:36.692785	200	\N	f
4834	64	21	0	2014-02-17 07:39:36.69733	2014-02-17 07:39:36.69733	201	\N	f
4835	69	21	0	2014-02-17 07:39:36.704939	2014-02-17 07:39:36.704939	216	\N	f
4836	69	21	0	2014-02-17 07:39:36.709424	2014-02-17 07:39:36.709424	217	\N	f
4838	69	21	0	2014-02-17 07:39:36.718312	2014-02-17 07:39:36.718312	219	\N	f
4839	38	21	0	2014-02-17 07:39:36.725875	2014-02-17 07:39:36.725875	95	\N	f
4841	38	21	0	2014-02-17 07:39:36.734809	2014-02-17 07:39:36.734809	97	\N	f
4842	38	21	0	2014-02-17 07:39:36.739489	2014-02-17 07:39:36.739489	98	\N	f
4843	38	21	0	2014-02-17 07:39:36.785102	2014-02-17 07:39:36.785102	99	\N	f
4844	70	21	0	2014-02-17 07:39:36.789057	2014-02-17 07:39:36.789057	220	\N	f
4845	70	21	0	2014-02-17 07:39:36.791267	2014-02-17 07:39:36.791267	221	\N	f
4847	66	21	0	2014-02-17 07:39:36.797661	2014-02-17 07:39:36.797661	206	\N	f
4848	66	21	0	2014-02-17 07:39:36.800246	2014-02-17 07:39:36.800246	207	\N	f
4853	40	21	0	2014-02-17 07:39:36.816961	2014-02-17 07:39:36.816961	104	\N	f
4854	40	21	0	2014-02-17 07:39:36.819532	2014-02-17 07:39:36.819532	105	\N	f
4856	40	21	0	2014-02-17 07:39:36.82479	2014-02-17 07:39:36.82479	107	\N	f
4859	45	21	0	2014-02-17 07:39:36.83455	2014-02-17 07:39:36.83455	125	\N	f
4860	45	21	0	2014-02-17 07:39:36.837137	2014-02-17 07:39:36.837137	126	\N	f
4861	48	21	0	2014-02-17 07:39:36.841673	2014-02-17 07:39:36.841673	134	\N	f
4862	48	21	0	2014-02-17 07:39:36.844232	2014-02-17 07:39:36.844232	135	\N	f
4864	48	21	0	2014-02-17 07:39:36.84942	2014-02-17 07:39:36.84942	137	\N	f
4865	47	21	0	2014-02-17 07:39:36.853951	2014-02-17 07:39:36.853951	130	\N	f
4867	47	21	0	2014-02-17 07:39:36.859189	2014-02-17 07:39:36.859189	132	\N	f
4868	47	21	0	2014-02-17 07:39:36.861763	2014-02-17 07:39:36.861763	133	\N	f
4869	42	21	0	2014-02-17 07:39:36.866241	2014-02-17 07:39:36.866241	112	\N	f
4870	42	21	0	2014-02-17 07:39:36.868865	2014-02-17 07:39:36.868865	113	\N	f
4872	58	21	0	2014-02-17 07:39:36.875983	2014-02-17 07:39:36.875983	175	\N	f
4874	58	21	0	2014-02-17 07:39:36.881232	2014-02-17 07:39:36.881232	177	\N	f
4875	58	21	0	2014-02-17 07:39:36.883768	2014-02-17 07:39:36.883768	178	\N	f
4877	41	21	0	2014-02-17 07:39:36.890967	2014-02-17 07:39:36.890967	109	\N	f
4879	41	21	0	2014-02-17 07:39:36.896128	2014-02-17 07:39:36.896128	111	\N	f
4880	32	22	0	2014-02-17 07:39:36.912958	2014-02-17 07:39:36.912958	71	\N	f
4882	32	22	0	2014-02-17 07:39:36.918249	2014-02-17 07:39:36.918249	73	\N	f
4883	32	22	0	2014-02-17 07:39:36.920838	2014-02-17 07:39:36.920838	74	\N	f
4884	18	22	0	2014-02-17 07:39:36.925381	2014-02-17 07:39:36.925381	15	\N	f
4886	18	22	0	2014-02-17 07:39:36.930603	2014-02-17 07:39:36.930603	17	\N	f
4887	18	22	0	2014-02-17 07:39:36.933182	2014-02-17 07:39:36.933182	18	\N	f
4888	27	22	0	2014-02-17 07:39:36.937812	2014-02-17 07:39:36.937812	51	\N	f
4889	27	22	0	2014-02-17 07:39:36.94038	2014-02-17 07:39:36.94038	52	\N	f
4890	27	22	0	2014-02-17 07:39:36.943004	2014-02-17 07:39:36.943004	53	\N	f
4892	28	22	0	2014-02-17 07:39:36.950203	2014-02-17 07:39:36.950203	55	\N	f
4893	28	22	0	2014-02-17 07:39:36.952842	2014-02-17 07:39:36.952842	56	\N	f
4894	28	22	0	2014-02-17 07:39:36.955378	2014-02-17 07:39:36.955378	57	\N	f
4897	24	22	0	2014-02-17 07:39:36.965155	2014-02-17 07:39:36.965155	40	\N	f
4898	24	22	0	2014-02-17 07:39:36.967717	2014-02-17 07:39:36.967717	41	\N	f
4899	24	22	0	2014-02-17 07:39:36.970289	2014-02-17 07:39:36.970289	42	\N	f
4901	29	22	0	2014-02-17 07:39:36.977438	2014-02-17 07:39:36.977438	60	\N	f
4902	29	22	0	2014-02-17 07:39:36.979973	2014-02-17 07:39:36.979973	61	\N	f
4904	23	22	0	2014-02-17 07:39:36.987109	2014-02-17 07:39:36.987109	35	\N	f
4905	23	22	0	2014-02-17 07:39:36.989725	2014-02-17 07:39:36.989725	36	\N	f
4909	22	22	0	2014-02-17 07:39:37.002154	2014-02-17 07:39:37.002154	32	\N	f
4911	22	22	0	2014-02-17 07:39:37.00737	2014-02-17 07:39:37.00737	34	\N	f
4912	36	22	0	2014-02-17 07:39:37.011936	2014-02-17 07:39:37.011936	87	\N	f
4913	36	22	0	2014-02-17 07:39:37.014592	2014-02-17 07:39:37.014592	88	\N	f
4914	36	22	0	2014-02-17 07:39:37.017143	2014-02-17 07:39:37.017143	89	\N	f
4916	15	22	0	2014-02-17 07:39:37.02425	2014-02-17 07:39:37.02425	3	\N	f
4917	15	22	0	2014-02-17 07:39:37.026884	2014-02-17 07:39:37.026884	4	\N	f
4918	15	22	0	2014-02-17 07:39:37.029458	2014-02-17 07:39:37.029458	5	\N	f
4920	39	22	0	2014-02-17 07:39:37.03659	2014-02-17 07:39:37.03659	100	\N	f
4921	39	22	0	2014-02-17 07:39:37.039224	2014-02-17 07:39:37.039224	101	\N	f
4922	39	22	0	2014-02-17 07:39:37.041859	2014-02-17 07:39:37.041859	102	\N	f
4895	28	22	1	2014-02-17 07:39:36.957983	2014-02-17 08:58:38.269	58	\N	t
4908	22	22	0	2014-02-17 07:39:36.999531	2014-02-17 09:07:06.075785	31	\N	f
4896	24	22	2	2014-02-17 07:39:36.96255	2014-02-17 08:58:46.207879	39	\N	t
4900	29	22	0	2014-02-17 07:39:36.974844	2014-02-17 08:59:29.76255	59	\N	t
4903	29	22	0	2014-02-17 07:39:36.982561	2014-02-17 08:53:11.141881	62	\N	f
4906	23	22	0	2014-02-17 07:39:36.9923	2014-02-17 08:53:11.16218	37	\N	f
4855	40	21	1	2014-02-17 07:39:36.822145	2014-02-17 09:16:18.236631	106	\N	t
4919	15	22	2	2014-02-17 07:39:37.032023	2014-02-17 09:01:37.317948	6	\N	t
4891	27	22	2	2014-02-17 07:39:36.945606	2014-02-17 09:06:35.172003	54	\N	t
4825	65	21	0	2014-02-17 07:39:36.651385	2014-02-17 08:56:51.5211	204	\N	f
4828	60	21	0	2014-02-17 07:39:36.667606	2014-02-17 08:56:51.542839	185	\N	f
4832	64	21	0	2014-02-17 07:39:36.68825	2014-02-17 08:56:51.562853	199	\N	f
4837	69	21	0	2014-02-17 07:39:36.713909	2014-02-17 08:56:51.59112	218	\N	f
4840	38	21	0	2014-02-17 07:39:36.730301	2014-02-17 08:56:51.609581	96	\N	f
4846	70	21	0	2014-02-17 07:39:36.79347	2014-02-17 08:56:51.635902	222	\N	f
4849	66	21	0	2014-02-17 07:39:36.802827	2014-02-17 08:56:51.65116	208	\N	f
4852	68	21	0	2014-02-17 07:39:36.812358	2014-02-17 08:56:51.667837	215	\N	f
4858	45	21	0	2014-02-17 07:39:36.831922	2014-02-17 09:16:28.396491	124	\N	t
4857	45	21	0	2014-02-17 07:39:36.829396	2014-02-17 08:56:51.697993	123	\N	f
4866	47	21	1	2014-02-17 07:39:36.856529	2014-02-17 09:17:35.545738	131	\N	t
4871	42	21	1	2014-02-17 07:39:36.871444	2014-02-17 09:17:48.676954	114	\N	t
4873	58	21	1	2014-02-17 07:39:36.878583	2014-02-17 09:18:00.1369	176	\N	t
4876	41	21	0	2014-02-17 07:39:36.888304	2014-02-17 09:18:23.359361	108	\N	t
4878	41	21	0	2014-02-17 07:39:36.893571	2014-02-17 08:56:51.807705	110	\N	f
4885	18	22	2	2014-02-17 07:39:36.927951	2014-02-17 08:57:27.007665	16	\N	t
4907	23	22	0	2014-02-17 07:39:36.994936	2014-02-17 08:59:47.186924	38	\N	t
4910	22	22	2	2014-02-17 07:39:37.004779	2014-02-17 09:07:06.122075	33	\N	t
4863	48	21	1	2014-02-17 07:39:36.846867	2014-02-17 09:17:03.267791	136	\N	t
4851	68	21	0	2014-02-17 07:39:36.809826	2014-02-17 09:23:44.318004	214	\N	t
4850	66	21	0	2014-02-17 07:39:36.8054	2014-02-17 09:24:05.227721	209	\N	t
4924	20	22	0	2014-02-17 07:39:37.049307	2014-02-17 07:39:37.049307	23	\N	f
4925	20	22	0	2014-02-17 07:39:37.052183	2014-02-17 07:39:37.052183	24	\N	f
4927	20	22	0	2014-02-17 07:39:37.057961	2014-02-17 07:39:37.057961	26	\N	f
4928	16	22	0	2014-02-17 07:39:37.062954	2014-02-17 07:39:37.062954	7	\N	f
4930	16	22	0	2014-02-17 07:39:37.068715	2014-02-17 07:39:37.068715	9	\N	f
4931	16	22	0	2014-02-17 07:39:37.071574	2014-02-17 07:39:37.071574	10	\N	f
4932	26	22	0	2014-02-17 07:39:37.076569	2014-02-17 07:39:37.076569	47	\N	f
4933	26	22	0	2014-02-17 07:39:37.079475	2014-02-17 07:39:37.079475	48	\N	f
4935	26	22	0	2014-02-17 07:39:37.08523	2014-02-17 07:39:37.08523	50	\N	f
4936	37	22	0	2014-02-17 07:39:37.090271	2014-02-17 07:39:37.090271	91	\N	f
4937	37	22	0	2014-02-17 07:39:37.093179	2014-02-17 07:39:37.093179	92	\N	f
4940	17	22	0	2014-02-17 07:39:37.103878	2014-02-17 07:39:37.103878	11	\N	f
4941	17	22	0	2014-02-17 07:39:37.106742	2014-02-17 07:39:37.106742	12	\N	f
4943	17	22	0	2014-02-17 07:39:37.112488	2014-02-17 07:39:37.112488	14	\N	f
4944	19	22	0	2014-02-17 07:39:37.117489	2014-02-17 07:39:37.117489	19	\N	f
4946	19	22	0	2014-02-17 07:39:37.123255	2014-02-17 07:39:37.123255	21	\N	f
4947	19	22	0	2014-02-17 07:39:37.12614	2014-02-17 07:39:37.12614	22	\N	f
4948	25	22	0	2014-02-17 07:39:37.131081	2014-02-17 07:39:37.131081	43	\N	f
4950	25	22	0	2014-02-17 07:39:37.13697	2014-02-17 07:39:37.13697	45	\N	f
4951	25	22	0	2014-02-17 07:39:37.139863	2014-02-17 07:39:37.139863	46	\N	f
4952	21	22	0	2014-02-17 07:39:37.145	2014-02-17 07:39:37.145	27	\N	f
4954	21	22	0	2014-02-17 07:39:37.150915	2014-02-17 07:39:37.150915	29	\N	f
4955	21	22	0	2014-02-17 07:39:37.153873	2014-02-17 07:39:37.153873	30	\N	f
4956	67	22	0	2014-02-17 07:39:37.159025	2014-02-17 07:39:37.159025	210	\N	f
4957	67	22	0	2014-02-17 07:39:37.161993	2014-02-17 07:39:37.161993	211	\N	f
4961	46	22	0	2014-02-17 07:39:37.220785	2014-02-17 07:39:37.220785	128	\N	f
4962	46	22	0	2014-02-17 07:39:37.225196	2014-02-17 07:39:37.225196	129	\N	f
4963	76	22	0	2014-02-17 07:39:37.232458	2014-02-17 07:39:37.232458	238	\N	f
4965	76	22	0	2014-02-17 07:39:37.241241	2014-02-17 07:39:37.241241	240	\N	f
4966	76	22	0	2014-02-17 07:39:37.245554	2014-02-17 07:39:37.245554	241	\N	f
4967	75	22	0	2014-02-17 07:39:37.252818	2014-02-17 07:39:37.252818	235	\N	f
4968	75	22	0	2014-02-17 07:39:37.25724	2014-02-17 07:39:37.25724	236	\N	f
4970	53	22	0	2014-02-17 07:39:37.268979	2014-02-17 07:39:37.268979	154	\N	f
4972	53	22	0	2014-02-17 07:39:37.277701	2014-02-17 07:39:37.277701	156	\N	f
4973	53	22	0	2014-02-17 07:39:37.282101	2014-02-17 07:39:37.282101	157	\N	f
4976	54	22	0	2014-02-17 07:39:37.298084	2014-02-17 07:39:37.298084	160	\N	f
4977	54	22	0	2014-02-17 07:39:37.302392	2014-02-17 07:39:37.302392	161	\N	f
4978	54	22	0	2014-02-17 07:39:37.306732	2014-02-17 07:39:37.306732	162	\N	f
4979	63	22	0	2014-02-17 07:39:37.313692	2014-02-17 07:39:37.313692	197	\N	f
4981	52	22	0	2014-02-17 07:39:37.325277	2014-02-17 07:39:37.325277	150	\N	f
4982	52	22	0	2014-02-17 07:39:37.329623	2014-02-17 07:39:37.329623	151	\N	f
4984	52	22	0	2014-02-17 07:39:37.33827	2014-02-17 07:39:37.33827	153	\N	f
4985	44	22	0	2014-02-17 07:39:37.345529	2014-02-17 07:39:37.345529	119	\N	f
4987	44	22	0	2014-02-17 07:39:37.354278	2014-02-17 07:39:37.354278	121	\N	f
4988	44	22	0	2014-02-17 07:39:37.358639	2014-02-17 07:39:37.358639	122	\N	f
4989	55	22	0	2014-02-17 07:39:37.365919	2014-02-17 07:39:37.365919	163	\N	f
4990	55	22	0	2014-02-17 07:39:37.37025	2014-02-17 07:39:37.37025	164	\N	f
4992	55	22	0	2014-02-17 07:39:37.378892	2014-02-17 07:39:37.378892	166	\N	f
4993	51	22	0	2014-02-17 07:39:37.38602	2014-02-17 07:39:37.38602	147	\N	f
4995	51	22	0	2014-02-17 07:39:37.394646	2014-02-17 07:39:37.394646	149	\N	f
4997	43	22	0	2014-02-17 07:39:37.406266	2014-02-17 07:39:37.406266	116	\N	f
4998	43	22	0	2014-02-17 07:39:37.410582	2014-02-17 07:39:37.410582	117	\N	f
4999	43	22	0	2014-02-17 07:39:37.414899	2014-02-17 07:39:37.414899	118	\N	f
5001	61	22	0	2014-02-17 07:39:37.42668	2014-02-17 07:39:37.42668	190	\N	f
5002	61	22	0	2014-02-17 07:39:37.431007	2014-02-17 07:39:37.431007	191	\N	f
5003	61	22	0	2014-02-17 07:39:37.435388	2014-02-17 07:39:37.435388	192	\N	f
5004	61	22	0	2014-02-17 07:39:37.439733	2014-02-17 07:39:37.439733	193	\N	f
5005	62	22	0	2014-02-17 07:39:37.446846	2014-02-17 07:39:37.446846	194	\N	f
5007	62	22	0	2014-02-17 07:39:37.455527	2014-02-17 07:39:37.455527	196	\N	f
5008	59	22	0	2014-02-17 07:39:37.462951	2014-02-17 07:39:37.462951	179	\N	f
5009	59	22	0	2014-02-17 07:39:37.467278	2014-02-17 07:39:37.467278	180	\N	f
5011	59	22	0	2014-02-17 07:39:37.475972	2014-02-17 07:39:37.475972	182	\N	f
5012	59	22	0	2014-02-17 07:39:37.480254	2014-02-17 07:39:37.480254	183	\N	f
5014	50	22	0	2014-02-17 07:39:37.492001	2014-02-17 07:39:37.492001	144	\N	f
5016	50	22	0	2014-02-17 07:39:37.500848	2014-02-17 07:39:37.500848	146	\N	f
5017	49	22	0	2014-02-17 07:39:37.508202	2014-02-17 07:39:37.508202	138	\N	f
5019	49	22	0	2014-02-17 07:39:37.517034	2014-02-17 07:39:37.517034	140	\N	f
5020	49	22	0	2014-02-17 07:39:37.521381	2014-02-17 07:39:37.521381	141	\N	f
5021	49	22	0	2014-02-17 07:39:37.525694	2014-02-17 07:39:37.525694	142	\N	f
5023	71	22	0	2014-02-17 07:39:37.537228	2014-02-17 07:39:37.537228	224	\N	f
5026	73	22	0	2014-02-17 07:39:37.553462	2014-02-17 07:39:37.553462	230	\N	f
5027	73	22	0	2014-02-17 07:39:37.557798	2014-02-17 07:39:37.557798	231	\N	f
5028	72	22	0	2014-02-17 07:39:37.565025	2014-02-17 07:39:37.565025	226	\N	f
5029	72	22	0	2014-02-17 07:39:37.569371	2014-02-17 07:39:37.569371	227	\N	f
4934	26	22	2	2014-02-17 07:39:37.08233	2014-02-17 09:02:48.574266	49	\N	t
4939	37	22	0	2014-02-17 07:39:37.098928	2014-02-17 09:03:14.681577	94	\N	t
4945	19	22	2	2014-02-17 07:39:37.120337	2014-02-17 09:04:33.76353	20	\N	t
4938	37	22	0	2014-02-17 07:39:37.096024	2014-02-17 08:53:11.340859	93	\N	f
4942	17	22	0	2014-02-17 07:39:37.109641	2014-02-17 08:53:11.365814	13	\N	f
4949	25	22	2	2014-02-17 07:39:37.134035	2014-02-17 09:05:20.531222	44	\N	t
4953	21	22	2	2014-02-17 07:39:37.14802	2014-02-17 09:05:41.549355	28	\N	t
4958	67	22	0	2014-02-17 07:39:37.164954	2014-02-17 09:06:02.483233	212	\N	t
4959	67	22	0	2014-02-17 07:39:37.210471	2014-02-17 08:53:11.464947	213	\N	f
4969	75	22	1	2014-02-17 07:39:37.261615	2014-02-17 09:08:34.969648	237	\N	t
4971	53	22	0	2014-02-17 07:39:37.273337	2014-02-17 09:09:16.806533	155	\N	t
4974	53	22	0	2014-02-17 07:39:37.286398	2014-02-17 08:53:11.544508	158	\N	f
4980	63	22	2	2014-02-17 07:39:37.318009	2014-02-17 09:10:24.9954	198	\N	t
4983	52	22	2	2014-02-17 07:39:37.333916	2014-02-17 09:10:52.376788	152	\N	t
4994	51	22	2	2014-02-17 07:39:37.39029	2014-02-17 09:12:45.752859	148	\N	t
4986	44	22	0	2014-02-17 07:39:37.349906	2014-02-17 09:12:22.448037	120	\N	f
4991	55	22	0	2014-02-17 07:39:37.374577	2014-02-17 09:12:16.815981	165	\N	f
4996	43	22	2	2014-02-17 07:39:37.401966	2014-02-17 09:13:09.137575	115	\N	t
5000	61	22	2	2014-02-17 07:39:37.422363	2014-02-17 09:14:03.983429	189	\N	t
5006	62	22	2	2014-02-17 07:39:37.45124	2014-02-17 09:14:27.456119	195	\N	t
5010	59	22	2	2014-02-17 07:39:37.471636	2014-02-17 09:15:08.257264	181	\N	t
5013	50	22	0	2014-02-17 07:39:37.487595	2014-02-17 09:15:40.626094	143	\N	t
5015	50	22	0	2014-02-17 07:39:37.49642	2014-02-17 08:53:11.769586	145	\N	f
5024	71	22	2	2014-02-17 07:39:37.541608	2014-02-17 09:16:50.744509	225	\N	t
5022	71	22	0	2014-02-17 07:39:37.532824	2014-02-17 09:16:50.691313	223	\N	f
4926	20	22	1	2014-02-17 07:39:37.055087	2014-02-17 09:02:02.216254	25	\N	t
4964	76	22	1	2014-02-17 07:39:37.236847	2014-02-17 09:07:35.72463	239	\N	t
4975	54	22	2	2014-02-17 07:39:37.293729	2014-02-17 09:09:57.176857	159	\N	t
5018	49	22	2	2014-02-17 07:39:37.512582	2014-02-17 09:16:08.373079	139	\N	t
5025	73	22	2	2014-02-17 07:39:37.549022	2014-02-17 09:16:40.62549	229	\N	t
5033	74	22	0	2014-02-17 07:39:37.589732	2014-02-17 07:39:37.589732	234	\N	f
5035	57	22	0	2014-02-17 07:39:37.601362	2014-02-17 07:39:37.601362	172	\N	f
5036	57	22	0	2014-02-17 07:39:37.605702	2014-02-17 07:39:37.605702	173	\N	f
5037	57	22	0	2014-02-17 07:39:37.610024	2014-02-17 07:39:37.610024	174	\N	f
5038	56	22	0	2014-02-17 07:39:37.617256	2014-02-17 07:39:37.617256	167	\N	f
5039	56	22	0	2014-02-17 07:39:37.621603	2014-02-17 07:39:37.621603	168	\N	f
5041	56	22	0	2014-02-17 07:39:37.630271	2014-02-17 07:39:37.630271	170	\N	f
5042	65	22	0	2014-02-17 07:39:37.637467	2014-02-17 07:39:37.637467	202	\N	f
5043	65	22	0	2014-02-17 07:39:37.641843	2014-02-17 07:39:37.641843	203	\N	f
5045	65	22	0	2014-02-17 07:39:37.650516	2014-02-17 07:39:37.650516	205	\N	f
5046	60	22	0	2014-02-17 07:39:37.657849	2014-02-17 07:39:37.657849	184	\N	f
5048	60	22	0	2014-02-17 07:39:37.66656	2014-02-17 07:39:37.66656	186	\N	f
5049	60	22	0	2014-02-17 07:39:37.670864	2014-02-17 07:39:37.670864	187	\N	f
5053	64	22	0	2014-02-17 07:39:37.690834	2014-02-17 07:39:37.690834	201	\N	f
5054	69	22	0	2014-02-17 07:39:37.698063	2014-02-17 07:39:37.698063	216	\N	f
5055	69	22	0	2014-02-17 07:39:37.702457	2014-02-17 07:39:37.702457	217	\N	f
5057	69	22	0	2014-02-17 07:39:37.711114	2014-02-17 07:39:37.711114	219	\N	f
5058	38	22	0	2014-02-17 07:39:37.718445	2014-02-17 07:39:37.718445	95	\N	f
5060	38	22	0	2014-02-17 07:39:37.727282	2014-02-17 07:39:37.727282	97	\N	f
5061	38	22	0	2014-02-17 07:39:37.731607	2014-02-17 07:39:37.731607	98	\N	f
5064	70	22	0	2014-02-17 07:39:37.747557	2014-02-17 07:39:37.747557	221	\N	f
5066	66	22	0	2014-02-17 07:39:37.759193	2014-02-17 07:39:37.759193	206	\N	f
5067	66	22	0	2014-02-17 07:39:37.763586	2014-02-17 07:39:37.763586	207	\N	f
5069	66	22	0	2014-02-17 07:39:37.772404	2014-02-17 07:39:37.772404	209	\N	f
5072	40	22	0	2014-02-17 07:39:37.791253	2014-02-17 07:39:37.791253	104	\N	f
5073	40	22	0	2014-02-17 07:39:37.795774	2014-02-17 07:39:37.795774	105	\N	f
5075	40	22	0	2014-02-17 07:39:37.804839	2014-02-17 07:39:37.804839	107	\N	f
5078	45	22	0	2014-02-17 07:39:37.86868	2014-02-17 07:39:37.86868	125	\N	f
5079	45	22	0	2014-02-17 07:39:37.871999	2014-02-17 07:39:37.871999	126	\N	f
5080	48	22	0	2014-02-17 07:39:37.876801	2014-02-17 07:39:37.876801	134	\N	f
5081	48	22	0	2014-02-17 07:39:37.879685	2014-02-17 07:39:37.879685	135	\N	f
5083	48	22	0	2014-02-17 07:39:37.885397	2014-02-17 07:39:37.885397	137	\N	f
5084	47	22	0	2014-02-17 07:39:37.890403	2014-02-17 07:39:37.890403	130	\N	f
5086	47	22	0	2014-02-17 07:39:37.896155	2014-02-17 07:39:37.896155	132	\N	f
5087	47	22	0	2014-02-17 07:39:37.899004	2014-02-17 07:39:37.899004	133	\N	f
5088	42	22	0	2014-02-17 07:39:37.905531	2014-02-17 07:39:37.905531	112	\N	f
5089	42	22	0	2014-02-17 07:39:37.909898	2014-02-17 07:39:37.909898	113	\N	f
5091	58	22	0	2014-02-17 07:39:37.921495	2014-02-17 07:39:37.921495	175	\N	f
5093	58	22	0	2014-02-17 07:39:37.930274	2014-02-17 07:39:37.930274	177	\N	f
5094	58	22	0	2014-02-17 07:39:37.934585	2014-02-17 07:39:37.934585	178	\N	f
5095	41	22	0	2014-02-17 07:39:37.941857	2014-02-17 07:39:37.941857	108	\N	f
5096	41	22	0	2014-02-17 07:39:37.946237	2014-02-17 07:39:37.946237	109	\N	f
5098	41	22	0	2014-02-17 07:39:37.954899	2014-02-17 07:39:37.954899	111	\N	f
5099	32	23	0	2014-02-17 07:39:37.983002	2014-02-17 07:39:37.983002	71	\N	f
5102	32	23	0	2014-02-17 07:39:37.996184	2014-02-17 07:39:37.996184	74	\N	f
5103	18	23	0	2014-02-17 07:39:38.003532	2014-02-17 07:39:38.003532	15	\N	f
5106	18	23	0	2014-02-17 07:39:38.016788	2014-02-17 07:39:38.016788	18	\N	f
5108	27	23	0	2014-02-17 07:39:38.028403	2014-02-17 07:39:38.028403	52	\N	f
5109	27	23	0	2014-02-17 07:39:38.032813	2014-02-17 07:39:38.032813	53	\N	f
5111	28	23	0	2014-02-17 07:39:38.044441	2014-02-17 07:39:38.044441	55	\N	f
5112	28	23	0	2014-02-17 07:39:38.048889	2014-02-17 07:39:38.048889	56	\N	f
5113	28	23	0	2014-02-17 07:39:38.053215	2014-02-17 07:39:38.053215	57	\N	f
5116	24	23	0	2014-02-17 07:39:38.069229	2014-02-17 07:39:38.069229	40	\N	f
5117	24	23	0	2014-02-17 07:39:38.073579	2014-02-17 07:39:38.073579	41	\N	f
5118	24	23	0	2014-02-17 07:39:38.077929	2014-02-17 07:39:38.077929	42	\N	f
5120	29	23	0	2014-02-17 07:39:38.089867	2014-02-17 07:39:38.089867	60	\N	f
5121	29	23	0	2014-02-17 07:39:38.094293	2014-02-17 07:39:38.094293	61	\N	f
5123	23	23	0	2014-02-17 07:39:38.105842	2014-02-17 07:39:38.105842	35	\N	f
5124	23	23	0	2014-02-17 07:39:38.110248	2014-02-17 07:39:38.110248	36	\N	f
5126	23	23	0	2014-02-17 07:39:38.118943	2014-02-17 07:39:38.118943	38	\N	f
5127	22	23	0	2014-02-17 07:39:38.126263	2014-02-17 07:39:38.126263	31	\N	f
5130	22	23	0	2014-02-17 07:39:38.1393	2014-02-17 07:39:38.1393	34	\N	f
5131	36	23	0	2014-02-17 07:39:38.146606	2014-02-17 07:39:38.146606	87	\N	f
5132	36	23	0	2014-02-17 07:39:38.151019	2014-02-17 07:39:38.151019	88	\N	f
5133	36	23	0	2014-02-17 07:39:38.155404	2014-02-17 07:39:38.155404	89	\N	f
5135	15	23	0	2014-02-17 07:39:38.167062	2014-02-17 07:39:38.167062	3	\N	f
5136	15	23	0	2014-02-17 07:39:38.171507	2014-02-17 07:39:38.171507	4	\N	f
5032	74	22	0	2014-02-17 07:39:37.585352	2014-02-17 08:53:11.859499	233	\N	f
5050	60	22	0	2014-02-17 07:39:37.675182	2014-02-17 09:20:01.197995	188	\N	t
5040	56	22	0	2014-02-17 07:39:37.625961	2014-02-17 08:53:11.906192	169	\N	f
5044	65	22	0	2014-02-17 07:39:37.646163	2014-02-17 09:19:39.269865	204	\N	f
5047	60	22	0	2014-02-17 07:39:37.662246	2014-02-17 08:53:11.945982	185	\N	f
5051	64	22	0	2014-02-17 07:39:37.682239	2014-02-17 08:53:11.966062	199	\N	f
5062	38	22	0	2014-02-17 07:39:37.735981	2014-02-17 09:21:18.129952	99	\N	t
5059	38	22	0	2014-02-17 07:39:37.722867	2014-02-17 08:53:12.012749	96	\N	f
5065	70	22	0	2014-02-17 07:39:37.751897	2014-02-17 08:53:12.039295	222	\N	f
5071	68	22	0	2014-02-17 07:39:37.783923	2014-02-17 08:53:12.071003	215	\N	f
5077	45	22	0	2014-02-17 07:39:37.86417	2014-02-17 09:22:53.85969	124	\N	t
5076	45	22	0	2014-02-17 07:39:37.812329	2014-02-17 08:53:12.101142	123	\N	f
5085	47	22	1	2014-02-17 07:39:37.893309	2014-02-17 09:23:14.154767	131	\N	t
5090	42	22	1	2014-02-17 07:39:37.914272	2014-02-17 09:23:22.487652	114	\N	t
5092	58	22	1	2014-02-17 07:39:37.925948	2014-02-17 09:23:52.355984	176	\N	t
5097	41	22	1	2014-02-17 07:39:37.950545	2014-02-17 09:24:04.803209	110	\N	t
5129	22	23	0	2014-02-17 07:39:38.134938	2014-02-17 09:33:09.730949	33	\N	f
5107	27	23	0	2014-02-17 07:39:38.024034	2014-02-17 08:58:21.605417	51	\N	t
5104	18	23	0	2014-02-17 07:39:38.007889	2014-02-17 08:56:58.211579	16	\N	f
5110	27	23	0	2014-02-17 07:39:38.037187	2014-02-17 08:56:58.236947	54	\N	f
5119	29	23	0	2014-02-17 07:39:38.085445	2014-02-17 08:59:42.508316	59	\N	t
5128	22	23	0	2014-02-17 07:39:38.130554	2014-02-17 09:33:09.761459	32	\N	t
5122	29	23	0	2014-02-17 07:39:38.098532	2014-02-17 08:56:58.297764	62	\N	f
5115	24	23	2	2014-02-17 07:39:38.064817	2014-02-17 09:00:23.207651	39	\N	t
5031	74	22	0	2014-02-17 07:39:37.580939	2014-02-17 09:17:30.313783	232	\N	t
5134	36	23	0	2014-02-17 07:39:38.159781	2014-02-17 08:56:58.366281	90	\N	f
5100	32	23	2	2014-02-17 07:39:37.987499	2014-02-17 08:57:57.502093	72	\N	t
5101	32	23	0	2014-02-17 07:39:37.991853	2014-02-17 08:57:57.454184	73	\N	f
5114	28	23	1	2014-02-17 07:39:38.057574	2014-02-17 08:59:21.708918	58	\N	t
5125	23	23	1	2014-02-17 07:39:38.114572	2014-02-17 09:00:06.72754	37	\N	t
5034	57	22	2	2014-02-17 07:39:37.596954	2014-02-17 09:17:57.195014	171	\N	t
5052	64	22	0	2014-02-17 07:39:37.686539	2014-02-17 09:20:25.380817	200	\N	t
5056	69	22	2	2014-02-17 07:39:37.706787	2014-02-17 09:20:43.911632	218	\N	t
5063	70	22	0	2014-02-17 07:39:37.743163	2014-02-17 09:21:42.416185	220	\N	t
5070	68	22	0	2014-02-17 07:39:37.779471	2014-02-17 09:22:30.043333	214	\N	t
5074	40	22	1	2014-02-17 07:39:37.800233	2014-02-17 09:22:35.994827	106	\N	t
5082	48	22	1	2014-02-17 07:39:37.882544	2014-02-17 09:23:03.986469	136	\N	t
5139	39	23	0	2014-02-17 07:39:38.187992	2014-02-17 07:39:38.187992	100	\N	f
5140	39	23	0	2014-02-17 07:39:38.192505	2014-02-17 07:39:38.192505	101	\N	f
5141	39	23	0	2014-02-17 07:39:38.196886	2014-02-17 07:39:38.196886	102	\N	f
5143	20	23	0	2014-02-17 07:39:38.208548	2014-02-17 07:39:38.208548	23	\N	f
5144	20	23	0	2014-02-17 07:39:38.21299	2014-02-17 07:39:38.21299	24	\N	f
5146	20	23	0	2014-02-17 07:39:38.221794	2014-02-17 07:39:38.221794	26	\N	f
5147	16	23	0	2014-02-17 07:39:38.229127	2014-02-17 07:39:38.229127	7	\N	f
5149	16	23	0	2014-02-17 07:39:38.237886	2014-02-17 07:39:38.237886	9	\N	f
5151	26	23	0	2014-02-17 07:39:38.24952	2014-02-17 07:39:38.24952	47	\N	f
5152	26	23	0	2014-02-17 07:39:38.253935	2014-02-17 07:39:38.253935	48	\N	f
5154	26	23	0	2014-02-17 07:39:38.262576	2014-02-17 07:39:38.262576	50	\N	f
5155	37	23	0	2014-02-17 07:39:38.269872	2014-02-17 07:39:38.269872	91	\N	f
5156	37	23	0	2014-02-17 07:39:38.274228	2014-02-17 07:39:38.274228	92	\N	f
5158	37	23	0	2014-02-17 07:39:38.282916	2014-02-17 07:39:38.282916	94	\N	f
5160	17	23	0	2014-02-17 07:39:38.294455	2014-02-17 07:39:38.294455	12	\N	f
5162	17	23	0	2014-02-17 07:39:38.303091	2014-02-17 07:39:38.303091	14	\N	f
5163	19	23	0	2014-02-17 07:39:38.310375	2014-02-17 07:39:38.310375	19	\N	f
5166	19	23	0	2014-02-17 07:39:38.323463	2014-02-17 07:39:38.323463	22	\N	f
5167	25	23	0	2014-02-17 07:39:38.33101	2014-02-17 07:39:38.33101	43	\N	f
5169	25	23	0	2014-02-17 07:39:38.339856	2014-02-17 07:39:38.339856	45	\N	f
5170	25	23	0	2014-02-17 07:39:38.344223	2014-02-17 07:39:38.344223	46	\N	f
5171	21	23	0	2014-02-17 07:39:38.351609	2014-02-17 07:39:38.351609	27	\N	f
5173	21	23	0	2014-02-17 07:39:38.36047	2014-02-17 07:39:38.36047	29	\N	f
5174	21	23	0	2014-02-17 07:39:38.364897	2014-02-17 07:39:38.364897	30	\N	f
5175	67	23	0	2014-02-17 07:39:38.372176	2014-02-17 07:39:38.372176	210	\N	f
5176	67	23	0	2014-02-17 07:39:38.37656	2014-02-17 07:39:38.37656	211	\N	f
5177	67	23	0	2014-02-17 07:39:38.381029	2014-02-17 07:39:38.381029	212	\N	f
5181	46	23	0	2014-02-17 07:39:38.401568	2014-02-17 07:39:38.401568	129	\N	f
5184	76	23	0	2014-02-17 07:39:38.46461	2014-02-17 07:39:38.46461	240	\N	f
5185	76	23	0	2014-02-17 07:39:38.467039	2014-02-17 07:39:38.467039	241	\N	f
5187	75	23	0	2014-02-17 07:39:38.473294	2014-02-17 07:39:38.473294	236	\N	f
5189	53	23	0	2014-02-17 07:39:38.479579	2014-02-17 07:39:38.479579	154	\N	f
5190	53	23	0	2014-02-17 07:39:38.481796	2014-02-17 07:39:38.481796	155	\N	f
5191	53	23	0	2014-02-17 07:39:38.483983	2014-02-17 07:39:38.483983	156	\N	f
5196	54	23	0	2014-02-17 07:39:38.496895	2014-02-17 07:39:38.496895	161	\N	f
5197	54	23	0	2014-02-17 07:39:38.499067	2014-02-17 07:39:38.499067	162	\N	f
5198	63	23	0	2014-02-17 07:39:38.502977	2014-02-17 07:39:38.502977	197	\N	f
5200	52	23	0	2014-02-17 07:39:38.509139	2014-02-17 07:39:38.509139	150	\N	f
5201	52	23	0	2014-02-17 07:39:38.511328	2014-02-17 07:39:38.511328	151	\N	f
5203	52	23	0	2014-02-17 07:39:38.515726	2014-02-17 07:39:38.515726	153	\N	f
5204	44	23	0	2014-02-17 07:39:38.519692	2014-02-17 07:39:38.519692	119	\N	f
5206	44	23	0	2014-02-17 07:39:38.524088	2014-02-17 07:39:38.524088	121	\N	f
5207	44	23	0	2014-02-17 07:39:38.52633	2014-02-17 07:39:38.52633	122	\N	f
5209	55	23	0	2014-02-17 07:39:38.532504	2014-02-17 07:39:38.532504	164	\N	f
5211	55	23	0	2014-02-17 07:39:38.536996	2014-02-17 07:39:38.536996	166	\N	f
5214	51	23	0	2014-02-17 07:39:38.54536	2014-02-17 07:39:38.54536	149	\N	f
5216	43	23	0	2014-02-17 07:39:38.552075	2014-02-17 07:39:38.552075	116	\N	f
5217	43	23	0	2014-02-17 07:39:38.554655	2014-02-17 07:39:38.554655	117	\N	f
5218	43	23	0	2014-02-17 07:39:38.557257	2014-02-17 07:39:38.557257	118	\N	f
5220	61	23	0	2014-02-17 07:39:38.564643	2014-02-17 07:39:38.564643	190	\N	f
5221	61	23	0	2014-02-17 07:39:38.567264	2014-02-17 07:39:38.567264	191	\N	f
5222	61	23	0	2014-02-17 07:39:38.569831	2014-02-17 07:39:38.569831	192	\N	f
5223	61	23	0	2014-02-17 07:39:38.572395	2014-02-17 07:39:38.572395	193	\N	f
5224	62	23	0	2014-02-17 07:39:38.576965	2014-02-17 07:39:38.576965	194	\N	f
5226	62	23	0	2014-02-17 07:39:38.582126	2014-02-17 07:39:38.582126	196	\N	f
5227	59	23	0	2014-02-17 07:39:38.586735	2014-02-17 07:39:38.586735	179	\N	f
5228	59	23	0	2014-02-17 07:39:38.589309	2014-02-17 07:39:38.589309	180	\N	f
5230	59	23	0	2014-02-17 07:39:38.594454	2014-02-17 07:39:38.594454	182	\N	f
5233	50	23	0	2014-02-17 07:39:38.604214	2014-02-17 07:39:38.604214	144	\N	f
5235	50	23	0	2014-02-17 07:39:38.609435	2014-02-17 07:39:38.609435	146	\N	f
5236	49	23	0	2014-02-17 07:39:38.614028	2014-02-17 07:39:38.614028	138	\N	f
5238	49	23	0	2014-02-17 07:39:38.619189	2014-02-17 07:39:38.619189	140	\N	f
5239	49	23	0	2014-02-17 07:39:38.621774	2014-02-17 07:39:38.621774	141	\N	f
5240	49	23	0	2014-02-17 07:39:38.624327	2014-02-17 07:39:38.624327	142	\N	f
5241	71	23	0	2014-02-17 07:39:38.628876	2014-02-17 07:39:38.628876	223	\N	f
5242	71	23	0	2014-02-17 07:39:38.631451	2014-02-17 07:39:38.631451	224	\N	f
5145	20	23	1	2014-02-17 07:39:38.217346	2014-02-17 09:02:39.558051	25	\N	t
5150	16	23	0	2014-02-17 07:39:38.242218	2014-02-17 09:03:14.571607	10	\N	t
5148	16	23	0	2014-02-17 07:39:38.233494	2014-02-17 08:56:58.451679	8	\N	f
5157	37	23	2	2014-02-17 07:39:38.278584	2014-02-17 09:04:13.2504	93	\N	t
5161	17	23	2	2014-02-17 07:39:38.29879	2014-02-17 09:05:24.323403	13	\N	t
5168	25	23	2	2014-02-17 07:39:38.335517	2014-02-17 09:06:15.491865	44	\N	t
5164	19	23	0	2014-02-17 07:39:38.314739	2014-02-17 08:56:58.543462	20	\N	f
5180	46	23	0	2014-02-17 07:39:38.397159	2014-02-17 09:41:42.972431	128	\N	f
5179	46	23	1	2014-02-17 07:39:38.392632	2014-02-17 09:41:43.022446	127	\N	t
5183	76	23	0	2014-02-17 07:39:38.413468	2014-02-17 08:56:58.646596	239	\N	f
5188	75	23	0	2014-02-17 07:39:38.475482	2014-02-17 08:56:58.674735	237	\N	f
5193	53	23	0	2014-02-17 07:39:38.48838	2014-02-17 08:56:58.699763	158	\N	f
5194	54	23	0	2014-02-17 07:39:38.492432	2014-02-17 08:56:58.711909	159	\N	f
5202	52	23	2	2014-02-17 07:39:38.513539	2014-02-17 09:11:02.843694	152	\N	t
5225	62	23	2	2014-02-17 07:39:38.579527	2014-02-17 09:14:48.306827	195	\N	t
5208	55	23	0	2014-02-17 07:39:38.530304	2014-02-17 09:12:57.336155	163	\N	t
5210	55	23	0	2014-02-17 07:39:38.534751	2014-02-17 09:12:57.318018	165	\N	f
5213	51	23	0	2014-02-17 07:39:38.543139	2014-02-17 09:14:11.407223	148	\N	f
5205	44	23	2	2014-02-17 07:39:38.521899	2014-02-17 09:12:19.27818	120	\N	t
5219	61	23	0	2014-02-17 07:39:38.562035	2014-02-17 08:56:58.846644	189	\N	f
5231	59	23	0	2014-02-17 07:39:38.597077	2014-02-17 09:15:25.054201	183	\N	t
5229	59	23	0	2014-02-17 07:39:38.59188	2014-02-17 08:56:58.896613	181	\N	f
5234	50	23	0	2014-02-17 07:39:38.606811	2014-02-17 08:56:58.92484	145	\N	f
5243	71	23	2	2014-02-17 07:39:38.634053	2014-02-17 09:17:17.177128	225	\N	t
5212	51	23	0	2014-02-17 07:39:38.540919	2014-02-17 09:37:44.462474	147	\N	t
5137	15	23	0	2014-02-17 07:39:38.175859	2014-02-17 09:01:59.414504	5	\N	t
5153	26	23	2	2014-02-17 07:39:38.25827	2014-02-17 09:03:45.967724	49	\N	t
5165	19	23	0	2014-02-17 07:39:38.319053	2014-02-17 09:04:50.149581	21	\N	t
5159	17	23	0	2014-02-17 07:39:38.290157	2014-02-17 09:05:24.281225	11	\N	f
5182	76	23	0	2014-02-17 07:39:38.408993	2014-02-17 09:08:38.815886	238	\N	t
5186	75	23	0	2014-02-17 07:39:38.47105	2014-02-17 09:09:32.578889	235	\N	t
5192	53	23	0	2014-02-17 07:39:38.486216	2014-02-17 09:10:03.026933	157	\N	t
5195	54	23	0	2014-02-17 07:39:38.49469	2014-02-17 09:10:25.225588	160	\N	t
5199	63	23	2	2014-02-17 07:39:38.505158	2014-02-17 09:10:52.104221	198	\N	t
5215	43	23	0	2014-02-17 07:39:38.549488	2014-02-17 09:14:18.601407	115	\N	f
5232	50	23	0	2014-02-17 07:39:38.601655	2014-02-17 09:16:21.924449	143	\N	t
5237	49	23	2	2014-02-17 07:39:38.616589	2014-02-17 09:19:36.255363	139	\N	t
5172	21	23	0	2014-02-17 07:39:38.355984	2014-02-17 09:40:53.923008	28	\N	f
5246	73	23	0	2014-02-17 07:39:38.644205	2014-02-17 07:39:38.644205	231	\N	f
5247	72	23	0	2014-02-17 07:39:38.649372	2014-02-17 07:39:38.649372	226	\N	f
5252	74	23	0	2014-02-17 07:39:38.671977	2014-02-17 07:39:38.671977	234	\N	f
5254	57	23	0	2014-02-17 07:39:38.683679	2014-02-17 07:39:38.683679	172	\N	f
5255	57	23	0	2014-02-17 07:39:38.688054	2014-02-17 07:39:38.688054	173	\N	f
5256	57	23	0	2014-02-17 07:39:38.69239	2014-02-17 07:39:38.69239	174	\N	f
5257	56	23	0	2014-02-17 07:39:38.699709	2014-02-17 07:39:38.699709	167	\N	f
5258	56	23	0	2014-02-17 07:39:38.704127	2014-02-17 07:39:38.704127	168	\N	f
5260	56	23	0	2014-02-17 07:39:38.712857	2014-02-17 07:39:38.712857	170	\N	f
5261	65	23	0	2014-02-17 07:39:38.720127	2014-02-17 07:39:38.720127	202	\N	f
5264	65	23	0	2014-02-17 07:39:38.733339	2014-02-17 07:39:38.733339	205	\N	f
5265	60	23	0	2014-02-17 07:39:38.740715	2014-02-17 07:39:38.740715	184	\N	f
5267	60	23	0	2014-02-17 07:39:38.749426	2014-02-17 07:39:38.749426	186	\N	f
5268	60	23	0	2014-02-17 07:39:38.75384	2014-02-17 07:39:38.75384	187	\N	f
5269	60	23	0	2014-02-17 07:39:38.758161	2014-02-17 07:39:38.758161	188	\N	f
5271	64	23	0	2014-02-17 07:39:38.769674	2014-02-17 07:39:38.769674	200	\N	f
5272	64	23	0	2014-02-17 07:39:38.774001	2014-02-17 07:39:38.774001	201	\N	f
5273	69	23	0	2014-02-17 07:39:38.781264	2014-02-17 07:39:38.781264	216	\N	f
5274	69	23	0	2014-02-17 07:39:38.785711	2014-02-17 07:39:38.785711	217	\N	f
5276	69	23	0	2014-02-17 07:39:38.794393	2014-02-17 07:39:38.794393	219	\N	f
5277	38	23	0	2014-02-17 07:39:38.801883	2014-02-17 07:39:38.801883	95	\N	f
5279	38	23	0	2014-02-17 07:39:38.810674	2014-02-17 07:39:38.810674	97	\N	f
5280	38	23	0	2014-02-17 07:39:38.814995	2014-02-17 07:39:38.814995	98	\N	f
5282	70	23	0	2014-02-17 07:39:38.826563	2014-02-17 07:39:38.826563	220	\N	f
5283	70	23	0	2014-02-17 07:39:38.830995	2014-02-17 07:39:38.830995	221	\N	f
5286	66	23	0	2014-02-17 07:39:38.847028	2014-02-17 07:39:38.847028	207	\N	f
5288	66	23	0	2014-02-17 07:39:38.855894	2014-02-17 07:39:38.855894	209	\N	f
5289	68	23	0	2014-02-17 07:39:38.863015	2014-02-17 07:39:38.863015	214	\N	f
5291	40	23	0	2014-02-17 07:39:38.874904	2014-02-17 07:39:38.874904	104	\N	f
5292	40	23	0	2014-02-17 07:39:38.879382	2014-02-17 07:39:38.879382	105	\N	f
5294	40	23	0	2014-02-17 07:39:38.935945	2014-02-17 07:39:38.935945	107	\N	f
5297	45	23	0	2014-02-17 07:39:38.948035	2014-02-17 07:39:38.948035	125	\N	f
5298	45	23	0	2014-02-17 07:39:38.952409	2014-02-17 07:39:38.952409	126	\N	f
5300	48	23	0	2014-02-17 07:39:38.964032	2014-02-17 07:39:38.964032	135	\N	f
5302	48	23	0	2014-02-17 07:39:38.972795	2014-02-17 07:39:38.972795	137	\N	f
5305	47	23	0	2014-02-17 07:39:38.988883	2014-02-17 07:39:38.988883	132	\N	f
5306	47	23	0	2014-02-17 07:39:38.993309	2014-02-17 07:39:38.993309	133	\N	f
5307	42	23	0	2014-02-17 07:39:39.000394	2014-02-17 07:39:39.000394	112	\N	f
5308	42	23	0	2014-02-17 07:39:39.004819	2014-02-17 07:39:39.004819	113	\N	f
5310	58	23	0	2014-02-17 07:39:39.016369	2014-02-17 07:39:39.016369	175	\N	f
5313	58	23	0	2014-02-17 07:39:39.029538	2014-02-17 07:39:39.029538	178	\N	f
5314	41	23	0	2014-02-17 07:39:39.036753	2014-02-17 07:39:39.036753	108	\N	f
5315	41	23	0	2014-02-17 07:39:39.041194	2014-02-17 07:39:39.041194	109	\N	f
5318	32	24	0	2014-02-17 07:39:39.077876	2014-02-17 07:39:39.077876	71	\N	f
5320	32	24	0	2014-02-17 07:39:39.08684	2014-02-17 07:39:39.08684	73	\N	f
5321	32	24	0	2014-02-17 07:39:39.091235	2014-02-17 07:39:39.091235	74	\N	f
5322	18	24	0	2014-02-17 07:39:39.098541	2014-02-17 07:39:39.098541	15	\N	f
5324	18	24	0	2014-02-17 07:39:39.107267	2014-02-17 07:39:39.107267	17	\N	f
5325	18	24	0	2014-02-17 07:39:39.111664	2014-02-17 07:39:39.111664	18	\N	f
5326	27	24	0	2014-02-17 07:39:39.118929	2014-02-17 07:39:39.118929	51	\N	f
5327	27	24	0	2014-02-17 07:39:39.12329	2014-02-17 07:39:39.12329	52	\N	f
5330	28	24	0	2014-02-17 07:39:39.1393	2014-02-17 07:39:39.1393	55	\N	f
5331	28	24	0	2014-02-17 07:39:39.143705	2014-02-17 07:39:39.143705	56	\N	f
5332	28	24	0	2014-02-17 07:39:39.148009	2014-02-17 07:39:39.148009	57	\N	f
5335	24	24	0	2014-02-17 07:39:39.164143	2014-02-17 07:39:39.164143	40	\N	f
5336	24	24	0	2014-02-17 07:39:39.168525	2014-02-17 07:39:39.168525	41	\N	f
5337	24	24	0	2014-02-17 07:39:39.17297	2014-02-17 07:39:39.17297	42	\N	f
5338	29	24	0	2014-02-17 07:39:39.180199	2014-02-17 07:39:39.180199	59	\N	f
5339	29	24	0	2014-02-17 07:39:39.184629	2014-02-17 07:39:39.184629	60	\N	f
5340	29	24	0	2014-02-17 07:39:39.189045	2014-02-17 07:39:39.189045	61	\N	f
5342	23	24	0	2014-02-17 07:39:39.20076	2014-02-17 07:39:39.20076	35	\N	f
5343	23	24	0	2014-02-17 07:39:39.205178	2014-02-17 07:39:39.205178	36	\N	f
5345	23	24	0	2014-02-17 07:39:39.213911	2014-02-17 07:39:39.213911	38	\N	f
5346	22	24	0	2014-02-17 07:39:39.22125	2014-02-17 07:39:39.22125	31	\N	f
5347	22	24	0	2014-02-17 07:39:39.225596	2014-02-17 07:39:39.225596	32	\N	f
5349	22	24	0	2014-02-17 07:39:39.234441	2014-02-17 07:39:39.234441	34	\N	f
5350	36	24	0	2014-02-17 07:39:39.241688	2014-02-17 07:39:39.241688	87	\N	f
5333	28	24	1	2014-02-17 07:39:39.152393	2014-02-17 08:58:58.439243	58	\N	t
5329	27	24	0	2014-02-17 07:39:39.132059	2014-02-17 08:56:39.751638	54	\N	f
5334	24	24	2	2014-02-17 07:39:39.159705	2014-02-17 08:59:10.749387	39	\N	t
5341	29	24	2	2014-02-17 07:39:39.193462	2014-02-17 08:59:49.098518	62	\N	t
5344	23	24	1	2014-02-17 07:39:39.209563	2014-02-17 09:00:20.85862	37	\N	t
5296	45	23	0	2014-02-17 07:39:38.944228	2014-02-17 09:36:07.492291	124	\N	f
5348	22	24	0	2014-02-17 07:39:39.23008	2014-02-17 08:56:39.868617	33	\N	f
5248	72	23	0	2014-02-17 07:39:38.652175	2014-02-17 09:17:48.897231	227	\N	t
5249	72	23	0	2014-02-17 07:39:38.655916	2014-02-17 08:56:58.999845	228	\N	f
5262	65	23	0	2014-02-17 07:39:38.724551	2014-02-17 09:20:45.167176	203	\N	t
5259	56	23	0	2014-02-17 07:39:38.708483	2014-02-17 08:56:59.047589	169	\N	f
5263	65	23	0	2014-02-17 07:39:38.729016	2014-02-17 08:56:59.071758	204	\N	f
5266	60	23	0	2014-02-17 07:39:38.745101	2014-02-17 08:56:59.09345	185	\N	f
5284	70	23	2	2014-02-17 07:39:38.835337	2014-02-17 09:22:50.868201	222	\N	t
5281	38	23	0	2014-02-17 07:39:38.819424	2014-02-17 09:22:06.421561	99	\N	t
5278	38	23	0	2014-02-17 07:39:38.80629	2014-02-17 08:56:59.160069	96	\N	f
5285	66	23	0	2014-02-17 07:39:38.84266	2014-02-17 09:23:15.95006	206	\N	t
5287	66	23	0	2014-02-17 07:39:38.851434	2014-02-17 08:56:59.201701	208	\N	f
5290	68	23	0	2014-02-17 07:39:38.867516	2014-02-17 08:56:59.218382	215	\N	f
5245	73	23	0	2014-02-17 07:39:38.641358	2014-02-17 09:37:04.59214	230	\N	t
5304	47	23	1	2014-02-17 07:39:38.984514	2014-02-17 09:38:42.158818	131	\N	t
5309	42	23	1	2014-02-17 07:39:39.009182	2014-02-17 09:24:14.973744	114	\N	t
5317	41	23	0	2014-02-17 07:39:39.049899	2014-02-17 09:24:44.080929	111	\N	t
5311	58	23	0	2014-02-17 07:39:39.020807	2014-02-17 08:56:59.331941	176	\N	f
5316	41	23	0	2014-02-17 07:39:39.045565	2014-02-17 08:56:59.358246	110	\N	f
5323	18	24	2	2014-02-17 07:39:39.102913	2014-02-17 08:57:38.455865	16	\N	t
5250	74	23	0	2014-02-17 07:39:38.663247	2014-02-17 09:18:26.015546	232	\N	t
5253	57	23	2	2014-02-17 07:39:38.679292	2014-02-17 09:19:10.930712	171	\N	t
5270	64	23	2	2014-02-17 07:39:38.765313	2014-02-17 09:21:01.931359	199	\N	t
5275	69	23	0	2014-02-17 07:39:38.790066	2014-02-17 09:22:20.82457	218	\N	f
5293	40	23	1	2014-02-17 07:39:38.886381	2014-02-17 09:23:21.655632	106	\N	t
5301	48	23	1	2014-02-17 07:39:38.96838	2014-02-17 09:35:42.639284	136	\N	t
5312	58	23	0	2014-02-17 07:39:39.025187	2014-02-17 09:24:32.985603	177	\N	f
5244	73	23	0	2014-02-17 07:39:38.638522	2014-02-17 09:30:37.495963	229	\N	f
5299	48	23	0	2014-02-17 07:39:38.959638	2014-02-17 09:35:42.576188	134	\N	f
5295	45	23	0	2014-02-17 07:39:38.942016	2014-02-17 09:38:55.19086	123	\N	f
5303	47	23	0	2014-02-17 07:39:38.980016	2014-02-17 09:38:42.105255	130	\N	f
5351	36	24	0	2014-02-17 07:39:39.246155	2014-02-17 07:39:39.246155	88	\N	f
5352	36	24	0	2014-02-17 07:39:39.250604	2014-02-17 07:39:39.250604	89	\N	f
5354	15	24	0	2014-02-17 07:39:39.262201	2014-02-17 07:39:39.262201	3	\N	f
5355	15	24	0	2014-02-17 07:39:39.266809	2014-02-17 07:39:39.266809	4	\N	f
5356	15	24	0	2014-02-17 07:39:39.2713	2014-02-17 07:39:39.2713	5	\N	f
5358	39	24	0	2014-02-17 07:39:39.283064	2014-02-17 07:39:39.283064	100	\N	f
5359	39	24	0	2014-02-17 07:39:39.287498	2014-02-17 07:39:39.287498	101	\N	f
5360	39	24	0	2014-02-17 07:39:39.29189	2014-02-17 07:39:39.29189	102	\N	f
5362	20	24	0	2014-02-17 07:39:39.303677	2014-02-17 07:39:39.303677	23	\N	f
5363	20	24	0	2014-02-17 07:39:39.308079	2014-02-17 07:39:39.308079	24	\N	f
5365	20	24	0	2014-02-17 07:39:39.316934	2014-02-17 07:39:39.316934	26	\N	f
5366	16	24	0	2014-02-17 07:39:39.32417	2014-02-17 07:39:39.32417	7	\N	f
5368	16	24	0	2014-02-17 07:39:39.333048	2014-02-17 07:39:39.333048	9	\N	f
5369	16	24	0	2014-02-17 07:39:39.337357	2014-02-17 07:39:39.337357	10	\N	f
5370	26	24	0	2014-02-17 07:39:39.344593	2014-02-17 07:39:39.344593	47	\N	f
5371	26	24	0	2014-02-17 07:39:39.349096	2014-02-17 07:39:39.349096	48	\N	f
5373	26	24	0	2014-02-17 07:39:39.357851	2014-02-17 07:39:39.357851	50	\N	f
5374	37	24	0	2014-02-17 07:39:39.365987	2014-02-17 07:39:39.365987	91	\N	f
5375	37	24	0	2014-02-17 07:39:39.370377	2014-02-17 07:39:39.370377	92	\N	f
5378	17	24	0	2014-02-17 07:39:39.386437	2014-02-17 07:39:39.386437	11	\N	f
5379	17	24	0	2014-02-17 07:39:39.390852	2014-02-17 07:39:39.390852	12	\N	f
5381	17	24	0	2014-02-17 07:39:39.399705	2014-02-17 07:39:39.399705	14	\N	f
5382	19	24	0	2014-02-17 07:39:39.407048	2014-02-17 07:39:39.407048	19	\N	f
5384	19	24	0	2014-02-17 07:39:39.415846	2014-02-17 07:39:39.415846	21	\N	f
5385	19	24	0	2014-02-17 07:39:39.420204	2014-02-17 07:39:39.420204	22	\N	f
5386	25	24	0	2014-02-17 07:39:39.427507	2014-02-17 07:39:39.427507	43	\N	f
5388	25	24	0	2014-02-17 07:39:39.436349	2014-02-17 07:39:39.436349	45	\N	f
5389	25	24	0	2014-02-17 07:39:39.440855	2014-02-17 07:39:39.440855	46	\N	f
5392	21	24	0	2014-02-17 07:39:39.507841	2014-02-17 07:39:39.507841	29	\N	f
5393	21	24	0	2014-02-17 07:39:39.510332	2014-02-17 07:39:39.510332	30	\N	f
5394	67	24	0	2014-02-17 07:39:39.51447	2014-02-17 07:39:39.51447	210	\N	f
5395	67	24	0	2014-02-17 07:39:39.516689	2014-02-17 07:39:39.516689	211	\N	f
5396	67	24	0	2014-02-17 07:39:39.518896	2014-02-17 07:39:39.518896	212	\N	f
5399	46	24	0	2014-02-17 07:39:39.528361	2014-02-17 07:39:39.528361	128	\N	f
5400	46	24	0	2014-02-17 07:39:39.530955	2014-02-17 07:39:39.530955	129	\N	f
5403	76	24	0	2014-02-17 07:39:39.540764	2014-02-17 07:39:39.540764	240	\N	f
5404	76	24	0	2014-02-17 07:39:39.543333	2014-02-17 07:39:39.543333	241	\N	f
5405	75	24	0	2014-02-17 07:39:39.547889	2014-02-17 07:39:39.547889	235	\N	f
5406	75	24	0	2014-02-17 07:39:39.55052	2014-02-17 07:39:39.55052	236	\N	f
5408	53	24	0	2014-02-17 07:39:39.557891	2014-02-17 07:39:39.557891	154	\N	f
5409	53	24	0	2014-02-17 07:39:39.560776	2014-02-17 07:39:39.560776	155	\N	f
5410	53	24	0	2014-02-17 07:39:39.563607	2014-02-17 07:39:39.563607	156	\N	f
5414	54	24	0	2014-02-17 07:39:39.577407	2014-02-17 07:39:39.577407	160	\N	f
5415	54	24	0	2014-02-17 07:39:39.580373	2014-02-17 07:39:39.580373	161	\N	f
5417	63	24	0	2014-02-17 07:39:39.588176	2014-02-17 07:39:39.588176	197	\N	f
5419	52	24	0	2014-02-17 07:39:39.596009	2014-02-17 07:39:39.596009	150	\N	f
5420	52	24	0	2014-02-17 07:39:39.598907	2014-02-17 07:39:39.598907	151	\N	f
5422	52	24	0	2014-02-17 07:39:39.604626	2014-02-17 07:39:39.604626	153	\N	f
5423	44	24	0	2014-02-17 07:39:39.609678	2014-02-17 07:39:39.609678	119	\N	f
5425	44	24	0	2014-02-17 07:39:39.615436	2014-02-17 07:39:39.615436	121	\N	f
5426	44	24	0	2014-02-17 07:39:39.618336	2014-02-17 07:39:39.618336	122	\N	f
5427	55	24	0	2014-02-17 07:39:39.623331	2014-02-17 07:39:39.623331	163	\N	f
5430	55	24	0	2014-02-17 07:39:39.631998	2014-02-17 07:39:39.631998	166	\N	f
5431	51	24	0	2014-02-17 07:39:39.636923	2014-02-17 07:39:39.636923	147	\N	f
5433	51	24	0	2014-02-17 07:39:39.642685	2014-02-17 07:39:39.642685	149	\N	f
5435	43	24	0	2014-02-17 07:39:39.650544	2014-02-17 07:39:39.650544	116	\N	f
5436	43	24	0	2014-02-17 07:39:39.653445	2014-02-17 07:39:39.653445	117	\N	f
5437	43	24	0	2014-02-17 07:39:39.656281	2014-02-17 07:39:39.656281	118	\N	f
5439	61	24	0	2014-02-17 07:39:39.664226	2014-02-17 07:39:39.664226	190	\N	f
5440	61	24	0	2014-02-17 07:39:39.66713	2014-02-17 07:39:39.66713	191	\N	f
5442	61	24	0	2014-02-17 07:39:39.672901	2014-02-17 07:39:39.672901	193	\N	f
5446	59	24	0	2014-02-17 07:39:39.688618	2014-02-17 07:39:39.688618	179	\N	f
5447	59	24	0	2014-02-17 07:39:39.691602	2014-02-17 07:39:39.691602	180	\N	f
5449	59	24	0	2014-02-17 07:39:39.697331	2014-02-17 07:39:39.697331	182	\N	f
5450	59	24	0	2014-02-17 07:39:39.700189	2014-02-17 07:39:39.700189	183	\N	f
5451	50	24	0	2014-02-17 07:39:39.705234	2014-02-17 07:39:39.705234	143	\N	f
5452	50	24	0	2014-02-17 07:39:39.708067	2014-02-17 07:39:39.708067	144	\N	f
5454	50	24	0	2014-02-17 07:39:39.71396	2014-02-17 07:39:39.71396	146	\N	f
5455	49	24	0	2014-02-17 07:39:39.718993	2014-02-17 07:39:39.718993	138	\N	f
5364	20	24	1	2014-02-17 07:39:39.312456	2014-02-17 09:02:01.737994	25	\N	t
5367	16	24	2	2014-02-17 07:39:39.328535	2014-02-17 09:02:27.949897	8	\N	t
5372	26	24	2	2014-02-17 07:39:39.35345	2014-02-17 09:02:47.709682	49	\N	t
5377	37	24	0	2014-02-17 07:39:39.379138	2014-02-17 09:03:08.354839	94	\N	t
5380	17	24	2	2014-02-17 07:39:39.39531	2014-02-17 09:03:21.123374	13	\N	t
5376	37	24	0	2014-02-17 07:39:39.374743	2014-02-17 08:56:40.027313	93	\N	f
5383	19	24	2	2014-02-17 07:39:39.411414	2014-02-17 09:03:43.078082	20	\N	t
5387	25	24	2	2014-02-17 07:39:39.431951	2014-02-17 09:03:55.049826	44	\N	t
5390	21	24	0	2014-02-17 07:39:39.448255	2014-02-17 09:04:17.438442	27	\N	t
5398	46	24	1	2014-02-17 07:39:39.525786	2014-02-17 09:04:54.280404	127	\N	t
5401	76	24	0	2014-02-17 07:39:39.535514	2014-02-17 09:05:38.730049	238	\N	t
5402	76	24	0	2014-02-17 07:39:39.538166	2014-02-17 08:56:40.219003	239	\N	f
5411	53	24	0	2014-02-17 07:39:39.566457	2014-02-17 09:07:29.942073	157	\N	t
5412	53	24	0	2014-02-17 07:39:39.569356	2014-02-17 08:56:40.296999	158	\N	f
5413	54	24	0	2014-02-17 07:39:39.574417	2014-02-17 08:56:40.308993	159	\N	f
5421	52	24	2	2014-02-17 07:39:39.601751	2014-02-17 09:08:43.801525	152	\N	t
5424	44	24	2	2014-02-17 07:39:39.612522	2014-02-17 09:09:03.94378	120	\N	t
5428	55	24	0	2014-02-17 07:39:39.626212	2014-02-17 09:09:32.458768	164	\N	t
5429	55	24	0	2014-02-17 07:39:39.629127	2014-02-17 08:56:40.400035	165	\N	f
5434	43	24	2	2014-02-17 07:39:39.647674	2014-02-17 09:10:02.280426	115	\N	t
5441	61	24	0	2014-02-17 07:39:39.670019	2014-02-17 09:10:46.121653	192	\N	t
5438	61	24	0	2014-02-17 07:39:39.661384	2014-02-17 08:56:40.46262	189	\N	f
5444	62	24	0	2014-02-17 07:39:39.680714	2014-02-17 08:56:40.536353	195	\N	f
5453	50	24	2	2014-02-17 07:39:39.710957	2014-02-17 09:12:28.546803	145	\N	t
5457	49	24	0	2014-02-17 07:39:39.724863	2014-02-17 09:13:57.677942	140	\N	t
5456	49	24	0	2014-02-17 07:39:39.721925	2014-02-17 08:56:40.607077	139	\N	f
5357	15	24	2	2014-02-17 07:39:39.275764	2014-02-17 09:01:25.851777	6	\N	t
5397	67	24	2	2014-02-17 07:39:39.521263	2014-02-17 09:04:34.463961	213	\N	t
5407	75	24	1	2014-02-17 07:39:39.553093	2014-02-17 09:06:35.382349	237	\N	t
5416	54	24	0	2014-02-17 07:39:39.583308	2014-02-17 09:08:13.439237	162	\N	t
5418	63	24	2	2014-02-17 07:39:39.591046	2014-02-17 09:08:22.927837	198	\N	t
5432	51	24	2	2014-02-17 07:39:39.639763	2014-02-17 09:09:51.99654	148	\N	t
5445	62	24	0	2014-02-17 07:39:39.683577	2014-02-17 09:11:41.011158	196	\N	t
5443	62	24	0	2014-02-17 07:39:39.677842	2014-02-17 09:11:40.954754	194	\N	f
5448	59	24	2	2014-02-17 07:39:39.694458	2014-02-17 09:12:02.839681	181	\N	t
5458	49	24	0	2014-02-17 07:39:39.727714	2014-02-17 07:39:39.727714	141	\N	f
5459	49	24	0	2014-02-17 07:39:39.73066	2014-02-17 07:39:39.73066	142	\N	f
5460	71	24	0	2014-02-17 07:39:39.735579	2014-02-17 07:39:39.735579	223	\N	f
5461	71	24	0	2014-02-17 07:39:39.738479	2014-02-17 07:39:39.738479	224	\N	f
5464	73	24	0	2014-02-17 07:39:39.749205	2014-02-17 07:39:39.749205	230	\N	f
5465	73	24	0	2014-02-17 07:39:39.752043	2014-02-17 07:39:39.752043	231	\N	f
5466	72	24	0	2014-02-17 07:39:39.756986	2014-02-17 07:39:39.756986	226	\N	f
5467	72	24	0	2014-02-17 07:39:39.759824	2014-02-17 07:39:39.759824	227	\N	f
5469	74	24	0	2014-02-17 07:39:39.767692	2014-02-17 07:39:39.767692	232	\N	f
5471	74	24	0	2014-02-17 07:39:39.773444	2014-02-17 07:39:39.773444	234	\N	f
5473	57	24	0	2014-02-17 07:39:39.78135	2014-02-17 07:39:39.78135	172	\N	f
5474	57	24	0	2014-02-17 07:39:39.784213	2014-02-17 07:39:39.784213	173	\N	f
5475	57	24	0	2014-02-17 07:39:39.787124	2014-02-17 07:39:39.787124	174	\N	f
5476	56	24	0	2014-02-17 07:39:39.792167	2014-02-17 07:39:39.792167	167	\N	f
5477	56	24	0	2014-02-17 07:39:39.795041	2014-02-17 07:39:39.795041	168	\N	f
5480	65	24	0	2014-02-17 07:39:39.806733	2014-02-17 07:39:39.806733	202	\N	f
5481	65	24	0	2014-02-17 07:39:39.80975	2014-02-17 07:39:39.80975	203	\N	f
5483	65	24	0	2014-02-17 07:39:39.816495	2014-02-17 07:39:39.816495	205	\N	f
5484	60	24	0	2014-02-17 07:39:39.822752	2014-02-17 07:39:39.822752	184	\N	f
5486	60	24	0	2014-02-17 07:39:39.830742	2014-02-17 07:39:39.830742	186	\N	f
5487	60	24	0	2014-02-17 07:39:39.835247	2014-02-17 07:39:39.835247	187	\N	f
5488	60	24	0	2014-02-17 07:39:39.838651	2014-02-17 07:39:39.838651	188	\N	f
5490	64	24	0	2014-02-17 07:39:39.845139	2014-02-17 07:39:39.845139	200	\N	f
5491	64	24	0	2014-02-17 07:39:39.848841	2014-02-17 07:39:39.848841	201	\N	f
5492	69	24	0	2014-02-17 07:39:39.855719	2014-02-17 07:39:39.855719	216	\N	f
5493	69	24	0	2014-02-17 07:39:39.908145	2014-02-17 07:39:39.908145	217	\N	f
5495	69	24	0	2014-02-17 07:39:39.916125	2014-02-17 07:39:39.916125	219	\N	f
5496	38	24	0	2014-02-17 07:39:39.922573	2014-02-17 07:39:39.922573	95	\N	f
5498	38	24	0	2014-02-17 07:39:39.931469	2014-02-17 07:39:39.931469	97	\N	f
5499	38	24	0	2014-02-17 07:39:39.935894	2014-02-17 07:39:39.935894	98	\N	f
5500	38	24	0	2014-02-17 07:39:39.940261	2014-02-17 07:39:39.940261	99	\N	f
5502	70	24	0	2014-02-17 07:39:39.952068	2014-02-17 07:39:39.952068	221	\N	f
5505	66	24	0	2014-02-17 07:39:39.968448	2014-02-17 07:39:39.968448	207	\N	f
5507	66	24	0	2014-02-17 07:39:39.977398	2014-02-17 07:39:39.977398	209	\N	f
5510	40	24	0	2014-02-17 07:39:39.996435	2014-02-17 07:39:39.996435	104	\N	f
5511	40	24	0	2014-02-17 07:39:40.000913	2014-02-17 07:39:40.000913	105	\N	f
5513	40	24	0	2014-02-17 07:39:40.009721	2014-02-17 07:39:40.009721	107	\N	f
5516	45	24	0	2014-02-17 07:39:40.025935	2014-02-17 07:39:40.025935	125	\N	f
5517	45	24	0	2014-02-17 07:39:40.030374	2014-02-17 07:39:40.030374	126	\N	f
5518	48	24	0	2014-02-17 07:39:40.037721	2014-02-17 07:39:40.037721	134	\N	f
5519	48	24	0	2014-02-17 07:39:40.042239	2014-02-17 07:39:40.042239	135	\N	f
5521	48	24	0	2014-02-17 07:39:40.050944	2014-02-17 07:39:40.050944	137	\N	f
5522	47	24	0	2014-02-17 07:39:40.058238	2014-02-17 07:39:40.058238	130	\N	f
5524	47	24	0	2014-02-17 07:39:40.067046	2014-02-17 07:39:40.067046	132	\N	f
5525	47	24	0	2014-02-17 07:39:40.071382	2014-02-17 07:39:40.071382	133	\N	f
5526	42	24	0	2014-02-17 07:39:40.078618	2014-02-17 07:39:40.078618	112	\N	f
5527	42	24	0	2014-02-17 07:39:40.083134	2014-02-17 07:39:40.083134	113	\N	f
5529	58	24	0	2014-02-17 07:39:40.095038	2014-02-17 07:39:40.095038	175	\N	f
5531	58	24	0	2014-02-17 07:39:40.103919	2014-02-17 07:39:40.103919	177	\N	f
5532	58	24	0	2014-02-17 07:39:40.108338	2014-02-17 07:39:40.108338	178	\N	f
5534	41	24	0	2014-02-17 07:39:40.120315	2014-02-17 07:39:40.120315	109	\N	f
5536	41	24	0	2014-02-17 07:39:40.129179	2014-02-17 07:39:40.129179	111	\N	f
5537	32	25	0	2014-02-17 07:39:40.157618	2014-02-17 07:39:40.157618	71	\N	f
5540	32	25	0	2014-02-17 07:39:40.17085	2014-02-17 07:39:40.17085	74	\N	f
5541	18	25	0	2014-02-17 07:39:40.178161	2014-02-17 07:39:40.178161	15	\N	f
5543	18	25	0	2014-02-17 07:39:40.187072	2014-02-17 07:39:40.187072	17	\N	f
5544	18	25	0	2014-02-17 07:39:40.191413	2014-02-17 07:39:40.191413	18	\N	f
5545	27	25	0	2014-02-17 07:39:40.198761	2014-02-17 07:39:40.198761	51	\N	f
5546	27	25	0	2014-02-17 07:39:40.203155	2014-02-17 07:39:40.203155	52	\N	f
5549	28	25	0	2014-02-17 07:39:40.219273	2014-02-17 07:39:40.219273	55	\N	f
5550	28	25	0	2014-02-17 07:39:40.223673	2014-02-17 07:39:40.223673	56	\N	f
5551	28	25	0	2014-02-17 07:39:40.228053	2014-02-17 07:39:40.228053	57	\N	f
5554	24	25	0	2014-02-17 07:39:40.244265	2014-02-17 07:39:40.244265	40	\N	f
5555	24	25	0	2014-02-17 07:39:40.248628	2014-02-17 07:39:40.248628	41	\N	f
5556	24	25	0	2014-02-17 07:39:40.253133	2014-02-17 07:39:40.253133	42	\N	f
5559	29	25	0	2014-02-17 07:39:40.269363	2014-02-17 07:39:40.269363	61	\N	f
5561	23	25	0	2014-02-17 07:39:40.281147	2014-02-17 07:39:40.281147	35	\N	f
5562	23	25	0	2014-02-17 07:39:40.285552	2014-02-17 07:39:40.285552	36	\N	f
5547	27	25	0	2014-02-17 07:39:40.207589	2014-02-17 08:58:48.012607	53	\N	t
5548	27	25	0	2014-02-17 07:39:40.211938	2014-02-17 08:56:36.896815	54	\N	f
5553	24	25	2	2014-02-17 07:39:40.239757	2014-02-17 08:59:18.106002	39	\N	t
5557	29	25	0	2014-02-17 07:39:40.260446	2014-02-17 08:59:46.68497	59	\N	t
5560	29	25	0	2014-02-17 07:39:40.273733	2014-02-17 08:56:36.959179	62	\N	f
5563	23	25	0	2014-02-17 07:39:40.289959	2014-02-17 09:00:53.824497	37	\N	f
5463	73	24	2	2014-02-17 07:39:39.746281	2014-02-17 09:14:23.924862	229	\N	t
5468	72	24	2	2014-02-17 07:39:39.762795	2014-02-17 09:14:36.782871	228	\N	t
5472	57	24	2	2014-02-17 07:39:39.778441	2014-02-17 09:15:19.519803	171	\N	t
5479	56	24	0	2014-02-17 07:39:39.800817	2014-02-17 09:15:36.573776	170	\N	t
5478	56	24	0	2014-02-17 07:39:39.797913	2014-02-17 08:56:40.725341	169	\N	f
5485	60	24	2	2014-02-17 07:39:39.826471	2014-02-17 09:17:15.598775	185	\N	t
5489	64	24	2	2014-02-17 07:39:39.842684	2014-02-17 09:17:42.156618	199	\N	t
5494	69	24	2	2014-02-17 07:39:39.911611	2014-02-17 09:17:57.805358	218	\N	t
5497	38	24	2	2014-02-17 07:39:39.927027	2014-02-17 09:18:39.590993	96	\N	t
5501	70	24	0	2014-02-17 07:39:39.94761	2014-02-17 09:19:40.505394	220	\N	t
5503	70	24	0	2014-02-17 07:39:39.95662	2014-02-17 08:56:40.85857	222	\N	f
5506	66	24	0	2014-02-17 07:39:39.972925	2014-02-17 08:56:40.873767	208	\N	f
5509	68	24	0	2014-02-17 07:39:39.989117	2014-02-17 08:56:40.8905	215	\N	f
5515	45	24	0	2014-02-17 07:39:40.021498	2014-02-17 09:21:22.834438	124	\N	t
5514	45	24	0	2014-02-17 07:39:40.017119	2014-02-17 08:56:40.920549	123	\N	f
5520	48	24	0	2014-02-17 07:39:40.046578	2014-02-17 09:21:57.769801	136	\N	f
5528	42	24	1	2014-02-17 07:39:40.087602	2014-02-17 09:22:22.72807	114	\N	t
5530	58	24	1	2014-02-17 07:39:40.099518	2014-02-17 09:22:34.646993	176	\N	t
5535	41	24	1	2014-02-17 07:39:40.124762	2014-02-17 09:23:13.912734	110	\N	t
5542	18	25	2	2014-02-17 07:39:40.182583	2014-02-17 08:58:04.705398	16	\N	t
5552	28	25	1	2014-02-17 07:39:40.232467	2014-02-17 08:59:11.641388	58	\N	t
5558	29	25	0	2014-02-17 07:39:40.264985	2014-02-17 08:59:46.651445	60	\N	f
5564	23	25	0	2014-02-17 07:39:40.294334	2014-02-17 09:00:53.890032	38	\N	t
5462	71	24	2	2014-02-17 07:39:39.741348	2014-02-17 09:14:14.03404	225	\N	t
5482	65	24	2	2014-02-17 07:39:39.812634	2014-02-17 09:16:32.203399	204	\N	t
5504	66	24	0	2014-02-17 07:39:39.964009	2014-02-17 09:20:15.721015	206	\N	t
5508	68	24	0	2014-02-17 07:39:39.984539	2014-02-17 09:20:43.803583	214	\N	t
5512	40	24	1	2014-02-17 07:39:40.00529	2014-02-17 09:21:08.102346	106	\N	t
5523	47	24	1	2014-02-17 07:39:40.062732	2014-02-17 09:22:09.664206	131	\N	t
5533	41	24	0	2014-02-17 07:39:40.115921	2014-02-17 09:23:13.891352	108	\N	f
5565	22	25	0	2014-02-17 07:39:40.301709	2014-02-17 07:39:40.301709	31	\N	f
5566	22	25	0	2014-02-17 07:39:40.306238	2014-02-17 07:39:40.306238	32	\N	f
5568	22	25	0	2014-02-17 07:39:40.315003	2014-02-17 07:39:40.315003	34	\N	f
5569	36	25	0	2014-02-17 07:39:40.322349	2014-02-17 07:39:40.322349	87	\N	f
5570	36	25	0	2014-02-17 07:39:40.326788	2014-02-17 07:39:40.326788	88	\N	f
5571	36	25	0	2014-02-17 07:39:40.331192	2014-02-17 07:39:40.331192	89	\N	f
5573	15	25	0	2014-02-17 07:39:40.342932	2014-02-17 07:39:40.342932	3	\N	f
5574	15	25	0	2014-02-17 07:39:40.347292	2014-02-17 07:39:40.347292	4	\N	f
5575	15	25	0	2014-02-17 07:39:40.351787	2014-02-17 07:39:40.351787	5	\N	f
5577	39	25	0	2014-02-17 07:39:40.36375	2014-02-17 07:39:40.36375	100	\N	f
5578	39	25	0	2014-02-17 07:39:40.368172	2014-02-17 07:39:40.368172	101	\N	f
5579	39	25	0	2014-02-17 07:39:40.372581	2014-02-17 07:39:40.372581	102	\N	f
5581	20	25	0	2014-02-17 07:39:40.384516	2014-02-17 07:39:40.384516	23	\N	f
5582	20	25	0	2014-02-17 07:39:40.389146	2014-02-17 07:39:40.389146	24	\N	f
5584	20	25	0	2014-02-17 07:39:40.399858	2014-02-17 07:39:40.399858	26	\N	f
5587	16	25	0	2014-02-17 07:39:40.460199	2014-02-17 07:39:40.460199	9	\N	f
5588	16	25	0	2014-02-17 07:39:40.462946	2014-02-17 07:39:40.462946	10	\N	f
5589	26	25	0	2014-02-17 07:39:40.467919	2014-02-17 07:39:40.467919	47	\N	f
5590	26	25	0	2014-02-17 07:39:40.470846	2014-02-17 07:39:40.470846	48	\N	f
5592	26	25	0	2014-02-17 07:39:40.476567	2014-02-17 07:39:40.476567	50	\N	f
5593	37	25	0	2014-02-17 07:39:40.48162	2014-02-17 07:39:40.48162	91	\N	f
5594	37	25	0	2014-02-17 07:39:40.484494	2014-02-17 07:39:40.484494	92	\N	f
5597	17	25	0	2014-02-17 07:39:40.497839	2014-02-17 07:39:40.497839	11	\N	f
5598	17	25	0	2014-02-17 07:39:40.502093	2014-02-17 07:39:40.502093	12	\N	f
5600	17	25	0	2014-02-17 07:39:40.510817	2014-02-17 07:39:40.510817	14	\N	f
5601	19	25	0	2014-02-17 07:39:40.518147	2014-02-17 07:39:40.518147	19	\N	f
5603	19	25	0	2014-02-17 07:39:40.526899	2014-02-17 07:39:40.526899	21	\N	f
5605	25	25	0	2014-02-17 07:39:40.538657	2014-02-17 07:39:40.538657	43	\N	f
5607	25	25	0	2014-02-17 07:39:40.547453	2014-02-17 07:39:40.547453	45	\N	f
5608	25	25	0	2014-02-17 07:39:40.551862	2014-02-17 07:39:40.551862	46	\N	f
5611	21	25	0	2014-02-17 07:39:40.568382	2014-02-17 07:39:40.568382	29	\N	f
5612	21	25	0	2014-02-17 07:39:40.572922	2014-02-17 07:39:40.572922	30	\N	f
5613	67	25	0	2014-02-17 07:39:40.580185	2014-02-17 07:39:40.580185	210	\N	f
5615	67	25	0	2014-02-17 07:39:40.589097	2014-02-17 07:39:40.589097	212	\N	f
5618	46	25	0	2014-02-17 07:39:40.605063	2014-02-17 07:39:40.605063	128	\N	f
5620	76	25	0	2014-02-17 07:39:40.616591	2014-02-17 07:39:40.616591	238	\N	f
5622	76	25	0	2014-02-17 07:39:40.625445	2014-02-17 07:39:40.625445	240	\N	f
5623	76	25	0	2014-02-17 07:39:40.629781	2014-02-17 07:39:40.629781	241	\N	f
5624	75	25	0	2014-02-17 07:39:40.636991	2014-02-17 07:39:40.636991	235	\N	f
5627	53	25	0	2014-02-17 07:39:40.653192	2014-02-17 07:39:40.653192	154	\N	f
5628	53	25	0	2014-02-17 07:39:40.657556	2014-02-17 07:39:40.657556	155	\N	f
5629	53	25	0	2014-02-17 07:39:40.66197	2014-02-17 07:39:40.66197	156	\N	f
5630	53	25	0	2014-02-17 07:39:40.66626	2014-02-17 07:39:40.66626	157	\N	f
5633	54	25	0	2014-02-17 07:39:40.682346	2014-02-17 07:39:40.682346	160	\N	f
5634	54	25	0	2014-02-17 07:39:40.686792	2014-02-17 07:39:40.686792	161	\N	f
5635	54	25	0	2014-02-17 07:39:40.691157	2014-02-17 07:39:40.691157	162	\N	f
5638	52	25	0	2014-02-17 07:39:40.709839	2014-02-17 07:39:40.709839	150	\N	f
5639	52	25	0	2014-02-17 07:39:40.714245	2014-02-17 07:39:40.714245	151	\N	f
5641	52	25	0	2014-02-17 07:39:40.723004	2014-02-17 07:39:40.723004	153	\N	f
5642	44	25	0	2014-02-17 07:39:40.730251	2014-02-17 07:39:40.730251	119	\N	f
5644	44	25	0	2014-02-17 07:39:40.738958	2014-02-17 07:39:40.738958	121	\N	f
5645	44	25	0	2014-02-17 07:39:40.743378	2014-02-17 07:39:40.743378	122	\N	f
5646	55	25	0	2014-02-17 07:39:40.750672	2014-02-17 07:39:40.750672	163	\N	f
5647	55	25	0	2014-02-17 07:39:40.755043	2014-02-17 07:39:40.755043	164	\N	f
5649	55	25	0	2014-02-17 07:39:40.763747	2014-02-17 07:39:40.763747	166	\N	f
5650	51	25	0	2014-02-17 07:39:40.770808	2014-02-17 07:39:40.770808	147	\N	f
5652	51	25	0	2014-02-17 07:39:40.779636	2014-02-17 07:39:40.779636	149	\N	f
5654	43	25	0	2014-02-17 07:39:40.791299	2014-02-17 07:39:40.791299	116	\N	f
5655	43	25	0	2014-02-17 07:39:40.795715	2014-02-17 07:39:40.795715	117	\N	f
5656	43	25	0	2014-02-17 07:39:40.800142	2014-02-17 07:39:40.800142	118	\N	f
5658	61	25	0	2014-02-17 07:39:40.812068	2014-02-17 07:39:40.812068	190	\N	f
5660	61	25	0	2014-02-17 07:39:40.820945	2014-02-17 07:39:40.820945	192	\N	f
5661	61	25	0	2014-02-17 07:39:40.825296	2014-02-17 07:39:40.825296	193	\N	f
5662	62	25	0	2014-02-17 07:39:40.832548	2014-02-17 07:39:40.832548	194	\N	f
5665	59	25	0	2014-02-17 07:39:40.848858	2014-02-17 07:39:40.848858	179	\N	f
5666	59	25	0	2014-02-17 07:39:40.853325	2014-02-17 07:39:40.853325	180	\N	f
5668	59	25	0	2014-02-17 07:39:40.862134	2014-02-17 07:39:40.862134	182	\N	f
5669	59	25	0	2014-02-17 07:39:40.866466	2014-02-17 07:39:40.866466	183	\N	f
5670	50	25	0	2014-02-17 07:39:40.873834	2014-02-17 07:39:40.873834	143	\N	f
5671	50	25	0	2014-02-17 07:39:40.87828	2014-02-17 07:39:40.87828	144	\N	f
5576	15	25	2	2014-02-17 07:39:40.356333	2014-02-17 09:01:55.300243	6	\N	t
5580	39	25	1	2014-02-17 07:39:40.377094	2014-02-17 09:02:03.021803	103	\N	t
5583	20	25	1	2014-02-17 07:39:40.393692	2014-02-17 09:02:11.641517	25	\N	t
5585	16	25	0	2014-02-17 07:39:40.454615	2014-02-17 09:02:41.221397	7	\N	t
5586	16	25	0	2014-02-17 07:39:40.457953	2014-02-17 08:56:37.113126	8	\N	f
5599	17	25	2	2014-02-17 07:39:40.506422	2014-02-17 09:03:23.483538	13	\N	t
5595	37	25	0	2014-02-17 07:39:40.487405	2014-02-17 08:56:37.157889	93	\N	f
5604	19	25	0	2014-02-17 07:39:40.531281	2014-02-17 09:03:38.580847	22	\N	t
5602	19	25	0	2014-02-17 07:39:40.522518	2014-02-17 08:56:37.204816	20	\N	f
5610	21	25	0	2014-02-17 07:39:40.563901	2014-02-17 08:56:37.249928	28	\N	f
5621	76	25	1	2014-02-17 07:39:40.621041	2014-02-17 09:05:32.950402	239	\N	t
5617	46	25	0	2014-02-17 07:39:40.600564	2014-02-17 08:56:37.290041	127	\N	f
5626	75	25	1	2014-02-17 07:39:40.645773	2014-02-17 09:07:07.492042	237	\N	t
5631	53	25	2	2014-02-17 07:39:40.670564	2014-02-17 09:08:23.364054	158	\N	t
5632	54	25	2	2014-02-17 07:39:40.677966	2014-02-17 09:09:03.302285	159	\N	t
5637	63	25	2	2014-02-17 07:39:40.702513	2014-02-17 09:10:52.241711	198	\N	t
5651	51	25	0	2014-02-17 07:39:40.775258	2014-02-17 09:10:58.666951	148	\N	f
5643	44	25	2	2014-02-17 07:39:40.734615	2014-02-17 09:09:52.893653	120	\N	t
5648	55	25	2	2014-02-17 07:39:40.759424	2014-02-17 09:10:24.069393	165	\N	t
5653	43	25	2	2014-02-17 07:39:40.786922	2014-02-17 09:11:12.011398	115	\N	t
5636	63	25	0	2014-02-17 07:39:40.698153	2014-02-17 09:10:52.223774	197	\N	f
5657	61	25	2	2014-02-17 07:39:40.807606	2014-02-17 09:22:05.644537	189	\N	t
5663	62	25	0	2014-02-17 07:39:40.837	2014-02-17 08:56:37.539344	195	\N	f
5659	61	25	0	2014-02-17 07:39:40.816455	2014-02-17 09:22:05.597131	191	\N	f
5572	36	25	2	2014-02-17 07:39:40.335583	2014-02-17 09:01:34.830162	90	\N	t
5591	26	25	2	2014-02-17 07:39:40.473719	2014-02-17 09:03:00.935189	49	\N	t
5609	21	25	0	2014-02-17 07:39:40.559169	2014-02-17 09:03:56.305175	27	\N	t
5616	67	25	2	2014-02-17 07:39:40.593462	2014-02-17 09:04:52.220548	213	\N	t
5614	67	25	0	2014-02-17 07:39:40.584607	2014-02-17 09:04:52.19946	211	\N	f
5619	46	25	0	2014-02-17 07:39:40.609393	2014-02-17 09:05:10.82542	129	\N	f
5625	75	25	0	2014-02-17 07:39:40.641423	2014-02-17 09:07:07.46935	236	\N	f
5640	52	25	2	2014-02-17 07:39:40.718623	2014-02-17 09:09:33.168891	152	\N	t
5664	62	25	0	2014-02-17 07:39:40.841441	2014-02-17 09:12:38.754329	196	\N	t
5667	59	25	2	2014-02-17 07:39:40.857757	2014-02-17 09:12:54.906638	181	\N	t
5673	50	25	0	2014-02-17 07:39:40.887072	2014-02-17 07:39:40.887072	146	\N	f
5674	49	25	0	2014-02-17 07:39:40.894659	2014-02-17 07:39:40.894659	138	\N	f
5676	49	25	0	2014-02-17 07:39:40.903564	2014-02-17 07:39:40.903564	140	\N	f
5678	49	25	0	2014-02-17 07:39:40.963832	2014-02-17 07:39:40.963832	142	\N	f
5679	71	25	0	2014-02-17 07:39:40.970083	2014-02-17 07:39:40.970083	223	\N	f
5680	71	25	0	2014-02-17 07:39:40.973706	2014-02-17 07:39:40.973706	224	\N	f
5683	73	25	0	2014-02-17 07:39:40.984494	2014-02-17 07:39:40.984494	230	\N	f
5685	72	25	0	2014-02-17 07:39:40.992355	2014-02-17 07:39:40.992355	226	\N	f
5686	72	25	0	2014-02-17 07:39:40.995269	2014-02-17 07:39:40.995269	227	\N	f
5688	74	25	0	2014-02-17 07:39:41.003243	2014-02-17 07:39:41.003243	232	\N	f
5690	74	25	0	2014-02-17 07:39:41.011398	2014-02-17 07:39:41.011398	234	\N	f
5692	57	25	0	2014-02-17 07:39:41.022303	2014-02-17 07:39:41.022303	172	\N	f
5693	57	25	0	2014-02-17 07:39:41.024556	2014-02-17 07:39:41.024556	173	\N	f
5694	57	25	0	2014-02-17 07:39:41.026827	2014-02-17 07:39:41.026827	174	\N	f
5695	56	25	0	2014-02-17 07:39:41.030826	2014-02-17 07:39:41.030826	167	\N	f
5696	56	25	0	2014-02-17 07:39:41.033126	2014-02-17 07:39:41.033126	168	\N	f
5698	56	25	0	2014-02-17 07:39:41.037537	2014-02-17 07:39:41.037537	170	\N	f
5700	65	25	0	2014-02-17 07:39:41.043757	2014-02-17 07:39:41.043757	203	\N	f
5702	65	25	0	2014-02-17 07:39:41.048246	2014-02-17 07:39:41.048246	205	\N	f
5703	60	25	0	2014-02-17 07:39:41.052319	2014-02-17 07:39:41.052319	184	\N	f
5705	60	25	0	2014-02-17 07:39:41.056817	2014-02-17 07:39:41.056817	186	\N	f
5706	60	25	0	2014-02-17 07:39:41.059027	2014-02-17 07:39:41.059027	187	\N	f
5707	60	25	0	2014-02-17 07:39:41.06131	2014-02-17 07:39:41.06131	188	\N	f
5709	64	25	0	2014-02-17 07:39:41.067466	2014-02-17 07:39:41.067466	200	\N	f
5710	64	25	0	2014-02-17 07:39:41.069762	2014-02-17 07:39:41.069762	201	\N	f
5711	69	25	0	2014-02-17 07:39:41.076095	2014-02-17 07:39:41.076095	216	\N	f
5712	69	25	0	2014-02-17 07:39:41.080525	2014-02-17 07:39:41.080525	217	\N	f
5714	69	25	0	2014-02-17 07:39:41.089495	2014-02-17 07:39:41.089495	219	\N	f
5715	38	25	0	2014-02-17 07:39:41.097013	2014-02-17 07:39:41.097013	95	\N	f
5717	38	25	0	2014-02-17 07:39:41.105948	2014-02-17 07:39:41.105948	97	\N	f
5718	38	25	0	2014-02-17 07:39:41.110279	2014-02-17 07:39:41.110279	98	\N	f
5719	38	25	0	2014-02-17 07:39:41.114705	2014-02-17 07:39:41.114705	99	\N	f
5720	70	25	0	2014-02-17 07:39:41.12192	2014-02-17 07:39:41.12192	220	\N	f
5721	70	25	0	2014-02-17 07:39:41.126299	2014-02-17 07:39:41.126299	221	\N	f
5723	66	25	0	2014-02-17 07:39:41.138006	2014-02-17 07:39:41.138006	206	\N	f
5724	66	25	0	2014-02-17 07:39:41.142435	2014-02-17 07:39:41.142435	207	\N	f
5729	40	25	0	2014-02-17 07:39:41.170074	2014-02-17 07:39:41.170074	104	\N	f
5730	40	25	0	2014-02-17 07:39:41.174458	2014-02-17 07:39:41.174458	105	\N	f
5732	40	25	0	2014-02-17 07:39:41.183163	2014-02-17 07:39:41.183163	107	\N	f
5734	45	25	0	2014-02-17 07:39:41.194963	2014-02-17 07:39:41.194963	124	\N	f
5735	45	25	0	2014-02-17 07:39:41.199368	2014-02-17 07:39:41.199368	125	\N	f
5736	45	25	0	2014-02-17 07:39:41.203792	2014-02-17 07:39:41.203792	126	\N	f
5737	48	25	0	2014-02-17 07:39:41.211123	2014-02-17 07:39:41.211123	134	\N	f
5740	48	25	0	2014-02-17 07:39:41.224219	2014-02-17 07:39:41.224219	137	\N	f
5741	47	25	0	2014-02-17 07:39:41.231566	2014-02-17 07:39:41.231566	130	\N	f
5743	47	25	0	2014-02-17 07:39:41.240361	2014-02-17 07:39:41.240361	132	\N	f
5744	47	25	0	2014-02-17 07:39:41.244781	2014-02-17 07:39:41.244781	133	\N	f
5745	42	25	0	2014-02-17 07:39:41.251887	2014-02-17 07:39:41.251887	112	\N	f
5746	42	25	0	2014-02-17 07:39:41.256304	2014-02-17 07:39:41.256304	113	\N	f
5748	58	25	0	2014-02-17 07:39:41.268003	2014-02-17 07:39:41.268003	175	\N	f
5750	58	25	0	2014-02-17 07:39:41.276845	2014-02-17 07:39:41.276845	177	\N	f
5751	58	25	0	2014-02-17 07:39:41.281212	2014-02-17 07:39:41.281212	178	\N	f
5752	41	25	0	2014-02-17 07:39:41.288456	2014-02-17 07:39:41.288456	108	\N	f
5753	41	25	0	2014-02-17 07:39:41.292912	2014-02-17 07:39:41.292912	109	\N	f
5755	41	25	0	2014-02-17 07:39:41.301669	2014-02-17 07:39:41.301669	111	\N	f
5756	32	26	0	2014-02-17 07:39:41.329754	2014-02-17 07:39:41.329754	71	\N	f
5758	32	26	0	2014-02-17 07:39:41.338727	2014-02-17 07:39:41.338727	73	\N	f
5759	32	26	0	2014-02-17 07:39:41.343166	2014-02-17 07:39:41.343166	74	\N	f
5760	18	26	0	2014-02-17 07:39:41.350629	2014-02-17 07:39:41.350629	15	\N	f
5762	18	26	0	2014-02-17 07:39:41.410315	2014-02-17 07:39:41.410315	17	\N	f
5763	18	26	0	2014-02-17 07:39:41.412522	2014-02-17 07:39:41.412522	18	\N	f
5764	27	26	0	2014-02-17 07:39:41.416548	2014-02-17 07:39:41.416548	51	\N	f
5765	27	26	0	2014-02-17 07:39:41.418828	2014-02-17 07:39:41.418828	52	\N	f
5768	28	26	0	2014-02-17 07:39:41.42724	2014-02-17 07:39:41.42724	55	\N	f
5769	28	26	0	2014-02-17 07:39:41.429497	2014-02-17 07:39:41.429497	56	\N	f
5770	28	26	0	2014-02-17 07:39:41.431676	2014-02-17 07:39:41.431676	57	\N	f
5773	24	26	0	2014-02-17 07:39:41.440178	2014-02-17 07:39:41.440178	40	\N	f
5774	24	26	0	2014-02-17 07:39:41.44242	2014-02-17 07:39:41.44242	41	\N	f
5775	24	26	0	2014-02-17 07:39:41.444619	2014-02-17 07:39:41.444619	42	\N	f
5776	29	26	0	2014-02-17 07:39:41.448607	2014-02-17 07:39:41.448607	59	\N	f
5777	29	26	0	2014-02-17 07:39:41.450848	2014-02-17 07:39:41.450848	60	\N	f
5778	29	26	0	2014-02-17 07:39:41.453112	2014-02-17 07:39:41.453112	61	\N	f
5675	49	25	0	2014-02-17 07:39:40.899078	2014-02-17 08:56:37.604818	139	\N	f
5684	73	25	0	2014-02-17 07:39:40.987423	2014-02-17 09:14:40.521898	231	\N	t
5682	73	25	0	2014-02-17 07:39:40.981585	2014-02-17 08:56:37.640049	229	\N	f
5689	74	25	2	2014-02-17 07:39:41.006989	2014-02-17 09:15:07.758074	233	\N	t
5691	57	25	2	2014-02-17 07:39:41.018862	2014-02-17 09:15:16.996835	171	\N	t
5697	56	25	2	2014-02-17 07:39:41.035306	2014-02-17 09:15:39.99054	169	\N	t
5699	65	25	0	2014-02-17 07:39:41.041541	2014-02-17 09:16:17.1499	202	\N	t
5701	65	25	0	2014-02-17 07:39:41.046036	2014-02-17 08:56:37.741492	204	\N	f
5704	60	25	0	2014-02-17 07:39:41.05454	2014-02-17 08:56:37.763276	185	\N	f
5716	38	25	2	2014-02-17 07:39:41.10149	2014-02-17 09:16:51.924007	96	\N	t
5722	70	25	2	2014-02-17 07:39:41.130657	2014-02-17 09:17:10.382997	222	\N	t
5726	66	25	0	2014-02-17 07:39:41.151243	2014-02-17 09:17:51.984153	209	\N	t
5725	66	25	0	2014-02-17 07:39:41.146857	2014-02-17 08:56:37.871602	208	\N	f
5728	68	25	0	2014-02-17 07:39:41.162711	2014-02-17 08:56:37.888271	215	\N	f
5733	45	25	1	2014-02-17 07:39:41.190532	2014-02-17 09:18:29.730727	123	\N	t
5738	48	25	0	2014-02-17 07:39:41.215532	2014-02-17 09:19:37.481537	135	\N	t
5739	48	25	0	2014-02-17 07:39:41.219876	2014-02-17 08:56:37.947941	136	\N	f
5747	42	25	1	2014-02-17 07:39:41.260737	2014-02-17 09:20:44.621103	114	\N	t
5749	58	25	1	2014-02-17 07:39:41.272376	2014-02-17 09:21:08.854005	176	\N	t
5754	41	25	1	2014-02-17 07:39:41.297347	2014-02-17 09:21:44.012959	110	\N	t
5772	24	26	2	2014-02-17 07:39:41.437952	2014-02-17 08:59:01.772522	39	\N	t
5766	27	26	0	2014-02-17 07:39:41.421059	2014-02-17 09:00:42.22055	53	\N	t
5767	27	26	0	2014-02-17 07:39:41.423256	2014-02-17 08:56:44.081479	54	\N	f
5677	49	25	0	2014-02-17 07:39:40.908112	2014-02-17 09:14:06.385719	141	\N	t
5771	28	26	1	2014-02-17 07:39:41.43394	2014-02-17 09:01:06.879911	58	\N	t
5757	32	26	2	2014-02-17 07:39:41.334286	2014-02-17 08:57:29.203835	72	\N	t
5681	71	25	2	2014-02-17 07:39:40.976573	2014-02-17 09:14:22.974527	225	\N	t
5687	72	25	2	2014-02-17 07:39:40.998132	2014-02-17 09:14:56.599737	228	\N	t
5713	69	25	2	2014-02-17 07:39:41.085081	2014-02-17 09:16:31.614059	218	\N	t
5727	68	25	0	2014-02-17 07:39:41.158351	2014-02-17 09:18:06.427546	214	\N	t
5731	40	25	1	2014-02-17 07:39:41.178808	2014-02-17 09:18:13.688174	106	\N	t
5742	47	25	1	2014-02-17 07:39:41.235914	2014-02-17 09:20:31.353692	131	\N	t
5780	23	26	0	2014-02-17 07:39:41.459493	2014-02-17 07:39:41.459493	35	\N	f
5781	23	26	0	2014-02-17 07:39:41.461731	2014-02-17 07:39:41.461731	36	\N	f
5783	23	26	0	2014-02-17 07:39:41.466177	2014-02-17 07:39:41.466177	38	\N	f
5784	22	26	0	2014-02-17 07:39:41.470219	2014-02-17 07:39:41.470219	31	\N	f
5785	22	26	0	2014-02-17 07:39:41.472439	2014-02-17 07:39:41.472439	32	\N	f
5787	22	26	0	2014-02-17 07:39:41.476931	2014-02-17 07:39:41.476931	34	\N	f
5788	36	26	0	2014-02-17 07:39:41.480923	2014-02-17 07:39:41.480923	87	\N	f
5789	36	26	0	2014-02-17 07:39:41.483128	2014-02-17 07:39:41.483128	88	\N	f
5790	36	26	0	2014-02-17 07:39:41.485335	2014-02-17 07:39:41.485335	89	\N	f
5792	15	26	0	2014-02-17 07:39:41.491598	2014-02-17 07:39:41.491598	3	\N	f
5793	15	26	0	2014-02-17 07:39:41.493836	2014-02-17 07:39:41.493836	4	\N	f
5794	15	26	0	2014-02-17 07:39:41.496028	2014-02-17 07:39:41.496028	5	\N	f
5796	39	26	0	2014-02-17 07:39:41.502294	2014-02-17 07:39:41.502294	100	\N	f
5797	39	26	0	2014-02-17 07:39:41.50452	2014-02-17 07:39:41.50452	101	\N	f
5798	39	26	0	2014-02-17 07:39:41.507127	2014-02-17 07:39:41.507127	102	\N	f
5800	20	26	0	2014-02-17 07:39:41.514325	2014-02-17 07:39:41.514325	23	\N	f
5801	20	26	0	2014-02-17 07:39:41.51698	2014-02-17 07:39:41.51698	24	\N	f
5803	20	26	0	2014-02-17 07:39:41.522157	2014-02-17 07:39:41.522157	26	\N	f
5804	16	26	0	2014-02-17 07:39:41.526864	2014-02-17 07:39:41.526864	7	\N	f
5806	16	26	0	2014-02-17 07:39:41.532156	2014-02-17 07:39:41.532156	9	\N	f
5807	16	26	0	2014-02-17 07:39:41.534738	2014-02-17 07:39:41.534738	10	\N	f
5808	26	26	0	2014-02-17 07:39:41.539333	2014-02-17 07:39:41.539333	47	\N	f
5809	26	26	0	2014-02-17 07:39:41.541948	2014-02-17 07:39:41.541948	48	\N	f
5811	26	26	0	2014-02-17 07:39:41.547149	2014-02-17 07:39:41.547149	50	\N	f
5812	37	26	0	2014-02-17 07:39:41.551682	2014-02-17 07:39:41.551682	91	\N	f
5813	37	26	0	2014-02-17 07:39:41.554268	2014-02-17 07:39:41.554268	92	\N	f
5816	17	26	0	2014-02-17 07:39:41.563974	2014-02-17 07:39:41.563974	11	\N	f
5817	17	26	0	2014-02-17 07:39:41.566606	2014-02-17 07:39:41.566606	12	\N	f
5819	17	26	0	2014-02-17 07:39:41.571763	2014-02-17 07:39:41.571763	14	\N	f
5820	19	26	0	2014-02-17 07:39:41.576328	2014-02-17 07:39:41.576328	19	\N	f
5822	19	26	0	2014-02-17 07:39:41.581511	2014-02-17 07:39:41.581511	21	\N	f
5823	19	26	0	2014-02-17 07:39:41.584074	2014-02-17 07:39:41.584074	22	\N	f
5824	25	26	0	2014-02-17 07:39:41.588729	2014-02-17 07:39:41.588729	43	\N	f
5826	25	26	0	2014-02-17 07:39:41.593935	2014-02-17 07:39:41.593935	45	\N	f
5827	25	26	0	2014-02-17 07:39:41.596487	2014-02-17 07:39:41.596487	46	\N	f
5828	21	26	0	2014-02-17 07:39:41.601201	2014-02-17 07:39:41.601201	27	\N	f
5830	21	26	0	2014-02-17 07:39:41.606475	2014-02-17 07:39:41.606475	29	\N	f
5831	21	26	0	2014-02-17 07:39:41.60911	2014-02-17 07:39:41.60911	30	\N	f
5832	67	26	0	2014-02-17 07:39:41.613694	2014-02-17 07:39:41.613694	210	\N	f
5833	67	26	0	2014-02-17 07:39:41.616268	2014-02-17 07:39:41.616268	211	\N	f
5834	67	26	0	2014-02-17 07:39:41.618856	2014-02-17 07:39:41.618856	212	\N	f
5837	46	26	0	2014-02-17 07:39:41.62863	2014-02-17 07:39:41.62863	128	\N	f
5838	46	26	0	2014-02-17 07:39:41.631275	2014-02-17 07:39:41.631275	129	\N	f
5841	76	26	0	2014-02-17 07:39:41.641152	2014-02-17 07:39:41.641152	240	\N	f
5842	76	26	0	2014-02-17 07:39:41.64374	2014-02-17 07:39:41.64374	241	\N	f
5843	75	26	0	2014-02-17 07:39:41.648316	2014-02-17 07:39:41.648316	235	\N	f
5844	75	26	0	2014-02-17 07:39:41.650946	2014-02-17 07:39:41.650946	236	\N	f
5846	53	26	0	2014-02-17 07:39:41.658367	2014-02-17 07:39:41.658367	154	\N	f
5847	53	26	0	2014-02-17 07:39:41.661223	2014-02-17 07:39:41.661223	155	\N	f
5848	53	26	0	2014-02-17 07:39:41.715074	2014-02-17 07:39:41.715074	156	\N	f
5852	54	26	0	2014-02-17 07:39:41.734797	2014-02-17 07:39:41.734797	160	\N	f
5853	54	26	0	2014-02-17 07:39:41.739135	2014-02-17 07:39:41.739135	161	\N	f
5854	54	26	0	2014-02-17 07:39:41.743542	2014-02-17 07:39:41.743542	162	\N	f
5855	63	26	0	2014-02-17 07:39:41.750606	2014-02-17 07:39:41.750606	197	\N	f
5857	52	26	0	2014-02-17 07:39:41.762357	2014-02-17 07:39:41.762357	150	\N	f
5858	52	26	0	2014-02-17 07:39:41.766771	2014-02-17 07:39:41.766771	151	\N	f
5860	52	26	0	2014-02-17 07:39:41.775555	2014-02-17 07:39:41.775555	153	\N	f
5861	44	26	0	2014-02-17 07:39:41.782851	2014-02-17 07:39:41.782851	119	\N	f
5863	44	26	0	2014-02-17 07:39:41.791664	2014-02-17 07:39:41.791664	121	\N	f
5864	44	26	0	2014-02-17 07:39:41.796036	2014-02-17 07:39:41.796036	122	\N	f
5865	55	26	0	2014-02-17 07:39:41.80333	2014-02-17 07:39:41.80333	163	\N	f
5866	55	26	0	2014-02-17 07:39:41.807762	2014-02-17 07:39:41.807762	164	\N	f
5868	55	26	0	2014-02-17 07:39:41.816602	2014-02-17 07:39:41.816602	166	\N	f
5869	51	26	0	2014-02-17 07:39:41.823752	2014-02-17 07:39:41.823752	147	\N	f
5871	51	26	0	2014-02-17 07:39:41.832562	2014-02-17 07:39:41.832562	149	\N	f
5873	43	26	0	2014-02-17 07:39:41.844462	2014-02-17 07:39:41.844462	116	\N	f
5874	43	26	0	2014-02-17 07:39:41.849036	2014-02-17 07:39:41.849036	117	\N	f
5875	43	26	0	2014-02-17 07:39:41.853437	2014-02-17 07:39:41.853437	118	\N	f
5877	61	26	0	2014-02-17 07:39:41.86532	2014-02-17 07:39:41.86532	190	\N	f
5878	61	26	0	2014-02-17 07:39:41.869692	2014-02-17 07:39:41.869692	191	\N	f
5879	61	26	0	2014-02-17 07:39:41.874097	2014-02-17 07:39:41.874097	192	\N	f
5880	61	26	0	2014-02-17 07:39:41.878414	2014-02-17 07:39:41.878414	193	\N	f
5881	62	26	0	2014-02-17 07:39:41.885667	2014-02-17 07:39:41.885667	194	\N	f
5884	59	26	0	2014-02-17 07:39:41.901999	2014-02-17 07:39:41.901999	179	\N	f
5885	59	26	0	2014-02-17 07:39:41.906407	2014-02-17 07:39:41.906407	180	\N	f
5791	36	26	2	2014-02-17 07:39:41.487546	2014-02-17 09:07:02.359658	90	\N	t
5795	15	26	2	2014-02-17 07:39:41.498273	2014-02-17 09:07:21.477625	6	\N	t
5799	39	26	1	2014-02-17 07:39:41.509732	2014-02-17 09:07:42.486679	103	\N	t
5805	16	26	2	2014-02-17 07:39:41.529562	2014-02-17 09:09:25.862107	8	\N	t
5802	20	26	0	2014-02-17 07:39:41.519564	2014-02-17 09:09:01.437462	25	\N	f
5810	26	26	2	2014-02-17 07:39:41.54453	2014-02-17 09:10:12.303996	49	\N	t
5815	37	26	0	2014-02-17 07:39:41.559412	2014-02-17 09:11:10.307565	94	\N	t
5821	19	26	2	2014-02-17 07:39:41.578924	2014-02-17 09:14:19.477221	20	\N	t
5814	37	26	0	2014-02-17 07:39:41.556842	2014-02-17 08:56:44.369419	93	\N	f
5825	25	26	2	2014-02-17 07:39:41.591304	2014-02-17 09:14:53.328571	44	\N	t
5829	21	26	2	2014-02-17 07:39:41.603768	2014-02-17 09:15:06.903142	28	\N	t
5835	67	26	2	2014-02-17 07:39:41.621502	2014-02-17 09:15:41.686651	213	\N	t
5836	46	26	1	2014-02-17 07:39:41.62605	2014-02-17 09:16:40.080592	127	\N	t
5839	76	26	0	2014-02-17 07:39:41.635868	2014-02-17 09:18:08.936938	238	\N	t
5840	76	26	0	2014-02-17 07:39:41.638531	2014-02-17 08:56:44.537394	239	\N	f
5849	53	26	0	2014-02-17 07:39:41.718576	2014-02-17 09:20:54.391245	157	\N	t
5850	53	26	0	2014-02-17 07:39:41.722984	2014-02-17 08:56:44.589664	158	\N	f
5856	63	26	2	2014-02-17 07:39:41.755049	2014-02-17 09:21:21.350762	198	\N	t
5862	44	26	2	2014-02-17 07:39:41.787231	2014-02-17 09:22:01.429718	120	\N	t
5859	52	26	0	2014-02-17 07:39:41.771149	2014-02-17 09:21:43.536472	152	\N	f
5867	55	26	2	2014-02-17 07:39:41.812129	2014-02-17 09:22:27.254331	165	\N	t
5870	51	26	2	2014-02-17 07:39:41.82819	2014-02-17 09:22:32.800576	148	\N	t
5872	43	26	2	2014-02-17 07:39:41.840072	2014-02-17 09:22:39.32966	115	\N	t
5876	61	26	2	2014-02-17 07:39:41.860895	2014-02-17 09:23:11.491775	189	\N	t
5883	62	26	0	2014-02-17 07:39:41.89453	2014-02-17 09:23:44.899351	196	\N	t
5882	62	26	0	2014-02-17 07:39:41.890099	2014-02-17 08:56:44.860503	195	\N	f
5782	23	26	1	2014-02-17 07:39:41.463942	2014-02-17 09:05:00.534134	37	\N	t
5845	75	26	1	2014-02-17 07:39:41.653591	2014-02-17 09:20:31.217029	237	\N	t
5851	54	26	2	2014-02-17 07:39:41.730402	2014-02-17 09:21:08.962409	159	\N	t
5887	59	26	0	2014-02-17 07:39:41.915268	2014-02-17 07:39:41.915268	182	\N	f
5888	59	26	0	2014-02-17 07:39:41.91964	2014-02-17 07:39:41.91964	183	\N	f
5889	50	26	0	2014-02-17 07:39:41.926962	2014-02-17 07:39:41.926962	143	\N	f
5890	50	26	0	2014-02-17 07:39:41.931369	2014-02-17 07:39:41.931369	144	\N	f
5892	50	26	0	2014-02-17 07:39:41.940163	2014-02-17 07:39:41.940163	146	\N	f
5893	49	26	0	2014-02-17 07:39:41.947641	2014-02-17 07:39:41.947641	138	\N	f
5895	49	26	0	2014-02-17 07:39:41.956464	2014-02-17 07:39:41.956464	140	\N	f
5896	49	26	0	2014-02-17 07:39:41.960888	2014-02-17 07:39:41.960888	141	\N	f
5897	49	26	0	2014-02-17 07:39:41.965326	2014-02-17 07:39:41.965326	142	\N	f
5898	71	26	0	2014-02-17 07:39:41.972432	2014-02-17 07:39:41.972432	223	\N	f
5899	71	26	0	2014-02-17 07:39:41.977098	2014-02-17 07:39:41.977098	224	\N	f
5902	73	26	0	2014-02-17 07:39:41.993182	2014-02-17 07:39:41.993182	230	\N	f
5903	73	26	0	2014-02-17 07:39:41.997563	2014-02-17 07:39:41.997563	231	\N	f
5904	72	26	0	2014-02-17 07:39:42.004804	2014-02-17 07:39:42.004804	226	\N	f
5905	72	26	0	2014-02-17 07:39:42.009199	2014-02-17 07:39:42.009199	227	\N	f
5907	74	26	0	2014-02-17 07:39:42.020761	2014-02-17 07:39:42.020761	232	\N	f
5909	74	26	0	2014-02-17 07:39:42.029612	2014-02-17 07:39:42.029612	234	\N	f
5911	57	26	0	2014-02-17 07:39:42.041394	2014-02-17 07:39:42.041394	172	\N	f
5912	57	26	0	2014-02-17 07:39:42.045848	2014-02-17 07:39:42.045848	173	\N	f
5913	57	26	0	2014-02-17 07:39:42.05036	2014-02-17 07:39:42.05036	174	\N	f
5914	56	26	0	2014-02-17 07:39:42.057731	2014-02-17 07:39:42.057731	167	\N	f
5915	56	26	0	2014-02-17 07:39:42.06213	2014-02-17 07:39:42.06213	168	\N	f
5917	56	26	0	2014-02-17 07:39:42.0709	2014-02-17 07:39:42.0709	170	\N	f
5918	65	26	0	2014-02-17 07:39:42.078182	2014-02-17 07:39:42.078182	202	\N	f
5919	65	26	0	2014-02-17 07:39:42.082583	2014-02-17 07:39:42.082583	203	\N	f
5921	65	26	0	2014-02-17 07:39:42.091497	2014-02-17 07:39:42.091497	205	\N	f
5922	60	26	0	2014-02-17 07:39:42.098962	2014-02-17 07:39:42.098962	184	\N	f
5924	60	26	0	2014-02-17 07:39:42.107782	2014-02-17 07:39:42.107782	186	\N	f
5925	60	26	0	2014-02-17 07:39:42.112155	2014-02-17 07:39:42.112155	187	\N	f
5926	60	26	0	2014-02-17 07:39:42.116597	2014-02-17 07:39:42.116597	188	\N	f
5928	64	26	0	2014-02-17 07:39:42.12837	2014-02-17 07:39:42.12837	200	\N	f
5929	64	26	0	2014-02-17 07:39:42.132889	2014-02-17 07:39:42.132889	201	\N	f
5930	69	26	0	2014-02-17 07:39:42.140433	2014-02-17 07:39:42.140433	216	\N	f
5931	69	26	0	2014-02-17 07:39:42.200002	2014-02-17 07:39:42.200002	217	\N	f
5933	69	26	0	2014-02-17 07:39:42.203914	2014-02-17 07:39:42.203914	219	\N	f
5934	38	26	0	2014-02-17 07:39:42.207287	2014-02-17 07:39:42.207287	95	\N	f
5936	38	26	0	2014-02-17 07:39:42.211208	2014-02-17 07:39:42.211208	97	\N	f
5937	38	26	0	2014-02-17 07:39:42.213147	2014-02-17 07:39:42.213147	98	\N	f
5938	38	26	0	2014-02-17 07:39:42.215097	2014-02-17 07:39:42.215097	99	\N	f
5939	70	26	0	2014-02-17 07:39:42.218338	2014-02-17 07:39:42.218338	220	\N	f
5940	70	26	0	2014-02-17 07:39:42.220294	2014-02-17 07:39:42.220294	221	\N	f
5942	66	26	0	2014-02-17 07:39:42.225593	2014-02-17 07:39:42.225593	206	\N	f
5943	66	26	0	2014-02-17 07:39:42.227538	2014-02-17 07:39:42.227538	207	\N	f
5945	66	26	0	2014-02-17 07:39:42.231445	2014-02-17 07:39:42.231445	209	\N	f
5946	68	26	0	2014-02-17 07:39:42.234671	2014-02-17 07:39:42.234671	214	\N	f
5948	40	26	0	2014-02-17 07:39:42.239927	2014-02-17 07:39:42.239927	104	\N	f
5949	40	26	0	2014-02-17 07:39:42.241874	2014-02-17 07:39:42.241874	105	\N	f
5951	40	26	0	2014-02-17 07:39:42.246036	2014-02-17 07:39:42.246036	107	\N	f
5953	45	26	0	2014-02-17 07:39:42.252263	2014-02-17 07:39:42.252263	124	\N	f
5954	45	26	0	2014-02-17 07:39:42.2545	2014-02-17 07:39:42.2545	125	\N	f
5955	45	26	0	2014-02-17 07:39:42.256873	2014-02-17 07:39:42.256873	126	\N	f
5956	48	26	0	2014-02-17 07:39:42.260882	2014-02-17 07:39:42.260882	134	\N	f
5957	48	26	0	2014-02-17 07:39:42.26318	2014-02-17 07:39:42.26318	135	\N	f
5959	48	26	0	2014-02-17 07:39:42.267686	2014-02-17 07:39:42.267686	137	\N	f
5960	47	26	0	2014-02-17 07:39:42.271748	2014-02-17 07:39:42.271748	130	\N	f
5962	47	26	0	2014-02-17 07:39:42.276186	2014-02-17 07:39:42.276186	132	\N	f
5963	47	26	0	2014-02-17 07:39:42.27844	2014-02-17 07:39:42.27844	133	\N	f
5964	42	26	0	2014-02-17 07:39:42.2824	2014-02-17 07:39:42.2824	112	\N	f
5965	42	26	0	2014-02-17 07:39:42.284617	2014-02-17 07:39:42.284617	113	\N	f
5967	58	26	0	2014-02-17 07:39:42.291872	2014-02-17 07:39:42.291872	175	\N	f
5969	58	26	0	2014-02-17 07:39:42.297099	2014-02-17 07:39:42.297099	177	\N	f
5970	58	26	0	2014-02-17 07:39:42.299691	2014-02-17 07:39:42.299691	178	\N	f
5971	41	26	0	2014-02-17 07:39:42.304272	2014-02-17 07:39:42.304272	108	\N	f
5972	41	26	0	2014-02-17 07:39:42.30693	2014-02-17 07:39:42.30693	109	\N	f
5974	41	26	0	2014-02-17 07:39:42.312116	2014-02-17 07:39:42.312116	111	\N	f
5975	32	27	0	2014-02-17 07:39:42.329146	2014-02-17 07:39:42.329146	71	\N	f
5977	32	27	0	2014-02-17 07:39:42.334973	2014-02-17 07:39:42.334973	73	\N	f
5978	32	27	0	2014-02-17 07:39:42.337849	2014-02-17 07:39:42.337849	74	\N	f
5979	18	27	0	2014-02-17 07:39:42.342836	2014-02-17 07:39:42.342836	15	\N	f
5981	18	27	0	2014-02-17 07:39:42.348594	2014-02-17 07:39:42.348594	17	\N	f
5982	18	27	0	2014-02-17 07:39:42.351511	2014-02-17 07:39:42.351511	18	\N	f
5983	27	27	0	2014-02-17 07:39:42.356481	2014-02-17 07:39:42.356481	51	\N	f
5984	27	27	0	2014-02-17 07:39:42.359388	2014-02-17 07:39:42.359388	52	\N	f
5987	28	27	0	2014-02-17 07:39:42.370266	2014-02-17 07:39:42.370266	55	\N	f
5988	28	27	0	2014-02-17 07:39:42.373164	2014-02-17 07:39:42.373164	56	\N	f
5989	28	27	0	2014-02-17 07:39:42.376056	2014-02-17 07:39:42.376056	57	\N	f
5992	24	27	0	2014-02-17 07:39:42.386935	2014-02-17 07:39:42.386935	40	\N	f
5991	24	27	2	2014-02-17 07:39:42.384028	2014-02-17 08:58:30.849808	39	\N	t
5986	27	27	0	2014-02-17 07:39:42.365202	2014-02-17 08:56:38.275033	54	\N	f
5985	27	27	0	2014-02-17 07:39:42.362296	2014-02-17 09:20:05.301953	53	\N	t
5886	59	26	0	2014-02-17 07:39:41.910766	2014-02-17 08:56:44.886186	181	\N	f
5891	50	26	0	2014-02-17 07:39:41.935786	2014-02-17 08:56:44.914684	145	\N	f
5894	49	26	0	2014-02-17 07:39:41.952051	2014-02-17 08:56:44.934548	139	\N	f
5900	71	26	0	2014-02-17 07:39:41.981504	2014-02-17 08:56:44.971428	225	\N	f
5901	73	26	0	2014-02-17 07:39:41.988726	2014-02-17 08:56:44.985528	229	\N	f
5908	74	26	0	2014-02-17 07:39:42.025175	2014-02-17 08:56:45.039113	233	\N	f
5910	57	26	0	2014-02-17 07:39:42.03692	2014-02-17 08:56:45.056172	171	\N	f
5916	56	26	0	2014-02-17 07:39:42.066546	2014-02-17 08:56:45.136066	169	\N	f
5920	65	26	0	2014-02-17 07:39:42.086998	2014-02-17 08:56:45.147811	204	\N	f
5923	60	26	0	2014-02-17 07:39:42.10341	2014-02-17 08:56:45.165223	185	\N	f
5927	64	26	0	2014-02-17 07:39:42.123895	2014-02-17 08:56:45.186628	199	\N	f
5932	69	26	0	2014-02-17 07:39:42.201975	2014-02-17 08:56:45.214438	218	\N	f
5935	38	26	0	2014-02-17 07:39:42.209272	2014-02-17 08:56:45.233039	96	\N	f
5941	70	26	0	2014-02-17 07:39:42.222294	2014-02-17 08:56:45.259379	222	\N	f
5944	66	26	0	2014-02-17 07:39:42.229521	2014-02-17 08:56:45.274613	208	\N	f
5947	68	26	0	2014-02-17 07:39:42.236638	2014-02-17 08:56:45.291561	215	\N	f
5950	40	26	0	2014-02-17 07:39:42.243802	2014-02-17 08:56:45.308106	106	\N	f
5952	45	26	0	2014-02-17 07:39:42.250037	2014-02-17 08:56:45.321425	123	\N	f
5958	48	26	0	2014-02-17 07:39:42.265495	2014-02-17 08:56:45.351067	136	\N	f
5961	47	26	0	2014-02-17 07:39:42.273966	2014-02-17 08:56:45.366275	131	\N	f
5966	42	26	0	2014-02-17 07:39:42.287289	2014-02-17 08:56:45.389345	114	\N	f
5968	58	26	0	2014-02-17 07:39:42.294503	2014-02-17 08:56:45.404631	176	\N	f
5973	41	26	0	2014-02-17 07:39:42.309519	2014-02-17 08:56:45.431321	110	\N	f
5990	28	27	1	2014-02-17 07:39:42.379011	2014-02-17 09:20:19.348256	58	\N	t
5993	24	27	0	2014-02-17 07:39:42.389838	2014-02-17 07:39:42.389838	41	\N	f
5994	24	27	0	2014-02-17 07:39:42.392901	2014-02-17 07:39:42.392901	42	\N	f
5995	29	27	0	2014-02-17 07:39:42.397914	2014-02-17 07:39:42.397914	59	\N	f
5997	29	27	0	2014-02-17 07:39:42.403754	2014-02-17 07:39:42.403754	61	\N	f
6000	23	27	0	2014-02-17 07:39:42.41455	2014-02-17 07:39:42.41455	36	\N	f
6002	23	27	0	2014-02-17 07:39:42.420391	2014-02-17 07:39:42.420391	38	\N	f
6003	22	27	0	2014-02-17 07:39:42.425566	2014-02-17 07:39:42.425566	31	\N	f
6006	22	27	0	2014-02-17 07:39:42.483759	2014-02-17 07:39:42.483759	34	\N	f
6007	36	27	0	2014-02-17 07:39:42.48784	2014-02-17 07:39:42.48784	87	\N	f
6008	36	27	0	2014-02-17 07:39:42.490098	2014-02-17 07:39:42.490098	88	\N	f
6009	36	27	0	2014-02-17 07:39:42.492315	2014-02-17 07:39:42.492315	89	\N	f
6012	15	27	0	2014-02-17 07:39:42.500778	2014-02-17 07:39:42.500778	4	\N	f
6013	15	27	0	2014-02-17 07:39:42.50297	2014-02-17 07:39:42.50297	5	\N	f
6015	39	27	0	2014-02-17 07:39:42.509448	2014-02-17 07:39:42.509448	100	\N	f
6016	39	27	0	2014-02-17 07:39:42.51201	2014-02-17 07:39:42.51201	101	\N	f
6017	39	27	0	2014-02-17 07:39:42.514614	2014-02-17 07:39:42.514614	102	\N	f
6019	20	27	0	2014-02-17 07:39:42.521833	2014-02-17 07:39:42.521833	23	\N	f
6020	20	27	0	2014-02-17 07:39:42.524454	2014-02-17 07:39:42.524454	24	\N	f
6022	20	27	0	2014-02-17 07:39:42.529654	2014-02-17 07:39:42.529654	26	\N	f
6025	16	27	0	2014-02-17 07:39:42.539514	2014-02-17 07:39:42.539514	9	\N	f
6026	16	27	0	2014-02-17 07:39:42.542116	2014-02-17 07:39:42.542116	10	\N	f
6027	26	27	0	2014-02-17 07:39:42.546662	2014-02-17 07:39:42.546662	47	\N	f
6028	26	27	0	2014-02-17 07:39:42.549277	2014-02-17 07:39:42.549277	48	\N	f
6030	26	27	0	2014-02-17 07:39:42.554469	2014-02-17 07:39:42.554469	50	\N	f
6031	37	27	0	2014-02-17 07:39:42.559085	2014-02-17 07:39:42.559085	91	\N	f
6032	37	27	0	2014-02-17 07:39:42.561701	2014-02-17 07:39:42.561701	92	\N	f
6034	37	27	0	2014-02-17 07:39:42.566878	2014-02-17 07:39:42.566878	94	\N	f
6035	17	27	0	2014-02-17 07:39:42.571454	2014-02-17 07:39:42.571454	11	\N	f
6036	17	27	0	2014-02-17 07:39:42.574088	2014-02-17 07:39:42.574088	12	\N	f
6038	17	27	0	2014-02-17 07:39:42.579284	2014-02-17 07:39:42.579284	14	\N	f
6039	19	27	0	2014-02-17 07:39:42.583906	2014-02-17 07:39:42.583906	19	\N	f
6041	19	27	0	2014-02-17 07:39:42.589139	2014-02-17 07:39:42.589139	21	\N	f
6042	19	27	0	2014-02-17 07:39:42.591719	2014-02-17 07:39:42.591719	22	\N	f
6043	25	27	0	2014-02-17 07:39:42.596394	2014-02-17 07:39:42.596394	43	\N	f
6045	25	27	0	2014-02-17 07:39:42.601617	2014-02-17 07:39:42.601617	45	\N	f
6047	21	27	0	2014-02-17 07:39:42.608869	2014-02-17 07:39:42.608869	27	\N	f
6049	21	27	0	2014-02-17 07:39:42.614117	2014-02-17 07:39:42.614117	29	\N	f
6050	21	27	0	2014-02-17 07:39:42.616734	2014-02-17 07:39:42.616734	30	\N	f
6051	67	27	0	2014-02-17 07:39:42.621315	2014-02-17 07:39:42.621315	210	\N	f
6052	67	27	0	2014-02-17 07:39:42.623909	2014-02-17 07:39:42.623909	211	\N	f
6053	67	27	0	2014-02-17 07:39:42.62655	2014-02-17 07:39:42.62655	212	\N	f
6056	46	27	0	2014-02-17 07:39:42.636313	2014-02-17 07:39:42.636313	128	\N	f
6057	46	27	0	2014-02-17 07:39:42.638906	2014-02-17 07:39:42.638906	129	\N	f
6058	76	27	0	2014-02-17 07:39:42.643509	2014-02-17 07:39:42.643509	238	\N	f
6060	76	27	0	2014-02-17 07:39:42.648795	2014-02-17 07:39:42.648795	240	\N	f
6061	76	27	0	2014-02-17 07:39:42.651365	2014-02-17 07:39:42.651365	241	\N	f
6062	75	27	0	2014-02-17 07:39:42.655911	2014-02-17 07:39:42.655911	235	\N	f
6065	53	27	0	2014-02-17 07:39:42.666004	2014-02-17 07:39:42.666004	154	\N	f
6066	53	27	0	2014-02-17 07:39:42.668897	2014-02-17 07:39:42.668897	155	\N	f
6067	53	27	0	2014-02-17 07:39:42.671769	2014-02-17 07:39:42.671769	156	\N	f
6068	53	27	0	2014-02-17 07:39:42.674778	2014-02-17 07:39:42.674778	157	\N	f
6071	54	27	0	2014-02-17 07:39:42.68574	2014-02-17 07:39:42.68574	160	\N	f
6072	54	27	0	2014-02-17 07:39:42.688581	2014-02-17 07:39:42.688581	161	\N	f
6074	63	27	0	2014-02-17 07:39:42.696475	2014-02-17 07:39:42.696475	197	\N	f
6076	52	27	0	2014-02-17 07:39:42.704606	2014-02-17 07:39:42.704606	150	\N	f
6077	52	27	0	2014-02-17 07:39:42.707517	2014-02-17 07:39:42.707517	151	\N	f
6079	52	27	0	2014-02-17 07:39:42.7134	2014-02-17 07:39:42.7134	153	\N	f
6080	44	27	0	2014-02-17 07:39:42.718529	2014-02-17 07:39:42.718529	119	\N	f
6082	44	27	0	2014-02-17 07:39:42.776563	2014-02-17 07:39:42.776563	121	\N	f
6083	44	27	0	2014-02-17 07:39:42.778811	2014-02-17 07:39:42.778811	122	\N	f
6084	55	27	0	2014-02-17 07:39:42.782826	2014-02-17 07:39:42.782826	163	\N	f
6087	55	27	0	2014-02-17 07:39:42.789508	2014-02-17 07:39:42.789508	166	\N	f
6090	51	27	0	2014-02-17 07:39:42.797989	2014-02-17 07:39:42.797989	149	\N	f
6092	43	27	0	2014-02-17 07:39:42.804198	2014-02-17 07:39:42.804198	116	\N	f
6093	43	27	0	2014-02-17 07:39:42.806453	2014-02-17 07:39:42.806453	117	\N	f
6094	43	27	0	2014-02-17 07:39:42.808646	2014-02-17 07:39:42.808646	118	\N	f
6096	61	27	0	2014-02-17 07:39:42.814966	2014-02-17 07:39:42.814966	190	\N	f
6097	61	27	0	2014-02-17 07:39:42.817169	2014-02-17 07:39:42.817169	191	\N	f
6098	61	27	0	2014-02-17 07:39:42.819364	2014-02-17 07:39:42.819364	192	\N	f
6001	23	27	0	2014-02-17 07:39:42.4175	2014-02-17 08:56:38.356519	37	\N	f
6005	22	27	0	2014-02-17 07:39:42.48154	2014-02-17 08:56:38.376559	33	\N	f
6011	15	27	0	2014-02-17 07:39:42.498534	2014-02-17 09:22:23.26832	3	\N	t
6023	16	27	0	2014-02-17 07:39:42.534276	2014-02-17 09:22:59.083248	7	\N	f
6021	20	27	0	2014-02-17 07:39:42.527065	2014-02-17 09:22:52.003311	25	\N	f
6024	16	27	0	2014-02-17 07:39:42.536922	2014-02-17 08:56:38.489797	8	\N	f
6033	37	27	2	2014-02-17 07:39:42.564291	2014-02-17 09:05:24.634546	93	\N	t
6046	25	27	0	2014-02-17 07:39:42.604183	2014-02-17 09:05:55.857478	46	\N	t
6040	19	27	0	2014-02-17 07:39:42.586553	2014-02-17 08:56:38.581565	20	\N	f
6044	25	27	0	2014-02-17 07:39:42.599002	2014-02-17 08:56:38.601482	44	\N	f
6063	75	27	0	2014-02-17 07:39:42.658564	2014-02-17 09:08:46.680271	236	\N	t
6054	67	27	0	2014-02-17 07:39:42.629173	2014-02-17 09:06:27.147698	213	\N	f
6055	46	27	0	2014-02-17 07:39:42.633718	2014-02-17 08:56:38.666778	127	\N	f
6059	76	27	0	2014-02-17 07:39:42.646155	2014-02-17 08:56:38.684742	239	\N	f
6064	75	27	0	2014-02-17 07:39:42.661185	2014-02-17 08:56:38.713045	237	\N	f
6069	53	27	0	2014-02-17 07:39:42.677666	2014-02-17 08:56:38.738111	158	\N	f
6070	54	27	0	2014-02-17 07:39:42.68281	2014-02-17 08:56:38.750126	159	\N	f
6078	52	27	2	2014-02-17 07:39:42.710427	2014-02-17 09:09:37.754318	152	\N	t
6081	44	27	2	2014-02-17 07:39:42.721582	2014-02-17 09:09:53.462324	120	\N	t
6085	55	27	0	2014-02-17 07:39:42.785084	2014-02-17 09:10:03.182479	164	\N	t
6086	55	27	0	2014-02-17 07:39:42.787297	2014-02-17 08:56:38.829727	165	\N	f
6089	51	27	0	2014-02-17 07:39:42.795713	2014-02-17 08:56:38.848212	148	\N	f
6099	61	27	0	2014-02-17 07:39:42.82162	2014-02-17 09:10:59.881762	193	\N	t
6095	61	27	0	2014-02-17 07:39:42.812757	2014-02-17 08:56:38.884993	189	\N	f
6014	15	27	0	2014-02-17 07:39:42.505194	2014-02-17 09:21:26.643956	6	\N	f
6048	21	27	2	2014-02-17 07:39:42.61148	2014-02-17 09:06:06.326904	28	\N	t
6073	54	27	0	2014-02-17 07:39:42.691579	2014-02-17 09:09:03.541037	162	\N	t
6075	63	27	2	2014-02-17 07:39:42.699544	2014-02-17 09:09:19.785718	198	\N	t
6088	51	27	0	2014-02-17 07:39:42.793516	2014-02-17 09:10:17.111738	147	\N	t
6091	43	27	2	2014-02-17 07:39:42.801975	2014-02-17 09:10:24.619431	115	\N	t
5996	29	27	0	2014-02-17 07:39:42.400863	2014-02-17 09:20:48.527602	60	\N	t
5999	23	27	0	2014-02-17 07:39:42.411611	2014-02-17 09:21:02.800041	35	\N	t
6004	22	27	0	2014-02-17 07:39:42.428591	2014-02-17 09:21:13.673922	32	\N	t
6010	36	27	0	2014-02-17 07:39:42.494522	2014-02-17 09:21:18.794806	90	\N	f
6018	39	27	1	2014-02-17 07:39:42.517228	2014-02-17 09:22:38.315202	103	\N	t
6102	62	27	0	2014-02-17 07:39:42.83115	2014-02-17 07:39:42.83115	196	\N	f
6104	59	27	0	2014-02-17 07:39:42.838394	2014-02-17 07:39:42.838394	180	\N	f
6106	59	27	0	2014-02-17 07:39:42.843595	2014-02-17 07:39:42.843595	182	\N	f
6107	59	27	0	2014-02-17 07:39:42.84623	2014-02-17 07:39:42.84623	183	\N	f
6108	50	27	0	2014-02-17 07:39:42.850786	2014-02-17 07:39:42.850786	143	\N	f
6109	50	27	0	2014-02-17 07:39:42.85339	2014-02-17 07:39:42.85339	144	\N	f
6111	50	27	0	2014-02-17 07:39:42.858581	2014-02-17 07:39:42.858581	146	\N	f
6112	49	27	0	2014-02-17 07:39:42.863232	2014-02-17 07:39:42.863232	138	\N	f
6114	49	27	0	2014-02-17 07:39:42.868424	2014-02-17 07:39:42.868424	140	\N	f
6115	49	27	0	2014-02-17 07:39:42.871092	2014-02-17 07:39:42.871092	141	\N	f
6116	49	27	0	2014-02-17 07:39:42.873675	2014-02-17 07:39:42.873675	142	\N	f
6117	71	27	0	2014-02-17 07:39:42.8782	2014-02-17 07:39:42.8782	223	\N	f
6118	71	27	0	2014-02-17 07:39:42.880961	2014-02-17 07:39:42.880961	224	\N	f
6121	73	27	0	2014-02-17 07:39:42.890853	2014-02-17 07:39:42.890853	230	\N	f
6122	73	27	0	2014-02-17 07:39:42.893522	2014-02-17 07:39:42.893522	231	\N	f
6124	72	27	0	2014-02-17 07:39:42.90072	2014-02-17 07:39:42.90072	227	\N	f
6126	74	27	0	2014-02-17 07:39:42.907877	2014-02-17 07:39:42.907877	232	\N	f
6128	74	27	0	2014-02-17 07:39:42.913129	2014-02-17 07:39:42.913129	234	\N	f
6130	57	27	0	2014-02-17 07:39:42.920774	2014-02-17 07:39:42.920774	172	\N	f
6131	57	27	0	2014-02-17 07:39:42.923621	2014-02-17 07:39:42.923621	173	\N	f
6132	57	27	0	2014-02-17 07:39:42.926495	2014-02-17 07:39:42.926495	174	\N	f
6133	56	27	0	2014-02-17 07:39:42.931542	2014-02-17 07:39:42.931542	167	\N	f
6134	56	27	0	2014-02-17 07:39:42.934425	2014-02-17 07:39:42.934425	168	\N	f
6138	65	27	0	2014-02-17 07:39:42.948136	2014-02-17 07:39:42.948136	203	\N	f
6140	65	27	0	2014-02-17 07:39:42.953953	2014-02-17 07:39:42.953953	205	\N	f
6141	60	27	0	2014-02-17 07:39:42.959074	2014-02-17 07:39:42.959074	184	\N	f
6143	60	27	0	2014-02-17 07:39:42.964854	2014-02-17 07:39:42.964854	186	\N	f
6144	60	27	0	2014-02-17 07:39:42.967726	2014-02-17 07:39:42.967726	187	\N	f
6148	64	27	0	2014-02-17 07:39:42.981381	2014-02-17 07:39:42.981381	201	\N	f
6149	69	27	0	2014-02-17 07:39:42.986428	2014-02-17 07:39:42.986428	216	\N	f
6150	69	27	0	2014-02-17 07:39:42.989379	2014-02-17 07:39:42.989379	217	\N	f
6152	69	27	0	2014-02-17 07:39:42.995221	2014-02-17 07:39:42.995221	219	\N	f
6153	38	27	0	2014-02-17 07:39:43.000436	2014-02-17 07:39:43.000436	95	\N	f
6155	38	27	0	2014-02-17 07:39:43.006523	2014-02-17 07:39:43.006523	97	\N	f
6156	38	27	0	2014-02-17 07:39:43.064097	2014-02-17 07:39:43.064097	98	\N	f
6157	38	27	0	2014-02-17 07:39:43.068566	2014-02-17 07:39:43.068566	99	\N	f
6158	70	27	0	2014-02-17 07:39:43.073701	2014-02-17 07:39:43.073701	220	\N	f
6159	70	27	0	2014-02-17 07:39:43.075895	2014-02-17 07:39:43.075895	221	\N	f
6161	66	27	0	2014-02-17 07:39:43.086737	2014-02-17 07:39:43.086737	206	\N	f
6162	66	27	0	2014-02-17 07:39:43.091381	2014-02-17 07:39:43.091381	207	\N	f
6164	66	27	0	2014-02-17 07:39:43.10033	2014-02-17 07:39:43.10033	209	\N	f
6167	40	27	0	2014-02-17 07:39:43.11924	2014-02-17 07:39:43.11924	104	\N	f
6170	40	27	0	2014-02-17 07:39:43.133127	2014-02-17 07:39:43.133127	107	\N	f
6173	45	27	0	2014-02-17 07:39:43.149391	2014-02-17 07:39:43.149391	125	\N	f
6174	45	27	0	2014-02-17 07:39:43.153727	2014-02-17 07:39:43.153727	126	\N	f
6175	48	27	0	2014-02-17 07:39:43.161019	2014-02-17 07:39:43.161019	134	\N	f
6176	48	27	0	2014-02-17 07:39:43.165478	2014-02-17 07:39:43.165478	135	\N	f
6178	48	27	0	2014-02-17 07:39:43.174265	2014-02-17 07:39:43.174265	137	\N	f
6179	47	27	0	2014-02-17 07:39:43.181532	2014-02-17 07:39:43.181532	130	\N	f
6181	47	27	0	2014-02-17 07:39:43.19033	2014-02-17 07:39:43.19033	132	\N	f
6182	47	27	0	2014-02-17 07:39:43.194674	2014-02-17 07:39:43.194674	133	\N	f
6183	42	27	0	2014-02-17 07:39:43.20184	2014-02-17 07:39:43.20184	112	\N	f
6184	42	27	0	2014-02-17 07:39:43.206358	2014-02-17 07:39:43.206358	113	\N	f
6186	58	27	0	2014-02-17 07:39:43.218101	2014-02-17 07:39:43.218101	175	\N	f
6188	58	27	0	2014-02-17 07:39:43.226903	2014-02-17 07:39:43.226903	177	\N	f
6189	58	27	0	2014-02-17 07:39:43.231303	2014-02-17 07:39:43.231303	178	\N	f
6190	41	27	0	2014-02-17 07:39:43.238602	2014-02-17 07:39:43.238602	108	\N	f
6191	41	27	0	2014-02-17 07:39:43.24304	2014-02-17 07:39:43.24304	109	\N	f
6193	41	27	0	2014-02-17 07:39:43.251909	2014-02-17 07:39:43.251909	111	\N	f
6194	32	28	0	2014-02-17 07:39:43.280286	2014-02-17 07:39:43.280286	71	\N	f
6196	32	28	0	2014-02-17 07:39:43.289427	2014-02-17 07:39:43.289427	73	\N	f
6197	32	28	0	2014-02-17 07:39:43.293867	2014-02-17 07:39:43.293867	74	\N	f
6198	18	28	0	2014-02-17 07:39:43.301278	2014-02-17 07:39:43.301278	15	\N	f
6200	18	28	0	2014-02-17 07:39:43.310127	2014-02-17 07:39:43.310127	17	\N	f
6201	18	28	0	2014-02-17 07:39:43.314549	2014-02-17 07:39:43.314549	18	\N	f
6202	27	28	0	2014-02-17 07:39:43.321949	2014-02-17 07:39:43.321949	51	\N	f
6203	27	28	0	2014-02-17 07:39:43.326398	2014-02-17 07:39:43.326398	52	\N	f
6206	28	28	0	2014-02-17 07:39:43.34264	2014-02-17 07:39:43.34264	55	\N	f
6204	27	28	0	2014-02-17 07:39:43.330806	2014-02-17 07:42:52.094281	53	\N	t
6205	27	28	0	2014-02-17 07:39:43.335176	2014-02-17 07:42:08.814372	54	\N	f
6199	18	28	2	2014-02-17 07:39:43.305746	2014-02-17 07:42:39.417196	16	\N	t
6101	62	27	0	2014-02-17 07:39:42.828465	2014-02-17 08:56:38.91633	195	\N	f
6105	59	27	0	2014-02-17 07:39:42.84098	2014-02-17 08:56:38.968215	181	\N	f
6120	73	27	2	2014-02-17 07:39:42.888129	2014-02-17 09:14:55.008222	229	\N	t
6113	49	27	0	2014-02-17 07:39:42.865855	2014-02-17 08:56:39.015126	139	\N	f
6119	71	27	0	2014-02-17 07:39:42.883577	2014-02-17 08:56:39.041452	225	\N	f
6123	72	27	0	2014-02-17 07:39:42.89809	2014-02-17 09:15:07.910912	226	\N	t
6127	74	27	0	2014-02-17 07:39:42.910512	2014-02-17 08:56:39.08672	233	\N	f
6136	56	27	0	2014-02-17 07:39:42.940192	2014-02-17 09:15:31.169825	170	\N	t
6135	56	27	0	2014-02-17 07:39:42.93731	2014-02-17 08:56:39.13291	169	\N	f
6139	65	27	0	2014-02-17 07:39:42.95104	2014-02-17 08:56:39.151455	204	\N	f
6142	60	27	0	2014-02-17 07:39:42.961959	2014-02-17 08:56:39.173318	185	\N	f
6146	64	27	0	2014-02-17 07:39:42.975543	2014-02-17 08:56:39.193204	199	\N	f
6154	38	27	2	2014-02-17 07:39:43.003493	2014-02-17 09:17:33.267705	96	\N	t
6160	70	27	2	2014-02-17 07:39:43.079317	2014-02-17 09:17:56.642201	222	\N	t
6163	66	27	2	2014-02-17 07:39:43.095873	2014-02-17 09:18:17.269107	208	\N	t
6165	68	27	0	2014-02-17 07:39:43.107487	2014-02-17 09:18:30.160785	214	\N	t
6166	68	27	0	2014-02-17 07:39:43.111955	2014-02-17 08:56:39.298398	215	\N	f
6169	40	27	0	2014-02-17 07:39:43.128363	2014-02-17 08:56:39.314984	106	\N	f
6171	45	27	0	2014-02-17 07:39:43.140419	2014-02-17 08:56:39.328361	123	\N	f
6177	48	27	0	2014-02-17 07:39:43.169907	2014-02-17 08:56:39.357957	136	\N	f
6100	62	27	0	2014-02-17 07:39:42.825786	2014-02-17 09:11:28.645999	194	\N	t
6180	47	27	1	2014-02-17 07:39:43.185925	2014-02-17 09:01:46.136919	131	\N	t
6185	42	27	1	2014-02-17 07:39:43.210784	2014-02-17 09:01:39.29649	114	\N	t
6187	58	27	1	2014-02-17 07:39:43.222517	2014-02-17 09:01:26.458105	176	\N	t
6103	59	27	0	2014-02-17 07:39:42.835764	2014-02-17 09:12:02.133302	179	\N	t
6110	50	27	2	2014-02-17 07:39:42.855968	2014-02-17 09:12:26.909817	145	\N	t
6129	57	27	2	2014-02-17 07:39:42.917864	2014-02-17 09:15:18.923652	171	\N	t
6137	65	27	0	2014-02-17 07:39:42.945273	2014-02-17 09:16:06.549904	202	\N	t
6145	60	27	0	2014-02-17 07:39:42.970595	2014-02-17 09:16:32.845142	188	\N	t
6147	64	27	0	2014-02-17 07:39:42.978476	2014-02-17 09:16:53.688908	200	\N	t
6151	69	27	2	2014-02-17 07:39:42.992297	2014-02-17 09:17:12.625808	218	\N	t
6168	40	27	0	2014-02-17 07:39:43.123865	2014-02-17 09:18:38.674519	105	\N	t
6172	45	27	0	2014-02-17 07:39:43.144956	2014-02-17 09:19:18.017818	124	\N	t
6207	28	28	0	2014-02-17 07:39:43.347027	2014-02-17 07:39:43.347027	56	\N	f
6208	28	28	0	2014-02-17 07:39:43.35164	2014-02-17 07:39:43.35164	57	\N	f
6211	24	28	0	2014-02-17 07:39:43.369046	2014-02-17 07:39:43.369046	40	\N	f
6212	24	28	0	2014-02-17 07:39:43.373518	2014-02-17 07:39:43.373518	41	\N	f
6213	24	28	0	2014-02-17 07:39:43.377907	2014-02-17 07:39:43.377907	42	\N	f
6214	29	28	0	2014-02-17 07:39:43.385304	2014-02-17 07:39:43.385304	59	\N	f
6216	29	28	0	2014-02-17 07:39:43.394149	2014-02-17 07:39:43.394149	61	\N	f
6218	23	28	0	2014-02-17 07:39:43.406027	2014-02-17 07:39:43.406027	35	\N	f
6219	23	28	0	2014-02-17 07:39:43.410596	2014-02-17 07:39:43.410596	36	\N	f
6221	23	28	0	2014-02-17 07:39:43.476338	2014-02-17 07:39:43.476338	38	\N	f
6222	22	28	0	2014-02-17 07:39:43.480365	2014-02-17 07:39:43.480365	31	\N	f
6223	22	28	0	2014-02-17 07:39:43.482673	2014-02-17 07:39:43.482673	32	\N	f
6225	22	28	0	2014-02-17 07:39:43.487102	2014-02-17 07:39:43.487102	34	\N	f
6226	36	28	0	2014-02-17 07:39:43.491129	2014-02-17 07:39:43.491129	87	\N	f
6227	36	28	0	2014-02-17 07:39:43.493388	2014-02-17 07:39:43.493388	88	\N	f
6228	36	28	0	2014-02-17 07:39:43.495603	2014-02-17 07:39:43.495603	89	\N	f
6230	15	28	0	2014-02-17 07:39:43.501875	2014-02-17 07:39:43.501875	3	\N	f
6231	15	28	0	2014-02-17 07:39:43.504072	2014-02-17 07:39:43.504072	4	\N	f
6232	15	28	0	2014-02-17 07:39:43.506358	2014-02-17 07:39:43.506358	5	\N	f
6234	39	28	0	2014-02-17 07:39:43.512628	2014-02-17 07:39:43.512628	100	\N	f
6235	39	28	0	2014-02-17 07:39:43.514877	2014-02-17 07:39:43.514877	101	\N	f
6236	39	28	0	2014-02-17 07:39:43.517117	2014-02-17 07:39:43.517117	102	\N	f
6238	20	28	0	2014-02-17 07:39:43.523281	2014-02-17 07:39:43.523281	23	\N	f
6239	20	28	0	2014-02-17 07:39:43.525506	2014-02-17 07:39:43.525506	24	\N	f
6241	20	28	0	2014-02-17 07:39:43.52996	2014-02-17 07:39:43.52996	26	\N	f
6242	16	28	0	2014-02-17 07:39:43.53396	2014-02-17 07:39:43.53396	7	\N	f
6244	16	28	0	2014-02-17 07:39:43.538442	2014-02-17 07:39:43.538442	9	\N	f
6245	16	28	0	2014-02-17 07:39:43.540628	2014-02-17 07:39:43.540628	10	\N	f
6246	26	28	0	2014-02-17 07:39:43.544674	2014-02-17 07:39:43.544674	47	\N	f
6247	26	28	0	2014-02-17 07:39:43.546933	2014-02-17 07:39:43.546933	48	\N	f
6249	26	28	0	2014-02-17 07:39:43.551365	2014-02-17 07:39:43.551365	50	\N	f
6250	37	28	0	2014-02-17 07:39:43.555388	2014-02-17 07:39:43.555388	91	\N	f
6251	37	28	0	2014-02-17 07:39:43.55762	2014-02-17 07:39:43.55762	92	\N	f
6253	37	28	0	2014-02-17 07:39:43.562024	2014-02-17 07:39:43.562024	94	\N	f
6254	17	28	0	2014-02-17 07:39:43.566542	2014-02-17 07:39:43.566542	11	\N	f
6255	17	28	0	2014-02-17 07:39:43.569176	2014-02-17 07:39:43.569176	12	\N	f
6257	17	28	0	2014-02-17 07:39:43.574332	2014-02-17 07:39:43.574332	14	\N	f
6258	19	28	0	2014-02-17 07:39:43.578929	2014-02-17 07:39:43.578929	19	\N	f
6260	19	28	0	2014-02-17 07:39:43.584243	2014-02-17 07:39:43.584243	21	\N	f
6261	19	28	0	2014-02-17 07:39:43.586935	2014-02-17 07:39:43.586935	22	\N	f
6262	25	28	0	2014-02-17 07:39:43.591532	2014-02-17 07:39:43.591532	43	\N	f
6264	25	28	0	2014-02-17 07:39:43.596939	2014-02-17 07:39:43.596939	45	\N	f
6265	25	28	0	2014-02-17 07:39:43.599776	2014-02-17 07:39:43.599776	46	\N	f
6266	21	28	0	2014-02-17 07:39:43.604349	2014-02-17 07:39:43.604349	27	\N	f
6268	21	28	0	2014-02-17 07:39:43.609681	2014-02-17 07:39:43.609681	29	\N	f
6269	21	28	0	2014-02-17 07:39:43.61223	2014-02-17 07:39:43.61223	30	\N	f
6270	67	28	0	2014-02-17 07:39:43.616884	2014-02-17 07:39:43.616884	210	\N	f
6271	67	28	0	2014-02-17 07:39:43.619476	2014-02-17 07:39:43.619476	211	\N	f
6272	67	28	0	2014-02-17 07:39:43.622083	2014-02-17 07:39:43.622083	212	\N	f
6275	46	28	0	2014-02-17 07:39:43.631857	2014-02-17 07:39:43.631857	128	\N	f
6276	46	28	0	2014-02-17 07:39:43.634498	2014-02-17 07:39:43.634498	129	\N	f
6277	76	28	0	2014-02-17 07:39:43.639102	2014-02-17 07:39:43.639102	238	\N	f
6279	76	28	0	2014-02-17 07:39:43.644306	2014-02-17 07:39:43.644306	240	\N	f
6280	76	28	0	2014-02-17 07:39:43.646924	2014-02-17 07:39:43.646924	241	\N	f
6281	75	28	0	2014-02-17 07:39:43.651456	2014-02-17 07:39:43.651456	235	\N	f
6282	75	28	0	2014-02-17 07:39:43.654078	2014-02-17 07:39:43.654078	236	\N	f
6284	53	28	0	2014-02-17 07:39:43.661502	2014-02-17 07:39:43.661502	154	\N	f
6285	53	28	0	2014-02-17 07:39:43.664381	2014-02-17 07:39:43.664381	155	\N	f
6286	53	28	0	2014-02-17 07:39:43.667315	2014-02-17 07:39:43.667315	156	\N	f
6287	53	28	0	2014-02-17 07:39:43.670319	2014-02-17 07:39:43.670319	157	\N	f
6290	54	28	0	2014-02-17 07:39:43.735813	2014-02-17 07:39:43.735813	160	\N	f
6291	54	28	0	2014-02-17 07:39:43.738003	2014-02-17 07:39:43.738003	161	\N	f
6292	54	28	0	2014-02-17 07:39:43.740204	2014-02-17 07:39:43.740204	162	\N	f
6293	63	28	0	2014-02-17 07:39:43.744086	2014-02-17 07:39:43.744086	197	\N	f
6295	52	28	0	2014-02-17 07:39:43.750356	2014-02-17 07:39:43.750356	150	\N	f
6296	52	28	0	2014-02-17 07:39:43.752587	2014-02-17 07:39:43.752587	151	\N	f
6298	52	28	0	2014-02-17 07:39:43.757057	2014-02-17 07:39:43.757057	153	\N	f
6299	44	28	0	2014-02-17 07:39:43.76101	2014-02-17 07:39:43.76101	119	\N	f
6301	44	28	0	2014-02-17 07:39:43.765414	2014-02-17 07:39:43.765414	121	\N	f
6302	44	28	0	2014-02-17 07:39:43.767584	2014-02-17 07:39:43.767584	122	\N	f
6303	55	28	0	2014-02-17 07:39:43.771569	2014-02-17 07:39:43.771569	163	\N	f
6304	55	28	0	2014-02-17 07:39:43.773813	2014-02-17 07:39:43.773813	164	\N	f
6306	55	28	0	2014-02-17 07:39:43.7782	2014-02-17 07:39:43.7782	166	\N	f
6307	51	28	0	2014-02-17 07:39:43.782129	2014-02-17 07:39:43.782129	147	\N	f
6309	51	28	0	2014-02-17 07:39:43.786579	2014-02-17 07:39:43.786579	149	\N	f
6311	43	28	0	2014-02-17 07:39:43.792853	2014-02-17 07:39:43.792853	116	\N	f
6312	43	28	0	2014-02-17 07:39:43.79539	2014-02-17 07:39:43.79539	117	\N	f
6313	43	28	0	2014-02-17 07:39:43.798138	2014-02-17 07:39:43.798138	118	\N	f
6220	23	28	1	2014-02-17 07:39:43.41525	2014-02-17 07:43:40.411285	37	\N	t
6217	29	28	0	2014-02-17 07:39:43.39854	2014-02-17 07:42:08.877834	62	\N	f
6224	22	28	2	2014-02-17 07:39:43.484894	2014-02-17 07:43:51.994607	33	\N	t
6229	36	28	2	2014-02-17 07:39:43.497864	2014-02-17 07:44:14.503897	90	\N	t
6233	15	28	2	2014-02-17 07:39:43.508559	2014-02-17 07:44:43.43115	6	\N	t
6237	39	28	1	2014-02-17 07:39:43.519308	2014-02-17 07:45:08.718313	103	\N	t
6240	20	28	0	2014-02-17 07:39:43.527709	2014-02-17 07:42:09.014981	25	\N	f
6243	16	28	0	2014-02-17 07:39:43.536176	2014-02-17 07:42:09.031671	8	\N	f
6252	37	28	0	2014-02-17 07:39:43.559814	2014-02-17 07:42:09.076468	93	\N	f
6256	17	28	0	2014-02-17 07:39:43.571724	2014-02-17 07:42:09.101435	13	\N	f
6259	19	28	0	2014-02-17 07:39:43.581554	2014-02-17 07:42:09.123229	20	\N	f
6263	25	28	0	2014-02-17 07:39:43.594155	2014-02-17 07:42:09.143704	44	\N	f
6267	21	28	0	2014-02-17 07:39:43.607073	2014-02-17 07:42:09.168436	28	\N	f
6273	67	28	0	2014-02-17 07:39:43.624639	2014-02-17 07:42:09.199848	213	\N	f
6274	46	28	0	2014-02-17 07:39:43.629282	2014-02-17 07:42:09.208577	127	\N	f
6278	76	28	0	2014-02-17 07:39:43.641713	2014-02-17 07:42:09.226649	239	\N	f
6283	75	28	0	2014-02-17 07:39:43.656742	2014-02-17 07:42:09.254786	237	\N	f
6288	53	28	0	2014-02-17 07:39:43.673314	2014-02-17 07:42:09.279799	158	\N	f
6289	54	28	0	2014-02-17 07:39:43.733588	2014-02-17 07:42:09.291891	159	\N	f
6294	63	28	0	2014-02-17 07:39:43.746314	2014-02-17 07:42:09.313135	198	\N	f
6297	52	28	0	2014-02-17 07:39:43.754792	2014-02-17 07:42:09.331891	152	\N	f
6300	44	28	0	2014-02-17 07:39:43.763194	2014-02-17 07:42:09.348355	120	\N	f
6305	55	28	0	2014-02-17 07:39:43.775988	2014-02-17 07:42:09.371554	165	\N	f
6308	51	28	0	2014-02-17 07:39:43.784298	2014-02-17 07:42:09.39006	148	\N	f
6310	43	28	0	2014-02-17 07:39:43.790542	2014-02-17 07:42:09.403498	115	\N	f
6210	24	28	2	2014-02-17 07:39:43.363631	2014-02-17 07:43:03.989746	39	\N	t
6315	61	28	0	2014-02-17 07:39:43.805563	2014-02-17 07:39:43.805563	190	\N	f
6316	61	28	0	2014-02-17 07:39:43.808383	2014-02-17 07:39:43.808383	191	\N	f
6317	61	28	0	2014-02-17 07:39:43.811213	2014-02-17 07:39:43.811213	192	\N	f
6318	61	28	0	2014-02-17 07:39:43.814114	2014-02-17 07:39:43.814114	193	\N	f
6319	62	28	0	2014-02-17 07:39:43.81904	2014-02-17 07:39:43.81904	194	\N	f
6321	62	28	0	2014-02-17 07:39:43.824898	2014-02-17 07:39:43.824898	196	\N	f
6322	59	28	0	2014-02-17 07:39:43.829942	2014-02-17 07:39:43.829942	179	\N	f
6323	59	28	0	2014-02-17 07:39:43.83283	2014-02-17 07:39:43.83283	180	\N	f
6325	59	28	0	2014-02-17 07:39:43.838498	2014-02-17 07:39:43.838498	182	\N	f
6326	59	28	0	2014-02-17 07:39:43.841418	2014-02-17 07:39:43.841418	183	\N	f
6327	50	28	0	2014-02-17 07:39:43.846398	2014-02-17 07:39:43.846398	143	\N	f
6328	50	28	0	2014-02-17 07:39:43.849219	2014-02-17 07:39:43.849219	144	\N	f
6330	50	28	0	2014-02-17 07:39:43.855002	2014-02-17 07:39:43.855002	146	\N	f
6331	49	28	0	2014-02-17 07:39:43.860009	2014-02-17 07:39:43.860009	138	\N	f
6333	49	28	0	2014-02-17 07:39:43.865702	2014-02-17 07:39:43.865702	140	\N	f
6334	49	28	0	2014-02-17 07:39:43.868559	2014-02-17 07:39:43.868559	141	\N	f
6335	49	28	0	2014-02-17 07:39:43.871397	2014-02-17 07:39:43.871397	142	\N	f
6336	71	28	0	2014-02-17 07:39:43.876297	2014-02-17 07:39:43.876297	223	\N	f
6337	71	28	0	2014-02-17 07:39:43.87924	2014-02-17 07:39:43.87924	224	\N	f
6340	73	28	0	2014-02-17 07:39:43.889846	2014-02-17 07:39:43.889846	230	\N	f
6341	73	28	0	2014-02-17 07:39:43.892722	2014-02-17 07:39:43.892722	231	\N	f
6342	72	28	0	2014-02-17 07:39:43.897581	2014-02-17 07:39:43.897581	226	\N	f
6343	72	28	0	2014-02-17 07:39:43.900368	2014-02-17 07:39:43.900368	227	\N	f
6345	74	28	0	2014-02-17 07:39:43.908157	2014-02-17 07:39:43.908157	232	\N	f
6347	74	28	0	2014-02-17 07:39:43.913853	2014-02-17 07:39:43.913853	234	\N	f
6349	57	28	0	2014-02-17 07:39:43.921639	2014-02-17 07:39:43.921639	172	\N	f
6350	57	28	0	2014-02-17 07:39:43.924497	2014-02-17 07:39:43.924497	173	\N	f
6351	57	28	0	2014-02-17 07:39:43.927378	2014-02-17 07:39:43.927378	174	\N	f
6352	56	28	0	2014-02-17 07:39:43.932342	2014-02-17 07:39:43.932342	167	\N	f
6353	56	28	0	2014-02-17 07:39:43.935243	2014-02-17 07:39:43.935243	168	\N	f
6355	56	28	0	2014-02-17 07:39:43.940959	2014-02-17 07:39:43.940959	170	\N	f
6356	65	28	0	2014-02-17 07:39:43.945909	2014-02-17 07:39:43.945909	202	\N	f
6357	65	28	0	2014-02-17 07:39:43.948805	2014-02-17 07:39:43.948805	203	\N	f
6359	65	28	0	2014-02-17 07:39:43.956896	2014-02-17 07:39:43.956896	205	\N	f
6360	60	28	0	2014-02-17 07:39:43.964234	2014-02-17 07:39:43.964234	184	\N	f
6362	60	28	0	2014-02-17 07:39:43.973017	2014-02-17 07:39:43.973017	186	\N	f
6363	60	28	0	2014-02-17 07:39:43.977308	2014-02-17 07:39:43.977308	187	\N	f
6364	60	28	0	2014-02-17 07:39:43.9816	2014-02-17 07:39:43.9816	188	\N	f
6366	64	28	0	2014-02-17 07:39:43.99307	2014-02-17 07:39:43.99307	200	\N	f
6367	64	28	0	2014-02-17 07:39:43.997397	2014-02-17 07:39:43.997397	201	\N	f
6368	69	28	0	2014-02-17 07:39:44.00464	2014-02-17 07:39:44.00464	216	\N	f
6369	69	28	0	2014-02-17 07:39:44.009013	2014-02-17 07:39:44.009013	217	\N	f
6371	69	28	0	2014-02-17 07:39:44.017716	2014-02-17 07:39:44.017716	219	\N	f
6372	38	28	0	2014-02-17 07:39:44.025056	2014-02-17 07:39:44.025056	95	\N	f
6374	38	28	0	2014-02-17 07:39:44.033812	2014-02-17 07:39:44.033812	97	\N	f
6375	38	28	0	2014-02-17 07:39:44.038094	2014-02-17 07:39:44.038094	98	\N	f
6376	38	28	0	2014-02-17 07:39:44.042479	2014-02-17 07:39:44.042479	99	\N	f
6377	70	28	0	2014-02-17 07:39:44.049602	2014-02-17 07:39:44.049602	220	\N	f
6378	70	28	0	2014-02-17 07:39:44.053914	2014-02-17 07:39:44.053914	221	\N	f
6380	66	28	0	2014-02-17 07:39:44.065452	2014-02-17 07:39:44.065452	206	\N	f
6381	66	28	0	2014-02-17 07:39:44.069745	2014-02-17 07:39:44.069745	207	\N	f
6383	66	28	0	2014-02-17 07:39:44.078383	2014-02-17 07:39:44.078383	209	\N	f
6384	68	28	0	2014-02-17 07:39:44.085477	2014-02-17 07:39:44.085477	214	\N	f
6386	40	28	0	2014-02-17 07:39:44.096917	2014-02-17 07:39:44.096917	104	\N	f
6387	40	28	0	2014-02-17 07:39:44.101311	2014-02-17 07:39:44.101311	105	\N	f
6389	40	28	0	2014-02-17 07:39:44.109941	2014-02-17 07:39:44.109941	107	\N	f
6391	45	28	0	2014-02-17 07:39:44.121463	2014-02-17 07:39:44.121463	124	\N	f
6392	45	28	0	2014-02-17 07:39:44.12578	2014-02-17 07:39:44.12578	125	\N	f
6393	45	28	0	2014-02-17 07:39:44.130063	2014-02-17 07:39:44.130063	126	\N	f
6394	48	28	0	2014-02-17 07:39:44.137209	2014-02-17 07:39:44.137209	134	\N	f
6395	48	28	0	2014-02-17 07:39:44.141612	2014-02-17 07:39:44.141612	135	\N	f
6397	48	28	0	2014-02-17 07:39:44.150174	2014-02-17 07:39:44.150174	137	\N	f
6398	47	28	0	2014-02-17 07:39:44.157477	2014-02-17 07:39:44.157477	130	\N	f
6400	47	28	0	2014-02-17 07:39:44.16606	2014-02-17 07:39:44.16606	132	\N	f
6401	47	28	0	2014-02-17 07:39:44.170419	2014-02-17 07:39:44.170419	133	\N	f
6402	42	28	0	2014-02-17 07:39:44.177481	2014-02-17 07:39:44.177481	112	\N	f
6403	42	28	0	2014-02-17 07:39:44.181803	2014-02-17 07:39:44.181803	113	\N	f
6405	58	28	0	2014-02-17 07:39:44.193321	2014-02-17 07:39:44.193321	175	\N	f
6407	58	28	0	2014-02-17 07:39:44.202006	2014-02-17 07:39:44.202006	177	\N	f
6408	58	28	0	2014-02-17 07:39:44.206269	2014-02-17 07:39:44.206269	178	\N	f
6409	41	28	0	2014-02-17 07:39:44.213396	2014-02-17 07:39:44.213396	108	\N	f
6410	41	28	0	2014-02-17 07:39:44.217779	2014-02-17 07:39:44.217779	109	\N	f
6412	41	28	0	2014-02-17 07:39:44.226371	2014-02-17 07:39:44.226371	111	\N	f
6209	28	28	0	2014-02-17 07:39:43.356038	2014-02-17 07:42:08.834875	58	\N	f
6248	26	28	0	2014-02-17 07:39:43.549147	2014-02-17 07:42:09.054639	49	\N	f
6314	61	28	0	2014-02-17 07:39:43.802706	2014-02-17 07:42:09.426648	189	\N	f
6320	62	28	0	2014-02-17 07:39:43.821904	2014-02-17 07:42:09.458034	195	\N	f
6324	59	28	0	2014-02-17 07:39:43.835651	2014-02-17 07:42:09.476595	181	\N	f
6329	50	28	0	2014-02-17 07:39:43.852073	2014-02-17 07:42:09.504797	145	\N	f
6332	49	28	0	2014-02-17 07:39:43.862843	2014-02-17 07:42:09.523409	139	\N	f
6338	71	28	0	2014-02-17 07:39:43.882101	2014-02-17 07:42:09.549698	225	\N	f
6339	73	28	0	2014-02-17 07:39:43.886917	2014-02-17 07:42:09.55861	229	\N	f
6344	72	28	0	2014-02-17 07:39:43.903287	2014-02-17 07:42:09.579804	228	\N	f
6346	74	28	0	2014-02-17 07:39:43.911004	2014-02-17 07:42:09.595141	233	\N	f
6348	57	28	0	2014-02-17 07:39:43.918758	2014-02-17 07:42:09.61183	171	\N	f
6354	56	28	0	2014-02-17 07:39:43.938136	2014-02-17 07:42:09.641624	169	\N	f
6358	65	28	0	2014-02-17 07:39:43.952401	2014-02-17 07:42:09.660143	204	\N	f
6361	60	28	0	2014-02-17 07:39:43.968536	2014-02-17 07:42:09.764932	185	\N	f
6365	64	28	0	2014-02-17 07:39:43.98877	2014-02-17 07:42:09.802683	199	\N	f
6370	69	28	0	2014-02-17 07:39:44.013346	2014-02-17 07:42:09.83109	218	\N	f
6373	38	28	0	2014-02-17 07:39:44.029416	2014-02-17 07:42:09.848608	96	\N	f
6379	70	28	0	2014-02-17 07:39:44.058211	2014-02-17 07:42:09.875305	222	\N	f
6382	66	28	0	2014-02-17 07:39:44.074014	2014-02-17 07:42:09.89022	208	\N	f
6385	68	28	0	2014-02-17 07:39:44.089789	2014-02-17 07:42:09.906944	215	\N	f
6388	40	28	0	2014-02-17 07:39:44.105615	2014-02-17 07:42:09.923627	106	\N	f
6390	45	28	0	2014-02-17 07:39:44.11714	2014-02-17 07:42:09.936942	123	\N	f
6396	48	28	0	2014-02-17 07:39:44.145921	2014-02-17 07:42:09.96667	136	\N	f
6399	47	28	0	2014-02-17 07:39:44.16174	2014-02-17 07:42:09.981865	131	\N	f
6404	42	28	0	2014-02-17 07:39:44.186142	2014-02-17 07:42:10.005115	114	\N	f
6406	58	28	0	2014-02-17 07:39:44.197626	2014-02-17 07:42:10.020304	176	\N	f
6411	41	28	0	2014-02-17 07:39:44.222057	2014-02-17 07:42:10.046743	110	\N	f
6195	32	28	2	2014-02-17 07:39:43.284919	2014-02-17 07:42:26.112261	72	\N	t
6215	29	28	0	2014-02-17 07:39:43.389716	2014-02-17 07:43:29.634481	60	\N	t
4923	39	22	1	2014-02-17 07:39:37.044413	2014-02-17 09:01:51.006916	103	\N	t
3567	32	16	2	2014-02-17 07:39:30.233842	2014-02-17 08:55:29.583785	72	\N	t
6415	32	29	0	2014-02-17 08:56:15.864475	2014-02-17 08:56:15.864475	73	\N	f
6416	32	29	0	2014-02-17 08:56:15.872821	2014-02-17 08:56:15.872821	74	\N	f
6417	18	29	0	2014-02-17 08:56:15.884477	2014-02-17 08:56:15.884477	15	\N	f
6419	18	29	0	2014-02-17 08:56:15.90617	2014-02-17 08:56:15.90617	17	\N	f
6420	18	29	0	2014-02-17 08:56:15.914464	2014-02-17 08:56:15.914464	18	\N	f
6422	27	29	0	2014-02-17 08:56:15.981313	2014-02-17 08:56:15.981313	52	\N	f
6423	27	29	0	2014-02-17 08:56:16.03116	2014-02-17 08:56:16.03116	53	\N	f
6425	28	29	0	2014-02-17 08:56:16.050557	2014-02-17 08:56:16.050557	55	\N	f
6426	28	29	0	2014-02-17 08:56:16.064431	2014-02-17 08:56:16.064431	56	\N	f
6427	28	29	0	2014-02-17 08:56:16.072816	2014-02-17 08:56:16.072816	57	\N	f
6430	24	29	0	2014-02-17 08:56:16.106169	2014-02-17 08:56:16.106169	40	\N	f
6431	24	29	0	2014-02-17 08:56:16.11447	2014-02-17 08:56:16.11447	41	\N	f
6432	24	29	0	2014-02-17 08:56:16.122941	2014-02-17 08:56:16.122941	42	\N	f
6433	29	29	0	2014-02-17 08:56:16.134008	2014-02-17 08:56:16.134008	59	\N	f
6434	29	29	0	2014-02-17 08:56:16.147859	2014-02-17 08:56:16.147859	60	\N	f
6438	23	29	0	2014-02-17 08:56:16.189549	2014-02-17 08:56:16.189549	36	\N	f
6440	23	29	0	2014-02-17 08:56:16.206289	2014-02-17 08:56:16.206289	38	\N	f
6441	22	29	0	2014-02-17 08:56:16.217266	2014-02-17 08:56:16.217266	31	\N	f
6444	22	29	0	2014-02-17 08:56:16.247875	2014-02-17 08:56:16.247875	34	\N	f
6445	36	29	0	2014-02-17 08:56:16.258945	2014-02-17 08:56:16.258945	87	\N	f
6446	36	29	0	2014-02-17 08:56:16.27291	2014-02-17 08:56:16.27291	88	\N	f
6447	36	29	0	2014-02-17 08:56:16.281237	2014-02-17 08:56:16.281237	89	\N	f
6449	15	29	0	2014-02-17 08:56:16.300546	2014-02-17 08:56:16.300546	3	\N	f
6450	15	29	0	2014-02-17 08:56:16.314593	2014-02-17 08:56:16.314593	4	\N	f
6451	15	29	0	2014-02-17 08:56:16.322904	2014-02-17 08:56:16.322904	5	\N	f
6453	39	29	0	2014-02-17 08:56:16.342271	2014-02-17 08:56:16.342271	100	\N	f
6454	39	29	0	2014-02-17 08:56:16.356239	2014-02-17 08:56:16.356239	101	\N	f
6455	39	29	0	2014-02-17 08:56:16.364517	2014-02-17 08:56:16.364517	102	\N	f
6457	20	29	0	2014-02-17 08:56:16.38394	2014-02-17 08:56:16.38394	23	\N	f
6458	20	29	0	2014-02-17 08:56:16.397929	2014-02-17 08:56:16.397929	24	\N	f
6460	20	29	0	2014-02-17 08:56:16.431299	2014-02-17 08:56:16.431299	26	\N	f
6461	16	29	0	2014-02-17 08:56:16.442255	2014-02-17 08:56:16.442255	7	\N	f
6463	16	29	0	2014-02-17 08:56:16.46463	2014-02-17 08:56:16.46463	9	\N	f
6464	16	29	0	2014-02-17 08:56:16.47302	2014-02-17 08:56:16.47302	10	\N	f
6465	26	29	0	2014-02-17 08:56:16.48398	2014-02-17 08:56:16.48398	47	\N	f
6466	26	29	0	2014-02-17 08:56:16.497914	2014-02-17 08:56:16.497914	48	\N	f
6468	26	29	0	2014-02-17 08:56:16.514693	2014-02-17 08:56:16.514693	50	\N	f
6469	37	29	0	2014-02-17 08:56:16.52582	2014-02-17 08:56:16.52582	91	\N	f
6470	37	29	0	2014-02-17 08:56:16.53958	2014-02-17 08:56:16.53958	92	\N	f
6473	17	29	0	2014-02-17 08:56:16.567291	2014-02-17 08:56:16.567291	11	\N	f
6474	17	29	0	2014-02-17 08:56:16.581331	2014-02-17 08:56:16.581331	12	\N	f
6476	17	29	0	2014-02-17 08:56:16.598021	2014-02-17 08:56:16.598021	14	\N	f
6477	19	29	0	2014-02-17 08:56:16.60909	2014-02-17 08:56:16.60909	19	\N	f
6479	19	29	0	2014-02-17 08:56:16.631302	2014-02-17 08:56:16.631302	21	\N	f
6480	19	29	0	2014-02-17 08:56:16.639559	2014-02-17 08:56:16.639559	22	\N	f
6481	25	29	0	2014-02-17 08:56:16.650664	2014-02-17 08:56:16.650664	43	\N	f
6483	25	29	0	2014-02-17 08:56:16.673017	2014-02-17 08:56:16.673017	45	\N	f
6484	25	29	0	2014-02-17 08:56:16.681294	2014-02-17 08:56:16.681294	46	\N	f
6485	21	29	0	2014-02-17 08:56:16.692231	2014-02-17 08:56:16.692231	27	\N	f
6487	21	29	0	2014-02-17 08:56:16.714603	2014-02-17 08:56:16.714603	29	\N	f
6488	21	29	0	2014-02-17 08:56:16.722978	2014-02-17 08:56:16.722978	30	\N	f
6489	67	29	0	2014-02-17 08:56:16.733988	2014-02-17 08:56:16.733988	210	\N	f
6490	67	29	0	2014-02-17 08:56:16.747974	2014-02-17 08:56:16.747974	211	\N	f
6491	67	29	0	2014-02-17 08:56:16.756234	2014-02-17 08:56:16.756234	212	\N	f
6494	46	29	0	2014-02-17 08:56:16.789597	2014-02-17 08:56:16.789597	128	\N	f
6496	76	29	0	2014-02-17 08:56:16.809024	2014-02-17 08:56:16.809024	238	\N	f
6498	76	29	0	2014-02-17 08:56:16.831375	2014-02-17 08:56:16.831375	240	\N	f
6499	76	29	0	2014-02-17 08:56:16.839544	2014-02-17 08:56:16.839544	241	\N	f
6500	75	29	0	2014-02-17 08:56:16.850574	2014-02-17 08:56:16.850574	235	\N	f
6503	53	29	0	2014-02-17 08:56:16.884075	2014-02-17 08:56:16.884075	154	\N	f
6504	53	29	0	2014-02-17 08:56:16.898108	2014-02-17 08:56:16.898108	155	\N	f
6505	53	29	0	2014-02-17 08:56:16.906395	2014-02-17 08:56:16.906395	156	\N	f
6506	53	29	0	2014-02-17 08:56:16.914769	2014-02-17 08:56:16.914769	157	\N	f
6509	54	29	0	2014-02-17 08:56:16.948027	2014-02-17 08:56:16.948027	160	\N	f
6510	54	29	0	2014-02-17 08:56:16.956398	2014-02-17 08:56:16.956398	161	\N	f
6511	54	29	0	2014-02-17 08:56:16.964758	2014-02-17 08:56:16.964758	162	\N	f
6428	28	29	1	2014-02-17 08:56:16.081109	2014-02-17 08:59:15.704186	58	\N	t
6421	27	29	0	2014-02-17 08:56:15.925713	2014-02-17 08:58:16.713694	51	\N	t
6424	27	29	0	2014-02-17 08:56:16.03944	2014-02-17 08:56:42.709191	54	\N	f
6429	24	29	2	2014-02-17 08:56:16.092185	2014-02-17 08:59:21.782399	39	\N	t
6435	29	29	0	2014-02-17 08:56:16.156235	2014-02-17 09:00:04.770407	61	\N	t
6436	29	29	0	2014-02-17 08:56:16.164515	2014-02-17 08:56:42.770411	62	\N	f
6439	23	29	0	2014-02-17 08:56:16.197886	2014-02-17 08:56:42.790842	37	\N	f
6443	22	29	0	2014-02-17 08:56:16.239556	2014-02-17 08:56:42.810804	33	\N	f
6456	39	29	1	2014-02-17 08:56:16.372927	2014-02-17 09:03:23.407964	103	\N	t
6459	20	29	1	2014-02-17 08:56:16.414806	2014-02-17 09:03:57.149915	25	\N	t
6462	16	29	2	2014-02-17 08:56:16.456345	2014-02-17 09:04:11.738808	8	\N	t
6467	26	29	2	2014-02-17 08:56:16.50643	2014-02-17 09:04:28.316558	49	\N	t
6472	37	29	0	2014-02-17 08:56:16.556297	2014-02-17 09:04:46.070167	94	\N	t
6471	37	29	0	2014-02-17 08:56:16.547955	2014-02-17 08:56:42.968983	93	\N	f
6475	17	29	0	2014-02-17 08:56:16.589559	2014-02-17 08:56:42.994005	13	\N	f
6482	25	29	2	2014-02-17 08:56:16.664556	2014-02-17 09:05:22.614004	44	\N	t
6486	21	29	2	2014-02-17 08:56:16.706391	2014-02-17 09:05:35.675199	28	\N	t
6492	67	29	2	2014-02-17 08:56:16.764582	2014-02-17 09:05:48.787577	213	\N	t
6495	46	29	0	2014-02-17 08:56:16.797959	2014-02-17 09:06:05.620436	129	\N	t
6493	46	29	0	2014-02-17 08:56:16.775516	2014-02-17 08:56:43.101108	127	\N	f
3639	21	16	2	2014-02-17 07:39:30.47409	2014-02-17 09:06:53.195614	28	\N	t
6502	75	29	0	2014-02-17 08:56:16.872975	2014-02-17 08:56:43.147243	237	\N	f
6508	54	29	2	2014-02-17 08:56:16.934121	2014-02-17 09:09:55.685352	159	\N	t
3677	55	16	2	2014-02-17 07:39:30.602699	2014-02-17 09:12:00.311349	165	\N	t
6437	23	29	0	2014-02-17 08:56:16.175586	2014-02-17 09:02:10.105352	35	\N	t
6418	18	29	2	2014-02-17 08:56:15.897793	2014-02-17 08:57:41.444905	16	\N	t
6413	32	29	0	2014-02-17 08:56:15.834457	2014-02-17 08:58:27.481927	71	\N	f
3609	39	16	1	2014-02-17 07:39:30.372961	2014-02-17 09:02:29.303348	103	\N	t
6442	22	29	0	2014-02-17 08:56:16.231282	2014-02-17 09:02:31.519774	32	\N	t
6448	36	29	2	2014-02-17 08:56:16.289531	2014-02-17 09:02:57.339247	90	\N	t
6478	19	29	2	2014-02-17 08:56:16.623053	2014-02-17 09:05:12.983417	20	\N	t
6497	76	29	1	2014-02-17 08:56:16.823009	2014-02-17 09:06:27.387343	239	\N	t
6501	75	29	0	2014-02-17 08:56:16.864591	2014-02-17 09:08:37.353953	236	\N	t
6507	53	29	2	2014-02-17 08:56:16.923056	2014-02-17 09:09:46.835895	158	\N	t
5030	72	22	2	2014-02-17 07:39:37.57367	2014-02-17 09:17:05.51758	228	\N	t
3751	70	16	2	2014-02-17 07:39:30.961047	2014-02-17 09:20:55.558737	222	\N	t
5068	66	22	2	2014-02-17 07:39:37.767944	2014-02-17 09:22:13.513214	208	\N	t
6512	63	29	0	2014-02-17 08:56:16.975601	2014-02-17 08:56:16.975601	197	\N	f
6514	52	29	0	2014-02-17 08:56:17.000765	2014-02-17 08:56:17.000765	150	\N	f
6515	52	29	0	2014-02-17 08:56:17.014793	2014-02-17 08:56:17.014793	151	\N	f
6517	52	29	0	2014-02-17 08:56:17.031348	2014-02-17 08:56:17.031348	153	\N	f
6518	44	29	0	2014-02-17 08:56:17.042459	2014-02-17 08:56:17.042459	119	\N	f
6520	44	29	0	2014-02-17 08:56:17.064735	2014-02-17 08:56:17.064735	121	\N	f
6521	44	29	0	2014-02-17 08:56:17.073077	2014-02-17 08:56:17.073077	122	\N	f
6523	55	29	0	2014-02-17 08:56:17.166843	2014-02-17 08:56:17.166843	164	\N	f
6525	55	29	0	2014-02-17 08:56:17.206405	2014-02-17 08:56:17.206405	166	\N	f
6526	51	29	0	2014-02-17 08:56:17.217388	2014-02-17 08:56:17.217388	147	\N	f
6528	51	29	0	2014-02-17 08:56:17.239765	2014-02-17 08:56:17.239765	149	\N	f
6530	43	29	0	2014-02-17 08:56:17.264791	2014-02-17 08:56:17.264791	116	\N	f
6531	43	29	0	2014-02-17 08:56:17.273073	2014-02-17 08:56:17.273073	117	\N	f
6532	43	29	0	2014-02-17 08:56:17.281383	2014-02-17 08:56:17.281383	118	\N	f
6534	61	29	0	2014-02-17 08:56:17.306431	2014-02-17 08:56:17.306431	190	\N	f
6535	61	29	0	2014-02-17 08:56:17.314757	2014-02-17 08:56:17.314757	191	\N	f
6536	61	29	0	2014-02-17 08:56:17.323087	2014-02-17 08:56:17.323087	192	\N	f
6537	61	29	0	2014-02-17 08:56:17.331374	2014-02-17 08:56:17.331374	193	\N	f
6538	62	29	0	2014-02-17 08:56:17.342353	2014-02-17 08:56:17.342353	194	\N	f
6541	59	29	0	2014-02-17 08:56:17.375899	2014-02-17 08:56:17.375899	179	\N	f
6542	59	29	0	2014-02-17 08:56:17.389832	2014-02-17 08:56:17.389832	180	\N	f
6544	59	29	0	2014-02-17 08:56:17.406503	2014-02-17 08:56:17.406503	182	\N	f
6545	59	29	0	2014-02-17 08:56:17.41479	2014-02-17 08:56:17.41479	183	\N	f
6546	50	29	0	2014-02-17 08:56:17.426755	2014-02-17 08:56:17.426755	143	\N	f
6549	50	29	0	2014-02-17 08:56:17.456469	2014-02-17 08:56:17.456469	146	\N	f
6552	49	29	0	2014-02-17 08:56:17.523309	2014-02-17 08:56:17.523309	140	\N	f
6553	49	29	0	2014-02-17 08:56:17.531559	2014-02-17 08:56:17.531559	141	\N	f
6554	49	29	0	2014-02-17 08:56:17.540069	2014-02-17 08:56:17.540069	142	\N	f
6555	71	29	0	2014-02-17 08:56:17.552567	2014-02-17 08:56:17.552567	223	\N	f
6556	71	29	0	2014-02-17 08:56:17.565576	2014-02-17 08:56:17.565576	224	\N	f
6559	73	29	0	2014-02-17 08:56:17.615665	2014-02-17 08:56:17.615665	230	\N	f
6560	73	29	0	2014-02-17 08:56:17.632166	2014-02-17 08:56:17.632166	231	\N	f
6561	72	29	0	2014-02-17 08:56:17.652313	2014-02-17 08:56:17.652313	226	\N	f
6562	72	29	0	2014-02-17 08:56:17.665746	2014-02-17 08:56:17.665746	227	\N	f
6564	74	29	0	2014-02-17 08:56:17.702414	2014-02-17 08:56:17.702414	232	\N	f
6566	74	29	0	2014-02-17 08:56:17.732236	2014-02-17 08:56:17.732236	234	\N	f
6568	57	29	0	2014-02-17 08:56:17.765759	2014-02-17 08:56:17.765759	172	\N	f
6569	57	29	0	2014-02-17 08:56:17.781977	2014-02-17 08:56:17.781977	173	\N	f
6570	57	29	0	2014-02-17 08:56:17.798939	2014-02-17 08:56:17.798939	174	\N	f
6571	56	29	0	2014-02-17 08:56:17.819403	2014-02-17 08:56:17.819403	167	\N	f
6574	56	29	0	2014-02-17 08:56:17.865479	2014-02-17 08:56:17.865479	170	\N	f
6575	65	29	0	2014-02-17 08:56:17.885913	2014-02-17 08:56:17.885913	202	\N	f
6576	65	29	0	2014-02-17 08:56:17.899014	2014-02-17 08:56:17.899014	203	\N	f
6579	60	29	0	2014-02-17 08:56:17.952778	2014-02-17 08:56:17.952778	184	\N	f
6581	60	29	0	2014-02-17 08:56:17.982558	2014-02-17 08:56:17.982558	186	\N	f
6582	60	29	0	2014-02-17 08:56:17.999197	2014-02-17 08:56:17.999197	187	\N	f
6583	60	29	0	2014-02-17 08:56:18.015852	2014-02-17 08:56:18.015852	188	\N	f
6586	64	29	0	2014-02-17 08:56:18.065252	2014-02-17 08:56:18.065252	201	\N	f
6587	69	29	0	2014-02-17 08:56:18.085927	2014-02-17 08:56:18.085927	216	\N	f
6588	69	29	0	2014-02-17 08:56:18.099034	2014-02-17 08:56:18.099034	217	\N	f
6590	69	29	0	2014-02-17 08:56:18.131544	2014-02-17 08:56:18.131544	219	\N	f
6591	38	29	0	2014-02-17 08:56:18.152755	2014-02-17 08:56:18.152755	95	\N	f
6593	38	29	0	2014-02-17 08:56:18.182326	2014-02-17 08:56:18.182326	97	\N	f
6594	38	29	0	2014-02-17 08:56:18.198924	2014-02-17 08:56:18.198924	98	\N	f
6597	70	29	0	2014-02-17 08:56:18.248849	2014-02-17 08:56:18.248849	221	\N	f
6599	66	29	0	2014-02-17 08:56:18.285996	2014-02-17 08:56:18.285996	206	\N	f
6602	66	29	0	2014-02-17 08:56:18.332225	2014-02-17 08:56:18.332225	209	\N	f
6603	68	29	0	2014-02-17 08:56:18.352344	2014-02-17 08:56:18.352344	214	\N	f
6605	40	29	0	2014-02-17 08:56:18.386065	2014-02-17 08:56:18.386065	104	\N	f
6606	40	29	0	2014-02-17 08:56:18.399261	2014-02-17 08:56:18.399261	105	\N	f
6608	40	29	0	2014-02-17 08:56:18.431544	2014-02-17 08:56:18.431544	107	\N	f
6610	45	29	0	2014-02-17 08:56:18.457569	2014-02-17 08:56:18.457569	124	\N	f
6611	45	29	0	2014-02-17 08:56:18.474292	2014-02-17 08:56:18.474292	125	\N	f
6612	45	29	0	2014-02-17 08:56:18.490389	2014-02-17 08:56:18.490389	126	\N	f
6613	48	29	0	2014-02-17 08:56:18.51111	2014-02-17 08:56:18.51111	134	\N	f
6614	48	29	0	2014-02-17 08:56:18.524103	2014-02-17 08:56:18.524103	135	\N	f
6616	48	29	0	2014-02-17 08:56:18.55731	2014-02-17 08:56:18.55731	137	\N	f
6617	47	29	0	2014-02-17 08:56:18.57776	2014-02-17 08:56:18.57776	130	\N	f
6519	44	29	2	2014-02-17 08:56:17.056423	2014-02-17 09:11:38.386133	120	\N	t
6522	55	29	0	2014-02-17 08:56:17.084066	2014-02-17 09:12:39.333332	163	\N	t
6524	55	29	0	2014-02-17 08:56:17.198098	2014-02-17 08:56:43.264125	165	\N	f
6527	51	29	0	2014-02-17 08:56:17.231507	2014-02-17 08:56:43.282721	148	\N	f
6533	61	29	2	2014-02-17 08:56:17.292521	2014-02-17 09:13:28.40673	189	\N	t
6540	62	29	0	2014-02-17 08:56:17.364824	2014-02-17 09:14:53.396582	196	\N	t
6539	62	29	0	2014-02-17 08:56:17.356491	2014-02-17 08:56:43.350545	195	\N	f
6547	50	29	0	2014-02-17 08:56:17.439787	2014-02-17 09:15:59.265094	144	\N	t
6548	50	29	0	2014-02-17 08:56:17.448101	2014-02-17 08:56:43.397556	145	\N	f
6563	72	29	2	2014-02-17 08:56:17.682302	2014-02-17 09:17:55.466385	228	\N	t
6558	73	29	0	2014-02-17 08:56:17.602382	2014-02-17 09:16:56.557327	229	\N	f
6567	57	29	2	2014-02-17 08:56:17.752526	2014-02-17 09:18:18.108298	171	\N	t
6572	56	29	0	2014-02-17 08:56:17.831775	2014-02-17 09:20:59.958439	168	\N	t
6565	74	29	2	2014-02-17 08:56:17.715388	2014-02-17 09:19:37.908825	233	\N	t
6573	56	29	0	2014-02-17 08:56:17.848884	2014-02-17 08:56:43.533905	169	\N	f
6577	65	29	0	2014-02-17 08:56:17.915834	2014-02-17 08:56:43.552565	204	\N	f
6580	60	29	0	2014-02-17 08:56:17.965467	2014-02-17 08:56:43.574211	185	\N	f
6584	64	29	0	2014-02-17 08:56:18.035845	2014-02-17 08:56:43.594075	199	\N	f
6595	38	29	0	2014-02-17 08:56:18.21574	2014-02-17 09:22:35.338397	99	\N	t
6592	38	29	0	2014-02-17 08:56:18.165727	2014-02-17 08:56:43.640929	96	\N	f
6600	66	29	0	2014-02-17 08:56:18.298931	2014-02-17 09:23:51.460116	207	\N	t
6601	66	29	0	2014-02-17 08:56:18.315558	2014-02-17 08:56:43.682614	208	\N	f
6604	68	29	0	2014-02-17 08:56:18.365512	2014-02-17 08:56:43.699281	215	\N	f
6607	40	29	0	2014-02-17 08:56:18.415755	2014-02-17 08:56:43.715909	106	\N	f
6609	45	29	0	2014-02-17 08:56:18.444335	2014-02-17 08:56:43.729468	123	\N	f
6615	48	29	0	2014-02-17 08:56:18.540805	2014-02-17 08:56:43.758866	136	\N	f
6618	47	29	0	2014-02-17 08:56:18.590792	2014-02-17 08:56:43.774221	131	\N	f
6529	43	29	2	2014-02-17 08:56:17.250883	2014-02-17 09:12:51.126495	115	\N	t
6543	59	29	2	2014-02-17 08:56:17.398147	2014-02-17 09:15:17.106731	181	\N	t
6550	49	29	0	2014-02-17 08:56:17.501252	2014-02-17 09:16:26.584133	138	\N	t
6557	71	29	2	2014-02-17 08:56:17.582345	2014-02-17 09:16:44.600601	225	\N	t
6578	65	29	0	2014-02-17 08:56:17.932418	2014-02-17 09:21:24.226296	205	\N	t
6589	69	29	2	2014-02-17 08:56:18.115565	2014-02-17 09:22:11.363043	218	\N	t
6585	64	29	0	2014-02-17 08:56:18.049088	2014-02-17 09:21:59.911991	200	\N	f
6598	70	29	2	2014-02-17 08:56:18.265524	2014-02-17 09:23:08.075845	222	\N	t
6596	70	29	0	2014-02-17 08:56:18.235773	2014-02-17 09:23:08.059717	220	\N	f
6619	47	29	0	2014-02-17 08:56:18.60742	2014-02-17 08:56:18.60742	132	\N	f
6620	47	29	0	2014-02-17 08:56:18.623531	2014-02-17 08:56:18.623531	133	\N	f
6621	42	29	0	2014-02-17 08:56:18.644253	2014-02-17 08:56:18.644253	112	\N	f
6622	42	29	0	2014-02-17 08:56:18.657428	2014-02-17 08:56:18.657428	113	\N	f
6624	58	29	0	2014-02-17 08:56:18.694434	2014-02-17 08:56:18.694434	175	\N	f
6626	58	29	0	2014-02-17 08:56:18.72419	2014-02-17 08:56:18.72419	177	\N	f
6627	58	29	0	2014-02-17 08:56:18.740568	2014-02-17 08:56:18.740568	178	\N	f
6628	41	29	0	2014-02-17 08:56:18.761165	2014-02-17 08:56:18.761165	108	\N	f
6629	41	29	0	2014-02-17 08:56:18.774068	2014-02-17 08:56:18.774068	109	\N	f
6631	41	29	0	2014-02-17 08:56:18.807271	2014-02-17 08:56:18.807271	111	\N	f
5708	64	25	0	2014-02-17 07:39:41.065253	2014-02-17 08:56:37.783285	199	\N	f
5998	29	27	0	2014-02-17 07:39:42.406623	2014-02-17 08:56:38.336009	62	\N	f
6125	72	27	0	2014-02-17 07:39:42.903312	2014-02-17 08:56:39.070749	228	\N	f
5391	21	24	0	2014-02-17 07:39:39.452834	2014-02-17 08:56:40.118932	28	\N	f
6551	49	29	0	2014-02-17 08:56:17.515035	2014-02-17 08:56:43.415894	139	\N	f
6623	42	29	0	2014-02-17 08:56:18.674128	2014-02-17 08:56:43.797339	114	\N	f
6625	58	29	0	2014-02-17 08:56:18.707411	2014-02-17 08:56:43.812614	176	\N	f
6630	41	29	0	2014-02-17 08:56:18.790692	2014-02-17 08:56:43.839043	110	\N	f
5779	29	26	0	2014-02-17 07:39:41.455312	2014-02-17 08:56:44.174305	62	\N	f
5906	72	26	0	2014-02-17 07:39:42.013587	2014-02-17 08:56:45.018769	228	\N	f
4281	37	19	0	2014-02-17 07:39:33.78336	2014-02-17 08:56:45.89459	93	\N	f
4318	54	19	0	2014-02-17 07:39:34.010469	2014-02-17 08:56:46.110108	159	\N	f
4602	56	20	0	2014-02-17 07:39:35.466124	2014-02-17 08:56:49.55291	169	\N	f
4638	45	20	0	2014-02-17 07:39:35.652639	2014-02-17 08:56:49.872583	123	\N	f
4750	75	21	0	2014-02-17 07:39:36.266936	2014-02-17 08:56:51.116034	237	\N	f
4821	56	21	0	2014-02-17 07:39:36.630998	2014-02-17 08:56:51.502483	169	\N	f
3786	32	17	0	2014-02-17 07:39:31.155572	2014-02-17 08:56:56.475246	72	\N	f
3891	44	17	0	2014-02-17 07:39:31.708164	2014-02-17 08:56:57.059716	120	\N	f
5138	15	23	0	2014-02-17 07:39:38.18061	2014-02-17 08:56:58.388058	6	\N	f
5251	74	23	0	2014-02-17 07:39:38.667588	2014-02-17 08:56:59.015198	233	\N	f
4881	32	22	2	2014-02-17 07:39:36.915564	2014-02-17 08:57:14.787597	72	\N	t
5980	18	27	2	2014-02-17 07:39:42.345706	2014-02-17 08:57:16.099054	16	\N	t
4020	24	18	0	2014-02-17 07:39:32.421495	2014-02-17 09:04:36.615236	39	\N	f
3581	28	16	1	2014-02-17 07:39:30.279266	2014-02-17 08:57:18.382263	58	\N	t
5319	32	24	2	2014-02-17 07:39:39.082424	2014-02-17 08:57:26.217812	72	\N	t
5761	18	26	2	2014-02-17 07:39:41.407997	2014-02-17 08:57:44.064959	16	\N	t
5105	18	23	0	2014-02-17 07:39:38.012301	2014-02-17 08:57:45.061736	17	\N	t
3348	32	15	0	2014-02-17 07:39:29.190389	2014-02-17 08:57:52.641083	72	\N	f
5976	32	27	2	2014-02-17 07:39:42.332099	2014-02-17 08:57:54.324239	72	\N	t
4005	32	18	2	2014-02-17 07:39:32.308294	2014-02-17 08:57:55.239469	72	\N	t
4224	32	19	2	2014-02-17 07:39:33.49513	2014-02-17 08:57:56.153342	72	\N	t
5539	32	25	0	2014-02-17 07:39:40.166486	2014-02-17 08:57:58.489219	73	\N	f
5538	32	25	2	2014-02-17 07:39:40.1621	2014-02-17 08:57:58.538628	72	\N	t
5328	27	24	0	2014-02-17 07:39:39.127662	2014-02-17 08:58:20.40281	53	\N	t
6414	32	29	2	2014-02-17 08:56:15.8484	2014-02-17 08:58:27.526841	72	\N	t
4266	39	19	1	2014-02-17 07:39:33.706566	2014-02-17 08:59:40.788563	103	\N	t
4457	28	20	1	2014-02-17 07:39:34.682528	2014-02-17 08:59:48.540382	58	\N	t
3390	39	15	1	2014-02-17 07:39:29.393122	2014-02-17 09:00:25.515181	103	\N	t
4216	58	18	1	2014-02-17 07:39:33.433784	2014-02-17 09:01:02.36615	176	\N	t
5353	36	24	2	2014-02-17 07:39:39.254888	2014-02-17 09:01:05.612803	90	\N	t
5567	22	25	2	2014-02-17 07:39:40.310585	2014-02-17 09:01:07.307135	33	\N	t
4677	24	21	2	2014-02-17 07:39:35.87356	2014-02-17 09:01:08.853376	39	\N	t
4915	36	22	2	2014-02-17 07:39:37.019711	2014-02-17 09:01:11.109966	90	\N	t
6192	41	27	1	2014-02-17 07:39:43.247469	2014-02-17 09:01:15.569803	110	\N	t
4285	17	19	2	2014-02-17 07:39:33.803963	2014-02-17 09:01:21.699294	13	\N	t
5361	39	24	1	2014-02-17 07:39:39.296295	2014-02-17 09:01:39.807868	103	\N	t
5142	39	23	1	2014-02-17 07:39:38.20127	2014-02-17 09:02:16.213565	103	\N	t
4929	16	22	2	2014-02-17 07:39:37.065802	2014-02-17 09:02:28.874664	8	\N	t
3844	37	17	0	2014-02-17 07:39:31.437091	2014-02-17 09:02:45.385392	94	\N	t
3426	67	15	2	2014-02-17 07:39:29.568161	2014-02-17 09:03:12.820422	213	\N	t
6452	15	29	2	2014-02-17 08:56:16.33122	2014-02-17 09:03:13.008445	6	\N	t
5596	37	25	0	2014-02-17 07:39:40.491124	2014-02-17 09:03:13.074741	94	\N	t
3430	76	15	0	2014-02-17 07:39:29.590239	2014-02-17 09:03:44.913204	238	\N	t
5606	25	25	2	2014-02-17 07:39:40.543032	2014-02-17 09:03:47.872374	44	\N	t
3864	67	17	2	2014-02-17 07:39:31.569748	2014-02-17 09:04:37.028588	213	\N	t
4496	26	20	2	2014-02-17 07:39:34.881998	2014-02-17 09:04:49.974872	49	\N	t
4710	16	21	2	2014-02-17 07:39:36.042851	2014-02-17 09:04:50.080918	8	\N	t
4715	26	21	2	2014-02-17 07:39:36.110328	2014-02-17 09:05:16.595462	49	\N	t
5178	67	23	2	2014-02-17 07:39:38.385447	2014-02-17 09:07:48.189879	213	\N	t
4500	37	20	0	2014-02-17 07:39:34.90229	2014-02-17 09:05:30.392076	93	\N	f
6037	17	27	2	2014-02-17 07:39:42.576711	2014-02-17 09:05:33.408824	13	\N	t
4047	39	18	1	2014-02-17 07:39:32.555204	2014-02-17 09:08:14.377571	103	\N	t
5786	22	26	2	2014-02-17 07:39:41.47468	2014-02-17 09:06:28.093937	33	\N	t
3854	25	17	2	2014-02-17 07:39:31.487175	2014-02-17 09:08:59.550416	44	\N	t
3461	51	15	2	2014-02-17 07:39:29.740511	2014-02-17 09:07:02.590358	148	\N	t
3645	67	16	2	2014-02-17 07:39:30.493362	2014-02-17 09:07:11.260925	213	\N	t
4960	46	22	1	2014-02-17 07:39:37.216454	2014-02-17 09:07:20.145738	127	\N	t
6513	63	29	2	2014-02-17 08:56:16.989796	2014-02-17 09:10:11.695023	198	\N	t
6516	52	29	2	2014-02-17 08:56:17.023088	2014-02-17 09:10:22.42518	152	\N	t
4536	53	20	2	2014-02-17 07:39:35.087037	2014-02-17 09:10:28.956229	158	\N	t
5818	17	26	2	2014-02-17 07:39:41.569211	2014-02-17 09:11:21.194313	13	\N	t
4069	19	18	2	2014-02-17 07:39:32.667948	2014-02-17 09:11:23.635809	20	\N	t
4077	21	18	2	2014-02-17 07:39:32.7086	2014-02-17 09:12:26.36711	28	\N	t
4390	60	19	2	2014-02-17 07:39:34.274508	2014-02-17 09:13:18.178027	185	\N	t
5672	50	25	2	2014-02-17 07:39:40.882594	2014-02-17 09:13:21.005736	145	\N	t
5470	74	24	2	2014-02-17 07:39:39.770537	2014-02-17 09:15:02.641908	233	\N	t
4107	52	18	2	2014-02-17 07:39:32.861954	2014-02-17 09:16:59.02	152	\N	t
4428	47	19	1	2014-02-17 07:39:34.469667	2014-02-17 09:17:23.65309	131	\N	t
3371	23	15	0	2014-02-17 07:39:29.30266	2014-02-17 09:20:01.951706	35	\N	t
6029	26	27	2	2014-02-17 07:39:42.551878	2014-02-17 09:23:09.399591	49	\N	t
\.


--
-- Name: studentanswers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('studentanswers_id_seq', 6631, true);


--
-- Data for Name: studenttest_events; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY studenttest_events (id, state, studenttest_id, created_at, updated_at) FROM stdin;
1	started	28	2014-02-17 07:42:08.682916	2014-02-17 07:42:08.682916
2	closed	28	2014-02-17 07:45:12.454504	2014-02-17 07:45:12.454504
3	closed	28	2014-02-17 07:52:11.11006	2014-02-17 07:52:11.11006
4	closed	28	2014-02-17 07:56:07.516232	2014-02-17 07:56:07.516232
5	closed	28	2014-02-17 08:13:08.882076	2014-02-17 08:13:08.882076
6	closed	28	2014-02-17 08:15:28.775153	2014-02-17 08:15:28.775153
7	closed	28	2014-02-17 08:17:53.915551	2014-02-17 08:17:53.915551
8	closed	28	2014-02-17 08:18:10.889836	2014-02-17 08:18:10.889836
9	started	22	2014-02-17 08:53:10.934645	2014-02-17 08:53:10.934645
10	started	16	2014-02-17 08:53:19.08802	2014-02-17 08:53:19.08802
11	started	25	2014-02-17 08:56:36.762803	2014-02-17 08:56:36.762803
12	started	27	2014-02-17 08:56:38.165742	2014-02-17 08:56:38.165742
13	started	24	2014-02-17 08:56:39.522064	2014-02-17 08:56:39.522064
14	started	15	2014-02-17 08:56:41.126545	2014-02-17 08:56:41.126545
15	started	29	2014-02-17 08:56:42.597807	2014-02-17 08:56:42.597807
16	started	26	2014-02-17 08:56:43.982488	2014-02-17 08:56:43.982488
17	started	19	2014-02-17 08:56:45.530983	2014-02-17 08:56:45.530983
18	started	18	2014-02-17 08:56:46.980432	2014-02-17 08:56:46.980432
19	started	20	2014-02-17 08:56:48.383374	2014-02-17 08:56:48.383374
20	started	21	2014-02-17 08:56:50.522388	2014-02-17 08:56:50.522388
21	started	17	2014-02-17 08:56:56.328374	2014-02-17 08:56:56.328374
22	started	23	2014-02-17 08:56:58.105331	2014-02-17 08:56:58.105331
23	closed	15	2014-02-17 09:21:56.52103	2014-02-17 09:21:56.52103
24	closed	25	2014-02-17 09:22:08.963613	2014-02-17 09:22:08.963613
25	closed	24	2014-02-17 09:23:15.809176	2014-02-17 09:23:15.809176
26	closed	27	2014-02-17 09:23:18.202281	2014-02-17 09:23:18.202281
27	closed	19	2014-02-17 09:23:31.696937	2014-02-17 09:23:31.696937
28	closed	26	2014-02-17 09:23:47.230663	2014-02-17 09:23:47.230663
29	closed	20	2014-02-17 09:23:50.293555	2014-02-17 09:23:50.293555
30	closed	18	2014-02-17 09:23:52.681711	2014-02-17 09:23:52.681711
31	closed	29	2014-02-17 09:23:53.625061	2014-02-17 09:23:53.625061
32	closed	17	2014-02-17 09:23:59.827158	2014-02-17 09:23:59.827158
33	closed	22	2014-02-17 09:24:07.111809	2014-02-17 09:24:07.111809
34	closed	21	2014-02-17 09:24:19.488964	2014-02-17 09:24:19.488964
35	closed	16	2014-02-17 09:24:29.559719	2014-02-17 09:24:29.559719
36	closed	23	2014-02-17 09:24:45.139828	2014-02-17 09:24:45.139828
37	closed	23	2014-02-17 09:35:23.070673	2014-02-17 09:35:23.070673
38	closed	23	2014-02-17 09:35:43.913876	2014-02-17 09:35:43.913876
39	closed	23	2014-02-17 09:37:47.240725	2014-02-17 09:37:47.240725
40	closed	23	2014-02-17 09:38:31.819045	2014-02-17 09:38:31.819045
41	closed	23	2014-02-17 09:38:44.057184	2014-02-17 09:38:44.057184
42	closed	21	2014-02-17 09:40:09.787101	2014-02-17 09:40:09.787101
43	closed	23	2014-02-17 09:41:45.770059	2014-02-17 09:41:45.770059
44	closed	21	2014-02-17 09:44:16.444011	2014-02-17 09:44:16.444011
45	closed	21	2014-02-17 09:44:42.493401	2014-02-17 09:44:42.493401
46	closed	21	2014-02-17 09:46:46.018268	2014-02-17 09:46:46.018268
47	closed	21	2014-02-17 09:47:12.870728	2014-02-17 09:47:12.870728
48	closed	21	2014-02-17 09:47:54.20493	2014-02-17 09:47:54.20493
\.


--
-- Name: studenttest_events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('studenttest_events_id_seq', 48, true);


--
-- Data for Name: studenttests; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY studenttests (id, classtest_id, student_id, start, "end", points, created_at, updated_at) FROM stdin;
1	5	15	\N	\N	0	2014-02-15 10:33:06.547043	2014-02-15 10:33:06.547043
2	5	16	\N	\N	0	2014-02-15 10:33:07.595302	2014-02-15 10:33:07.595302
3	5	17	\N	\N	0	2014-02-15 10:33:08.88792	2014-02-15 10:33:08.88792
4	5	18	\N	\N	0	2014-02-15 10:33:09.738315	2014-02-15 10:33:09.738315
5	5	19	\N	\N	0	2014-02-15 10:33:10.914889	2014-02-15 10:33:10.914889
6	5	20	\N	\N	0	2014-02-15 10:33:12.231646	2014-02-15 10:33:12.231646
7	5	21	\N	\N	0	2014-02-15 10:33:13.298936	2014-02-15 10:33:13.298936
8	5	22	\N	\N	0	2014-02-15 10:33:14.488778	2014-02-15 10:33:14.488778
9	5	23	\N	\N	0	2014-02-15 10:33:15.736	2014-02-15 10:33:15.736
10	5	24	\N	\N	0	2014-02-15 10:33:16.730073	2014-02-15 10:33:16.730073
11	5	25	\N	\N	0	2014-02-15 10:33:17.880035	2014-02-15 10:33:17.880035
12	5	26	\N	\N	0	2014-02-15 10:33:19.022682	2014-02-15 10:33:19.022682
13	5	36	\N	\N	0	2014-02-15 10:33:20.118528	2014-02-15 10:33:20.118528
14	5	42	\N	\N	0	2014-02-15 10:33:21.360023	2014-02-15 10:33:21.360023
28	6	42	2014-02-17 07:42:08	2014-02-17 08:18:10	14	2014-02-17 07:39:43.256621	2014-02-17 08:18:10.967053
15	6	15	2014-02-17 08:56:41	2014-02-17 09:21:56	69	2014-02-17 07:39:29.061687	2014-02-17 09:21:56.543655
25	6	25	2014-02-17 08:56:36	2014-02-17 09:22:08	67	2014-02-17 07:39:40.133804	2014-02-17 09:22:09.007865
24	6	24	2014-02-17 08:56:39	2014-02-17 09:23:15	69	2014-02-17 07:39:39.054502	2014-02-17 09:23:15.861586
27	6	36	2014-02-17 08:56:38	2014-02-17 09:23:18	42	2014-02-17 07:39:42.314859	2014-02-17 09:23:18.250415
19	6	19	2014-02-17 08:56:45	2014-02-17 09:23:31	70	2014-02-17 07:39:33.4672	2014-02-17 09:23:31.717514
26	6	26	2014-02-17 08:56:43	2014-02-17 09:23:47	45	2014-02-17 07:39:41.306225	2014-02-17 09:23:47.250731
20	6	20	2014-02-17 08:56:48	2014-02-17 09:23:50	56	2014-02-17 07:39:34.539888	2014-02-17 09:23:50.342084
18	6	18	2014-02-17 08:56:46	2014-02-17 09:23:52	46	2014-02-17 07:39:32.279949	2014-02-17 09:23:52.727999
29	6	43	2014-02-17 08:56:42	2014-02-17 09:23:53	54	2014-02-17 08:56:15.767657	2014-02-17 09:23:53.683881
17	6	17	2014-02-17 08:56:56	2014-02-17 09:23:59	37	2014-02-17 07:39:31.129125	2014-02-17 09:23:59.875906
22	6	22	2014-02-17 08:53:10	2014-02-17 09:24:07	66	2014-02-17 07:39:36.89881	2014-02-17 09:24:07.161288
16	6	16	2014-02-17 08:53:19	2014-02-17 09:24:29	90	2014-02-17 07:39:30.216984	2014-02-17 09:24:29.611272
23	6	23	2014-02-17 08:56:58	2014-02-17 09:41:45	41	2014-02-17 07:39:37.959479	2014-02-17 09:41:45.873949
21	6	21	2014-02-17 08:56:50	2014-02-17 09:47:54	39	2014-02-17 07:39:35.768026	2014-02-17 09:47:54.254251
\.


--
-- Name: studenttests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('studenttests_id_seq', 29, true);


--
-- Data for Name: testtypes; Type: TABLE DATA; Schema: public; Owner: tb
--

COPY testtypes (id, coursetype, title, description, created_at, updated_at, test_avatar, create_questions) FROM stdin;
1	Skripting	Aufgaben zum Bash-Skripting	Aufgaben zum Bash-Skripting	2014-02-09 10:28:44.060046	2014-02-09 17:50:28.8853	\N	f
2	Linux	Linux: Allgemeine Fragen	Allgemeine Fragen um Linux, Unix, GPL	2014-02-15 10:31:44.786665	2014-02-17 07:29:40.209753	01_allgemein.txt	f
3	LinuxServer	Linux: Networking	Fragen zum Thema Protokolle und Networking	2014-02-19 21:13:34.013102	2014-02-19 21:13:34.013102	Linux_02_Netzwerk.txt	t
\.


--
-- Name: testtypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tb
--

SELECT pg_catalog.setval('testtypes_id_seq', 3, true);


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

ALTER TABLE ONLY classtest_events
    ADD CONSTRAINT test_events_pkey PRIMARY KEY (id);


--
-- Name: tests_pkey; Type: CONSTRAINT; Schema: public; Owner: tb; Tablespace: 
--

ALTER TABLE ONLY classtests
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

