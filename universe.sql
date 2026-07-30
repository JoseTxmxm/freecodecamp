--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_description text NOT NULL,
    distance_from_earth_km numeric(10,2) NOT NULL,
    quantity_of_planets integer DEFAULT 0,
    quantity_of_moons integer DEFAULT 0,
    quantity_of_suns integer DEFAULT 0,
    is_type_s boolean DEFAULT false,
    is_type_sb boolean DEFAULT false,
    is_type_e boolean DEFAULT false,
    is_type_so boolean DEFAULT false,
    is_type_irr boolean DEFAULT false
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    moon_description text NOT NULL,
    diameter_in_km numeric(10,2) NOT NULL,
    quantity_of_elements integer DEFAULT 0,
    secundary_type integer,
    is_regular boolean DEFAULT true,
    is_irregular boolean DEFAULT false
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    planet_description text NOT NULL,
    diameter_km numeric(10,2) NOT NULL,
    has_moons boolean DEFAULT false,
    quantity_of_moons integer DEFAULT 0,
    quantity_of_elements integer DEFAULT 0,
    quantity_of_atmosphere integer DEFAULT 0,
    is_type_gas boolean DEFAULT false,
    is_type_rockyland boolean DEFAULT false,
    is_type_iceland boolean DEFAULT false
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_description text NOT NULL,
    diameter_km numeric NOT NULL,
    has_ionized_metals boolean DEFAULT false,
    has_calcium boolean DEFAULT false,
    has_hydrogen boolean DEFAULT false,
    has_iron boolean DEFAULT false,
    has_helium boolean DEFAULT false,
    has_titanium boolean DEFAULT false,
    temp_subd integer,
    quantity_of_elements integer DEFAULT 0
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    sun_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    star_id integer,
    diameter_in_km numeric(10,2) NOT NULL,
    sun_description text NOT NULL,
    quantity_of_elements integer DEFAULT 0,
    temp_subd integer,
    has_ionized_metals boolean DEFAULT false,
    has_calcium boolean DEFAULT false,
    has_hydrogen boolean DEFAULT false,
    has_iron boolean DEFAULT false,
    has_helium boolean DEFAULT false,
    has_titanium boolean DEFAULT false
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_sun_id_seq OWNED BY public.sun.sun_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Vía Láctea', 'Nuestra galaxia hogar.', 0.00, 0, 0, 0, false, true, false, false, false);
INSERT INTO public.galaxy VALUES (2, 'Andrómeda (M31)', 'La galaxia grande más cercana.', 2400000.00, 0, 0, 0, true, false, false, false, false);
INSERT INTO public.galaxy VALUES (3, 'Triángulo (M33)', 'Tercera más grande del Grupo Local.', 2900000.00, 0, 0, 0, true, false, false, false, false);
INSERT INTO public.galaxy VALUES (4, 'Gran Nube de Magallanes', 'Galaxia satélite de la Vía Láctea.', 163000.00, 0, 0, 0, false, false, false, false, true);
INSERT INTO public.galaxy VALUES (5, 'Galaxia de la Sombrero (M104)', 'Destaca por su brillante núcleo central.', 28000000.00, 0, 0, 0, false, false, false, true, false);
INSERT INTO public.galaxy VALUES (6, 'M87', 'Galaxia elíptica gigante con un agujero negro masivo.', 53000000.00, 0, 0, 0, false, false, true, false, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 'Satélite natural de la Tierra.', 3474.80, 12, 101, true, false);
INSERT INTO public.moon VALUES (2, 'Fobos', 4, 'Luna menor e irregular de Marte.', 22.50, 5, 102, false, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 'Luna exterior de Marte.', 12.40, 4, 103, false, true);
INSERT INTO public.moon VALUES (4, 'Ganímedes', 5, 'La luna más grande del Sistema Solar.', 5268.20, 15, 104, true, false);
INSERT INTO public.moon VALUES (5, 'Ío', 5, 'Mundo volcánico activo.', 3643.20, 18, 105, true, false);
INSERT INTO public.moon VALUES (6, 'Europa', 5, 'Luna helada con océano subterráneo.', 3121.60, 10, 106, true, false);
INSERT INTO public.moon VALUES (7, 'Calisto', 5, 'Cuerpo muy craterizado.', 4820.60, 8, 107, true, false);
INSERT INTO public.moon VALUES (8, 'Titán', 6, 'Luna con atmósfera densa y metano.', 5149.50, 14, 108, true, false);
INSERT INTO public.moon VALUES (9, 'Encélado', 6, 'Posee géiseres de agua helada.', 504.20, 9, 109, true, false);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 'Destaca por su gran cráter Herschel.', 396.40, 6, 110, true, false);
INSERT INTO public.moon VALUES (11, 'Hiperión', 6, 'Cuerpo esponjoso e irregular.', 270.00, 5, 111, false, true);
INSERT INTO public.moon VALUES (12, 'Miranda', 7, 'Superficie caótica y fracturada.', 471.60, 7, 112, true, false);
INSERT INTO public.moon VALUES (13, 'Titania', 7, 'La luna más grande de Urano.', 1577.80, 8, 113, true, false);
INSERT INTO public.moon VALUES (14, 'Oberón', 7, 'Luna exterior craterizada de Urano.', 1522.80, 8, 114, true, false);
INSERT INTO public.moon VALUES (15, 'Tritón', 8, 'Luna retrógrada helada.', 2706.80, 11, 115, false, true);
INSERT INTO public.moon VALUES (16, 'Nereida', 8, 'Órbita altamente excéntrica.', 340.00, 6, 116, false, true);
INSERT INTO public.moon VALUES (17, 'S1-Andrómeda', 9, 'Exoluna helada en Andrómeda.', 1200.00, 3, 117, true, false);
INSERT INTO public.moon VALUES (18, 'S2-Andrómeda', 9, 'Exoluna rocosa menor.', 850.00, 4, 118, false, true);
INSERT INTO public.moon VALUES (19, 'Triángulo Luna 1', 10, 'Exoluna masiva en Triángulo.', 1450.00, 5, 119, true, false);
INSERT INTO public.moon VALUES (20, 'Sombrero Satélite A', 12, 'Satélite capturado en M104.', 980.00, 6, 120, false, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, 'Planeta rocoso más cercano al Sol.', 4879.40, false, 0, 0, 0, false, true, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Planeta rocoso con atmósfera densa.', 12104.00, false, 0, 0, 0, false, true, false);
INSERT INTO public.planet VALUES (3, 'Tierra', 1, 'Nuestro planeta hogar.', 12742.00, true, 1, 0, 0, false, true, false);
INSERT INTO public.planet VALUES (4, 'Marte', 1, 'El planeta rojo.', 6779.00, true, 2, 0, 0, false, true, false);
INSERT INTO public.planet VALUES (5, 'Júpiter', 1, 'El gigante gaseoso del sistema.', 139820.00, true, 4, 0, 0, true, false, false);
INSERT INTO public.planet VALUES (6, 'Saturno', 1, 'Famoso por sus grandes anillos.', 116460.00, true, 4, 0, 0, true, false, false);
INSERT INTO public.planet VALUES (7, 'Urano', 1, 'Gigante helado inclinado.', 50724.00, true, 3, 0, 0, false, false, true);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, 'Gigante helado con vientos extremos.', 49244.00, true, 2, 0, 0, false, false, true);
INSERT INTO public.planet VALUES (9, 'Exoplaneta Alpheratz b', 2, 'Gigante gaseoso órbita en Andrómeda.', 150000.00, true, 2, 0, 0, true, false, false);
INSERT INTO public.planet VALUES (10, 'HD 13572 b', 3, 'Planeta masivo helado en Triángulo.', 65000.00, true, 1, 0, 0, false, false, true);
INSERT INTO public.planet VALUES (11, 'WOH G64 Prime', 4, 'Planeta gaseoso expuesto a alta radiación.', 180000.00, false, 0, 0, 0, true, false, false);
INSERT INTO public.planet VALUES (12, 'Sombrero Exon', 5, 'Superterra rocosa en la galaxia del Sombrero.', 22000.00, true, 1, 0, 0, false, true, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'Tipo espectral G, rica en metales.', 1392700.00, false, false, true, true, true, false, 5778, 92);
INSERT INTO public.star VALUES (2, 'Alpheratz', 2, 'Estrella binaria muy brillante.', 3200000.00, true, false, true, false, false, false, 13800, 45);
INSERT INTO public.star VALUES (3, 'HD 13572', 3, 'Supergigante masiva.', 5800000.00, false, false, false, true, true, false, 18000, 38);
INSERT INTO public.star VALUES (4, 'WOH G64', 4, 'Una de las estrellas más grandes conocidas.', 2140000000.00, false, false, true, false, true, true, 3200, 25);
INSERT INTO public.star VALUES (5, 'Estrella Central de M104', 5, 'Núcleo estelar densamente poblado.', 1800000.00, false, true, false, true, false, false, 4800, 50);
INSERT INTO public.star VALUES (6, 'Estrella del Jet M87', 6, 'Estrella extrema cerca del jet galáctico.', 2500000.00, true, true, true, true, true, true, 35000, 70);


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES (1, 'Sol Prime', 1, 1, 1392700.00, 'Estrella de la secuencia principal rica en elementos pesados y estabilidad lumínica.', 92, 5778, false, false, true, true, true, false);
INSERT INTO public.sun VALUES (2, 'Suhail Azul', 4, 4, 25000000.00, 'Sol masivo de vida corta con altísima radiación ultravioleta y vientos estelares feroces.', 15, 40000, true, false, true, false, true, false);
INSERT INTO public.sun VALUES (3, 'Alpheratz Alfa', 2, 2, 3400000.00, 'Sol blanco-azulado con fuertes líneas de absorción de hidrógeno en su espectro.', 45, 9500, false, true, true, false, false, false);
INSERT INTO public.sun VALUES (4, 'Kepler Keplerian', 3, 3, 960000.00, 'Sol óptimo para la habitabilidad planetaria prolongada debido a su larga estabilidad.', 60, 4500, false, false, true, false, true, true);
INSERT INTO public.sun VALUES (5, 'Proxima Centauri S', 5, 5, 200000.00, 'Sol frío y pequeño, el tipo más común en el universo local, propenso a llamaradas.', 30, 3000, false, false, true, true, true, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: sun_sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_sun_id_seq', 5, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_secundary_type_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_secundary_type_key UNIQUE (secundary_type);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_temp_subd_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_temp_subd_key UNIQUE (temp_subd);


--
-- Name: sun sun_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_name_key UNIQUE (name);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: sun sun_temp_subd_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_temp_subd_key UNIQUE (temp_subd);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: sun sun_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: sun sun_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

