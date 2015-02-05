$('#search').click(function(){
  location.href = '/rank/?tag='+$('#tag_name').val();
});
ga('send', 'pageview');