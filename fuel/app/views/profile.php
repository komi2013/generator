<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title><?=$usr_name?></title>
    <link rel="shortcut icon" href="/assets/img/icon/quiz_generator.png">
    <script src="/third/jquery-2.1.1.min.js"></script>
    <script src="/third/jquery.cookie.js"></script>
    <?php if(Model_Util::is_mobile()){ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic.css?ver=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no" >
    <?php }else{ ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/basic_pc.css?ver=1" />
    <?php } ?>
    <link rel="stylesheet" type="text/css" href="/assets/css/profile.css?ver=1" />
    <meta property="og:title" content="<?=$usr_name?>" />
    <meta property="og:url" content="http://<?=Config::get('my.domain').'/profile/?u='.$_GET['u']?>" />
    <meta property="og:image" content="http://<?=Config::get('my.domain').$usr_img?>" />
    <meta property="og:description" content="<?=$follower?> follower <?=$following?> following" />
    <script>var ua = '<?=Config::get("my.ua")?>';</script>
    <script src="/assets/js/analytics.js?ver=1"></script>
  </head>
<body>

<table cellspacing="0" boroder="0" id="header">
  <td class="edge"><img src="/assets/img/icon/menu.png" alt="menu" class="icon" id="menu"></td>
  <td id="center">プロファイル</td>
  <td class="edge" id="right">
    <img id="following0" src="/assets/img/icon/star_0.png" class="icon">
    <img id="following1" src="/assets/img/icon/star_1.png" class="icon">
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
  <tr>
  　<td id="photo_res"><img src="<?=$usr_img?>" class="icon" id="photo"></td>
  　<td id="name"><?=$usr_name?></td>
  </tr>
  <tr><td colspan="2" id="introduce"><?=$introduce ?: '自己紹介文'?></td></tr>
</table>

<table cellspacing="1" boroder="0">
<tr>
  <td><a href="/follower/?u=<?=$usr_id?>"><img src="/assets/img/icon/people.png" class="icon"></a></td>
  <td class="num_txt" id="num_follower"><a href="/follower/?u=<?=$usr_id?>"><?=$follower?></a></td>
  <td><a href="/following/?u=<?=$usr_id?>"><img src="/assets/img/icon/star_1.png" class="icon"></a></td>
  <td class="num_txt" id="num_follower"><a href="/following/?u=<?=$usr_id?>"><?=$following?></a></td>
</tr>
</table>
<?=View::forge('ad')?>
<table id="cel"></table>
</div>
</body>
</html>
<script>
var receiver = '<?=$usr_id?>'; 
var u_id = '<?=Cookie::get("u_id")?>';
</script>
<script src="/assets/js/basic.js?ver=1"></script>
<script src="/assets/js/check_news.js?ver=1"></script>
<script src="/assets/js/profile.js?ver=1"></script>

