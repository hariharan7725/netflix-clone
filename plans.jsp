<%@ page import="java.sql.*, javax.servlet.*, javax.servlet.http.*" %>
<%
    if (session == null || session.getAttribute("user_id") == null) {
        response.sendRedirect("signin.html");
        return;
    }

    String userId = session.getAttribute("user_id").toString();
    String newPlan = request.getParameter("userplan");

    Connection con = null;
    PreparedStatement psCheck = null;
    PreparedStatement psUpdate = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/hari", "root", "");

        //Check current plan
        psCheck = con.prepareStatement("SELECT user_category FROM user_details WHERE user_id = ?");
        psCheck.setString(1, userId);
        rs = psCheck.executeQuery();

        if (rs.next()) {
            String currentPlan = rs.getString("user_category");

                psUpdate = con.prepareStatement("UPDATE user_details SET user_category = ? WHERE user_id = ?");
                psUpdate.setString(1, newPlan);
                psUpdate.setString(2, userId);
                int updated = psUpdate.executeUpdate();
                response.sendRedirect("movie.html");
                session.setAttribute("user_category", newPlan);
            }
        }

    catch (Exception e){
        e.printStackTrace();
    }
%>