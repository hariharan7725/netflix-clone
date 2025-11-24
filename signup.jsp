<html>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    try{
        String name=request.getParameter("name");
        String email=request.getParameter("email");    
        String password=request.getParameter("password1");
        String plan="basic";
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hari", "root", "");
        PreparedStatement ps = con.prepareStatement("INSERT INTO user_details (user_name ,user_id ,user_password ,user_category) VALUES (?, ?, ?, ?)");
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, password);
        ps.setString(4, plan);
        
        ps.executeUpdate();
        session.setAttribute("user_name", name);
        session.setAttribute("user_id", email);
        session.setAttribute("user_category", plan);

        out.println("<p class='success'>User registered successfully!</p>");

        //ps.close();
    } 
    catch(Exception e) {out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
}
response.sendRedirect("movie.html");

%>
</html>