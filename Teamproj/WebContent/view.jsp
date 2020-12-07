<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <%@page import="com.project.dao.postDAO, com.project.bean.postVO,java.util.*"%>
 
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
 integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Caveat&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<meta charset="UTF-8">
<title>View</title>
</head>
<style>
body{
font-family: 'Caveat', 'Nanum Pen Script',cursive;
font-size:30px;
}

th{
text-align: center;
background-color:#353b3d;
color:white;
padding-right: 10px;

}


</style>
<body>

<%   
	postDAO postDao = new postDAO();
	String sid=request.getParameter("sid");	
	postVO u=postDao.getPost(Integer.parseInt(sid));
	request.setAttribute("vo", u);
%>

<h1>View</h1>
<table class="table-bordered" >

<tr><th>Title</th><td>${vo.getTitle()}</td></tr>
<tr><th>Writer</th><td>${vo.getWriter()}</td></tr>
<tr><th>Photo</th><td><c:if test="${vo.getPhoto() ne '' }"><br/>
<img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}"/></c:if></td></tr>
<tr><th>Detail</th><td><%=u.getDetail()%> </td></tr>
<c:out value="${u.getSid() }"></c:out>
<!-- 입력되어있는 값들을 보여주기 위해서 value에 u객체가 가지고 있는 값들을 출력해줍니다. -->
<tr style="border-bottom:hidden;"><td style="border-bottom:hidden; border-right:hidden;"  ></td>
<td align="right" style="border-bottom :hidden; border-right:hidden;">
<input type="button" class="btn btn-primary" value="뒤로가기" onclick="history.back()" style="font-size: 30px"/> 
<button type="button" class="btn btn-primary" onclick="location.href='editform.jsp?sid=<%=u.getSid()%>' " style="font-size: 30px">수정하기</button></td></tr>



</table>



</body>
</html>
