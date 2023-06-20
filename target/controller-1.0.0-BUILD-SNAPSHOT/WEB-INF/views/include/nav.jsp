<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<head>
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="../../resources/css/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link href="../../resources/css/css/styles.css" rel="stylesheet" />
</head>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a href="/"><img src="../../resources/img/fooriend_b.png"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
				<li class="nav-item"><a class="nav-link active" href="listPageSearch?page=1&perPageNum=12&searchType=&keyword=&orderBy=&category=">게시판</a></li>
				<c:if test="${member != null}">
					<li class="nav-item"><a class="nav-link active" href="likelist">찜 목록</a></li>
				</c:if>
			</ul>
		</div>
		<div class="collapse navbar-collapse justify-content-end" id="collapsibleNavbar">
			<ul class="navbar-nav">
				<c:choose>
					<c:when test="${empty member}">
						<a class="btn" href="../member/login">로그인</a>
						<a class="btn" href="../member/register">회원가입</a>
					</c:when>
					<c:otherwise>
						<li class="nav-item nav-link">${member.userName}님이 로그인하였습니다</li>
						<li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle active" id="navbarDropdown" type="button" data-toggle="dropdown" aria-expanded="false">마이페이지</a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="../member/logout">로그아웃</a></li>
								<li><a class="dropdown-item" href="likelist">찜 목록</a></li>
								<li><a class="dropdown-item" href="../save/savelistPageSearch?page=1&perPageNum=12&searchType=&keyword=&sort=">임시저장</a></li>
								<li><hr class="dropdown-divider" /></li>
								<li><a class="dropdown-item" href="../member/modify">개인정보변경</a></li>
								<li><a class="dropdown-item" href="../member/withdrawal">회원탈퇴</a></li>
							</ul>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</nav>
