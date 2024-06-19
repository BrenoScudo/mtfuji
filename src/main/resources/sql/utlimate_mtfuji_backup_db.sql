--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-19 20:26:44 UTC

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

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 215 (class 1259 OID 33735)
-- Name: account; Type: TABLE; Schema: public; Owner: postgresMaster
--

CREATE TABLE public.account (
    id bigint NOT NULL,
    firstname character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    age bigint NOT NULL,
    email character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    fidelity_card boolean DEFAULT false NOT NULL,
    password character varying(255) NOT NULL,
    CONSTRAINT email_check CHECK ((((email)::text ~~ '%@gmail.com'::text) OR ((email)::text ~~ '%@yahoo.it'::text) OR ((email)::text ~~ '%@outlook.it'::text) OR ((email)::text ~~ '%@email.com'::text) OR ((email)::text ~~ '%@alice.it'::text)))
);


ALTER TABLE public.account OWNER TO "postgresMaster";

--
-- TOC entry 216 (class 1259 OID 33741)
-- Name: beverage; Type: TABLE; Schema: public; Owner: postgresMaster
--

CREATE TABLE public.beverage (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    cost numeric NOT NULL,
    complimentary boolean DEFAULT false NOT NULL,
    description character varying(255) NOT NULL,
    alcoholic boolean DEFAULT false NOT NULL,
    image_name character varying(255)
);


ALTER TABLE public.beverage OWNER TO "postgresMaster";

--
-- TOC entry 217 (class 1259 OID 33748)
-- Name: beverage_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresMaster
--

CREATE SEQUENCE public.beverage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.beverage_id_seq OWNER TO "postgresMaster";

--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 217
-- Name: beverage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresMaster
--

ALTER SEQUENCE public.beverage_id_seq OWNED BY public.beverage.id;


--
-- TOC entry 218 (class 1259 OID 33749)
-- Name: booking; Type: TABLE; Schema: public; Owner: postgresMaster
--

CREATE TABLE public.booking (
    id bigint NOT NULL,
    id_user bigint NOT NULL,
    quantity bigint DEFAULT 1 NOT NULL,
    check_in timestamp(5) without time zone NOT NULL,
    check_out timestamp(5) without time zone NOT NULL,
    reservation_date timestamp(5) without time zone NOT NULL,
    id_room bigint NOT NULL,
    paid boolean DEFAULT false,
    cost numeric NOT NULL,
    is_promotion boolean DEFAULT false NOT NULL
);


ALTER TABLE public.booking OWNER TO "postgresMaster";

--
-- TOC entry 219 (class 1259 OID 33757)
-- Name: booking_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresMaster
--

CREATE SEQUENCE public.booking_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.booking_id_seq OWNER TO "postgresMaster";

--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 219
-- Name: booking_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresMaster
--

ALTER SEQUENCE public.booking_id_seq OWNED BY public.booking.id;


--
-- TOC entry 220 (class 1259 OID 33758)
-- Name: film; Type: TABLE; Schema: public; Owner: postgresMaster
--

CREATE TABLE public.film (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    genre character varying(255) NOT NULL,
    duration bigint NOT NULL,
    marathon boolean DEFAULT false,
    image_name character varying(255)
);


ALTER TABLE public.film OWNER TO "postgresMaster";

--
-- TOC entry 221 (class 1259 OID 33764)
-- Name: film_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresMaster
--

CREATE SEQUENCE public.film_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.film_id_seq OWNER TO "postgresMaster";

--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 221
-- Name: film_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresMaster
--

ALTER SEQUENCE public.film_id_seq OWNED BY public.film.id;


--
-- TOC entry 222 (class 1259 OID 33765)
-- Name: food; Type: TABLE; Schema: public; Owner: postgresMaster
--

CREATE TABLE public.food (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    cost numeric NOT NULL,
    type character varying(255) NOT NULL,
    complimentary boolean DEFAULT false NOT NULL,
    vegan boolean DEFAULT false NOT NULL,
    gluten_free boolean DEFAULT false NOT NULL,
    description character varying(255) NOT NULL,
    image_name character varying(255)
);


ALTER TABLE public.food OWNER TO "postgresMaster";

--
-- TOC entry 223 (class 1259 OID 33773)
-- Name: food_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresMaster
--

CREATE SEQUENCE public.food_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.food_id_seq OWNER TO "postgresMaster";

--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 223
-- Name: food_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresMaster
--

ALTER SEQUENCE public.food_id_seq OWNED BY public.food.id;


--
-- TOC entry 224 (class 1259 OID 33774)
-- Name: karaoke; Type: TABLE; Schema: public; Owner: postgresMaster
--

CREATE TABLE public.karaoke (
    id bigint NOT NULL,
    title character varying(255) NOT NULL,
    genre character varying(255) NOT NULL,
    singer character varying(255) NOT NULL
);


