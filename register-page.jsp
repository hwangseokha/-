<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%
try
{
    Class.forName("com.mysql.jdbc.Driver");
    Connection conn = null;
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db","gbgb","1234");
    
    if(request.getParameter("register_button")!=null)
    {
        String username,id,password;

        username=request.getParameter("register_username");
        id=request.getParameter("register_id");
        password=request.getParameter("register_password");

        PreparedStatement pstmt=null;

        pstmt = conn.prepareStatement("INSERT INTO daily(name, id, password) VALUES(?, ?, ?);");
        pstmt.setString(1,username);
        pstmt.setString(2,id);
        pstmt.setString(3,password);

        response.sendRedirect("login-page.html");

        pstmt.executeUpdate();

        conn.close();
    }
}
    catch(Exception e)
    {
        out.println(e);
    }
%>