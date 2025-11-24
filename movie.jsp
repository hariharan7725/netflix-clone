<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
<%
    if (session == null || session.getAttribute("user_id") == null) {
        response.sendRedirect("signin.html");
    }
    String moviename = request.getParameter("movie");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hari", "root", "");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM netflix_data WHERE movie_name = ?")) {

            stmt.setString(1, moviename);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) { // Movie exists
                    String type =rs.getString("movie_category");

                    String userid = (String) session.getAttribute("user_category");
                    //out.print(type);
                    if(type.equals("basic") && userid.equals("basic") )
                    { 
                        request.setAttribute("moviepath", moviename);
                        RequestDispatcher rd = request.getRequestDispatcher("play.jsp");
                        rd.forward(request, response);
                        response.sendRedirect("play.jsp");
                    }
                    else if((type.equals("standard") || type.equals("basic") ) && userid.equals("standard") )
                    { 
                        request.setAttribute("moviepath", moviename);
                        RequestDispatcher rd = request.getRequestDispatcher("play.jsp");
                        rd.forward(request, response);
                        response.sendRedirect("play.jsp");
                    }
                    else if(userid.equals("premium") )
                    { 
                        request.setAttribute("moviepath", moviename);
                        RequestDispatcher rd = request.getRequestDispatcher("play.jsp");
                        rd.forward(request, response);
                        response.sendRedirect("play.jsp");
                    }
                    else{
                        out.println("<script>alert('You are not have a valid Subscription plan ... '); window.location='movie.html';</script>");}
                    }
                else {
                    out.println("<script>alert('This movie doesnt exist now ... '); window.location='movie.html';</script>");
                }
            }
            catch (Exception e) {
                out.println("Error: " + e.getMessage());
            }
        }
    } catch (Exception e) {
        out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
    }
%>
</html>