ALTER TABLE public.karaoke OWNER TO "postgresMaster";

--
-- TOC entry 225 (class 1259 OID 33779)
-- Name: karaoke_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresMaster
--

CREATE SEQUENCE public.karaoke_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.karaoke_id_seq OWNER TO "postgresMaster";

--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 225
-- Name: karaoke_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresMaster
--

ALTER SEQUENCE public.karaoke_id_seq OWNED BY public.karaoke.id;


--
-- TOC entry 226 (class 1259 OID 33780)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgresMaster
--

CREATE TABLE public.orders (
    id bigint NOT NULL,
    id_booking bigint NOT NULL,
    id_food bigint,
    id_beverage bigint,
    quantity bigint DEFAULT 1 NOT NULL
);


ALTER TABLE public.orders OWNER TO "postgresMaster";

--
-- TOC entry 227 (class 1259 OID 33784)
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresMaster
--

CREATE SEQUENCE public.orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_id_seq OWNER TO "postgresMaster";

--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 227
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresMaster
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- TOC entry 228 (class 1259 OID 33785)
-- Name: prices; Type: TABLE; Schema: public; Owner: postgresMaster
--

CREATE TABLE public.prices (
    id bigint NOT NULL,
    id_room bigint NOT NULL,
    cost numeric NOT NULL,
    num_people integer NOT NULL
);


ALTER TABLE public.prices OWNER TO "postgresMaster";

--
-- TOC entry 229 (class 1259 OID 33790)
-- Name: prices_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresMaster
--

CREATE SEQUENCE public.prices_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.prices_id_seq OWNER TO "postgresMaster";

--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 229
-- Name: prices_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresMaster
--

ALTER SEQUENCE public.prices_id_seq OWNED BY public.prices.id;


--
-- TOC entry 230 (class 1259 OID 33791)
-- Name: room; Type: TABLE; Schema: public; Owner: postgresMaster
--

CREATE TABLE public.room (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    max_occupancy integer NOT NULL,
    luxury boolean DEFAULT false,
    cost numeric DEFAULT 10 NOT NULL,
    image_name character varying(256)
);


ALTER TABLE public.room OWNER TO "postgresMaster";

--
-- TOC entry 231 (class 1259 OID 33795)
-- Name: room_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresMaster
--

CREATE SEQUENCE public.room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.room_id_seq OWNER TO "postgresMaster";

--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 231
-- Name: room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresMaster
--

ALTER SEQUENCE public.room_id_seq OWNED BY public.room.id;


--
-- TOC entry 232 (class 1259 OID 33796)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgresMaster
--

CREATE SEQUENCE public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_id_seq OWNER TO "postgresMaster";

--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgresMaster
--

ALTER SEQUENCE public.user_id_seq OWNED BY public.account.id;


