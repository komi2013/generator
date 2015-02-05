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
-- Name: answered_news; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE answered_news (
    id integer NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    summary integer DEFAULT 0 NOT NULL,
    updated_at integer DEFAULT 0 NOT NULL,
    question_id integer DEFAULT 0 NOT NULL
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
-- Name: answered_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('answered_news_id_seq', 29, true);


--
-- Name: correct; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE correct (
    id integer NOT NULL,
    question_id integer DEFAULT 0 NOT NULL,
    user_id integer DEFAULT 0 NOT NULL,
    created_at integer DEFAULT 0 NOT NULL
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
-- Name: correct_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('correct_id_seq', 2032, true);


--
-- Name: csrf; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE csrf (
    id integer NOT NULL,
    token text DEFAULT ''::text NOT NULL
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
-- Name: csrf_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('csrf_id_seq', 856, true);


--
-- Name: follow; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE follow (
    id integer NOT NULL,
    sender integer DEFAULT 0 NOT NULL,
    receiver integer DEFAULT 0 NOT NULL,
    created_at integer DEFAULT 0 NOT NULL
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
-- Name: follow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('follow_id_seq', 54, true);


--
-- Name: followed_news; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE followed_news (
    id integer NOT NULL,
    receiver integer DEFAULT 0 NOT NULL,
    sender integer DEFAULT 0 NOT NULL,
    sender_img text DEFAULT ''::text NOT NULL,
    created_at integer DEFAULT 0 NOT NULL
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
-- Name: followed_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('followed_news_id_seq', 9, true);


--
-- Name: incorrect; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE incorrect (
    id integer DEFAULT nextval('correct_id_seq'::regclass) NOT NULL,
    question_id integer NOT NULL,
    user_id integer NOT NULL,
    created_at integer NOT NULL
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
-- Name: incorrect_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('incorrect_id_seq', 1, false);


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
    img text DEFAULT ''::text NOT NULL
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
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_id_seq', 682, true);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sessions (
    session_id character varying(40) NOT NULL,
    previous_id character varying(40) NOT NULL,
    user_agent text NOT NULL,
    ip_hash character varying(32) DEFAULT ''::character varying NOT NULL,
    created integer DEFAULT 0 NOT NULL,
    updated integer DEFAULT 0 NOT NULL,
    payload text NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: sm_answer; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sm_answer (
    question_id integer NOT NULL,
    correct integer DEFAULT 0 NOT NULL,
    amount integer DEFAULT 0 NOT NULL,
    updated_at integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.sm_answer OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "user" (
    id integer NOT NULL,
    pv_u_id text DEFAULT ''::text NOT NULL,
    provider integer DEFAULT 0 NOT NULL,
    name text DEFAULT ''::text NOT NULL,
    img text DEFAULT ''::text NOT NULL,
    updated_at integer DEFAULT 0 NOT NULL
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
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('user_id_seq', 81, true);


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

ALTER TABLE ONLY question ALTER COLUMN id SET DEFAULT nextval('question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "user" ALTER COLUMN id SET DEFAULT nextval('user_id_seq'::regclass);


--
-- Data for Name: answered_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY answered_news (id, user_id, summary, updated_at, question_id) FROM stdin;
5	1	1	1414682918	568
6	63	1	1414761629	641
8	7	1	1414762349	634
4	63	3	1414764940	643
11	7	1	1414765005	632
12	53	1	1414765110	569
13	7	1	1414765335	577
14	55	2	1414858527	579
9	64	19	1414898741	649
10	65	5	1414899299	647
\.


--
-- Data for Name: correct; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY correct (id, question_id, user_id, created_at) FROM stdin;
1974	643	63	1414664451
1977	643	65	1414761335
1978	641	65	1414761629
1979	637	65	1414762123
1981	649	66	1414764390
1982	647	66	1414764905
1983	643	66	1414764940
1984	637	66	1414764991
1986	569	66	1414765110
1988	649	64	1414766202
1989	649	65	1414802872
1996	649	68	1414814050
1997	649	69	1414814129
1998	649	70	1414814978
1999	649	71	1414815049
2000	649	72	1414815560
2004	647	74	1414842739
2005	649	75	1414845089
2007	579	76	1414858526
2008	649	76	1414858546
2009	647	76	1414858590
2010	649	77	1414898741
2011	651	77	1414899279
2013	653	77	1414900153
2014	653	75	1414900220
2018	651	63	1414920844
2020	656	65	1414921675
2021	660	75	1414922250
2022	658	58	1414924446
2026	680	78	1415003274
2028	681	80	1415013021
\.


--
-- Data for Name: csrf; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY csrf (id, token) FROM stdin;
2	cJfC7WORMIsokztA
4	jTrwa6dkCvFYvrjT
7	z7ES3Zh5J97lrnBV
8	WsdG2eVUI9ah2Pd5
9	B6GpEuPPBFwLBgEz
10	e2GOlAq1Xan1YEeD
11	NlODJQhLxtLEPOfI
12	QFYsoAYgYQhio0GK
13	wLhq39z50PA9Tetk
14	vx9TWGxLCSNLS0Q1
15	Tz9O8eww23K3iKYa
16	H02vO0qQmvUopo6g
17	mJ79c6yXlXz7E7Dq
18	XLVrc0k8av8lMmmv
19	okzTA9fV5Qs4UPCJ
20	F5fxrNjWqLZeIex4
21	OsqibFwNYx4scp8N
22	ERDTq7v2FPfGR6VX
23	m7246hWjOlsFEWFR
24	KFApGN2FthgDSvTt
25	ljCDRa7nxKij0bqW
26	tCny60M6u7ld405e
27	5r7twOZBZekQUUmu
28	Fr0ki32iQNkg8B2E
29	b2OaBQZsqtxJgsZR
30	ZeJPrlHxgibapJhN
31	Enln1EvSE5aok8xE
32	cD08KMQXXSjDVSA2
33	d8qBXdeT4qMaFVXq
34	AFfHhSHt9iAaroJp
35	r6oOuBxto4tgNGIm
36	9REHnuZ9Z7BEE4av
37	b8WuudXTGCmIMILq
38	f1M1QojMh1du9vH5
39	fJt7WsEiGu7ZCZFT
40	wqlazZ18mX83WRPH
41	Nf3JsyWCWAWLqrUE
43	jlExz93tAV8oMHTs
45	jgL1S1O9qlAWZPOE
46	4wE6UOnCsvk6h6sD
47	YBWYaZG3g7O2ZCpf
48	KuSzfTgEtBGL07Pc
49	NsY15DqZk29mn1P0
50	T42zkmlzqTpgjvET
51	t8WsDFz9vUK1vFsG
52	YkwTQwshjV8sEKPE
53	V4B3dNgx7Zyw3NMX
54	pkrb5J4xceqJu2ZM
55	DSG9Hy8wZF5DVeAf
56	073BnrFP0tSQzsZA
57	Zhp7rFF1VFlCD89z
58	umyaDJHqEPqjynYW
59	cHQRO7oIUaHkIPgJ
60	GJotGiGs6scVozZP
61	F0tOPy2s3tBG8o6g
63	wyYcsYC15E9AcGgp
64	Jo2U9uJtLsHmtG5x
65	gVGGk84aA1NgbntZ
66	i1Tt19IHTwHKvZ3C
67	gYCETe52oA1x8jwA
68	IPYW2mRBwfjeziXu
69	PdzuqTlKgpR9I2uu
70	wl3AeIWFn62GlyIe
71	lLMW6jNDfaHnt8VL
72	m6LAAymyFoVVycsG
73	OxHXv5FsvDWdueh6
74	AA13nD4ouER6cGBK
75	UjgGJXQefunX1wLf
76	WOtJd4j6veHzPQgI
77	3vzbrk1wRBNsbw3p
78	t3DruALZNtFcjFQA
79	VKGifySpir4EL2UB
80	3hR4LWatWD8QK7LI
81	fv3L2KLbPuVecPHY
82	QNQpixICFLqFgfGy
83	AbgycvtKcAnkpawp
84	qd2GT6HgKaJdUO9j
85	0PtAR9poP97yVhXF
86	9fzfEms6hDxlz133
87	xBV8NdGf4xvS4krO
88	5jPvRyWWeMLV64UX
89	TSZ5ROfA3lwnlt3U
90	wAyHeczuQJJy5RLx
91	9BfmI2hTUR1t4mrU
92	yiii1lFUl9w8ZykE
93	zSIdftDx0jas6qHj
94	rbctrC9tUXd26w0P
95	S9OdUj14JpzdRhNT
96	L0is0nNbPGZtleU3
97	1geJeyVOulPiCAeK
98	VbyhPQfnogTvljsU
99	gNPfiY4wXUQgFwHy
100	vey8Yz2B3V6dp8os
101	VJT6OAx4gz4apQMf
102	fBdMP7ZOFLxWVawI
103	FQ7MQ9AvrSAu7DZb
104	FouyGbyfxxXkGraz
105	mbcOFYAKrVN1k6y4
106	eSzOiokRKdha0zA6
107	jUKwjKpFotG4l76e
108	hLwaI7WQxQLGrfpW
109	SkmkjglxlIdpmW3A
110	0UC2a3KFV3BSU0oC
111	LVDUj1uZDmjYQuRb
112	DMpEBUCtRDjCTcLa
113	YdFDjK8JinLaRrLp
114	LW8lUQHPeDzGT1qU
115	0ietkHwo57hQeVUQ
116	aiGhpHjr65eU8MXz
117	2hVypMiVnSIw0BCW
118	UfTbknnXgLTYUN0Q
119	KeTWTIh6A9f8Cutj
120	kotZz03npNywweow
123	vxXOaffgq0YtTBFf
124	J0UIFf2Kn4zkhQpx
125	rKmPSiJjI0VGRFgQ
126	8CFiEJOrmoNAKwKY
127	yloEMgn1ClFAfvcx
128	tyO4SGFk9Igg024n
129	m2HC3OKacXqJrsaI
130	aFDm7osKZj9sjo6e
131	EqNzkj59ScM0xvFq
132	Um7gncpROTwWignN
133	TXvTGipRtRXhpHiq
134	a7xrslSnySVE2RkJ
135	0HcMKNHcLQmIeq1q
136	q6q2bccr7f5MKPBB
137	Mu0MGOSfHMzQ0gj9
138	pkcPntt1lw9fKrDM
139	t7kBOlk8PrXG3awr
140	fjpeXZTRq2D7B2MJ
141	PVbSaid3YdMUEoBX
142	Ol5ebgJDqiyk3clj
143	hKrcArcynN6Uq49J
144	EpKqg0iiKVzKN8g2
145	Cv5qOYYG172cFhiT
146	uA2QuxnujPeHiaE0
147	Jr8BbOT4hHYGRTF1
148	TKxrhMa74RFLBmb3
149	rlAnYjwowQG6B993
150	vBdgTjPxwbzVvZrz
151	oeTrKJYODesFbGlG
152	eXwpOxOUXtxWluY5
153	LM0uVmXEdmvpUUQ2
154	7thROcrQffrjAQoS
155	e21nJWGBNmqhoVsl
156	Z7K0jckPBbxuNg0w
157	7lJKKw9CkwfrXVIM
158	OxCMuMGavyLtYjT7
159	Qg91Nn8cLh9nJ7QE
160	UyCRNtK4xN0h4wdC
161	0THYGDa3A43r9Yvf
162	LjTSvS9vpRfVJSTj
163	eB0o1daUpBEUatuj
164	Tqeh3Bpl9UcWoIXo
165	MqmXfJnmbMZ6YtEA
166	Z8cT0CR7CyHT31AA
167	8w6si6d8SJtvjwPM
168	zXkENwuBpNeAGnen
169	1qks5VSCk9Cdydny
170	FrztTlpctw04I0yv
171	joos6gLybFjaaGk2
172	5Icyd0J7lfDSeKlk
173	KpSSjftCAknc3JZu
174	KIhcpwkSJhKGljOJ
175	17IDOXpnRIbVKuzS
176	ep0jQm1LENUCImdR
177	oRr8PYDkpKrWxaF5
178	tmlnzPSu4ncmZbOE
179	UEbv31tWKxWIKLZj
180	DxQ5KFty2y1kuv43
181	MxTWFVG0R2WBBoKh
182	xRpUp1BphaxGgrEp
183	ko0LR6YxLoJndYqm
184	CfaRJit6bsS2ESwY
185	pKLBMXSezuqJPnHb
186	CpE95vpxYfKpl4KT
187	Bodp72mswxloriHO
188	moAtAe9pvTrwPklA
189	h422l4VrqevYiLyM
190	RIxOmlJnQ6WVea3w
191	xykLwqATnOjwzYn3
192	uhW9gehGds5YRSTM
193	hwLZxCLSr70qJGgc
194	6throD3gix6VLb8t
195	S95pl5QaZGprdrHU
196	AcW3vW8FpiSPDnH1
197	JbwoKEMZIVNx6nwA
198	TljS6idjXMG5MmE7
199	teRkh3JdHnIytQbR
200	zEqhManXJLkV1SWy
201	qw98AmtIqOijTGY6
202	kGGvTQhNPeZTUI0L
203	25U6GPpiZ8TxIUxU
204	y2AAVqqvlMUZ8IFx
205	ItkLwQzRqq6xA1Hb
206	6WWCKaM4zEobF5UC
207	FYSBWsgFAQm24ExB
208	UqJJkDc0BtHuEAoR
209	KTOfpLTrte482KeF
210	zmwtadGB9OUMb9gf
211	bCuJYpv0zvgW2Dek
214	SNp8xkuzgfOF9Lu5
216	kZllyitTe0zaGQW9
218	veFidEHIYKjvBqau
219	37OiAaDRhW9tlHqq
220	tSMqb0IsM6LYLcAo
221	aIU1RnQvjBP6b9bi
222	Yn66IMHlC35pnaIK
225	B66fRiZgKWbdl2xA
226	syopNuibL3a5sVYu
227	NwBvlBR8XH6AkxvU
228	HH8uGLs9BfQi9C7o
229	ZYrwk4Oa59CoQOB9
232	rndstmqbYlY2gbkO
233	mvhg48PgnWEHlIlA
234	nIXkHNMgHey1Y3CT
235	ZVtldpu0Z2OKAqbQ
236	VxxkHSfK9gJGhq1G
237	xb01Re9cEFWO0sZI
240	F7RoyDBoPZQ1z3Br
241	32h17YcEFeHoDUCu
243	tDFdFF1n0d0bQZGh
244	OTM12SaXbBvsNbB4
245	3IcnF5g4QfoBzZFA
246	QK1Fup4gCrRLFWFb
247	eBgGMhaPHyVvKqk1
248	oB8LRLFLDIvdM5TB
249	nJ6BYZxCc022tEch
251	BicFKhBo5kWwoSu3
255	WAaIlRe4n7FdRNmK
257	e1kCkgaQ7qbKMJ3l
258	iyd3q0RZ14NB74Di
259	ZAYzLcZl5qz5qxeX
260	hbQlDrGZQmvkr9rP
262	xysR2L1731ACNuSP
263	sp25Lk9HV4OH0171
266	a6bdFIWbnp4E5Zmr
268	hlzdgrhlXIliCs6M
269	TDmfQnbHahfXJ7xS
270	EA0wZ3niHKr3ApjB
271	gAMOAdEibAw2Tp3T
272	NNYLmcdJWd0BXnsa
273	aiDliLrl1nxcH5hf
274	cYoc5F4r2bXhMWGV
275	091cYPktnTMwsL2u
277	gpXtyDpZK9pdSE8G
278	AwHu8oUAKqIrns4J
279	iFKkjGnruasMiqrn
280	F7YOBTHbbngwHd7k
281	Q3yG7xE2253b735R
282	4UsPcuJTApohIiqP
283	gE9lwuRFyn7c1olV
284	lUirJR3UL3az9N0I
285	tHVTS5nEWeNVW5IZ
286	9yUyNPx3JOQHjekC
287	tWmFpCblyPfEuoVx
288	SxWYPWtWsOOMwddO
289	Wg58pZ4x0f6jKNZ1
290	40Y5od4pCaNrmhIc
291	Etjzims2Z2fEKFyK
292	VljN2prWcqyACDRY
293	PqAWgGPTttaA2ySp
294	ocnUpv87E4cHG2jW
295	p9l3CABc2YghmpG3
297	3E1RlgBdEj2rwc1i
298	QM0Ee3arq0m4CtZm
299	jUB7QSgNkDiV4vSD
300	bQ7PKImwKuoChMWz
301	AKKP4mErXEOJUgEc
302	ATvQ6UUbigMgp014
303	VZFUSf2bL15YYFwF
304	g9st8QKjJv5L89iR
305	eU9APAsTTYxAYwyB
307	FHZfTDMNv3isaZVM
311	MTl2FdzkcHD1HIo4
312	YvNCa0E0WrdT8BIr
313	eBObr9gHPKzwPehc
314	LD3Y8u4Ukzq2VY50
315	XqJ0d69wlyYeQh1t
316	2uU0JqwQzgkM3rbJ
317	JJB0AGtLBmcAnqLc
318	y1u6HJ0nrHxLAVDs
319	782hSTlkGB0UluFo
320	HCDMHA3tDi4DEsvg
321	0n03IaXVWlYKTlmq
322	9LEz8cm6d3SlOWUg
324	SwWF6oZaTdC5u3sM
325	euH8vGnZvVTDy8Av
326	9wmOgCPshb6FogK0
327	AC00kPrsyzxJcCsh
328	gSdjiWBpQGGV0fiE
329	J1FRGOZMRCIjzMnr
330	DZ56TkWTuYg2NMwZ
331	vPCkWh3k5N3mhECX
332	zk7SiDY2zttzVlh2
333	OUsPpfyAD5OS8qO1
334	wIMHAuAjzwoGpQrz
335	UywNvXbOIZbzqxLf
336	G76m93xJZIfJdpww
337	82yuwBzv7s7fxpj9
338	OKToIWSdnpITNRVW
339	BPNUYzq3i8Mlv4e8
340	7WBYXeCvB12VdxA1
341	YpFGnAtwtbJIfs2N
342	co8EcsxMgNcBShQ5
343	uqGtO8bdKL1EScaJ
344	9TnPF1HVNZGuHkWc
345	lCo6fblF38bPrzpk
346	NcFvuVsEms42wcbB
347	Nq7PargF4y0GmSYY
348	jIgSwBnBA0FwvhlL
349	xjmB77KJFc6ll2ab
350	vTWh4RxiWoMTeCBe
351	4cQRKijkozwbdDnX
352	DpUZB4qnAI62HTnP
353	xhzTXyxGKjeH3fJC
354	D8bgxh27zS2JtWRs
355	4uGIN71VMvZFkwoq
356	oH1ymRYyB4qc4i9S
357	UL1k1rc38jDcF0TC
358	hq4mRXU3EeaeE5UF
359	prnIpuJgfuScDznX
360	f9lnoeiAsygCkfBH
361	BRs51kSeHf8lB4ka
362	HVPfA0bFasNxOnfw
363	QUIPlHg9zLend4TW
364	I2jp7PpwxjC8pqHd
365	aRWqWPdtfE5gkLRk
367	MqElZ2mMwVx0fheZ
368	nInT7HgDGn3STH40
371	EJNtTWoKAgdJctrT
374	wxpFrx1smMIb9vW3
377	9e4BN5xkLA22OC6I
378	aiMy6bYgbOuBkBwj
379	IAoWTz2Pemobk9NC
381	MGtfWXORGhkYuPuo
382	LfMVbr2lSPiScGvC
383	mq1sz5aytQafbhyK
384	lEGPLpffhdjRoS7X
385	Kvr6O6DJDabqXzZY
386	1GJfz0RZdpDzhFqI
387	wnCa9XQDGbusvfuj
388	x61qJg8L2zOwiFSO
389	s3xaf2CWnQvYWWpk
390	kJsMGB0QJtUQemda
391	78daPhNIsHA9ztQm
392	TjR0DbWTYe7GSHYd
393	U36EUlYnofX3OxZ3
394	8graceh4t31mbst1
395	CoBon20t40UxG5fo
398	1uRUkD22UALnq0xz
401	v05P41fBN1cyIxUC
402	v7r2938GgnUY3et8
403	7wy4ov97GEUETbCO
404	fkE5wdURYqz62Xmf
405	Rl1BKFjuRNuSXuD3
406	WoB2HX42yj4QnS4P
407	K0Vjdiw3aT8kf32u
408	0qaMfoqQgEwevMR3
409	tHP9zib6Rej09vRr
410	BSRUWraKfRCoSiTW
411	hzzBuboBEPUyOcrW
412	hjBykvhXo1zfpZVd
413	YFokSpzM9C3X6DNS
414	atraf13bZ4VL5ueZ
416	61sk6Yjt3cp1uSp4
417	9hrIYDsM1wCaYH2X
418	BVzToUswtde68iCs
419	hG0ac9weMGwpHG70
420	yXKwGZDMEgtEi0LV
421	0JY6RigZsGncjRlu
422	dpigilAOvnmW60Sd
423	bVhZG1FfWyKuZbtN
424	swgpbYHBTxkqNNuu
425	iluO4ZIkdCKjjPDx
426	8R9tXMvpqovu1Hcz
428	Fy4HaYuzCKHElStw
429	60AOV2DbTnh8nXmf
430	GwMbix9SCkgZ8V7R
431	Q4KeDJjnFWENLEBr
432	T0OXH8r5e9YkzoN0
433	VDVH8qUjqgVdsiPR
434	QUXJWSLIbSEL1CQf
435	ieiclrhZl6SeqaVg
436	1dMXcvnkr1oP2hEW
437	r7SA6YkKyUOy0M9w
438	XySvRebRAlL3f86a
439	A9RF21hOKb9JlDZj
440	BUB9QOgCPyMXktzf
441	NDLN47f4Haa60Wp3
442	pibwYUN9NsamQihl
443	5v9lWDSlrBxe5MHj
444	rs6XI0zjOTc5B3ju
445	rjViQdemXmEVhUBQ
446	xDC8d8P47QyXf9xJ
447	LOyG63nQoHCVLOtP
448	ZrQDdh0LgZSV8wMn
451	4ihFJp9hnyNvmMw2
454	BdYeulVwvPMzfG4Z
455	WrdyMILcw0zA3TWT
456	lwaReYtseQLtjUYi
458	zqJ5qshx06YJeOlO
459	rC7njluPGo4YVFvN
460	hRU5rlrRDoonrSKg
463	BR93jVJXpAixM2XU
470	6OlMe6d84OxFxO0R
471	Sp7At13qJUWHs7OB
472	Pc6kF7Y8OXLImylE
473	cCoQITQWXQeRZWX7
475	7D948BcxFNKcZhLs
476	mzt2L4cWsJ2qZjjX
477	EZOoDYJwgswHjibj
478	9PUJWsmG6UnZrnDr
479	JU8C7KbkvD7zYasX
480	zJMxlaGhKKhvaawq
481	zswpWRUF4JHWsaf3
482	CfgkuOBHbIOhHCHA
483	6WnpoNLpnsCvUcql
484	0VqBWblQ59Zweuwu
485	3g2wWMgqGo479z2u
486	luMp1xP1e5bcon05
487	5VrI1yXwbl68HH77
490	ic3kbWy6L11WAtKL
491	z8JBeYoEsjy6XLwh
492	UWZKzOIG3meH3OzC
494	aGb6GWF8P4F7UiC7
495	cyZ8EVRYu3CnKBbt
496	lu528Bx0QSeuoTe0
497	VgMUOtaYC2Bn0L3O
499	FoiSo4Jukmi5n1NU
500	3ZQJa8FRs4hsMKXq
501	00m9f6zuW4InrOPl
503	CS55rZUC1HwjfowM
504	cyn5q1K9Oh34Mfeq
505	PJy2sQGo8jZ2k0ip
507	pPLMjm7AHmfUztxT
510	ctqrMWvlAfXqUwXA
511	PAXpxiPoL9qlQgF2
512	7kFL0UaWDjGAcAYl
513	dvZ3W65L0hZKfc6t
515	ZG8NWT9M6agZyDlO
516	uCOudnfPacajJalx
517	rrPkoPOiIKa5YicN
520	vIO0ApXmLy34RsWO
524	so6yMzm1KIeUXKRc
525	NYwp4UeTfVMoqYUa
526	bTWIptTvKQs8cdgl
527	PQediDCs5q0pdqHk
529	TOoaabWkNIPQG5MO
530	ktomU9ZMOROMNJin
531	jkZ7JswbL4oFzeUv
532	xS3HWTn6hz4lEeVQ
533	i1kH9lZqDnDqIHlX
535	EMcYbiY5pQGFzBVb
536	ij0FJOShpyxQQSlx
537	k2qio8SjPmQRBr7o
538	LqJS15Qf8uXERArz
541	SQEHiODr3CtGY7DD
542	ON2Mz3zefM7x9Sco
543	Lw5w3DA8gYXTL6ky
544	vH7JuaIyTeqetQ0B
545	sK9Kp1rA8yhNhWb9
547	GfKeqX08OFGl39Gq
548	wjTILGoHcoiGI2NE
549	be6qvm1VNwACzlCI
550	dUkWSadhhGuygObO
551	R2UkpP8U73wPTWPo
553	VJdgwJezHVgxc5Sp
554	Qrl0opVR1Bi6zaKa
555	aPKYPU72mUAZKFNS
556	wR2H4mWXB7bYgtZ0
557	IFoa4qbDGdmOhLcm
558	ff6pkxhqnjionAYW
559	omtDHc9PNd83Cz9k
560	ZE55QSLMG9kTP6JB
561	CqhmecziKGr69YJS
562	worlBzRSnxYvVExL
563	2MRUyJHUrQY5uV48
564	GtI0FvP42HeRGI15
565	Bcect2HEVTWDU9R3
566	JLkkKSvieW5dssWO
567	OEmrZJ9hiPYDalZY
568	f6SHHGvWEul0S3uZ
569	rkO3IXN9KhwszHYw
570	LgarVduTafOf2cus
571	73TqeqX9xKeXtIux
572	jmckbtboNRJ5gllJ
573	Wm2CWL4rh3aSe0XO
574	XaF643YWtwX6otY5
575	Dcd7oyejB6xYbdE4
576	YN2ooxUZinybd8fv
577	4wjm9KljVlWtEd3w
578	d2NebmxELNx7SxZC
579	zpeeCtT6y3V3mxMX
580	GNLq3eYSM6RbQsMn
581	tzHYmiGTbvDGEoP4
582	ixGPAIuGxPPJcuLu
583	iXfwXsrQFzCeT0vA
584	e9LC8g8KhoiPi8pg
585	5AfijZ74QjryU4nf
586	1fBXcpe564jCavmu
587	enVJoZ5tOe6DUb9N
588	tgZraIIGQNFuBLex
589	5iemCgcgLXFWxmeF
590	3n9ewJFeE85D2CA0
591	gpCJ0YyYX4vQFGhi
592	1EUAbUFmXjIQxtZA
593	lRZMpfEJjFxjGo9g
594	xYKRnILyTVoaw7my
595	6pR8lZFYgyBXAVnF
596	SGMPK0lnB1NbgJpP
597	ZcYWxdoYByxLtxRw
598	2SeLMN5j4JD9gaQC
599	ohQj1XrycZV2Vclj
600	aJ6dnJPW3pjJYEdQ
601	Jc8ScZMHvEqH2SWb
602	0qPEWolRgGruL8L1
604	2LyDvG4ee07qoGdv
605	OdlQDaEdL0JMu2DV
606	hXVAk30DnyqOwZRZ
607	0EvjNRSVrcSYg94b
608	3O5rJvrK5pu5FBa5
609	hkkpwjE9cMqdMgMq
611	7Z6X08b8EjVXc8nk
612	RGvCwA5swuA8XRQO
614	ZEEJ1sj38XWTVzoD
615	oyztcorpCXmsIl82
616	gCXtlDNOSXHWTKYK
617	UXW4HcOzOD9qe7c0
618	g0lhdZwVo1XbM2D5
619	gjgMztEGyKGVY8be
620	OvY6jyhI00phfQDU
621	4Z40ySNtbtpKOCvi
622	DO5KWrhWE6HwPT9N
623	QPk7QNJCgzkg8CM4
624	ecOOJVb6uRTHtHK0
625	j0XZbJDWUyV8IOUz
626	nbwGe2JXmrr1y6FU
627	LSLP0ahMhR72XUU3
628	nF8bLLXJHeRgPmK1
629	k2LRHwfTiAPuugB7
630	MEaLIeoCHdRb99dx
631	88jUCkss1o4IlDjs
632	3YC8keF10Ymq6zTe
633	zytoM6bxxChkUQUu
634	KqLNOVhV7K0jPWnA
635	V6T834CSX48hZoKg
636	zbO0De40stanoex2
637	GfueKnEngGJRw1XO
638	o2YRVasScP4qFVrS
639	hBOHIMnEXt7Ojqey
640	w8L2vpyTJqogRaIa
641	CL9mtJ2L4qNKlUWY
642	pIUKedfhW0YsRE74
643	RvKcZZ2Z4X2UIHZr
644	AxVyYZzGnN5J9bNa
645	6oBCVchRD8SJxcgo
647	wAL3mLIPNbGQtLhP
649	O4Hcj6uH5mONwcrp
650	bpx1dj8PtjlguLdk
651	9Vv3fPE2BRvEnG9D
652	Lexf7bBAQX9WHl4I
653	2qoahqLY60qH8mnE
654	yHpkKuWpAFBq9QjK
655	bNdEs9CVad4yXq40
656	jlOCTwv2pZFpdImf
657	XWqTaTZZyzvtOJWS
659	FqxXljhCk8hTOe2B
660	FjQns8EnHRaMNFPl
661	KxdfX23CKP60Nr86
662	Oh3XH8iMZpgplHgI
664	7H44ODjB3xo04MnT
667	Obh79UnkeasCoD1l
669	oginGrsofvgyFt3c
670	WTqbdGXJpga3TEqv
671	Or5bFzfAEwF0c3Gf
675	VNgI48AwZeryueJQ
676	p89TyGY9BA2Hfwz9
682	FVqPDHBNAc2lovea
683	TxJ6IFz9x1MA39gu
684	jvVbcJzBjI7lpalV
685	WpPffPFI1zCVlBin
686	Z5ez03SLlF5GSNR4
687	C0psbNbBcswqX19t
689	SAQDVVuXf3LQPgcH
690	6ZznvRqxWrmRfHWP
691	MAC2ktBb2UIL29oh
693	5JTg9caJdmqlFwHF
694	ONSmvhMm4wPl7URk
695	7M97Vwiyv1Gxa6HD
696	niBmthD8TfifrPFa
697	QULgHzeBV4mbICDc
698	82lPpBlviQ1SQ9M8
699	a1TjNO5OaWyfqtIm
702	9YRmWtVt7iDpquYv
703	LcHvsUDBObORKVg8
704	p54ZVu2ugsuP0hnT
705	43ZSZnIEunt3sZdj
706	X4fFZUrwxXq9Cdf3
707	Lslh7cMSCYOE2RcU
708	eN61U4mC1sm9mwQT
710	cHnR2O86MBskpPQg
711	57gdcTyFS4ZQvToh
712	KbdJhjL9e5RTpXec
713	jbDjk9ZjVFFDJFel
714	IPSWUi78zs8ktcXU
715	OvaO1wIJmA381vtr
716	DY4rAE1AL79fpQjW
717	AStHBVOAJkipnTmu
718	HLpNLjh3sSM4XYVJ
719	Y9ZUenL7DuvtMQzO
720	CYQhHhiwQR8m2ezM
721	KFKtub1aHWnvzxhK
722	1VoNXf3TgUn0Zy9l
724	jNkluYQseSOlqHuT
725	APiuLSSOhclrV7FU
726	meYuZ8kLgR3k0gyq
727	0XyOgc8uMIRJvqXp
728	G64YZ4eF668rlQ8b
729	RVfJFjPEc6D62SgK
730	f3KUeJWVK4twjIJb
731	s5MuT3wXe3INFjdl
735	zFT1l1O5w2k2YDPn
736	MSQaJnyteBLMqpM7
737	2qkOrgWlgZ08lhWg
742	LJGxV8TL2vVaC0hC
743	emkrOUi8CCrBH3E3
744	eXOWUi95iyX0TQdt
745	bCriHxQKMu9Gklnr
746	9oS0WqBmEOS9tf9Y
747	ltxJdHVntqOMTI3i
748	fwFTiBe19TPymRAF
749	zbKYn3L8q58QsFam
750	U0rsOQ78od7pFL4D
751	8qeT0La5304NSsli
752	HSIF3l76s9kvur5G
753	NRjVybY1zOEO3bE8
754	f2m3wNNvyLmFnPH7
755	q9NVmqcMXWKGTwty
756	6ghFu21NQKztH2dS
757	BD9Sq06OJ9UlN7Xx
758	Bv3u0HFSo5UX0sRn
759	EHcQd37WM1mrR0Gp
760	1bNjlmSU2cg0I2go
761	7qUDzGIqJ830qqNU
762	uzdBUpwMlWgBh95r
763	MV6yjQZ7eAKB9kEn
767	wD0GrHyqJFT7eq8z
768	lELULWw8yJ0vm4D4
769	xWhHzuH1WmCKlfUR
770	7NYqnfLVQ5rnOnCF
772	U211yfYTSBGayLPO
773	OEKTsy5v9t778O7b
774	nFeWzlqPs4WDrqGx
775	LJdmUM8pMod6U9BK
776	juZqFqpM6y6nXiEy
777	jkn9y6rHuDuMWGtN
778	SNyk2atWn6IZeu3B
779	GVoCeYTc8oJEBQ40
780	CtB94T2Vij8LNNzK
781	kWF5zkHdeyuXtu7L
782	mcqUish2hpX9iCuO
783	obmRAvE73EOvNEX7
784	rmBBnXhGojBETed0
785	5yhukvCWGuAWeKNw
786	cT9AlIrlbLZyCqkN
787	pRBFvx78L0x1Ma3t
788	gyVaLlu6pOMygxYd
789	zw7JNQeM1Yc3hzfA
791	GWa8YWDnhyRj2jkI
792	r1Dt1pwBb6KHsSO7
793	aH8XlRbCC1xsEER6
794	ydPg3wgPOvYNoASq
795	yZmo6nuDGRk7YPRU
796	wjO29xP3Z0HK4ZfZ
797	Y4cq3B12WYLgNzH0
798	LzE1xRfMAycBWPIE
799	sF91mhKOpbTnrboB
800	cQeqi8qlyOVBoXv3
801	cDTeQuX0fsuTDn2F
802	EzPHwDwzj4Q1m4bj
803	PuO1VxhENy5eLdGl
804	yDjKw98mvjWfLlAT
805	NrKGDb01Cm0jcTZ0
807	ZM4cZE8hxWDHja0G
808	Dbk7MmD7dFYeVJvp
809	lvaBaP8GvWBn5EMD
811	CeqeQuNIc0kOQ3MX
812	ugpnCsYejI9qJhn2
815	OVv6AwhM79Gdtr9g
817	H965Ju1nllkOZaPR
821	m5M8BpKWjRuakYOM
823	W0vyNOj8ZwssG9hG
824	evYHLelub8TSnVPE
826	xSY5Rxv7ETU7FtpY
827	h88u18AShLkPMSw2
828	EA6CIWWgDFDpWLNa
829	fQ7LRkNaBZrv1Rwp
830	1C3QttC0ZZSQesWD
831	ppsKws5cllKT9xj1
832	AcU6u7icvv8WPhCD
833	5WYq6Dbsfy3tmOKT
836	pNsJSRdicKBpzdrm
838	BUq7ZmVX7qvVhLd7
839	gNQEZVB1MpUg6oro
840	moQQyVDn7JUzB8Xq
841	Ja3kWgyXQmPENELw
842	CuAmwmFWj8nBRa7z
843	svmn27DMvPstA1rR
844	FXEmwaD9PeFcMy8E
845	iHJBpOA39swOD8ux
846	kKXgrR8CDN7un58p
847	xWibq0g1HlOyJ7SJ
848	mJq8uNzFp6jewW7I
849	sLv7sEnYK79YcaWj
852	927B9Ie2XZYFqL20
853	jnpfViEkTDhfg3JK
854	gRS3RjVVFIIt0Hii
855	pHUhko4TwZ8mOfzu
856	gx7nmE2QTtr1ZG5W
\.


--
-- Data for Name: follow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY follow (id, sender, receiver, created_at) FROM stdin;
1	4	3	0
2	3	3	0
30	7	4	1414416398
39	66	64	1414765899
40	76	65	1414858605
41	75	77	1414900420
43	75	75	1414944621
44	58	58	1414979760
48	74	74	1414985480
49	78	78	1415009184
50	79	79	1415011405
51	78	79	1415012428
52	80	74	1415013087
53	81	80	1415016017
54	80	81	1415016036
\.


--
-- Data for Name: followed_news; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY followed_news (id, receiver, sender, sender_img, created_at) FROM stdin;
2	63	3	/public/img/icon/no_image.jpg	0
7	74	80		1415013087
\.


--
-- Data for Name: incorrect; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY incorrect (id, question_id, user_id, created_at) FROM stdin;
1971	632	7	1414582669
1972	634	7	1414583137
1973	635	7	1414583482
1975	643	62	1414664583
1976	568	64	1414682918
1980	634	65	1414762349
1985	632	66	1414765005
1987	577	64	1414765335
1990	649	65	1414803551
1991	649	65	1414803589
1992	649	65	1414803649
1993	649	65	1414804449
1994	649	65	1414807213
1995	649	67	1414813272
2001	649	73	1414815579
2002	647	73	1414815725
2003	649	74	1414842725
2006	579	74	1414853354
2012	647	77	1414899299
2015	637	58	1414918277
2016	653	58	1414918291
2017	651	65	1414920763
2019	651	74	1414920924
2023	658	75	1414981937
2024	678	78	1415002626
2025	679	78	1415002670
2027	681	78	1415012415
2029	679	80	1415013046
2030	678	80	1415013071
2031	682	80	1415013187
2032	682	81	1415015526
\.


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question (id, txt, user_id, choice_1, choice_2, choice_3, choice_4, created_at, img) FROM stdin;
568	質問小松	1	答え１	答え２	さんｋ	四ｄｄ	1414075273	
569	what is name of kiki's cat name?	53	jiji	mimi	nini	wiwi	1414154616	
577	camera test	7	one	two	three	four	1414215024	/assets/img/quiz/574.png
632	which season?	7	winter	summer	autum	spring	1414582628	/assets/img/quiz/631.png
634	count	7	one	two	three	four	1414583115	
637	Where is this?	58	Berarusi	Checkh	Tokyo	Moscow	1414628459	/assets/img/quiz/636.png
579	Who is this?	55	masha	<script>alert('ohh');</script>	dorsgon	frog	1414216592	/assets/img/quiz/578.png
641	which country is most population?	63	China	India	Malaysia	Brasil	1414644033	
643	what is this photo?	63	blue hill	cloud	sea	mountain	1414644178	/assets/img/quiz/20141030/642.png
635	<script>alert('what is one');</script>	7	one	two	three	four	1414583264	
645	what is this icon	65	back	go	left	right	1414763017	/assets/img/quiz/20141031/644.png
647	what is this?	65	wimax	lte	mobile phone	iphone	1414763504	/assets/img/quiz/20141031/646.png
649	Which continent?	64	south ameria	north americ	africa	australia	1414764227	/assets/img/quiz/20141031/648.png
651	what is this?	74	next	before	back	go	1414842803	/assets/img/quiz/20141101/650.png
653	これはなに?	75	ポリッジ	米	コーンフレーク	そばのみ	1414900095	/assets/img/quiz/20141102/652.png
656	what is this?	74	check	success	point	line	1414921033	/assets/img/quiz/20141102/655.png
658	Whot is it? 	58	Lion	Dog	Puma	Tiger	1414921868	/assets/img/quiz/20141102/657.png
660	which room?	74	japanese	europe	america	australia	1414921916	/assets/img/quiz/20141102/659.png
667	Caera ttest	75	one	ted	teztest	trst	1414974226	/assets/img/quiz/20141103/667.png
668	test	74	test	two	three	four	1414974278	/assets/img/quiz/20141103/668.png
669	test	74	test	two	three	four	1414975374	/assets/img/quiz/20141103/669.png
670	test	74	one	two	three	four	1414975554	/assets/img/quiz/20141103/670.png
672	kkkk	74	iiii	jjj	yyyy	ooo	1414975849	/assets/img/quiz/20141103/672.png
673	kkkk	74	iiii	jjj	yyyy	ooo	1414975869	/assets/img/quiz/20141103/673.png
674	aaa	74	bbb	qqq	www	rrr	1414975939	/assets/img/quiz/20141103/674.png
678	aaa	74	bbb	qqq	www	rrr	1414976345	/assets/img/quiz/20141103/678.png
679	test default	74	1	2	3	4	1414978968	
680	What is this?	78	potato	rice	bread	core	1415003239	/assets/img/quiz/20141103/680.png
681	tesfd	79	komatsu	seijir	kokko	dsfji	1415011370	
682	gyjhsr	80	kjfっd	gじyっd	ヴぃhf	fgytd	1415013116	
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessions (session_id, previous_id, user_agent, ip_hash, created, updated, payload) FROM stdin;
538177770a23be537748582231c23758	538177770a23be537748582231c23758	Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/32.0	d9016f716d4dca6959cb1f753e17625b	1414381719	1414381721	a:3:{i:0;a:7:{s:10:"session_id";s:32:"538177770a23be537748582231c23758";s:11:"previous_id";s:32:"538177770a23be537748582231c23758";s:7:"ip_hash";s:32:"d9016f716d4dca6959cb1f753e17625b";s:10:"user_agent";s:65:"Mozilla/5.0 (Windows NT 5.1; rv:32.0) Gecko/20100101 Firefox/32.0";s:7:"created";i:1414381719;s:7:"updated";i:1414381721;s:7:"payload";s:0:"";}i:1;a:0:{}i:2;a:1:{s:29:"flash::__session_identifier__";a:2:{s:5:"state";s:6:"expire";s:5:"value";s:40:"4d61ed4b64c7ddf3908ef61638150e724275bc4b";}}}
\.


--
-- Data for Name: sm_answer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sm_answer (question_id, correct, amount, updated_at) FROM stdin;
680	1	1	1415003274
681	1	2	1415013021
679	0	2	1415013046
678	0	2	1415013071
682	0	2	1415015526
635	0	1	1414583482
568	10	54	1414682918
641	1	1	1414761629
634	0	2	1414762349
643	3	4	1414764940
632	0	2	1414765005
569	75	101	1414765110
577	0	2	1414765335
579	1	2	1414858526
649	11	19	1414898741
647	3	5	1414899299
637	2	3	1414918277
653	2	3	1414918291
651	2	4	1414920924
656	1	1	1414921675
660	1	1	1414922250
658	1	2	1414981937
\.


--
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "user" (id, pv_u_id, provider, name, img, updated_at) FROM stdin;
3	631498789	2	komikoma	/assets/img/quiz/627.png	0
4	1156681557	1	<script>alert('seiji');Seigi</script>	/assets/img/quiz/625.png	0
63		0	<script>	/assets/img/profile/20141030/7.png	1414738955
64		0	followme	/assets/img/profile/20141031/64.png	1414765777
75		0	テスト	/assets/img/profile/20141102/75.png	1414899903
58		0	Marusja	/assets/img/profile/20141103/58.png	1414979617
81		0	Masha	/assets/img/profile/20141103/81.png	1415017023
\.


--
-- Name: answered_news_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY answered_news
    ADD CONSTRAINT answered_news_pkey PRIMARY KEY (id);


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
-- Name: sessions_payload_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_payload_key UNIQUE (payload);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (session_id);


--
-- Name: sm_answer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sm_answer
    ADD CONSTRAINT sm_answer_pkey PRIMARY KEY (question_id);


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
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

