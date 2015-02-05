quizUsrShow();
answer_by_q_show();
tag_show();

if(localStorage.ua_u_id && localStorage.ua_u_id == usr){
  ga('set','dimension12','owner');
  //ga('set', 'metric1', usr);
}

if(localStorage.answer){
  var answer = JSON.parse(localStorage.answer);
}else{
  var answer = [];
}

var already = 0;
for(var i = 0; i < answer.length; i++){  
  if(answer[i][0] == q_id){
    already = 1;
  }
}  

$('.choice').click(function(){
  if(already == 2){
    return;
  }
  $(this).css({
    'background-color': 'grey',
    'border-width': '1px 1px',
    'border-color': 'silver',
    'border-style': 'solid'
  });
  var this_seq = $(this); 
  setTimeout(function(){
    answer_1(this_seq);
  },2000);
});
function answer_1(this_seq){
  if(localStorage.myphoto){
    var myphoto = localStorage.myphoto;  
  }else{
    var myphoto = '/assets/img/icon/guest.png';
  }
  if(localStorage.myname){
    var myname = localStorage.myname; 
  }else{
    var myname = 'guest';
  }
  if(correct == $(this_seq).html()){
    var correct_answer = 1;
    resCo.unshift([0,myname,myphoto]);
    amt_co++;
    $('#big_correct').css({'display': ''});
  }else{
    var correct_answer = 0; 
    resInco.unshift([0,myname,myphoto]);
    $('#big_incorrect').css({'display': ''});
  }
  $(this_seq).css({
    'background-color': 'red',
    'border-width': '1px 1px',
    'border-color': 'silver',
    'border-style': 'solid'
  });
  
  $('.choice').each(function(i){
    if(correct == $('#choice_'+i).html()){
      $('#choice_'+i).css({
        'background-color': 'lime',
      });
    }
  });

  if(correct_answer == 1){
    addCel(resCo,'co');
  }else{
    addCel(resInco,'inco');
  }
  var tag = [];
  $('#tag a').each(function(i){
    tag[i] = $(this).html();
  });
  var q_img = ($('#photo').attr('src'))? $('#photo').attr('src') : '' ;
  var param = {
    correct : correct_answer,
    question : q_id,
    q_txt : $('#question').html(),
    q_img : q_img,
    usr : usr,
    arr_tag : tag
  };
  if(already < 1){
    $.post('/answer/',param,function(){},"json")
    .always(function(res){
      if(res[0]==1){
      }else{
      }
    });
    answer.unshift([q_id,$(this_seq).html(),$('#question').html(),q_img,correct]);
    if(answer.length > 99){
      var diff = answer.length - 100;
      answer.splice(-diff, diff);
    }
    localStorage.answer = JSON.stringify(answer);
  }else{
    for(var i = 0; i < answer.length; i++){  
      if(answer[i][0] == q_id){
        answer[i] = [q_id,$(this_seq).html(),$('#question').html(),q_img,correct];
      }
    }
    localStorage.answer = JSON.stringify(answer);
  }
  amt_answer++;
  after_post(correct_answer);
  comment_show();
}
function after_post(correct_answer){
  $('#num_ratio').empty().append(Math.round(amt_co/amt_answer * 100)+' %');
  $('#num_answer').empty().append(amt_answer);
  if(localStorage.answer_by_u){
    var answer_by_u = JSON.parse(localStorage.answer_by_u);
    answer_by_u = [(answer_by_u[0] + correct_answer),(answer_by_u[1] + 1)];
  }else{
    var answer_by_u = [correct_answer, 1];
  }
  localStorage.answer_by_u = JSON.stringify(answer_by_u);
  if(answer_by_u[1] > 9){
    var u_answer = answer_by_u[1] / 10;
    u_answer = Math.floor(u_answer) * 10;
  }else{
    var u_answer = answer_by_u[1];
  }
  ga('set', 'dimension1','an_'+correct_answer);  
  ga('send','event','answer',correct_answer,usr,u_answer);
  already = 2;
}
$('#sns td a').click(function(){
  ga('set','dimension9','share_'+$(this).children('img').attr('alt'));  
  ga('send','event','share','link',$(this).children('img').attr('alt'),1);  
});
function answerStep(answer_by_u){
  setTimeout(function(){
    if(answer_by_u[1] == 1){
      scrollTo(0,0);
      $('#drawer').css({
        'left': -1
      });
      drawerIsOpen = true;
      var limit = 0;
      while(limit < 3){
        $('#top').fadeOut(1000,function(){
          $(this).css("background-color","yellow");
        }).fadeIn(1000);
        ++limit;
      }
    }else if(answer_by_u[1] == 2){
      scrollTo(0,0);
      $('#drawer').css({
        'left': -1
      });
      drawerIsOpen = true;
      var limit = 0;
      while(limit < 3){
        $('#myanswer').fadeOut(1000,function(){
          $(this).css("background-color","yellow");
        }).fadeIn(1000);
        ++limit;
      }
    }else if(answer_by_u[1] == 3){
      scrollTo(0,0);
      var limit = 0;
      while(limit < 3){
        $('#right').fadeOut(1000,function(){
          $(this).css("background-color","yellow");
        }).fadeIn(1000);
        ++limit;
      }
    }
  }, 3000);
}