--
-- TOC entry 3243 (class 2604 OID 33797)
-- Name: account id; Type: DEFAULT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.account ALTER COLUMN id SET DEFAULT nextval('public.user_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 33798)
-- Name: beverage id; Type: DEFAULT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.beverage ALTER COLUMN id SET DEFAULT nextval('public.beverage_id_seq'::regclass);


--
-- TOC entry 3248 (class 2604 OID 33799)
-- Name: booking id; Type: DEFAULT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.booking ALTER COLUMN id SET DEFAULT nextval('public.booking_id_seq'::regclass);


--
-- TOC entry 3252 (class 2604 OID 33800)
-- Name: film id; Type: DEFAULT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.film ALTER COLUMN id SET DEFAULT nextval('public.film_id_seq'::regclass);


--
-- TOC entry 3254 (class 2604 OID 33801)
-- Name: food id; Type: DEFAULT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.food ALTER COLUMN id SET DEFAULT nextval('public.food_id_seq'::regclass);


--
-- TOC entry 3258 (class 2604 OID 33802)
-- Name: karaoke id; Type: DEFAULT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.karaoke ALTER COLUMN id SET DEFAULT nextval('public.karaoke_id_seq'::regclass);


--
-- TOC entry 3259 (class 2604 OID 33803)
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- TOC entry 3261 (class 2604 OID 33804)
-- Name: prices id; Type: DEFAULT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.prices ALTER COLUMN id SET DEFAULT nextval('public.prices_id_seq'::regclass);


--
-- TOC entry 3262 (class 2604 OID 33805)
-- Name: room id; Type: DEFAULT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.room ALTER COLUMN id SET DEFAULT nextval('public.room_id_seq'::regclass);


--
-- TOC entry 3436 (class 0 OID 33735)
-- Dependencies: 215
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--

INSERT INTO public.account VALUES (4, 'Ciuccio', 'Cretino', 29, 'miao@gmail.com', 'via roma', true, '$2a$12$1aDAHlQXGsWTzMa2cMgCwOA1r9.OIaC7B7geQG2uQTuV99pOjCGji');
INSERT INTO public.account VALUES (7, 'Gino', 'Pasticcino', 28, 'gino@email.com', 'ejwvuiowhnion', true, '$2a$12$bXgubQ2Kx5001lJIVFhrN.MFn6WoosKTxg78sfxb2zc/hC4ii1wZa');
INSERT INTO public.account VALUES (5, 'ewhvhwh', 'evwnjniw', 27, 'venwjneviuwn@alice.it', 'wecvnjnwinv', false, '$2a$12$R7c.c4ahyY/9flHBFXo8T.3QcBfa9q4GXLg36Np0KsJpX0WhIVna6');
INSERT INTO public.account VALUES (6, 'ewinvinw', ' wekj vckjw', 65, 'uwefhuhwuihfui@email.com', 'ejwojfiowej', true, '$2a$12$xD/qnWYOnOgq9sCupb72PedTlO3BX1soakquFpNBKPF44Ragh396.');
INSERT INTO public.account VALUES (8, 'Gina', 'Gina', 19, 'Gina@gmail.com', 'Gina', false, '$2a$12$9FfOpskTF5yXhXNqkJmbx.YF0RPE4KpZm5RbAe7.Y/6uuXp45CSfC');
INSERT INTO public.account VALUES (9, 'Sonia', 'Mammone', 29, 'sonia.minho95@gmail.com', 'Via Agnonello 32/a', false, '$2a$12$jxno4WXqsw5FCbvjLrRoKOp9RyBiMkIjqyAPNIJnswnS064ILlHuW');


--
-- TOC entry 3437 (class 0 OID 33741)
-- Dependencies: 216
-- Data for Name: beverage; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--

INSERT INTO public.beverage VALUES (1, 'Coca-cola', 2.50, true, 'H2O, CO2', false, 'Coca_cola.png');
INSERT INTO public.beverage VALUES (2, 'Acqua', 1.00, true, 'H20', false, 'Acqua.png');
INSERT INTO public.beverage VALUES (3, 'Fanta', 2.50, true, 'H2O, CO2', false, 'Fanta.png');
INSERT INTO public.beverage VALUES (4, 'Ichnusa', 2.50, true, 'Luppolo', true, 'Ichnusa.png');
INSERT INTO public.beverage VALUES (5, 'Gassosa', 2.50, true, 'H2O,CO2', false, 'Gassosa.png');
INSERT INTO public.beverage VALUES (6, 'Tonica', 3, false, 'H2O,CO2', false, 'Tonica.png');
INSERT INTO public.beverage VALUES (7, 'RedBull', 3.50, false, 'H2O,CO2', false, 'Red_bull.png');
INSERT INTO public.beverage VALUES (8, 'Spremuta di frutta', 4, false, 'H2O, frutta di stagione', false, 'Spremuta_di_Frutta.png');
INSERT INTO public.beverage VALUES (9, 'Brogi Island', 7, false, '5 Bianchi + Barbatrucco', true, 'Brogi.island.png');
INSERT INTO public.beverage VALUES (10, 'Gin Tonic', 5, false, 'Gin Bombey + Tonica', true, 'Gin_tonic.png');
INSERT INTO public.beverage VALUES (11, 'Gin lemon', 5, false, 'Gin Bombey + Lemon soda', true, 'Gin_lemon.png');
INSERT INTO public.beverage VALUES (12, 'Pinha Colada', 5, false, 'Rum bianco + malibù + succo di ananas', true, 'Pina_colada.png');
INSERT INTO public.beverage VALUES (13, 'Negroni', 5, false, 'Gin + Vermouth rosso + Campari', true, 'Negroni.png');
INSERT INTO public.beverage VALUES (14, 'Spritz', 3, true, 'Gin + Vermouth rosso + Campari', true, 'Spritz.png');
INSERT INTO public.beverage VALUES (15, 'Rum Cola', 5, false, 'Rum + Coca-cola', true, 'Rum_cola.png');
INSERT INTO public.beverage VALUES (16, 'Asahi', 5, false, 'Luppolo', true, 'Asahi.png');
INSERT INTO public.beverage VALUES (17, 'Sapporo', 5, false, 'Luppolo', true, 'Sapporo.png');
INSERT INTO public.beverage VALUES (18, 'Heineken', 2.50, true, 'Cold Lager', true, 'Heineken.png');
INSERT INTO public.beverage VALUES (19, 'Peroni', 2.00, true, 'Luppolo', true, 'Peroni.png');
INSERT INTO public.beverage VALUES (20, 'Caffé', 1.20, false, 'Caffeine', false, 'Caffè.png');
INSERT INTO public.beverage VALUES (21, 'Acqua gassata', 2.50, true, 'H2O', false, 'Acqua_gassata.png');


--
-- TOC entry 3439 (class 0 OID 33749)
-- Dependencies: 218
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--



--
-- TOC entry 3441 (class 0 OID 33758)
-- Dependencies: 220
-- Data for Name: film; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--

INSERT INTO public.film VALUES (1, 'Il Padrino', 'Crime', 166, false, 'Il_padrino.png');
INSERT INTO public.film VALUES (2, 'Forrest Gump', 'Drama', 152, false, 'Forrest_gump.png');
INSERT INTO public.film VALUES (3, 'Inception', 'Sci-Fi', 148, false, 'Inception.png');
INSERT INTO public.film VALUES (6, 'Matrix', 'Action', 133, false, 'Matrix.png');
INSERT INTO public.film VALUES (7, 'La vita è bella', 'Drama', 116, false, 'La_vita_è_bella.png');
INSERT INTO public.film VALUES (8, 'Interstellar', 'Sci-Fi', 180, false, 'Interstellar.png');
INSERT INTO public.film VALUES (9, 'Lo squalo', 'Thriller', 124, false, 'Lo_squalo.png');
INSERT INTO public.film VALUES (10, 'Schindler''s List', 'Biography', 176, false, 'Schindlers _list.png');
INSERT INTO public.film VALUES (4, 'Pulp Fiction', 'Crime', 152, false, 'Pulp_fiction.png');
INSERT INTO public.film VALUES (5, ' La Compagnia dell''Anello', 'Fantasy', 170, false, 'Il_signore_degli_anelli_la_compagnia_dell_anello.png');
INSERT INTO public.film VALUES (11, 'Il principe abusivo', 'Commedia', 97, false, 'Il_principe_abusivo.png');
INSERT INTO public.film VALUES (12, 'Notte da leoni', 'Commedia', 100, false, 'Notte_da_leoni.png');
INSERT INTO public.film VALUES (14, 'La mummia', 'Avventura', 125, false, 'La_mummia.png');
INSERT INTO public.film VALUES (15, 'Il diavolo veste Prada', 'Commedia', 109, false, 'Il_diavolo_veste_prada.png');
INSERT INTO public.film VALUES (16, 'Fracchia la belva umana', 'Commedia', 104, false, 'Fracchia_la_belva_umana.png');
INSERT INTO public.film VALUES (17, '300', 'Azione', 117, false, '300.png');
INSERT INTO public.film VALUES (18, 'Nice Guys', 'Commedia', 116, false, 'Nice_guys.png');
INSERT INTO public.film VALUES (19, 'Dune', 'Fantascienza', 155, false, 'Dune.png');
INSERT INTO public.film VALUES (20, 'The Interview', 'Commedia', 112, false, 'The_interview.png');
INSERT INTO public.film VALUES (13, 'Quo vado', 'Commedia', 99, false, 'Quo_vado.png');


--
-- TOC entry 3443 (class 0 OID 33765)
-- Dependencies: 222
-- Data for Name: food; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--

INSERT INTO public.food VALUES (28, 'Manaita fritti', 5, 'SPECIAL_FOODS', false, false, true, 'Tagliere di fritti misti', 'Manaita_fritti.png');
INSERT INTO public.food VALUES (12, 'Insalata di pollo', 7, 'SALADS', false, false, false, 'Pollo, lattuga, aceto balsamico, sale, pepe', 'Chicken_salad.png');
INSERT INTO public.food VALUES (15, 'Hamburger Vegetariano', 5, 'SANDWICHES', false, true, true, 'Hamburger vegetariano, melanzane grigliate, salsa di pomodoro, cipolla caramellate, lattuga', 'Hamburger_vegetarian.png');
INSERT INTO public.food VALUES (27, 'Manaita classica', 5, 'SPECIAL_FOODS', false, false, true, 'Tagliere di affettati e prosciutti misti', 'Manaita_classic.png');
INSERT INTO public.food VALUES (9, 'Insalata Samurai', 4, 'SALADS', false, true, true, 'Pomodori, Lattuga, Mais, Tofu', 'Insalata_samurai.png');
INSERT INTO public.food VALUES (10, 'Insalata Yoshi', 4, 'SALADS', false, true, false, 'Peperoni verdi, Lattuga, Crostini, Cetrioli', 'Insalata_yoshi.png');
INSERT INTO public.food VALUES (11, 'Insalata Tsunami', 8, 'SALADS', false, false, false, 'Polpo, Gamberetti, Pomodorini, aceto , olio', 'Insalata_tsunami.png');
INSERT INTO public.food VALUES (13, 'Kamikaze Burger', 4.50, 'SANDWICHES', false, false, false, 'Hamburger di bovino , lattuga, jalapenos, peperoni, salsa burger', 'Kamikaze_burger.png');
INSERT INTO public.food VALUES (18, 'Tiramisù', 4, 'DESSERTS', false, false, false, 'Caffe, panna, savoiardi, cacao', 'Tiramisù.png');
INSERT INTO public.food VALUES (6, 'Cocktail di gamberetti ', 6, 'SPECIAL_FOODS', false, false, true, 'gamberetti con salsa rosa x8', 'Gamberetti_cocktail.png');
INSERT INTO public.food VALUES (14, 'Sandwich Fuji', 4.50, 'SANDWICHES', false, false, false, 'Funghi, Speack, Salsiccia, cheddar', 'Panino_fuji.png');
INSERT INTO public.food VALUES (5, 'Pop-Corn', 2.50, 'SNACKS', true, true, true, 'Pop corn', 'Pop_corn.png');
INSERT INTO public.food VALUES (7, 'Cipster', 2.50, 'SNACKS', false, true, true, 'Patatine cipster', 'Cipster.png');
INSERT INTO public.food VALUES (8, 'Nachos', 2.50, 'SNACKS', false, true, true, 'Nachos', 'Nachos.png');
INSERT INTO public.food VALUES (16, 'Focaccia Origami', 5, 'SANDWICHES', false, true, true, 'Salsa yogurt, pomodoro, carciofi, tofu, zucchine', 'Focaccia_origami.png');
INSERT INTO public.food VALUES (17, 'Sandwich', 3, 'SANDWICHES', false, false, false, 'Pomodoro, insalata, prosciutto, maionese', 'Sandwich.png');
INSERT INTO public.food VALUES (19, 'Crepés', 4, 'DESSERTS', false, false, true, 'Nutella, latte, farina 00', 'Crepés.png');
INSERT INTO public.food VALUES (20, 'Doroyaki', 4, 'DESSERTS', false, false, false, 'Nutella, latte, farina 00, miele, uova, lievito', 'Doroyaki.png');
INSERT INTO public.food VALUES (21, 'Cheesecake', 4, 'DESSERTS', false, false, true, 'Biscotti, panna, mascarpone, frutta', 'Cheesecake.png');
INSERT INTO public.food VALUES (23, 'Patatine fritte piccole', 2.50, 'FRIED_FOODS', false, true, true, 'Patatine fritte', 'Patatine_fritte_small.png');
INSERT INTO public.food VALUES (24, 'Anelli di cipolla', 3.50, 'FRIED_FOODS', false, true, true, 'Cipolla x6', 'Anelli_di_cipolla.png');
INSERT INTO public.food VALUES (25, 'Patatine fritte grandi', 6, 'FRIED_FOODS', false, true, true, 'Patatine fritte', 'Patatine_fritte_max.png');
INSERT INTO public.food VALUES (26, 'Alette Fuji', 3.50, 'FRIED_FOODS', false, false, true, 'Alette di pollo x6', 'Fuji_wings.png');
INSERT INTO public.food VALUES (22, 'Nuggets', 3.50, 'FRIED_FOODS', false, false, true, 'Nuggets x6', 'Nuggets.png');


--
-- TOC entry 3445 (class 0 OID 33774)
-- Dependencies: 224
-- Data for Name: karaoke; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--

INSERT INTO public.karaoke VALUES (1, 'Bohemian Rhapsody', 'Rock', 'Queen');
INSERT INTO public.karaoke VALUES (2, 'Imagine', 'Pop', 'John Lennon');
INSERT INTO public.karaoke VALUES (3, 'Hotel California', 'Rock', 'Eagles');
INSERT INTO public.karaoke VALUES (4, 'Like a Rolling Stone', 'Rock', 'Bob Dylan');
INSERT INTO public.karaoke VALUES (5, 'What a Wonderful World', 'Jazz', 'Louis Armstrong');
INSERT INTO public.karaoke VALUES (6, 'Stairway to Heaven', 'Rock', 'Led Zeppelin');
INSERT INTO public.karaoke VALUES (7, 'Hey Jude', 'Rock', 'The Beatles');
INSERT INTO public.karaoke VALUES (8, 'Billie Jean', 'Pop', 'Michael Jackson');
INSERT INTO public.karaoke VALUES (9, 'Smells Like Teen Spirit', 'Rock', 'Nirvana');
INSERT INTO public.karaoke VALUES (10, 'Yesterday', 'Pop', 'The Beatles');
INSERT INTO public.karaoke VALUES (11, 'Sweet Child O'' Mine', 'Rock', 'Guns N'' Roses');
INSERT INTO public.karaoke VALUES (12, 'Thriller', 'Pop', 'Michael Jackson');
INSERT INTO public.karaoke VALUES (13, 'Respect', 'Soul', 'Aretha Franklin');
INSERT INTO public.karaoke VALUES (14, 'Good Vibrations', 'Pop', 'The Beach Boys');
INSERT INTO public.karaoke VALUES (15, 'Superstition', 'Funk', 'Stevie Wonder');
INSERT INTO public.karaoke VALUES (16, 'God Only Knows', 'Pop', 'The Beach Boys');
INSERT INTO public.karaoke VALUES (17, 'Satisfaction', 'Rock', 'The Rolling Stones');
INSERT INTO public.karaoke VALUES (18, 'London Calling', 'Punk', 'The Clash');
INSERT INTO public.karaoke VALUES (19, 'Purple Haze', 'Rock', 'Jimi Hendrix');
INSERT INTO public.karaoke VALUES (20, 'Let It Be', 'Pop', 'The Beatles');
INSERT INTO public.karaoke VALUES (21, 'Every Breath You Take', 'Rock', 'The Police');
INSERT INTO public.karaoke VALUES (22, 'My Heart Will Go On', 'Pop', 'Celine Dion');
INSERT INTO public.karaoke VALUES (23, 'I Will Always Love You', 'Pop', 'Whitney Houston');
INSERT INTO public.karaoke VALUES (24, 'Boogie Wonderland', 'Disco', 'Earth, Wind & Fire');
INSERT INTO public.karaoke VALUES (25, 'September', 'Disco', 'Earth, Wind & Fire');
INSERT INTO public.karaoke VALUES (26, 'Dancing Queen', 'Disco', 'ABBA');
INSERT INTO public.karaoke VALUES (27, 'Wonderwall', 'Rock', 'Oasis');
INSERT INTO public.karaoke VALUES (28, 'Angie', 'Rock', 'The Rolling Stones');
INSERT INTO public.karaoke VALUES (29, 'Tiny Dancer', 'Rock', 'Elton John');
INSERT INTO public.karaoke VALUES (30, 'Rocket Man', 'Rock', 'Elton John');
INSERT INTO public.karaoke VALUES (31, 'Born to Run', 'Rock', 'Bruce Springsteen');
INSERT INTO public.karaoke VALUES (32, 'American Pie', 'Rock', 'Don McLean');
INSERT INTO public.karaoke VALUES (33, 'Heroes', 'Rock', 'David Bowie');
INSERT INTO public.karaoke VALUES (34, 'Hallelujah', 'Folk', 'Leonard Cohen');
INSERT INTO public.karaoke VALUES (35, 'What''s Going On', 'Soul', 'Marvin Gaye');
INSERT INTO public.karaoke VALUES (36, 'Uptown Funk', 'Funk', 'Mark Ronson ft. Bruno Mars');
INSERT INTO public.karaoke VALUES (37, 'Shape of You', 'Pop', 'Ed Sheeran');
INSERT INTO public.karaoke VALUES (38, 'Rolling in the Deep', 'Pop', 'Adele');
INSERT INTO public.karaoke VALUES (39, 'Hello', 'Pop', 'Adele');
INSERT INTO public.karaoke VALUES (40, 'Happy', 'Pop', 'Pharrell Williams');
INSERT INTO public.karaoke VALUES (41, 'All of Me', 'Pop', 'John Legend');
INSERT INTO public.karaoke VALUES (42, 'Counting Stars', 'Pop', 'OneRepublic');
INSERT INTO public.karaoke VALUES (43, 'Closer', 'Pop', 'The Chainsmokers ft. Halsey');
INSERT INTO public.karaoke VALUES (44, 'Can''t Stop the Feeling!', 'Pop', 'Justin Timberlake');
INSERT INTO public.karaoke VALUES (45, 'Rockstar', 'Hip-Hop', 'Post Malone ft. 21 Savage');
INSERT INTO public.karaoke VALUES (46, 'Girls Like You', 'Pop', 'Maroon 5 ft. Cardi B');
INSERT INTO public.karaoke VALUES (47, 'Senorita', 'Pop', 'Shawn Mendes & Camila Cabello');
INSERT INTO public.karaoke VALUES (48, 'Despacito', 'Reggaeton', 'Luis Fonsi ft. Daddy Yankee');
INSERT INTO public.karaoke VALUES (49, 'Ciao Adios', 'Pop', 'Anne-Marie');
INSERT INTO public.karaoke VALUES (50, 'La Cura', 'Pop', 'Franco Battiato');
INSERT INTO public.karaoke VALUES (51, 'La Bambola', 'Pop', 'Patty Pravo');
INSERT INTO public.karaoke VALUES (52, 'Estate', 'Pop', 'Brunori Sas');
INSERT INTO public.karaoke VALUES (53, 'Volare', 'Pop', 'Domenico Modugno');
INSERT INTO public.karaoke VALUES (54, 'Gianna', 'Pop', 'Rino Gaetano');
INSERT INTO public.karaoke VALUES (55, 'Il Cielo in una Stanza', 'Pop', 'Mina');
INSERT INTO public.karaoke VALUES (56, 'La Solitudine', 'Pop', 'Laura Pausini');
INSERT INTO public.karaoke VALUES (57, 'A Te', 'Pop', 'Jovanotti');
INSERT INTO public.karaoke VALUES (58, 'L''Emozione Non Ha Voce', 'Pop', 'Celentano & Mina');
INSERT INTO public.karaoke VALUES (59, 'Come Mai', 'Pop', '883');
INSERT INTO public.karaoke VALUES (60, 'Sere Nere', 'Pop', 'Tiziano Ferro');
INSERT INTO public.karaoke VALUES (61, 'Sono Sola', 'Pop', 'Valeria Rossi');
INSERT INTO public.karaoke VALUES (62, 'Nessun Dolore', 'Pop', 'Vasco Rossi');
INSERT INTO public.karaoke VALUES (63, 'Amore Disperato', 'Pop', 'Nada');
INSERT INTO public.karaoke VALUES (64, 'Mi Manchi', 'Pop', 'Lucio Battisti');
INSERT INTO public.karaoke VALUES (65, 'Con Te Partirò', 'Pop', 'Andrea Bocelli');
INSERT INTO public.karaoke VALUES (66, 'Il Mio Canto Libero', 'Pop', 'Lucio Battisti');
INSERT INTO public.karaoke VALUES (67, 'Una Storia Semplice', 'Pop', 'Negramaro');
INSERT INTO public.karaoke VALUES (68, 'Per Te', 'Pop', 'Jovanotti');
INSERT INTO public.karaoke VALUES (82, 'Waka Waka (This Time for Africa)', 'Pop', 'Shakira');
INSERT INTO public.karaoke VALUES (83, 'Sorry', 'Pop', 'Justin Bieber');
INSERT INTO public.karaoke VALUES (84, 'Cheap Thrills', 'Pop', 'Sia ft. Sean Paul');
INSERT INTO public.karaoke VALUES (85, 'Chandelier', 'Pop', 'Sia');
INSERT INTO public.karaoke VALUES (86, 'Blank Space', 'Pop', 'Taylor Swift');
INSERT INTO public.karaoke VALUES (87, 'Viva la Vida', 'Pop', 'Coldplay');
INSERT INTO public.karaoke VALUES (88, 'Bad Romance', 'Pop', 'Lady Gaga');
INSERT INTO public.karaoke VALUES (89, 'Pumped Up Kicks', 'Indie Pop', 'Foster the People');
INSERT INTO public.karaoke VALUES (90, 'Take Me to Church', 'Alternative', 'Hozier');
INSERT INTO public.karaoke VALUES (91, 'Rather Be', 'Pop', 'Clean Bandit ft. Jess Glynne');
INSERT INTO public.karaoke VALUES (92, 'Thinking Out Loud', 'Pop', 'Ed Sheeran');
INSERT INTO public.karaoke VALUES (93, 'All About That Bass', 'Pop', 'Meghan Trainor');
INSERT INTO public.karaoke VALUES (94, 'Rude', 'Reggae Fusion', 'Magic!');
INSERT INTO public.karaoke VALUES (95, 'Stay with Me', 'Pop', 'Sam Smith');
INSERT INTO public.karaoke VALUES (96, 'Royals', 'Pop', 'Lorde');
INSERT INTO public.karaoke VALUES (97, 'Let Her Go', 'Pop', 'Passenger');
INSERT INTO public.karaoke VALUES (98, 'Get Lucky', 'Disco', 'Daft Punk ft. Pharrell Williams');
INSERT INTO public.karaoke VALUES (99, 'Story of My Life', 'Pop', 'One Direction');
INSERT INTO public.karaoke VALUES (100, 'Wake Me Up', 'Pop', 'Avicii');
INSERT INTO public.karaoke VALUES (101, 'Locked Out of Heaven', 'Pop', 'Bruno Mars');
INSERT INTO public.karaoke VALUES (102, 'Clarity', 'Pop', 'Zedd ft. Foxes');
INSERT INTO public.karaoke VALUES (103, 'Treasure', 'Pop', 'Bruno Mars');
INSERT INTO public.karaoke VALUES (104, 'The A Team', 'Pop', 'Ed Sheeran');
INSERT INTO public.karaoke VALUES (105, 'Demons', 'Pop', 'Imagine Dragons');
INSERT INTO public.karaoke VALUES (106, 'New Rules', 'Pop', 'Dua Lipa');
INSERT INTO public.karaoke VALUES (107, 'Old Town Road', 'Country Rap', 'Lil Nas X ft. Billy Ray Cyrus');
INSERT INTO public.karaoke VALUES (108, 'Can''t Feel My Face', 'Pop', 'The Weeknd');
INSERT INTO public.karaoke VALUES (109, 'Hotline Bling', 'Pop', 'Drake');
INSERT INTO public.karaoke VALUES (110, 'Sucker', 'Pop', 'Jonas Brothers');
INSERT INTO public.karaoke VALUES (111, 'Dance Monkey', 'Pop', 'Tones and I');
INSERT INTO public.karaoke VALUES (112, 'Blinding Lights', 'Pop', 'The Weeknd');
INSERT INTO public.karaoke VALUES (113, 'Shape of You', 'Pop', 'Ed Sheeran');


--
-- TOC entry 3447 (class 0 OID 33780)
-- Dependencies: 226
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--



--
-- TOC entry 3449 (class 0 OID 33785)
-- Dependencies: 228
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--



--
-- TOC entry 3451 (class 0 OID 33791)
-- Dependencies: 230
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--

INSERT INTO public.room VALUES (2, 'room1', 12, true, 10, 'room01.png');
INSERT INTO public.room VALUES (3, 'room2', 5, true, 10, 'room02.png');
INSERT INTO public.room VALUES (4, 'room3', 5, true, 10, 'room03.png');
INSERT INTO public.room VALUES (1, 'Battle of the Beats', 12, true, 10, 'room12.png');
INSERT INTO public.room VALUES (5, 'room11', 5, false, 10, 'room11.png');
INSERT INTO public.room VALUES (6, 'room4', 12, false, 10, 'room04.png');
INSERT INTO public.room VALUES (7, 'room5', 12, false, 10, 'room05.png');
INSERT INTO public.room VALUES (8, 'room6', 12, false, 10, 'room06.png');
INSERT INTO public.room VALUES (9, 'room7', 12, false, 10, 'room07.png');
INSERT INTO public.room VALUES (10, 'room8', 5, false, 10, 'room08.png');
INSERT INTO public.room VALUES (11, 'room9', 5, false, 10, 'room9.png');
INSERT INTO public.room VALUES (12, 'room10', 5, false, 10, 'room10.png');


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 217
-- Name: beverage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.beverage_id_seq', 21, true);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 219
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.booking_id_seq', 1, false);


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 221
-- Name: film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.film_id_seq', 20, true);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 223
-- Name: food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.food_id_seq', 28, true);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 225
-- Name: karaoke_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.karaoke_id_seq', 113, true);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 227
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 3475 (class 0 OID 0)
-- Dependencies: 229
-- Name: prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.prices_id_seq', 1, false);


--
-- TOC entry 3476 (class 0 OID 0)
-- Dependencies: 231
-- Name: room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.room_id_seq', 12, true);


--
-- TOC entry 3477 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.user_id_seq', 9, true);


--
-- TOC entry 3272 (class 2606 OID 33807)
-- Name: beverage beverage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.beverage
    ADD CONSTRAINT beverage_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 33809)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 33810)
