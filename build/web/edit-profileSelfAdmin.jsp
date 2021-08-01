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
                var accId = sessionStorage.getItem("accountId");
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
//                                                    
                                                    
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
                                                    
                                                    var firebaseConfig = {
                                                        apiKey: "AIzaSyBf5hSMUpJ-kpx5c87kgll3dXePgK-j9mQ",
                                                        authDomain: "upload-image-45245.firebaseapp.com",
                                                        databaseURL: "https://upload-image-45245.firebaseio.com",
                                                        projectId: "upload-image-45245",
                                                        storageBucket: "upload-image-45245.appspot.com",
                                                        messagingSenderId: "758652365413",
                                                        appId: "1:758652365413:web:f009f179396e4af4de748c",
                                                        measurementId: "G-S5ECRSMKRB"
                                                    };
                                                    // Initialize Firebase
                                                    firebase.initializeApp(firebaseConfig);
                                                    
                                                    var idNew = data.id;
                                                    
                                                    var name = data.name;
                                                    var firstName = name.split(" ");
                                                    var lastName = name.replace(firstName[firstName.length - 1], "").trim();
                                                    $("#inputFirstname").val(firstName[firstName.length - 1]);
                                                    $("#inputLastname").val(lastName); //đổi thứ tự last name vs firstname

                                                    var password = data.password;
                                                    $("#inputPassword").val(password);
                                                    var confirmPass = data.password;
                                                    $("#confirmPass").val(confirmPass);
                                                    var dob = data.dob;
                                                    $("#datepicker").val(dob);
                                                    var image = data.image;
                                                    $('#img').attr('src', image);
//                                                    


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
//                                                                alert("OK rồi");
                                                                newImg = response;
                                                            },
                                                            error: function (er) {
//                                                                alert("Lỗiiiiiiiiiiiiii");
                                                            }

                                                        });
                                                        });

                                                        




                                                    var gender = data.gender;
                                                    if (gender === "Male") {
                                                        $("#male").prop("checked", true);
                                                    } else {
                                                        $("#female").prop("checked", true);
                                                    }
//                                                    
                                                    var phone = data.phone;
                                                    $("#inputPhone").val(phone);
