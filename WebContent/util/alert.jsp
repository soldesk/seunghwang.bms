<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>
<script>
	 function printAlert(message){
		console.log(message);
		alert(message); 
		window.location.reload(true);
	}
	 
</script>


<%
	System.out.println("인클루드 포함 됌");
	System.out.println((String)request.getAttribute("alertMessage"));
	if(request.getAttribute("alertMessage")!=null) {
		String message = (String)request.getAttribute("alertMessage");
		System.out.println("이프문 통과함");

	%>
			<script>
			
			alert("<%=message%>");
			
			</script>
	<%
	}
	
	request.setAttribute("alertMessage",null);
	  request.setAttribute("reload",null);
%>