--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: answer_by_q; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE answer_by_q (
    question_id integer NOT NULL,
    correct integer DEFAULT 0 NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    updated_at integer DEFAULT 0 NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.answer_by_q OWNER TO postgres;

--
-- Name: answered_news; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE answered_news (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    summary integer DEFAULT 0 NOT NULL,
    updated_at integer DEFAULT 0 NOT NULL,
    question_id integer DEFAULT 0 NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.answered_news OWNER TO postgres;

--
-- Name: answered_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE answered_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.answered_news_id_seq OWNER TO postgres;

--
-- Name: answered_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE answered_news_id_seq OWNED BY answered_news.id;


--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE contact_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO postgres;

--
-- Name: contact; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE contact (
    id integer DEFAULT nextval('contact_id_seq'::regclass) NOT NULL,
    txt text DEFAULT ''::text NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- Name: correct; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE correct (
    id integer NOT NULL,
    question_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    created_at integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.correct OWNER TO postgres;

--
-- Name: correct_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE correct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.correct_id_seq OWNER TO postgres;

--
-- Name: correct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE correct_id_seq OWNED BY correct.id;


--
-- Name: csrf; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE csrf (
    id integer NOT NULL,
    token text DEFAULT ''::text NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.csrf OWNER TO postgres;

--
-- Name: csrf_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE csrf_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.csrf_id_seq OWNER TO postgres;

--
-- Name: csrf_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE csrf_id_seq OWNED BY csrf.id;


--
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE follow (
    id integer NOT NULL,
    sender integer DEFAULT 0 NOT NULL,
    receiver integer DEFAULT 0 NOT NULL,
    created_at integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.follow OWNER TO postgres;

--
-- Name: follow_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE follow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.follow_id_seq OWNER TO postgres;

--
-- Name: follow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE follow_id_seq OWNED BY follow.id;


--
-- Name: followed_news; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE followed_news (
    id integer NOT NULL,
    receiver integer DEFAULT 0 NOT NULL,
    sender integer DEFAULT 0 NOT NULL,
    sender_img text DEFAULT ''::text NOT NULL,
    created_at integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.followed_news OWNER TO postgres;

--
-- Name: followed_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE followed_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.followed_news_id_seq OWNER TO postgres;

--
-- Name: followed_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE followed_news_id_seq OWNED BY followed_news.id;


--
-- Name: incorrect; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE incorrect (
    id integer DEFAULT nextval('correct_id_seq'::regclass) NOT NULL,
    question_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.incorrect OWNER TO postgres;

--
-- Name: incorrect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE incorrect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.incorrect_id_seq OWNER TO postgres;

--
-- Name: mydata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mydata (
    user_id integer DEFAULT 0 NOT NULL,
    myphoto text DEFAULT ''::text NOT NULL,
    myname text DEFAULT ''::text NOT NULL,
    answer_by_u text DEFAULT ''::text NOT NULL,
    answer text DEFAULT ''::text NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.mydata OWNER TO postgres;

--
-- Name: private_news; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE private_news (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    txt text DEFAULT ''::text NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.private_news OWNER TO postgres;

--
-- Name: private_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE private_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.private_news_id_seq OWNER TO postgres;

--
-- Name: private_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE private_news_id_seq OWNED BY private_news.id;


--
-- Name: question; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE question (
    id integer NOT NULL,
    txt text DEFAULT ''::text NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    choice_1 text DEFAULT ''::text NOT NULL,
    choice_2 text DEFAULT ''::text NOT NULL,
    choice_3 text DEFAULT ''::text NOT NULL,
    choice_4 text DEFAULT ''::text NOT NULL,
    created_at integer DEFAULT 0 NOT NULL,
    img text DEFAULT ''::text NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.question OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.question_id_seq OWNER TO postgres;

--
-- Name: question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE question_id_seq OWNED BY question.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tag (
    question_id integer DEFAULT 0 NOT NULL,
    txt text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.tag OWNER TO postgres;

--
-- Name: TABLE tag; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE tag IS 'quiz tag';


--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    pv_u_id text DEFAULT ''::text NOT NULL,
    provider integer DEFAULT 0 NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    img text DEFAULT ''::text NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- Name: COLUMN "user".provider; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN "user".provider IS '1=FB, 2=TW, 3=G+, 4=LN';


--
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.user_id_seq OWNER TO postgres;

--
-- Name: user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE user_id_seq OWNED BY "user".id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answered_news ALTER COLUMN id SET DEFAULT nextval('answered_news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY correct ALTER COLUMN id SET DEFAULT nextval('correct_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY csrf ALTER COLUMN id SET DEFAULT nextval('csrf_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY follow ALTER COLUMN id SET DEFAULT nextval('follow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY followed_news ALTER COLUMN id SET DEFAULT nextval('followed_news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY private_news ALTER COLUMN id SET DEFAULT nextval('private_news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY question ALTER COLUMN id SET DEFAULT nextval('question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Name: answer_by_q_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY answer_by_q
    ADD CONSTRAINT answer_by_q_pkey PRIMARY KEY (question_id);


--
-- Name: answered_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY answered_news
    ADD CONSTRAINT answered_news_pkey PRIMARY KEY (id);


--
-- Name: contact_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: correct_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY correct
    ADD CONSTRAINT correct_pkey PRIMARY KEY (id);


--
-- Name: csrf_pkey1; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY csrf
    ADD CONSTRAINT csrf_pkey1 PRIMARY KEY (id);


--
-- Name: follow_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (id);


--
-- Name: followed_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY followed_news
    ADD CONSTRAINT followed_news_pkey PRIMARY KEY (id);


--
-- Name: incorrect_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY incorrect
    ADD CONSTRAINT incorrect_pkey PRIMARY KEY (id);


--
-- Name: mydata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mydata
    ADD CONSTRAINT mydata_pkey PRIMARY KEY (user_id);


--
-- Name: private_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY private_news
    ADD CONSTRAINT private_news_pkey PRIMARY KEY (id);


--
-- Name: question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: sender_receiver; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT sender_receiver UNIQUE (sender, receiver);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: an_news_u; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX an_news_u ON answered_news USING btree (user_id);


--
-- Name: co_qu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX co_qu ON correct USING btree (question_id);


--
-- Name: follow_receiver; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX follow_receiver ON follow USING btree (receiver);


--
-- Name: follow_sender; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX follow_sender ON follow USING btree (sender);


--
-- Name: followed_news_receiver; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX followed_news_receiver ON followed_news USING btree (receiver);


--
-- Name: inco_qu; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX inco_qu ON incorrect USING btree (question_id);


--
-- Name: qu_u; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX qu_u ON question USING btree (user_id);


--
-- Name: tag_txt; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX tag_txt ON tag USING btree (txt);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

