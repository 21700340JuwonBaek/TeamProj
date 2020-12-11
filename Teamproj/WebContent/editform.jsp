<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.project.dao.postDAO, com.project.bean.postVO"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
 integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Caveat&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>Edit Form</title>
</head>
<style>
body{
	font-family: "Lucida Blackletter", 'Nanum Gothic', monospace;
	font-size:30px;
	padding: 20px;
}

th{
	text-align: center;
	background-color:#2E64FE;
	color:white;
	padding-right: 8px;

}
input{
	border:hidden;
}


</style>
<body>

<%
	postDAO postDao = new postDAO();
	String sid=request.getParameter("sid");	
	postVO u=postDao.getPost(Integer.parseInt(sid));
	request.setAttribute("vo", u);
%>

<h1>Edit Form</h1>
<form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
<input type="hidden" name="sid" value="<%=u.getSid() %>"/>
<%System.out.println("폼 안에서 sid : " + u.getSid()); %>
<table class="table-bordered">
<tr><th>Category:</th><td><input type="text" name="category" value="<%=u.getCategory()%>"/></td></tr>
<tr><th>Title:</th><td><input type="text" name="title" value="<%=u.getTitle()%>"/></td></tr>
<tr><th>Writer:</th><td><input type="text" name="writer" value="<%=u.getWriter()%>"/></td></tr>
<tr><th>Photo:</th><td><input type="file" name="photo" value="${vo.getPhoto() }"/><br/>
<c:if test="${vo.getPhoto() ne '' }"><img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}"/></c:if></td></tr>
<tr><th>Detail:</th><td><input type="text" name="detail" value="<%=u.getDetail()%>"/></td></tr>
<tr style="border-bottom:hidden;"><td style="border-bottom:hidden; border-right:hidden;"  ></td>
<td align="right" style="border-bottom:hidden; border-right:hidden;">
<input type="button" class="btn btn-primary" value="뒤로가기" onclick="history.back()" style="font-size: 30px"/> 
<button type="submit" class="btn btn-primary" style="font-size: 30px">수정하기</button></td></tr>
</table>
</form>

</body>
</html>
