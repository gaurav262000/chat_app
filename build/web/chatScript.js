
//document.getElementById('chatname').innerHTML=sessionStorage.getItem('Name');
//alert(name);
//function loadofmsg(){
 


//}
/*function loaderofchat(){
   var to_user=$('#chatname').text();
    //var from_user_name=document.getElementById('cr_user').value;
     
    $.ajax({
        url:'chat.jsp',
        data:{to_user:to_user},
        success:function(data)
   {
alert(to_user);
  }
        
    });
    
    
}
*/



    
////////////


///////////////hide chat list///////////

////////////////////for send message/////////////

function onKeyDown(){
    document.addEventListener('keydown',function (key){
 if(document.getElementById('txtMessage').value!==''){ 
        if(key.which===13){
         
      SendMessage();
   
     
  }     } 
    });
    
    
}


function SendMessage(){
var message= $('#txtMessage').val();
var to_user=$('#chatname').text();

 var todayTime = new Date();
    var month = todayTime .getMonth();
    var day = todayTime .getDate();
    var year = todayTime .getFullYear();
    var date = year + "/" + month + "/" +day ;
    var cHour = todayTime.getHours();
var cMin = todayTime.getMinutes();
var cSec = todayTime.getSeconds();
     var  time=cHour+":"+cMin+":"+cSec; 
 
     $.ajax({
        url:'msgcollector.jsp',
        data:{message: $('#txtMessage').val(),to_user:$('#chatname').text(),date:date,time:time},
      //  dataType: 'json',
        success:function(data)
   {
     

  }
        
    });    /*
if(document.getElementById('txtMessage').value!==''){ 
 var  msg='<div class="row justify-content-end">'+
                           '<div class="col-4 col-sm-5 col-md-5 ">'+
                              '  <p class="sent float-right">'+message+
                      '     <span class="datetime">'+time+
                                '    </span>' +
                                '</p>'+
                            '</div>'+
                             ' <div class="col-2 col-sm-1 col-md-1">'+ 
                            '<img src="bg1.jpg" class="rounded-circle chat-pic"/>'+
                           ' </div>'+
                        '</div>';   
               document.getElementById('messages').innerHTML+= msg;}*/
    document.getElementById('txtMessage').value='';
    document.getElementById('txtMessage').focus();
    
  document.getElementById('messages').scrollTo(0,document.getElementById('messages').clientHeight);
           

    /* 
    var chatMessage={
        msg: message,
        dateTime: new Date().toLocaleString()
  };    
  */

   

  
   
 //  alert(message); 
   // alert($('txtMessage[0].value'));
}
function chooseimage(){
    document.getElementById('imagesender').click();
    
}
function sendImage(){
//    var file = event.files[0];
//   var path=(window.URL || window.webkitURL).createObjectURL(file);
//   alert(URL.createObjectURL(event.files[0])+"path");
//    alert(path.toString()+"  2parth");
//    
//            //var files = files;
//            var form = document.getElementById('imagesender');
//           
//     
//
//    
//    if(!file.type.match("image.*")){
//        alert("plz select image");
//    }else{
//        var reader= new FileReader();
//        
//        reader.addEventListener("load",function(){ 
//      
      //      alert(reader.result);
       var todayTime = new Date();
    var month = todayTime .getMonth();
    var day = todayTime .getDate();
    var year = todayTime .getFullYear();
    var date = year + "/" + month + "/" +day ;
    var cHour = todayTime.getHours();
var cMin = todayTime.getMinutes();
var cSec = todayTime.getSeconds();
     var  time=cHour+":"+cMin+":"+cSec; 
     alert(time+date+$('#chatname').text());
    
         $.ajax({
        url:'imagestorer',
        data:{to_user:$('#chatname').text(),date:date,time:time},
      //  dataType: 'json',
               
        success:function(data)
   {
     
alert(data);
  }
        
    });
//    },false);
//        if(file){
//            reader.readAsDataURL(file);
//        }
//        
//    }
}

function showEmoji(){
    document.getElementById('emoji').removeAttribute('style');
 loadEmoji();
}

function hideEmoji(){
    document.getElementById('emoji').setAttribute('style','display:none');
    
    
    
}
function getEmoji(control){
    document.getElementById('txtMessage').value += control.innerHTML;
    
    
}

function loadEmoji(){
    var emoji='';
    var emoji1='';
    for(var i=128512;i<=128567;i++){
        emoji += '<a href="#" onclick="getEmoji(this)"> &#'+i+'; </a>';
        
    }
    for(var i=129296;i<=129327;i++){
        emoji1 += '<a href="#" onclick="getEmoji(this)"> &#'+i+'; </a>';
        
    }
    document.getElementById('smiley').innerHTML=emoji+emoji1;
    
}

function showImage(){
    document.getElementById('image').removeAttribute('style');
 loadEmoji();
}

function hideImage(){
    document.getElementById('image').setAttribute('style','display:none');
    
    
    
}
//////////////////testing
function sendName(){
var to_user=$('#chatname').text();
document.getElementById('touserName').value=to_user;
alert(to_user);
}



