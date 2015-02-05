<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>購入</title>
    <link rel="shortcut icon" href="/assets/img/icon/quiz_generator.png">
    <script src="/third/jquery-2.1.1.min.js"></script>
    <script src="/third/jquery.cookie.js"></script>
    <?php if(Agent::is_mobiledevice()){ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic.css?ver=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no" >
    <?php }else{ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic_pc.css?ver=1" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/request_point.css?ver=1" />
    <script>var ua = '<?=Config::get("my.ua")?>';</script>
    <script src="/assets/js/analytics.js?ver=1"></script>
  </head>
<body>

<table cellspacing="0" boroder="0" id="header">
  <td class="edge"><img src="/assets/img/icon/menu.png" alt="menu" class="icon" id="menu"></td>
  <td id="center">購入</td>
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
  <tr><td><a href="/paid/">&nbsp;&nbsp;&nbsp;有料クイズ</a></td></tr>
  <tr><td><a href="/mypacklist/">&nbsp;&nbsp;&nbsp;クイズで稼ぐ</a></td></tr>
  <tr><td><a href="/contact/">&nbsp;&nbsp;&nbsp;お問い合わせ</a></td></tr>
  <tr><td><a href="/rule/">&nbsp;&nbsp;&nbsp;使い方と規約</a></td></tr>
</table>
<div id="content">
<table>
<tr><td class="td_49">所持ポイント</td><td class="td_49" id="point"></td></tr>
</table>

<table id="cel">
<tr>
  <td class="td_15">
    <a href="/quiz/?q=<?=$sample_q[0]['id']?>">
      <img src="<?=$sample_q[0]['img']?:'/assets/img/icon/no_img.png'?>" alt="quiz" class="icon">
    </a>
  </td>
  <td class="td_84">
    <a href="/quiz/?q=<?=$sample_q[0]['id']?>">
      <input type="text" value="<?=Str::truncate(Security::htmlentities($sample_q[0]['txt']), 30)?>" readonly class="input_txt">
    </a>
  </td>
</tr>
</table>
<br>
<table>
  <tr>
  <td id="buy_point" class="td_txt" data-pack="<?=$_GET['p']?>"><a href="#">このクイズを購入<br>20 クイズ 200pt</a></td>
  </tr>
</table>
<br>

<form action='/paypalcheckout/' METHOD='POST'>

<table>
  <tr>
  <td class="td_49">ポイントを購入</td>
  <td class="td_49"><input type='image' name='paypal_submit' id='paypal_submit' src='https://www.paypal.com/en_US/i/btn/btn_dg_pay_w_paypal.gif'/></td>
  </tr>
</table>
<!--<form action='/testpaypal_2/checkout.php' METHOD='POST'>
["paypal_submit_x"]=> string(3) "108" 
["paypal_submit_y"]=> string(2) "13" 
["yen"]=> string(3) "100" 
["p"]=> string(1) "4"

-->
<input type="hidden" name="yen" value="">
<input type="hidden" name="p" value="<?=$_GET['p']?>">

<table>
  <tr>
    <td class="td_15"><input type="radio" name="buy_point" value="100"></td>
    <td class="td_41">100 円</td>
    <td class="td_41">200 pt</td>
  </tr>
  <tr>
    <td class="td_15"><input type="radio" name="buy_point" value="800"></td>
    <td class="td_41">800 円</td>
    <td class="td_41">1700 pt</td>
  </tr>
  <tr>
    <td class="td_15"><input type="radio" name="buy_point" value="1400"></td>
    <td class="td_41">1400 円</td>
    <td class="td_41">3000 pt</td>
  </tr>

</table>
</form>
</div>
</body>
</html>
<script src="/assets/js/basic.js?ver=1"></script>
<script src="/assets/js/check_news.js?ver=1"></script>
<script src='https://www.paypalobjects.com/js/external/dg.js'></script>
<script src="/assets/js/request_point.js?ver=1"></script>

