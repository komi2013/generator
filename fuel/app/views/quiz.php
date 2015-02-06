<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title><?=$q_txt?></title>
    <link rel="shortcut icon" href="/assets/img/icon/quiz_generator.png">
    <script src="/third/jquery-2.1.1.min.js"></script>
    <script src="/third/jquery.cookie.js"></script>
    <?php if(Model_Util::is_mobile()){ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic.css?ver=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no" >
    <?php }else{ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic_pc.css?ver=1" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/quiz.css?ver=1" />
    <script>var ua = '<?=Config::get("my.ua")?>';</script>
    <script src="/assets/js/analytics.js?ver=1"></script>
    <meta property="og:title" content="<?=$q_txt?>" />
    <meta property="og:url" content="http://<?=Config::get('my.domain').'/quiz/?q='.$question.'&cpn=share'?>" />
    <meta property="og:image" content="http://<?=$img ?: Config::get('my.domain').'/assets/img/icon/qg_big.png'?>" />
    <meta property="og:description" content="<?=$description?>" />
  </head>
<body>
<table cellspacing="0" boroder="0" id="header">
  <td class="edge"><img src="/assets/img/icon/menu.png" alt="menu" class="icon" id="menu"></td>
  <td id="center">クイズジェネレータ</td>
  <td class="edge" id="right"></td>
</table>
<table id="drawer" cellspacing="1" boroder="0">
  <tr><td><a href="/generate/">&nbsp;&nbsp;&nbsp;クイズ作成</a></td></tr>
  <tr><td><a href="/gene4word/">&nbsp;&nbsp;&nbsp;単語クイズ作成</a></td></tr>
  <tr><td><a href="/myprofile/">&nbsp;&nbsp;&nbsp;マイプロファイル</a></td></tr>
  <tr><td id="myanswer"><a href="/myanswer/">&nbsp;&nbsp;&nbsp;マイアンサー(復習)</a></td></tr>
  <tr><td id="top"><a href="/top/">&nbsp;&nbsp;&nbsp;他のクイズ</a></td></tr>
  <tr><td><a href="/follow/">&nbsp;&nbsp;&nbsp;フォロー</a></td></tr>
  <tr><td id="news"><a href="/news/">&nbsp;&nbsp;&nbsp;お知らせ</a></td></tr>
  <tr><td><a href="/rank/">&nbsp;&nbsp;&nbsp;ランク</a></td></tr>
  <tr><td><a href="/paid/">&nbsp;&nbsp;&nbsp;有料クイズ</a></td></tr>
  <tr><td><a href="/mypacklist/">&nbsp;&nbsp;&nbsp;クイズで稼ぐ</a></td></tr>
  <tr><td><a href="/contact/">&nbsp;&nbsp;&nbsp;お問い合わせ</a></td></tr>
  <tr><td><a href="/rule/">&nbsp;&nbsp;&nbsp;使い方と規約</a></td></tr>
</table>
<div id="content">
<?php if($img){?>
<div id="div_photo">
<img src="<?=$img?>" alt="quiz photo" id="photo">
</div>
<?php } ?>
<table><tr>
<td id="question"><?=$q_txt?></td>
</tr></table>
<div id="big_result">
<img src="/assets/img/icon/circle_big.png" alt="correct" class="big_icon" id="big_correct" style="display:none;">
<img src="/assets/img/icon/cross_big.png" alt="incorrect" class="big_icon" id="big_incorrect" style="display:none;">
<table cellspacing="1" boroder="0">
  <tr><td class="choice" id="choice_0"><?=$arr_choice[0]?></td></tr>
  <tr><td class="choice" id="choice_1"><?=$arr_choice[1]?></td></tr>
  <tr><td class="choice" id="choice_2"><?=$arr_choice[2]?></td></tr>
  <tr><td class="choice" id="choice_3"><?=$arr_choice[3]?></td></tr>
</table>
</div>
<table cellspacing="1" boroder="0">
<tr>
  <td><img src="/assets/img/icon/circle_big.png" alt="correct ratio" class="icon"></td>
  <td class="num_txt" id="num_ratio">0 % </td>
  <td><img src="/assets/img/icon/answer.png" alt="amount of answer" class="icon"></td>
  <td class="num_txt" id="num_answer">0</td>
</tr>
</table>
<table cellspacing="1" boroder="0">
<tr>

<?php $i=0; while($i<16){ ?>
  <?php if($i == 8){ ?>
    </tr><tr>
  <?php } ?>
  <td id="co_<?=$i?>" class="ans_u_correct"></td>

<?php ++$i;} ?>
</tr>

</table>

<table cellspacing="1" boroder="0">
<tr>
<?php $i=0; while($i<16){ ?>
  <?php if($i == 8){ ?>
    </tr><tr>
  <?php } ?>
  <td id="inco_<?=$i?>" class="ans_u_incorrect"></td>

<?php ++$i;} ?>
</tr>
</table>
<table id="comment"></table>
<table id="comment_in"></table>

<table cellspacing="0" cellspacing="1" boroder="0">
  <tr><td id="tag"></td></tr>
</table>

<table cellspacing="1" boroder="0" id="sns">
<tr>
<td style="width:100px;">
  <a href="<?=$fb_url?>" target="_blank">
    <img src="/assets/img/icon/fb.jpg" alt="facebook" class="icon">
  </a>
</td>
<td style="width:100px;">
  <a href="<?=$tw_url?>" target="_blank">
  <img src="/assets/img/icon/tw.jpg" alt="twitter" class="icon">
  </a>
</td>
<td style="width:100px;">
  <a href="<?=$ln_url?>" target="_blank">
  <img src="/assets/img/icon/ln.jpg" alt="line" class="icon">
  </a>
</td>
</tr>
</table>

<table cellspacing="1" boroder="0">
<tr>
<td style="width:98%;text-align:right;">
  <a href="#" id="report">
    <img src="/assets/img/icon/exclamation.png" alt="report" class="icon">
  </a>
</td>
</tr>
</table>
<table cellspacing="1" boroder="0" style="display: none;">
<tr><td colspan="2" class="td_98">このクイズを購入</td></tr>
<tr>
<td class="td_32">
  <a href="#" id="20pt">20 pt</a>
</td>
<td class="td_32">
  <a href="#" id="0pt">0 pt</a>
</td>
</tr>
</table>

</div>
</body>
</html>
<script>
var correct = '<?=$correct?>';
var q_id = '<?=$question?>';
var usr = '<?=$usr?>';
var q_data = '<?=$q_data?>';
var u_id = '<?=Cookie::get("u_id")?>';
</script>
<script src="/assets/js/basic.js?ver=1"></script>
<script src="/assets/js/check_news.js?ver=1"></script>
<script src="/assets/js/quiz.js?ver=1"></script>
