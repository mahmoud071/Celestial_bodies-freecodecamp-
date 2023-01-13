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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,3),
    galaxy_type character varying(30),
    distance_from_earth_in_light_years integer
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
    name character varying(30) NOT NULL,
    description text,
    age_in_millions_of_years numeric(10,3),
    distance_from_earth_in_light_years integer,
    moon_id integer NOT NULL,
    planet_id integer
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
    description text,
    age_in_millions_of_years numeric(10,3),
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    is_spherical boolean,
    has_life boolean
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_moon (
    planet_id integer,
    name character varying(30) NOT NULL,
    moon character varying(30) NOT NULL,
    planet_moon_id integer NOT NULL
);


ALTER TABLE public.planet_moon OWNER TO freecodecamp;

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
    description text,
    age_in_millions_of_years numeric(10,3),
    distance_from_earth_in_light_years integer,
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer
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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'milkey way', 'the galaxy we live within its arm', 13.141, 'barred sprial', 12);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now. The two will eventually merge into a single new galaxy called Milkdromeda.', 15.412, 'spiral', 20);
INSERT INTO public.galaxy VALUES (3, 'Antennae', 'are a pair of interacting galaxies in the constellation Corvus. They are currently going through a starburst phase, in which the collision of clouds of gas and dust, with entangled magnetic fields, causes rapid star formation', 9.125, 'antennae', 65);
INSERT INTO public.galaxy VALUES (4, 'Backward Galaxy', 'It appears to rotate backwards, as the tips of the spiral arms point in the direction of rotation.', 15.754, 'spiral', 740);
INSERT INTO public.galaxy VALUES (5, 'Black Eye Galaxy', 'It has a spectacular dark band of absorbing dust in front of the galaxy"s bright nucleus, giving rise to its nicknames of the Black Eye or Evil Eye galaxy.', 26.123, 'barred spiral', 17);
INSERT INTO public.galaxy VALUES (6, 'Cigar Galaxy', 'Appears similar in shape to a cigar.', 7.153, 'uncommon shape', 12);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Solu-Medrol', 'Eating disorder NEC', 81.287, 103, 247, 150);
INSERT INTO public.moon VALUES ('Hydroxychloroquine Sulfate', 'Transfusion of Autologous WBC into Periph Art, Perc Approach', 21.448, 21, 17, 21);
INSERT INTO public.moon VALUES ('Cold-EEZE', 'Mv traff acc NEC-driver', 76.592, 118, 262, 48);
INSERT INTO public.moon VALUES ('Pravastatin Sodium', 'Removal of Int Fix from R Metacarpophal Jt, Perc Approach', 74.982, 24, 19, 24);
INSERT INTO public.moon VALUES ('Prednisone', 'Beam Radiation of Axillary Lymphatics using Photons >10 MeV', 6.233, 25, 20, 25);
INSERT INTO public.moon VALUES ('Bikini Zone Medicated CREME', 'Excision of Trochlear Nerve, Percutaneous Approach, Diagn', 90.654, 46, 39, 46);
INSERT INTO public.moon VALUES ('Xylocaine', 'Reattachment of Ileum, Open Approach', 56.647, 48, 41, 48);
INSERT INTO public.moon VALUES ('Face and Body Sunscreen SPF 35', 'Drainage of Right Carpal Joint, Open Approach', 53.840, 49, 42, 49);
INSERT INTO public.moon VALUES ('Orange', 'Insertion of Monopln Ext Fix into R Low Femur, Perc Approach', 82.392, 50, 43, 50);
INSERT INTO public.moon VALUES ('OXYGEN', 'Drainage of Right Brachial Artery, Percutaneous Approach', 41.181, 51, 44, 51);
INSERT INTO public.moon VALUES ('EUPHRASIA OFFICINALIS', 'Hyperpotassemia', 98.691, 146, 284, 48);
INSERT INTO public.moon VALUES ('ADVAIR', 'Ca in situ bladder', 94.394, 151, 288, 50);
INSERT INTO public.moon VALUES ('Bystolic', 'Myl sarcoma wo achv rmsn', 55.123, 157, 292, 149);
INSERT INTO public.moon VALUES ('Eurax', 'Portal hypertension', 87.393, 167, 299, 25);
INSERT INTO public.moon VALUES ('HYDRALAZINE HYDROCHLORIDE', 'Quads w fetal loss-ante', 95.308, 182, 311, 146);
INSERT INTO public.moon VALUES ('Eszopiclone', 'Margin zone lym pelvic', 26.701, 187, 315, 46);
INSERT INTO public.moon VALUES ('nicotine', 'Cachexia', 63.190, 208, 335, 50);
INSERT INTO public.moon VALUES ('GloStrips', 'Spina bifida occulta', 43.144, 244, 365, 150);
INSERT INTO public.moon VALUES ('Promethazine hydrochloride', 'Hard tiss dis teeth NOS', 30.451, 247, 367, 146);
INSERT INTO public.moon VALUES ('OxyContin', 'Syst/diast hrt fail NOS', 24.211, 251, 371, 46);
INSERT INTO public.moon VALUES ('Glipizide', 'Detachment at Right Shoulder Region, Open Approach', 67.120, 148, 123, 148);
INSERT INTO public.moon VALUES ('Noble Lion Medicated Balm', 'Excision of Cervical Nerve, Perc Endo Approach, Diagn', 82.751, 149, 124, 149);
INSERT INTO public.moon VALUES ('Desipramine Hydrochloride', 'Release Right Toe Phalangeal Joint, Open Approach', 98.937, 150, 125, 150);
INSERT INTO public.moon VALUES ('AVALIDE', 'Revision of Autol Sub in Low Art, Open Approach', 22.540, 151, 126, 151);
INSERT INTO public.moon VALUES ('Atomoxetine Hydrochloride', 'Supplement L Post Tib Art with Autol Sub, Perc Endo Approach', 48.363, 152, 127, 152);
INSERT INTO public.moon VALUES ('Minipress', 'Contusion of forearm', 28.820, 282, 398, 48);
INSERT INTO public.moon VALUES ('Salsalate', 'Rickettsioses NEC', 88.216, 296, 410, 21);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Replacement of Right Cornea with Autol Sub, Perc Approach', 54.199, 21, 'Largeleaf Pennywort', 21, false, false);
INSERT INTO public.planet VALUES ('Removal of Packing Material on Left Upper Extremity', 52.714, 146, 'Wild Bushbean', 21, false, false);
INSERT INTO public.planet VALUES ('Repair Gastric Vein, Percutaneous Endoscopic Approach', 148.486, 23, 'Coltsfoot', 23, true, true);
INSERT INTO public.planet VALUES ('HDR Brachytherapy of Gallbladder using Iodine 125', 79.025, 24, 'Schisandra', 24, true, false);
INSERT INTO public.planet VALUES ('Removal of Infusion Device from Urethra, Endo', 140.705, 25, 'Pyxine Lichen', 25, true, true);
INSERT INTO public.planet VALUES ('Reattachment of R Trunk Bursa/Lig, Perc Endo Approach', 106.645, 148, 'Smallpetal Cinquefoil', 23, false, false);
INSERT INTO public.planet VALUES ('Transplantation of Pancreas, Allogeneic, Open Approach', 69.002, 149, 'Red Wattle', 24, false, true);
INSERT INTO public.planet VALUES ('Revision of Spacer in Coccygeal Joint, Open Approach', 67.789, 150, 'Silky Lupine', 25, true, true);
INSERT INTO public.planet VALUES ('Radiation Therapy, Lymph & Hemat Sys, Beam Radiation', 54.583, 151, 'Leskea Moss', 26, false, true);
INSERT INTO public.planet VALUES ('Revision of Ext Fix in R Carpal, Perc Approach', 144.300, 152, 'Pineland False Sunflower', 27, false, false);
INSERT INTO public.planet VALUES ('Removal of Drain Dev from R Sternoclav Jt, Perc Approach', 80.239, 46, 'Obovate Andreaea Moss', 21, true, true);
INSERT INTO public.planet VALUES ('Drainage of Acoustic Nerve, Perc Endo Approach, Diagn', 122.574, 48, 'Japanese Flowering Crab Apple', 23, true, true);
INSERT INTO public.planet VALUES ('Plain Radiography of R Pulm Vein using L Osm Contrast', 71.947, 49, 'Dwarf Crabgrass', 24, false, true);
INSERT INTO public.planet VALUES ('Replacement of Upper Gingiva with Nonaut Sub, Perc Approach', 86.899, 50, 'Guayanilla', 25, true, true);
INSERT INTO public.planet VALUES ('Fusion of Thor Jt, Post Appr A Col, Perc Approach', 68.190, 51, 'Broadleaf Rosette Grass', 26, true, true);
INSERT INTO public.planet VALUES ('Excision of Left External Jugular Vein, Perc Approach', 66.600, 52, 'Bolander''s Reedgrass', 27, true, false);


