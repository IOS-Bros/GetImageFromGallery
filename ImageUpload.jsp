<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@page import="java.sql.*"%>

<%

	String savePath = "/Library/Tomcat/webapps/ROOT/ios";
	int sizeLimit = 10 * 1024 * 1024;

	MultipartRequest multi = new MultipartRequest(request, savePath, sizeLimit, "UTF-8");

	File file = multi.getFile("file");


	String name = multi.getParameter("name");

	// DB
	String url_mysql = "jdbc:mysql://localhost/test?serverTimezone=UTC&characterEncoding=utf8&useSSL=FALSE";
	String id_mysql = "root";
	String pw_mysql = "qwer1234";

	PreparedStatement ps = null;
	try{
	    Class.forName("com.mysql.cj.jdbc.Driver");
	    Connection conn_mysql = DriverManager.getConnection(url_mysql,id_mysql,pw_mysql);
	    Statement stmt_mysql = conn_mysql.createStatement();

	    String A = "INSERT INTO itest (name, msg) ";
	    String B = "VALUES(?, ?)";

	    ps = conn_mysql.prepareStatement(A+B);
	    ps.setString(1, file.getName());
	    ps.setString(2, name);

	    ps.executeUpdate();

	    conn_mysql.close();
	}

	catch (Exception e){
	    e.printStackTrace();
    }

%>
