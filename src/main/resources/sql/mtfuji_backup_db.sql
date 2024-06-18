--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-18 13:55:11 UTC

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
-- TOC entry 3456 (class 0 OID 0)
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
    image_name character varying(64)
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
-- TOC entry 3457 (class 0 OID 0)
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
-- TOC entry 3458 (class 0 OID 0)
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
    marathon boolean DEFAULT false NOT NULL,
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
-- TOC entry 3459 (class 0 OID 0)
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
    image_name character varying(32)
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
-- TOC entry 3460 (class 0 OID 0)
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
-- TOC entry 3461 (class 0 OID 0)
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
-- TOC entry 3462 (class 0 OID 0)
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
-- TOC entry 3463 (class 0 OID 0)
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
    luxury boolean DEFAULT false
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
-- TOC entry 3464 (class 0 OID 0)
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
-- TOC entry 3465 (class 0 OID 0)
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
-- TOC entry 3433 (class 0 OID 33735)
-- Dependencies: 215
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--

INSERT INTO public.account VALUES (4, 'Ciuccio', 'Cretino', 29, 'miao@gmail.com', 'via roma', true, '$2a$12$1aDAHlQXGsWTzMa2cMgCwOA1r9.OIaC7B7geQG2uQTuV99pOjCGji');
INSERT INTO public.account VALUES (7, 'Gino', 'Pasticcino', 28, 'gino@email.com', 'ejwvuiowhnion', true, '$2a$12$bXgubQ2Kx5001lJIVFhrN.MFn6WoosKTxg78sfxb2zc/hC4ii1wZa');
INSERT INTO public.account VALUES (5, 'ewhvhwh', 'evwnjniw', 27, 'venwjneviuwn@alice.it', 'wecvnjnwinv', false, '$2a$12$R7c.c4ahyY/9flHBFXo8T.3QcBfa9q4GXLg36Np0KsJpX0WhIVna6');
INSERT INTO public.account VALUES (6, 'ewinvinw', ' wekj vckjw', 65, 'uwefhuhwuihfui@email.com', 'ejwojfiowej', true, '$2a$12$xD/qnWYOnOgq9sCupb72PedTlO3BX1soakquFpNBKPF44Ragh396.');


--
-- TOC entry 3434 (class 0 OID 33741)
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
-- TOC entry 3436 (class 0 OID 33749)
-- Dependencies: 218
-- Data for Name: booking; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--



--
-- TOC entry 3438 (class 0 OID 33758)
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


--
-- TOC entry 3440 (class 0 OID 33765)
-- Dependencies: 222
-- Data for Name: food; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--

