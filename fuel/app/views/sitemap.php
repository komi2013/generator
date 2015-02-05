<?php if(isset($_GET['hatena'])){?>
<?php foreach ($asc_q as $d) {?>
<tr>
    <td><a href="http://<?=Config::get('my.domain')?>/quiz/q?=<?=$d['id']?>"><img src="http://<?=Config::get('my.domain')?>/<?=$d['img']?>"></a></td>
    <td>
        <a href="http://<?=Config::get('my.domain')?>/quiz/?q=<?=$d['id']?>"><?=$d['txt']?></a>
        <?=$d['choice_0']?>,<?=$d['choice_1']?>,<?=$d['choice_2']?>,<?=$d['choice_3']?>
    </td>
</tr>
<?php }?>
<?php }else{?>
<?php
echo '<?xml version="1.0" encoding="UTF-8"?>'
. '';
?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
<?php foreach ($arr_data as $d) {?>
<url>
  <loc>http://<?=Config::get('my.domain')?>/<?=$param?><?=$d['id']?></loc>
</url>
<?php } ?>
</urlset>
<?php } ?>