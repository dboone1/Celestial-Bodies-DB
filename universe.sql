--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(50) NOT NULL,
    type character varying(40),
    probe_landing_history boolean NOT NULL,
    diameter_ly bigint,
    distance_ly bigint
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
    name character varying(50) NOT NULL,
    circumference_mi bigint,
    distance_mi numeric(20,10),
    planet_id integer NOT NULL,
    rotation_period_days numeric(6,3),
    surface_area_mi bigint
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
    name character varying(50) NOT NULL,
    circumference_mi bigint,
    temperature_celsius integer,
    distance_ly numeric(20,10),
    type character varying(40),
    star_id integer NOT NULL,
    probe_landing_history boolean
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
    name character varying(50) NOT NULL,
    circumference_mi bigint,
    temperature_celsius integer,
    distance_ly numeric(20,10),
    type character varying(40),
    galaxy_id integer NOT NULL
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
-- Name: super_earth; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.super_earth (
    super_earth_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    habitability text
);


ALTER TABLE public.super_earth OWNER TO freecodecamp;

--
-- Name: super_earth_super_earth_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.super_earth_super_earth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.super_earth_super_earth_id_seq OWNER TO freecodecamp;

--
-- Name: super_earth_super_earth_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.super_earth_super_earth_id_seq OWNED BY public.super_earth.super_earth_id;


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
-- Name: super_earth super_earth_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.super_earth ALTER COLUMN super_earth_id SET DEFAULT nextval('public.super_earth_super_earth_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 105700, 26670);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf Galaxy', 'Irregular', false, 5000, 25000);
INSERT INTO public.galaxy VALUES (3, 'Messier_82', 'Peculiar', false, 37000, 11420000);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'Spiral', false, 220000, 2537000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero Galaxy', 'Peculiar', false, 50000, 29350000);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', 'Spiral', false, 52962, 24000000);
INSERT INTO public.galaxy VALUES (7, 'Cygnus A', 'Elliptical', false, NULL, 760000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 6786, 238900.0000000000, 1, 27.000, 14600000);
INSERT INTO public.moon VALUES (2, 'Phobos', 43, 43340000.0000000000, 2, 0.318, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 24, 48340000.0000000000, 2, 1.260, 191);
INSERT INTO public.moon VALUES (4, 'Ganymede', 10273, 390400000.0000000000, 6, 7.000, 1635);
INSERT INTO public.moon VALUES (5, 'Io', 7111, 390400000.0000000000, 6, 1.800, 16181541);
INSERT INTO public.moon VALUES (6, 'Europa', 6094, 390400000.0000000000, 6, 3.500, 19200369);
INSERT INTO public.moon VALUES (7, 'Titan', 10052, 746000000.0000000000, 5, 16.000, 51573809);
INSERT INTO public.moon VALUES (8, 'Rhea', 2984, 790100000.0000000000, 5, 4.520, 4559000);
INSERT INTO public.moon VALUES (9, 'Atlas', 1106, NULL, 5, 16.000, 83);
INSERT INTO public.moon VALUES (10, 'Dione', 2193, 790100000.0000000000, 5, 2.700, 1530809);
INSERT INTO public.moon VALUES (11, 'Tethys', 2081, 790100000.0000000000, 5, 1.850, 1378372);
INSERT INTO public.moon VALUES (12, 'Miranda', 921, 1692000000.0000000000, 9, 1.413, 434960);
INSERT INTO public.moon VALUES (13, 'Ariel', 2260, NULL, 9, 2.520, 1625992);
INSERT INTO public.moon VALUES (14, 'Umbriel', 750, 165270.0000000000, 9, 4.140, 1658695);
INSERT INTO public.moon VALUES (15, 'Triton', 5284, 2696000000.0000000000, 3, 5.877, 8880350);
INSERT INTO public.moon VALUES (16, 'Proteus', 820, NULL, 3, 1.120, 213978);
INSERT INTO public.moon VALUES (17, 'Enceladus', 984, 790100000.0000000000, 5, 1.370, 147909);
INSERT INTO public.moon VALUES (18, 'Callisto', 9410, 390400000.0000000000, 6, 17.000, 9410);
INSERT INTO public.moon VALUES (19, 'Hyperion', 527, NULL, 5, 13.000, 88426);
INSERT INTO public.moon VALUES (20, 'Janus', 349, NULL, 5, 0.695, 38865);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 25000, 15, 0.0000000000, 'terrestial', 2, true);
INSERT INTO public.planet VALUES (2, 'Mars', 13263, -62, 0.0000008700, 'terrestial', 2, true);
INSERT INTO public.planet VALUES (3, 'Neptune', 96685, -225, 0.0005700000, 'ice_giant', 2, false);
INSERT INTO public.planet VALUES (4, 'Keppler_22b', 9501, -15, 587.0000000000, 'terrestial', 7, true);
INSERT INTO public.planet VALUES (5, 'Saturn', 75000, -176, 0.0001500000, 'gas_giant', 2, false);
INSERT INTO public.planet VALUES (6, 'Jupiter', 88900, -110, 0.0000800000, 'gas_giant', 2, false);
INSERT INTO public.planet VALUES (7, 'Mercury', 1516, 167, 0.0000060000, 'terrestial', 2, true);
INSERT INTO public.planet VALUES (8, 'Venus', 7521, 464, 0.0000110000, 'terrestial', 2, true);
INSERT INTO public.planet VALUES (9, 'Uranus', 15759, -195, 0.0003000000, 'ice_giant', 2, false);
INSERT INTO public.planet VALUES (10, 'Keppler_69b', 8761333, 506, 2400.0000000000, 'terrestial', 8, false);
INSERT INTO public.planet VALUES (11, 'Keppler_69c', 6769, 52, 2707.0000000000, 'terrestial', 7, false);
INSERT INTO public.planet VALUES (12, 'Keppler_186f', 4631, -85, 557.7000000000, 'terrestial', 9, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'VX_Sagittarri', 1000000000, 2726, 5121.0000000000, 'hypergiant', 1);
INSERT INTO public.star VALUES (2, 'Sun', 2720000, 5505, 0.0000160000, 'yellow_dwarf', 1);
INSERT INTO public.star VALUES (3, 'MU_Andromedae', 2075000, 7816, 136.0000000000, 'white_dwarf', 4);
INSERT INTO public.star VALUES (4, 'Sirius_A', 1470000, 9667, 8.6110000000, 'binary_star', 2);
INSERT INTO public.star VALUES (5, 'Alpha_Com', NULL, 6104, 58.0000000000, 'binary_star', 6);
INSERT INTO public.star VALUES (6, 'Eta_Carinae', 605200000, 14726, 7500.0000000000, 'binary_star', 1);
INSERT INTO public.star VALUES (7, 'Kepler_22', 423209, 5244, 619.0000000000, 'yellow_dwarf', 7);
INSERT INTO public.star VALUES (8, 'Kepler_69', 402027, 5364, 2707.0000000000, 'yellow_dwarf', 7);
INSERT INTO public.star VALUES (9, 'Kepler_186', 226090, 3481, 492.5000000000, 'red_dwarf', 7);


--
-- Data for Name: super_earth; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.super_earth VALUES (1, 'Keppler_186f', 9, 'Potentially has zones of water and similar temperature shifts as mars');
INSERT INTO public.super_earth VALUES (2, 'Keppler_22b', 4, 'High chances of water as well as a equillibrium temperature of -19C');
INSERT INTO public.super_earth VALUES (3, 'Keppler_69c', 11, 'Super-venus with a possibility of water');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: super_earth_super_earth_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.super_earth_super_earth_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: super_earth super_earth_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.super_earth
    ADD CONSTRAINT super_earth_pkey PRIMARY KEY (super_earth_id);


--
-- Name: super_earth super_earth_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.super_earth
    ADD CONSTRAINT super_earth_unique UNIQUE (name);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: super_earth super_earth_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.super_earth
    ADD CONSTRAINT super_earth_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- PostgreSQL database dump complete
--

