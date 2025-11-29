<%@ page import="com.thc.project2_3_wsd.dao.BoardDAO" %>
<%@ page import="com.thc.project2_3_wsd.bean.BoardVO" %>
<%@ page import="com.thc.project2_3_wsd.common.FileUpload" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  String idParam = request.getParameter("id");
  int seq = 0;
  if(idParam != null){
    seq = Integer.parseInt(idParam);
  }

  BoardDAO boardDAO = new BoardDAO();
  BoardVO boardVO = boardDAO.getBoard(seq);

  String uploadPath = "/upload/";
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

  <form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
    <input type="hidden" name="seq" value="<%= boardVO.getSeq() %>">

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

    <div class="mb-3">
      <label class="form-label">첨부 파일</label>
      <% if (boardVO.getPhoto() != null && !boardVO.getPhoto().isEmpty()) { %>
      <div class="mb-2">
        <p>현재 파일: <strong><%= boardVO.getPhoto() %></strong></p>
        <img src="<%= request.getContextPath() + uploadPath + boardVO.getPhoto() %>" alt="현재 파일 이미지" class="img-thumbnail" style="max-width: 200px;">
        <br>
        <div class="form-check mt-2">
          <input class="form-check-input" type="checkbox" name="deleteExistingFile" id="deleteExistingFile" value="true">
          <label class="form-check-label" for="deleteExistingFile">기존 파일 삭제</label>
        </div>
      </div>
      <% } else { %>
      <p>첨부된 파일 없음</p>
      <% } %>
      <label for="photo" class="form-label mt-2">새 파일 업로드 (선택 사항)</label>
      <input class="form-control" type="file" id="photo" name="photo">
      <div class="form-text">이미지를 변경하거나, 기존 파일을 삭제 후 새로 업로드하세요.</div>
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