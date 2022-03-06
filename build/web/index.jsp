

<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.dao.postDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page errorPage="error_page.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <!--css-->

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 91%, 75% 100%, 33% 93%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>
        <!--navbar-->
        <%@include file="normal_navbar.jsp" %>

        <!--banner-->
        <div class="container-fluid m-0 p-0 banner-background">
            <div class="jumbotron primary-background text-white">
                <div class="container">
                    <h1 class="display-3"> Welcome to TechBlog</h1>
                    <p>A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming languages, to various kinds of machine code output. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.</p>
                    <a href="Registerpage.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-plus"></span> start ! its free</a>
                    <a href="loginpage.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o fa-spin"></span> Login</a>
                </div>
            </div>
        </div>

        <!--cards-->
        <div class="container">
            <div class="row mb-3">
                <%
                    postDao post = new postDao(ConnectionProvider.getConnection());
                    List<Post> l = post.getAllPosts();
                    int limit = 1;
                    for (Post p : l) {
                        if (limit <= 6) {

                %>

                <div class="col-md-4 mt-3">
                    <div class="card" >

                        <div class="card-body">
                            <h5 class="card-title" style="font-weight: 800"><%= p.getpTitile()%></h5>
                            <p class="card-text"  style="max-height: 100px;overflow: hidden;white-space: nowrap"><%= p.getpContent()%></p>
                            <a href="loginpage.jsp" class="btn primary-background text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <% }
                        limit++;
                    }
                %>


            </div>

        </div>

        <div class="container text-center my-4">
            <a href="loginpage.jsp" class="btn btn-outline-primary">Load more...</a>
        </div>


        <!--javascript-->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
