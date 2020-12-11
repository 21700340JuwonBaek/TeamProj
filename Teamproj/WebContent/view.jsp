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
	font-size: 30px;
	padding: 20px;
	width: 900px;
	text-align: center;
}

th{
	text-align: center;
	background-color:#2E64FE;
	color:white;
	padding-right: 8px;

}
#writer{
float: right;
margin-right : 100px;
}

img{
width : 200px;
height : 200px;
}

button{
float : right;
font-size : 15px;
}

#remove{
margin-right : 0px;
}

#title{
height : 100px;
background-color: #A9D0F5;
color: white;
line-height:100px;
}

#content{
position: relative;
left : 300px;
margin-right:0px;
height : 200px;
width: 200px;
}

</style>
<body>

<%   
	postDAO postDao = new postDAO();
	String sid=request.getParameter("sid");	
	postVO u=postDao.getPost(Integer.parseInt(sid));
	request.setAttribute("vo", u);
%>


<h1 id='title'>저의 블로그에 오신 것을 환영합니다!!</h1>
<br>



<h1>
${vo.getTitle()}</h1>
<p style="float:right">작성자 : ${vo.getWriter()}</p><br><br>

<button type="button" class="btn btn-danger" id = 'remove' onclick="location.href='delete_ok.jsp?sid=${vo.getSid() }'">삭제하기</button>
<button type="button"class="btn btn-warning" id = 'edit' onclick="location.href='editform.jsp?sid=${vo.getSid() }'">수정하기</button>

<button type="button" class="btn btn-primary" id = 'back' onclick="location.href='index.jsp'">뒤로가기</button>
<br>
<div class="card" id='content'>
<c:if test="${vo.getPhoto() ne '' }"><br/>
  <img src="${pageContext.request.contextPath }/upload/${vo.getPhoto()}" class="card-img-top" alt="..."></c:if><br>
  </div>
  <br/><br/><br/>
    <p ><%=u.getDetail()%></p>






</body>
</html>
