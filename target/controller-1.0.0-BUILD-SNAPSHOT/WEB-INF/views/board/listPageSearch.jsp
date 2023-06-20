<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.board.domain.PageMaker"%>
<%@page import="com.board.domain.SearchCriteria"%>
<%@page import="java.net.URLEncoder"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ page import="java.util.List" %>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<title>푸렌드</title>
	<!-- Favicon-->
	<link rel="icon" type="image/x-icon" href="../../../resources/css/favicon.ico" />
	<!-- Bootstrap icons-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
	<!-- Core theme CSS (includes Bootstrap)-->
	<link rel="stylesheet" href="../../../resources/css/css/styles.css"  />
	<style>
		.rate{background: url(https://aldo814.github.io/jobcloud/html/images/user/star_bg02.png) no-repeat;width: 121px;height: 20px;position: relative;}
		.rate span{position: absolute;background: url(https://aldo814.github.io/jobcloud/html/images/user/star02.png);width: auto;height: 20px;}
		.sort{
			text-decoration: none;
			color: white;
		}
		.card {
			margin: 5px;
		}
		.container_center {
			display: flex;
			justify-content: center;
			align-items: center;
			align-content: space-between;
		}
		/*카테고리 css*/
		.horizontal-menu {
			display: flex;
			list-style: none;
			padding: 0;
			overflow: hidden;
			justify-content: center;
			align-items: center;
		}

		.horizontal-menu li {
			float: left;
		}

		.horizontal-menu li:last-child {
			margin-right: 0;
		}

		.horizontal-menu li a {
			display: block;
			color: #b38f64;
			text-align: center;
			padding: 4px 30px;
			text-decoration: none;
			background-color: #ffffff;
			border: 1px solid #ccc;
			border-radius: 4px 4px 0px 0px;
			transition: background-color 0.3s, color 0.3s;
		}

		.horizontal-menu li a:hover {
			background-color: #dab488;
			color: white;
		}

	</style>

</head>
<div>
<div class="container px-4 px-lg-5">
	<div id="nav">
	 <%@ include file="../include/nav.jsp" %>
	</div>
	<br>
	<!--게시글 목록-->
	<div class="container px-4 px-lg-5">
		<!--카테고리-->
		<nav>
			<ul class="horizontal-menu">
				<li><a class="${category == '' ? 'selected' : ''}" href="${ctx}/board/listPageSearch?page=1&perPageNum=12&searchType=&keyword=&orderBy=&category=" onclick="selectCategory('')">전체</a></li>
				<li><a class="${category == '한식' ? 'selected' : ''}" href="${ctx}/board/listPageSearch?page=1&perPageNum=12&searchType=&keyword=&orderBy=new&category=한식" onclick="selectCategory('한식')">한식</a></li>
				<li><a class="${category == '일식' ? 'selected' : ''}" href="${ctx}/board/listPageSearch?page=1&perPageNum=12&searchType=&keyword=&orderBy=new&category=일식" onclick="selectCategory('일식')">일식</a></li>
				<li><a class="${category == '양식' ? 'selected' : ''}" href="${ctx}/board/listPageSearch?page=1&perPageNum=12&searchType=&keyword=&orderBy=new&category=양식" onclick="selectCategory('양식')">양식</a></li>
				<li><a class="${category == '중식' ? 'selected' : ''}" href="${ctx}/board/listPageSearch?page=1&perPageNum=12&searchType=&keyword=&orderBy=new&category=중식" onclick="selectCategory('중식')">중식</a></li>
				<li><a class="${category == '분식' ? 'selected' : ''}" href="${ctx}/board/listPageSearch?page=1&perPageNum=12&searchType=&keyword=&orderBy=new&category=분식" onclick="selectCategory('분식')">분식</a></li>
				<li><a class="${category == '간식' ? 'selected' : ''}" href="${ctx}/board/listPageSearch?page=1&perPageNum=12&searchType=&keyword=&orderBy=new&category=간식" onclick="selectCategory('간식')">간식</a></li>
				<li><a class="${category == '기타' ? 'selected' : ''}" href="${ctx}/board/listPageSearch?page=1&perPageNum=12&searchType=&keyword=&orderBy=new&category=기타" onclick="selectCategory('기타')">기타</a></li>
			</ul>
		</nav>
		<!--정렬-->
		<div >
			<button class="btn btn-primary btn-sm"><a class="sort" href="${ctx}/board/listPageSearch?page=1&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&orderBy=new&category=${cri.category}">작성일순</a></button>
			<button class="btn btn-primary btn-sm"><a class="sort" href="${ctx}/board/listPageSearch?page=1&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&orderBy=view&category=${cri.category}">조회수순</a></button>
			<button class="btn btn-primary btn-sm"><a class="sort" href="${ctx}/board/listPageSearch?page=1&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&orderBy=like&category=${cri.category}">좋아요순</a></button>
			<button class="btn btn-primary btn-sm"><a class="sort" href="${ctx}/board/listPageSearch?page=1&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&orderBy=reply&category=${cri.category}">댓글순</a></button>
		</div>

		<div class="row row-cols-1 row-cols-md-4 g-3" >
			<c:forEach var="board" items="${list}">
				<div class="col" >
					<div class="card" style="width: 18rem;">
						<c:choose>
							<c:when test="${!empty board.imgPath}">
								<a href="/board/view?bno=${board.bno}"><img src=" <spring:url value = '/static/upload/${board.imgPath}'/> "class="card-img-top" alt="image" style="height: 10rem;"></a>
							</c:when>
							<c:otherwise>
								<a href="/board/view?bno=${board.bno}"><img src="<c:url value='/static/upload/${board.imgPath}'/>" class="card-img-top" alt="..." style="height: 10rem;"></a>
								<!--<img src="../../../resources/img/Fooriend.png" class="card-img-top" alt="..." style="height: 10rem;" id="thumbnail">-->
							</c:otherwise>
						</c:choose>
						<div class="card-body">
							<h5 class="card-title"> <a href="/board/view?bno=${board.bno}" style="text-decoration: none; color: #0f0f0f; font-weight: bold">${board.title} (${board.replyCnt}) </a> </h5>
							<p class="card-title"> ${board.writer} | <fmt:formatDate value="${board.regDate}" pattern="yyyy-MM-dd" /> </p>
							<p>별점(${board.averagerating})</p>
							<p class="rate"><span style="width:${board.averagerating*20}%" > </span> </p>
							<p class="card-title">💖(${board.likeCnt}) 👀(${board.viewCnt}) </p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>

		<button class="btn btn-lg btn-primary" style="float:right; " onclick="location.href='/board/write'">글 작성</button>
		<br>
		<!--페이징-->
		<nav class="justify-content-center align-content-center px-4 px-lg-5 text-center">
				<div class="container_center">
					<ul class="pagination">
						<c:if test="${pageMaker.startPage > 1}">
							<li><a class="page-link" href="${ctx}/board/listPageSearch?page=${pageMaker.startPage - 1}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&orderBy=${cri.orderBy}">이전</a></li>
						</c:if>
						<c:forEach var="i" begin="${pageMaker.startPage > 0 ? pageMaker.startPage : 1}" end="${pageMaker.endPage}">
							<c:choose>
								<c:when test="${i == cri.page}">
									<li class="active"><a href="#" class="page-link">${i} </a></li>
								</c:when>
								<c:otherwise>
									<li><a class="page-link" href="${ctx}/board/listPageSearch?page=${i}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&orderBy=${cri.orderBy}">${i} </a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${pageMaker.endPage < pageMaker.totalCount}">
							<li><a class="page-link" href="${ctx}/board/listPageSearch?page=${pageMaker.endPage + 1}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&orderBy=${cri.orderBy}">다음</a></li>
						</c:if>
					</ul>
				</div>
		</nav>
		<!--검색-->
		<nav class="align-content-center px-4 px-lg-5 text-center">
			<form id="search-form" method="get" action="${ctx}/board/listPageSearch">
				<input type="hidden" name="page" value="1">
				<input type="hidden" name="perPageNum" value="${cri.perPageNum}">
				<input type="hidden" name="orderBy" value="${cri.orderBy}">
				<select name="searchType" class="dropdown">
					<option value="title">제목</option>
					<option value="content">내용</option>
					<option value="writer">작성자</option>
					<option value="titleContent">제목+내용</option>
				</select>
				<input type="text" name="keyword" placeholder="검색어를 입력하세요." value="${cri.keyword}">
				<button type="submit" class="btn btn-primary btn-sm">검색</button>
			</form>
		</nav>
	</div>
</div>
</div>
	<!-- Bootstrap core JS-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function selectCategory(category) {
        // 선택한 카테고리 값을 저장하고, 정렬 버튼에 해당 카테고리 정보를 추가하여 링크를 생성합니다.
        var selectedCategory = category;
        var sortLinks = document.getElementsByClassName('sort');
        for (var i = 0; i < sortLinks.length; i++) {
            var link = sortLinks[i].getAttribute('href');
            link += '&category=' + selectedCategory;
            sortLinks[i].setAttribute('href', link);
        }
    }
</script>
</body>
</html>
