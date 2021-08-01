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
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <style>
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }

            /*            .sidebar-menu li#aClinic a {
                            color: #009efb;
                            background-color: #2a9c31;
                            background-color: #e3e7e8;
                        }*/
            h4.page-title{
                text-align: center;
            }
            form.changePassForm{
                margin-left: 200px;
            }
            button#changePass{
                margin-left: -31%;

            }
        </style>
    </head>

    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Change Password</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form class="changePassForm">
                        <div class="col-sm-8">
                            <label>Current Password <span class="text-danger">*</span></label>
                            <input name="curPass" id="curPass" class="form-control" type="password" onkeyup='check()' required>
                            <span id='message2'></span>
                        </div>
                        <div class="col-sm-8">
                            <label>New Password <span class="text-danger">*</span></label>
                            <input name="newPass" id="newPass" class="form-control" type="password" onkeyup='check()' required>
                            <span id='message3'></span>
                        </div>
                        <div class="col-sm-8">
                            <label>Confirm Password <span class="text-danger">*</span></label>
                            <input name="confirm" id="confirm" class="form-control" type="password" onkeyup='check()' required>
                            <span id='message'></span>
                        </div>
                        <!--                        <div class="col-sm-6">
                                                    <label>Hidden Password</label>
                                                    <input name="hidPass" id="hidPass" class="form-control" type="password" onkeyup='check()'>
                                                </div>-->


                    </form>
                    <div class="m-t-20 text-center">
                        <button id="changePass" class="btn btn-primary submit-btn">Change Password</button>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="components/footer.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <script type="text/javascript">
                                var token = sessionStorage.getItem("key");
                                var password = sessionStorage.getItem("password");
//                                console.log("current Pass: "+password);
                                var check = function () {
                                    if (document.getElementById('curPass').value ===
                                            password) {
                                        document.getElementById('message2').style.color = 'green';
                                        document.getElementById('message2').innerHTML = '✔';
                                        $("#changePass").removeAttr("disabled");
                                    } else {
                                        document.getElementById('message2').style.color = 'red';
                                        document.getElementById('message2').innerHTML = 'current password not correct';
                                        $("#changePass").attr("disabled", "disabled");
                                    }
                                    if (document.getElementById('newPass').value ===
                                            document.getElementById('confirm').value && document.getElementById('newPass').value !== "" && document.getElementById('confirm').value !== "")
                                    {
                                        document.getElementById('message').style.color = 'green';
                                        document.getElementById('message').innerHTML = 'OK ✔';
                                        $("#changePass").removeAttr("disabled");
                                    } else if (document.getElementById('newPass').value !==
                                            document.getElementById('confirm').value) {
                                        document.getElementById('message').style.color = 'red';
                                        document.getElementById('message').innerHTML = 'not matching ✘';
                                        $("#changePass").attr("disabled", "disabled");
                                    }
                                    if(document.getElementById('newPass').value === document.getElementById('curPass').value)
                                    {
                                        document.getElementById('message3').style.color = 'red';
                                        document.getElementById('message3').innerHTML = 'Can not use old password ✘';
                                        $("#changePass").attr("disabled", "disabled");
                                    }
                                    else if(document.getElementById('newPass').value !== document.getElementById('curPass').value && document.getElementById('newPass').value ===
                                            document.getElementById('confirm').value){
                                        document.getElementById('message3').style.color = 'green';
                                        document.getElementById('message3').innerHTML = 'OK ✔';
                                        $("#changePass").removeAttr("disabled");
                                    }
                                    
                                    
                                };
                                $("#changePass").click(function (event) {
                                    event.preventDefault();
                                    
                                    var newPass = document.getElementById('newPass').value;
                                    $.ajax({
                                        type: "PUT",
                                        dataType: "json",
                                        contentType: "application/json",
                                        headers: {
                                            Authorization: 'Bearer ' + token},
                                        data: JSON.stringify({
                                            
                                            "password": newPass,
                                            
                                        }),
                                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/accounts/account/pw/" +newPass,
                                        complete: function (jqXHR, textStatus) {
                                            password = sessionStorage.setItem("password",newPass);
                                            alert("Change Password Successfully");
                                            window.location.href = "profileAdmin.jsp";
                                        }})
                                })





        </script>
    </body>


    <!-- add-blog23:57-->
</html>