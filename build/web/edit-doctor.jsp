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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>



        <style>
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }

            .sidebar-menu li#aDoctor a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            .error {
                border-color: #FF0000 !important;
            }
            #avatar{
                overflow: hidden
            }


        </style>
    </head>

    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>

    <!-- ============================================== Add Doctor Form ================================================ -->

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Update Doctor</h4>
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
                                    <label>Password</label>
                                    <input  id='inputPassword' class="form-control" id="password" name="password" type="password" onkeyup='check()'>
                                    <span id='messagePassword'/></span>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Confirm Password</label>
                                    <input class="form-control" id="confirmPass" name="confirmPass" type="password" onkeyup='check()'>
                                    <span id='message'></span>
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
                            <button id="createPatient" class="btn btn-primary submit-btn">Update Doctor</button>

                        </div>
                    </form>
                </div>
            </div>
        </div>



        <!-- ==================================Chat Box And Notification ======================================= -->


        <%@include file="components/footer.html" %>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
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


//                =====================================Update===============================================

                                                var data = JSON.parse(localStorage.getItem("dataDoctor"));
//                                                var data2 = JSON.parse(localStorage.getItem("infoDoctor"));
                                                
                                                var newImg = "ok";
                                                console.log(data);
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

                                                window.onload = function () {
                                                    var token = sessionStorage.getItem("key");
                                                    var id = data;
                                                    console.log("this is id " + id);
                                                    
                                                    $("#avatar").change(function () {
                                                     var formData = new FormData();
                                                     var files = $("#avatar").get(0).files;
                                                     if (files.length > 0) {
                                                            formData.append("image", files[0]);
                                                            formData.append("role", "doctor");
                                                        }
                                                      
                                                        $.ajax({
                                                            headers: {
                                                                Authorization: 'Bearer ' + token,
                                                            },
                                                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/commons/profile/pic/" + id +"/doctor",
                                                            type:"POST",
                                                            processData: false,
                                                            contentType: false,
                                                            data: formData,
                                                            success: function (response) {
                                                                alert("OK r???i");
//                                                                newImg = response;
                                                            },
                                                            error: function (er) {
//                                                                alert("L???iiiiiiiiiiiiii");
                                                            }

                                                        });
                                                        });

                                                    $.ajax({
                                                        type: "GET",
                                                        dataType: "json",
                                                        contentType: "application/json",
                                                         headers: {
                                                            Authorization: 'Bearer ' + token},
                                                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/doctors/doctor/" +id,
//                                                        
                                                        success: function (data) {
                                                            
                                                            var name = data.name;
                                                            var firstName = name.split(" ");
                                                            var lastName = name.replace(firstName[firstName.length - 1], "");
                                                            lastName = lastName.trim();
                                                            $("#inputFirstname").val(firstName[firstName.length - 1]);
                                                            $("#inputLastname").val(lastName); //?????i th??? t??? last name vs firstname
                                                            var password = data.password;
                                                            $("#inputPassword").val(password);
                                                            var confirmPass = data.password;
                                                            $("#confirmPass").val(confirmPass);
                                                            var phone = data.phone;
                                                            if(newImg === "ok"){
                                                               newImg = data.image;
                                                            }
                                                            $('#img').attr('src', newImg);
                                                            
                                                            $("#inputPhone").val(phone);
                                                            var dob = data.dob;
                                                            $("#datepicker").val(dob);
                                                            var gender = data.gender;
                                                            if (gender === "Male") {
                                                                $("#male").prop("checked", true);
                                                            } else {
                                                                $("#female").prop("checked", true);
                                                            }
                                                            $(document).ready(function () {
//                                                    
//                                                    
                                                    function removeAscent(str) {
                                                        if (str === null || str === undefined) {
                                                            return str;
                                                        }
                                                        str = str.toLowerCase();
                                                        str = str.replace(/??|??|???|???|??|??|???|???|???|???|???|??|???|???|???|???|???/g, "a");
                                                        str = str.replace(/??|??|???|???|???|??|???|???|???|???|???/g, "e");
                                                        str = str.replace(/??|??|???|???|??/g, "i");
                                                        str = str.replace(/??|??|???|???|??|??|???|???|???|???|???|??|???|???|???|???|???/g, "o");
                                                        str = str.replace(/??|??|???|???|??|??|???|???|???|???|???/g, "u");
                                                        str = str.replace(/???|??|???|???|???/g, "y");
                                                        str = str.replace(/??/g, "d");
                                                        return str;
                                                    }
                                                    function validateName(name)
                                                    {
                                                        var re = /^[a-zA-Z ]+$/;
                                                        return re.test(name);
                                                    }
                                                    function validatePhone(phone)
                                                    {
                                                        var re = /((09|03|07|08|05)+([0-9]{8})\b)/g;
                                                        return re.test(phone);
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
//                                                    

                                                    $("#createPatient").click(function (event) {
                                                        event.preventDefault();
                                                        $('#inputFirstname').removeClass('error');
                                                        document.getElementById('messageFirstname').innerHTML = '';
                                                        $('#inputLastname').removeClass('error');
                                                        document.getElementById('messageLastname').innerHTML = '';
                                                        $('#inputPassword').removeClass('error');
                                                        document.getElementById('messagePassword').innerHTML = '';
                                                        $('#inputPassword').removeClass('error');
                                                        document.getElementById('messagePassword').innerHTML = '';
                                                        $('#inputPhone').removeClass('error');
                                                        document.getElementById('messagePhone').innerHTML = '';
                                                        var count = 0;
                                                        var alluser = JSON.parse(localStorage.getItem("alluser"));
//                                                        
                                                        var imageOld = data.image;
                                                        var idUpdate = data.id;
                                                        var firstName = $("input[name='firstName']").val(); //l???y gi?? tr??? trong input user
                                                        var lastName = $("input[name='lastName']").val();
                                                        var password = $("input[name='password']").val();
                                                        var dob = $("input[name='dob']").val();
                                                        var gender = $("input[name='gender']").val();
                                                        var phone = $("input[name='phone']").val();
//                                                        
                                                        
                                                        var selectGen = $('input[id="male"]:checked').val();
                                                        if (selectGen === "on") {
                                                            gender = "Male";
                                                        } else {
                                                            gender = "Female";
                                                        }
             
                                                        console.log(idUpdate +" idUp");
                                                        console.log(phone +" phone");
                                                        console.log(password +" password");
                                                        console.log(imageOld +" avatar");
                                                        console.log(selectGen +" gender");
                                                        
                                                        if (firstName.length === 0 || !validateName(removeAscent(firstName)) || firstName.length > 14) {
                                                            $('#inputFirstname').addClass('error');
                                                            document.getElementById('messageFirstname').style.color = 'red';
                                                            document.getElementById('messageFirstname').innerHTML = 'First Name invalid ???';
                                                            if (lastName.length === 0 || !validateName(removeAscent(lastName)) || lastName.length > 35) {
                                                                $('#inputLastname').addClass('error');
                                                                document.getElementById('messageLastname').style.color = 'red';
                                                                document.getElementById('messageLastname').innerHTML = 'Last Name invalid ???';
                                                            }

                                                            if (password.length > 30 || password.length < 6) {
                                                                $('#inputPassword').addClass('error');
                                                                document.getElementById('messagePassword').style.color = 'red';
                                                                document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            }
//                                                            if (phone.length !== 10 || !validatePhone(phone)) {
//                                                                $('#inputPhone').addClass('error');
//                                                                document.getElementById('messagePhone').style.color = 'red';
//                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ???';
//                                                            }

                                                        } else if (lastName.length === 0 || !validateName(removeAscent(lastName)) || lastName.length > 35) {
                                                            $('#inputLastname').addClass('error');
                                                            document.getElementById('messageLastname').style.color = 'red';
                                                            document.getElementById('messageLastname').innerHTML = 'Last Name invalid ???';

                                                            if (password.length > 30 || password.length < 6) {
                                                                $('#inputPassword').addClass('error');
                                                                document.getElementById('messagePassword').style.color = 'red';
                                                                document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';
                                                            }
//                                                            if (phone.length !== 10 || !validatePhone(phone)) {
//                                                                $('#inputPhone').addClass('error');
//                                                                document.getElementById('messagePhone').style.color = 'red';
//                                                                document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ???';
//                                                            }
                                                        }

                                                        else if (password.length > 30 || password.length < 6) {
                                                            $('#inputPassword').addClass('error');
                                                            document.getElementById('messagePassword').style.color = 'red';
                                                            document.getElementById('messagePassword').innerHTML = 'Password must be between 6-30 charcters';

                                                        } 

                                                        else if (count === 1) {

                                                        } else {
                                                            
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
                                                                        "id": idUpdate,
                                                                        "password": password,
                                                                        "image": newImg,
                                                                    }),
                                                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/doctors/doctor",
                                                                    complete: function (jqXHR) {
                                                                        console.log(jqXHR.status);
                                                                        if (jqXHR.status === 200 || jqXHR.status === 201) {
                                                                            alertify.alert('Update Successfully!');
                                                                                setTimeout(function(){
                                                                                    window.location.href = "doctors.jsp";
                                                                            },1700);
                                                                            
                                                                        }
                                                                    }
                                                                });
//                                                            }
//                                                            uploadImage();
                                                        }
                                                    });
                                                });
                                                            
                                                        }});


                                                    $.ajax({
                                                        type: "GET",
                                                        dataType: "json",
                                                        contentType: "application/json; charset=utf-8",
                                                        headers: {
                                                            Authorization: 'Bearer ' + token},
                                                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/clinics/clinics",
                                                        success: function (data1) {
                                                            var select = document.getElementById("clinicID");
                                                            
                                                            for (var i in data1) {
                                                                $(select).append('<option value=' + data1[i].id + '>' + data1[i].name + '</option>');

                                                            }
                                                            var clinicID = data.clinicName;
                                                            $("select option").filter(function () {
                                                                return $(this).text() === clinicID;
                                                            }).attr('selected', true);
                                                        }
                                                    });




                                                };
                                                
//              ==================================Check Password==========================================
                                                var check = function () {
                                                    if (document.getElementById('inputPassword').value ===
                                                            document.getElementById('confirmPass').value && document.getElementById('inputPassword').value !== "") {
                                                        document.getElementById('message').style.color = 'green';
                                                        document.getElementById('message').innerHTML = 'OK ???';
                                                        $("#createPatient").removeAttr("disabled");
                                                    } else {
                                                        if (document.getElementById('inputPassword').value !== "") {
                                                            document.getElementById('message').style.color = 'red';
                                                            document.getElementById('message').innerHTML = 'not matching ???';
                                                            $("#createPatient").attr("disabled", "disabled");
                                                        } else {
                                                            document.getElementById('message').innerHTML = '';
                                                        }

                                                    }
                                                };
        </script>
    </body>


    <!-- add-patient24:07-->
</html>
