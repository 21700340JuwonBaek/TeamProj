<%@page import="com.project.common.FileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.project.dao.postDAO"%>
<%@page import="com.project.bean.postVO"%>

<% request.setCharacterEncoding("utf-8"); %>


<%
	
	postDAO postDao = new postDAO();
	FileUpload upload = new FileUpload();
	postVO u = upload.uploadPhoto(request);
	int i=postDao.updatePost(u);
	response.sendRedirect("view.jsp?sid="+u.getSid());
%>
