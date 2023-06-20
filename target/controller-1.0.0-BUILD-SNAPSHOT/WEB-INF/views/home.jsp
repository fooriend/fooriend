<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
    <link href="../../resources/css/css/styles.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container px-4 px-lg-5">
        <a href="/"><img src="../../resources/img/fooriend_b.png"></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4">
                <li class="nav-item"><a class="nav-link active" href="board/listPageSearch?page=1&perPageNum=12&searchType=&keyword=&orderBy=&category=">게시판</a></li>
                <c:if test="${member != null}">
                    <li class="nav-item"><a class="nav-link active" href="board/likelist">찜 목록</a></li>
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
                        <a class="nav-link dropdown-toggle active" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">마이페이지</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="../member/logout">로그아웃</a></li>
                            <li><a class="dropdown-item" href="board/likelist">찜 목록</a></li>
                            <li><a class="dropdown-item" href="save/savelistPageSearch?page=1&perPageNum=12&searchType=&keyword=&sort=">임시저장</a></li>
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
<!-- Header<header class="bg-warning py-5">-->
<header class="bg-primary py-5">
    <div class="container position-relative">
        <div class="row justify-content-center">
            <div class="col-xl-6">
                <div class="text-center text-white">
                    <!-- Page heading-->
                    <h1 class="mb-5">레시피를 검색하세요</h1>
                    <form class="form-subscribe" id="contactForm" data-sb-form-api-token="API_TOKEN" action="board/listPageSearch">
                        <div class="row">
                            <div class="col">
                                <input type="hidden" name="page" type="text" value="1" />
                                <input type="hidden" name="searchType" type="text" value="titleContent" />
                                <input type="hidden" name="perPageNum" type="text" value="12" />
                                <input type="hidden" name="orderBy" type="text" value="regDate" />
                                <input class="form-control form-control-lg" name="keyword" type="text" placeholder="검색어를 입력하세요" data-sb-validations="required,value" value="${page.keyword}" />
                                <div class="invalid-feedback text-white" data-sb-feedback="search:required">Value is required.</div>
                            </div>
                            <div class="col-auto"><button class="btn btn-light btn-lg" id="searchBtn" type="submit">검색</button></div>
                        </div>
                        <div class="d-none" id="submitSuccessMessage">
                            <div class="text-center mb-3">
                                <div class="fw-bolder">Form submission successful!</div>
                                <p>To activate this form, sign up at</p>
                                <a class="text-white" href="https://startbootstrap.com/solution/contact-forms">https://startbootstrap.com/solution/contact-forms</a>
                            </div>
                        </div>
                        <div class="d-none" id="submitErrorMessage"><div class="text-center text-danger mb-3">Error sending message!</div></div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</header>
