$('#search').click(function(){
  location.href = '/search/?tag='+$('#tag_name').val();
});

var endTime = Math.round( new Date().getTime() / 1000 );
endTime = endTime + 86400 * 20;
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
  if(localStorage.answer){
    var answer = JSON.parse(localStorage.answer);
  }else{
    var answer = [];
  }
  var past = [];
  for(i = 0; i < answer.length; i++){
    past[i] = answer[i][0];
  }
  var param = {
    tag : tag,
    endTime : endTime
  };
  $.get('/searchshow/',param,function(){},"json")
  .always(function(res){
//     resData = id, txt, img
    if(res[0]==1){
      resData = $.merge($.merge([], resData), res[1]);
      if(first == 1){
        addCel(resData);
      }
      endTime = res[1].pop()[4];
    }else{
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
if(typeof ga == "function"){
  ga('send', 'pageview');
}
