<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <meta name="description" content="" />
  <meta name="author" content="" />
  <title>푸렌드</title>
  <!-- Favicon-->
  <link rel="icon" type="image/x-icon" href="../../resources/css/favicon.ico" />
  <!-- Bootstrap icons-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <!-- Core theme CSS (includes Bootstrap)-->
  <link rel="stylesheet" href="../../resources/css/css/styles.css"  />
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
            <h4 class="mb-3">개인 정보 변경</h4>
                <form class="validation-form" novalidate role="form" method="post" autocomplete="off">
                    <div class="mb-3">
                        <label for="userName">아이디</label>
                        <input type="text" class="form-control" id="userId" name="userId" value="${member.userId}" readonly="readonly"/>
                    </div>

                    <div class="mb-3">
                        <label for="userName">변경할 닉네임</label>
                        <input type="text" class="form-control" id="userName" name="userName" value="${member.userName}" required/>
                        <div class="invalid-feedback">
                            변경할 닉네임을 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="userPass">변경할 비밀번호</label>
                        <input type="password" class="form-control" id="userPass" name="userPass" required/>
                        <div class="invalid-feedback">
                            변경할 비밀번호를 입력해주세요.
                        </div>
                    </div>

                    <div class="mb-4">
                        <p>
                            <button class="btn btn-outline-dark mt-auto" type="submit" id="submit" >회원 정보 변경</button>
                            <button class="btn btn-outline-dark mt-auto" onclick="location.href='/'" >처음으로</button>
                        </p>
                    </div>
                </form>
            </div>
        </div>
    </div>
</form>
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
