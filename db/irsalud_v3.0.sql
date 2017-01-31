--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.4
-- Dumped by pg_dump version 9.4.4
-- Started on 2017-01-31 13:27:18

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

DROP DATABASE irsalud;
--
-- TOC entry 2085 (class 1262 OID 117030)
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
-- TOC entry 6 (class 2615 OID 117031)
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
-- TOC entry 2086 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- TOC entry 189 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2088 (class 0 OID 0)
-- Dependencies: 189
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = irsalud, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 173 (class 1259 OID 117032)
-- Name: agendaEventos; Type: TABLE; Schema: irsalud; Owner: irOwner; Tablespace: 
--

CREATE TABLE "agendaEventos" (
    id integer NOT NULL,
    info_evento text,
    id_usuario integer,
    startevent date,
    endevent date
);


ALTER TABLE "agendaEventos" OWNER TO "irOwner";

--
-- TOC entry 2089 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN "agendaEventos".id; Type: COMMENT; Schema: irsalud; Owner: irOwner
--

COMMENT ON COLUMN "agendaEventos".id IS 'id interno a la base';


--
-- TOC entry 2090 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN "agendaEventos".startevent; Type: COMMENT; Schema: irsalud; Owner: irOwner
--

COMMENT ON COLUMN "agendaEventos".startevent IS 'fecha inicio del evento';


--
-- TOC entry 2091 (class 0 OID 0)
-- Dependencies: 173
-- Name: COLUMN "agendaEventos".endevent; Type: COMMENT; Schema: irsalud; Owner: irOwner
--

COMMENT ON COLUMN "agendaEventos".endevent IS 'fecha fin del evento en formato YYYY-MM-DD';


--
-- TOC entry 174 (class 1259 OID 117038)
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
-- TOC entry 2092 (class 0 OID 0)
-- Dependencies: 174
-- Name: agendaEventos_id_seq; Type: SEQUENCE OWNED BY; Schema: irsalud; Owner: irOwner
--

ALTER SEQUENCE "agendaEventos_id_seq" OWNED BY "agendaEventos".id;


--
-- TOC entry 179 (class 1259 OID 117072)
-- Name: familiarcontacto; Type: TABLE; Schema: irsalud; Owner: irOwner; Tablespace: 
--

CREATE TABLE familiarcontacto (
    nombre character varying(100),
    apellido character varying(100),
    "telefonoP" character varying(20),
    "telefonoS" character varying(20),
    documento character varying(10),
    id_parentesco integer,
    id_familiarcontacto integer NOT NULL
);


ALTER TABLE familiarcontacto OWNER TO "irOwner";

--
-- TOC entry 184 (class 1259 OID 117100)
-- Name: familiarcontacto_id_familiarcontacto_seq; Type: SEQUENCE; Schema: irsalud; Owner: irOwner
--

CREATE SEQUENCE familiarcontacto_id_familiarcontacto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE familiarcontacto_id_familiarcontacto_seq OWNER TO "irOwner";

--
-- TOC entry 2093 (class 0 OID 0)
-- Dependencies: 184
-- Name: familiarcontacto_id_familiarcontacto_seq; Type: SEQUENCE OWNED BY; Schema: irsalud; Owner: irOwner
--

ALTER SEQUENCE familiarcontacto_id_familiarcontacto_seq OWNED BY familiarcontacto.id_familiarcontacto;


--
-- TOC entry 181 (class 1259 OID 117081)
-- Name: obrasocial; Type: TABLE; Schema: irsalud; Owner: irOwner; Tablespace: 
--

CREATE TABLE obrasocial (
    id_obra_social integer NOT NULL,
    nombre_corto character varying(100),
    "telefonoP" character varying(30),
    "telefonoS" character varying(30),
    nombre_largo character varying(100),
    direccion character varying(100)
);


ALTER TABLE obrasocial OWNER TO "irOwner";

--
-- TOC entry 180 (class 1259 OID 117079)
-- Name: obrasocial_id_obra_social_seq; Type: SEQUENCE; Schema: irsalud; Owner: irOwner
--

CREATE SEQUENCE obrasocial_id_obra_social_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE obrasocial_id_obra_social_seq OWNER TO "irOwner";

--
-- TOC entry 2094 (class 0 OID 0)
-- Dependencies: 180
-- Name: obrasocial_id_obra_social_seq; Type: SEQUENCE OWNED BY; Schema: irsalud; Owner: irOwner
--

ALTER SEQUENCE obrasocial_id_obra_social_seq OWNED BY obrasocial.id_obra_social;