<section class="py-5">
    <div class="container px-4 px-lg-5 mt-5">
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <c:forEach var="board" items="${popularBoardList}">
                <div class="col mb-5">
                    <div class="card h-100">
                        <c:choose>
                            <c:when test="${!empty board.imgPath}">
                                <a href="/board/view?bno=${board.bno}"><img src=" <spring:url value = '/static/upload/${board.imgPath}'/> "class="card-img-top" alt="image" style="height: 10rem;"></a>
                            </c:when>
                            <c:otherwise>
                                <a href="/board/view?bno=${board.bno}"><img src="../../../resources/img/Fooriend.png" class="card-img-top" alt="..." style="height: 10rem;"</a>
                            </c:otherwise>
                        </c:choose>
                        <div class="card-body">
                            <a class="card-title" href="/board/view?bno=${board.bno}" style="text-decoration: none; color: black; font-size: 20px; font-weight: bold;">${board.title}</a>
                        </div>
                        <ul class="list-group list-group-flush">
                            <li class="list-group-item">${board.writer}</li>
                        </ul>
                        <c:if test="${not empty member.userName}">
                        <div class="card-footer">
                            <span class="like-container">
                              <span class="like-btn" data-bno="${board.bno}">
                                <img src="../../../resources/img/like1.png" width="30px">
                              </span>
                              <span class="unlike-btn d-none" data-bno="${board.bno}">
                                <img src="../../../resources/img/like2.png" width="30px">
                              </span>
                              <span class="like-cnt">${board.likeCnt}</span>
                            </span>
                        </div>
                        </c:if>
                        <input type="hidden" id="bno-${board.bno}" value="${board.bno}">
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Section-->
<%--<section class="py-5">--%>
<%--    <div class="container px-4 px-lg-5 mt-5">--%>
<%--        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="../../resources/img/potato.png" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">레시피1</h5>--%>
<%--                            <div class="d-flex justify-content-center small text-warning mb-2">--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            감자--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">찜하기</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Sale badge-->--%>
<%--                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Best</div>--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="../../resources/img/sweetpotato.png" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">레시피2</h5>--%>
<%--                            <!-- Product reviews-->--%>
<%--                            <div class="d-flex justify-content-center small text-warning mb-2">--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            고구마--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">찜하기</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Sale badge-->--%>
<%--                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Best</div>--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="../../resources/img/chicken.png" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">레시피3</h5>--%>
<%--                            <div class="d-flex justify-content-center small text-warning mb-2">--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            닭--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">찜하기</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="../../resources/img/tuna.png" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">레시피4</h5>--%>
<%--                            <!-- Product reviews-->--%>
<%--                            <div class="d-flex justify-content-center small text-warning mb-2">--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            참치--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">찜하기</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Sale badge-->--%>
<%--                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Sale Item</h5>--%>
<%--                            <!-- Product price-->--%>
<%--                            <span class="text-muted text-decoration-line-through">$50.00</span>--%>
<%--                            $25.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Fancy Product</h5>--%>
<%--                            <!-- Product price-->--%>
<%--                            $120.00 - $280.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Sale badge-->--%>
<%--                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Special Item</h5>--%>
<%--                            <!-- Product reviews-->--%>
<%--                            <div class="d-flex justify-content-center small text-warning mb-2">--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            <span class="text-muted text-decoration-line-through">$20.00</span>--%>
<%--                            $18.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="col mb-5">--%>
<%--                <div class="card h-100">--%>
<%--                    <!-- Product image-->--%>
<%--                    <img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="..." />--%>
<%--                    <!-- Product details-->--%>
<%--                    <div class="card-body p-4">--%>
<%--                        <div class="text-center">--%>
<%--                            <!-- Product name-->--%>
<%--                            <h5 class="fw-bolder">Popular Item</h5>--%>
<%--                            <!-- Product reviews-->--%>
<%--                            <div class="d-flex justify-content-center small text-warning mb-2">--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                                <div class="bi-star-fill"></div>--%>
<%--                            </div>--%>
<%--                            <!-- Product price-->--%>
<%--                            $40.00--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                    <!-- Product actions-->--%>
<%--                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">--%>
<%--                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</section>--%>
<!-- Footer-->
<footer class="py-5 bg-primary">
</footer>
<script>
    var userId = '${member.userId}';  // 회원 아이디

    // 좋아요 버튼 클릭 시
    $('.like-btn').on('click', function() {
        var bno = $(this).data('bno'); // 게시글 번호
        var likeContainer = $(this).closest('.like-container');
        var likeBtn = likeContainer.find('.like-btn');
        var unlikeBtn = likeContainer.find('.unlike-btn');
        var likeCntSpan = likeContainer.find('.like-cnt');

        $.ajax({
            url: '/likeadd',
            type: 'POST',
            data: {bno: bno, userId: userId},
            success: function(data) {
                if (data == 'success') {
                    var likeCnt = parseInt(likeCntSpan.text()) + 1;
                    likeCntSpan.text(likeCnt);
                    likeBtn.addClass('d-none');
                    unlikeBtn.removeClass('d-none');
                } else {
                    alert("좋아요 반영에 실패했습니다.");
                }
            },
            error: function() {
                alert("서버와의 통신에 실패했습니다.");
            }
        });
    });

    // 좋아요 취소 버튼 클릭 시
    $('.unlike-btn.d-none').on('click', function() {
        var bno = $(this).data('bno'); // 게시글 번호
        var likeContainer = $(this).closest('.like-container');
        var likeBtn = likeContainer.find('.like-btn');
        var unlikeBtn = likeContainer.find('.unlike-btn');
        var likeCntSpan = likeContainer.find('.like-cnt');

        $.ajax({
            url: '/likedelete',
            type: 'POST',
            data: {bno: bno, userId: userId},
            success: function(data) {
                if (data == 'success') {
                    var likeCnt = parseInt(likeCntSpan.text()) - 1;
                    likeCntSpan.text(likeCnt);
                    unlikeBtn.addClass('d-none');
                    likeBtn.removeClass('d-none');
                } else {
                    alert("좋아요 취소에 실패했습니다.");
                }
            },
            error: function(){
                alert("서버와의 통신에 실패했습니다.");}
        });
    });

    // 페이지 로딩 시 해당 게시글에 좋아요를 눌렀는지 체크
    $(document).ready(function() {
        $('.like-btn').each(function() {
            var bno = $(this).data('bno'); // 게시글 번호
            var likeContainer = $(this).closest('.like-container');
            var likeBtn = likeContainer.find('.like-btn');
            var unlikeBtn = likeContainer.find('.unlike-btn');

            $.ajax({
                url: '/like/' + bno + '/' + userId,
                type: 'GET',
                success: function(data) {
                    if (data == true) {
                        likeBtn.addClass('d-none');
                        unlikeBtn.removeClass('d-none');
                    } else {
                        unlikeBtn.addClass('d-none');
                        likeBtn.removeClass('d-none');
                    }
                }.bind(this) // 콜백 함수 내에서 this를 $(this)로 바인딩합니다.
            });
        });
    });

</script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
