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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(6,1),
    galaxy_id integer NOT NULL,
    galaxy_type character varying(20),
    is_spherical boolean,
    has_life boolean
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
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(5,1)
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
    star_id integer,
    description text,
    has_life boolean,
    is_spherical boolean,
    age_in_millions_of_years numeric(5,1),
    planet_types character varying(20) NOT NULL,
    distance_from_earth integer,
    distance_from_sun integer,
    name character varying(20)
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
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    description text,
    age_in_millions_of_years numeric(5,1),
    distance_from_earth integer
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
-- Name: universal_relationship; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.universal_relationship (
    universal_relationship_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL,
    planet_id integer NOT NULL,
    moon_id integer,
    name character varying(10)
);


ALTER TABLE public.universal_relationship OWNER TO freecodecamp;

--
-- Name: universal_relationship_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universal_relationship_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universal_relationship_name_seq OWNER TO freecodecamp;

--
-- Name: universal_relationship_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universal_relationship_name_seq OWNED BY public.universal_relationship.name;


--
-- Name: universal_relationship_universal_relationship_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.universal_relationship_universal_relationship_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.universal_relationship_universal_relationship_id_seq OWNER TO freecodecamp;

--
-- Name: universal_relationship_universal_relationship_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.universal_relationship_universal_relationship_id_seq OWNED BY public.universal_relationship.universal_relationship_id;


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
-- Name: universal_relationship universal_relationship_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universal_relationship ALTER COLUMN universal_relationship_id SET DEFAULT nextval('public.universal_relationship_universal_relationship_id_seq'::regclass);


