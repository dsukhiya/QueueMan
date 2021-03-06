<%--
  Created by IntelliJ IDEA.
  User: sukhi
  Date: 25-02-2016
  Time: 12:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<<html lang="en" xmlns:form="http://www.w3.org/1999/xhtml">
<head>
    <title><%= session.getAttribute("UserSessionPage") %></title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href='http://fonts.googleapis.com/css?family=Roboto:400,300,700' rel='stylesheet' type='text/css'>
    <link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/resources/assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/resources/assets/style.css">

    <link rel="stylesheet" href="/resources/assets/animate/animate.css" />
    <link rel="stylesheet" href="/resources/assets/animate/set.css" />

    <!-- gallery -->
    <link rel="stylesheet" href="/resources/assets/gallery/blueimp-gallery.min.css">

    <!-- favicon -->
    <link rel="shortcut icon" href="/resources/images/favicon.ico" type="image/x-icon">
    <link rel="icon" href="/resources/images/favicon.ico" type="image/x-icon">
    <script src="/resources/assets/jquery.js"></script>
    <script src="/resources/assets/jquery.min.js"></script>
    <script src="/resources/assets/bootstrap/js/bootstrap.js"></script>

    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

    <style>

        .wrapper {
            margin-top: 100px;
            margin-bottom: 20px;
        }

        .form-reg {
            max-width: 50%;
            padding: 30px 40px 66px 20%;
            margin: 0 auto;
        }

        .form-reg2 {
            max-width: 70%;
            padding: 30px 40px 33px 10%;
            margin: 0 auto;
        }

        .form-signin-heading {
            text-align:center;
            margin-bottom: 30px;
        }

        .form-control {
            position: inherit;
            font-size: 16px;
            height: auto;
            padding: 10px;
        }

        input[type="text"] {
            margin-bottom: 0px;
            border-bottom-left-radius: 0;
            border-bottom-right-radius: 0;
        }

        input[type="password"] {
             margin-bottom: 0px;
             border-top-left-radius: 0;
             border-top-right-radius: 0;
         }

        .select{
            margin-bottom: 20px;
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        .colorgraph {
            height: 7px;
            border-top: 0;
            background: #c4e17f;
            border-radius: 5px;
            background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
        }
        .table {border-collapse: collapse; width: 100%;}
    </style>

</head>
<body>
<div>
    <div class="topbar fadeInLeftBig"></div>
    <div class="navbar-wrapper">
        <div class="container">

            <div class="navbar navbar-default navbar-fixed-top" role="navigation" id="top-nav">
                <div class="container">
                    <div>
                        <div class="navbar-header">
                            <!-- Logo Starts -->
                            <a class="navbar-brand navbar-form" href="/queue"><img src="/resources/images/logo.png" alt="logo" /></a>
                            <!-- #Logo Ends -->
                            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target=".navbar-collapse">
                                <span class="sr-only">Toggle navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>
                        </div>
                        <div class="navbar-collapse  collapse">
                            <ul class="nav navbar-nav scroll">
                                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Tickets View<span class="caret"></span></a>
                                    <ul class="dropdown-menu">
                                    <li class="active"><a href="/queue">New Tickets</a></li>
                                    <li><a href="/breach">SLA Breaching Tickets</a></li>
                                    <li><a href="/followup">Urgent and High Tickets</a></li>
                                    <li><a href="/tickets">2 Days Followup Tickets</a></li>
                                    </ul>
                                </li>
                                <li><a href="/transfers">Transfers</a></li>
                                <li><a href="/escalation">Escalation</a></li>
                            </ul>
                            <ul class="nav navbar-nav navbar-right">
                                <li class="dropdown scroll collapse">
                                    <a href="#" data-toggle="dropdown" class="dropdown-toggle" id="LoginName"><%= session.getAttribute("UserSessionName") %><b class="caret"></b></a>
                                    <ul class="dropdown-menu scroll collapse">
                                        <li><a href="/registration">New Users</a></li>
                                        <li><a href="/resetpass">Reset Password</a></li>
                                        <li><a href="/ZenAuth">Authorize to Zendesk</a></li>
                                        <li class="divider"></li>
                                        <li><a href="/logout">Sign Out</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>