INSERT INTO public.food VALUES (20, 'Doroyaki', 4, 'DESSERTS', false, false, false, 'nutella, latte, farina 00, miele, uova, lievito', 'Doroyaki.png');
INSERT INTO public.food VALUES (21, 'Cheesecake', 4, 'DESSERTS', false, false, true, 'biscotti, panna, mascarpone, frutta', 'Cheesecake.png');
INSERT INTO public.food VALUES (22, 'Nuggets', 3.50, 'FRIED_FOODS', false, false, true, 'polllo x6', 'Nuggets.png');
INSERT INTO public.food VALUES (23, 'Patatine fritte small', 2.50, 'FRIED_FOODS', false, false, true, 'patate, NaCl', 'Patatine_fritte_small.png');
INSERT INTO public.food VALUES (24, 'Anelli di cipolla', 3.50, 'FRIED_FOODS', false, false, true, 'cipolla x6, NaCl ', 'Anelli_di_cipolla.png');
INSERT INTO public.food VALUES (25, 'Patatine fritte max', 6, 'FRIED_FOODS', false, false, true, 'patate, NaCl', 'Patatine_fritte_max.png');
INSERT INTO public.food VALUES (26, 'Fuji wings', 3.50, 'FRIED_FOODS', false, false, true, 'alette di pollo x6, NaCl', 'Fuji_wings.png');
INSERT INTO public.food VALUES (27, 'Manaita classic', 5, 'SPECIAL_FOODS', false, false, true, 'Tagliere di affettati e prosciutti misti', 'Manaita_classic.png');
INSERT INTO public.food VALUES (28, 'Manaita fritti', 5, 'SPECIAL_FOODS', false, false, true, 'Tagliere di fritti misti', 'Manaita_fritti.png');
INSERT INTO public.food VALUES (5, 'Pop-Corn', 2.50, 'SNACKS', true, true, true, 'NaCl, mais', 'Pop_corn.png');
INSERT INTO public.food VALUES (6, 'Gamberetti cocktail', 6, 'SPECIAL_FOODS', false, false, true, 'gamberetti con salsa rosa x8', 'Gamberetti_cocktail.png');
INSERT INTO public.food VALUES (8, 'Nachos', 2.50, 'SNACKS', false, true, true, 'NaCl, mais', 'Nachos.png');
INSERT INTO public.food VALUES (9, 'Insalata Samurai', 4, 'SALADS', false, true, true, 'Pomodori, Lattuga, Mais, Tofu', 'Insalata_samurai.png');
INSERT INTO public.food VALUES (10, 'Insalata Yoshi', 4, 'SALADS', false, true, false, 'Peperoni verdi, Lattuga, Crostini, Cetrioli', 'Insalata_yoshi.png');
INSERT INTO public.food VALUES (7, 'Cipster', 2.50, 'SNACKS', false, true, true, 'NaCl, patata', 'Cipster.png');
INSERT INTO public.food VALUES (11, 'Insalata Tsunami', 8, 'SALADS', false, false, false, 'Polpo, Gamberetti, Pomodorini, aceto , olio', 'Insalata_tsunami.png');
INSERT INTO public.food VALUES (12, 'Chicken Salad', 7, 'SALADS', false, false, false, 'Pollo, lattuga, aceto balsamico, sale, pepe', 'Chicken_salad.png');
INSERT INTO public.food VALUES (13, 'Kamikaze Burger', 4.50, 'SANDWICHES', false, false, false, 'Hamburger di bovino , lattuga, jalapenos, peperoni, salsa burger', 'Kamikaze_burger.png');
INSERT INTO public.food VALUES (14, 'Panino Fuji', 4.50, 'SANDWICHES', false, false, false, 'Funghi, Speack, Salsiccia, cheddar', 'Panino_fuji.png');
INSERT INTO public.food VALUES (15, 'Hamburger Vegetarian', 5, 'SANDWICHES', false, true, true, 'Hamburger vegetariano, melanzane grigliate, salsa di pomodoro, cipolla caramellate, lattuga', 'Hamburger_vegetarian.png');
INSERT INTO public.food VALUES (16, 'Focaccia Origami', 5, 'SANDWICHES', false, true, true, 'salsa yogurt, pomodoro, carciofi, tofu, zucchine', 'Focaccia_origami.png');
INSERT INTO public.food VALUES (17, 'Sandwich', 3, 'SANDWICHES', false, false, false, 'pomodoro, insalata, prosciutto, maionese', 'Sandwich.png');
INSERT INTO public.food VALUES (18, 'Tiramisù', 4, 'DESSERTS', false, false, false, 'Caffe, panna, savoiardi, cacao', 'Tiramisù.png');
INSERT INTO public.food VALUES (19, 'Crepés', 4, 'DESSERTS', false, false, true, 'nutella, latte, farina 00', 'Crepés.png');


--
-- TOC entry 3442 (class 0 OID 33774)
-- Dependencies: 224
-- Data for Name: karaoke; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--

