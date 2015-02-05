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

--
-- Name: question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('question_id_seq', 908, true);


--
-- Data for Name: question; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY question (id, txt, usr_id, choice_1, choice_2, choice_3, choice_4, img, create_at) FROM stdin;
699	稲作が開始された時期は?	84	弥生	縄文	先土器	奈良	/assets/img/quiz/20141108/699.png	2014-12-04 17:50:12.665395
700	磨製石器や骨角器が貝塚等から出土	84	縄文	弥生	先土器	奈良	/assets/img/quiz/20141108/700.png	2014-12-04 17:50:12.665395
683	3万〜4万年前とされているこの石器は何か？	82	磨製石器	打製石器	石核石器	剥片石器	/assets/img/quiz/20141105/683.png	2014-12-04 17:50:12.665395
684	現生人類のこの図は何人か？	82	クロマニニョン	ネアンデルタール	北京	ジャワ	/assets/img/quiz/20141105/684.png	2014-12-04 17:50:12.665395
685	赤の部分のシュメール人中心の文明は何か？	83	メソポタミア	黄河	エジプト	インダス	/assets/img/quiz/20141105/685.png	2014-12-04 17:50:12.665395
686	アレクサンダー大王と関わりのある文化は？	83	ヘレニズム文化	ローマ文化	ギリシャ文化	ペルシャ文化	/assets/img/quiz/20141106/686.png	2014-12-04 17:50:12.665395
687	甲骨文字と関係のある文明は？	83	黄河文明	メソポタミア文明	インダス文明	エジプト文明	/assets/img/quiz/20141106/687.png	2014-12-04 17:50:12.665395
688	モヘンジョダロと関係のある文明は？	83	インダス文明	メソポタミア文明	黄河文明	エジプト文明	/assets/img/quiz/20141106/688.png	2014-12-04 17:50:12.665395
689	太陽暦と関係のある文明は？	83	エジプト文明	インダス文明	メソポタミア文明	黄河文明	/assets/img/quiz/20141106/689.png	2014-12-04 17:50:12.665395
690	くさびかた文字と関係のある文明は？	83	メソポタミア文明	インダス文明	黄河文明	エジプト文明	/assets/img/quiz/20141106/690.png	2014-12-04 17:50:12.665395
691	ハムラビ法典と関係のある文明は？	83	メソポタミア文明	黄河文明	インダス文明	エジプト文明	/assets/img/quiz/20141106/691.png	2014-12-04 17:50:12.665395
692	象形文字との関係のある文明は？	83	エジプト文明	メソポタミア文明	インダス文明	黄河文明	/assets/img/quiz/20141106/692.png	2014-12-04 17:50:12.665395
693	チグリス・ユーフラテス川と関係のある文明は？	83	メソポタミア文明	エジプト文明	インダス文明	黄河文明	/assets/img/quiz/20141106/693.png	2014-12-04 17:50:12.665395
694	スパルタと関係のないのはどれ？	83	シュメール人	ペロポネソス同盟	アテナイやテーバイ	ポリス	/assets/img/quiz/20141106/694.png	2014-12-04 17:50:12.665395
695	ガンダーラ美術と関係のある文明は？	83	インダス文明	メソポタミア文明	黄河文明	エジプト文明	/assets/img/quiz/20141107/695.png	2014-12-04 17:50:12.665395
696	キリスト教と関係のない単語は？	83	ペルシア	ローマ	ユダヤ	ナザレ	/assets/img/quiz/20141107/696.png	2014-12-04 17:50:12.665395
697	周の前の王朝は？	83	殷	秦	漢	晋	/assets/img/quiz/20141107/697.png	2014-12-04 17:50:12.665395
698	孔子が儒教を開いた時は？	83	春秋戦国時代	殷	周	秦	/assets/img/quiz/20141107/698.png	2014-12-04 17:50:12.665395
701	登呂遺跡と関係のある時代は？	86	弥生	縄文	先土器	奈良	/assets/img/quiz/20141110/701.png	2014-12-04 17:50:12.665395
702	紀元前後に100あまりの国が分立と記された書物は？	86	漢書	後漢書	魏志倭人伝	山海経	/assets/img/quiz/20141110/702.png	2014-12-04 17:50:12.665395
703	漢委奴国王印が記された書物は	86	後漢書	漢書	魏志倭人伝	山海経	/assets/img/quiz/20141110/703.png	2014-12-04 17:50:12.665395
704	江戸時代に金印が発見された福岡の島は？	86	志賀島	藍島	筑前大島	玄界島	/assets/img/quiz/20141114/704.png	2014-12-04 17:50:12.665395
705	邪馬台国を卑弥呼が治めると記された書物は？	86	魏志倭人伝	漢書	後漢書	山海経	/assets/img/quiz/20141114/705.png	2014-12-04 17:50:12.665395
706	大和国家が国内をほぼ統一した時期は？	86	４～５世紀	２～３世紀	３～４世紀	５～６世紀	/assets/img/quiz/20141114/706.png	2014-12-04 17:50:12.665395
707	氏姓制度について正しくないものは？	86	天皇の称号	豪族の称号	氏は土地を所有	氏は人民を所有	/assets/img/quiz/20141114/707.png	2014-12-04 17:50:12.665395
708	4世紀の任那加羅での戦いで正しいのは？	86	新羅と高句麗が結ぶ	倭と新羅が結ぶ	高句麗と百済が結ぶ	新羅と百済が結ぶ	/assets/img/quiz/20141114/708.png	2014-12-04 17:50:12.665395
709	図の好太王（広開土王碑）の国は？	86	高句麗	新羅	百済	加羅	/assets/img/quiz/20141114/709.png	2014-12-04 17:50:12.665395
710	倭の大王（武など5人）が中国に使いを送った世紀は？	84	5世紀	4世紀	3世紀	6世紀	/assets/img/quiz/20141117/710.png	2014-12-04 17:50:12.665395
711	図の日本独自の古墳は？	86	前方後円墳	円墳	方墳	前方後方墳	/assets/img/quiz/20141119/711.png	2014-12-04 17:50:12.665395
712	大仙陵古墳はどの天皇の古墳か？	86	仁徳	欽明	敏達	崇峻	/assets/img/quiz/20141119/712.png	2014-12-04 17:50:12.665395
713	伝来の組み合わせで正しいのは？	86	漢字 - 5世紀	儒教 - 6世紀	仏教 - 5世紀	養蚕・製陶 - 5世紀	/assets/img/quiz/20141119/713.png	2014-12-04 17:50:12.665395
714	聖徳太子に関して誤りは？	86	遣唐使	推古天皇の摂政	冠位十二階	十七条の憲法	/assets/img/quiz/20141119/714.png	2014-12-04 17:50:12.665395
715	十七条の憲法について\n＊＊をもって貫きとなす。（人の＊＊を第一とせよ）\n＊＊は？	86	和	金	力	労	/assets/img/quiz/20141119/715.png	2014-12-04 17:50:12.665395
716	十七条の憲法について\nあつく三宝をうやまえ。（＊＊を厚く信仰せよ）\n＊＊は？	86	仏教	政治	軍事	天皇	/assets/img/quiz/20141119/716.png	2014-12-04 17:50:12.665395
717	十七条の憲法について\n＊＊の命を受けたならば、必ず守れ\n＊＊は？	86	天皇	豪族	武士	親	/assets/img/quiz/20141119/717.png	2014-12-04 17:50:12.665395
718	以下について誤りは？	86	唐のあとに隋が中国を統一	唐 - 中央集権国家	新羅 - 朝鮮半島を統一	隋 - 南北朝時代を統一	/assets/img/quiz/20141119/718.png	2014-12-04 17:50:12.665395
719	飛鳥文化について誤りは？	87	聖徳太子の東大寺	最初の仏教文化	ガンダーラ美術の影響	ギリシア建築の影響	/assets/img/quiz/20141122/719.png	2014-12-04 17:50:12.665395
720	飛鳥文化を代表する図の像は？	87	釈迦三尊像	釈迦如来像	薬師如来像	四天王立像	/assets/img/quiz/20141122/720.png	2014-12-04 17:50:12.665395
721	この図は？	87	玉虫厨子の唐草模様	住吉蒔絵唐櫃	倶梨伽羅龍蒔絵経箱	金銀荘雲龍文銅製経箱	/assets/img/quiz/20141122/721.png	2014-12-04 17:50:12.665395
722	敏達、用明、崇峻、推古天皇に仕えた人物は？	87	蘇我馬子	蘇我蝦夷	蘇我入鹿	物部守屋	/assets/img/quiz/20141122/722.png	2014-12-04 17:50:12.665395
723	大化の改新で関係のない人物は？	87	蘇我馬子	中大兄皇子	中臣鎌足	蘇我入鹿	/assets/img/quiz/20141122/723.png	2014-12-04 17:50:12.665395
724	大化の改新について誤りは？	87	中臣鎌足が孝徳天皇になる	公地公民	645年	初めての元号	/assets/img/quiz/20141122/724.png	2014-12-04 17:50:12.665395
725	朝鮮の百済に援軍を送るが、唐と新羅に大敗した出来事は？	87	白村江の戦い	壬申の乱	大化の改新	大宝律令	/assets/img/quiz/20141122/725.png	2014-12-04 17:50:12.665395
726	大海人皇子が大友皇子を破った出来事は？	87	壬申の乱	白村江の戦い	大化の改新	大宝律令	/assets/img/quiz/20141122/726.png	2014-12-04 17:50:12.665395
728	701年に天皇を中心とする国家・政治が行われた出来事は？	87	大宝律令	大化の改新	壬申の乱	白村江の戦い	/assets/img/quiz/20141122/728.png	2014-12-04 17:50:12.665395
729	官制 - 中央に○官△省\n○、△が正しいのは？	87	2官8省	1官9省	3官7省	4官6省	/assets/img/quiz/20141122/729.png	2014-12-04 17:50:12.665395
730	大宰府が置かれた場所は？	87	九州	北海道	四国	東北	/assets/img/quiz/20141122/730.png	2014-12-04 17:50:12.665395
731	班田収授法で○歳以上の男子には２反、女子にはその△分の２の口分田を与える。	87	○=6,△=3	○=6,△=4	○=7,△=4	○=7,△=3	/assets/img/quiz/20141122/731.png	2014-12-04 17:50:12.665395
732	収穫高の約３%の米は？	87	租	庸	調	雑徭	/assets/img/quiz/20141122/732.png	2014-12-04 17:50:12.665395
733	労役（年１０日）か布	87	庸	租	調	雑徭	/assets/img/quiz/20141122/733.png	2014-12-04 17:50:12.665395
734	地方の特産物	87	調	庸	租	雑徭	/assets/img/quiz/20141122/734.png	2014-12-04 17:50:12.665395
735	年間６０日の労役	87	雑徭	租	庸	調	/assets/img/quiz/20141122/735.png	2014-12-04 17:50:12.665395
736	衛士は都の警備○年\n防人は北九州の防備△年	87	○=１,△=3	○=2,△=3	○=2,△=4	○=１,△=4	/assets/img/quiz/20141122/736.png	2014-12-04 17:50:12.665395
737	図の①と②で正しいのは？	87	①＝貴族、②＝賎民	①＝貴族、②＝下人	①＝皇族、②＝下人	①＝皇族、②＝賎民	/assets/img/quiz/20141122/737.png	2014-12-04 17:50:12.665395
738	白鳳文化に代表される東塔がある寺は？	87	薬師寺	法隆寺	唐招提寺	東大寺	/assets/img/quiz/20141122/738.png	2014-12-04 17:50:12.665395
739	白鳳文化に関係のない天皇は？	87	天智天皇	天武天皇	持統天皇	文武天皇	/assets/img/quiz/20141122/739.png	2014-12-04 17:50:12.665395
740	和同開珎が発行された年は？	87	708	718	728	738	/assets/img/quiz/20141122/740.png	2014-12-04 17:50:12.665395
741	710年に奈良に移った都は？	87	平城京	平安京	藤原京	長安	/assets/img/quiz/20141122/741.png	2014-12-04 17:50:12.665395
742	図の文武天皇の第一皇子は？	87	聖武天皇	元正天皇	孝謙天皇	天武天皇	/assets/img/quiz/20141122/742.png	2014-12-04 17:50:12.665395
743	法華滅罪之寺はどれか？	87	国分尼寺	国分僧寺	国分寺	島分寺	/assets/img/quiz/20141122/743.png	2014-12-04 17:50:12.665395
744	ペルシアのガラス器、インドの楽器などを収納する正倉院がある寺は？	87	東大寺	唐招提寺	新薬師寺	興福寺	/assets/img/quiz/20141122/744.png	2014-12-04 17:50:12.665395
745	天平文化で仏教を重んじた人々は？	87	貴族	農民	奴婢	職人	/assets/img/quiz/20141122/745.png	2014-12-04 17:50:12.665395
746	天平文化が栄えたときの中国の元号は？	87	唐	隋	宋	明	/assets/img/quiz/20141122/746.png	2014-12-04 17:50:12.665395
747	天武天皇の命で稗田阿礼が「誦習」していた伝承を太安万侶が編纂	87	古事記	日本書紀	風士記	万葉集	/assets/img/quiz/20141122/747.png	2014-12-04 17:50:12.665395
748	舎人親王らがまとめた歴史書	87	日本書紀	古事記	万葉集	風土記	/assets/img/quiz/20141122/748.png	2014-12-04 17:50:12.665395
749	国の地名の由来・産物・伝承などが記載	87	風土記	日本書紀	万葉集	古事記	/assets/img/quiz/20141122/749.png	2014-12-04 17:50:12.665395
750	大友家持が編者の書物は？	87	万葉集	古事記	風土記	日本書紀	/assets/img/quiz/20141122/750.png	2014-12-04 17:50:12.665395
751	万葉集は4500首収録、○で記され、天皇から農民までをおさめている	87	○=万葉仮名	○=ひらがな	○=カタカナ	○=漢字	/assets/img/quiz/20141122/751.png	2014-12-04 17:50:12.665395
752	公地公民で重い税が負担となった農民の行動は？	87	逃亡・浮浪	一揆	税を払わない	自殺	/assets/img/quiz/20141123/752.png	2014-12-04 17:50:12.665395
753	三世一身法の年は？	87	723	728	743	748	/assets/img/quiz/20141123/753.png	2014-12-04 17:50:12.665395
754	墾田永年私財法により永久に私有してもよくなり○が始まる	87	荘園	摂政	公地公民	天皇政治	/assets/img/quiz/20141123/754.png	2014-12-04 17:50:12.665395
755	平安京をつくった天皇は？	87	桓武天皇	光仁天皇	平城天皇	嵯峨天皇	/assets/img/quiz/20141123/755.png	2014-12-04 17:50:12.665395
756	○の政治介入を防ぐため平安京をつくる	87	仏教	神社	豪族	農民	/assets/img/quiz/20141123/756.png	2014-12-04 17:50:12.665395
757	京都の治安維持に○、△を設置	87	検非違使、蔵人	検非違使、国司	蔵人、国司	検非違使、郡司	/assets/img/quiz/20141123/757.png	2014-12-04 17:50:12.665395
758	○を征夷大将軍に任じ、東北の蝦夷を討つ	87	坂上田村麻呂	大伴家持	巨勢麻呂	源頼朝	/assets/img/quiz/20141123/758.png	2014-12-04 17:50:12.665395
759	高野山の金剛峯寺で真言宗の弘法大師は？	87	空海	最澄	鑑真	親鸞	/assets/img/quiz/20141123/759.png	2014-12-04 17:50:12.665395
760	比叡山の延暦寺で天台宗の伝教大師は？	87	最澄	空海	鑑真	親鸞	/assets/img/quiz/20141123/760.png	2014-12-04 17:50:12.665395
761	○の権＝荘園が国家への租税が免除される権利\n△の権＝国衙からの使者の立入を拒否することが出来る権利	87	○=不輸,△=不入	○=不入,△=不輸	○=不輸,△=不税	○=不入,△=不税	/assets/img/quiz/20141123/761.png	2014-12-04 17:50:12.665395
762	藤原伊周（道隆嫡男）との権力闘争に勝ち摂関政治の最盛期の時の人物は？	87	藤原道長	藤原頼通	藤原高藤	藤原頼忠	/assets/img/quiz/20141123/762.png	2014-12-04 17:50:12.665395
763	道長の子で摂関の地位に約50年間就いた人物は？	87	藤原頼通	藤原道隆	藤原高藤	藤原伊周	/assets/img/quiz/20141123/763.png	2014-12-04 17:50:12.665395
764	摂関政治とは天皇が幼いときは○、成人したら△として政治を行うこと	87	○=摂政,△=関白	○=摂政,△=貴族	○=関白,△=摂政	○=関白,△=貴族	/assets/img/quiz/20141123/764.png	2014-12-04 17:50:12.665395
766	○年、遣唐使は菅原道真の意見で廃止	87	894	794	1108	1192	/assets/img/quiz/20141123/766.png	2014-12-04 17:50:12.665395
767	関白である藤原頼通が建てた浄土教の建物は？	87	平等院鳳凰堂	中尊寺金色堂	法界寺阿弥陀堂	白水阿弥陀堂	/assets/img/quiz/20141123/767.png	2014-12-04 17:50:12.665395
768	紀貫之が書いた○は平仮名で書かれた和文として初期のもの	87	古今和歌集	和漢朗詠集	竹取物語	伊勢物語	/assets/img/quiz/20141123/768.png	2014-12-04 17:50:12.665395
769	貴族住宅が○の様式で建てられた	87	寝殿造	書院造	和洋折衷	浄土	/assets/img/quiz/20141123/769.png	2014-12-04 17:50:12.665395
770	○と呼ばれる日本的な絵画が発達	87	大和絵	唐絵	宋元画	水墨画	/assets/img/quiz/20141123/770.png	2014-12-04 17:50:12.665395
771	奥州の藤原氏が建てた図の建物は？	87	中尊寺金色堂	平等院鳳凰堂	法界寺阿弥陀堂	白水阿弥陀堂	/assets/img/quiz/20141123/771.png	2014-12-04 17:50:12.665395
772	在位する天皇の直系尊属である太上天皇（上皇）が、天皇に代わって政務を直接行う形態の政治は？	87	院政	摂政	関白	執権	/assets/img/quiz/20141123/772.png	2014-12-04 17:50:12.665395
773	1086年に院政を始めた天皇は？	87	白河天皇	後三条天皇	堀河天皇	鳥羽天皇	/assets/img/quiz/20141123/773.png	2014-12-04 17:50:12.665395
774	保元の乱で後白河天皇ではなく、崇徳上皇側についた人物は？	87	藤原頼長	源義朝	平清盛	藤原忠通	/assets/img/quiz/20141123/774.png	2014-12-04 17:50:12.665395
775	平将門が新皇と称して、国司を追放し関東一帯を占拠	87	承平の乱	保元の乱	天慶の乱	平治の乱	/assets/img/quiz/20141123/775.png	2014-12-04 17:50:12.665395
776	藤原純友が瀬戸内海の海賊の棟梁となり乱をおこす	87	天慶の乱	承平の乱	保元の乱	平治の乱	/assets/img/quiz/20141123/776.png	2014-12-04 17:50:12.665395
777	1028年の平忠常の乱で○氏の勢力が衰退	87	平	源	藤原	蘇我	/assets/img/quiz/20141123/777.png	2014-12-04 17:50:12.665395
778	陸奥の土豪安倍氏が国司に反抗、朝廷の命で源頼義・義家が清原氏の援助を得て平定。	87	前九年の役	後三年の役	承平の乱	天慶の乱	/assets/img/quiz/20141123/778.png	2014-12-04 17:50:12.665395
779	清原氏の反乱を源義家が平定。源氏の棟梁としての地盤が固まる。	87	後三年の役	前九年の役	承平の乱	天慶の乱	/assets/img/quiz/20141123/779.png	2014-12-04 17:50:12.665395
780	僧兵の強訴で有名な寺は？	87	興福寺と延暦寺	興福寺と法隆寺	延暦寺と法隆寺	延暦寺と金閣寺	/assets/img/quiz/20141123/780.png	2014-12-04 17:50:12.665395
781	天皇VS上皇に藤原氏・平氏・源氏がそれぞれ二派にわかれて戦乱	87	保元の乱	平治の乱	承平の乱	天慶の乱	/assets/img/quiz/20141123/781.png	2014-12-04 17:50:12.665395
782	武士の平清盛と源義朝が対立	87	平治の乱	保元の乱	承平の乱	天慶の乱	/assets/img/quiz/20141123/782.png	2014-12-04 17:50:12.665395
783	「平氏にあらざれば、人にあらず」。平氏全盛に平清盛が○になる	87	太政大臣	征夷大将軍	関白	摂政	/assets/img/quiz/20141123/783.png	2014-12-04 17:50:12.665395
784	日宋貿易で輸入品は宋銭・絹織物、輸出品は○	87	金・銀	木材	絹	鉄	/assets/img/quiz/20141123/784.png	2014-12-04 17:50:12.665395
785	国風文化の時の女性の服装は？	87	十二単	衣冠	束帯	直衣	/assets/img/quiz/20141124/785.png	2014-12-04 17:50:12.665395
786	書道の達筆で三蹟に入っていない人物は？	87	空海	小野道風	藤原行成	藤原佐理	/assets/img/quiz/20141124/786.png	2014-12-04 17:50:12.665395
787	平安時代初期の書道の上手い人、三筆でない人物は？	87	清少納言	空海	嵯峨天皇	橘逸勢	/assets/img/quiz/20141124/787.png	2014-12-04 17:50:12.665395
788	905年に醍醐天皇が紀貫之等に編纂を命じて出来た最初の勅撰和歌集。	87	古今和歌集	和漢朗詠集	竹取物語	伊勢物語	/assets/img/quiz/20141124/788.png	2014-12-04 17:50:12.665395
789	現存する最古の仮名の物語	87	竹取物語	伊勢物語	うつほ物語	源氏物語	/assets/img/quiz/20141124/789.png	2014-12-04 17:50:12.665395
790	在原業平を主人公にしたといわれている歌物語	87	伊勢物語	竹取物語	落窪物語	源氏物語	/assets/img/quiz/20141124/790.png	2014-12-04 17:50:12.665395
791	平安時代中期に成立した王朝物語の最高傑作	87	源氏物語	竹取物語	伊勢物語	土佐日記	/assets/img/quiz/20141124/791.png	2014-12-04 17:50:12.665395
792	紀貫之が任務を終えて帰る旅の途中のことを女性を装って平仮名で書いている。	87	土佐日記	蜻蛉日記	枕草子	源氏物語	/assets/img/quiz/20141124/792.png	2014-12-04 17:50:12.665395
793	清少納言の随筆	87	枕草子	方丈記	徒然草	御堂関白記	/assets/img/quiz/20141124/793.png	2014-12-04 17:50:12.665395
794	平安時代後期（白河院政期）に成立した紀伝体の歴史物語	87	大鏡	枕草子	土佐日記	源氏物語	/assets/img/quiz/20141124/794.png	2014-12-04 17:50:12.665395
795	平安時代の歴史物語。仮名文。女性の手になる編年体物語風史書	87	栄花物語	源氏物語	竹取物語	伊勢物語	/assets/img/quiz/20141124/795.png	2014-12-04 17:50:12.665395
796	平安時代末期に成立したと見られる説話集	87	今昔物語	竹取物語	伊勢物語	源氏物語	/assets/img/quiz/20141124/796.png	2014-12-04 17:50:12.665395
797	鹿ケ谷の陰謀は1177年6月に○で起こった、平家打倒の陰謀事件	87	京都	鎌倉	壇ノ浦	美濃	/assets/img/quiz/20141124/797.png	2014-12-04 17:50:12.665395
798	○源氏の挙兵、治承・寿永の乱の中で起きた美濃源氏の反平氏の一連の軍事行動	87	美濃	鎌倉	壇ノ浦	京都	/assets/img/quiz/20141124/798.png	2014-12-04 17:50:12.665395
799	1185年3月24日、関門海峡の○で最後の戦いが行われた。この戦いで平氏は滅亡した。	87	壇ノ浦	鎌倉	京都	美濃	/assets/img/quiz/20141124/799.png	2014-12-04 17:50:12.665395
800	1192年になると頼朝は征夷大将軍に任ぜられ、○に幕府を開く	87	鎌倉	京都	壇ノ浦	江戸	/assets/img/quiz/20141124/800.png	2014-12-04 17:50:12.665395
801	平氏を滅ぼした後、兄・頼朝と対立し、自立を志向したが果たせず朝敵として追われることになった人物は？	87	源義経	源義仲	平清盛	平将門	/assets/img/quiz/20141124/801.png	2014-12-04 17:50:12.665395
802	鎌倉時代御恩と奉公の主従関係で結ばれていた制度を何というか？	87	封建制度	律令制度	階級制度	公地公民	/assets/img/quiz/20141124/802.png	2014-12-04 17:50:12.665395
803	鎌倉幕府、国々には国司（公領を支配）と守護が、荘園には○がいるという、武家（幕府）と公家（朝廷）の二大勢力によって二重の支配が行なわれていた。	87	荘官と地頭	貴族と地頭	将軍と荘官	荘官と貴族	/assets/img/quiz/20141124/803.png	2014-12-04 17:50:12.665395
804	後鳥羽上皇が鎌倉幕府に対して討幕の兵を挙げて敗れた兵乱	87	承久の乱	承平の乱	天慶の乱	保元の乱	/assets/img/quiz/20141124/804.png	2014-12-04 17:50:12.665395
805	承久の乱の後、幕府は朝廷を監視する○を京都に置いた	87	六波羅探題	国司	地頭	防人	/assets/img/quiz/20141124/805.png	2014-12-04 17:50:12.665395
806	執権北条泰時が制定した武士が最初に作った法律は	87	御成敗式目	武家諸法度	建武式目	冠位十二階	/assets/img/quiz/20141124/806.png	2014-12-04 17:50:12.665395
807	将軍の補佐として北条氏が行った政治は？	87	執権政治	摂関政治	専制政治	院政	/assets/img/quiz/20141124/807.png	2014-12-04 17:50:12.665395
808	執権北条時頼の時、御家人の領地訴訟の裁判の迅速さと公正さをはかる為に設置された職名は？	87	引付衆	評定衆	引付奉行	頭人	/assets/img/quiz/20141124/808.png	2014-12-04 17:50:12.665395
809	鎌倉時代の武道で誤りは？	87	相撲	犬追物	笠懸	流鏑馬	/assets/img/quiz/20141124/809.png	2014-12-04 17:50:12.665395
810	鎌倉時代貨幣は○銭を使用していた	87	宋	明	唐	隋	/assets/img/quiz/20141124/810.png	2014-12-04 17:50:12.665395
811	鎌倉時代に同業組合を作った商工業者は？	87	座	市	楽市楽座	天下の台所	/assets/img/quiz/20141124/811.png	2014-12-04 17:50:12.665395
812	鎌倉時代の土倉は何の商売か？	87	高利貸業者	用心棒	保険会社	不動産	/assets/img/quiz/20141124/812.png	2014-12-04 17:50:12.665395
813	鎌倉時代「○寇」が２度襲う	87	元	遼	宋	明	/assets/img/quiz/20141129/813.png	2014-12-04 17:50:12.665395
814	鎌倉時代モンゴル帝国が攻めて来た時の幕府の執権は？	87	北条時宗	北条時頼	北条貞時	北条政子	/assets/img/quiz/20141129/814.png	2014-12-04 17:50:12.665395
815	1281年の2度目の襲来はどれか？	87	弘安の役	文永の役	承久の役	建久の役	/assets/img/quiz/20141129/815.png	2014-12-04 17:50:12.665395
816	○が貧窮したため徳政令を出した	87	御家人	貴族	執権	天皇	/assets/img/quiz/20141129/816.png	2014-12-04 17:50:12.665395
817	法然の南無阿弥陀仏を唱え、阿弥陀仏にすがる仏教は？	87	浄土宗	時　宗	法華宗	臨済宗	/assets/img/quiz/20141129/817.png	2014-12-04 17:50:12.665395
818	親鸞のひたすら阿弥陀仏を信じれば悪人でも救われる仏教は？	87	浄土真宗	時　宗	法華宗	曹洞宗	/assets/img/quiz/20141129/818.png	2014-12-04 17:50:12.665395
819	一遍の踊り念仏を広める仏教は？	87	時　宗	浄土宗	臨済宗	曹洞宗	/assets/img/quiz/20141129/819.png	2014-12-04 17:50:12.665395
820	日蓮の南無妙法蓮華経を唱えると、仏に救われる仏教は？	87	法華宗	臨済宗	浄土宗	\t道元\t上に同じ	/assets/img/quiz/20141129/820.png	2014-12-04 17:50:12.665395
821	栄西の自らの力で悟りに達する自力本願を旨とし、武士の間に広まる仏教は？	87	臨済宗	曹洞宗	浄土宗	時　宗	/assets/img/quiz/20141129/821.png	2014-12-04 17:50:12.665395
822	道元の自らの力で悟りに達する自力本願を旨とし、武士の間に広まる仏教は？	87	曹洞宗	浄土真宗	時　宗	法華宗	/assets/img/quiz/20141129/822.png	2014-12-04 17:50:12.665395
823	○が金沢文庫を建てる	87	北条実時	北条貞時	北条師時	北条宗宣	/assets/img/quiz/20141129/823.png	2014-12-04 17:50:12.665395
824	鎌倉時代の学問	87	朱子学	明学	蘭学	儒学	/assets/img/quiz/20141129/824.png	2014-12-04 17:50:12.665395
825	源氏、平家の盛衰興亡を百数十項目にわたって詳しく叙述	87	源平盛衰記	平家物語	方丈記	愚管抄	/assets/img/quiz/20141129/825.png	2014-12-04 17:50:12.665395
826	鎌倉時代には○を琵琶の伴奏に合わせて語る平曲が完成した。琵琶法師	87	平家物語	源平盛衰記	方丈記	徒然草	/assets/img/quiz/20141129/826.png	2014-12-04 17:50:12.665395
827	西行の和歌	87	山家集	方丈記	愚管抄	新古今和歌集	/assets/img/quiz/20141129/827.png	2014-12-04 17:50:12.665395
828	藤原定家らの和歌	87	新古今和歌集	平家物語	源平盛衰記	方丈記	/assets/img/quiz/20141129/828.png	2014-12-04 17:50:12.665395
829	鴨長明の随筆	87	方丈記	平家物語	源平盛衰記	徒然草	/assets/img/quiz/20141129/829.png	2014-12-04 17:50:12.665395
830	吉田兼好の随筆	87	徒然草	方丈記	愚管抄	源平盛衰記	/assets/img/quiz/20141129/830.png	2014-12-04 17:50:12.665395
831	慈円の史書	87	愚管抄	方丈記	山家集	源平盛衰記	/assets/img/quiz/20141129/831.png	2014-12-04 17:50:12.665395
832	鎌倉時代の美術・工芸で東大寺にないものは？	87	禅宗様(唐様)	天竺様	金剛力士像(運慶・快慶)	南大門	/assets/img/quiz/20141129/832.png	2014-12-04 17:50:12.665395
833	鎌倉文化の絵画でないものは？	87	源氏物語絵巻	一遍上人絵伝	蒙古襲来絵詞	源頼朝像	/assets/img/quiz/20141129/833.png	2014-12-04 17:50:12.665395
834	貧窮した地域内の御家人を家臣のようにして有力になった者は？	87	守護	地頭	国司	郡司	/assets/img/quiz/20141129/834.png	2014-12-04 17:50:12.665395
835	1331年の元弘の変を起こした者は？	87	後醍醐天皇	藤原定家	西園寺公経	後二条天皇	/assets/img/quiz/20141129/835.png	2014-12-04 17:50:12.665395
836	三木一草とよばれ、建武の新政の立役者は？	87	楠木正成	後醍醐天皇	新田義貞	足利尊氏	/assets/img/quiz/20141129/836.png	2014-12-04 17:50:12.665395
837	河内源氏義国流であり建武新政樹立の立役者の一人は？	87	新田義貞	後醍醐天皇	足利尊氏	楠木正成	/assets/img/quiz/20141129/837.png	2014-12-04 17:50:12.665395
838	鎌倉幕府を開いた者は？	87	足利尊氏	楠木正成	新田義貞	北畠顕家	/assets/img/quiz/20141129/838.png	2014-12-04 17:50:12.665395
839	光明天皇をたてて○を制定し、京都で幕府を開いた\n	87	建武式目	貞永式目	御成敗式目	武家諸法度	/assets/img/quiz/20141129/839.png	2014-12-04 17:50:12.665395
840	後醍醐天皇は建武新政を実施したものの、足利尊氏の離反に遭ったために○へ入り、南朝政権を樹立した。	87	大和吉野	陸奥	古河御所	羽州	/assets/img/quiz/20141129/840.png	2014-12-04 17:50:12.665395
841	室蜂幕府の仕組みで①と②に当てはまるものは？	87	①=菅領,②=守護	①=守護,②=菅領	①=侍所,②=政所	①=政所,②=侍所	/assets/img/quiz/20141129/841.png	2014-12-04 17:50:12.665395
842	足利義満が行った事で間違いは？	87	銀閣寺を建てた	南北朝を統一した	幕府を花の御所に移した	勘合貿易	/assets/img/quiz/20141129/842.png	2014-12-04 17:50:12.665395
843	金閣寺を建てたのは誰か？	87	足利義満	足利尊氏	足利義政	足利義勝	/assets/img/quiz/20141129/843.png	2014-12-04 17:50:12.665395
844	日明両国は○と貿易船を区別するために勘合符をもたせた勘合貿易をした。	87	倭寇	元	高句麗	宣教師	/assets/img/quiz/20141129/844.png	2014-12-04 17:50:12.665395
845	1329年に朝鮮半島で成立した王朝は？	87	李氏朝鮮	新羅	百済	高句麗	/assets/img/quiz/20141129/845.png	2014-12-04 17:50:12.665395
846	自治権を確保するために、守護や国人と関係を結ぶ事が多かった者は？	87	惣	座	寄合	町衆	/assets/img/quiz/20141130/846.png	2014-12-04 17:50:12.665395
848	1428年。馬借が徳政を要求した事件に始まり、山城国（京都府）の農民も参加し、京都の土倉や酒屋を襲った。	87	正長の土一揆	山城の国一揆	加賀の一向一揆	石山本願寺一揆	/assets/img/quiz/20141206/848.png	2014-12-06 23:47:00
849	1485年。土民らが守護の畠山氏一族の争乱を追払い、36人の月行事が８年間支配した。	87	山城の国一揆	正長の土一揆	加賀の一向一揆	石山本願寺一揆	/assets/img/quiz/20141207/849.png	2014-12-07 00:12:34
850	1488年。宗徒が富樫政親と結んで政親の弟を破る。	87	加賀の一向一揆	石山本願寺一揆	山城の国一揆	正長の土一揆	/assets/img/quiz/20141207/850.png	2014-12-07 00:19:13
851	応仁の乱は細川勝元と山名持豊らの有力○が争う	87	守護大名	戦国大名	貴族	国司	/assets/img/quiz/20141207/851.png	2014-12-07 00:24:41
852	分国法は、戦国時代に○が領国内を統治するために制定した基本的な法令である	87	戦国大名	守護大名	国司	農民	/assets/img/quiz/20141207/852.png	2014-12-07 00:34:03
853	銀閣寺を建てた将軍は？	87	足利義政	足利義満	足利尊氏	細川勝元	/assets/img/quiz/20141207/853.png	2014-12-07 00:41:22
854	書院造でないものは？	87	金閣寺	銀閣寺	慈照寺同仁斎	園城寺光淨院客殿	/assets/img/quiz/20141207/854.png	2014-12-07 00:48:23
855	イスラム教（回教）をおこした人物は？	87	マホメット	キリスト	ブッダ	ゾロアスター	/assets/img/quiz/20141207/855.png	2014-12-07 09:53:18
856	イスラム教はただひとつの神アラーと経典○	87	コーラン	コーリン	コールン	コーレン	/assets/img/quiz/20141207/856.png	2014-12-07 09:56:00
857	イスラム文化でつくられていないものは？	87	活版印刷	数字	羅針盤	色ガラス	/assets/img/quiz/20141207/857.png	2014-12-07 09:59:54
858	○民族の大移動でローマ帝国を脅かす	87	ゲルマン	フン	スラブ	トルコ	/assets/img/quiz/20141207/858.png	2014-12-07 10:05:56
859	5世紀から9世紀にかけて西ヨーロッパを支配したゲルマン系の王国は？	87	フランク	ゲルマン	カール	ロタール	/assets/img/quiz/20141207/859.png	2014-12-07 10:10:19
860	中世ヨーロッパの封建制度の関係で誤りは？	87	教皇	国王	諸侯	騎士	/assets/img/quiz/20141207/860.png	2014-12-07 10:18:13
861	カール戴冠により○の勢力も拡大	87	カトリック教会	イスラム勢力	ビザンツ皇帝	アヴェール人	/assets/img/quiz/20141207/861.png	2014-12-07 10:28:00
862	十字軍とはキリスト教が、聖地○をイスラム教諸国から奪還することを目的に派遣した遠征軍のことである	87	エルサレム	メッカ	クレルモン	アナトリア半島	/assets/img/quiz/20141207/862.png	2014-12-07 10:43:21
863	十字軍は11世紀末から約200年間○回の遠征を行った	87	7	17	70	14	/assets/img/quiz/20141207/863.png	2014-12-07 10:52:21
864	ルネサンスが起こった国は？	87	イタリア	ドイツ	フランス	ギリシャ	/assets/img/quiz/20141207/864.png	2014-12-07 11:29:18
866	ダビデ像、『最後の審判』を作成した人物は？	87	ミケランジェロ	レオナルド＝ダ＝ビンチ	コペルニクス	ガリレオ・ガリレイ	/assets/img/quiz/20141207/866.png	2014-12-07 11:43:14
867	最後の晩餐、モナ・リザを描いた万能の天才は？	87	レオナルド・ダ・ヴィンチ	ミケランジェロ	コペルニクス	ガリレオ・ガリレイ	/assets/img/quiz/20141207/867.png	2014-12-07 11:46:43
868	「それでも地球は動く」の言葉を残した人物は？	87	ガリレオ・ガリレイ	レオナルド＝ダ＝ビンチ	ミケランジェロ	コペルニクス	/assets/img/quiz/20141207/868.png	2014-12-07 12:11:53
869	天動説を覆す太陽中心説（地動説）を唱えたポーランド出身の人物は？	87	ニコラウス・コペルニクス	ガリレオ・ガリレイ	レオナルド＝ダ＝ビンチ	ミケランジェロ	/assets/img/quiz/20141207/869.png	2014-12-07 12:22:00
870	三大発明でないものは？	87	数字	羅針盤	活版印刷	火薬	/assets/img/quiz/20141207/870.png	2014-12-07 12:42:23
871	罪の償いを軽減する証明書、贖宥状を批判して宗教改革を行った人物は？	87	マルティン・ルター	コペルニクス	ガリレオ・ガリレイ	ミケランジェロ	/assets/img/quiz/20141207/871.png	2014-12-07 17:22:35
872	フランス出身のキリスト教宗教改革初期の指導者は？	87	ジャン・カルヴァン	フランシスコ・ザビエル	マルティン・ルター	イグナチオ・デ・ロヨラ	/assets/img/quiz/20141207/872.png	2014-12-07 17:28:32
873	1549年に日本に初めてキリスト教を伝えた人物は？	87	フランシスコ・ザビエル	ジャン・カルヴァン	マルティン・ルター	イグナチオ・デ・ロヨラ	/assets/img/quiz/20141207/873.png	2014-12-07 17:31:40
874	15世紀の頃、イスラム商人やイタリア商人がアジアの○や絹織物を輸入して莫大な利益を獲得	87	香辛料	米	小麦	アーモンド	/assets/img/quiz/20141207/874.png	2014-12-07 18:32:25
875	1492年、アメリカ大陸に到着した図の人物は？	87	クリストファー・コロンブス	フェルディナンド・マゼラン	ヴァスコ・ダ・ガマ	フランシスコ・ザビエル	/assets/img/quiz/20141207/875.png	2014-12-07 18:58:23
876	1498年、インド航路を発見した図の人物は？	87	ヴァスコ・ダ・ガマ	クリストファー・コロンブス	フェルディナンド・マゼラン	フランシスコ・ザビエル	/assets/img/quiz/20141207/876.png	2014-12-07 19:01:22
877	1519～22年、世界一周の航海に成功した人物は？	87	フェルディナンド・マゼラン	クリストファー・コロンブス	ヴァスコ・ダ・ガマ	フランシスコ・ザビエル	/assets/img/quiz/20141207/877.png	2014-12-07 19:04:28
878	スペインが征服した国で誤りは？	87	インドのゴア	マヤ文明	アステカ帝国	インカ帝国	/assets/img/quiz/20141207/878.png	2014-12-07 19:28:16
879	16世紀初めインドのゴア、中国のマカオ、南米のブラジルに進出した国は？	87	ポルトガル	スペイン	オランダ	イギリス	/assets/img/quiz/20141207/879.png	2014-12-07 19:35:48
880	大航海時代、中南米やフィリピンへ進出した国は？	87	スペイン	ポルトガル	オランダ	イギリス	/assets/img/quiz/20141207/880.png	2014-12-07 19:37:30
881	17世紀初め東インド会社を作り、ジャワ島や北米東岸へ進出した国は？	87	オランダ	ポルトガル	スペイン	イギリス	/assets/img/quiz/20141207/881.png	2014-12-07 19:40:12
882	大航海時代、東インド会社をつくりアジアや北米に進出した国は？	87	イギリス	ポルトガル	スペイン	オランダ	/assets/img/quiz/20141207/882.png	2014-12-07 19:42:12
883	1543年ポルトガル人が○へ着き鉄砲の伝来	87	種子島	徳島	長崎	鹿児島	/assets/img/quiz/20141207/883.png	2014-12-07 19:50:17
884	1549年フランシスコ＝ザビエルが○へ着きキリスト教を伝来	87	鹿児島	長崎	種子島	徳島	/assets/img/quiz/20141207/884.png	2014-12-07 19:52:08
885	中世のヨーロッパとの貿易をなんと言うか？	87	南蛮貿易	奥州貿易	世界貿易	鎖国貿易	/assets/img/quiz/20141207/885.png	2014-12-07 20:31:21
886	天正遣欧少年使節で誤りは？	87	ジョン万次郎	伊東マンショ	千々石ミゲル	中浦ジュリアン	/assets/img/quiz/20141207/886.png	2014-12-07 20:35:17
887	戦国時代、鉄砲とキリスト教伝えた国はどこの国か？	87	ポルトガル	スペイン	アメリカ	イギリス	/assets/img/quiz/20141211/887.png	2014-12-11 22:07:11
888	織田信長が今川義元を破った戦いは？	93	桶狭間の戦い	長篠の戦い	川中島の戦い	一乗谷城の戦い	/assets/img/quiz/20141221/888.png	2014-12-21 11:55:56
889	織田信長は○を第十五代将軍にしたが1573年に○を追放して室町幕府を滅ぼした	93	足利義昭	足利義栄	足利義輝	足利義政	/assets/img/quiz/20141221/889.png	2014-12-21 12:02:00
890	織田信長が武田勝頼に鉄砲隊を用いて破った戦いは？	93	長篠の戦い	川中島の戦い	桶狭間の戦い	臼井城の戦い	/assets/img/quiz/20141221/890.png	2014-12-21 12:13:22
891	織田信長と関係のない合戦は？	93	三河一向一揆	比叡山焼き討ち	石山合戦	本能寺の変	/assets/img/quiz/20141221/891.png	2014-12-21 12:45:16
892	織田信長の死後、関白になった人物は？	93	豊臣秀吉	明智光秀	柴田勝家	徳川家康	/assets/img/quiz/20141221/892.png	2014-12-21 13:05:12
893	安土・桃山時代と関係のない事は？	93	御成敗式目	太閤検地	楽市・楽座	刀狩令	/assets/img/quiz/20141221/893.png	2014-12-21 13:28:41
894	堺の町人千利休が大成したのは？	93	茶道	浄瑠璃	書院造	南蛮屏風	/assets/img/quiz/20141221/894.png	2014-12-21 13:54:24
895	秀吉の死後、石田三成らと徳川家康らの合戦は？	93	関ヶ原の戦い	川中島の戦い	桶狭間の戦い	長篠の戦い	/assets/img/quiz/20141221/895.png	2014-12-21 14:06:06
896	前田家、島津家らの江戸から遠い場所に置かれた大名をなんと言うか？	93	外様大名	親藩	譜代大名	準譜代大名	/assets/img/quiz/20141221/896.png	2014-12-21 14:17:32
897	江戸時代の封建的支配制度で下記のうちどれが一番身分が低いか？	93	商	工	農	士	/assets/img/quiz/20141221/897.png	2014-12-21 17:34:39
898	江戸時代、年貢や犯罪の共同責任を負わせた事は？	93	五人組	慶安御触書	御成敗式目	武家諸法度	/assets/img/quiz/20141221/898.png	2014-12-21 17:48:16
899	江戸幕府が農民統制のために発令された幕法は？	93	慶安御触書	武家諸法度	五人組	楽市・楽座	/assets/img/quiz/20141221/899.png	2014-12-21 17:54:20
900	鎖国の中、貿易が許された国は中国（清）とどこか？	93	オランダ	スペイン	ポルトガル	イギリス	/assets/img/quiz/20141221/900.png	2014-12-21 18:08:50
901	寺請制度・踏絵はどの宗教の締め出しを狙った制度か？	93	キリスト教	仏教	儒教	神道	/assets/img/quiz/20141221/901.png	2014-12-21 18:13:36
902	生類憐みの令を出した将軍は？	93	徳川綱吉	徳川家光	徳川秀忠	徳川吉宗	/assets/img/quiz/20141221/902.png	2014-12-21 18:49:32
903	新井白石が行った政治をなんというか？	93	正徳の治	寛政の改革	享保の改革	徳政令	/assets/img/quiz/20141221/903.png	2014-12-21 18:53:45
904	公事方御定書、目安箱などを行った改革は？	93	享保の改革	天保の改革	寛政の改革	正徳の治	/assets/img/quiz/20141221/904.png	2014-12-21 19:15:47
905	金権政治、蝦夷地開発など行った図の人物は？	93	田沼意次	新井白石	松平定信	平賀源内	/assets/img/quiz/20141221/905.png	2014-12-21 19:37:06
906	江戸の三大大飢饉でないものは？	93	元禄	享保	天明	天保	/assets/img/quiz/20141221/906.png	2014-12-21 20:13:02
907	寛政の改革を行った人物は？	93	松平定信	新井白石	田沼意次	平賀源内	/assets/img/quiz/20141221/907.png	2014-12-21 20:15:56
\.


--
-- PostgreSQL database dump complete
--

