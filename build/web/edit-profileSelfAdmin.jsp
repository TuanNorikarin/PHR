<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <meta charset="UTF-8" />
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>PHR - Manage Personal Health Record</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>


        <style>
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }


        </style>
    </head>

    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>

    <!-- ============================================== Add Patient Form ================================================ -->

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Update Profile</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form id="myForm" >
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>First Name <span class="text-danger">*</span></label>
                                    <input class="form-control" id='firstName' name="firstName" type="text" >
                                    <span id='valiFirst'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Last Name <span class="text-danger">*</span></label>
                                    <input class="form-control" id='lastName' name="lastName" type="text" >
                                    <span id='valiLast'></span>
                                </div>
                            </div>
                            

                            
                            
                            
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Phone <span class="text-danger">*</span></label>
                                    <input class="form-control" id ="phone" name="phone" type="text" readonly>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Avatar</label>
                                    <div class="profile-upload">
                                        <div class="upload-img">
                                            <img id='img' alt="" src="assets/img/user.jpg">
                                        </div>
                                        <div class="upload-input">
                                            <input id='avatar' type="file" name="avatar" class="form-control">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="m-t-20 text-center">
                            <button id="createPatient" class="btn btn-primary submit-btn">Update Profile</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>



        <!-- ==================================Chat Box And Notification ======================================= -->


        <%@include file="components/footer.html" %>
        
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript">
                var token = sessionStorage.getItem("key");
                var idUp = sessionStorage.getItem("id");
                var phoneNum = sessionStorage.getItem("user");
//                var phone = sessionStorage.getItem("user");
//                sessionStorage.getItem("name");
                
                                        $("#myForm").validate({
                                        rules: {
                                                "lastName": {
                                                required: true
                                                },
                                                "firstName": {
                                                required: true
                                                }
                                               
                                        },
                                                messages: {
                                                        "lastName": {
                                                        required: "Must not empty"
                                                        },
                                                        "firstName": {
                                                        required: "Must not empty"
                                                        }
                                                },
                                                errorPlacement: function (label, element) {
                                                label.addClass('mt-2 text-danger');
                                                label.insertAfter(element);
                                                },
                                                highlight: function (element, errorClass) {
                                                $(element).parent().addClass('has-danger');
                                                $(element).addClass('form-control-danger');
                                                },
                                                unhighlight: function (element) {
                                                $(element).css('background', '#ffffff');
                                                }

                                        });
//                =====================================Update===============================================

                                        
                                        window.onload = function () {
//                                            var name = sessionStorage.getItem("name");
//                                            var avatar = sessionStorage.getItem("avatar");
                                              
//                                            
//                                            var accId = sessionStorage.getItem("accountId");
//                                            var newImg = avatar;

                                            
                                            $("#avatar").change(function () {
                                                     var formData = new FormData();
                                                     var files = $("#avatar").get(0).files;
                                                     if (files.length > 0) {
                                                            formData.append("image", files[0]);
                                                            formData.append("role", "admin");
                                                        }
                                                      
    
                                                      
                                                        $.ajax({
                                                            headers: {
                                                                Authorization: 'Bearer ' + token,
                                                            },
                                                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/commons/profile/pic/" + idUp +"/admin",
                                                            type:"POST",
                                                            processData: false,
                                                            contentType: false,
                                                            data: formData,
                                                            success: function (response) {
                                                                alert("OK rồi");
//                                                                newImg = response;
                                                            },
                                                            error: function (er) {
//                                                                alert("Lỗiiiiiiiiiiiiii");
                                                            }

                                                        });
                                                        });
                                            
                                                        $.ajax({
                                            type: "GET",
                                            dataType: "text",
                                            contentType: "application/json; charset=utf-8",
                                            headers: {
                                                'Access-Control-Allow-Origin': '*',
                                                Authorization: 'Bearer ' + token},

                                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/admins/admin/phone-account",
                                            success: function (data) {
                                                var infor = jQuery.parseJSON(data);
                                                console.log(infor);
                                                var name = infor.name;
                                                var firstName = name.split(" ");
                                                var lastName = name.replace(firstName[firstName.length - 1], "");
                                                lastName = lastName.trim();
                                                $("#firstName").val(firstName[firstName.length - 1]);
                                                $("#lastName").val(lastName);                 //đổi thứ tự last name vs firstname
                                                
                                                var phone = phoneNum;
                                                $("#phone").val(phone);
                                                var image = infor.image;
                                                $('#img').attr('src', image);
                                                
                                                
                                          },
                                            error: function (jqXHR, textStatus, errorThrown) {


                                            }

                                        });
                                            
//                                        
//
//                                        
//                                        
////                                            var avatar = $("input[name='avatar']").val();
//                                        
//                                        
//                                        $("#createPatient").click(function (event) {
//                                        event.preventDefault();
//                                        
//                                        var firstName = $("input[id='firstName']").val(); //lấy giá trị trong input user
//                                        var lastName = $("input[id='lastName']").val();
//                                        var avatar = $("input[id='avatar']").val();
//                                        
//                                        
//                                        
//                                        return  $.ajax({
//                                        type: "PUT",
//                                                dataType: "json",
//                                                contentType: "application/json; charset=UTF-8",
//                                                headers: {
//                                                Authorization: 'Bearer ' + token},
//                                                data: JSON.stringify({
//                                                    
//                                                        "accountId": accId,
//                                                        "id": idUp,
//                                                        "image": newImg,
//                                                        "name": lastName + " " + firstName
//                                                }),
//                                                url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/admins/admin",
//                                                complete: function (jqXHR) {
//                                                if (jqXHR.status === 200) {
//                                                    alert("Update Successfully");
//                                                    window.location.href = "profileAdmin.jsp";
//                                                }
//                                                }
//                                        });
//                                        
//                                        })
                                        
                                        };
                                       

        </script>
    </body>


    <!-- add-patient24:07-->
</html>
