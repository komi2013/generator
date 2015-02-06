<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>マイパック</title>
    <link rel="shortcut icon" href="/assets/img/icon/quiz_generator.png">
    <script src="/third/jquery-2.1.1.min.js"></script>
    <script src="/third/jquery.cookie.js"></script>
    <script src="/third/img-touch-canvas.js"></script>
    <?php if(Model_Util::is_mobile()){ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic.css?ver=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no" >
    <?php }else{ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic_pc.css?ver=1" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/mypack.css?ver=1" />
    <script>var ua = '<?=Config::get("my.ua")?>';</script>
    <script src="/assets/js/analytics.js?ver=1"></script>
  </head>
<body>

<table cellspacing="0" boroder="0" id="header">
  <td class="edge"><img src="/assets/img/icon/menu.png" alt="menu" class="icon" id="menu"></td>
  <td id="center">マイパック</td>
  <td class="edge">
    <?php if($q_amt < 20){ ?>
    <img src="/assets/img/icon/upload_0.png" alt="generate" class="icon" id="generate">
    <img src="/assets/img/icon/success.png" alt="success" class="icon" id="success" style="display:none;">
    <?php }else { ?>
    <img src="/assets/img/icon/success.png" alt="success" class="icon" id="success">
    <?php }?>
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
<table><tr><td class="q_title"><input type="text" value="<?=Str::truncate(Security::htmlentities($pack_txt), 30)?>" readonly class="input_txt"></td></tr></table>

<table id="cel">
<?php foreach($arr_pack as $k => $d){ ?>
<tr>
  <td class="td_15">
    <a href="/paidquiz/?q=<?=$d['id']?>">
      <img src="<?=$d['img']?:'/assets/img/icon/quiz_generator.png'?>" alt="quiz" class="icon">
    </a>
  </td>
  <td class="q_title">
    <a href="/paidquiz/?q=<?=$d['id']?>">
      <input type="text" value="<?=Str::truncate(Security::htmlentities($d['txt']), 30)?>" readonly class="input_txt">
    </a>
  </td>
</tr>
<?php } ?>
</table>
<br>
<?php if($q_amt < 20){?>
<table id="question">
<tr><td><textarea placeholder="Q." maxlength="80" id="q_txt"></textarea></td></tr>

<tr><td><input type="text" placeholder="O" maxlength="20" class="choice" id="choice_0"></td></tr>
<tr><td><input type="text" placeholder="X" maxlength="20" class="choice" id="choice_1"></td></tr>
<tr><td><input type="text" placeholder="X" maxlength="20" class="choice" id="choice_2"></td></tr>
<tr><td><input type="text" placeholder="X" maxlength="20" class="choice" id="choice_3"></td></tr>
</table>

<table cellspacing="0">
  <tr>
  <td id="rotate" style="width:50px;"><img src="/assets/img/icon/rotate.png" class="icon" alt="rotate"></td>
  </tr>
</table>

<div style="text-align:center;">
<input type="file" id="imageLoader" name="imageLoader">
<canvas id="mycanvas" height="300" width="300"></canvas>
</div>
<?php }?>

<?=View::forge('ad')?>
</div>
</body>
</html>
<script>
var pack_id = '<?=$_GET["p"]?>';
var pack_txt = '<?=$pack_txt?>';
var q_amt = '<?=$q_amt?>';
var u_id = '<?=Cookie::get("u_id")?>';
</script>
<script src="/assets/js/check_news.js?ver=1"></script>
<script src="/assets/js/basic.js?ver=1"></script>
<script src="/assets/js/mypack.js?ver=1"></script>