INSERT INTO public.karaoke VALUES (1, 'Shape of You', 'Pop', 'Ed Sheeran');
INSERT INTO public.karaoke VALUES (2, 'Rolling in the Deep', 'Pop', 'Adele');
INSERT INTO public.karaoke VALUES (3, 'Uptown Funk', 'Funk', 'Mark Ronson ft. Bruno Mars');
INSERT INTO public.karaoke VALUES (4, 'Bohemian Rhapsody', 'Rock', 'Queen');
INSERT INTO public.karaoke VALUES (5, 'Hotel California', 'Rock', 'Eagles');
INSERT INTO public.karaoke VALUES (6, 'Happy', 'Pop', 'Pharrell Williams');
INSERT INTO public.karaoke VALUES (7, 'Blinding Lights', 'Synth-pop', 'The Weeknd');
INSERT INTO public.karaoke VALUES (8, 'Billie Jean', 'Pop', 'Michael Jackson');
INSERT INTO public.karaoke VALUES (9, 'Poker Face', 'Pop', 'Lady Gaga');
INSERT INTO public.karaoke VALUES (10, 'Sweet Child o Mine', 'Rock', 'Guns N Roses');
INSERT INTO public.karaoke VALUES (11, 'Despacito', 'Reggaeton', 'Luis Fonsi ft. Daddy Yankee');
INSERT INTO public.karaoke VALUES (12, 'Take on Me', 'Synth-pop', 'A-ha');
INSERT INTO public.karaoke VALUES (13, 'Wonderwall', 'Rock', 'Oasis');
INSERT INTO public.karaoke VALUES (14, 'Thinking Out Loud', 'Pop', 'Ed Sheeran');
INSERT INTO public.karaoke VALUES (15, 'Smells Like Teen Spirit', 'Rock', 'Nirvana');
INSERT INTO public.karaoke VALUES (16, 'Like a Rolling Stone', 'Rock', 'Bob Dylan');
INSERT INTO public.karaoke VALUES (17, 'Sorry', 'Pop', 'Justin Bieber');
INSERT INTO public.karaoke VALUES (18, 'Chandelier', 'Pop', 'Sia');
INSERT INTO public.karaoke VALUES (19, 'Somebody That I Used to Know', 'Pop', 'Gotye');
INSERT INTO public.karaoke VALUES (20, 'Imagine', 'Rock', 'John Lennon');
INSERT INTO public.karaoke VALUES (21, 'Hello', 'Pop', 'Adele');
INSERT INTO public.karaoke VALUES (22, 'Stayin Alive', 'Disco', 'Bee Gees');
INSERT INTO public.karaoke VALUES (23, 'Halo', 'Pop', 'Beyoncé');
INSERT INTO public.karaoke VALUES (24, 'Thriller', 'Pop', 'Michael Jackson');
INSERT INTO public.karaoke VALUES (25, 'Dancing Queen', 'Disco', 'ABBA');
INSERT INTO public.karaoke VALUES (26, 'Let It Be', 'Rock', 'The Beatles');
INSERT INTO public.karaoke VALUES (27, 'I Will Always Love You', 'Pop', 'Whitney Houston');
INSERT INTO public.karaoke VALUES (28, 'Bad Guy', 'Pop', 'Billie Eilish');
INSERT INTO public.karaoke VALUES (29, 'Watermelon Sugar', 'Pop', 'Harry Styles');
INSERT INTO public.karaoke VALUES (30, 'Dont Stop Believin', 'Rock', 'Journey');
INSERT INTO public.karaoke VALUES (31, 'Call Me Maybe', 'Pop', 'Carly Rae Jepsen');
INSERT INTO public.karaoke VALUES (32, 'Old Town Road', 'Country', 'Lil Nas X');
INSERT INTO public.karaoke VALUES (33, 'Hey Jude', 'Rock', 'The Beatles');
INSERT INTO public.karaoke VALUES (34, 'Firework', 'Pop', 'Katy Perry');
INSERT INTO public.karaoke VALUES (35, 'I Gotta Feeling', 'Pop', 'The Black Eyed Peas');
INSERT INTO public.karaoke VALUES (36, 'Roar', 'Pop', 'Katy Perry');
INSERT INTO public.karaoke VALUES (37, 'Shape of My Heart', 'Pop', 'Backstreet Boys');
INSERT INTO public.karaoke VALUES (38, 'Toxic', 'Pop', 'Britney Spears');
INSERT INTO public.karaoke VALUES (39, 'Livin on a Prayer', 'Rock', 'Bon Jovi');
INSERT INTO public.karaoke VALUES (40, 'Moves Like Jagger', 'Pop', 'Maroon 5');
INSERT INTO public.karaoke VALUES (41, 'Bad Romance', 'Pop', 'Lady Gaga');
INSERT INTO public.karaoke VALUES (42, 'Beat It', 'Rock', 'Michael Jackson');
INSERT INTO public.karaoke VALUES (43, 'All of Me', 'Pop', 'John Legend');
INSERT INTO public.karaoke VALUES (44, 'Shallow', 'Pop', 'Lady Gaga and Bradley Cooper');
INSERT INTO public.karaoke VALUES (45, 'Another Brick in the Wall', 'Rock', 'Pink Floyd');
INSERT INTO public.karaoke VALUES (46, 'Dont Speak', 'Rock', 'No Doubt');
INSERT INTO public.karaoke VALUES (47, 'Skyfall', 'Pop', 'Adele');
INSERT INTO public.karaoke VALUES (48, 'Hotline Bling', 'Pop', 'Drake');
INSERT INTO public.karaoke VALUES (49, 'Oops I Did It Again', 'Pop', 'Britney Spears');
INSERT INTO public.karaoke VALUES (50, 'Single Ladies', 'Pop', 'Beyoncé');
INSERT INTO public.karaoke VALUES (51, 'Gangnam Style', 'Pop', 'PSY');
INSERT INTO public.karaoke VALUES (52, 'Rolling in the Deep', 'Pop', 'Adele');
INSERT INTO public.karaoke VALUES (53, 'All About That Bass', 'Pop', 'Meghan Trainor');
INSERT INTO public.karaoke VALUES (54, 'The Hills', 'Pop', 'The Weeknd');
INSERT INTO public.karaoke VALUES (55, 'Take Me to Church', 'Rock', 'Hozier');
INSERT INTO public.karaoke VALUES (56, 'Sugar', 'Pop', 'Maroon 5');
INSERT INTO public.karaoke VALUES (57, 'Radioactive', 'Rock', 'Imagine Dragons');
INSERT INTO public.karaoke VALUES (58, 'Someone Like You', 'Pop', 'Adele');
INSERT INTO public.karaoke VALUES (59, 'Blank Space', 'Pop', 'Taylor Swift');
INSERT INTO public.karaoke VALUES (60, 'Love Me Like You Do', 'Pop', 'Ellie Goulding');
INSERT INTO public.karaoke VALUES (61, 'Blowin in the Wind', 'Folk', 'Bob Dylan');
INSERT INTO public.karaoke VALUES (62, 'No Tears Left to Cry', 'Pop', 'Ariana Grande');
INSERT INTO public.karaoke VALUES (63, 'Counting Stars', 'Pop', 'OneRepublic');
INSERT INTO public.karaoke VALUES (64, 'What Makes You Beautiful', 'Pop', 'One Direction');
INSERT INTO public.karaoke VALUES (65, 'Since U Been Gone', 'Pop', 'Kelly Clarkson');
INSERT INTO public.karaoke VALUES (66, 'Back to Black', 'Soul', 'Amy Winehouse');
INSERT INTO public.karaoke VALUES (67, 'Royals', 'Pop', 'Lorde');
INSERT INTO public.karaoke VALUES (68, 'Grenade', 'Pop', 'Bruno Mars');
INSERT INTO public.karaoke VALUES (69, 'Party Rock Anthem', 'Pop', 'LMFAO');
INSERT INTO public.karaoke VALUES (70, 'We Found Love', 'Pop', 'Rihanna');
INSERT INTO public.karaoke VALUES (71, 'Diamonds', 'Pop', 'Rihanna');
INSERT INTO public.karaoke VALUES (72, 'Royals', 'Pop', 'Lorde');
INSERT INTO public.karaoke VALUES (73, 'Cheap Thrills', 'Pop', 'Sia');
INSERT INTO public.karaoke VALUES (74, 'Starboy', 'Pop', 'The Weeknd');
INSERT INTO public.karaoke VALUES (75, 'Wrecking Ball', 'Pop', 'Miley Cyrus');
INSERT INTO public.karaoke VALUES (76, 'Lean On', 'Pop', 'Major Lazer and DJ Snake');
INSERT INTO public.karaoke VALUES (77, 'Me Too', 'Pop', 'Meghan Trainor');
INSERT INTO public.karaoke VALUES (78, 'Hello', 'Pop', 'Lionel Richie');
INSERT INTO public.karaoke VALUES (79, 'I Want to Hold Your Hand', 'Rock', 'The Beatles');
INSERT INTO public.karaoke VALUES (80, 'Happy', 'Pop', 'Pharrell Williams');
INSERT INTO public.karaoke VALUES (81, 'Sorry', 'Pop', 'Justin Bieber');
INSERT INTO public.karaoke VALUES (82, 'Work', 'Pop', 'Rihanna');
INSERT INTO public.karaoke VALUES (83, 'Dark Horse', 'Pop', 'Katy Perry');
INSERT INTO public.karaoke VALUES (84, 'Tears in Heaven', 'Rock', 'Eric Clapton');
INSERT INTO public.karaoke VALUES (85, 'Say You Wont Let Go', 'Pop', 'James Arthur');
INSERT INTO public.karaoke VALUES (86, 'See You Again', 'Pop', 'Wiz Khalifa ft. Charlie Puth');
INSERT INTO public.karaoke VALUES (87, 'Stressed Out', 'Pop', 'Twenty One Pilots');
INSERT INTO public.karaoke VALUES (88, '7 Years', 'Pop', 'Lukas Graham');
INSERT INTO public.karaoke VALUES (89, 'Stay With Me', 'Pop', 'Sam Smith');
INSERT INTO public.karaoke VALUES (90, 'Take a Bow', 'Pop', 'Rihanna');
INSERT INTO public.karaoke VALUES (91, 'Love Yourself', 'Pop', 'Justin Bieber');
INSERT INTO public.karaoke VALUES (92, 'One Dance', 'Pop', 'Drake');
INSERT INTO public.karaoke VALUES (93, 'Cheap Thrills', 'Pop', 'Sia');
INSERT INTO public.karaoke VALUES (94, 'Fight Song', 'Pop', 'Rachel Platten');
INSERT INTO public.karaoke VALUES (95, 'Heathens', 'Rock', 'Twenty One Pilots');
INSERT INTO public.karaoke VALUES (96, 'Rockstar', 'Rock', 'Post Malone');
INSERT INTO public.karaoke VALUES (97, 'Shut Up and Dance', 'Pop', 'Walk the Moon');
INSERT INTO public.karaoke VALUES (98, 'Perfect', 'Pop', 'Ed Sheeran');
INSERT INTO public.karaoke VALUES (99, 'Timber', 'Pop', 'Pitbull ft. Kesha');
INSERT INTO public.karaoke VALUES (100, 'Roar', 'Pop', 'Katy Perry');


