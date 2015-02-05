$('#delete').click(function() {
  var arr_quiz = [];
  $('[name="quiz_id"]:checked').each(function(){
    arr_quiz.push($(this).val());
  });
  var arr_usr = [];
  $('[name="usr_id"]:checked').each(function(){
    arr_usr.push($(this).val());
  });
  var arr_contact = [];
  $('[name="contact_id"]:checked').each(function(){
    arr_contact.push($(this).val());
  });
  var param = {
    arr_quiz : arr_quiz,
    arr_usr : arr_usr,
    arr_contact : arr_contact
  };
  $.post('/admindelete/',param,function(res){
    if(res[0]==1){
      $('#delete').css({'display': 'none'});  
      $('#success').css({'display': ''});
    }else{
     console.log(res);
     alert('connection error');
    }
  }, "json");    
});

//var getVal = getUrlVars();
//
//if(getVal.page_type){
//  if((getVal.page_type).indexOf('/') < 0){
//    console.log('campaign');
//  //ga('set', 'dimension5', getVal.page_type);
//  }else{
//    console.log('not campaign');
//  }
//}

var getUrlVal = getUrlVars();
if(getUrlVal.page_type && getUrlVal.page_type.indexOf('/') < 0){
  console.log('set page_type');
  alert('set pagetype');
  //ga('set', 'dimension9', getUrlVal.page_type);
  //$.cookie('u_last_page_type',getUrlVal.page_type,option);
}


ga('send', 'pageview');