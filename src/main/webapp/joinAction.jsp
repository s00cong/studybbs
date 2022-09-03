<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<!-- 건너오는 모든 data를 utf8로 받음 -->
<jsp:useBean id="user" class="user.User" scope="page"/> <!-- 아래의 정보를  다 입력 받아서 만들어진 user라는 인스턴스 -->

<jsp:setProperty name="user" property="userID"/>
<!-- login페이지에서 넘겨준 userID를 받아서 한명의 사용자의 userID에 넣어주는것  -->
<jsp:setProperty name="user" property="userPassword"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userGender"/>
<jsp:setProperty name="user" property="userEmail"/>

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
	if(user.getUserID()==null || user.getUserPassword() == null ||
	 user.getUserName()==null || user.getUserGender()==null || 
	 user.getUserEmail()==null ){
	 	PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('There's NULL value!')");
		script.println("history.back()");
		script.println("</script>");
 
	}else{
		
		UserDAO userDAO = new UserDAO(); //DB에 접근할 수 있는 객체 만들어줌
		int result = userDAO.join(user); //젤 위에 user라는 인스턴스가 join함수로 들어감. 
		
		if(result == -1 ){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href = 'main.jsp'");
			script.println("</script>");
		}
		
	}
	
		
		
	%>
</body>
</html>
<!-- 
	회원가입 가능하게 할거임
	그러긴 위해선 DAOclass에서 하나의 함수를 하나 더 추가해 줄거임.
	DAO는 db접근하는 것이긴 때문.
 -->