if(localStorage.notify){  // made notify in generate page
  var notify = JSON.parse(localStorage.notify);
  var chk = 2;
  var hour_stamp = Math.round(new Date().getTime() /1000 /60 /60);
  //393009 = 2014-11-01 18:00:00
//   console.log(current_hour);
  if(notify[0] < hour_stamp -24){ //news[0] last checked time
    chk = 1;
  }
  if(notify[1] < hour_stamp -24){ //news[1] last generated time
    chk = 1;
  }
  if(notify[2] == 'yet'){ //current news wasn't read yet
    if(notify[3] > 0){
      $('#news').append(' ('+notify[3]+')');
      $('title').prepend(' ('+notify[3]+')');
      $('#center').prepend(' ('+notify[3]+')');  
    }
    chk = 2;
  }else{
    chk = 1;
  }
  if(chk == 1){
    getNews();
  }
}
function getNews(){
  $.get('/newsshow/','',function(){},"json")
  .always(function(res){
    if(res[0]==1){
//     $('#news').append(res[1].length);
      $('#news').append(' ('+res[1].length+')');
      $('title').prepend(' ('+res[1].length+')');
      $('#center').prepend(' ('+res[1].length+')');
      if(notify[4] < 3){
        $('#drawer').css({
          'left': -1
        });
        drawerIsOpen = true;
        var limit = 0;
        while(limit < 3){
          $('#news').fadeOut(1000,function(){
            $(this).css("background-color","yellow");
          }).fadeIn(1000);
          ++limit;
        }
      }
      var hour_stamp = Math.round(new Date().getTime() /1000 /60 /60); 
      notify[0] = hour_stamp;
      notify[2] = 'yet';
      notify[3] = res[1].length;
      notify[4] = notify[4]+1;  //notify step number
      if(localStorage.news){
        var news = JSON.parse(localStorage.news);
      }else{
        var news = [];
      }
//       console.log(news);
      for (var i=0;i<res[1].length;i++){
        news.unshift(res[1][i]);
      }
//       console.log(news);
      localStorage.news = JSON.stringify(news);
      localStorage.notify = JSON.stringify(notify);
      ga('send','event','news','receive',notify[4],notify[3]);
    }else{
  //      console.log('no data from API');
    }
  });
}
