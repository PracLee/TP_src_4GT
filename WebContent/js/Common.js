function forbid() {
      alert('로그인을 해야 이용가능한 서비스입니다!');
   }

function checkAlert(uri, text) {
      result = confirm(text);
      if (result == true) {
         location.href = uri;
      } else {
         return;
      }
   }      

function infoHelp(){
   window.open("infoHelp.jsp","id/pw찾기","width=800px,height=600px");
}
function ChangeProfile(){
	   window.open("ChangeProfile.jsp","프로필사진변경","width=800px,height=600px");
	}
function actChange(id){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능
         
   var main = $('main'); // main , showPost, selectList 에 넣어야함, 이 친구들은 myActive로 넣어야함
   var loginSignUp = $('loginSignUp');   
   var posting = $('posting');
   var myPage = $('myPage'); // editPost, updateUser a태그에도 넣어야함
   console.log(myPage);
     $(id).click(function(){
        console.log('접속완료');
        main.removeClass("myActive");
        loginSignUp.removeClass("active");
        posting.removeClass("active");
        myPage.removeClass("active");
        
        if($(id)==main){
           main.addClass("myActive");
        }else{
           $(id).addClass("active");
        }
   
      })
   
}

 
function rmsgInsert(index){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능		
	$('#crInsert'+index).removeClass('dnone');		
}	
function rmsgInsert2(rindex){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능		
	$('#rInsert'+rindex).removeClass('dnone');		
}
function rmsgEdit(rindex){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능
	
	$('#prmsg'+rindex).css('display','none');
	$('#rOption'+rindex).css('visibility','hidden');
	$('#urmsg'+rindex).removeClass('dnone');
	$('#urButton'+rindex).removeClass('dnone');
	
}

function actRemove(){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능
   
   var main = $('#main'); // main , showPost, selectList 에 넣어야함, 이 친구들은 myActive로 넣어야함
   var loginSignUp = $('#loginSignUp');   
   var posting = $('#posting');
   var myPage = $('#myPage'); // editPost, updateUser a태그에도 넣어야함
             
        main.removeClass("myActive");
        loginSignUp.removeClass("active");
        posting.removeClass("active");
        myPage.removeClass("active");

}

$(function(){ // 아코디언
   var $homeMenu = $("#main");
   
   $homeMenu.mouseover(function(){
      $homeMenu.stop().animate({height:"545px"},200);         
   })
   .mouseout(function(){
      $homeMenu.stop().animate({height:"75px"},200);         
   });
});

// showPost
function msgEdit(index){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능
	
	$('#pcmsg'+index).css('display','none');
	$('#cOption'+index).css('visibility','hidden');
	$('#ucmsg'+index).removeClass('dnone');
	$('#uButton'+index).removeClass('uButton');
	$('#uCButton'+index).removeClass('dnone');
	
}	 
function msgEditCancle(index){ 
	
	$('#pcmsg'+index).css('display','');
	$('#cOption'+index).css('visibility','');
	$('#ucmsg'+index).addClass('dnone');
	$('#uButton'+index).addClass('uButton');
	$('#uCButton'+index).addClass('dnone');
}

function rmsgInsert(index){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능		
	$('#crInsert'+index).removeClass('dnone');		
}	
function rmsgInsert2(rindex){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능		
	$('#rInsert'+rindex).removeClass('dnone');		
}
function rmsgEdit(rindex){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능
	
	$('#prmsg'+rindex).css('display','none');
	$('#rOption'+rindex).css('visibility','hidden');
	$('#urmsg'+rindex).removeClass('dnone');
	$('#urButton'+rindex).removeClass('uButton');
	
}	