<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Index</title>
</head>
<body>
<%

	String username = (String)session.getAttribute("username");
	if(username==null){%>
	<center>
    <h1>hike</h1>
 	<input type="button" value="Login" onClick="window.location.href='Login.jsp'">
 	<input type="button" value="Sign up" onClick="window.location.href='SignUp.jsp'">
    <input type="button" value="List" onClick="window.location.href='List.jsp'">
    <input type="button" value="quit" onClick="window.location.href='quit.jsp'">
    </center>
      <%}else{%>
		<center>
		<h1>Hello <%=username%></h1>
		<input type="button" value="Sign up" onClick="window.location.href='SignUp.jsp'">
    	<input type="button" value="List" onClick="window.location.href='List.jsp'">
    	<input type="button" value="quit" onClick="window.location.href='quit.jsp'">
    	</center>
<%   	  
} 
%> 										
</body>
</html>