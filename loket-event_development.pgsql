--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: gojekindonesia
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO gojekindonesia;

--
-- Name: customers; Type: TABLE; Schema: public; Owner: gojekindonesia
--

CREATE TABLE public.customers (
    id bigint NOT NULL,
    name character varying,
    email character varying,
    phone character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.customers OWNER TO gojekindonesia;

--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: gojekindonesia
--

CREATE SEQUENCE public.customers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_id_seq OWNER TO gojekindonesia;

--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gojekindonesia
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: gojekindonesia
--

CREATE TABLE public.events (
    id bigint NOT NULL,
    description text,
    origanizer character varying,
    start_date character varying,
    end_date character varying,
    location_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.events OWNER TO gojekindonesia;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: gojekindonesia
--

CREATE SEQUENCE public.events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO gojekindonesia;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gojekindonesia
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: gojekindonesia
--

CREATE TABLE public.locations (
    id bigint NOT NULL,
    name character varying,
    address character varying,
    longitude double precision,
    latitude double precision,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.locations OWNER TO gojekindonesia;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: gojekindonesia
--

CREATE SEQUENCE public.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO gojekindonesia;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gojekindonesia
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: gojekindonesia
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO gojekindonesia;

--
-- Name: ticket_purchases; Type: TABLE; Schema: public; Owner: gojekindonesia
--

CREATE TABLE public.ticket_purchases (
    id bigint NOT NULL,
    ticket_id bigint,
    amount integer,
    ticket_transaction_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ticket_purchases OWNER TO gojekindonesia;

--
-- Name: ticket_purchases_id_seq; Type: SEQUENCE; Schema: public; Owner: gojekindonesia
--

CREATE SEQUENCE public.ticket_purchases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ticket_purchases_id_seq OWNER TO gojekindonesia;

--
-- Name: ticket_purchases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gojekindonesia
--

ALTER SEQUENCE public.ticket_purchases_id_seq OWNED BY public.ticket_purchases.id;


--
-- Name: ticket_transactions; Type: TABLE; Schema: public; Owner: gojekindonesia
--

CREATE TABLE public.ticket_transactions (
    id bigint NOT NULL,
    customer_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.ticket_transactions OWNER TO gojekindonesia;

--
-- Name: ticket_transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: gojekindonesia
--

CREATE SEQUENCE public.ticket_transactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ticket_transactions_id_seq OWNER TO gojekindonesia;

--
-- Name: ticket_transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gojekindonesia
--

ALTER SEQUENCE public.ticket_transactions_id_seq OWNED BY public.ticket_transactions.id;


--
-- Name: tickets; Type: TABLE; Schema: public; Owner: gojekindonesia
--

CREATE TABLE public.tickets (
    id bigint NOT NULL,
    category character varying,
    price integer,
    quota integer,
    event_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.tickets OWNER TO gojekindonesia;

--
-- Name: tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: gojekindonesia
--

CREATE SEQUENCE public.tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tickets_id_seq OWNER TO gojekindonesia;

--
-- Name: tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: gojekindonesia
--

ALTER SEQUENCE public.tickets_id_seq OWNED BY public.tickets.id;


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: ticket_purchases id; Type: DEFAULT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.ticket_purchases ALTER COLUMN id SET DEFAULT nextval('public.ticket_purchases_id_seq'::regclass);


--
-- Name: ticket_transactions id; Type: DEFAULT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.ticket_transactions ALTER COLUMN id SET DEFAULT nextval('public.ticket_transactions_id_seq'::regclass);


--
-- Name: tickets id; Type: DEFAULT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.tickets ALTER COLUMN id SET DEFAULT nextval('public.tickets_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: gojekindonesia
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2019-05-30 17:49:45.18693	2019-05-30 17:49:45.18693
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: gojekindonesia
--

COPY public.customers (id, name, email, phone, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: gojekindonesia
--

COPY public.events (id, description, origanizer, start_date, end_date, location_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: gojekindonesia
--

COPY public.locations (id, name, address, longitude, latitude, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: gojekindonesia
--

COPY public.schema_migrations (version) FROM stdin;
20190528065110
20190528070204
20190528124638
20190528135552
20190528144423
20190530072648
\.


--
-- Data for Name: ticket_purchases; Type: TABLE DATA; Schema: public; Owner: gojekindonesia
--

COPY public.ticket_purchases (id, ticket_id, amount, ticket_transaction_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: ticket_transactions; Type: TABLE DATA; Schema: public; Owner: gojekindonesia
--

COPY public.ticket_transactions (id, customer_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tickets; Type: TABLE DATA; Schema: public; Owner: gojekindonesia
--

COPY public.tickets (id, category, price, quota, event_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gojekindonesia
--

SELECT pg_catalog.setval('public.customers_id_seq', 1, false);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gojekindonesia
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gojekindonesia
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, false);


--
-- Name: ticket_purchases_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gojekindonesia
--

SELECT pg_catalog.setval('public.ticket_purchases_id_seq', 1, false);


--
-- Name: ticket_transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gojekindonesia
--

SELECT pg_catalog.setval('public.ticket_transactions_id_seq', 1, false);


--
-- Name: tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: gojekindonesia
--

SELECT pg_catalog.setval('public.tickets_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: ticket_purchases ticket_purchases_pkey; Type: CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.ticket_purchases
    ADD CONSTRAINT ticket_purchases_pkey PRIMARY KEY (id);


--
-- Name: ticket_transactions ticket_transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.ticket_transactions
    ADD CONSTRAINT ticket_transactions_pkey PRIMARY KEY (id);


--
-- Name: tickets tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT tickets_pkey PRIMARY KEY (id);


--
-- Name: index_events_on_location_id; Type: INDEX; Schema: public; Owner: gojekindonesia
--

CREATE INDEX index_events_on_location_id ON public.events USING btree (location_id);


--
-- Name: index_ticket_purchases_on_ticket_id; Type: INDEX; Schema: public; Owner: gojekindonesia
--

CREATE INDEX index_ticket_purchases_on_ticket_id ON public.ticket_purchases USING btree (ticket_id);


--
-- Name: index_ticket_purchases_on_ticket_transaction_id; Type: INDEX; Schema: public; Owner: gojekindonesia
--

CREATE INDEX index_ticket_purchases_on_ticket_transaction_id ON public.ticket_purchases USING btree (ticket_transaction_id);


--
-- Name: index_ticket_transactions_on_customer_id; Type: INDEX; Schema: public; Owner: gojekindonesia
--

CREATE INDEX index_ticket_transactions_on_customer_id ON public.ticket_transactions USING btree (customer_id);


--
-- Name: index_tickets_on_event_id; Type: INDEX; Schema: public; Owner: gojekindonesia
--

CREATE INDEX index_tickets_on_event_id ON public.tickets USING btree (event_id);


--
-- Name: events fk_rails_3d0bd29ec6; Type: FK CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_rails_3d0bd29ec6 FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: tickets fk_rails_4def87ea62; Type: FK CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.tickets
    ADD CONSTRAINT fk_rails_4def87ea62 FOREIGN KEY (event_id) REFERENCES public.events(id);


--
-- Name: ticket_purchases fk_rails_5a7dcab164; Type: FK CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.ticket_purchases
    ADD CONSTRAINT fk_rails_5a7dcab164 FOREIGN KEY (ticket_transaction_id) REFERENCES public.ticket_transactions(id);


--
-- Name: ticket_transactions fk_rails_9c4f3bb76f; Type: FK CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.ticket_transactions
    ADD CONSTRAINT fk_rails_9c4f3bb76f FOREIGN KEY (customer_id) REFERENCES public.customers(id);


--
-- Name: ticket_purchases fk_rails_bad80ad904; Type: FK CONSTRAINT; Schema: public; Owner: gojekindonesia
--

ALTER TABLE ONLY public.ticket_purchases
    ADD CONSTRAINT fk_rails_bad80ad904 FOREIGN KEY (ticket_id) REFERENCES public.tickets(id);


--
-- PostgreSQL database dump complete
--

