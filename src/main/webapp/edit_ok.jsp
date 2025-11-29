<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.thc.project2_3_wsd.dao.BoardDAO" %>
<%@ page import="com.thc.project2_3_wsd.bean.BoardVO" %>
<%@ page import="com.thc.project2_3_wsd.common.FileUpload" %>

<% request.setCharacterEncoding("UTF-8"); %>

<%
    BoardDAO boardDAO = new BoardDAO();
    FileUpload fileUpload = new FileUpload();

    BoardVO u = fileUpload.uploadFile(request);

    int seq= u.getSeq();

    int i = boardDAO.updateBoard(u);
    String message = "edit: success";
    if(i!=1) message = "edit: fail";
%>
<script>
    alert('<%=message%>');
    location.href='view.jsp?id=<%=seq%>';
</script>