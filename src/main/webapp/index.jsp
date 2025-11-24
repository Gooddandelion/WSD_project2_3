<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP 게시판 - 홈</title>
</head>
<body>

<jsp:include page="header.jsp" />

<div class="container col-xxl-8 px-4 py-5">
    <div class="row flex-lg-row-reverse align-items-center g-5 py-5">
        <div class="col-10 col-sm-8 col-lg-6">
            <img src="https://dummyimage.com/700x500/343a40/6c757d.jpg&text=JSP+Project" class="d-block mx-lg-auto img-fluid rounded" alt="임시 메인 이미지" width="700" height="500" loading="lazy">        </div>
        <div class="col-lg-6">
            <h1 class="display-5 fw-bold lh-1 mb-3">나만의 JSP <br> 게시판 프로젝트</h1>
            <p class="lead">
                JSP와 Servlet, 그리고 MariaDB를 사용하여 만든 CRUD 게시판입니다.<br>
                Bootstrap 5를 적용하여 깔끔한 디자인을 구현했습니다.
                지금 바로 게시글을 작성해보세요!
            </p>
            <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                <a href="list.jsp" class="btn btn-primary btn-lg px-4 me-md-2">게시판 구경하기</a>
                <a href="write.jsp" class="btn btn-outline-secondary btn-lg px-4">글쓰기</a>
            </div>
        </div>
    </div>
</div>

<jsp:include page="footer.jsp" />

</body>
</html>