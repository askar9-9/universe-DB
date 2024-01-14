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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovery_year integer,
    is_periodic boolean,
    unique_comet_property text
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size integer,
    has_black_hole boolean,
    unique_galaxy_property numeric,
    description text
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
    radius numeric NOT NULL,
    is_in_habitable_zone boolean,
    planet_id integer,
    unique_moon_property text
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
    distance_from_star numeric,
    has_atmosphere boolean,
    star_id integer,
    unique_planet_property text
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
    temperature integer,
    is_supernova boolean,
    galaxy_id integer,
    unique_star_property text
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley''s Comet', 1705, true, 'Periodic comet visible from Earth');
INSERT INTO public.comet VALUES (2, 'Comet Hale-Bopp', 1995, true, 'Great Comet of 1997');
INSERT INTO public.comet VALUES (3, 'Comet NEOWISE', 2020, false, 'Discovered by the NEOWISE space telescope');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milk Way', 100000, true, 456.78, 'Our home galaxy, filled with stars');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 120000, false, 789.23, 'Spiraal galaxy neighboring Milky Way');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 50000, false, 234.56, 'Small galaxy in Local Group');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 60000, true, 123.45, 'Notable for its bright nucleus');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 80000, false, 567.89, 'Famous spiral galaxy wiith a companion');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 70000, false, 987.65, 'Another beautiful spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 1737.1, false, 1, 'Earth''s natural satellite');
INSERT INTO public.moon VALUES (2, 'Titan', 2575.5, true, 5, 'Largest moon of Saturn');
INSERT INTO public.moon VALUES (3, 'Ganymede', 2634.1, false, 3, 'Largest moon of Jupiter');
INSERT INTO public.moon VALUES (4, 'Europa', 1560.7, true, 3, 'Ice-covered moon of Jupiter');
INSERT INTO public.moon VALUES (5, 'Phobos', 11.1, false, 2, 'Martian moon');
INSERT INTO public.moon VALUES (6, 'Enceladus', 252.1, true, 5, 'Active ice moon of Saturn');
INSERT INTO public.moon VALUES (22, 'Io', 1821.6, false, 3, 'Volcanic moon of Jupiter');
INSERT INTO public.moon VALUES (23, 'Deimos', 6.2, false, 2, 'Smaller Martian moon');
INSERT INTO public.moon VALUES (24, 'Triton', 1353.4, false, 6, 'Cold moon of Neptune');
INSERT INTO public.moon VALUES (25, 'Callisto', 2410.3, false, 3, 'Galilean moon of Jupiter');
INSERT INTO public.moon VALUES (26, 'Hyperion', 135, false, 5, 'Irregular moon of Saturn');
INSERT INTO public.moon VALUES (27, 'Oberon', 761.4, false, 8, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (28, 'Miranda', 235.8, false, 8, 'Moon of Uranus with varied terrain');
INSERT INTO public.moon VALUES (29, 'Charon', 606, false, 9, 'Largest moon of Pluto');
INSERT INTO public.moon VALUES (30, 'Europa 2', 1560.7, true, 3, 'Potential subsurface ocean');
INSERT INTO public.moon VALUES (31, 'Ganymede 2', 2634.1, false, 3, 'Galilean moon of Jupiter, second instance');
INSERT INTO public.moon VALUES (32, 'Prometheus', 43, false, 5, 'Faint moon of Saturn, shepherd of the F ring');
INSERT INTO public.moon VALUES (33, 'Rhea', 763.8, false, 5, 'Moon of Saturn, named after a Titaness');
INSERT INTO public.moon VALUES (34, 'Dione', 561.4, false, 5, 'Second-largest moon of Saturn');
INSERT INTO public.moon VALUES (35, 'Mimas', 198.2, false, 5, 'Smallest moon of Saturn, resembles the Death Star');
INSERT INTO public.moon VALUES (36, 'Tethys', 536.3, false, 5, 'Moon of Saturn, named after a Qansha');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 149.6, true, 1, 'Habitable, home to diverse life forms');
INSERT INTO public.planet VALUES (2, 'Mars', 227.9, true, 1, 'Known as the Red Planet');
INSERT INTO public.planet VALUES (3, 'Jupiter', 778.5, false, 2, 'Largest planet in our solar system');
INSERT INTO public.planet VALUES (4, 'Venus', 108.2, true, 1, 'Thick atmosphere, hottest planet');
INSERT INTO public.planet VALUES (5, 'Saturn', 1400.0, false, 2, 'Spectacular ring system');
INSERT INTO public.planet VALUES (6, 'Neptune', 4500.0, false, 2, 'Ice giant, deep blue color');
INSERT INTO public.planet VALUES (8, 'Mercury', 57.9, false, 1, 'Closest planet to the Sun');
INSERT INTO public.planet VALUES (9, 'Uranus', 2900.0, false, 2, 'Sideways rotation, ice giant');
INSERT INTO public.planet VALUES (10, 'Mars 2', 225.4, true, 1, 'Potential target for human colonization');
INSERT INTO public.planet VALUES (12, 'Titan', 1200, true, 5, 'Largest moon of Saturn thick atmosphere');
INSERT INTO public.planet VALUES (11, 'Exoplanet A', 300000000, NULL, 3, 'First exoplanet discovered');
INSERT INTO public.planet VALUES (13, 'Kepler-186f', 490000000, true, 4, 'Exoplanet in the habitable zone');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, false, 1, 'G-type main-sequence star');
INSERT INTO public.star VALUES (2, 'Sirius', 9940, false, 1, 'Brightest star in the night sky');
INSERT INTO public.star VALUES (3, 'Betelgeuse', 3500, false, 2, 'Red supergiant');
INSERT INTO public.star VALUES (4, 'Vega', 9600, false, 1, 'Alpha Lyrae, part of the Summer Triangle');
INSERT INTO public.star VALUES (5, 'Antares', 3500, false, 2, 'Red supergiant, heart of Scorpius');
INSERT INTO public.star VALUES (6, 'Proxima Centauri', 3042, false, 1, 'Nearest known star to the Sun');


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 36, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: comet comet_unique_comet_property_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_unique_comet_property_key UNIQUE (unique_comet_property);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique_galaxy_property_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique_galaxy_property_key UNIQUE (unique_galaxy_property);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique_moon_property_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique_moon_property_key UNIQUE (unique_moon_property);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique_planet_property_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique_planet_property_key UNIQUE (unique_planet_property);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique_star_property_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique_star_property_key UNIQUE (unique_star_property);


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

