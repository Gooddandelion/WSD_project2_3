<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.thc.project2_3_wsd.dao.BoardDAO" %>
<%@ page import="com.thc.project2_3_wsd.bean.BoardVO" %>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList();
    String keyword = request.getParameter("searchKeyword");

    // Search 기능 구현
    if (keyword != null && !keyword.trim().isEmpty()) {
        list = boardDAO.searchBoard(keyword);
    } else {
        list = boardDAO.getBoardList();
    }

    request.setAttribute("list", list);
%>
<head>
    <title>게시판 목록</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container mt-5">
    <h2 class="text-center mb-4">JSP 게시판</h2>

    <div class="row mb-3">
        <div class="col-md-6 offset-md-3"> <form action="list.jsp" method="get" class="d-flex">
            <input class="form-control me-2" type="text" name="searchKeyword" placeholder="제목을 입력하세요" value="${param.searchKeyword}">
            <button class="btn btn-outline-primary" type="submit" > 검색 search</button>
            <c:if test="${not empty param.searchKeyword}">
                <a href="list.jsp" class="btn btn-outline-secondary ms-1" >초기화 reset</a>
            </c:if>
        </form>
        </div>
    </div>

    <table class="table table-hover text-center">
        <thead class="table-light">
        <tr>
            <th>글번호</th>
            <th>제목</th>
            <th>작성자</th>
            <th>작성일</th>
            <th>조회수</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.seq}
            </td>

            <td class="text-start">
                <a href="view.jsp?id=${u.seq}" class="text-decoration-none text-dark">
                        ${u.title}
                </a>
            </td>

            <td>${u.writer}
            </td>
            <td>${u.regdate}
            </td>
            <td>${u.cnt}
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="d-flex justify-content-end">
        <a href="write.jsp" class="btn btn-primary">글쓰기</a>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>