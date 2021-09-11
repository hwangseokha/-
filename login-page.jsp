<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>

<%

Connection conn = null;
PreparedStatement pstmt=null;

try
{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db","gbgb","1234");

    if(request.getParameter("button_login")!=null)
    {
        String dbid,dbpassword;
        String id,password;

        id=request.getParameter("login-id");
        password=request.getParameter("login-password");

        pstmt = conn.prepareStatement("SELECT * FROM daliy WHERE id=? AND password=?");
        pstmt.setString(1,id);
        pstmt.setString(2,password);
        
        ResultSet rs=pstmt.executeQuery();

        if(rs.next())
        {
            dbid=rs.getString("id");
            dbpassword=rs.getString("password");

            if(id.equals(dbid) && password.equals(dbpassword)) {
                session.setAttribute("daily",dbid);
                response.sendRedirect("/main-page.html");
            }
        }
        else
        {
            response.sendRedirect("/login-page.html");
        }
        conn.close();
    }
}
catch(Exception e)
{
    out.println(e);
}
%>