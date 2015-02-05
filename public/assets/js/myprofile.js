if(getVal.warn){
  alert('他のアカウントのログアウト・削除してから、ログイン・同期してください');
  location.href = '/myprofile/';
}
if($.cookie('follow')){
  localStorage.follow = $.cookie('follow');
  $.cookie('follow','',{expires:-1,path:'/'});
}
if($.cookie('myname')){
  localStorage.myname = $.cookie('myname');
  $.cookie('myname','',{expires:-1,path:'/'});
}
if($.cookie('myphoto')){
  localStorage.myphoto = $.cookie('myphoto');
  $.cookie('myphoto','',{expires:-1,path:'/'});
}
if($.cookie('point')){
  localStorage.point = $.cookie('point');
  $.cookie('point','',{expires:-1,path:'/'});
}
if($.cookie('ua_u_id')){
  localStorage.ua_u_id = $.cookie('ua_u_id');
  $.cookie('ua_u_id','',{expires:-1,path:'/'});
}
if($.cookie('answer_by_u')){
  localStorage.answer_by_u = $.cookie('answer_by_u');
  $.cookie('answer_by_u','',{expires:-1,path:'/'});
}
if($.cookie('answer')){
  localStorage.answer = $.cookie('answer');
  $.cookie('answer','',{expires:-1,path:'/'});
}

if(localStorage.myphoto){
  $('#photo').attr('src',localStorage.myphoto);  
}

if(localStorage.myname){
  $('#myname').val(localStorage.myname); 
}

if(localStorage.follow){
  var follow = JSON.parse(localStorage.follow);
  $('#num_following').empty().append(follow.length); 
}

$('.auth').click(function(){
  r = confirm('ログイン・同期します');
  if(r){
    (localStorage.myphoto)? myphoto = localStorage.myphoto : myphoto = '';
    (localStorage.myname)? myname = localStorage.myname : myname = '';
    (localStorage.answer_by_u)? answer_by_u = localStorage.answer_by_u : answer_by_u = [];
    (localStorage.answer)? answer = localStorage.answer : answer = [];
    var param = {
      myphoto : myphoto,
      myname : myname,
      answer_by_u : answer_by_u,
      answer : answer
    };
    var this_url = $(this).data('url');
    $.post('/mydataedit/',param,function(){},"json")
    .always(function(res){
      if(res[0]==1){
        location.href = this_url;
      }else if(res[0]==2){
        alert('connection error');
      }
    });
    ga('set', 'dimension10',$(this).attr('alt'));
    ga('send','event','auth',$(this).attr('alt'),localStorage.ua_u_id,1);
  }
});

var childWindow;
$('#photo').click(function() {
  if(!u_id){
    alert('はじめにクイズに答えてください');
    return;
  }
  childWindow = window.open("/assets/html/photo.html", "winB");
});
function winCloseB(){
  childWindow.close();
  var param = {
    img : localStorage.getItem('img')
  };
  $.ajax({type:'POST',dataType:'json',url:'/photoprofileadd/',data:param})
  .always(function(data){
    if(data[0] == 1){
      localStorage.myphoto = data[1];
    }else{
      console.log(data);
      alert('connection error');
    }
  });
}

$('#generate').click(function(){
  if(!u_id){
    alert('はじめにクイズに答えてください');
    return;
  }
  var validate = 1;
  if($('#myname').val()==''){
    $('#myname').css({'background-color':'red'});
    validate=2;
  }
  if($('#photo').attr('src')=='/assets/img/icon/camera.png'){
    $('#photo_res').css({'background-color':'red'});
    validate=2;
  }
  if(validate==2){
    return;
  }
  r = confirm('プロファイルを変更します');
  if(r){
    $('#generate').css({'display': 'none'});  
    $('#success').css({'display': ''});
    var param = {
      myname : $('#myname').val(),
      introduce:  $('#introduce').val(),
      myphoto : localStorage.myphoto
    };
    $.post('/myprofileadd/',param,function(){},"json")
    .always(function(res){
      if(res[0]==1){
        localStorage.removeItem('img');
        localStorage.myname = $('#myname').val();
        location.href='';
      }else{
        $('#success').css({'display': 'none'});
        $('#generate').css({'display': ''});  
        alert('connection error');
      }
    });
    ga('set', 'dimension7','profile_edited');
    ga('send','event','myprofile','upload','edit',1);
  }
});

function checkClick(){
  $('#generate').css({'display': 'none'});  
  $('#delete').css({'display': ''});
  var check_empty = 1;
  $('[name="quiz_id"]:checked').each(function(){
    check_empty = 0;
  });
  if(check_empty == 1){
    $('#delete').css({'display': 'none'});
    $('#generate').css({'display': ''});  
  }
}

$('#delete').click(function(){
  r = confirm('削除します');
  if(r){
    var quiz_id=[];
    $('[name="quiz_id"]:checked').each(function(){
      quiz_id.push($(this).val());
    });
    var param = {
      quiz_id : quiz_id
    };
    $.post('/myquizdelete/',param,function(){},"json")
    .always(function(res){
      if(res[0]==1){
        location.href='';
      }
    });  
  }
});

$('#del_cookie').click(function(){
  r = confirm('ログアウト・削除します');
  if(r){
    localStorage.clear();
    $.post('/myprofiledel/',{},function(){},"json")
    .always(function(res){
      if(res[0]==1){
        location.href='';
      }
    });
  }
});

var endTime = Math.round( new Date().getTime() / 1000 );
endTime = endTime + 86400 * 20;
var addLimit = 20;
var celNum = 0;
var resData = [];
function addCel(resData){
  while(celNum < addLimit){
    var cellId = resData[celNum][0];
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
    '</td><td class="td_68">'+
    '<a href="/quiz/?crypt_q='+cellQdata+'">'+
    '<input type="text" value="'+cellTxt+'" readonly class="input_txt"></a>'+
    '</td><td class="td_15" onClick="checkClick()">'+
    '<input type="checkbox" name="quiz_id" class="icon" value="'+cellId+'">'+
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
    endTime : endTime
  };
  $.get('/myquestionshow/',param,function(){},"json")
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