--
-- TOC entry 177 (class 1259 OID 117063)
-- Name: pacientes; Type: TABLE; Schema: irsalud; Owner: irOwner; Tablespace: 
--

CREATE TABLE pacientes (
    nombre character varying(100),
    apellido character varying(100),
    id_paciente integer NOT NULL,
    documento character varying(10),
    domicilio character varying(200),
    "telefonoP" character varying(20),
    "telefonoS" character varying(20),
    numeroafiliado character varying(30),
    id_familiarcontacto integer,
    iniciotratamiento date,
    id_obrasocial integer
);


ALTER TABLE pacientes OWNER TO "irOwner";

--
-- TOC entry 2095 (class 0 OID 0)
-- Dependencies: 177
-- Name: COLUMN pacientes.id_paciente; Type: COMMENT; Schema: irsalud; Owner: irOwner
--

COMMENT ON COLUMN pacientes.id_paciente IS 'id principal del paciente interno a la base';


--
-- TOC entry 178 (class 1259 OID 117066)
-- Name: pacientes_id_seq; Type: SEQUENCE; Schema: irsalud; Owner: irOwner
--

CREATE SEQUENCE pacientes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pacientes_id_seq OWNER TO "irOwner";

--
-- TOC entry 2096 (class 0 OID 0)
-- Dependencies: 178
-- Name: pacientes_id_seq; Type: SEQUENCE OWNED BY; Schema: irsalud; Owner: irOwner
--

ALTER SEQUENCE pacientes_id_seq OWNED BY pacientes.id_paciente;


--
-- TOC entry 183 (class 1259 OID 117094)
-- Name: parentesco; Type: TABLE; Schema: irsalud; Owner: irOwner; Tablespace: 
--

CREATE TABLE parentesco (
    id_parentesco integer NOT NULL,
    tipoparentesco character varying(50)
);


ALTER TABLE parentesco OWNER TO "irOwner";

--
-- TOC entry 182 (class 1259 OID 117092)
-- Name: parentesco_id_parentesco_seq; Type: SEQUENCE; Schema: irsalud; Owner: irOwner
--

CREATE SEQUENCE parentesco_id_parentesco_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE parentesco_id_parentesco_seq OWNER TO "irOwner";

--
-- TOC entry 2097 (class 0 OID 0)
-- Dependencies: 182
-- Name: parentesco_id_parentesco_seq; Type: SEQUENCE OWNED BY; Schema: irsalud; Owner: irOwner
--

ALTER SEQUENCE parentesco_id_parentesco_seq OWNED BY parentesco.id_parentesco;


--
-- TOC entry 187 (class 1259 OID 117118)
-- Name: profesion; Type: TABLE; Schema: irsalud; Owner: irOwner; Tablespace: 
--

CREATE TABLE profesion (
    id_profesion integer NOT NULL,
    nombre character varying(100)
);


ALTER TABLE profesion OWNER TO "irOwner";

--
-- TOC entry 2098 (class 0 OID 0)
-- Dependencies: 187
-- Name: TABLE profesion; Type: COMMENT; Schema: irsalud; Owner: irOwner
--

COMMENT ON TABLE profesion IS 'listado de profesiones';


--
-- TOC entry 186 (class 1259 OID 117116)
-- Name: profesion_id_profesion_seq; Type: SEQUENCE; Schema: irsalud; Owner: irOwner
--

CREATE SEQUENCE profesion_id_profesion_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profesion_id_profesion_seq OWNER TO "irOwner";

--
-- TOC entry 2099 (class 0 OID 0)
-- Dependencies: 186
-- Name: profesion_id_profesion_seq; Type: SEQUENCE OWNED BY; Schema: irsalud; Owner: irOwner
--

ALTER SEQUENCE profesion_id_profesion_seq OWNED BY profesion.id_profesion;


--
-- TOC entry 185 (class 1259 OID 117113)
-- Name: profesionales; Type: TABLE; Schema: irsalud; Owner: irOwner; Tablespace: 
--

CREATE TABLE profesionales (
    id_profesional integer NOT NULL,
    nombre character varying(100),
    apellido character varying(100),
    documento character varying(10),
    matricula character varying(30),
    "telefonoP" character varying(30),
    "telefonoS" character varying(30),
    imagen text,
    id_profesion integer
);


ALTER TABLE profesionales OWNER TO "irOwner";

--
-- TOC entry 2100 (class 0 OID 0)
-- Dependencies: 185
-- Name: TABLE profesionales; Type: COMMENT; Schema: irsalud; Owner: irOwner
--

COMMENT ON TABLE profesionales IS 'listado de profesionales';


