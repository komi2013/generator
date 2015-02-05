if(localStorage.news){
  var news = JSON.parse(localStorage.news);
  for(var i=0;i<news.length;i++){
    var append = '<tr><td class="td_98">'+news[i]+'</td></tr>';
    $('#cel').append(append);
  }
  if(news.length > 19){ //limit is 20
    var diff = news.length - 20;
    news.splice(-diff, diff);
  }
  var notify = JSON.parse(localStorage.notify);
  notify[2] = 'read';
  localStorage.notify = JSON.stringify(notify);
  localStorage.news = JSON.stringify(news);
}
function accept(quiz_buy_id){
  r = confirm('売却しますか？');
  if(r){
    var param = {
      quiz_buy_id : quiz_buy_id
    };
    $.post('/quizbuyaccept/',param,function(){},"json")
    .always(function(res){
//     res[1] = id, txt, img
      if(res[0]==1){
        //addCelComment(res[1]);
      }else{
        alert('connection error');
        //console.log(res);
      }
    });
  }
}

ga('send', 'pageview');