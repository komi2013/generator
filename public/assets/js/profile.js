if(localStorage.follow){
  var follow = JSON.parse(localStorage.follow);
}else{
  var follow = [];
}
var ii = 0;
var already = 2;
for(i=0;i<follow.length;i++){
  if(follow[i] == receiver){
    ii = i;  //already is here so delete
    already = 1;
  }
}
if(already == 1){
  $('#following0').css({'display':'none'});
}else{
  $('#following1').css({'display':'none'});
}
var second_1 = Math.round(new Date().getTime() /1000);
$('#right').click(function(){
  if(!u_id){
    alert('はじめにクイズに答えてください');
    return;
  }
  var second_2 = Math.round(new Date().getTime() /1000);
  if(second_2 - second_1 < 2){
    alert('wait 2 seconds');
    return;
  }
  second_1 = Math.round(new Date().getTime() /1000);
  if(localStorage.follow){
    var follow = JSON.parse(localStorage.follow);
  }else{
    var follow = [];
  }
  var ii = 0;
  already = 2;
  for(i=0;i<follow.length;i++){
    if(follow[i] == receiver){
      ii = i;  //already is here so delete
      already = 1;
    }
  }
  
  if(already == 1){
    var url_1 = '/followingdel/';
    follow.splice(ii,1);
    $('#following0').css({'display': ''});
    $('#following1').css({'display': 'none'});
  }else{
    var url_1 = '/followingadd/';
    follow[follow.length] = receiver;
    $('#following0').css({'display': 'none'});
    $('#following1').css({'display': ''});
  }
  if(localStorage.myphoto){
    var myphoto = localStorage.myphoto;
  }else{
    var myphoto = '';
  }
  var param = {
    receiver : receiver,
    myphoto : myphoto
  };

  $.post(url_1,param,function(){},"json")
  .always(function(res){
    if(res[0]==1){
    }else{
     console.log(res);
     alert('connection error');
    }
  });
  localStorage.follow = JSON.stringify(follow);
  if(follow.length > 9){
    var follow_length = follow.length / 10;
    follow_length = Math.floor(follow_length) * 10;
  }else{
    var follow_length = follow.length;
  }
  ga('set', 'dimension6','follow_'+follow_length);
  ga('send','event','follow','tap','none',follow_length);
});

var endTime = Math.round( new Date().getTime() / 1000 );
var addLimit = 20;
var celNum = 0;
var resData = [];
function addCel(resData){
  while(celNum < addLimit){
    var cellTxt = resData[celNum][1];
    if(resData[celNum][2]){
      var celImg = resData[celNum][2];
    }else{
      var celImg = '/assets/img/icon/quiz_generator.png';
    }
    var cellQdata = resData[celNum][3];
    var append = 
    '<tr><td class="td_15">'+
    '<a href="/quiz/?crypt_q='+cellQdata+'">'+
    '<img src="'+celImg+'" alt="quiz" class="icon"></a>'+
    '</td><td class="td_84">'+
    '<a href="/quiz/?crypt_q='+cellQdata+'">'+
    '<input type="text" value="'+cellTxt+'" readonly class="input_txt"></a>'+
    '</td></tr>';
    $('#cel').append(append);
    ++celNum;
    if(!resData[celNum]){
      return;
    }
  }
}

function getData(first){
  var param = {
    endTime : endTime,
    usr : receiver
  };
  $.get('/uquestionshow/',param,function(){},"json")
  .always(function(res){
//     resData = id, txt, img
    if(res[0]==1){
      resData = $.merge($.merge([], resData), res[1]);
      endTime = res[1].pop()[4];
      if(first == 1){
        addCel(resData);
      }
    }else if(res[0]==2){
    }
  });
}

var dataLimit = 80;
$(function(){
  getData(1);
  var detect = 300;
  $(window).scroll(function(){
    var scrTop = $(document).scrollTop();
    if(scrTop > detect){
      detect = detect + 300;
      addLimit = addLimit + 20;
      if(addLimit > dataLimit){
        dataLimit = dataLimit + 80;
        getData();
      }
      if(resData[celNum]){
        addCel(resData);
      }
    }
  });
});
ga('send', 'pageview');