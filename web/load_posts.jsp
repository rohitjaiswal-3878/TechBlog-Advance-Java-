<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<div class="row ">
    <%
        User user = (User)session.getAttribute("currentUser");
        Thread.sleep(1000);
        postDao post = new postDao(ConnectionProvider.getConnection());
        int catId = Integer.parseInt(request.getParameter("cid"));
        List<Post> l = null;
        if (catId == 0) {
            l = post.getAllPosts();
        } else {
            l = post.getPostById(catId);
        }
        if (l.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No post in this category.</h3>");
            return;
        }

        for (Post p : l) {
    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            <img class="card-img-top" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
            <div class="card-body" style="max-height: 110px;overflow: hidden;text-overflow: ellipsis; ">
                <b> <%= p.getpTitile()%></b>
                <p> <%= p.getpContent()%></p>
            </div>
            <div class="card-footer primary-background text-center">
                
                <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-sm">Read more...</a>
                



            </div>
        </div>
    </div>



    <%
        }


    %>
</div>