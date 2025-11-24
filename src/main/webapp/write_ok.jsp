<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.thc.project2_2_wsd.dao.BoardDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="u" class="com.thc.project2_2_wsd.bean.BoardVO"/>
<jsp:setProperty name="u" property="*"/>

<%
  BoardDAO boardDAO = new BoardDAO();
  int i = boardDAO.insertBoard(u);
  String message = "insert: success";
  if(i!=1) message = "insert: fail";
%>

<script>
  alert("<%=message%>");
  location.href='list.jsp';
</script>