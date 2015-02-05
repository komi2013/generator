if(localStorage.answer_by_u){
  var answer_by_u = JSON.parse(localStorage.answer_by_u);
  $('#num_answer').empty().append(answer_by_u[1]);
  if(answer_by_u[1] > 0){
    $('#num_ratio').empty().append(Math.round(answer_by_u[0]/answer_by_u[1] * 100)+' %');
  }else{
    $('#num_ratio').empty().append('0 %');
  }
}
var endNum = 0;
var addLimit = 100;
var celNum = 0;
if(localStorage.answer){
  var answer = JSON.parse(localStorage.answer);
}else{
  var answer = [];
}

addCel(answer);
function addCel(resData){
  while(celNum < addLimit){
    var cellId = resData[celNum][0];
    var cellTxt = resData[celNum][2];
    if(resData[celNum][3]){
      var celImg = resData[celNum][3];
    }else{
      var celImg = '/assets/img/icon/quiz_generator.png';
    }
    if(resData[celNum][1] == resData[celNum][4]){
      var result = '<img src="/assets/img/icon/circle_big.png" alt="correct" class="icon result" id="img_'+cellId+'">';
    }else{
      var result = '<img src="/assets/img/icon/cross_big.png" alt="incorrect" class="icon result" id="img_'+cellId+'">';
    }
    var append = 
    '<tr><td class="td_15">'+
    '<a href="/quiz/?q='+cellId+'&learn=1">'+
    '<img src="'+celImg+'" alt="quiz" class="icon"></a>'+
    '</td><td class="td_68">'+
    '<a href="/quiz/?q='+cellId+'&learn=1">'+
    '<input type="text" value="'+cellTxt+'" readonly class="input_txt"></a>'+
    '</td><td class="td_15 chk" onClick="checkClick('+cellId+')">'+
    '<input type="checkbox" name="quiz_id" class="icon" value="'+cellId+'" id="chk_'+cellId+'" style="display:none;">'+result+
    '</td></tr>';
    $('#cel').append(append);
    ++celNum;
    if(!resData[celNum]){
      return;
    }

  }
}

function checkClick(cellId){
  //console.log($(this));
  var check_empty = 1;
  
  $('#delete').css({'display': ''});
  $('#img_'+cellId).css({'display': 'none'});
  $('#chk_'+cellId).css({'display': ''});
  $('#chk_'+cellId).attr({'checked': true});
  
  $('[name="quiz_id"]:checked').each(function(){
    check_empty = 0;
  });
  if(check_empty == 1){
    $('#delete').css({'display': 'none'});
  }
}

$('#delete').click(function(){
  r = confirm('削除します');
  if(r){
    var quiz_id=[];
    var new_answer = []; 
    $('[name="quiz_id"]:checked').each(function(){
      var i = 0; var ii = 0;
      while(ii < answer.length){
        if(answer[ii][0] != $(this).val()){
          new_answer[i] = answer[ii];
          i++;
        }
        ii++;
      }  
    });
    localStorage.answer = new_answer;
  }
});

ga('send', 'pageview');