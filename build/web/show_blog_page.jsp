<%@page import="com.tech.blog.dao.likeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.tech.blog.dao.userDao"%>
<%@page import="com.tech.blog.dao.userDao"%>
<%@page import="com.tech.blog.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser");

    if (user == null) {
        response.sendRedirect("loginpage.jsp");
    }
%>
<%
    int postId = Integer.parseInt(request.getParameter("post_id"));
    postDao dao = new postDao(ConnectionProvider.getConnection());
    Post p = dao.getPostByPostId(postId);


%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitile()%></title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 91%, 75% 100%, 33% 93%, 0 100%, 0 0);
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight:100;
                font-size: 22px;
            }
            .post-date{
                font-style: italic;
                
            }
            .post-info{
                font-size: 20px
            }
            body{
                background: url(img/bg1.jpg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent";>
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="profile.jsp"> <span class="fa fa-automobile"></span> Home <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> catergories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">programming languages</a>
                            <a class="dropdown-item" href="#">project implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data structure</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book-o"></span> contact</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span> Do post</a>
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

        <!--main content of body-->
        <div class="container">
            <div class="row mt-3">
                <div class="col-md-8 offset-2">
                    <div class="card">
                        <div class="card-header primary-background text-white">
                            <h4 class="post-title"><%=  p.getpTitile()%></h4>
                        </div>
                        <div class="card-body">
                            <img class="card-img my-2" src="blog_pics/<%= p.getpPic()%>" alt="Card image cap">
                            <div class="row my-2">
                                <div class="col-md-8">
                                    <% userDao ud= new userDao(ConnectionProvider.getConnection()); %>
                                    <p class="post-info"><a href="#"><%= ud.getUserByUserId(p.getUserId()).getName()  %></a> has posted :</p>
                                </div>
                                <div class="col-md-4">
                                    <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate()) %></p>
                                </div>
                            </div>
                            <p class="post-content"><%= p.getpContent()%></p>
                            <br>
                            <br>
                            <div class="post-code">
                            <pre><%= p.getpCode()%></pre>
                            </div>

                        </div>
                        <div class="card-footer primary-background">
                            
                            <% likeDao ld = new likeDao(ConnectionProvider.getConnection()); %>
                            <a href="#!" onclick="doLike(<%= p.getPid() %>,<%= user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="like-counter"> <%= ld.countLikeOnPost(p.getPid()) %></span></a>



                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--end of main content-->





        <!--profile modal-->

        <!-- Button trigger modal -->


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img  src="pics/<%= user.getProfile()%>"  class="img-fluid" style="border-radius:50%;max-width:150px;max-height:150px"/>
                            <br>
                            <h5 class="modal-title mt-3 mb-3" id="exampleModalLabel"><%= user.getName()%></h5>
                            <!--details-->
                            <div id="profile-details">
                                <table class="table">

                                    <tbody>
                                        <tr>
                                            <th scope="row">ID : </th>
                                            <td><%= user.getId()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td><%= user.getEmail()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td><%= user.getGender()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Status : </th>
                                            <td><%= user.getAbout()%></td>

                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on : </th>
                                            <td><%= user.getDatetime().toString()%></td>

                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--profile edit-->
                            <div id="profile-edit" style="display:none">
                                <h3>Please edit carefully</h1>
                                    <form action="EditServlet" method="post" enctype="multipart/form-data">
                                        <table class="table">
                                            <tr>
                                                <td>ID : </td>
                                                <td><%= user.getId()%></td>
                                            </tr>
                                            <tr>
                                                <td>Name : </td>
                                                <td><input type="text" name="user_name" class="form-control" value="<%= user.getName()%>"></td>
                                            </tr>
                                            <tr>
                                                <td>Email : </td>
                                                <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>"></td>
                                            </tr>
                                            <tr>
                                                <td>Password : </td>
                                                <td><input type="password" name="user_password" class="form-control" value="<%= user.getPassword()%>"></td>
                                            </tr>
                                            <tr>
                                                <td>Gender : </td>
                                                <td><%= user.getGender().toUpperCase()%></td>
                                            </tr>
                                            <tr>
                                                <td>About : </td>
                                                <td>
                                                    <textarea name="user_about" rows="3" class="form-control"><%= user.getAbout()%></textarea>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>New profile: </td>
                                                <td>
                                                    <input type="file" class="form-control" name="image" ">
                                                </td>
                                            </tr>

                                        </table>
                                        <div class="container">
                                            <button type="submit" class="btn btn-outline-primary" >Save</button>
                                        </div>
                                    </form>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--end of profile modal-->

        <!--start post modal-->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide post details..</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Categories---</option>
                                    <%
                                        postDao post = new postDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> list = post.getAllCategories();
                                        for (Category c : list) {
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
        <!--end of post modal-->











        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                let editStatus = false;
                $('#edit-profile-button').click(function () {
                    if (editStatus == false) {
                        $("#profile-details").hide();
                        $("#profile-edit").show();
                        editStatus = true;
                        $(this).text("Back")
                    } else {
                        $("#profile-details").show();
                        $("#profile-edit").hide();
                        editStatus = false;
                        $(this).text("Edit")

                    }
                })
            })
        </script>
        <!--now add post js-->
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
