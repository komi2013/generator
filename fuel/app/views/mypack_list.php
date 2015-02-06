<!DOCTYPE html>
<html>
  <head>
  <meta charset="UTF-8" />
  <title>マイパックリスト</title>
    <link rel="shortcut icon" href="/assets/img/icon/quiz_generator.png">
    <script src="/third/jquery-2.1.1.min.js"></script>
    <script src="/third/jquery.cookie.js"></script>
    <?php if(Model_Util::is_mobile()){ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic.css?ver=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no" >
    <?php }else{ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic_pc.css?ver=1" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/mypack_list.css?ver=1" />
    <script>var ua = '<?=Config::get("my.ua")?>';</script>
    <script src="/assets/js/analytics.js?ver=1"></script>
  </head>
<body>

<table cellspacing="0" boroder="0" id="header">
  <td class="edge"><img src="/assets/img/icon/menu.png" alt="menu" class="icon" id="menu"></td>
  <td id="center">マイパックリスト</td>
  <td class="edge">
    <img src="/assets/img/icon/upload_0.png" alt="generate" class="icon" id="generate">
    <img src="/assets/img/icon/success.png" alt="success" class="icon" id="success" style="display:none;">
    <img src="/assets/img/icon/cross_big.png" alt="delete" class="icon" id="delete" style="display:none;">
  </td>
</table>
<table id="drawer" cellspacing="1" boroder="0">
  <tr><td><a href="/generate/">&nbsp;&nbsp;&nbsp;クイズ作成</a></td></tr>
  <tr><td><a href="/gene4word/">&nbsp;&nbsp;&nbsp;単語クイズ作成</a></td></tr>
  <tr><td><a href="/myprofile/">&nbsp;&nbsp;&nbsp;マイプロファイル</a></td></tr>
  <tr><td><a href="/myanswer/">&nbsp;&nbsp;&nbsp;マイアンサー(復習)</a></td></tr>
  <tr><td><a href="/top/">&nbsp;&nbsp;&nbsp;他のクイズ</a></td></tr>
  <tr><td><a href="/follow/">&nbsp;&nbsp;&nbsp;フォロー</a></td></tr>
  <tr><td id="news"><a href="/news/">&nbsp;&nbsp;&nbsp;お知らせ</a></td></tr>
  <tr><td><a href="/rank/">&nbsp;&nbsp;&nbsp;ランク</a></td></tr>
  <tr><td><a href="/paid/">&nbsp;&nbsp;&nbsp;有料クイズ</a></td></tr>
  <tr><td id="this_page"><a href="/mypacklist/">&nbsp;&nbsp;&nbsp;クイズで稼ぐ</a></td></tr>
  <tr><td><a href="/contact/">&nbsp;&nbsp;&nbsp;お問い合わせ</a></td></tr>
  <tr><td><a href="/rule/">&nbsp;&nbsp;&nbsp;使い方と規約</a></td></tr>
</table>
<div id="content">
<table>
<tr><td class="td_49">所持ポイント</td><td class="td_49" id="point"></td></tr>
</table>

<table id="pack_input">
  <tr>
  <td style="text-align:center;"><input type="text" placeholder="クイズパックのタイトル" maxlength="12" id="pack_txt"></td>
  </tr>
</table>
<table>
  <tr>
  <td class="input_txt_1"><a href="/exchangepoint/">ポイント交換する</a></td>
  </tr>
</table>

<?=View::forge('ad')?>
<table id="cel"></table>
</div>
</body>
</html>
<script>
  var u_id = '<?=Cookie::get("u_id")?>';
</script>
<script src="/assets/js/basic.js?ver=1"></script>
<script src="/assets/js/check_news.js?ver=1"></script>
<script src="/assets/js/mypack_list.js?ver=1"></script>

