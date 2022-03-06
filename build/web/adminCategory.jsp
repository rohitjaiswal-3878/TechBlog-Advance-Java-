<%@page import="com.tech.blog.dao.userDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    postDao post = new postDao(ConnectionProvider.getConnection());
    ArrayList<Category> list = post.getAllCategories();
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        Message m = new Message("Please login to access!", "error", "alert-danger");
        session.setAttribute("Msg", m);
        response.sendRedirect("loginpage.jsp");
        return;
    } else {
        if (user.getTypel().equals("user")) {
            Message m = new Message("You dont have access to this page!", "error", "alert-danger");
            session.setAttribute("Msg", m);
            response.sendRedirect("loginpage.jsp");
            return;
        }
    }


%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Categories</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 91%, 75% 100%, 33% 93%, 0 100%, 0 0);
            }
            .admin .card{
                border: 1px solid #2196f3;
            }
            .admin .card:hover{
                background: #e2e2e2;
                cursor: pointer;
            }
            body{
                background: url(img/admin.png);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!--navbar start-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"> <span class="fa fa-automobile"></span> Home <span class="sr-only">(current)</span></a>
                    </li>


                    <li class="nav-item">
                        <a class="nav-link" href="contact_page.jsp"><span class="fa fa-address-book-o"></span> contact</a>
                    </li>


                </ul>
                <ul class="navbar-nav mr-right">
                    <li class="nav-item">
                        <a class="nav-link" href="#!" data-toggle="modal" data-target="#exampleModal"><span class="fa fa-user-circle"></span> <%=  user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span> Logout</a>
                    </li>
                </ul>

            </div>
        </nav>
        <!--navbar end-->
        
        <!--main body-->
        <div class="container mt-2">
            <%
                Message m = (Message) session.getAttribute("Msg");
                if (m != null) {
            %>
            <div class="alert <%= m.getCssClass()%>" role="alert">
                <%=  m.getContent()%>
            </div>
            <%
                    session.removeAttribute("Msg");
                }


            %>
            <table class="table text-white">
                <thead>
                    <tr>
                        <th scope="col">catId</th>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Operation</th>
                        
                    </tr>
                </thead>
                <tbody>
                    <%      int i=1;              

                        for (Category  c : list) {


                    %>
                    <tr>
                        <th scope="row"><%= i++ %></th>
                        <td><%= c.getName() %></td>
                        <td><%= c.getDescription()   %></td>
                        
                        <td><form action="DeleteCatServlet" method="post">
                                <input type="hidden" name="cid" value="<%= c.getCid() %>" />
                                <button class="btn btn-outline-light">delete</button>
                            </form>
                        </td>
                    </tr>
                    <% }%>

                </tbody>
            </table>
        </div>
        <!--end of main body-->


        <!--js-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        
        
        
    </body>
</html>