--
-- TOC entry 3444 (class 0 OID 33780)
-- Dependencies: 226
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--



--
-- TOC entry 3446 (class 0 OID 33785)
-- Dependencies: 228
-- Data for Name: prices; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--



--
-- TOC entry 3448 (class 0 OID 33791)
-- Dependencies: 230
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: postgresMaster
--

INSERT INTO public.room VALUES (1, 'Battle of the Beats', 12, true);
INSERT INTO public.room VALUES (2, 'room1', 12, true);
INSERT INTO public.room VALUES (3, 'room2', 5, true);
INSERT INTO public.room VALUES (4, 'room3', 5, true);
INSERT INTO public.room VALUES (5, 'room11', 5, false);
INSERT INTO public.room VALUES (6, 'room4', 12, false);
INSERT INTO public.room VALUES (7, 'room5', 12, false);
INSERT INTO public.room VALUES (8, 'room6', 12, false);
INSERT INTO public.room VALUES (9, 'room7', 12, false);
INSERT INTO public.room VALUES (10, 'room8', 5, false);
INSERT INTO public.room VALUES (11, 'room9', 5, false);
INSERT INTO public.room VALUES (12, 'room10', 5, false);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 217
-- Name: beverage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.beverage_id_seq', 21, true);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 219
-- Name: booking_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.booking_id_seq', 1, false);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 221
-- Name: film_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.film_id_seq', 1, false);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 223
-- Name: food_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.food_id_seq', 28, true);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 225
-- Name: karaoke_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.karaoke_id_seq', 1, false);


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 227
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.orders_id_seq', 1, false);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 229
-- Name: prices_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.prices_id_seq', 1, false);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 231
-- Name: room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.room_id_seq', 12, true);


