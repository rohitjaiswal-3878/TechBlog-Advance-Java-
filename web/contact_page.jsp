

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact</title>
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
        <!--navbar start-->
        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span> TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"> <span class="fa fa-automobile"></span> Home <span class="sr-only">(current)</span></a>
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
                        <a class="nav-link" href="loginpage.jsp"><span class="fa fa-user-circle-o"></span> Login</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Registerpage.jsp"><span class="fa fa-user-plus"></span> Register</a>
                    </li>

                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>

        <!--navbar end-->
        <main class="d-flex align-items-center primary-background banner-background" style="height:75vh">
            <div class="container">
                <div class="row mt-4">
                    <div class="col-md-4 " >
                        <div class="card" style="width: 18rem;box-shadow: 1px 1px 20px black">
                            <img class="card-img-top" src="img/1.jpg" alt="Card image cap" >
                            <div class="card-body">
                                <h4 class="card-title" style="font-weight: 700">Founder</h4>
                               

                                <div class="card-body text-center">
                                    <p class="card-text" style="color: #2196f3"><span class="fa fa-phone fa-2x"> 8898XXXX</span> </p>
                                    <p class="card-text" style="color: #25d366"><span class="fa fa-whatsapp fa-2x"> Whatsapp</span> </p>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card" style="width: 18rem;box-shadow: 1px 1px 20px black">
                            <img class="card-img-top" src="img/2.webp" alt="Card image cap">
                            <div class="card-body">
                                <h4 class="card-title" style="font-weight: 700">Co-founder</h4>
                                
                                <div class="card-body text-center">
                                     <p class="card-text" style="color: #2196f3"><span class="fa fa-phone fa-2x"> 8898XXXX</span></p>
                                    <p class="card-text" style="color: #25d366"><span class="fa fa-whatsapp fa-2x"> Whatsapp</span></p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card" style="width: 18rem;box-shadow: 1px 1px 20px black">
                            <img class="card-img-top" src="img/3.jpg" alt="Card image cap">
                            <div class="card-body">
                                <h4 class="card-title" style="font-weight: 700">CEO</h4>
                                

                                <div class="card-body text-center">
                                     <p class="card-text" style="color: #2196f3"><span class="fa fa-phone fa-2x"> 8898XXXX</span></p>
                                    <p class="card-text" style="color: #25d366"><span class="fa fa-whatsapp fa-2x"> Whatsapp</span></p>
                                </div>

                            </div>
                        </div>
                    </div>

                </div>


            </div>
        </main>
        <div class="container text-center mt-4">
            <a href="index.jsp" class="btn btn-outline-primary  btn-lg">Go Back</a>
        </div>



        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="js/myjs.js" type="text/javascript"></script>
    </body>
</html>