--
-- Name: universal_relationship name; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universal_relationship ALTER COLUMN name SET DEFAULT nextval('public.universal_relationship_name_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Cygnus A', 'A double galaxy. The most powerful cosmic source of radio waves known currently.', NULL, 6, 'Double Galaxy', false, true);
INSERT INTO public.galaxy VALUES ('Milky Way', 'A large spiral system. Consists of several hundred-billion stars, one of which is the Sun.', 13610.0, 4, 'Large Spiral', false, true);
INSERT INTO public.galaxy VALUES ('Andromeda', 'Great spiral galaxy, the nearest large galaxy. It is one of the few visible to the naked eye.', 10010.0, 3, 'Great Spiral', false, true);
INSERT INTO public.galaxy VALUES ('Virgo A', 'A giant elliptical galaxy whose nucleus contains a black hole. The first ever black hole to be directly imaged.', 5000.0, 5, 'Giant Elliptical', false, true);
INSERT INTO public.galaxy VALUES ('Canis Major Dwarf', 'A part of the same group as the Milky Way. Discovered in 2003, the closest galaxy to the Milky Way.', 850.0, 7, 'Irregular Dwarf', false, true);
INSERT INTO public.galaxy VALUES ('Magellanic Clouds', 'An irregular galaxy that shares a gaseous envelope. Visible to the naked eye in the south hemisphere but not the north.', 1101.0, 8, 'Irregular', false, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 5, 'Phobos', 'Largest of Mars moons', NULL, true, 4603.0);
INSERT INTO public.moon VALUES (3, 5, 'Deimos', 'Smallest of Mars moons', NULL, false, 4603.0);
INSERT INTO public.moon VALUES (4, 6, 'Europa', 'Smallest of Jupiters Galilean moons', NULL, true, 4603.0);
INSERT INTO public.moon VALUES (5, 6, 'Io', 'Third Largest of Jupiters Galilean moons', NULL, true, 4603.0);
INSERT INTO public.moon VALUES (6, 6, 'Ganymede', 'Largest of Jupiters Galilean moons', NULL, true, 4603.0);
INSERT INTO public.moon VALUES (7, 6, 'Callisto', 'Second largest of Jupiters Galilean moons', NULL, true, 4603.0);
INSERT INTO public.moon VALUES (8, 6, 'Jupiter LXI', 'One of Jupiters satellite moons', NULL, true, 4603.0);
INSERT INTO public.moon VALUES (9, 6, 'Amalthea', 'One of Jupiters largest non-Galilean moons', NULL, false, 4603.0);
INSERT INTO public.moon VALUES (10, 6, 'Himalia', 'One of Jupiters largest irregular satellites', NULL, false, 4603.0);
INSERT INTO public.moon VALUES (11, 6, 'Adrastea', 'One of Jupiters smallest satellites', NULL, false, 4603.0);
INSERT INTO public.moon VALUES (12, 7, 'Titan', 'Second largest moon in the solar system', NULL, true, 4503.0);
INSERT INTO public.moon VALUES (13, 7, 'Enceladus', 'Named after a giant in Greek mythology', NULL, true, 4503.0);
INSERT INTO public.moon VALUES (14, 7, 'Hyperion', 'Has a chaotic rotation and unexplained appearance', NULL, false, 4503.0);
INSERT INTO public.moon VALUES (15, 8, 'Titania', 'Largest moon of Uranus and eighth largest moon in Solar System', NULL, true, 4503.0);
INSERT INTO public.moon VALUES (16, 8, 'Oberon', 'Outermost moon of Uranus', NULL, true, 4503.0);
INSERT INTO public.moon VALUES (17, 9, 'Triton', 'Only large moon with retrograde orbit', NULL, true, 4503.0);
INSERT INTO public.moon VALUES (18, 9, 'Despina', 'Third closest inner moon of Neptune', NULL, false, 4503.0);
INSERT INTO public.moon VALUES (19, 9, 'Larissa', 'Fifth closest inner satellite of Neptune', NULL, false, 4503.0);
INSERT INTO public.moon VALUES (20, 8, 'Sycorax', 'Largest irregulare satellite of Uranus', NULL, false, 4503.0);
INSERT INTO public.moon VALUES (1, 4, 'Moon', 'The Earths moon', NULL, true, 4530.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (2, NULL, 'First from sun and smallest planet', true, true, 4503.0, 'terrestrial', NULL, NULL, 'Mercury');
INSERT INTO public.planet VALUES (3, NULL, 'Second from sun with densest atmosphere', true, true, 4503.0, 'rocky', NULL, NULL, 'Venus');
INSERT INTO public.planet VALUES (4, NULL, 'Third from sun and sustains liquid surface water', true, true, 4543.0, 'ocean world', NULL, NULL, 'Earth');
INSERT INTO public.planet VALUES (5, NULL, 'Fourth from sun and nicknamed the red planet', true, true, 4603.0, 'terrestrial', NULL, NULL, 'Mars');
INSERT INTO public.planet VALUES (6, NULL, 'Fifth from sun and the largest planet', true, true, 4603.0, 'gas giant', NULL, NULL, 'Jupiter');
INSERT INTO public.planet VALUES (7, NULL, 'Sixth from sun and has the most prominent rings', true, true, 4503.0, 'gas giant', NULL, NULL, 'Saturn');
INSERT INTO public.planet VALUES (8, NULL, 'Seventh from sun and is mostly made of astronomical ice', true, true, 4503.0, 'gas giant', NULL, NULL, 'Uranus');
INSERT INTO public.planet VALUES (9, NULL, 'Eighth from sun and is the densest gas giant', true, true, 4503.0, 'gas giant', NULL, NULL, 'Neptune');
INSERT INTO public.planet VALUES (10, NULL, 'Evil celestial being that planned to terraform the world', true, true, 1400.0, 'extraterrestrial', NULL, NULL, 'Ego');
INSERT INTO public.planet VALUES (11, NULL, 'Home of the Vogons, the bureaucrats of space', true, false, 2200.0, 'extraterrestrial', NULL, NULL, 'Vogsphere');
INSERT INTO public.planet VALUES (12, NULL, 'Home of the LOTR, under the supreme being Eru Iluvatar', true, true, 4300.0, 'terrestrial', NULL, NULL, 'Arda');
INSERT INTO public.planet VALUES (14, NULL, 'Home of the Navi which people could acces using genetic alterations', true, false, 5300.0, 'extraterrestrial', NULL, NULL, 'Pandora');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 8, 'Canopus', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (2, 5, 'Spica', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (3, 6, 'Azelfafage', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 3, 'Alpheratz', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 7, 'Sirius', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 4, 'Sun', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: universal_relationship; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.universal_relationship VALUES (1, 4, 6, 4, 1, '1');
INSERT INTO public.universal_relationship VALUES (4, 4, 6, 2, NULL, '4');
INSERT INTO public.universal_relationship VALUES (5, 4, 6, 2, NULL, '5');
INSERT INTO public.universal_relationship VALUES (6, 4, 6, 5, 2, '6');
INSERT INTO public.universal_relationship VALUES (7, 4, 6, 5, 3, '7');
INSERT INTO public.universal_relationship VALUES (8, 4, 6, 6, 4, '8');
INSERT INTO public.universal_relationship VALUES (9, 4, 6, 6, 5, '9');
INSERT INTO public.universal_relationship VALUES (10, 4, 6, 6, 6, '10');
INSERT INTO public.universal_relationship VALUES (11, 4, 6, 6, 7, '11');
INSERT INTO public.universal_relationship VALUES (12, 4, 6, 6, 8, '12');
INSERT INTO public.universal_relationship VALUES (13, 4, 6, 6, 8, '13');
INSERT INTO public.universal_relationship VALUES (14, 4, 6, 6, 9, '14');
INSERT INTO public.universal_relationship VALUES (15, 4, 6, 6, 10, '15');
INSERT INTO public.universal_relationship VALUES (16, 4, 6, 6, 11, '16');
INSERT INTO public.universal_relationship VALUES (17, 4, 6, 7, 12, '17');
INSERT INTO public.universal_relationship VALUES (18, 4, 6, 7, 13, '18');
INSERT INTO public.universal_relationship VALUES (19, 4, 6, 7, 14, '19');
INSERT INTO public.universal_relationship VALUES (20, 4, 6, 8, 15, '20');
INSERT INTO public.universal_relationship VALUES (21, 4, 6, 8, 16, '21');
INSERT INTO public.universal_relationship VALUES (22, 4, 6, 8, 20, '22');
INSERT INTO public.universal_relationship VALUES (23, 4, 6, 9, 17, '23');
INSERT INTO public.universal_relationship VALUES (24, 4, 6, 9, 17, '24');
INSERT INTO public.universal_relationship VALUES (25, 4, 6, 9, 18, '25');
INSERT INTO public.universal_relationship VALUES (26, 4, 6, 9, 19, '26');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: universal_relationship_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universal_relationship_name_seq', 26, true);


--
-- Name: universal_relationship_universal_relationship_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.universal_relationship_universal_relationship_id_seq', 26, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: universal_relationship universal_relationship_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universal_relationship
    ADD CONSTRAINT universal_relationship_pkey PRIMARY KEY (universal_relationship_id);


--
-- Name: galaxy uq_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT uq_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon uq_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT uq_moon_id UNIQUE (moon_id);


--
-- Name: planet uq_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT uq_planet_id UNIQUE (planet_id);


--
-- Name: star uq_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT uq_star_id UNIQUE (star_id);


--
-- Name: universal_relationship uq_universal_relationship_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universal_relationship
    ADD CONSTRAINT uq_universal_relationship_id UNIQUE (universal_relationship_id);


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
-- Name: universal_relationship universal_relationship_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universal_relationship
    ADD CONSTRAINT universal_relationship_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: universal_relationship universal_relationship_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universal_relationship
    ADD CONSTRAINT universal_relationship_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: universal_relationship universal_relationship_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universal_relationship
    ADD CONSTRAINT universal_relationship_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: universal_relationship universal_relationship_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.universal_relationship
    ADD CONSTRAINT universal_relationship_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

