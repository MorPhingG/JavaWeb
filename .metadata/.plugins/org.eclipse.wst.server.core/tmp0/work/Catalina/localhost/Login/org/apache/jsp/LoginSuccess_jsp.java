/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.69
 * Generated at: 2016-04-24 23:56:04 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import java.sql.*;
import java.security.MessageDigest;

public final class LoginSuccess_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


	public static final String DBDRIVER = "com.mysql.jdbc.Driver";
	public static final String DBURL = "jdbc:mysql://127.0.0.1:3306/levy";
	public static final String DBUSER = "root";
	public static final String DBPASS = "93910";

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("<html>\r\n");
      out.write("  <head>\r\n");
      out.write("    <base href=\"");
      out.print(basePath);
      out.write("\">\r\n");
      out.write("    \r\n");
      out.write("    <title>LoginSuccess</title>\r\n");
      out.write("    \r\n");
      out.write("\t<meta http-equiv=\"pragma\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"cache-control\" content=\"no-cache\">\r\n");
      out.write("\t<meta http-equiv=\"expires\" content=\"0\">    \r\n");
      out.write("\t<meta http-equiv=\"keywords\" content=\"keyword1,keyword2,keyword3\">\r\n");
      out.write("\t<meta http-equiv=\"description\" content=\"This is my page\">\r\n");
      out.write("\t<!--\r\n");
      out.write("\t<link rel=\"stylesheet\" type=\"text/css\" href=\"styles.css\">\r\n");
      out.write("\t-->\r\n");
      out.write("\r\n");
      out.write("  </head>\r\n");
      out.write("  <body>\r\n");
      out.write(" ");
      out.write('\r');
      out.write('\n');

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

      out.write('\r');
      out.write('\n');

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
		out.println("Sorry, the email doesn't exist");
      out.write("\r\n");
      out.write("\t\t");
      if (true) {
        _jspx_page_context.forward("Login.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("flag", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("notExist", request.getCharacterEncoding()));
        return;
      }
      out.write('\r');
      out.write('\n');
      out.write('	');
} 
      out.write("\t \r\n");
      out.write("\r\n");
      out.write("<center>\r\n");

	rs = pstmt.executeQuery();
	while(rs.next()){
		String password = rs.getString(1);
		String name = rs.getString(2);
	if(password.equals(passwordForm)){

      out.write("\r\n");
      out.write("\t<tr>\r\n");
      out.write("\t\t<td>This is ");
      out.print(password);
      out.write("</td>\r\n");
      out.write("\t</tr>\r\n");
      out.write("\tLogin Successful\r\n");
      out.write("\t");
session.setAttribute("username",name); 
      out.write('\r');
      out.write('\n');
      out.write('	');
      if (true) {
        _jspx_page_context.forward("index.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("username", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("zhang", request.getCharacterEncoding()));
        return;
      }
      out.write('\r');
      out.write('\n');
 
	}else{

      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t");
      if (true) {
        _jspx_page_context.forward("Login.jsp" + "?" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("flag", request.getCharacterEncoding())+ "=" + org.apache.jasper.runtime.JspRuntimeLibrary.URLEncode("wrong", request.getCharacterEncoding()));
        return;
      }
      out.write('\r');
      out.write('\n');
}
	}

      out.write("\r\n");
      out.write("</center>\r\n");
      out.write("\r\n");

}catch(Exception e){
	System.out.println(e);
}finally{
	/* rs.close();
	pstmt.close();
	conn.close(); */
}

      out.write("\r\n");
      out.write("  </body>\r\n");
      out.write("</html>\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
