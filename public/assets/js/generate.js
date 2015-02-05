$('#generate').click(function(){
  if(!u_id){
    alert('はじめにクイズに答えてください');
    return;
  }
  var validate = 1;
  if($('#q_txt').val()==''){
    $('#q_txt').css({'border-color':'red'});
    validate=2;
  }
  for(i = 1; i < 5; i++){
    if($('#choice_'+i).val()==''){
      $('#choice_'+i).css({'border-color':'red'});
      validate=2;
    }
  }
  for(i = 0; i < 3; i++){
    if($('#tag_'+i).val().match(/\W/g) && 
      !$('#tag_'+i).val().match(/^[ぁ-んァ-ン一-龥]/)){
//     if($('#tag_'+i).val().match(/\W/g)){
      $('#tag_'+i).css({'border-color':'red'});
      validate=2;
    }
  }
  if(validate==2){
    return;
  }
  $('#generate').css({'display': 'none'});  
  $('#success').css({'display': ''});
  var mycanvas = document.getElementById('mycanvas');
  if(change_pic == 1){
    var imgdata = mycanvas.toDataURL();
  }else{
    var imgdata = 'no';
  }
  var param = {
    q_txt : $('#q_txt').val()
    ,choice_0 : $('#choice_0').val()
    ,choice_1 : $('#choice_1').val()
    ,choice_2 : $('#choice_2').val()
    ,choice_3 : $('#choice_3').val()
    ,img : imgdata
    ,tag_0 : $('#tag_0').val()
    ,tag_1 : $('#tag_1').val()
    ,tag_2 : $('#tag_2').val()
  };
  $.ajax({type:'POST',dataType:'json',url:'/myquestionadd/',data:param})
  .always(function(res){
    if(res[0]==1){
      if(localStorage.genestep){
        localStorage.genestep = localStorage.genestep + 1;
        location.href = '/quiz/?crypt_q='+res[1];
      }else{
        localStorage.genestep = 1;
        location.href = '/myprofile/';
      }
    }else{
      $('#success').css({'display': 'none'});
      $('#generate').css({'display': ''});  
      alert('connection error');
    }
  });
  ga('set', 'dimension3','gene_'+localStorage.genestep);
  ga('send','event','generate','upload',localStorage.ua_u_id,localStorage.genestep);
});

//.begin. canvas edit
var resImg = document.getElementById('mycanvas');
var gesturableImg = new ImgTouchCanvas({
    canvas: resImg,
    path: "/assets/img/icon/camera.png"
});

var imageLoader = document.getElementById('imageLoader');
    imageLoader.addEventListener('change', handleImage, false);
var change_pic = 0;
function handleImage(e){
    $('#imageLoader').css({
      'display': 'none'
    });
    var reader = new FileReader();
    reader.onload = function(event){
      var img = new Image();
      img.src = event.target.result;
      var gesturableImg = new ImgTouchCanvas({
          canvas: document.getElementById('mycanvas'),
          path: img.src
      });
      change_pic = 1;
    }
    reader.readAsDataURL(e.target.files[0]);     
}
//.end. canvas edit

$('#rotate').click(function(){
  var canvas = document.getElementById('mycanvas');
  var ctx = canvas.getContext('2d');
  var image = new Image();
  image.src = canvas.toDataURL();
  var rad = Math.atan2(1, 0);
  ctx.save();
  var image_width  = 300;
  var image_height = 300;
  ctx.translate(150, 150);
  ctx.rotate(rad);
  ctx.translate(-150, -150);
  ctx.drawImage(image,0,0);
  if(change_pic == 1){
    gesturableImg.rotate = gesturableImg.rotate + 1;
  }
    
});

// .begin. make notify arr
var hour_stamp = Math.round(new Date().getTime() /1000 /60 /60); 
if(localStorage.notify){
  var notify = JSON.parse(localStorage.notify);
  notify[1] = hour_stamp;
}else{
//last getNews() hour, last generate hour, read news or yet, new records, notify step number
  var notify = [0,hour_stamp,'nodata',0,0];
}
localStorage.notify = JSON.stringify(notify);
// .end. make notify arr
ga('send', 'pageview');
