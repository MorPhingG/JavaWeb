<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.security.MessageDigest" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Register</title>
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
	
	String sql1 = "select username from auth_user where username = "+'"'+nameForm+'"';         
	pstmt = conn.prepareStatement(sql1);
	rs = pstmt.executeQuery();
	if(rs.next()){
		%>
		<jsp:forward page="SignUp.jsp">
		<jsp:param name="flagR" value="Exist"/>
		</jsp:forward>
	<%} %>	 
	
	String sql = "insert into auth_user (username, email, password, last_login, data_joined) values (" + '"'+nameForm+'"'+"," + '"'+emailForm+'"'+"," + '"'+passwordForm+'"' +", now(),now())";         
	pstmt = conn.prepareStatement(sql);
	pstmt.executeUpdate();
	System.out.println("query");
%>
	Register Successful
	<jsp:forward page="index.jsp">
	<jsp:param name="flagR" value="success"/>
	</jsp:forward>
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