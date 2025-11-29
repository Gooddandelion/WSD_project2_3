<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.thc.project2_3_wsd.dao.BoardDAO" %>
<%@ page import="com.thc.project2_3_wsd.common.FileUpload" %>
<%@ page import="com.thc.project2_3_wsd.bean.BoardVO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%
  BoardDAO boardDAO = new BoardDAO();
  FileUpload upload = new FileUpload();
  BoardVO u = upload.uploadFile(request);

  int i = boardDAO.insertBoard(u);
  String message = "insert: success";
  if(i!=1) message = "insert: fail";
%>

<script>
  alert("<%=message%>");
  location.href='list.jsp';
</script>