//.begin. add in/correct usr
var resCo = [];
var resInco = [];
function addCel(resData,coinco){
  var celImg = '';
  var append = '';
  for (var celNum=0;celNum<resData.length;celNum++){
    cellId = resData[celNum][0];
    if(resData[celNum][2]){
      celImg = resData[celNum][2];
    }else{
      celImg = '/assets/img/icon/guest.png';
    }
    append = '<a href="/profile/?u='+cellId+'">'+
    '<img src="'+celImg+'" alt="answered usr" class="ans_icon"></a>'+
    '</td>';
    $('#'+coinco+'_'+celNum).empty().append(append);
    if(celNum > 16){
      return;
    }
  }
}
//.end. add in/correct usr

function quizUsrShow(){
  var param = {
    q : q_id
  };
  var append = '';
  $.get('/quizusrshow/',param,function(){},"json")
  .always(function(res){
//     res[1] = id, txt, img
    if(res[0]==1){
      append = 
      '<a href="/profile/?u='+res[1][0]+'">'+
      '<img src="'+res[1][2]+'" alt="generator" class="icon"></a>';
      $('#right').append(append);
      addCel(res[2],'co');
      addCel(res[3],'inco');
      resCo = res[2];
      resInco = res[3];
    }else{
      console.log(res);
    }
  });
}

var amt_co = 0;
var amt_answer = 0;
function answer_by_q_show(){
  var param = {
    q : q_id
  };
  $.get('/answerbyqshow/',param,function(){},"json")
  .always(function(res){
    if(res[0]==1){
      amt_co = res[1][0];
      amt_answer = res[1][1];
      if(amt_co == 0){
        $('#num_ratio').empty().append(0+' %');
      }else{
        $('#num_ratio').empty().append(Math.round(amt_co/amt_answer * 100)+' %');
      }
      $('#num_answer').empty().append(amt_answer);
      
    }else{
     console.log(res);
    }
  });
}
function tag_show(){
  var param = {
    q : q_id
  };
  $.get('/tagshow/',param,function(){},"json")
  .always(function(res){
    if(res[0]==1){
      for(i = 0; i < res[1].length; i++){
        $('#tag').append('&nbsp;<a href="/search/?tag='+res[1][i]+'">#'+res[1][i]+'</a>&nbsp;');
        ga('set','dimension13',res[1][i]);
      }
    }else{
     //console.log(res);
    }
  });
}

function comment_show(){
  var param = {
    q : q_id
  };
  $.get('/commentshow/',param,function(){},"json")
  .always(function(res){
//     res[1] = id, txt, img
    if(res[0]==1){
      addCelComment(res[1]);
    }else if(res[0]==2){
      comment();
    }else{
      alert('connection error');
      //console.log(res);
    }
  });
}

