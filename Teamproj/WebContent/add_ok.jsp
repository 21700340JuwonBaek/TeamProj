<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.project.dao.postDAO"%>
<%@page import="com.project.bean.postVO"%>
<%@page import="com.project.common.FileUpload"%>

<!-- MemberDAO를  import-->
<% request.setCharacterEncoding("utf-8"); %>
<!-- 문자열 인코딩을 UTF-8로 함. -->



<%
	postDAO postDao= new postDAO();
	FileUpload upload = new FileUpload();
	postVO u = upload.uploadPhoto(request);
	int i = postDao.insertPost(u);
	String msg = "데이터 추가 성공 !";
	if(i == 0) msg = "[에러] 데이터 삭제 ";
%>

<script>
	alert('<%=msg%>');
	location.href='list.jsp';
</script>
