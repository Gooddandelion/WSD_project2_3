<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.thc.project2_3_wsd.dao.BoardDAO" %>
<%@ page import="com.thc.project2_3_wsd.bean.BoardVO" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="u" class="com.thc.project2_3_wsd.bean.BoardVO"/>
<jsp:setProperty name="u" property="*"/>
<jsp:setProperty name="u" property="seq" param="id"/>


<%
    BoardDAO boardDAO = new BoardDAO();
    BoardVO boardVO = new BoardVO();
    int i = boardDAO.updateBoard(u);
    String message = "edit: success";
    if(i!=1) message = "edit: fail";
%>
<script>
    alert('<%=message%>');
    location.href='view.jsp?id=<%=u.getSeq()%>';
</script>