--
-- Data for Name: planet_moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_moon VALUES (150, 'Silky Lupine', 'Solu-Medrol', 247);
INSERT INTO public.planet_moon VALUES (21, 'Largeleaf Pennywort', 'Hydroxychloroquine Sulfate', 17);
INSERT INTO public.planet_moon VALUES (48, 'Japanese Flowering Crab Apple', 'Cold-EEZE', 262);
INSERT INTO public.planet_moon VALUES (24, 'Schisandra', 'Pravastatin Sodium', 19);
INSERT INTO public.planet_moon VALUES (46, 'Obovate Andreaea Moss', 'Bikini Zone Medicated CREME', 39);
INSERT INTO public.planet_moon VALUES (48, 'Japanese Flowering Crab Apple', 'Xylocaine', 41);
INSERT INTO public.planet_moon VALUES (49, 'Dwarf Crabgrass', 'Face and Body Sunscreen SPF 35', 42);
INSERT INTO public.planet_moon VALUES (50, 'Guayanilla', 'Orange', 43);
INSERT INTO public.planet_moon VALUES (51, 'Broadleaf Rosette Grass', 'OXYGEN', 44);
INSERT INTO public.planet_moon VALUES (48, 'Japanese Flowering Crab Apple', 'EUPHRASIA OFFICINALIS', 284);
INSERT INTO public.planet_moon VALUES (50, 'Guayanilla', 'ADVAIR', 288);
INSERT INTO public.planet_moon VALUES (149, 'Red Wattle', 'Bystolic', 292);
INSERT INTO public.planet_moon VALUES (146, 'Wild Bushbean', 'HYDRALAZINE HYDROCHLORIDE', 311);
INSERT INTO public.planet_moon VALUES (46, 'Obovate Andreaea Moss', 'Eszopiclone', 315);
INSERT INTO public.planet_moon VALUES (50, 'Guayanilla', 'nicotine', 335);
INSERT INTO public.planet_moon VALUES (150, 'Silky Lupine', 'GloStrips', 365);
INSERT INTO public.planet_moon VALUES (146, 'Wild Bushbean', 'Promethazine hydrochloride', 367);
INSERT INTO public.planet_moon VALUES (46, 'Obovate Andreaea Moss', 'OxyContin', 371);
INSERT INTO public.planet_moon VALUES (148, 'Smallpetal Cinquefoil', 'Glipizide', 123);
INSERT INTO public.planet_moon VALUES (149, 'Red Wattle', 'Noble Lion Medicated Balm', 124);
INSERT INTO public.planet_moon VALUES (150, 'Silky Lupine', 'Desipramine Hydrochloride', 125);
INSERT INTO public.planet_moon VALUES (151, 'Leskea Moss', 'AVALIDE', 126);
INSERT INTO public.planet_moon VALUES (152, 'Pineland False Sunflower', 'Atomoxetine Hydrochloride', 127);
INSERT INTO public.planet_moon VALUES (48, 'Japanese Flowering Crab Apple', 'Minipress', 398);
INSERT INTO public.planet_moon VALUES (21, 'Largeleaf Pennywort', 'Salsalate', 410);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('center of our solar system', 13.000, 1, 21, 'Sun', 1);
INSERT INTO public.star VALUES ('bright star in our galaxy', 7.000, 8, 23, 'Sirius', 1);
INSERT INTO public.star VALUES ('bright star in that galaxy', 6.000, 13, 24, 'Canopus', 2);
INSERT INTO public.star VALUES ('brightest star in that galaxy', 6.000, 13, 25, 'Rigil Kentaurus and Toliman', 2);
INSERT INTO public.star VALUES ('brightest star in that galaxy', 6.000, 13, 26, 'RArcturus', 3);
INSERT INTO public.star VALUES ('dying  star in that galaxy', 26.000, 18, 27, 'Vega', 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 413, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 325, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 27, true);


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
-- Name: planet_moon planet_id_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT planet_id_pk UNIQUE (moon);


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
-- Name: planet_moon pm_pk; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_moon
    ADD CONSTRAINT pm_pk PRIMARY KEY (planet_moon_id);


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
-- Name: star galaxy_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

