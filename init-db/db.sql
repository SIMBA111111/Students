--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: grade; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.grade (
    id integer NOT NULL,
    student_id integer,
    subject_id integer,
    grade integer,
    CONSTRAINT grade_grade_check CHECK (((grade > 0) AND (grade < 6)))
);


ALTER TABLE public.grade OWNER TO admin;

--
-- Name: grade_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.grade_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grade_id_seq OWNER TO admin;

--
-- Name: grade_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.grade_id_seq OWNED BY public.grade.id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.student (
    id integer NOT NULL,
    fio character varying
);


ALTER TABLE public.student OWNER TO admin;

--
-- Name: student_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.student_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.student_id_seq OWNER TO admin;

--
-- Name: student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.student_id_seq OWNED BY public.student.id;


--
-- Name: subject; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.subject (
    id integer NOT NULL,
    subject character varying
);


ALTER TABLE public.subject OWNER TO admin;

--
-- Name: subject_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.subject_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subject_id_seq OWNER TO admin;

--
-- Name: subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.subject_id_seq OWNED BY public.subject.id;


--
-- Name: grade id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grade ALTER COLUMN id SET DEFAULT nextval('public.grade_id_seq'::regclass);


--
-- Name: student id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.student ALTER COLUMN id SET DEFAULT nextval('public.student_id_seq'::regclass);


--
-- Name: subject id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.subject ALTER COLUMN id SET DEFAULT nextval('public.subject_id_seq'::regclass);


--
-- Data for Name: grade; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.grade (id, student_id, subject_id, grade) FROM stdin;
1	1	1	5
2	1	2	5
3	1	3	5
4	1	3	4
5	1	3	4
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.student (id, fio) FROM stdin;
1	Руднев Владислав Валерьевич
2	Воронин Николай Петрович
\.


--
-- Data for Name: subject; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.subject (id, subject) FROM stdin;
1	Литрбол
2	Алхимия
3	Рисование
4	Животноводство
\.


--
-- Name: grade_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.grade_id_seq', 1, false);


--
-- Name: student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.student_id_seq', 1, false);


--
-- Name: subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.subject_id_seq', 1, false);


--
-- Name: grade grade_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_pkey PRIMARY KEY (id);


--
-- Name: student student_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.student
    ADD CONSTRAINT student_pkey PRIMARY KEY (id);


--
-- Name: subject subject_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.subject
    ADD CONSTRAINT subject_pkey PRIMARY KEY (id);


--
-- Name: ix_grade_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_grade_id ON public.grade USING btree (id);


--
-- Name: ix_student_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_student_id ON public.student USING btree (id);


--
-- Name: ix_subject_id; Type: INDEX; Schema: public; Owner: admin
--

CREATE INDEX ix_subject_id ON public.subject USING btree (id);


--
-- Name: grade grade_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.student(id);


--
-- Name: grade grade_subject_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.grade
    ADD CONSTRAINT grade_subject_id_fkey FOREIGN KEY (subject_id) REFERENCES public.subject(id);


--
-- PostgreSQL database dump complete
--

