<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>LoginSuccess</title>
    
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
 <%!
	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL = "jdbc:mysql://127.0.0.1:3306/levy";
	public static final String DBUSER = "root";
	public static final String DBPASS = "93910";
%>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
<%
	String nameForm = request.getParameter("name");
	String emailForm = request.getParameter("email");
	String passwordForm = request.getParameter("password");
	
	MessageDigest md = MessageDigest.getInstance("MD5"); 
	md.update(passwordForm.getBytes());
	byte b[] = md.digest();
    int i;
    StringBuffer buf = new StringBuffer("");
    for (int offset = 0; offset < b.length; offset++) {
         i = b[offset];
         if (i < 0)
             i += 256;
         if (i < 16)
             buf.append("0");
         buf.append(Integer.toHexString(i));
    }
	passwordForm = buf.toString();
	
try{
	Class.forName(DBDRIVER);
	conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
	System.out.println("connected");
	String sql = "select password,username from auth_user where email="+'"'+emailForm+'"';
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	System.out.println("query");
	if(!rs.next()){
		out.println("Sorry, the email doesn't exist");%>
		<jsp:forward page="Login.jsp">
		<jsp:param name="flag" value="notExist"/>
		</jsp:forward>
	<%} %>	 

<center>
<%
	rs = pstmt.executeQuery();
	while(rs.next()){
		String password = rs.getString(1);
		String name = rs.getString(2);
	if(password.equals(passwordForm)){
%>
	<tr>
		<td>This is <%=password%></td>
	</tr>
	Login Successful
	<%session.setAttribute("username",name); %>
	<jsp:forward page="index.jsp">
	<jsp:param name="username" value="zhang"/>
	</jsp:forward>
<% 
	}else{
%>
	
	<jsp:forward page="Login.jsp">
	<jsp:param name="flag" value="wrong"/>
	</jsp:forward>
<%}
	}
%>
</center>

<%
}catch(Exception e){
	System.out.println(e);
}finally{
	/* rs.close();
	pstmt.close();
	conn.close(); */
}
%>
  </body>
</html>
