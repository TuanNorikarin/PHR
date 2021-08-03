<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>PHR - Manage Personal Health Record</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>

<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<!-- Default theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css"/>
<!-- Semantic UI theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css"/>
<!-- Bootstrap theme -->
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css"/>


        <style>
            .error {
                border-color: #FF0000 !important;
            }
            div.ajs-header{
                display: none;
            }
            div.ajs-content{
                font-size: 1.5em;
                text-align: center;
                color: turquoise;
            }
            button.ajs-button.ajs-ok{
                display: inline;
            }
            
            div.ajs-footer{
                display: block;
            }
        </style>
    </head>
                                <body>
                                   
                                    <div class="main-wrapper account-wrapper">
                                        <form id="form" action="parse">
                                            <textarea id="jwtEn" name="jwt"></textarea>
                                            <textarea id="jwtDe" name="out"></textarea>
                                        <input type="submit" value="parse" />
                                    </form>

                                    </div>
                                    <script src="assets/js/jquery-3.2.1.min.js"></script>
                                    <script src="assets/js/popper.min.js"></script>
                                    <script src="assets/js/bootstrap.min.js"></script>
                                    <script src="assets/js/app.js"></script>
                                    <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
                                    <script type="text/javascript">
                                        $(document).ready(function () {
                                            alertify.confirm("This is a confirm dialog.",
                                            function(){
                                              alertify.success(window.location.href = "selectTestManual.jsp");
                                            },
                                            function(){
                                              alertify.error(window.location.href = "createExamination.jsp");
                                            });
                                        });
                                    </script>

                                </body>

                                <!-- login23:12-->
                                </html>