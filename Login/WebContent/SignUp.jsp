<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Register.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <center>  
    Sign Up<br>  
 	<form action = "SignUpSuccess.jsp" method="post">
 	<TABLE BORDER="1">
 	<TR>
 		<TD>Name</TD>
 		<TD><input type = "text" name = "name"></TD>
 	</TR>
 	<TR>
 		<TD>email:</TD>
 		<TD><input type = "text" name = "email"></TD>
 	</TR>
 	<TR>
 		<TD>Password:</TD>
 		<TD><input type = "password" name = "password"></TD>
 	</TR>
 	</TABLE>
 	<TR>
 		<TD><input type="submit" value="submit"></TD>
 	</TR>
 	</form>
 	<% String flagR = request.getParameter("flagR");
 	if(flagR!=null)
   		if(flagR.equals("Exist")) {
   out.println("Sorry, the username has already existed.");
}%>
    </center> 
  </body>
</html>
