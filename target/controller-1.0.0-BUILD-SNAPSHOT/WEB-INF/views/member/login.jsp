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
            <h4 class="mb-3">로그인</h4>
            <form class="validation-form" novalidate role="form" method="post" autocomplete="off" action="login">
			 <div class="mb-3">
			  <label for="userId">아이디</label>
			  <input type="text" class="form-control" id="userId" name="userId" placeholder="" value="" required/>
			  <div class="invalid-feedback">
                        아이디를 입력해주세요.
              </div>
			 </div>
			<!-- </p>-->

			 <div class="mb-3">
			  <label for="userPass">패스워드</label>
			  <input type="password" class="form-control" id="userPass" name="userPass" placeholder="" value="" required/>
			  <div class="invalid-feedback">
                        비밀번호를 입력해주세요.
              </div>
			 </div>

			 <div class="mb-4">
				 <p>
					 <button class="btn btn-outline-dark mt-auto" type="submit" id="submit" >로그인</button>
					 <button class="btn btn-outline-dark mt-auto" onclick="location.href='register'" >회원가입</button>
					 <button class="btn btn-outline-dark mt-auto" onclick="location.href='/'" >처음으로</button>
				 </p>
			 </div>
			</form>
		</div>
	</div>
</div>

<script>
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
</script>
</body>
</html>
