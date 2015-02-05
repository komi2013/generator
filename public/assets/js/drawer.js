var drawerIsOpen = false;
$('#menu').click(function(){
  if(drawerIsOpen){
    $('#drawer').css({
      'left': '-100%'
    });
    drawerIsOpen = false;
  }else{
    $('#drawer').css({
      'left': -1
    });
    drawerIsOpen = true;
  }
});
$('#ad').click(function(){
  ga('set', 'dimension8',$(this).attr('alt'));
  ga('send','event','ad','link',$(this).attr('alt'),1);
});
