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
                                    <input id='inputFirstname' class="form-control" name="firstName" type="text">
                                    <span id='messageFirstname'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input id='inputLastname' class="form-control" name="lastName" type="text">
                                    <span id='messageLastname'></span>
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
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
        <script type="text/javascript">
                var token = sessionStorage.getItem("key");
                var idUp = sessionStorage.getItem("id");
                var phoneNum = sessionStorage.getItem("user");
                var accId = sessionStorage.getItem("accountId");
//                var phone = sessionStorage.getItem("user");
//                sessionStorage.getItem("name");
                

//                =====================================Update===============================================

                                                      window.onload = function () {
//           


                                                     $("#avatar").change(function () {
                                                     var formData = new FormData();
                                                     var files = $("#avatar").get(0).files;
                                                     if (files.length > 0) {
                                                            formData.append("image", files[0]);
                                                            formData.append("role", "idUp");
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
//                                                                alert("OK rồi");
                                                                newImg = response;
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
                                                    function removeAscent(str) {
                                                        if (str === null || str === undefined) {
                                                            return str;
                                                        }
                                                        str = str.toLowerCase();
                                                        str = str.replace(/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g, "a");
                                                        str = str.replace(/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g, "e");
                                                        str = str.replace(/ì|í|ị|ỉ|ĩ/g, "i");
                                                        str = str.replace(/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g, "o");
                                                        str = str.replace(/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g, "u");
                                                        str = str.replace(/ỳ|ý|ỵ|ỷ|ỹ/g, "y");
                                                        str = str.replace(/đ/g, "d");
                                                        return str;
                                                    }
                                                    function validateName(name)
                                                    {
                                                        var re = /^[a-zA-Z ]+$/;
                                                        return re.test(name);
                                                    }

                                                    var infor = jQuery.parseJSON(data);
                                                    console.log(infor);
                                                    var newImg = infor.image;
                                                    var name = infor.name;
                                                    var firstName = name.split(" ");
                                                    var lastName = name.replace(firstName[firstName.length - 1], "");
                                                    lastName = lastName.trim();
                                                    $("#inputFirstname").val(firstName[firstName.length - 1]);
                                                    $("#inputLastname").val(lastName);                 //đổi thứ tự last name vs firstname

                                                    var phone = phoneNum;
                                                    $("#phone").val(phone);
                                                    var image = infor.image;
                                                    $('#img').attr('src', image);                                  
                                                    
                                                   
//                                                  
                                                    $("#inputFirstname").click(function () {
                                                        $('#inputFirstname').removeClass('error');
                                                        document.getElementById('messageFirstname').innerHTML = '';
                                                    });
                                                    $("#inputLastname").click(function () {
                                                        $('#inputLastname').removeClass('error');
                                                        document.getElementById('messageLastname').innerHTML = '';
                                                    });
                                            
                                                    
                                                    $("#createPatient").click(function (event) {
                                                        event.preventDefault();
                                                        $('#inputFirstname').removeClass('error');
                                                        document.getElementById('messageFirstname').innerHTML = '';
                                                        $('#inputLastname').removeClass('error');
                                                        document.getElementById('messageLastname').innerHTML = '';
                                                        var count = 0;


                                                        var firstName = $("input[id='inputFirstname']").val(); //lấy giá trị trong input user
                                                        var lastName = $("input[id='inputLastname']").val();
                                                        var avatar = $("input[id='avatar']").val();
                                                        
                                                        
                                                        if (firstName.length === 0 || !validateName(removeAscent(firstName)) || firstName.length > 14) {
                                                            $('#inputFirstname').addClass('error');
                                                            document.getElementById('messageFirstname').style.color = 'red';
                                                            document.getElementById('messageFirstname').innerHTML = 'First Name invalid ✘';
                                                            if (lastName.length === 0 || !validateName(removeAscent(lastName)) || lastName.length > 35) {
                                                                $('#inputLastname').addClass('error');
                                                                document.getElementById('messageLastname').style.color = 'red';
                                                                document.getElementById('messageLastname').innerHTML = 'Last Name invalid ✘';
                                                            }

                                                            
                                                            

                                                        } else if (lastName.length === 0 || !validateName(removeAscent(lastName)) || lastName.length > 35) {
                                                            $('#inputLastname').addClass('error');
                                                            document.getElementById('messageLastname').style.color = 'red';
                                                            document.getElementById('messageLastname').innerHTML = 'Last Name invalid ✘';

                                                            
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                            }
                                                        }

                                                        else if (count === 1) {

                                                        } else {
                                                            toastr["success"]("Update Successfully Successfully!", "Success", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                                                            
                                                                return  $.ajax({
                                                                    type: "PUT",
                                                                    dataType: "json",
                                                                    contentType: "application/json; charset=UTF-8",
                                                                    headers: {
                                                                        Authorization: 'Bearer ' + token,
                                                                        },
                                                                    data: JSON.stringify({
//                                                                        
                                                                        "accountId": accId,
                                                                        "id": idUp,
                                                                        "image": newImg,
                                                                        "name": lastName + " " + firstName
                                                                        
                                                                    }),
                                                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/admins/admin",
                                                                    complete: function (jqXHR) {
                                                                        console.log(jqXHR.status);
                                                                        if (jqXHR.status === 200) {
                                                                            alert("Update Successfully! Login again to view your changed!");
                                                                            window.location.href = "profileAdmin.jsp";
                                                                            }
                                                                        }
                                                                });
                                                     
//                                                            
                                                        }
                                                    });


                                                },
                                            error: function (jqXHR, textStatus, errorThrown) {


                                            }

                                        });


//                                                    


                                                   

                                                };
                                                

        </script>
    </body>


    <!-- add-patient24:07-->
</html>
