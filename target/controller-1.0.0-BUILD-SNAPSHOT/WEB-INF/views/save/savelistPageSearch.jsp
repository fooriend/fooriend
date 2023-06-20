<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
        .button1{font-size:20px; padding:20px 20px}
        .container_center {
            display: flex;
            justify-content: center;
            align-items: center;
            align-content: space-between;
        }
    </style>
</head>
<div class="container px-4 px-lg-5">
    <div id="nav">
        <%@ include file="savenav.jsp" %>
    </div>
    <div class="container px-4 px-lg-5">
        <table class="table table-striped table-hover">
            <thead>
            <tr>
                <th>번호</th>
                <th>제목</th>
                <th>작성일</th>
                <th>작성자</th>
            </tr>
            </thead>

            <tbody>
            <c:forEach items="${savelist}" var="savelist">
                <c:if test="${savelist.writer eq member.userName}">
                    <tr>
                        <td>${savelist.bno}</td>
                        <td>
                            <a href="/save/saveview?bno=${savelist.bno}" style="text-decoration: none; color: #0f0f0f; font-weight: bold">${savelist.title}</a>
                        </td>
                        <td>
                            <fmt:formatDate value="${savelist.regDate}" pattern="yyyy-MM-dd" />
                        </td>
                        <td>${savelist.writer}</td>
                    </tr>
                </c:if>
            </c:forEach>
            </tbody>
        </table>
        <br>

        <!--페이징-->
        <nav class="justify-content-center align-content-center px-4 px-lg-5 text-center">
            <div class="container_center">
                <ul class="pagination">
                    <c:if test="${pageMaker.startPage > 1}">
                        <li><a class="page-link" href="${ctx}/save/savelistPageSearch?page=${pageMaker.startPage - 1}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&orderBy=${cri.orderBy}">이전</a></li>
                    </c:if>
                    <c:forEach var="i" begin="${pageMaker.startPage > 0 ? pageMaker.startPage : 1}" end="${pageMaker.endPage}">
                        <c:choose>
                            <c:when test="${i == cri.page}">
                                <li class="active"><a href="#" class="page-link">${i} </a></li>
                            </c:when>
                            <c:otherwise>
                                <li><a class="page-link" href="${ctx}/save/savelistPageSearch?page=${i}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&orderBy=${cri.orderBy}">${i} </a></li>
                            </c:otherwise>
                        </c:choose>
                    </c:forEach>
                    <c:if test="${pageMaker.endPage < pageMaker.totalCount}">
                        <li><a class="page-link" href="${ctx}/save/savelistPageSearch?page=${pageMaker.endPage + 1}&perPageNum=${cri.perPageNum}&searchType=${cri.searchType}&keyword=${cri.keyword}&orderBy=${cri.orderBy}">다음</a></li>
                    </c:if>
                </ul>
            </div>
        </nav>
        <!--검색-->
        <nav class="align-content-center px-4 px-lg-5 text-center">
            <form id="search-form" method="get" action="${ctx}/save/savelistPageSearch">
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

<script>

    document.getElementById("searchBtn").onclick = function () {

        let searchType = document.getElementsByName("searchType")[0].value;
        let keyword =  document.getElementsByName("keyword")[0].value;

        location.href = "/save/savelistPageSearch?num=1" + "&searchType=" + searchType + "&keyword=" + keyword;
    };
</script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
