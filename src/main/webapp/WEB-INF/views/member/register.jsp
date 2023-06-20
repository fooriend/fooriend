<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

<html>
<head>
	<title>푸렌드</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="../../resources/css/favicon.ico" />
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	<style>
		@font-face {
			font-family: 'NanumSquareNeo-Variable';
			src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
			font-weight: normal;
			font-style: normal;
		}

		body {
            min-height: 100vh;
            background: #dab488;
			font-family: 'NanumSquareNeo-Variable';
        }

        .input-form {
            max-width: 680px;

            margin-top: 80px;
            padding: 32px;

            background: #fff;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            border-radius: 10px;
            -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
            box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
        }
    </style>
</head>
<body>
<div class="container">
    <div class="input-form-backgroud row">
        <div class="input-form col-md-12 mx-auto">
            <h4 class="mb-3">회원가입</h4>
            <form class="validation-form" novalidate role="form" method="post" autocomplete="off" action="register">
			 <p>
			  <label for="userId">아이디</label>
			  <input type="text" class="form-control" id="userId" name="userId" placeholder="" value="" required/>
			  <button type="button" class="btn btn-outline-dark mt-auto idCheck">아이디 중복 확인</button>
			  <span class="msg">아이디 중복 확인 해주세요.</span>
			 </p>


			 <p>
			  <label for="userPass">패스워드</label>
			  <input type="password" class="form-control" id="userPass" name="userPass" placeholder="" value="" required/>
			 </p>

			 <p>
			  <label for="userName">닉네임</label>
			  <input type="text" class="form-control" id="userName" name="userName" placeholder="" value="" required/>
				 <button type="button" class="btn btn-outline-dark mt-auto nameCheck">닉네임 중복 확인</button>
				 <span class="name">닉네임 중복 확인 해주세요.</span>
			 </p>

			 <div class="mb-4">
				 <p>
					 <button class="btn btn-outline-dark mt-auto" type="submit" id="submit" disabled="disabled" >회원가입</button>
					 <button class="btn btn-outline-dark mt-auto" onclick="location.href='/'" >처음으로</button>
				 </p>
			 </div>
			</form>
		</div>
<script>



//아이디 중복 확인
$(".idCheck").click(function(){

   var query = {userId : $("#userId").val()};
   if(query.userId.length){
	   $.ajax({
	    url : "/member/idCheck",
	    type : "post",
	    data : query,
	    success : function(data) {

		     if(data == 1) {
			      $(".msg").text("사용 불가");
			      $(".msg").attr("style", "color:#f00");
			      $("#submit").attr("disabled", "disabled");
		     } else {
			      $(".msg").text("사용 가능");
			      $(".msg").attr("style", "color:#00f");
			      $("#submit").removeAttr("disabled");
		     }
	    }
	   });	// ajax 끝
   }else{
	   alert("아이디 입력을 해주세요.");
   }
});
$("#userId").keyup(function(){
	   $(".msg").text("아이디 중복 확인 해주세요.");
	   $(".msg").attr("style", "color:#000");

	   $("#submit").attr("disabled", "disabled");
});

window.addEventListener('load', () => {
    const forms = document.getElementsByClassName('validation-form');

    Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }

            form.classList.add('was-validated');
        }, false);
    });
}, false);



//닉네임 중복 체크

$(".nameCheck").click(function(){

	var query = {userName : $("#userName").val()};
	if(query.userName.length){
		$.ajax({
			url : "/member/nameCheck",
			type : "post",
			data : query,
			success : function(data1) {

				if(data1 == 1) {
					$(".name").text("사용 불가");
					$(".name").attr("style", "color:#f00");
					$("#submit").attr("disabled", "disabled");
				} else {
					$(".name").text("사용 가능");
					$(".name").attr("style", "color:#00f");
					$("#submit").removeAttr("disabled");
				}
			}
		});	// ajax 끝
	}else{
		alert("닉네임 입력을 해주세요.");
	}
});
$("#userName").keyup(function(){
	$(".name").text("닉네임 중복 확인 해주세요.");
	$(".name").attr("style", "color:#000");

	$("#submit").attr("disabled", "disabled");
});


</script>
</body>
</html>
