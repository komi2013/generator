<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>有料クイズ</title>
    <link rel="shortcut icon" href="/assets/img/icon/quiz_generator.png">
    <script src="/third/jquery-2.1.1.min.js"></script>
    <script src="/third/jquery.cookie.js"></script>
    <?php if(Model_Util::is_mobile()){ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic.css?ver=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no" >
    <?php }else{ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic_pc.css?ver=1" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/paid.css?ver=1" />
    <script>var ua = '<?=Config::get("my.ua")?>';</script>
    <script src="/assets/js/analytics.js?ver=1"></script>
  </head>
<body>

<table cellspacing="0" boroder="0" id="header">
  <td class="edge"><img src="/assets/img/icon/menu.png" alt="menu" class="icon" id="menu"></td>
  <td id="center">有料クイズ</td>
  <td class="edge"></td>
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
  <tr><td id="this_page"><a href="/paid/">&nbsp;&nbsp;&nbsp;有料クイズ</a></td></tr>
  <tr><td><a href="/mypacklist/">&nbsp;&nbsp;&nbsp;クイズで稼ぐ</a></td></tr>
  <tr><td><a href="/contact/">&nbsp;&nbsp;&nbsp;お問い合わせ</a></td></tr>
  <tr><td><a href="/rule/">&nbsp;&nbsp;&nbsp;使い方と規約</a></td></tr>
</table>
<div id="content">
<table>
<tr><td class="td_49">所持ポイント</td><td class="td_49" id="point"></td></tr>
</table>
<table>
  <tr>
  <td id="tag_td">#<input type="text" placeholder="history" maxlength="12" id="tag_name"></td>
  <td id="search"><img src="/assets/img/icon/search.jpg" alt="search" class="icon"></td>
  </tr>
</table>
<table id="cel">
<tr><td class="td_98"><a href="/mypaid/">購入したクイズ</a></td></tr>
<?php foreach($pack as $k => $d){ ?>
<tr>
  <td class="td_99">
    <a href="/pack/?p=<?=$d['id']?>">
      <input type="text" value="<?=Security::htmlentities($d['txt'])?>" readonly class="input_txt">
    </a>
  </td>
</tr>
<?php } ?>
</table>
<br>
<table>
  <tr>
  <td class="move"><a href="/paid/?page=<?=$page+1?>"> << </a></td>
  <td class="move">||</td>
  <td class="move"><a href="/paid/?page=<?=$page-1?>"> >> </a></td>
  </tr>
</table>
<?=View::forge('ad')?>
</div>
</body>
</html>
<script src="/assets/js/basic.js?ver=1"></script>
<script src="/assets/js/check_news.js?ver=1"></script>
<script src="/assets/js/paid.js?ver=1"></script>

