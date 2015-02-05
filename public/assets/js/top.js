$('#search').click(function(){
  location.href = '/search/?tag='+$('#tag_name').val();
});
ga('send', 'pageview');