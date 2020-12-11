  <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="com.project.dao.postDAO, com.project.bean.postVO,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>뿌링뿌링</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
	  background-color: #A9D0F5;
    }
    
    /* Add a gray background color and some padding to the footer */
    footer {
      background-color: green;
      padding: 25px;
    }
    
    .navbar-inverse{
    	background-color: #A9D0F5;
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
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">Blog</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active" style="background-color: #819FF7"><a href="#">Food</a></li>
        <li><a href="#">Movie</a></li>
        <li><a href="#">Travel</a></li>
        <li><a href="#">Shopping</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="addform.jsp"> 포스트 작성</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron">
  <div class="container text-center">
    <h1>Our Blog</h1>      
    <p>자유롭게 포스트를 작성해주세요:)</p>
  </div>
</div>
  <c:forEach items="${list}" var="u"> 
    <div class="col-sm-3">
      <h1><a href="view.jsp?sid=${u.getSid()}">${u.getTitle() }</a></h1>
      <img src="${pageContext.request.contextPath }/upload/${u.getPhoto()}" class="img-responsive" style="width:200px; height:200px" alt="Image">
    </div>
</c:forEach>


</body>
</html>
