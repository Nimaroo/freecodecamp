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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planets integer,
    stars integer,
    moons integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: martian; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.martian (
    martian_id integer NOT NULL,
    name character varying(30) NOT NULL,
    race character varying(30)
);


ALTER TABLE public.martian OWNER TO freecodecamp;

--
-- Name: martian_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.martian_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.martian_id_seq OWNER TO freecodecamp;

--
-- Name: martian_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.martian_id_seq OWNED BY public.martian.martian_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    color text,
    craters integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    radius numeric(7,2),
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    is_hot boolean,
    galaxy_id integer NOT NULL,
    age integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: martian martian_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.martian ALTER COLUMN martian_id SET DEFAULT nextval('public.martian_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 5, 100, 15);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 8, 200, 30);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 3, 50, 8);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 7, 120, 20);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 4, 80, 10);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 6, 140, 25);
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 2, 70, 12);
INSERT INTO public.galaxy VALUES (8, 'Antennae', 3, 60, 18);
INSERT INTO public.galaxy VALUES (9, 'Black Eye', 6, 110, 22);
INSERT INTO public.galaxy VALUES (10, 'Virgo', 9, 180, 35);
INSERT INTO public.galaxy VALUES (11, 'Cartwheel', 5, 90, 16);
INSERT INTO public.galaxy VALUES (12, 'Cigar', 4, 75, 14);
INSERT INTO public.galaxy VALUES (13, 'Sculptor', 2, 50, 6);
INSERT INTO public.galaxy VALUES (14, 'Tadpole', 7, 160, 28);
INSERT INTO public.galaxy VALUES (15, 'Fornax', 3, 65, 10);
INSERT INTO public.galaxy VALUES (16, 'Cetus', 4, 85, 13);
INSERT INTO public.galaxy VALUES (17, 'Phoenix', 5, 95, 19);
INSERT INTO public.galaxy VALUES (18, 'Eridanus', 6, 130, 24);
INSERT INTO public.galaxy VALUES (19, 'Coma', 2, 40, 8);
INSERT INTO public.galaxy VALUES (20, 'Canes Venatici', 3, 55, 12);


--
-- Data for Name: martian; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.martian VALUES (1, 'Zarnok', 'Thrakian');
INSERT INTO public.martian VALUES (2, 'Xara', 'Vondari');
INSERT INTO public.martian VALUES (3, 'Koltan', 'Rezar');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'grey', 300000, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'brown', 200, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'dark grey', 50, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'yellow', 1000, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'white', 200, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'brown', 500, 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 'grey', 700, 5);
INSERT INTO public.moon VALUES (8, 'Titan', 'orange', 300, 6);
INSERT INTO public.moon VALUES (9, 'Rhea', 'grey', 600, 6);
INSERT INTO public.moon VALUES (10, 'Enceladus', 'white', 150, 6);
INSERT INTO public.moon VALUES (11, 'Triton', 'blue', 400, 8);
INSERT INTO public.moon VALUES (12, 'Miranda', 'grey', 80, 7);
INSERT INTO public.moon VALUES (13, 'Ariel', 'white', 120, 7);
INSERT INTO public.moon VALUES (14, 'Umbriel', 'dark grey', 150, 7);
INSERT INTO public.moon VALUES (15, 'Titania', 'light grey', 250, 7);
INSERT INTO public.moon VALUES (16, 'Oberon', 'dark grey', 220, 7);
INSERT INTO public.moon VALUES (17, 'Iapetus', 'black and white', 180, 6);
INSERT INTO public.moon VALUES (18, 'Mimas', 'grey', 130, 6);
INSERT INTO public.moon VALUES (19, 'Enceladus', 'blue', 200, 6);
INSERT INTO public.moon VALUES (20, 'Charon', 'grey', 350, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 2439.70, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 6051.80, false, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 6371.00, true, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 3389.50, false, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 69911.00, false, 5);
INSERT INTO public.planet VALUES (6, 'Saturn', 58232.00, false, 6);
INSERT INTO public.planet VALUES (7, 'Uranus', 25362.00, false, 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 24622.00, false, 8);
INSERT INTO public.planet VALUES (9, 'Pluto', 1188.30, false, 9);
INSERT INTO public.planet VALUES (10, 'Ceres', 473.00, false, 10);
INSERT INTO public.planet VALUES (11, 'Haumea', 816.00, false, 11);
INSERT INTO public.planet VALUES (12, 'Makemake', 715.00, false, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Nadia', true, 1, 32);
INSERT INTO public.star VALUES (2, 'Ari', false, 2, 25);
INSERT INTO public.star VALUES (3, 'Maite', true, 3, 40);
INSERT INTO public.star VALUES (4, 'Pere', false, 4, 29);
INSERT INTO public.star VALUES (5, 'Edgar', true, 5, 35);
INSERT INTO public.star VALUES (6, 'Jose', false, 6, 45);
INSERT INTO public.star VALUES (7, 'Luis', true, 7, 50);
INSERT INTO public.star VALUES (8, 'Ana', false, 8, 26);
INSERT INTO public.star VALUES (9, 'Juan', true, 9, 37);
INSERT INTO public.star VALUES (10, 'Sofia', false, 10, 28);
INSERT INTO public.star VALUES (11, 'Mario', true, 11, 33);
INSERT INTO public.star VALUES (12, 'Paula', false, 12, 31);
INSERT INTO public.star VALUES (13, 'Raúl', true, 13, 41);
INSERT INTO public.star VALUES (14, 'Silvia', false, 14, 38);
INSERT INTO public.star VALUES (15, 'Victor', true, 15, 48);
INSERT INTO public.star VALUES (16, 'Laura', false, 16, 34);
INSERT INTO public.star VALUES (17, 'Jorge', true, 17, 43);
INSERT INTO public.star VALUES (18, 'Carla', false, 18, 30);
INSERT INTO public.star VALUES (19, 'Daniel', true, 19, 52);
INSERT INTO public.star VALUES (20, 'Pablo', false, 20, 24);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 26, true);


--
-- Name: martian_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.martian_id_seq', 3, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 16, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 16, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 6, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 34, true);


--
-- Name: galaxy galaxy_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_unique UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: martian martian_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.martian
    ADD CONSTRAINT martian_id_unique UNIQUE (martian_id);


--
-- Name: martian martian_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.martian
    ADD CONSTRAINT martian_pkey PRIMARY KEY (martian_id);


--
-- Name: moon moon_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_unique UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_unique UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_unique UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star galaxy_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

