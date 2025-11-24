<%@ page import="com.thc.project2_3_wsd.dao.BoardDAO" %>
<%@ page import="com.thc.project2_3_wsd.bean.BoardVO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:useBean id="u" class="com.thc.project2_3_wsd.bean.BoardVO"/>
<jsp:setProperty name="u" property="seq" param="id"/>

<%
  BoardDAO boardDAO = new BoardDAO();
  BoardVO boardVO = new BoardVO();
  boardVO = boardDAO.getBoard(u.getSeq());
%>
<html>
<head>
  <meta charset="UTF-8">
  <title>글 수정</title>
</head>
<body>
<jsp:include page="header.jsp" />
<div class="container mt-5" style="max-width: 800px;">
  <h2 class="text-center mb-4">글 수정 (ID: <%= boardVO.getSeq() %>)</h2>

  <form action="edit_ok.jsp" method="post">
    <input type="hidden" name="id" value="<%= boardVO.getSeq() %>">

    <div class="mb-3">
      <label for="title" class="form-label">제목</label>
      <input type="text" class="form-control" id="title" name="title" value="<%= boardVO.getTitle() %>">
    </div>
    <div class="mb-3">
      <label for="writer" class="form-label">작성자</label>
      <input type="text" class="form-control" id="writer" name="writer" value="<%= boardVO.getWriter() %>">
    </div>
    <div class="mb-3">
      <label for="category" class="form-label">카테고리</label>
      <select class="form-select" id="category" name="category">
        <option value="공지">공지</option>
        <option value="자유">자유</option>
        <option value="질문">질문</option>
      </select>
    </div>
    <div class="mb-3">
      <label for="content" class="form-label">내용</label>
      <textarea class="form-control" id="content" name="content" rows="10"><%= boardVO.getContent() %></textarea>
    </div>

    <div class="d-flex justify-content-between">
      <a href="view.jsp?id=<%= boardVO.getSeq() %>" class="btn btn-secondary">취소</a>
      <button type="submit" class="btn btn-primary">수정 완료</button>
    </div>
  </form>
</div>
<jsp:include page="footer.jsp" />
</body>
</html>