--
-- TOC entry 3474 (class 0 OID 0)
-- Dependencies: 232
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgresMaster
--

SELECT pg_catalog.setval('public.user_id_seq', 7, true);


--
-- TOC entry 3269 (class 2606 OID 33807)
-- Name: beverage beverage_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.beverage
    ADD CONSTRAINT beverage_pkey PRIMARY KEY (id);


--
-- TOC entry 3271 (class 2606 OID 33809)
-- Name: booking booking_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT booking_pkey PRIMARY KEY (id);


--
-- TOC entry 3265 (class 2606 OID 33810)
-- Name: food check_type; Type: CHECK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE public.food
    ADD CONSTRAINT check_type CHECK (((type)::text = ANY (ARRAY[('SNACKS'::character varying)::text, ('SANDWICHES'::character varying)::text, ('DESSERTS'::character varying)::text, ('FRIED_FOODS'::character varying)::text, ('SALADS'::character varying)::text, ('SPECIAL_FOODS'::character varying)::text]))) NOT VALID;


--
-- TOC entry 3273 (class 2606 OID 33812)
-- Name: film film_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.film
    ADD CONSTRAINT film_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 2606 OID 33814)
-- Name: food food_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.food
    ADD CONSTRAINT food_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 33816)
-- Name: karaoke karaoke_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.karaoke
    ADD CONSTRAINT karaoke_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 33818)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 33820)
