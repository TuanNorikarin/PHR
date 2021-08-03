<%-- 
    Document   : edit-profileSelfReceptionist
    Created on : Dec 22, 2020, 1:09:52 PM
    Author     : Admin
--%>

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

    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>

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
                                    <input id='inputFirstname' class="form-control" name="firstName" type="text" required>
                                    <span id='messageFirstname'></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input id='inputLastname' class="form-control" name="lastName" type="text" required>
                                    <span id='messageLastname'></span>
                                </div>
                            </div>

                            
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Date of Birth</label>
                                    <div class="cal-icon">
                                        <input id="datepicker" type="text" name="dob" class="form-control datetimepicker" data-date-format="YYYY/MM/DD">


                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group gender-select">
                                    <label class="gen-label">Gender:</label>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input id="male" type="radio" name="gender" class="form-check-input">Male
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                        <label class="form-check-label">
                                            <input id="female" type="radio" name="gender" class="form-check-input">Female
                                        </label>
                                    </div>
                                </div>
                            </div>

                            
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Phone </label>
                                    <input id='inputPhone' class="form-control" name="phone" type="number" readonly>
                                    <span id='messagePhone'/></span>
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

                                            <input id="avatar" type="file" name="avatar" accept="image/x-png,image/gif,image/jpeg" class="form-control" onchange="validateFileType()">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="m-t-20 text-center">
                            <button id="createPatient" class="btn btn-primary submit-btn">Update</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>



        <!-- ==================================Chat Box And Notification ======================================= -->


        <%@include file="components/recepFooter.html" %>
        
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript">

                                                function validateFileType() {
                                                    var fileName = document.getElementById("avatar").value;
                                                    var idxDot = fileName.lastIndexOf(".") + 1;
                                                    var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                                                    if (extFile === "jpg" || extFile === "jpeg" || extFile === "png") {
                                                        function readURL(input) {
                                                            if (input.files && input.files[0]) {
                                                                var reader = new FileReader();
                                                                reader.onload = function (e) {
                                                                    $('#img').attr('src', e.target.result);

                                                                }

                                                                reader.readAsDataURL(input.files[0]); // convert to base64 string
                                                            }
                                                        }

                                                        readURL(document.getElementById("avatar"));

                                                    } else {
                                                        toastr["error"]("Only jpg/jpeg and png files are allowed!", "Error", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                                                        $("input[id='avatar']").val("");
                                                        $('#img').attr('src', "assets/img/user.jpg");
                                                    }
                                                }
//                =====================================Update===============================================

                                                var token = sessionStorage.getItem("key");
                                                var idUp = sessionStorage.getItem("id");
                                                var pass = sessionStorage.getItem("password");
                                                var phoneNum = sessionStorage.getItem("user");
                                                var accId = sessionStorage.getItem("accountId");
                                                var newImg = "ok";
                                                window.onload = function () {
                                                    
                                                    $("#avatar").change(function () {
                                                     var formData = new FormData();
                                                     var files = $("#avatar").get(0).files;
                                                     if (files.length > 0) {
                                                            formData.append("image", files[0]);
                                                            formData.append("role", "receptionist");
                                                        }
                                                      
                                                        $.ajax({
                                                            headers: {
                                                                Authorization: 'Bearer ' + token,
                                                            },
                                                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/commons/profile/pic/" + idUp +"/receptionist",
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

                                                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/receptionists/receptionist/phone-account",
                                                        success: function (data) {
                                                            var infor = jQuery.parseJSON(data);
                                                            console.log(infor);
                                                            
                                                            
                                                            var name = infor.name;
                                                            var firstName = name.split(" ");
                                                            var lastName = name.replace(firstName[firstName.length - 1], "");
                                                            lastName = lastName.trim();
                                                            $("#inputFirstname").val(firstName[firstName.length - 1]);
                                                            $("#inputLastname").val(lastName); //đổi thứ tự last name vs firstname
                                                           
                                                            var phone = phoneNum;
                                                            if(newImg === "ok"){
                                                               newImg = infor.image;
                                                            }
                                                            $('#img').attr('src', newImg);
                                                            
                                                            $("#inputPhone").val(phone);
                                                            
                                                            var dob = infor.dob;
                                                            $("#datepicker").val(dob);
                                                            var gender = infor.gender;
                                                            if (gender === "Male") {
                                                                $("#male").prop("checked", true);
                                                            } else {
                                                                $("#female").prop("checked", true);
                                                            }
                                                            $(document).ready(function () {

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
                                                        var alluser = JSON.parse(localStorage.getItem("alluser"));
//                                                        
                                                        var imageOld = data.image;
                                                        
                                                        var firstName = $("input[name='firstName']").val(); //lấy giá trị trong input user
                                                        var lastName = $("input[name='lastName']").val();
                                                        var dob = $("input[name='dob']").val();
                                                        var gender = $("input[name='gender']").val();
                                                        
                                                        var selectGen = $('input[id="male"]:checked').val();
                                                        if (selectGen === "on") {
                                                            gender = "Male";
                                                        } else {
                                                            gender = "Female";
                                                        }

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
                
                                                        }

                                                       

                                                        else if (count === 1) {

                                                        } else {
                                                            toastr["success"]("Update Successfully!", "Success", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                                                            
                                                                return   $.ajax({
                                                                    type: "PUT",
                                                                    dataType: "json",
                                                                    contentType: "application/json; charset=UTF-8",
                                                                    headers: {
                                                                        Authorization: 'Bearer ' + token},
                                                                    data: JSON.stringify({
                                                                        "gender": gender,
                                                                        "dob": dob,
                                                                        "name": lastName + " " + firstName,
                                                                        "id": idUp,
                                                                        "password": pass,
                                                                        "image": newImg,
                                                                    }),
                                                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/receptionists/receptionist",
                                                                    complete: function (jqXHR) {
                                                                        console.log(jqXHR.status);
                                                                        if (jqXHR.status === 200 || jqXHR.status === 201) {
                                                                            alertify.alert('Update Successfully ✔ Login again to view your changed!');
                                                                                setTimeout(function(){
                                                                                    window.location.href = "profileReceptionist.jsp";
                                                                             },2000);
                                                                            
                                                                        }
                                                                    }
                                                                });
//                                                            
                                                        }
                                                    });
                                                });
                                                            
                                                        }});

                                                };
                                                

        </script>
    </body>


</html>


