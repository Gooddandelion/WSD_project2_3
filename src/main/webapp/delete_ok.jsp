<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.thc.project2_3_wsd.dao.BoardDAO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="u" class="com.thc.project2_3_wsd.bean.BoardVO"/>
<jsp:setProperty name="u" property="seq" param="id"/>

<%
  BoardDAO boardDAO = new BoardDAO();
  boardDAO.deleteBoard(u);
%>

<script>
  alert('delete: success');
  location.href='list.jsp';
</script>