function addCelComment(resData){
  var cellTxt = '';
  var celImg = '';
  for (var celNum=0;celNum<resData.length;celNum++){
    cellId = resData[celNum][0];
    cellTxt = resData[celNum][1];
    if(resData[celNum][2]){
      celImg = resData[celNum][2];
    }else{
      celImg = '/assets/img/icon/guest.png';
    }
    var append = 
    '<tr><td class="td_15">'+
    '<a href="/profile/?u='+cellId+'" >'+
    '<img src="'+celImg+'" alt="follower photo" class="icon"></a>'+
    '</td><td class="td_84">'+cellTxt+'</td></tr>';
    $('#comment').append(append);
  }
  comment();
}
function comment(){
  var append = '<tr><td class="td_84"><input type="text" placeholder="コメント" class="input_text" id="comment_data"></td><td class="td_15">'+
    '<a href="#"><img src="/assets/img/icon/upload_0.png" alt="generate" class="icon" id="generate">'+
    '<img src="/assets/img/icon/success.png" alt="success" class="icon" id="success" style="display:none;"></a>'+
    '</td></tr>';
  $('#comment_in').append(append);
  $('#generate').click(function(){
    var validate = 1;
    if($('#comment_data').val()==''){
      $('#comcomment_data').css({'border-color':'red'});
      validate=2;
    }
    if(validate==2){
      return false;
    }
    $('#generate').css({'display': 'none'});
    $('#success').css({'display':''});
    var param = {
      txt : $('#comment_data').val(),
      q : q_id
    };
    $.post('/commentadd/',param,function(){},"json")
    .always(function(res){
      if(res[0]==1){
        location.href = '';
      }else{
        alert('connection error');
      }
    });
    ga('set','dimension14','comment');  
    ga('send','event','comment',usr,$('#comment_data').val(),1);  
    return false;
  });
}

function commentAdd(){
  var param = {
    q : q_id
  };
  $.get('/commentshow/',param,function(){},"json")
  .always(function(res){
//     res[1] = id, txt, img
    if(res[0]==1){
      addCelComment(res[1]);
    }else{
      alert('connection error');
      console.log(res);
    }
  });  
}
$('#report').click(function(){
  if(!u_id){
    alert('はじめにクイズに答えてください');
    return;
  }
  r = confirm('報告します');
  if(r){
    var param = {q_id : q_id};
    $.post('/report/',param,function(){},"json")
    .always(function(res){
      if(res[0]==1){
      }else{
        alert('connection error');
      }
    });  
  }
  ga('set','dimension15','report');  
  ga('send','event','report',usr,'none','2');  
  return false;
});
$('#0pt').click(function(){
  if(!u_id){
    alert('はじめにクイズに答えてください');
    return;
  }
  r = confirm('0ポイントで買取要求します');
  if(r){
    var q_img = ($('#photo').attr('src'))? $('#photo').attr('src') : '' ;
    var param = {
      q_id: q_id,
      q_txt : $('#question').html(),
      q_img : q_img,
      point: 0,
      usr: usr
    };
    $.post('/quizbuy/',param,function(){},"json")
    .always(function(res){
      if(res[0]==1){
      }else{
        alert('connection error');
      }
    });
    
  }
  ga('set','dimension16','buy_0');  
  ga('send','event','buy_on_quiz',0,usr,1);  
  return false;
});
$('#20pt').click(function(){
  if(!localStorage.point || localStorage.point < 20){
    alert('ポイントが足りません');
    return;
  }
  if(!u_id){
    alert('はじめにクイズに答えてください');
    return;
  }
  r = confirm('20ポイントで買取要求します');
  if(r){
    var q_img = ($('#photo').attr('src'))? $('#photo').attr('src') : '' ;
    var param = {
      q_id: q_id,
      q_txt : $('#question').html(),
      q_img : q_img,
      point: 20,
      usr: usr
    };
    $.post('/quizbuy/',param,function(){},"json")
    .always(function(res){
      if(res[0]==1){
      }else{
        alert('connection error');
      }
    });
  }
  ga('set','dimension16','buy_20');  
  ga('send','event','buy_on_quiz',20,usr,1);  
  return false;
});

if(typeof ga == "function"){
  ga('send', 'pageview');
}