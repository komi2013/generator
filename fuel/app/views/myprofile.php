<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>マイプロファイル</title>
    <link rel="shortcut icon" href="/assets/img/icon/quiz_generator.png">
    <script src="/third/jquery-2.1.1.min.js"></script>
    <script src="/third/jquery.cookie.js"></script>
    <?php if(Agent::is_mobiledevice()){ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic.css?ver=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no" >
    <?php }else{ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic_pc.css?ver=1" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/myprofile.css?ver=1" />
    <script>var ua = '<?=Config::get("my.ua")?>';</script>
    <script src="/assets/js/analytics.js?ver=1"></script>
  </head>
<body>

<table cellspacing="0" boroder="0" id="header">
  <td class="edge"><img src="/assets/img/icon/menu.png" alt="menu" class="icon" id="menu"></td>
  <td id="center">マイプロファイル</td>
  <td class="edge">
    <img src="/assets/img/icon/upload_0.png" alt="generate" class="icon" id="generate">
    <img src="/assets/img/icon/success.png" alt="success" class="icon" id="success" style="display:none;">
    <img src="/assets/img/icon/cross_big.png" alt="success" class="icon" id="delete" style="display:none;">
  </td>
</table>
<table id="drawer" cellspacing="1" boroder="0">
  <tr><td><a href="/generate/">&nbsp;&nbsp;&nbsp;クイズ作成</a></td></tr>
  <tr><td><a href="/gene4word/">&nbsp;&nbsp;&nbsp;単語クイズ作成</a></td></tr>
  <tr><td id="this_page"><a href="/myprofile/">&nbsp;&nbsp;&nbsp;マイプロファイル</a></td></tr>
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
  <tr>
    <td id="photo_res" class="td_15"><img src="/assets/img/icon/camera.png" id="photo" class="icon"></td>
    <td id="name" ><input type="text" placeholder="name" maxlength="12" id="myname"></td>
    <td class="td_15"><a href="#" id="del_cookie"><img src="/assets/img/icon/power.png" class="icon"></a></td>
  </tr>
  <tr><td colspan="3">
        <?php if(isset($introduce)){ ?>
          <textarea maxlength="120" id="introduce"><?=$introduce?></textarea>
        <?php }else{ ?>
          <textarea placeholder="自己紹介" maxlength="120" id="introduce"></textarea>
        <?php } ?>
      </td></tr>
</table>

<table cellspacing="0" boroder="0">
<tr>
  <td><a href="/follower/?u=<?=Model_Cookie::get_usr()?>"><img src="/assets/img/icon/people.png" class="icon"></a></td>
  <td class="num_txt" id="num_follower"><a href="/follower/?u=<?=Model_Cookie::get_usr()?>"><?=$follower?></a></td>
  <td><a href="/following/?u=<?=Model_Cookie::get_usr()?>"><img src="/assets/img/icon/star_1.png" class="icon"></a></td>
  <td class="num_txt" id="num_following"><a href="/following/?u=<?=Model_Cookie::get_usr()?>">0</a></td>
</tr>
</table>
<table cellspacing="1" boroder="0" id="sns">
<tr>
<td style="width:33%;">
  <a href="#"><img src="/assets/img/icon/fb.jpg" alt="facebook" class="icon auth" data-url="<?=$fb_url?>"></a>
</td>
<td style="width:33%">
  <a href="#"><img src="/assets/img/icon/tw.jpg" alt="twitter" class="icon auth" data-url="/twoauth/"></a>
</td>
<td style="width:33%">
  <a href="#"><img src="/assets/img/icon/gp.png" alt="twitter" class="icon auth" data-url="<?=$gp_url?>"></a>
</td>
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
<script src="/assets/js/myprofile.js?ver=1"></script>

