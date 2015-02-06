<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>単語クイズ作成</title>
    <link rel="shortcut icon" href="/assets/img/icon/quiz_generator.png">
    <script src="/third/jquery-2.1.1.min.js"></script>
    <script src="/third/jquery.cookie.js"></script>
    <?php if(Model_Util::is_mobile()){ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic.css?ver=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no" >
    <?php }else{ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic_pc.css?ver=1" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/generate_4word.css?ver=1" />
    <script>var ua = '<?=Config::get("my.ua")?>';</script>
    <script src="/assets/js/analytics.js?ver=1"></script>
  </head>
<body>

<table cellspacing="0" boroder="0" id="header">
  <td class="edge"><img src="/assets/img/icon/menu.png" alt="menu" class="icon" id="menu"></td>
  <td id="center">単語クイズ作成</td>
  <td class="edge">
    <img src="/assets/img/icon/upload_0.png" alt="generate" class="icon" id="generate">
    <img src="/assets/img/icon/success.png" alt="success" class="icon" id="success" style="display:none;">
  </td>
</table>
<table id="drawer" cellspacing="1" boroder="0">
  <tr><td><a href="/generate/">&nbsp;&nbsp;&nbsp;クイズ作成</a></td></tr>
  <tr><td id="this_page"><a href="/gene4word/">&nbsp;&nbsp;&nbsp;単語クイズ作成</a></td></tr>
  <tr><td><a href="/myprofile/">&nbsp;&nbsp;&nbsp;マイプロファイル</a></td></tr>
  <tr><td><a href="/myanswer/">&nbsp;&nbsp;&nbsp;マイアンサー(復習)</a></td></tr>
  <tr><td><a href="/top/">&nbsp;&nbsp;&nbsp;他のクイズ</a></td></tr>
  <tr><td><a href="/follow/">&nbsp;&nbsp;&nbsp;フォロー</a></td></tr>
  <tr><td id="news"><a href="/news/">&nbsp;&nbsp;&nbsp;お知らせ</a></td></tr>
  <tr><td><a href="/rank/">&nbsp;&nbsp;&nbsp;ランク</a></td></tr>
  <tr><td><a href="/paid/">&nbsp;&nbsp;&nbsp;有料クイズ</a></td></tr>
  <tr><td><a href="/mypacklist/">&nbsp;&nbsp;&nbsp;クイズで稼ぐ</a></td></tr>
  <tr><td><a href="/contact/">&nbsp;&nbsp;&nbsp;お問い合わせ</a></td></tr>
  <tr><td><a href="/rule/">&nbsp;&nbsp;&nbsp;使い方と規約</a></td></tr>
</table>
<div id="content">
<table>
<tr><td><input type="text" placeholder="質問" maxlength="20" class="txtbox" id="q_0"></td><td><input type="text" placeholder="答え" maxlength="20" class="txtbox" id="a_0"></td></tr>
<tr><td><input type="text" placeholder="質問" maxlength="20" class="txtbox" id="q_1"></td><td><input type="text" placeholder="答え" maxlength="20" class="txtbox" id="a_1"></td></tr>
<tr><td><input type="text" placeholder="質問" maxlength="20" class="txtbox" id="q_2"></td><td><input type="text" placeholder="答え" maxlength="20" class="txtbox" id="a_2"></td></tr>
<tr><td><input type="text" placeholder="質問" maxlength="20" class="txtbox" id="q_3"></td><td><input type="text" placeholder="答え" maxlength="20" class="txtbox" id="a_3"></td></tr>
</table>
<table>
  <tr><td class="td_98">オプション</td></tr>  
</table>

<table cellspacing="0" cellspacing="1" boroder="0">
  <tr><td class="tag">#<input type="text" placeholder="中学歴史" maxlength="12" class="tag_in" id="tag_0"></td></tr>
</table>
<div style="display:none;">
<input type="text" placeholder="中学歴史" maxlength="12" class="tag_in" id="tag_1">
<input type="text" placeholder="中学歴史" maxlength="12" class="tag_in" id="tag_2">
</div>
<?=View::forge('ad')?>
</div>
</body>
</html>
<script>
  var u_id = '<?=Cookie::get("u_id")?>';
</script>
<script src="/assets/js/check_news.js?ver=1"></script>
<script src="/assets/js/basic.js?ver=1"></script>
<script src="/assets/js/generate_4word.js?ver=1"></script>

