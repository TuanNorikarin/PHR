<%-- 
    Document   : profileReceptionist
    Created on : Dec 5, 2020, 3:49:38 PM
    Author     : Admin
--%>

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
        <style>
        #clinicName{
                color: salmon;
            }
            i.fa.fa-hospital-o{
                color: #009efb;
            }
        </style>
    </head>

    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-7 col-6">
                    <h4 class="page-title">My Profile</h4>
                </div>

                <div class="col-sm-5 col-6 text-right m-b-30">
                    <a href="changePasswordReceptionist.jsp" class="btn btn-primary btn-rounded"><i class="fa fa-key"></i> Change Password</a>
                    <a href="edit-profileSelfReceptionist.jsp" class="btn btn-primary btn-rounded"><i class="fa fa-edit"></i> Edit Profile</a>
                </div>
                
            </div>
            <div class="card-box profile-header">
                <div class="row">
                    <div class="col-md-12">
                        <div class="profile-view">
                            <div class="profile-img-wrap">
                                <div class="profile-img">
                                    <a href="#"><img id="avatar" class="avatar" src="" alt=""></a>
                                </div>
                            </div>
                            <div class="profile-basic">
                                <div class="row">
                                    <div class="col-md-5">
                                        <div class="profile-info-left">
                                            <h3 id="fullname" class="user-name m-t-0 mb-0"></h3>
                                            <!--                                            <small class="text-muted">Gynecologist</small>-->
                                            <div class="staff-id"> <span id="usernameDisplay"></span></div>
                                            <div class="staff-id">Receptionist <span></span></div>
                                            <div class="staff-id"><i class="fa fa-hospital-o"></i>&nbsp Clinic: <span id="clinicName"></span></div>
                                            <!--<div class="staff-msg"><a href="chat.html" class="btn btn-primary">Send Message</a></div>-->
                                        </div>
                                    </div>
                                    <div class="col-md-7">
                                        <ul class="personal-info">
                                            <li>
                                                <span class="title"><i class="fa fa-phone-square"></i>&nbsp; Phone:</span>
                                                <span id="phoneNum" class="text"><a href="#"></a></span>
                                            </li>
                                            
                                            <li>
                                                <span class="title"><i class="fa fa-birthday-cake"></i>&nbsp; Birthday:</span>
                                                <span id="dob" class="text"></span>
                                            </li>
                                           
                                            <li>
                                                <span class="title"><i class="fa fa-venus-mars"></i>&nbsp; Gender:</span>
                                                <span id="gender" class="text"></span>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>                        
                    </div>
                </div>
            </div>
            <%@include file="components/recepFooter.html" %>
            <script src="assets/js/jquery-3.2.1.min.js"></script>
            <script src="assets/js/popper.min.js"></script>
            <script src="assets/js/bootstrap.min.js"></script>
            <script src="assets/js/jquery.slimscroll.js"></script>
            <script src="assets/js/app.js"></script>
            <script  type="text/javascript">

                window.onload = function () {
                     var name = sessionStorage.getItem("name");
                var phone = sessionStorage.getItem("user");
                var image = sessionStorage.getItem("avatar");
                var gender = sessionStorage.getItem("genderRe");
                var dob = sessionStorage.getItem("dob");
                var clinicName = sessionStorage.getItem("clinicName");
                
                $('#avatar').attr('src', image);
                document.getElementById("usernameDisplay").innerHTML = name;
                document.getElementById("clinicName").innerHTML = clinicName;
                document.getElementById("phoneNum").innerHTML = phone;
                document.getElementById("dob").innerHTML = dob;
                document.getElementById("gender").innerHTML = gender;
                console.log(gender);
                }
            </script>
            </body>


            </html>
