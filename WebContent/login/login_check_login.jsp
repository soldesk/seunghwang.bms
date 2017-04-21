<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import ="javax.servlet.http.*,seunghwang.bms.login.domain.User" %>



	<% 
			HttpSession sess = request.getSession(false);
	 		if (sess == null || sess.getAttribute("authUser") == null){ %><!--로그인 안됐을 시 -->
	 			<script>
	 				alert("로그인해주세요");
	 				location.href="/seunghwang.bms/index.jsp";
	 			</script>
	 			
	 	<% } else if(sess.getAttribute("authUser").getClass().getSimpleName().equals("Admin")){ %> <!--관리자로 로그인시에-->
			

	 	<%} else if(sess.getAttribute("authUser")!=null) { 		%> <!--사용자로 로그인시ㅔ -->
	 	
	 	
	 	
		<% } %>

