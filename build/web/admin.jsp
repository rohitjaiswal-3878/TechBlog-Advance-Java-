<%@page import="com.tech.blog.helper.Helper"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.postDao"%>
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
        <title>JSP Page</title>
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
        <div class="container admin mt-2">
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
            <div class="row mt-3">
                <div class="col-md-4">
                    <a href="adminUsers.jsp" style="text-decoration: none" >
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid" src="img/man.png" alt="users"/>
                            </div>
                            <h1><%= Helper.countUsers(ConnectionProvider.getConnection()) %></h1>
                            <h1  class="text-uppercase text-muted">users</h1>
                        </div>
                    </div>
                    </a>
                </div>
                <div class="col-md-4">
                    <a href="adminCategory.jsp" style="text-decoration: none" >
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid" src="img/options-lines.png" alt="users"/>
                            </div>
                            <h1><%= list.size() %></h1>
                            <h1 class="text-uppercase text-muted">Categories</h1>
                        </div>
                    </div>
                    </a>

                </div>
                <div class="col-md-4">
                    <a href="adminPost.jsp" style="text-decoration: none" >
                    <div class="card">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid" src="img/blog.png" alt="users"/>
                            </div>
                            <h1><%= Helper.countPosts(ConnectionProvider.getConnection()) %></h1>
                            <h1 class="text-uppercase text-muted">Blogs</h1>
                        </div>
                    </div>
                    </a>

                </div>
            </div>

            <!--second row-->
            <div class="row mt-4">
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-category-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid" src="img/more.png" alt="users"/>
                            </div>
                            <p class="mt-2">click here to add new categories</p>
                            <h1 class="text-uppercase text-muted">Add categories</h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card" data-toggle="modal" data-target="#add-post-modal">
                        <div class="card-body text-center">
                            <div class="container">
                                <img style="max-width: 100px" class="img-fluid" src="img/more.png" alt="users"/>
                            </div>
                            <p class="mt-2">click here to add new blogs.</p>
                            <h1 class="text-uppercase text-muted">Add Blogs</h1>
                        </div>
                    </div> 
                </div>
            </div>
        </div>
        <!--end of main body-->

        <!--category modal-->
        <div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content ">
                    <div class="modal-header primary-background">
                        <h5 class="modal-title text-white" id="exampleModalLabel">Fill category details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="AddCategoryServlet" method="post">
                            <div class="form-group">
                                <input type="text" name="catTitle" placeholder="Enter category" class="form-control" />
                            </div>
                            <div class="form-group">
                                <textarea name="catDescription" placeholder="Description" class="form-control" style="height: 200px"></textarea>
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-primary">Add</button>
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end of category modal-->

        <!--Blog modal-->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background">
                        <h5 class="modal-title text-white" id="exampleModalLabel">Provide post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Categories---</option>
                                    <%                                        for (Category c : list) {
                                    %>
                                    <option value="<%= c.getCid()%>"><%= c.getName()%></option>
                                    <% }%>

                                </select>
                            </div>
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter your title" class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Enter your content" style="height: 200px"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="Enter your code (if any)" style="height: 200px"></textarea>
                            </div>
                            <div class="form-group">
                                <label>Select your pic..</label><br>
                                <input type="file" name="pic">
                            </div>
                            <div class="container text-center">
                                <button class="btn btn-outline-primary" type="submit">Post</button>
                            </div>

                        </form>

                    </div>

                </div>
            </div>
        </div>
        <!--end of blog modal-->


        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $("#add-post-form").on("submit", function (event) {
                    //this code gets called when form is submitted
                    event.preventDefault();
                    console.log("you have clicked on the submit button...");
                    let form = new FormData(this);

                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            //success.....
                            if (data.trim() == 'done') {
                                swal("Good job!", "data saved successfully...", "success");
                            } else {
                                swal("Sorry!", "Something went wrong!", "error");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            //error....
                            swal("Sorry!", "Something went wrong!", "error");
                        },
                        processData: false,
                        contentType: false
                    })

                })
            })





        </script>
    </body>
</html>
