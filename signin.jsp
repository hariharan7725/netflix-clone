<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<html>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");

        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hari", "root", "");
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM user_details WHERE user_id = ?")) {

            stmt.setString(1, email);

            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) { // User exists
                    String storedPassword = rs.getString("user_password");

                    if (storedPassword.equals(password)) { // Password is correct
                        // Set session attributes
                        session.setAttribute("user_name", rs.getString("user_name"));
                        session.setAttribute("user_id", rs.getString("user_id"));
                        session.setAttribute("user_category", rs.getString("user_category"));

                        response.sendRedirect("movie.html");
                    } else {

                        out.println("<p class='error'>Invalid password.</p>");
                    }
                } else {
                    out.println("<p class='error'>User not found.</p>");
                }
            }
        }
    } catch (Exception e) {
        out.println("<p class='error'>Error: " + e.getMessage() + "</p>");
    }
%>
</html>