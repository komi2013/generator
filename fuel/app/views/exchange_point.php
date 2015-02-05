<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>お問い合わせ</title>
    <link rel="shortcut icon" href="/assets/img/icon/quiz_generator.png">
    <script src="/third/jquery-2.1.1.min.js"></script>
    <script src="/third/jquery.cookie.js"></script>
    <?php if(Agent::is_mobiledevice()){ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic.css?ver=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no" >
    <?php }else{ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic_pc.css?ver=1" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/exchange_point.css?ver=1" />
    <script>var ua = '<?=Config::get("my.ua")?>';</script>
    <script src="/assets/js/analytics.js?ver=1"></script>
  </head>
<body>

<table cellspacing="0" boroder="0" id="header">
  <td class="edge"><img src="/assets/img/icon/menu.png" alt="menu" class="icon" id="menu"></td>
  <td id="center">お問い合わせ</td>
  <td class="edge">
    <img src="/assets/img/icon/upload_0.png" alt="generate" class="icon" id="generate">
    <img src="/assets/img/icon/success.png" alt="success" class="icon" id="success" style="display:none;">
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
  <tr><td><a href="/mypacklist/">&nbsp;&nbsp;&nbsp;クイズで稼ぐ</a></td></tr>
  <tr><td><a href="/contact/">&nbsp;&nbsp;&nbsp;お問い合わせ</a></td></tr>
  <tr><td><a href="/rule/">&nbsp;&nbsp;&nbsp;使い方と規約</a></td></tr>
</table>

<div id="content">
<table>
  <tr><td class="explain">point</td><td id="point" class="numeric">0</td><td class="currecncy">pt</td></tr>
  <tr><td class="explain">ポイントと円を交換する</td><td id="exchange" class="numeric" style="text-align:left;">
    <select id="unit">
      <option>0</option>
      <option>2</option>
      <option>4</option>
      <option>6</option>
      <option>8</option>
      <option>10</option>
    </select>
      0,000</td><td class="currecncy">pt</td>
  </tr>
  <tr><td class="explain">手数料</td><td id="fee" class="numeric">1000</td><td class="currecncy">yen</td></tr>
  <tr><td class="explain">受取額</td><td id="money" class="numeric"></td><td class="currecncy">yen</td></tr>
</table>
<table>
  <tr><td id="info"><textarea placeholder="銀行情報" id="bank_info"></textarea></td></tr>
  <tr><td id="txt"><input type="email" placeholder="email" value="" id="email"></td></tr>
</table>
<?=View::forge('ad')?>
</div>
</body>
</html>
<script>
  var u_id = '<?=Cookie::get("u_id")?>';
</script>
<script src="/assets/js/check_news.js?ver=1"></script>
<script src="/assets/js/basic.js?ver=1"></script>
<script src="/assets/js/exchange_point.js?ver=1"></script>
