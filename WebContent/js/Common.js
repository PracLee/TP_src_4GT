
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

//showPost
function msgEdit(index){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능

	$('#pcmsg'+index).css('display','none');
	$('#cOption'+index).css('visibility','hidden');
	$('#ucmsg'+index).removeClass('dnone');
	$('#uButton'+index).removeClass('dnone');
	$('#uCButton'+index).removeClass('dnone');

}	 
function msgEditCancle(index){ 

	$('#pcmsg'+index).css('display','');
	$('#cOption'+index).css('visibility','');
	$('#ucmsg'+index).addClass('dnone');
	$('#uButton'+index).addClass('dnone');
	$('#uCButton'+index).addClass('dnone');
}


function msgEditFinish(index){ 
	var params = "c_post="+$("#c_post"+index).val()+"&c_user="+$("#c_user"+index).val()+
	"&cwriter="+$("#cwriter"+index).val()+"&cnum="+$("#cnum"+index).val()+"&cment="+$("#ucmsg"+index).val();

	$.ajax({
		type:"post",
		url:"editComment.ucdo",
		data:params,
		dataType:"json",
		success:function(args){
			$('#pcmsg'+index).css('display','');
			$('#cOption'+index).css('visibility','');
			$('#ucmsg'+index).addClass('dnone');
			$('#uButton'+index).addClass('dnone');
			$('#uCButton'+index).addClass('dnone');
			console.log("기본: " + args[0].cment);
			console.log("인코딩: " + encodeURIComponent(args[0].cment));
			console.log(args[0].cdate);
			console.log("index: " + index);
			$("#pcmsg"+index).text(args[0].cment);
			$("#cdate"+index).text(args[0].cdate);
			
		}
	})
}




function rmsgInsert(index){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능		
	$('#crInsert'+index).removeClass('dnone');		
}	


function rmsgEdit(index,rindex){ // 수정버튼 클릭시 바로 수정가능하게 해주는 기능
	console.log($('#prmsg'+index+rindex));
	$('#prmsg'+index+rindex).css('display','none');
	$('#rOption'+index+rindex).css('visibility','hidden');
	$('#urmsg'+index+rindex).removeClass('dnone');
	$('#urButton'+index+rindex).removeClass('dnone');
	$('#uRCButton'+index+rindex).removeClass('dnone');
}	
function rmsgEditCancle(index,rindex){ 
	console.log($('#prmsg'+index+rindex));
	$('#prmsg'+index+rindex).css('display','');
	$('#rOption'+index+rindex).css('visibility','');
	$('#urmsg'+index+rindex).addClass('dnone');
	$('#urButton'+index+rindex).addClass('dnone');
	$('#uRCButton'+index+rindex).addClass('dnone');
	
}

function rmsgEditFinish(index,rindex){ 
	var params = "rnum="+$("#rnum"+index+rindex).val()+"&rment="+$("#urmsg"+index+rindex).val();

	$.ajax({
		type:"post",
		url:"editReply.ucdo",
		data:params,
		dataType:"json",
		success:function(args){
			$('#prmsg'+index+rindex).css('display','');
			$('#rOption'+index+rindex).css('visibility','');
			$('#urmsg'+index+rindex).addClass('dnone');
			$('#urButton'+index+rindex).addClass('dnone');
			$('#uRCButton'+index+rindex).addClass('dnone');
//			console.log("기본: " + args[0].rment);
//			console.log("인코딩: " + encodeURIComponent(args[0].rment));
//			console.log(args[0].rdate);
//			console.log("index: " + index);
//			console.log("rindex: "+ rindex);
			$("#prmsg"+index+rindex).text(args[0].rment);
			$("#rdate"+index+rindex).text(args[0].cdate);
		}
	})
			
}


//Byte 수 체크 제한
function checkByte(obj, maxByte)
{
    var str = obj.value;
    var str_len = str.length;


    var rbyte = 0;
    var rlen = 0;
    var one_char = "";
    var str2 = "";


    for(var i=0; i<str_len; i++)
    {
        one_char = str.charAt(i);
        if(escape(one_char).length > 4)
        {
            rbyte += 2;                                         //한글2Byte
        }
        else
        {
            rbyte++;                                            //영문 등 나머지 1Byte
        }


        if(rbyte <= maxByte)
        {
            rlen = i+1;                                          //return할 문자열 갯수
        }
     }


     if(rbyte > maxByte)
     {
  // alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
  alert("글자수는 최대 " + maxByte + "byte를 초과할 수 없어요.!")
  str2 = str.substr(0,rlen);                                  //문자열 자르기
  obj.value = str2;
  checkByte(obj, maxByte);
     }
}
