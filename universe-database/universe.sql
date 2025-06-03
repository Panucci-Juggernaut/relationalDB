--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: extrasolar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.extrasolar_system (
    extrasolar_system_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL,
    discovered_year integer NOT NULL,
    number_of_stars integer
);


ALTER TABLE public.extrasolar_system OWNER TO freecodecamp;

--
-- Name: extrasolar_system_extrasolar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.extrasolar_system_extrasolar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extrasolar_system_extrasolar_system_id_seq OWNER TO freecodecamp;

--
-- Name: extrasolar_system_extrasolar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.extrasolar_system_extrasolar_system_id_seq OWNED BY public.extrasolar_system.extrasolar_system_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    age_in_millions_of_years integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean
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
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric
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
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    number_of_moons integer
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
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean NOT NULL,
    distance_from_earth numeric
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
-- Name: extrasolar_system extrasolar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.extrasolar_system ALTER COLUMN extrasolar_system_id SET DEFAULT nextval('public.extrasolar_system_extrasolar_system_id_seq'::regclass);


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
-- Data for Name: extrasolar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.extrasolar_system VALUES (1, 'Kepler-186', 'First Earth-size planet in habitable zone', 2014, 1);
INSERT INTO public.extrasolar_system VALUES (2, 'TRAPPIST-1', 'System with 7 Earth-size planets', 2017, 1);
INSERT INTO public.extrasolar_system VALUES (3, 'Gliese 581', 'Home to several potential habitable planets', 2005, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy', 13600, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy', 10000, false, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral galaxy in the local group', 13000, false, true);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Face-on spiral galaxy', 10000, false, true);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Galaxy with bright nucleus', 12000, false, true);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 'Large spiral galaxy', 14000, false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, true, 4500, 0.384);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, false, 4000, 0.009);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, false, 4000, 0.023);
INSERT INTO public.moon VALUES (4, 'Io', 4, true, 4500, 628.3);
INSERT INTO public.moon VALUES (5, 'Europa', 4, true, 4500, 628.3);
INSERT INTO public.moon VALUES (6, 'Ganymede', 4, true, 4500, 628.3);
INSERT INTO public.moon VALUES (7, 'Callisto', 4, true, 4500, 628.3);
INSERT INTO public.moon VALUES (8, 'Titan', 5, true, 4500, 1200);
INSERT INTO public.moon VALUES (9, 'Enceladus', 5, true, 4500, 1200);
INSERT INTO public.moon VALUES (10, 'Mimas', 5, false, 4500, 1200);
INSERT INTO public.moon VALUES (11, 'Tethys', 5, true, 4500, 1200);
INSERT INTO public.moon VALUES (12, 'Dione', 5, true, 4500, 1200);
INSERT INTO public.moon VALUES (13, 'Rhea', 5, true, 4500, 1200);
INSERT INTO public.moon VALUES (14, 'Iapetus', 5, true, 4500, 1200);
INSERT INTO public.moon VALUES (15, 'Triton', 6, true, 4500, 4300);
INSERT INTO public.moon VALUES (16, 'Miranda', 7, true, 4500, 2900);
INSERT INTO public.moon VALUES (17, 'Ariel', 7, true, 4500, 2900);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, true, 4500, 2900);
INSERT INTO public.moon VALUES (19, 'Titania', 7, true, 4500, 2900);
INSERT INTO public.moon VALUES (20, 'Oberon', 7, true, 4500, 2900);
INSERT INTO public.moon VALUES (21, 'Charon', 8, true, 4500, 5900);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 1, false, true, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 1, false, true, 0);
INSERT INTO public.planet VALUES (4, 'Jupiter', 1, false, true, 79);
INSERT INTO public.planet VALUES (5, 'Saturn', 1, false, true, 82);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, false, true, 14);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, true, 27);
INSERT INTO public.planet VALUES (8, 'Mercury', 1, false, true, 0);
INSERT INTO public.planet VALUES (9, 'Kepler-22b', 2, false, true, 0);
INSERT INTO public.planet VALUES (10, 'Proxima b', 5, false, true, 0);
INSERT INTO public.planet VALUES (11, 'Vega-1', 6, false, true, 1);
INSERT INTO public.planet VALUES (12, 'Alpha-b', 2, false, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 4600, true, 0.0000158);
INSERT INTO public.star VALUES (2, 'Alpha Centauri', 1, 5000, true, 4.37);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 8000, true, 642);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 250, true, 8.6);
INSERT INTO public.star VALUES (5, 'Proxima Centauri', 1, 4500, true, 4.24);
INSERT INTO public.star VALUES (6, 'Vega', 1, 455, true, 25.0);


--
-- Name: extrasolar_system_extrasolar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.extrasolar_system_extrasolar_system_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: extrasolar_system extrasolar_system_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.extrasolar_system
    ADD CONSTRAINT extrasolar_system_name_key UNIQUE (name);


--
-- Name: extrasolar_system extrasolar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.extrasolar_system
    ADD CONSTRAINT extrasolar_system_pkey PRIMARY KEY (extrasolar_system_id);


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
-- PostgreSQL database dump complete
--

