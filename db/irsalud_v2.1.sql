--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2017-01-27 12:52:39

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE irsalud;
--
-- TOC entry 2015 (class 1262 OID 116958)
-- Name: irsalud; Type: DATABASE; Schema: -; Owner: irOwner
--

CREATE DATABASE irsalud WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Spain.1252' LC_CTYPE = 'Spanish_Spain.1252';


ALTER DATABASE irsalud OWNER TO "irOwner";

\connect irsalud

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 6 (class 2615 OID 116959)
-- Name: irsalud; Type: SCHEMA; Schema: -; Owner: irOwner
--

CREATE SCHEMA irsalud;


ALTER SCHEMA irsalud OWNER TO "irOwner";

--
-- TOC entry 7 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 2016 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 177 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2018 (class 0 OID 0)
-- Dependencies: 177
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = irsalud, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 176 (class 1259 OID 116989)
-- Name: agendaEventos; Type: TABLE; Schema: irsalud; Owner: irOwner; Tablespace: 
--

CREATE TABLE "agendaEventos" (
    id integer NOT NULL,
    info_evento text,
    id_usuario integer,
    start date,
    "end" date
);


ALTER TABLE "agendaEventos" OWNER TO "irOwner";

--
-- TOC entry 2019 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN "agendaEventos".id; Type: COMMENT; Schema: irsalud; Owner: irOwner
--

COMMENT ON COLUMN "agendaEventos".id IS 'id interno a la base';


--
-- TOC entry 2020 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN "agendaEventos".start; Type: COMMENT; Schema: irsalud; Owner: irOwner
--

COMMENT ON COLUMN "agendaEventos".start IS 'fecha inicio del evento';


--
-- TOC entry 2021 (class 0 OID 0)
-- Dependencies: 176
-- Name: COLUMN "agendaEventos"."end"; Type: COMMENT; Schema: irsalud; Owner: irOwner
--

COMMENT ON COLUMN "agendaEventos"."end" IS 'fecha fin del evento en formato YYYY-MM-DD';


--
-- TOC entry 175 (class 1259 OID 116987)
-- Name: agendaEventos_id_seq; Type: SEQUENCE; Schema: irsalud; Owner: irOwner
--

CREATE SEQUENCE "agendaEventos_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "agendaEventos_id_seq" OWNER TO "irOwner";

--
-- TOC entry 2022 (class 0 OID 0)
-- Dependencies: 175
-- Name: agendaEventos_id_seq; Type: SEQUENCE OWNED BY; Schema: irsalud; Owner: irOwner
--

ALTER SEQUENCE "agendaEventos_id_seq" OWNED BY "agendaEventos".id;


--
-- TOC entry 173 (class 1259 OID 116960)
-- Name: usuarios; Type: TABLE; Schema: irsalud; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
    id_usuario integer NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    username character varying(10),
    password text,
    imagen text DEFAULT 'data:image/png;base64,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'::text
);


ALTER TABLE usuarios OWNER TO postgres;

--
-- TOC entry 2023 (class 0 OID 0)
-- Dependencies: 173
-- Name: TABLE usuarios; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON TABLE usuarios IS 'usuarios del sistema';


--
-- TOC entry 2024 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN usuarios.id_usuario; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.id_usuario IS 'id principal del usuario';


--
-- TOC entry 2025 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN usuarios.nombre; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.nombre IS 'nombre del usuario';


--
-- TOC entry 2026 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN usuarios.apellido; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.apellido IS 'apellido del usuario';


--
-- TOC entry 2027 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN usuarios.username; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.username IS 'nombre de usuario para ingreso al sistema';


--
-- TOC entry 2028 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN usuarios.password; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.password IS 'contraseña del usuario';


--
-- TOC entry 2029 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN usuarios.imagen; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.imagen IS 'imagen base64 del usuario 512x512';


--
-- TOC entry 174 (class 1259 OID 116969)
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: irsalud; Owner: postgres
--

CREATE SEQUENCE usuarios_id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE usuarios_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 2030 (class 0 OID 0)
-- Dependencies: 174
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: irsalud; Owner: postgres
--

ALTER SEQUENCE usuarios_id_usuario_seq OWNED BY usuarios.id_usuario;


--
-- TOC entry 1892 (class 2604 OID 116992)
-- Name: id; Type: DEFAULT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY "agendaEventos" ALTER COLUMN id SET DEFAULT nextval('"agendaEventos_id_seq"'::regclass);


