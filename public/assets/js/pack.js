if(localStorage.point){
  var point = localStorage.point;
}else{
  var point = 0;
}
$('#point').empty().append(point+' pt');
var endNum = 0;
var addLimit = 20;
var celNum = 0;
var resData = [];
function addCel(resData){
  while(celNum < addLimit){
    var cellTxt = resData[celNum][1];
    if(resData[celNum][2]){
      var celImg = resData[celNum][2];
    }else{
      var celImg = '/assets/img/icon/no_img.png';
    }
    var cellQdata = resData[celNum][3];
    if(resData[celNum][4] == 2){
      var result = '<img src="/assets/img/icon/cross_big.png" alt="incorrect" class="icon">';
    }else if(resData[celNum][4] == 1){
      var result = '<img src="/assets/img/icon/circle_big.png" alt="correct" class="icon">';
    }else{
      var result = '';
    }
    var append = 
    '<tr><td class="td_15">'+
    '<a href="/paidquiz/?crypt_q='+cellQdata+'">'+
    '<img src="'+celImg+'" alt="quiz" class="icon"></a>'+
    '</td><td class="td_68">'+
    '<a href="/paidquiz/?crypt_q='+cellQdata+'">'+
    '<input type="text" value="'+cellTxt+'" readonly class="input_txt"></a>'+
    '</td><td class="td_15">'+result+'</td></tr>';
    $('#cel').append(append);
    ++celNum;
    if(!resData[celNum]){
      return;
    }
  }
}

function getData(first){
  var param = {
    endNum : endNum,
    p : pack_id
  };
  $.get('/packqushow/',param,function(){},"json")
  .always(function(res){
//     resData = id, txt, img
    if(res[0]==1){
      resData = $.merge($.merge([], resData), res[1]);
      endNum = res[1].pop()[0];
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