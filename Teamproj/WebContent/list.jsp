<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.project.dao.postDAO, com.project.bean.postVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" 
 integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Caveat&family=Nanum+Pen+Script&display=swap" rel="stylesheet">
<title>free board</title>
<style>
body{
font-family: 'Caveat', 'Nanum Pen Script',cursive;
font-size:30px;
}
th, td{
text-align : center;
}


</style>
<script>
	function delete_ok(id){
		var a = confirm("정말로 삭제하겠습니까?");
		if(a) location.href='delete_ok.jsp?id=' + id; 
	}
</script>
</head>
<body>
<%
	postDAO postDao = new postDAO();
	List<postVO> list = postDao.getPostList();
	request.setAttribute("list",list); 

%>
<table class="table table-bordered table-hover" width="90%">
<thead class="thead-dark">
<tr id="first">
	<th>Category</th>
	<th>Title</th>
	<th>Writer</th>
	<th>View</th>
	<th>Edit</th>
	<th>Delete</th>

</tr>
</thead>
<c:forEach items="${list}" var="u"> 
	<tr>
	
		<td>${u.getCategory()}</td>
		<td>${u.getTitle()}</td>
		<td>${u.getWriter()}</td>
		<td><a href="view.jsp?sid=${u.getSid()}">View</a></td>
		<td><a href="editform.jsp?sid=${u.getSid()}">Edit</a></td>
		<td><a href="javascript:delete_ok('${u.getSid()}')">Delete</a></td>
		
	</tr>
</c:forEach>
</table>
<a href="addform.jsp">Add New Post</a>
</body>
</html>
