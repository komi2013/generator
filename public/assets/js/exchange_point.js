if(localStorage.point){
  var point = localStorage.point;
}else{
  var point = 0;
}
$('#point').empty().append(point+' pt');
var current_point = point;
var fee =$('#fee').text();


$('#generate').click(function(){
  if(!u_id){
    alert('はじめにクイズに答えてください');
    return;
  }
  var unit = 0;
  $('#unit option:selected').each(function(){
    unit = $(this).text();
  });
  var validate = 1;
  if(unit != 2 && unit != 4 && unit != 6 && unit != 8 && unit != 10){
    validate=2;
  }
  if((current_point - unit * 10000) < 0){
    $('#unit').css({'border-color':'red'});
    validate=2;
  }
  if($('#bank_info').val()==''){
    $('#bank_info').css({'border-color':'red'});
    validate=2;
  }
  if($('#email').val()==''){
    $('#email').css({'border-color':'red'});
    validate=2;
  }
  if(validate===2){
    return;
  }
  $('#generate').css({'display': 'none'});
  $('#success').css({'display': ''});  
  var param = {
    unit : unit,
    email : $('#email').val(),
    bank_info : $('#bank_info').val()
  };
  $.post('/exchange/',param,function(){},"json")
  .always(function(res){
    if(res[0]==1){
    }else{
      $('#success').css({'display': 'none'});  
      $('#generate').css({'display': ''});
      alert('connection error');
    }
  });

  //ga('set', 'dimension11','exchanged');
  //ga('send','event','contact','upload',$('#contact').val(),1);
});

$('#unit').change(function(){
  
  var unit = 0;
  $('#unit option:selected').each(function(){
    unit = $(this).text();
  });
  var point = current_point - unit * 10000; 
  $('#current_point').empty().append(point);
  var money = unit * 10000 / 2 - fee;
  $('#money').empty().append(money);
}).change();



ga('send', 'pageview');
