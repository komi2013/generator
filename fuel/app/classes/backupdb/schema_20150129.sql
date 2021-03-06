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
-- Name: answer_by_pay_q; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE answer_by_pay_q (
    pay_q_id integer NOT NULL,
    correct integer DEFAULT 0 NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.answer_by_pay_q OWNER TO postgres;

--
-- Name: answer_by_q; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE answer_by_q (
    question_id integer NOT NULL,
    correct integer DEFAULT 0 NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.answer_by_q OWNER TO postgres;

--
-- Name: answered_news; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE answered_news (
    id integer NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
    summary integer DEFAULT 0 NOT NULL,
    question_id integer DEFAULT 0 NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL,
    q_txt text DEFAULT ''::text NOT NULL,
    q_img text DEFAULT ''::text NOT NULL
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
-- Name: choice; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE choice (
    choice_0 text DEFAULT ''::text NOT NULL,
    choice_1 text DEFAULT ''::text NOT NULL,
    choice_2 text DEFAULT ''::text NOT NULL,
    choice_3 text DEFAULT ''::text NOT NULL,
    question_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.choice OWNER TO postgres;

--
-- Name: comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comment (
    id integer NOT NULL,
    txt text DEFAULT ''::text NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
    question_id integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.comment OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.comment_id_seq OWNER TO postgres;

--
-- Name: comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comment_id_seq OWNED BY comment.id;


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
    usr_id integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.contact OWNER TO postgres;

--
-- Name: correct; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE correct (
    id integer NOT NULL,
    question_id integer DEFAULT 0 NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
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
    id integer NOT NULL,
    question_id integer DEFAULT 0 NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
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
-- Name: incorrect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE incorrect_id_seq OWNED BY incorrect.id;


--
-- Name: lg_pack_tran; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lg_pack_tran (
    id integer NOT NULL,
    seller integer DEFAULT 0 NOT NULL,
    pack_id integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL,
    buyer integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.lg_pack_tran OWNER TO postgres;

--
-- Name: TABLE lg_pack_tran; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE lg_pack_tran IS 'log pack transaction by 200 point';


--
-- Name: lg_pack_tran_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lg_pack_tran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lg_pack_tran_id_seq OWNER TO postgres;

--
-- Name: lg_pack_tran_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE lg_pack_tran_id_seq OWNED BY lg_pack_tran.id;


--
-- Name: lg_paypal_order; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lg_paypal_order (
    id integer NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
    item_name text DEFAULT ''::text NOT NULL,
    paypal_transaction_id text DEFAULT ''::text NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL,
    paypal_time text DEFAULT now() NOT NULL,
    paypal_payer_id text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.lg_paypal_order OWNER TO postgres;

--
-- Name: lg_quiz_buy_tran_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE lg_quiz_buy_tran_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lg_quiz_buy_tran_id_seq OWNER TO postgres;

--
-- Name: lg_quiz_buy_tran; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE lg_quiz_buy_tran (
    id integer DEFAULT nextval('lg_quiz_buy_tran_id_seq'::regclass) NOT NULL,
    buyer integer DEFAULT 0 NOT NULL,
    seller integer DEFAULT 0 NOT NULL,
    question_id integer DEFAULT 0 NOT NULL,
    point integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.lg_quiz_buy_tran OWNER TO postgres;

--
-- Name: mt_block_generate; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mt_block_generate (
    usr_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.mt_block_generate OWNER TO postgres;

--
-- Name: mt_block_hijack; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mt_block_hijack (
    usr_id integer DEFAULT 0 NOT NULL,
    ymd text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.mt_block_hijack OWNER TO postgres;

--
-- Name: mydata; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE mydata (
    usr_id integer DEFAULT 0 NOT NULL,
    answer_by_u text DEFAULT ''::text NOT NULL,
    answer text DEFAULT ''::text NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.mydata OWNER TO postgres;

--
-- Name: pack; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pack (
    id integer NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL,
    txt text DEFAULT ''::text NOT NULL,
    sample_q integer DEFAULT 0 NOT NULL,
    activate integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.pack OWNER TO postgres;

--
-- Name: COLUMN pack.activate; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN pack.activate IS '0=not open, 1=open';


--
-- Name: pack_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pack_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pack_id_seq OWNER TO postgres;

--
-- Name: pack_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pack_id_seq OWNED BY pack.id;


--
-- Name: paid_usr; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE paid_usr (
    id integer NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
    pack_id integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.paid_usr OWNER TO postgres;

--
-- Name: paid_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE paid_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.paid_user_id_seq OWNER TO postgres;

--
-- Name: paid_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE paid_user_id_seq OWNED BY paid_usr.id;


--
-- Name: pay_answered_news; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pay_answered_news (
    id integer NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
    summary integer DEFAULT 0 NOT NULL,
    pay_q_id integer DEFAULT 0 NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL,
    q_txt text DEFAULT ''::text NOT NULL,
    q_img text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.pay_answered_news OWNER TO postgres;

--
-- Name: pay_answered_news_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pay_answered_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pay_answered_news_id_seq OWNER TO postgres;

--
-- Name: pay_answered_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pay_answered_news_id_seq OWNED BY pay_answered_news.id;


--
-- Name: pay_choice; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pay_choice (
    choice_0 text DEFAULT ''::text NOT NULL,
    choice_1 text DEFAULT ''::text NOT NULL,
    choice_2 text DEFAULT ''::text NOT NULL,
    choice_3 text DEFAULT ''::text NOT NULL,
    question_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.pay_choice OWNER TO postgres;

--
-- Name: pay_comment; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pay_comment (
    id integer NOT NULL,
    txt text DEFAULT ''::text NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
    pay_q_id integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.pay_comment OWNER TO postgres;

--
-- Name: pay_comment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pay_comment_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pay_comment_id_seq OWNER TO postgres;

--
-- Name: pay_comment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pay_comment_id_seq OWNED BY pay_comment.id;


--
-- Name: pay_correct; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pay_correct (
    id integer NOT NULL,
    pay_q_id integer DEFAULT 0 NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.pay_correct OWNER TO postgres;

--
-- Name: pay_correct_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pay_correct_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pay_correct_id_seq OWNER TO postgres;

--
-- Name: pay_correct_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pay_correct_id_seq OWNED BY pay_correct.id;


--
-- Name: pay_incorrect; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pay_incorrect (
    id integer NOT NULL,
    pay_q_id integer NOT NULL,
    usr_id integer NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.pay_incorrect OWNER TO postgres;

--
-- Name: pay_incorrect_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pay_incorrect_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pay_incorrect_id_seq OWNER TO postgres;

--
-- Name: pay_incorrect_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pay_incorrect_id_seq OWNED BY pay_incorrect.id;


--
-- Name: pay_q; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pay_q (
    id integer NOT NULL,
    pack_id integer DEFAULT 0 NOT NULL,
    txt text DEFAULT ''::text NOT NULL,
    img text DEFAULT ''::text NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.pay_q OWNER TO postgres;

--
-- Name: TABLE pay_q; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE pay_q IS 'this question is needed to be paid';


--
-- Name: pay_q_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pay_q_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pay_q_id_seq OWNER TO postgres;

--
-- Name: pay_q_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pay_q_id_seq OWNED BY pay_q.id;


--
-- Name: paypal_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE paypal_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.paypal_order_id_seq OWNER TO postgres;

--
-- Name: paypal_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE paypal_order_id_seq OWNED BY lg_paypal_order.id;


--
-- Name: private_news; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE private_news (
    id integer NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
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
    usr_id integer DEFAULT 0 NOT NULL,
    img text DEFAULT ''::text NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL,
    open_time timestamp without time zone DEFAULT now() NOT NULL
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
-- Name: quiz_buy; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quiz_buy (
    id integer NOT NULL,
    buyer integer DEFAULT 0 NOT NULL,
    seller integer DEFAULT 0 NOT NULL,
    question_id integer DEFAULT 0 NOT NULL,
    point integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.quiz_buy OWNER TO postgres;

--
-- Name: quiz_buy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quiz_buy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.quiz_buy_id_seq OWNER TO postgres;

--
-- Name: quiz_buy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE quiz_buy_id_seq OWNED BY quiz_buy.id;


--
-- Name: send_money; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE send_money (
    id integer NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
    email text DEFAULT ''::text NOT NULL,
    yen integer DEFAULT 0 NOT NULL,
    bank_info text DEFAULT ''::text NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.send_money OWNER TO postgres;

--
-- Name: send_money_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE send_money_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.send_money_id_seq OWNER TO postgres;

--
-- Name: send_money_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE send_money_id_seq OWNED BY send_money.id;


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
-- Name: tag_rank; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tag_rank (
    id integer NOT NULL,
    tag text DEFAULT ''::text NOT NULL,
    usr_id integer DEFAULT 0 NOT NULL,
    create_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.tag_rank OWNER TO postgres;

--
-- Name: tag_rank_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tag_rank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tag_rank_id_seq OWNER TO postgres;

--
-- Name: tag_rank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tag_rank_id_seq OWNED BY tag_rank.id;


--
-- Name: usr; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usr (
    id integer NOT NULL,
    pv_u_id text DEFAULT ''::text NOT NULL,
    provider integer DEFAULT 0 NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    img text DEFAULT ''::text NOT NULL,
    update_at timestamp without time zone DEFAULT now() NOT NULL,
    point integer DEFAULT 0 NOT NULL,
    introduce text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.usr OWNER TO postgres;

--
-- Name: COLUMN usr.provider; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN usr.provider IS '1=FB, 2=TW, 3=G+, 4=LN';


--
-- Name: usr_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE usr_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.usr_id_seq OWNER TO postgres;

--
-- Name: usr_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE usr_id_seq OWNED BY usr.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY answered_news ALTER COLUMN id SET DEFAULT nextval('answered_news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comment ALTER COLUMN id SET DEFAULT nextval('comment_id_seq'::regclass);


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

ALTER TABLE ONLY incorrect ALTER COLUMN id SET DEFAULT nextval('incorrect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lg_pack_tran ALTER COLUMN id SET DEFAULT nextval('lg_pack_tran_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY lg_paypal_order ALTER COLUMN id SET DEFAULT nextval('paypal_order_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pack ALTER COLUMN id SET DEFAULT nextval('pack_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY paid_usr ALTER COLUMN id SET DEFAULT nextval('paid_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pay_answered_news ALTER COLUMN id SET DEFAULT nextval('pay_answered_news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pay_comment ALTER COLUMN id SET DEFAULT nextval('pay_comment_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pay_correct ALTER COLUMN id SET DEFAULT nextval('pay_correct_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pay_incorrect ALTER COLUMN id SET DEFAULT nextval('pay_incorrect_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pay_q ALTER COLUMN id SET DEFAULT nextval('pay_q_id_seq'::regclass);


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

ALTER TABLE ONLY quiz_buy ALTER COLUMN id SET DEFAULT nextval('quiz_buy_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY send_money ALTER COLUMN id SET DEFAULT nextval('send_money_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tag_rank ALTER COLUMN id SET DEFAULT nextval('tag_rank_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usr ALTER COLUMN id SET DEFAULT nextval('usr_id_seq'::regclass);


--
-- Name: answer_by_pay_q_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY answer_by_pay_q
    ADD CONSTRAINT answer_by_pay_q_pkey PRIMARY KEY (pay_q_id);


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
-- Name: choice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY choice
    ADD CONSTRAINT choice_pkey PRIMARY KEY (question_id);


--
-- Name: comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id);


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
-- Name: lg_pack_tran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lg_pack_tran
    ADD CONSTRAINT lg_pack_tran_pkey PRIMARY KEY (id);


--
-- Name: lg_quiz_buy_tran_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lg_quiz_buy_tran
    ADD CONSTRAINT lg_quiz_buy_tran_pkey PRIMARY KEY (id);


--
-- Name: mt_block_hijack_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mt_block_hijack
    ADD CONSTRAINT mt_block_hijack_pkey PRIMARY KEY (usr_id);


--
-- Name: mydata_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY mydata
    ADD CONSTRAINT mydata_pkey PRIMARY KEY (usr_id);


--
-- Name: pack_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pack
    ADD CONSTRAINT pack_pkey PRIMARY KEY (id);


--
-- Name: paid_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY paid_usr
    ADD CONSTRAINT paid_user_pkey PRIMARY KEY (id, usr_id, pack_id, create_at);


--
-- Name: pay_answered_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pay_answered_news
    ADD CONSTRAINT pay_answered_news_pkey PRIMARY KEY (id);


--
-- Name: pay_comment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pay_comment
    ADD CONSTRAINT pay_comment_pkey PRIMARY KEY (id);


--
-- Name: pay_correct_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pay_correct
    ADD CONSTRAINT pay_correct_id_pkey PRIMARY KEY (id);


--
-- Name: pay_incorrect_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pay_incorrect
    ADD CONSTRAINT pay_incorrect_id_pkey PRIMARY KEY (id);


--
-- Name: pay_q_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pay_q
    ADD CONSTRAINT pay_q_pkey PRIMARY KEY (id);


--
-- Name: paypal_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY lg_paypal_order
    ADD CONSTRAINT paypal_order_pkey PRIMARY KEY (id);


--
-- Name: private_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY private_news
    ADD CONSTRAINT private_news_pkey PRIMARY KEY (id);


--
-- Name: question_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pay_choice
    ADD CONSTRAINT question_id_pkey PRIMARY KEY (question_id);


--
-- Name: question_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY question
    ADD CONSTRAINT question_pkey PRIMARY KEY (id);


--
-- Name: quiz_buy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quiz_buy
    ADD CONSTRAINT quiz_buy_pkey PRIMARY KEY (id);


--
-- Name: send_money_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY send_money
    ADD CONSTRAINT send_money_pkey PRIMARY KEY (id);


--
-- Name: sender_receiver; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY follow
    ADD CONSTRAINT sender_receiver UNIQUE (sender, receiver);


--
-- Name: tag_rank_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tag_rank
    ADD CONSTRAINT tag_rank_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usr
    ADD CONSTRAINT user_pkey PRIMARY KEY (id);


--
-- Name: an_news_u; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX an_news_u ON answered_news USING btree (usr_id);


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
-- Name: pay_an_news_u; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX pay_an_news_u ON pay_answered_news USING btree (usr_id);


--
-- Name: qu_u; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX qu_u ON question USING btree (usr_id);


--
-- Name: session_block_usr_id; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX session_block_usr_id ON mt_block_hijack USING btree (usr_id);


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