--
-- TOC entry 188 (class 1259 OID 117125)
-- Name: profesionales_id_profesional_seq; Type: SEQUENCE; Schema: irsalud; Owner: irOwner
--

CREATE SEQUENCE profesionales_id_profesional_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE profesionales_id_profesional_seq OWNER TO "irOwner";

--
-- TOC entry 2101 (class 0 OID 0)
-- Dependencies: 188
-- Name: profesionales_id_profesional_seq; Type: SEQUENCE OWNED BY; Schema: irsalud; Owner: irOwner
--

ALTER SEQUENCE profesionales_id_profesional_seq OWNED BY profesionales.id_profesional;


--
-- TOC entry 175 (class 1259 OID 117040)
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
-- TOC entry 2102 (class 0 OID 0)
-- Dependencies: 175
-- Name: TABLE usuarios; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON TABLE usuarios IS 'usuarios del sistema';


--
-- TOC entry 2103 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN usuarios.id_usuario; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.id_usuario IS 'id principal del usuario';


--
-- TOC entry 2104 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN usuarios.nombre; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.nombre IS 'nombre del usuario';


--
-- TOC entry 2105 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN usuarios.apellido; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.apellido IS 'apellido del usuario';


--
-- TOC entry 2106 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN usuarios.username; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.username IS 'nombre de usuario para ingreso al sistema';


--
-- TOC entry 2107 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN usuarios.password; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.password IS 'contraseña del usuario';


--
-- TOC entry 2108 (class 0 OID 0)
-- Dependencies: 175
-- Name: COLUMN usuarios.imagen; Type: COMMENT; Schema: irsalud; Owner: postgres
--

COMMENT ON COLUMN usuarios.imagen IS 'imagen base64 del usuario 512x512';


--
-- TOC entry 176 (class 1259 OID 117049)
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
-- TOC entry 2109 (class 0 OID 0)
-- Dependencies: 176
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: irsalud; Owner: postgres
--

ALTER SEQUENCE usuarios_id_usuario_seq OWNED BY usuarios.id_usuario;


--
-- TOC entry 1927 (class 2604 OID 117051)
-- Name: id; Type: DEFAULT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY "agendaEventos" ALTER COLUMN id SET DEFAULT nextval('"agendaEventos_id_seq"'::regclass);


--
-- TOC entry 1931 (class 2604 OID 117102)
-- Name: id_familiarcontacto; Type: DEFAULT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY familiarcontacto ALTER COLUMN id_familiarcontacto SET DEFAULT nextval('familiarcontacto_id_familiarcontacto_seq'::regclass);


--
-- TOC entry 1932 (class 2604 OID 117084)
-- Name: id_obra_social; Type: DEFAULT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY obrasocial ALTER COLUMN id_obra_social SET DEFAULT nextval('obrasocial_id_obra_social_seq'::regclass);


--
-- TOC entry 1930 (class 2604 OID 117068)
-- Name: id_paciente; Type: DEFAULT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY pacientes ALTER COLUMN id_paciente SET DEFAULT nextval('pacientes_id_seq'::regclass);


--
-- TOC entry 1933 (class 2604 OID 117097)
-- Name: id_parentesco; Type: DEFAULT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY parentesco ALTER COLUMN id_parentesco SET DEFAULT nextval('parentesco_id_parentesco_seq'::regclass);


--
-- TOC entry 1935 (class 2604 OID 117121)
-- Name: id_profesion; Type: DEFAULT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY profesion ALTER COLUMN id_profesion SET DEFAULT nextval('profesion_id_profesion_seq'::regclass);


--
-- TOC entry 1934 (class 2604 OID 117127)
-- Name: id_profesional; Type: DEFAULT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY profesionales ALTER COLUMN id_profesional SET DEFAULT nextval('profesionales_id_profesional_seq'::regclass);


--
-- TOC entry 1929 (class 2604 OID 117052)
-- Name: id_usuario; Type: DEFAULT; Schema: irsalud; Owner: postgres
--

ALTER TABLE ONLY usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('usuarios_id_usuario_seq'::regclass);


--
-- TOC entry 2065 (class 0 OID 117032)
-- Dependencies: 173
-- Data for Name: agendaEventos; Type: TABLE DATA; Schema: irsalud; Owner: irOwner
--

