<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.thc.project2_3_wsd.dao.BoardDAO" %>
<%@ page import="com.thc.project2_3_wsd.bean.BoardVO" %>


<%
    String idParam = request.getParameter("id");
    int seq = 0;

    if(idParam != null){
        seq = Integer.parseInt(idParam);
    }

    BoardDAO boardDAO = new BoardDAO();
    BoardVO boardVO = boardDAO.getBoard(seq);
    boardDAO.CountBoard(seq);

    String uploadPath = "/upload/";
%>
<html>
<head>
    <title>글 상세보기</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container mt-5" style="max-width: 800px;">

    <div class="card">
        <div class="card-header">
            <h3><%= boardVO.getTitle() %></h3>
            <div class="text-muted small">
                작성자: <%= boardVO.getWriter() %>
                카테고리: <%= boardVO.getCategory()%>
                작성일자: <%= boardVO.getRegdate()%>
                조회수: <%= boardVO.getCnt()%>
            </div>
        </div>
        <div class="card-body">

            <h5 class="mt-4 mb-3">첨부 파일</h5>
            <% if (boardVO.getPhoto() != null && !boardVO.getPhoto().isEmpty()) { %>
            <div class="mb-4 text-center">
                <p>파일명: <strong><%= boardVO.getPhoto() %></strong></p>
                <img src="<%= request.getContextPath() + uploadPath + boardVO.getPhoto() %>"
                     alt="<%= boardVO.getPhoto() %> 파일"
                     class="img-fluid rounded"
                     style="max-height: 400px; border: 1px solid #ddd;">
            </div>
            <% } else { %>
            <p class="text-muted">첨부된 파일 없음</p>
            <% } %>

            <hr>

            <h5 class="mt-4 mb-3">내용</h5>
            <p style="white-space: pre-wrap;"><%= boardVO.getContent() %></p>
        </div>
    </div>

    <div class="mt-4 d-flex justify-content-between">
        <a href="list.jsp" class="btn btn-secondary">목록</a>
        <div>
            <a href="edit.jsp?id=<%= boardVO.getSeq() %>" class="btn btn-outline-primary">수정</a>
            <a href="delete_ok.jsp?id=<%= boardVO.getSeq() %>" class="btn btn-outline-danger">삭제</a>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>