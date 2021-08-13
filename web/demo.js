function StartChat(to_user_id,to_user_name ){
//loaderofchat(); 
var to_user = to_user_name;
            
    //document.getElementById('chatpanel').removeAttribute('style');
   // document.getElementById('divstart').setAttribute('style','display:none');
   // sessionStorage.setItem("Name",to_user);
    hideChatList();
   
  
    //var from_user_name=document.getElementById('cr_user').value;
     // document.getElementById('chatname').innerHTML=to_user_name;
     // $( "#reload" ).load( "chatAPI/chat.jsp" ); 
  // window.location='/chatAPI/chat2.jsp';
//    alert(to_user_id);
//    document.getElementById('chatstatus').innerHTML=status;
  // document.getElementById('messages').innerHTML='';
  //  document.getElementById('txtMessage').focus();
   // hideEmoji();
 
}
function storefriend(to_user_id,name){
     $.ajax({
        url:'chatsMessageStore.jsp',
        data:{to_user_id:to_user_id,name:name},
        success:function(data)
   {
//alert(to_user_id,name);
  }
        
    });    
 $('chatername').load("chat1.jsp");
 
}
function hideChatList(){
    document.getElementById('side-1').classList.add('d-none','d-md-block');
    document.getElementById('side-1').classList.remove('d-none');
}