INSERT INTO "agendaEventos" (id, info_evento, id_usuario, startevent, endevent) VALUES (10, '{"id":103,"color":"#7ae7bf","title":"Visitar a Jose","start":"2017-02-04T11:00:00","end":"2017-02-07T08:00:00","nombre":"Jose","apellido":"Perez","edad":"84","telefonoFijo":"03424537807","telefonoCelular":"0342155009810","direccion":"blas parera 425","descripcion":"paciente con ACV aputacion MII","nota":"es un departamento timbre 3","estado":"editado"}', 1, '2017-02-04', '2017-02-07');
INSERT INTO "agendaEventos" (id, info_evento, id_usuario, startevent, endevent) VALUES (18, '{"id":102,"color":"#5484ed","borderColor":"#5484ed","title":"Visitar a Jose","start":"2016-12-06T11:00:00","end":"2016-12-14T08:00:00","nombre":"Jose","apellido":"Perez","edad":"84","telefonoFijo":"03424537807","telefonoCelular":"0342155009810","direccion":"blas parera 425","descripcion":"paciente con ACV aputacion MII","nota":"es un departamento timbre 3","estado":"editado"}', 1, '2016-12-06', '2016-12-14');
INSERT INTO "agendaEventos" (id, info_evento, id_usuario, startevent, endevent) VALUES (35, '{"id":101,"color":"#fbd75b","borderColor":"#fbd75b","title":"Visitar a Mirta","start":"2017-01-02T11:00:00","end":"2017-01-05T08:00:00","nombre":"Jose","apellido":"Perez","edad":"84","telefonoFijo":"03424537807","telefonoCelular":"0342155009810","direccion":"blas parera 425","descripcion":"paciente con ACV amputaci\u00f3n MII\nLa edad esta fuera del rango permitido ","nota":"es un departamento timbre 3","estado":""}', 1, '2017-01-02', '2017-01-05');


--
-- TOC entry 2110 (class 0 OID 0)
-- Dependencies: 174
-- Name: agendaEventos_id_seq; Type: SEQUENCE SET; Schema: irsalud; Owner: irOwner
--

SELECT pg_catalog.setval('"agendaEventos_id_seq"', 35, true);


--
-- TOC entry 2071 (class 0 OID 117072)
-- Dependencies: 179
-- Data for Name: familiarcontacto; Type: TABLE DATA; Schema: irsalud; Owner: irOwner
--

