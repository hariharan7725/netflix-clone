<%
    String path = (String) request.getAttribute("moviepath");
    String fullpath = "movie/" + path + ".mp4";
    //out.print(fullpath);
%>
<video width="100%" height="120%" controls autoplay>
    <source src="<%= fullpath %>" type="video/MP4">
</video>