--
-- TOC entry 1891 (class 2604 OID 116971)
-- Name: id_usuario; Type: DEFAULT; Schema: irsalud; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 2010 (class 0 OID 116989)
-- Dependencies: 176
-- Data for Name: agendaEventos; Type: TABLE DATA; Schema: irsalud; Owner: irOwner
--

INSERT INTO "agendaEventos" (id, info_evento, id_usuario, start, "end") VALUES (7, '{"id":101,"color":"#7ae7bf","title":"Visitar a Jose","start":"2017-01-02T11:00:00","end":"2017-01-05T08:00:00","nombre":"Jose","apellido":"Perez","edad":"84","telefonoFijo":"03424537807","telefonoCelular":"0342155009810","direccion":"blas parera 425","descripcion":"paciente con ACV aputacion MII","nota":"es un departamento timbre 3","estado":"editado"}', 1, '2017-01-02', '2017-01-05');
INSERT INTO "agendaEventos" (id, info_evento, id_usuario, start, "end") VALUES (6, '{"id":100,"color":"#7ae7bf","title":"Visitar a Jose","start":"2017-01-07T11:00:00","end":"2017-01-10T08:00:00","nombre":"Jose","apellido":"Perez","edad":"84","telefonoFijo":"03424537807","telefonoCelular":"0342155009810","direccion":"blas parera 425","descripcion":"paciente con ACV aputacion MII","nota":"es un departamento timbre 3","estado":"editado"}', 1, '2017-01-07', '2017-01-10');
INSERT INTO "agendaEventos" (id, info_evento, id_usuario, start, "end") VALUES (10, '{"id":103,"color":"#7ae7bf","title":"Visitar a Jose","start":"2017-02-04T11:00:00","end":"2017-02-07T08:00:00","nombre":"Jose","apellido":"Perez","edad":"84","telefonoFijo":"03424537807","telefonoCelular":"0342155009810","direccion":"blas parera 425","descripcion":"paciente con ACV aputacion MII","nota":"es un departamento timbre 3","estado":"editado"}', 1, '2017-02-04', '2017-02-07');
INSERT INTO "agendaEventos" (id, info_evento, id_usuario, start, "end") VALUES (11, '{"id":102,"color":"#7ae7bf","title":"Visitar a Jose","start":"2016-12-06T11:00:00","end":"2016-12-22T08:00:00","nombre":"Jose","apellido":"Perez","edad":"84","telefonoFijo":"03424537807","telefonoCelular":"0342155009810","direccion":"blas parera 425","descripcion":"paciente con ACV aputacion MII","nota":"es un departamento timbre 3","estado":"editado"}', 1, '2016-12-06', '2016-12-22');


--
-- TOC entry 2031 (class 0 OID 0)
-- Dependencies: 175
-- Name: agendaEventos_id_seq; Type: SEQUENCE SET; Schema: irsalud; Owner: irOwner
--

SELECT pg_catalog.setval('"agendaEventos_id_seq"', 11, true);


--
-- TOC entry 2007 (class 0 OID 116960)
-- Dependencies: 173
-- Data for Name: usuarios; Type: TABLE DATA; Schema: irsalud; Owner: postgres
--

INSERT INTO usuarios (id_usuario, nombre, apellido, username, password, imagen) VALUES (1, 'Alejandra', 'Pacheco', 'alito', '1760a83811fa4632c5c9a11f593243ff', 'data:image/png;base64,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');


--
-- TOC entry 2032 (class 0 OID 0)
-- Dependencies: 174
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: irsalud; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_usuario_seq', 1, true);


--
-- TOC entry 1896 (class 2606 OID 116997)
-- Name: id_evento_pk; Type: CONSTRAINT; Schema: irsalud; Owner: irOwner; Tablespace: 
--

ALTER TABLE ONLY "agendaEventos"
    ADD CONSTRAINT id_evento_pk PRIMARY KEY (id);


--
-- TOC entry 1894 (class 2606 OID 116973)
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: irsalud; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 1897 (class 2606 OID 116998)
-- Name: id_usuario_fk; Type: FK CONSTRAINT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY "agendaEventos"
    ADD CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);


--
-- TOC entry 2017 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO "irOwner";
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-01-27 12:52:40

--
-- PostgreSQL database dump complete
--