INSERT INTO familiarcontacto (nombre, apellido, "telefonoP", "telefonoS", documento, id_parentesco, id_familiarcontacto) VALUES ('NANCI', 'MANENTE', NULL, NULL, NULL, NULL, 1);
INSERT INTO familiarcontacto (nombre, apellido, "telefonoP", "telefonoS", documento, id_parentesco, id_familiarcontacto) VALUES ('GIMENEZ', 'DILDA', NULL, NULL, NULL, NULL, 2);
INSERT INTO familiarcontacto (nombre, apellido, "telefonoP", "telefonoS", documento, id_parentesco, id_familiarcontacto) VALUES ('ANDREA', 'ARANDA', NULL, NULL, NULL, NULL, 3);
INSERT INTO familiarcontacto (nombre, apellido, "telefonoP", "telefonoS", documento, id_parentesco, id_familiarcontacto) VALUES ('CARMEN', 'QUIROGA', NULL, NULL, NULL, NULL, 4);
INSERT INTO familiarcontacto (nombre, apellido, "telefonoP", "telefonoS", documento, id_parentesco, id_familiarcontacto) VALUES ('STAND BY', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO familiarcontacto (nombre, apellido, "telefonoP", "telefonoS", documento, id_parentesco, id_familiarcontacto) VALUES ('MARIANA', 'OLIVERA', NULL, NULL, NULL, 1, 6);


--
-- TOC entry 2111 (class 0 OID 0)
-- Dependencies: 184
-- Name: familiarcontacto_id_familiarcontacto_seq; Type: SEQUENCE SET; Schema: irsalud; Owner: irOwner
--

SELECT pg_catalog.setval('familiarcontacto_id_familiarcontacto_seq', 6, true);


--
-- TOC entry 2073 (class 0 OID 117081)
-- Dependencies: 181
-- Data for Name: obrasocial; Type: TABLE DATA; Schema: irsalud; Owner: irOwner
--

INSERT INTO obrasocial (id_obra_social, nombre_corto, "telefonoP", "telefonoS", nombre_largo, direccion) VALUES (1, 'IAPOS', '0800-444-4276', ' ', 'Instituto Autárquico Provincial de Obra Social', NULL);
INSERT INTO obrasocial (id_obra_social, nombre_corto, "telefonoP", "telefonoS", nombre_largo, direccion) VALUES (4, 'D.A.S.', '011-4383-8700', '011-4372-0861', 'Dirección de Ayuda Social para el Personal del Congreso de la
Nación', NULL);
INSERT INTO obrasocial (id_obra_social, nombre_corto, "telefonoP", "telefonoS", nombre_largo, direccion) VALUES (3, 'CAMIONEROS', '0800-777-0020', '4378-1000 int 1008/1088', 'Obra Social de conductores camioneros y personal del transporte automotor de cargas', NULL);
INSERT INTO obrasocial (id_obra_social, nombre_corto, "telefonoP", "telefonoS", nombre_largo, direccion) VALUES (5, 'PARTICULAR', NULL, NULL, 'Paciente particular', NULL);
INSERT INTO obrasocial (id_obra_social, nombre_corto, "telefonoP", "telefonoS", nombre_largo, direccion) VALUES (6, 'OSPAC', '0342 459-3385', NULL, 'Caja de Seguridad Social para los Profesiones del Arte de Curar', '25 de Mayo 1867');
INSERT INTO obrasocial (id_obra_social, nombre_corto, "telefonoP", "telefonoS", nombre_largo, direccion) VALUES (2, 'OSDE', '0810-555-6733', '0342-4552929', 'Obra Social De Ejecutivos y del personal de direccion de empresas', 'Av. Rivadavia 3238');


--
-- TOC entry 2112 (class 0 OID 0)
-- Dependencies: 180
-- Name: obrasocial_id_obra_social_seq; Type: SEQUENCE SET; Schema: irsalud; Owner: irOwner
--

SELECT pg_catalog.setval('obrasocial_id_obra_social_seq', 6, true);


--
-- TOC entry 2069 (class 0 OID 117063)
-- Dependencies: 177
-- Data for Name: pacientes; Type: TABLE DATA; Schema: irsalud; Owner: irOwner
--

INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('JULIO', 'DEL CASTILLO', 11, NULL, 'AZCUENAGA 2919', '4 695 853', NULL, '6308374', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('YOLANDA', 'DIAZ', 12, NULL, 'vieytes 2662', '4691252', NULL, '590164', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('SONIA', 'ALCOCER', 1, NULL, 'REP. DE SIRIA 4428', '4 563 412', NULL, '14048042', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('ISABEL ', 'AGUIRRE', 2, NULL, 'PSJE KOCH 3951', '4883009', NULL, '4614953', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('CARMEN', 'AYALA', 3, NULL, 'AZCUENAGA 2919', NULL, NULL, '5598207', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('NYDIA', 'CARNAVAL', 9, NULL, 'MARCIAL CANDIOTI 3129', NULL, NULL, '1971508', NULL, NULL, 2);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('ROBERTO', 'CARDOZO', 8, NULL, NULL, NULL, NULL, '35525/02', NULL, NULL, 3);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('VERONICA', 'CIRER', 14, NULL, '0800 345 1220', NULL, NULL, '9544/6', NULL, NULL, 4);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('EDA', 'BOCCHIO', 6, NULL, 'SAN JERÓNIMO 7380', '4694150', '155025378', '4105062', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('ANA MARIA', 'BOVO', 7, NULL, 'VELEZ SARSFIELD 5336', '155 083 778', NULL, '6198177', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('VIOLETA', 'FARIAS', 15, NULL, 'BV PELLEGRINI 3755 7ºB', '4052830', NULL, '36196214', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('CESAR', 'FORNI', 17, NULL, 'REP. DE SIRIA 4428', '4 563 412', NULL, '14681481', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('ORLANDO', 'GUILLEN', 18, NULL, NULL, NULL, NULL, '60721', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('ORLANDO', 'GIMENEZ', 19, NULL, 'AV.FREYRE 3041   DPTO, 1', '4 531 760', NULL, '6228110', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('ANA MARIA', 'GOMEZ GIORDANO', 20, NULL, 'A. DEL VALLE 5220', '155 122 004', NULL, '10863693', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('RITA', 'MACCHI', 21, NULL, 'ALTE BROWN 1013 (S.VIEJO)', '155008455', NULL, '4434232', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('MA. ROSARIO', 'MARTINEZ', 22, NULL, 'CATAMARCA 3510', '4 533 650', NULL, '2447032', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('JOSE', 'MARTNEZ', 23, NULL, 'PJE ECHEVERRIA 4763', '4539338', '15561305', '6230897', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('LUIS', 'OLIVERA', 25, NULL, 'PSJE ALSINA 3443 (S.TOME)', '4754928', '154628252', '11658316', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('MARTA', 'OTTOLINA', 26, NULL, 'DR ZAVALLA 3142 DPTO.6', '4529586', NULL, '3989260', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('SERGIO', 'PESSOA', 27, NULL, NULL, '4524 239', NULL, '8509174', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('CRISTIAN', 'PINEDO', 28, NULL, NULL, NULL, NULL, '31831729', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('LILIANA', 'RAMAYO', 29, NULL, 'San Lorenzo 5770', NULL, '155432787', '4700234', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('MARTINA', 'SANDOVAL', 30, NULL, 'EL POZO - M8 - C 28', '4511336', NULL, '1960730', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('GLORIA', 'SCARAFFIA', 31, NULL, 'PJE ECHEVERRIA 4763', '4539328', '155561306', '4474863', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('MARIA ', 'SIMON', 32, NULL, 'EL POZO - M7 - C 26', '155290416', NULL, '32176036', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('NAIR', 'SUAGE', 33, NULL, 'DEFENSA 6705', '4694464', '156120059', NULL, NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('ANA', 'TORRES', 34, NULL, 'SAN JOSE 1116', NULL, NULL, '3957945', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('JULIO', 'TRIBIANI', 35, NULL, 'T.3 P.B. DPTO B', '4527406', '155086683', '7875318', NULL, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('AMALIA', 'VARONE', 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('GUADALUPE', 'BEDETTI', 4, NULL, 'J. DE GARAY 1466 (S.T.)', '4743258', '154347913', '2390810', 1, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('OSCAR ALBERTO', 'BESSI', 5, NULL, 'M. ZASPE 2958 - DPTO 3', '4595210', NULL, '6252242', 2, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('MARIA', 'CASTRO', 10, NULL, 'RGTO 12 DE INFANTERIA 4285 8VO', '4841266', NULL, '3909765', 3, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('ANGEL', 'FACCIPONTI', 13, NULL, '4 DE ENERO 4323', '4535809', '156196349', '6278756', 4, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('MARGARITA', 'FELAJ', 16, NULL, NULL, '4603834', NULL, NULL, 5, NULL, 1);
INSERT INTO pacientes (nombre, apellido, id_paciente, documento, domicilio, "telefonoP", "telefonoS", numeroafiliado, id_familiarcontacto, iniciotratamiento, id_obrasocial) VALUES ('GISELA ', 'OLIVERA', 24, NULL, 'Ba. Sgto CABRAL  T.C 2ºPISO DPTO 7', '4746364', '155379888', '29896945', 6, NULL, 1);


--
-- TOC entry 2113 (class 0 OID 0)
-- Dependencies: 178
-- Name: pacientes_id_seq; Type: SEQUENCE SET; Schema: irsalud; Owner: irOwner
--

SELECT pg_catalog.setval('pacientes_id_seq', 36, true);


--
-- TOC entry 2075 (class 0 OID 117094)
-- Dependencies: 183
-- Data for Name: parentesco; Type: TABLE DATA; Schema: irsalud; Owner: irOwner
--

INSERT INTO parentesco (id_parentesco, tipoparentesco) VALUES (3, 'HERMANO');
INSERT INTO parentesco (id_parentesco, tipoparentesco) VALUES (4, 'HERMANA');
INSERT INTO parentesco (id_parentesco, tipoparentesco) VALUES (5, 'TÍO');
INSERT INTO parentesco (id_parentesco, tipoparentesco) VALUES (6, 'TÍA');
INSERT INTO parentesco (id_parentesco, tipoparentesco) VALUES (1, 'MADRE');
INSERT INTO parentesco (id_parentesco, tipoparentesco) VALUES (2, 'PADRE');
INSERT INTO parentesco (id_parentesco, tipoparentesco) VALUES (7, 'HIJO');
INSERT INTO parentesco (id_parentesco, tipoparentesco) VALUES (8, 'HIJA');


--
-- TOC entry 2114 (class 0 OID 0)
-- Dependencies: 182
-- Name: parentesco_id_parentesco_seq; Type: SEQUENCE SET; Schema: irsalud; Owner: irOwner
--

SELECT pg_catalog.setval('parentesco_id_parentesco_seq', 8, true);


--
-- TOC entry 2079 (class 0 OID 117118)
-- Dependencies: 187
-- Data for Name: profesion; Type: TABLE DATA; Schema: irsalud; Owner: irOwner
--

INSERT INTO profesion (id_profesion, nombre) VALUES (1, 'KINESIOLOGO');
INSERT INTO profesion (id_profesion, nombre) VALUES (2, 'TERAPISTA OCUPACIONAL');
INSERT INTO profesion (id_profesion, nombre) VALUES (3, 'PSICOLOGO');
INSERT INTO profesion (id_profesion, nombre) VALUES (4, 'PSIQUIATRA');
INSERT INTO profesion (id_profesion, nombre) VALUES (5, 'PROFESOR EDUCACIÓN FÍSICA');
INSERT INTO profesion (id_profesion, nombre) VALUES (6, 'NEUROLOGO');
INSERT INTO profesion (id_profesion, nombre) VALUES (7, 'NUTRICIONISTA');
INSERT INTO profesion (id_profesion, nombre) VALUES (8, 'MÉDICO');


--
-- TOC entry 2115 (class 0 OID 0)
-- Dependencies: 186
-- Name: profesion_id_profesion_seq; Type: SEQUENCE SET; Schema: irsalud; Owner: irOwner
--

SELECT pg_catalog.setval('profesion_id_profesion_seq', 8, true);


--
-- TOC entry 2077 (class 0 OID 117113)
-- Dependencies: 185
-- Data for Name: profesionales; Type: TABLE DATA; Schema: irsalud; Owner: irOwner
--

INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (5, 'FACUNDO', 'OLDRINI', NULL, '11120', NULL, NULL, NULL, 1);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (7, 'BELEN', 'REDOLFI', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (8, 'JUAN CRUZ', 'PLATINETTI', NULL, NULL, NULL, NULL, NULL, 1);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (20, 'RIERA', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (21, 'MATIOLI', NULL, NULL, NULL, NULL, NULL, NULL, 4);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (24, 'SAUCO', NULL, NULL, NULL, NULL, NULL, NULL, 6);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (25, 'MALENA', NULL, NULL, NULL, NULL, NULL, NULL, 7);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (26, 'MINGARINI', NULL, NULL, NULL, NULL, NULL, NULL, 8);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (14, 'ROMINA', 'PEREZ', NULL, '929', '154-298-957
', NULL, NULL, 2);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (1, 'GABRIELA', 'MARZO', NULL, '802', '154-474-674
', NULL, NULL, 1);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (2, 'AUGUSTIN', 'NEIL', NULL, '1026', '155-513-402
', NULL, NULL, 1);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (3, 'NAZARENA', 'GOMEZ', NULL, NULL, '154-622-929
', NULL, NULL, 1);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (4, 'BRENDA', 'LORENZ', NULL, '11124', '3497-156-58-448', NULL, NULL, 1);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (6, 'SANTIAGO', 'PASTORELLI', NULL, NULL, '154-780-186', NULL, NULL, 1);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (9, 'AGUSTINA', 'BENITEZ', NULL, NULL, '154-295-052', NULL, NULL, 1);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (13, 'GISEL', 'LANFRANCHI', NULL, 'S0488', '154-720-482', NULL, NULL, 2);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (11, 'SUSANA', 'SPESOTTI', NULL, 'S0246', '154-078-226', NULL, NULL, 2);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (10, 'FANNY', 'SUESCUM', NULL, '00459', '156-982-691', NULL, NULL, 2);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (12, 'NATALIA', 'BACCEGA', NULL, 'S0622', '155-265-874', NULL, NULL, 2);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (27, 'PAMELA', 'SCALISSE', NULL, NULL, NULL, NULL, NULL, 2);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (23, 'GUILLERMO', 'PRETTO', NULL, NULL, '154-860-878', NULL, NULL, 5);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (22, 'LACHER', 'EXEQUIEL', NULL, NULL, NULL, NULL, NULL, 5);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (15, 'BARRIRERO', 'BERENICE', NULL, '6916', '0341-153-120-171', NULL, NULL, 3);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (18, 'AGUSTINA', 'PEREZ FRANCO', NULL, '1710', '155-087-758', NULL, NULL, 3);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (17, 'BRAUNSTEIN', 'LUCIANA', NULL, '1179', '156-148-499', NULL, NULL, 3);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (19, 'FLORENCIA', 'MARTINEZ', NULL, NULL, '155-134-461', NULL, NULL, 3);
INSERT INTO profesionales (id_profesional, nombre, apellido, documento, matricula, "telefonoP", "telefonoS", imagen, id_profesion) VALUES (16, 'MARTINEZ', 'VERONICA', NULL, NULL, '154-052-407', NULL, NULL, 3);


--
-- TOC entry 2116 (class 0 OID 0)
-- Dependencies: 188
-- Name: profesionales_id_profesional_seq; Type: SEQUENCE SET; Schema: irsalud; Owner: irOwner
--

SELECT pg_catalog.setval('profesionales_id_profesional_seq', 27, true);


--
-- TOC entry 2067 (class 0 OID 117040)
-- Dependencies: 175
-- Data for Name: usuarios; Type: TABLE DATA; Schema: irsalud; Owner: postgres
--

INSERT INTO usuarios (id_usuario, nombre, apellido, username, password, imagen) VALUES (1, 'Alejandra', 'Pacheco', 'alito', '1760a83811fa4632c5c9a11f593243ff', 'data:image/png;base64,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');


--
-- TOC entry 2117 (class 0 OID 0)
-- Dependencies: 176
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: irsalud; Owner: postgres
--

SELECT pg_catalog.setval('usuarios_id_usuario_seq', 1, true);


--
-- TOC entry 1937 (class 2606 OID 117055)
-- Name: id_evento_pk; Type: CONSTRAINT; Schema: irsalud; Owner: irOwner; Tablespace: 
--

ALTER TABLE ONLY "agendaEventos"
    ADD CONSTRAINT id_evento_pk PRIMARY KEY (id);


--
-- TOC entry 1943 (class 2606 OID 117107)
-- Name: pk_familiar_contacto; Type: CONSTRAINT; Schema: irsalud; Owner: irOwner; Tablespace: 
--

ALTER TABLE ONLY familiarcontacto
    ADD CONSTRAINT pk_familiar_contacto PRIMARY KEY (id_familiarcontacto);


--
-- TOC entry 1945 (class 2606 OID 117086)
-- Name: pk_obrasocial; Type: CONSTRAINT; Schema: irsalud; Owner: irOwner; Tablespace: 
--

ALTER TABLE ONLY obrasocial
    ADD CONSTRAINT pk_obrasocial PRIMARY KEY (id_obra_social);


--
-- TOC entry 1941 (class 2606 OID 117078)
-- Name: pk_paciente; Type: CONSTRAINT; Schema: irsalud; Owner: irOwner; Tablespace: 
--

ALTER TABLE ONLY pacientes
    ADD CONSTRAINT pk_paciente PRIMARY KEY (id_paciente);


--
-- TOC entry 1947 (class 2606 OID 117099)
-- Name: pk_parentesco; Type: CONSTRAINT; Schema: irsalud; Owner: irOwner; Tablespace: 
--

ALTER TABLE ONLY parentesco
    ADD CONSTRAINT pk_parentesco PRIMARY KEY (id_parentesco);


--
-- TOC entry 1951 (class 2606 OID 117123)
-- Name: pk_profesion; Type: CONSTRAINT; Schema: irsalud; Owner: irOwner; Tablespace: 
--

ALTER TABLE ONLY profesion
    ADD CONSTRAINT pk_profesion PRIMARY KEY (id_profesion);


--
-- TOC entry 1949 (class 2606 OID 117135)
-- Name: pk_profesional; Type: CONSTRAINT; Schema: irsalud; Owner: irOwner; Tablespace: 
--

ALTER TABLE ONLY profesionales
    ADD CONSTRAINT pk_profesional PRIMARY KEY (id_profesional);


--
-- TOC entry 1939 (class 2606 OID 117057)
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: irsalud; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 1953 (class 2606 OID 117087)
-- Name: FK_obrasocial; Type: FK CONSTRAINT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY pacientes
    ADD CONSTRAINT "FK_obrasocial" FOREIGN KEY (id_obrasocial) REFERENCES obrasocial(id_obra_social);


--
-- TOC entry 1954 (class 2606 OID 117108)
-- Name: fk_parentesco; Type: FK CONSTRAINT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY familiarcontacto
    ADD CONSTRAINT fk_parentesco FOREIGN KEY (id_parentesco) REFERENCES parentesco(id_parentesco);


--
-- TOC entry 1955 (class 2606 OID 117136)
-- Name: fk_profesion_profesional; Type: FK CONSTRAINT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY profesionales
    ADD CONSTRAINT fk_profesion_profesional FOREIGN KEY (id_profesion) REFERENCES profesion(id_profesion);


--
-- TOC entry 1952 (class 2606 OID 117058)
-- Name: id_usuario_fk; Type: FK CONSTRAINT; Schema: irsalud; Owner: irOwner
--

ALTER TABLE ONLY "agendaEventos"
    ADD CONSTRAINT id_usuario_fk FOREIGN KEY (id_usuario) REFERENCES usuarios(id_usuario);


--
-- TOC entry 2087 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
GRANT ALL ON SCHEMA public TO "irOwner";


-- Completed on 2017-01-31 13:27:18

--
-- PostgreSQL database dump complete
--