//                                                  var avatar = $("input[name='avatar']").val();
                                                    var status = data.status;
                                                    if (status === "enable") {
                                                        $("#patient_active").prop("checked", true);
                                                    } else {
                                                        $("#patient_inactive").prop("checked", true);
                                                    }
                                                    $("#inputFirstname").click(function () {
                                                        $('#inputFirstname').removeClass('error');
                                                        document.getElementById('messageFirstname').innerHTML = '';
                                                    });
                                                    $("#inputLastname").click(function () {
                                                        $('#inputLastname').removeClass('error');
                                                        document.getElementById('messageLastname').innerHTML = '';
                                                    });

                                                    $("#inputPassword").click(function () {
                                                        $('#inputPassword').removeClass('error');
                                                        document.getElementById('messagePassword').innerHTML = '';
                                                    });
                                                    $("#inputPhone").click(function () {
                                                        $('#inputPhone').removeClass('error');
                                                        document.getElementById('messagePhone').innerHTML = '';
                                                    });

                                                    $("#createPatient").click(function (event) {
                                                        event.preventDefault();
                                                        $('#inputFirstname').removeClass('error');
                                                        document.getElementById('messageFirstname').innerHTML = '';
                                                        $('#inputLastname').removeClass('error');
                                                        document.getElementById('messageLastname').innerHTML = '';
//                                                        $('#inputUsername').removeClass('error');
//                                                        document.getElementById('messageUsername').innerHTML = '';
                                                        $('#inputPassword').removeClass('error');
                                                        document.getElementById('messagePassword').innerHTML = '';
                                                        $('#inputPhone').removeClass('error');
                                                        document.getElementById('messagePhone').innerHTML = '';
//                                                        $('#inputEmail').removeClass('error');
//                                                        document.getElementById('messageEmail').innerHTML = '';
                                                        var count = 0;
                                                        var alluser = JSON.parse(localStorage.getItem("alluser"));
                                                        for (var i = 0; i < alluser.length; i++) {
//                                                            
                                                            if (alluser[i].phone === document.getElementById('inputPhone').value && document.getElementById('inputPhone').value !== data.phone) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Phone already exists ✘';
                                                                count = 1;
                                                            }
//                                                            
                                                        }


                                                        var idUpdate = data.id;
                                                        
                                                        
                                                        var firstName = $("input[name='firstName']").val(); //lấy giá trị trong input user
                                                        var lastName = $("input[name='lastName']").val();
//                                                        
                                                        var password = $("input[name='password']").val();
                                                        var dob = $("input[name='dob']").val();
                                                        var gender = $("input[name='gender']").val();
//                                                        var address = $("input[name='address']").val();
                                                        var phone = $("input[name='phone']").val();
//                                                        var clinicID = $("select[id='clinicID']").val();
                                                        var avatar = $("input[id='avatar']").val();
                                                        var status = $("input[name='status']").val();
                                                        
                                                        var selectGen = $('input[id="male"]:checked').val();
                                                        if (selectGen === "on") {
                                                            gender = "Male";
                                                        } else {
                                                            gender = "Female";
                                                        }

//                                                        
                                                        console.log(idUpdate +" idUp");
                                                        console.log(lastName +" lastName");
                                                        console.log(firstName +" firstName");
                                                        console.log(phone +" phone");
                                                        console.log(password +" password");
                                                        console.log(gender +" gender");
                                                        
                                                        
                                                        if (firstName.length === 0 || !validateName(removeAscent(firstName)) || firstName.length > 14) {
                                                            $('#inputFirstname').addClass('error');
                                                            document.getElementById('messageFirstname').style.color = 'red';
                                                            document.getElementById('messageFirstname').innerHTML = 'First Name invalid ✘';
                                                            if (lastName.length === 0 || !validateName(removeAscent(lastName)) || lastName.length > 35) {
                                                                $('#inputLastname').addClass('error');
                                                                document.getElementById('messageLastname').style.color = 'red';
                                                                document.getElementById('messageLastname').innerHTML = 'Last Name invalid ✘';
                                                            }

                                                            if (password.length > 30 || password.length < 6) {
                                                                $('#inputPassword').addClass('error');
                                                                document.getElementById('messagePassword').style.color = 'red';
                                                                document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            }
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                            }

                                                        } else if (lastName.length === 0 || !validateName(removeAscent(lastName)) || lastName.length > 35) {
                                                            $('#inputLastname').addClass('error');
                                                            document.getElementById('messageLastname').style.color = 'red';
                                                            document.getElementById('messageLastname').innerHTML = 'Last Name invalid ✘';

                                                            if (password.length > 30 || password.length < 6) {
                                                                $('#inputPassword').addClass('error');
                                                                document.getElementById('messagePassword').style.color = 'red';
                                                                document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            }
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                            }
                                                        }

                                                        else if (password.length > 30 || password.length < 6) {
                                                            $('#inputPassword').addClass('error');
                                                            document.getElementById('messagePassword').style.color = 'red';
                                                            document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            if (phone.length !== 10 || !validatePhone(phone)) {
                                                                $('#inputPhone').addClass('error');
                                                                document.getElementById('messagePhone').style.color = 'red';
                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                            }
                                                        } else if (phone.length !== 10 || !validatePhone(phone)) {
                                                            $('#inputPhone').addClass('error');
                                                            document.getElementById('messagePhone').style.color = 'red';
                                                            document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                        } else if (count === 1) {

                                                        } else {
                                                            toastr["success"]("Update Successfully!", "Success", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                                                            
                                                                return  $.ajax({
                                                                    type: "PUT",
                                                                    dataType: "json",
                                                                    contentType: "application/json; charset=UTF-8",
                                                                    headers: {
                                                                        Authorization: 'Bearer ' + token,
                                                                        },
                                                                    data: JSON.stringify({
//                                                                        
                                                                        "name": lastName + " " + firstName,
                                                                        "id": idUpdate,
                                                                        "image": newImg,
                                                                        "dob": dob,
                                                                        "gender": gender,
                                                                        "password": password,
                                                                        "token": "",
                                                                        
                                                                    }),
                                                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/receptionists/receptionist",
                                                                    complete: function (jqXHR) {
                                                                        console.log(jqXHR.status);
                                                                        if (jqXHR.status === 200) {
                                                                            alert(Update Successfully);
                                                                            window.location.href = "profileAdmin.jsp";
                                                                            }
                                                                        }
                                                                });
                                                     
//                                                            }
//                                                            uploadImage();
                                                        }
                                                    });
                                                }
                                                ;

        </script>
    </body>


    <!-- add-patient24:07-->
</html>
