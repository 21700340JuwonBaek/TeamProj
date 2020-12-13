<%@page import="com.project.common.FileUpload"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.project.dao.postDAO, com.project.bean.postVO"%>
<%
	String sid = request.getParameter("sid");
	if (sid != ""){  
		int id = Integer.parseInt(sid);
		postVO u = new postVO();
		u.setSid(id);
		postDAO postDao = new postDAO();
		String filename = postDao.getPhotoFilename(Integer.parseInt(sid));
		
		if(filename != null) 
			FileUpload.deleteFile(request, filename);
		
		postDao.deletePost(u);
	}
	response.sendRedirect("index.jsp");
%>

