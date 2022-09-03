<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<!-- 건너오는 모든 data를 utf8로 받음 -->
<jsp:useBean id="user" class="user.User" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<!-- login페이지에서 넘겨준 userID를 받아서 한명의 사용자의 userID에 넣어주는것  -->
<jsp:setProperty name="user" property="userPassword"/>

<!-- 
	한명의 회원 정보를 담는 user라는 class를 beans로 사용 
	
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSP 게시판 웹 사이트</title>
</head>
<body>
	<%
		UserDAO userDAO = new UserDAO();
		int result = userDAO.login(user.getUserID(),user.getUserPassword());
		
		if(result == 1 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'"); //내가 하고싶은거 : 로그인 시 계정 정보 다르게 하기, 회원가입 시 회원가입 환영 페이지로 넘어가기.
			script.println("</script>");
		}
		else if(result == 0 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('wrong password!')");
			script.println("history.back()");
			script.println("</script>");
		}
		else if(result == -1 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('wrong ID!')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('error DB!')");
			script.println("history.back()");
			script.println("</script>");
		}
	%>
</body>
</html>
<!-- 
	실질적으로 사용자 로그인을 실행하는 페이지
	
	userDAO를 이용해서 로그인 작업을 처리함.
	
 -->