-- Name: food check_type; Type: CHECK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE public.food
    ADD CONSTRAINT check_type CHECK (((type)::text = ANY (ARRAY[('SNACKS'::character varying)::text, ('SANDWICHES'::character varying)::text, ('DESSERTS'::character varying)::text, ('FRIED_FOODS'::character varying)::text, ('SALADS'::character varying)::text, ('SPECIAL_FOODS'::character varying)::text]))) NOT VALID;


--
-- TOC entry 3276 (class 2606 OID 33812)
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- TOC entry 3278 (class 2606 OID 33814)
-- Name: food food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (id);


--
-- TOC entry 3280 (class 2606 OID 33816)
-- Name: karaoke karaoke_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.karaoke
    ADD CONSTRAINT karaoke_pkey PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 33818)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3284 (class 2606 OID 33820)
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 33822)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 33876)
-- Name: account unique_email; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT unique_email UNIQUE (email);


--
-- TOC entry 3270 (class 2606 OID 33824)
-- Name: account user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3289 (class 2606 OID 33825)
-- Name: orders FK_id_beverage; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_id_beverage" FOREIGN KEY (id_beverage) REFERENCES public.beverage(id) NOT VALID;


--
-- TOC entry 3290 (class 2606 OID 33830)
-- Name: orders FK_id_booking; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_id_booking" FOREIGN KEY (id_booking) REFERENCES public.booking(id) NOT VALID;


--
-- TOC entry 3287 (class 2606 OID 33835)
-- Name: booking FK_id_room; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT "FK_id_room" FOREIGN KEY (id_room) REFERENCES public.room(id) NOT VALID;


--
-- TOC entry 3292 (class 2606 OID 33840)
-- Name: prices FK_id_room; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT "FK_id_room" FOREIGN KEY (id_room) REFERENCES public.room(id) NOT VALID;


--
-- TOC entry 3288 (class 2606 OID 33845)
-- Name: booking FK_id_user; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT "FK_id_user" FOREIGN KEY (id_user) REFERENCES public.account(id) NOT VALID;


--
-- TOC entry 3291 (class 2606 OID 33850)
-- Name: orders Fk_id_food; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "Fk_id_food" FOREIGN KEY (id_food) REFERENCES public.food(id) NOT VALID;


-- Completed on 2024-06-19 20:26:45 UTC

--
-- PostgreSQL database dump complete
--