-- Name: prices prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT prices_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 33822)
-- Name: room room_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.room
    ADD CONSTRAINT room_pkey PRIMARY KEY (id);


--
-- TOC entry 3267 (class 2606 OID 33824)
-- Name: account user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 33825)
-- Name: orders FK_id_beverage; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_id_beverage" FOREIGN KEY (id_beverage) REFERENCES public.beverage(id) NOT VALID;


--
-- TOC entry 3287 (class 2606 OID 33830)
-- Name: orders FK_id_booking; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "FK_id_booking" FOREIGN KEY (id_booking) REFERENCES public.booking(id) NOT VALID;


--
-- TOC entry 3284 (class 2606 OID 33835)
-- Name: booking FK_id_room; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT "FK_id_room" FOREIGN KEY (id_room) REFERENCES public.room(id) NOT VALID;


--
-- TOC entry 3289 (class 2606 OID 33840)
-- Name: prices FK_id_room; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.prices
    ADD CONSTRAINT "FK_id_room" FOREIGN KEY (id_room) REFERENCES public.room(id) NOT VALID;


--
-- TOC entry 3285 (class 2606 OID 33845)
-- Name: booking FK_id_user; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.booking
    ADD CONSTRAINT "FK_id_user" FOREIGN KEY (id_user) REFERENCES public.account(id) NOT VALID;


--
-- TOC entry 3288 (class 2606 OID 33850)
-- Name: orders Fk_id_food; Type: FK CONSTRAINT; Schema: public; Owner: postgresMaster
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "Fk_id_food" FOREIGN KEY (id_food) REFERENCES public.food(id) NOT VALID;


-- Completed on 2024-06-18 13:55:12 UTC

--
-- PostgreSQL database dump complete
--

