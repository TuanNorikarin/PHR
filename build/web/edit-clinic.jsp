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
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <style>
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }

            .sidebar-menu li#aClinic a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            .error {
                border-color: #FF0000 !important;
            }
            #imgClinic{
                overflow:hidden
            }
            img#imgPreview{
                width: 300px;
                height: 300px;
            }
            input#imgClinic.form-control{
                width: 94px;
            }

        </style>
    </head>

    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>
    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Edit Clinic</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form>
                        
                        <div class="form-group">
                            <label>Clinic Name <span class="text-danger">*</span></label>
                            <input name="clinicName" id="inputClinicname" class="form-control" type="text">
                            <span id='messageClinicname'></span>
                        </div>
                        
                        <div class="row">
<!--                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>District <span class="text-danger">*</span></label>
                                <input name="district" id="inputDistrict" class="form-control" type="text">
                                <span id='messageDistrict'></span>
                            </div>
                            
                        </div>-->
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Clinic</label><br/>
                                    <select name="district" id="inputDistrict" class="select">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="12">3</option>
                                        <option value="4">4</option>
                                    </select>
                                    <span id='messageDistrict'></span>
                                </div>
                            </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Phone <span class="text-danger">*</span></label>
                                <input name="phone" id="inputPhone" class="form-control" name="phone" type="number">
                                <span id='messagePhone'/></span>
                            </div>
                        </div>
                        </div>
                        <div class="form-group">
                            <label>Address <span class="text-danger">*</span></label>
                            <textarea name="address" id="inputAddress" class="form-control" type="text"></textarea>
                            <span id='messageAddress'></span>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label>Image</label>
                                <div class="profile-upload">
                                    <div class="upload-img">
                                        <img id="imgPreview" alt="" src="assets/img/user.jpg">
                                    </div>
                                    <div class="upload-input">
                                        <input name="imgClinic" id="imgClinic" type="file" class="form-control" accept="image/x-png,image/gif,image/jpeg" onchange="validateFileType()">
                                    </div>
                                </div>
                            </div>
                        </div>
                       
                        <div class="form-group">
                            <label>Clinic Description</label>
                            <textarea cols="30" rows="6" id="description" name="description" class="form-control"></textarea>
                        </div>
                        <!--                        <div class="form-group">
                                                    <label>Tags <small>(separated with a comma)</small></label>
                                                    <input type="text" placeholder="Enter your tags" data-role="tagsinput" class="form-control">
                                                </div>-->
                        
                        <div class="form-group">
                            <label class="display-block">Status</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="clinic_active" value="on" checked>
                                <label class="form-check-label" for="clinic_active">
                                    Enable
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="status" id="clinic_inactive" value="on">
                                <label class="form-check-label" for="clinic_inactive">
                                    Disable
                                </label>
                            </div>
                        </div>
                        <div class="m-t-20 text-center">
                            <button id="createClinic"  class="btn btn-primary submit-btn">Update Clinic</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="components/footer.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/tagsinput.js"></script>
        <script src="assets/js/app.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/7.7.0/firebase-storage.js"></script>
        <script type="text/javascript">

                                            
        
                                            function validateFileType() {
                                                var fileName = document.getElementById("imgClinic").value;
                                                var idxDot = fileName.lastIndexOf(".") + 1;
                                                var extFile = fileName.substr(idxDot, fileName.length).toLowerCase();
                                                if (extFile === "jpg" || extFile === "jpeg" || extFile === "png") {
                                                    function readURL(input) {
                                                        if (input.files && input.files[0]) {
                                                            var reader = new FileReader();
                                                            reader.onload = function (e) {
                                                                $('#imgPreview').attr('src', e.target.result);

                                                            }

                                                            reader.readAsDataURL(input.files[0]); // convert to base64 string
                                                        }
                                                    }

                                                    readURL(document.getElementById("imgClinic"));

                                                } else {
                                                    toastr["error"]("Only jpg/jpeg and png files are allowed!", "Error", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                                                    $("input[id='imgClinic']").val("");
                                                    $('#imgPreview').attr('src', "assets/img/user.jpg");
                                                }
                                            }
//                =====================================Update===============================================
//                                            var clinicInf = JSON.parse(localStorage.getItem("clinicInf"));
                                                var clinicID = JSON.parse(localStorage.getItem("clinicID"));
                                                console.log(clinicID +" id");
                                                var newImg = "ok";
                                            window.onload = function () {
                                                var token = sessionStorage.getItem("key");
                                                
                                                $("#imgClinic").change(function () {
                                                     var formData = new FormData();
                                                     var files = $("#imgClinic").get(0).files;
                                                     if (files.length > 0) {
                                                            formData.append("image", files[0]);
                                                            formData.append("role", "clinic");
                                                        }
                                                      
    
                                                      
                                                        $.ajax({
                                                            headers: {
                                                                Authorization: 'Bearer ' + token,
                                                            },
                                                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/commons/profile/pic/" + clinicID +"/clinic",
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
                                                        dataType: "json",
                                                        contentType: "application/json",
                                                         headers: {
                                                            Authorization: 'Bearer ' + token},
                                                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/clinics/clinic/" +clinicID,
//                                                        
                                                        success: function (data) { 
                                                            
                                                    
                                                
                                                
                                                var idUpdate = data.id;
                                                
                                                $("#inputClinicname").click(function () {
                                                    $('#inputClinicname').removeClass('error');
                                                    document.getElementById('messageClinicname').innerHTML = '';
                                                });
                                                $("#inputAddress").click(function () {
                                                    $('#inputAddress').removeClass('error');
                                                    document.getElementById('messageAddress').innerHTML = '';
                                                });
                                                $("#inputDistrict").click(function () {
                                                    $('#inputDistrict').removeClass('error');
                                                    document.getElementById('messageDistrict').innerHTML = '';
                                                });
                                                $("#inputPhone").click(function () {
                                                    $('#inputPhone').removeClass('error');
                                                    document.getElementById('messagePhone').innerHTML = '';
                                                });
                                                
                                                
                                                $("input[name='clinicName']").val(data.name);
                                                $("input[name='district']").val(data.district);
//                                                
                                                $("textarea[name='description']").val(data.description);
                                                $("textarea[name='address']").val(data.address);
                                                $("input[name='phone']").val(data.phone);
//                                                $("#clinic_active").val(data.status);
                                                if(newImg === "ok"){
                                                    newImg = data.image;
                                                            }
                                                $("#imgPreview").attr('src', newImg);
                                                var statusOld = data.status;
                                                if (statusOld === "enable") {
                                                    $("#clinic_active").prop("checked", true);
                                                } else {
                                                    $("#clinic_inactive").prop("checked", true);
                                                }
                                                $("#createClinic").click(function (event) {
                                                    event.preventDefault();
                                                    $('#inputClinicname').removeClass('error');
                                                    document.getElementById('messageClinicname').innerHTML = '';
                                                     $('#inputAddress').removeClass('error');
                                                    document.getElementById('messageAddress').innerHTML = '';
                                                     $('#inputDistrict').removeClass('error');
                                                    document.getElementById('messageDistrict').innerHTML = '';
                                                     $('#inputPhone').removeClass('error');
                                                    document.getElementById('messagePhone').innerHTML = '';
                                                    var imageOld = data.image;
                                                    var clinicName = $("input[name='clinicName']").val(); //lấy giá trị trong input user

                                                    var district = $("input[name='district']").val();
                                                    var imgClinic = $("input[name='imgClinic']").val();
                                                    var description = $("textarea[name='description']").val();
                                                    var address = $("textarea[name='address']").val();
                                                    var phone = $("input[name='phone']").val();
                                                    var avatar = $("input[name='avatar']").val();
                                                    var status;
                                                    
                                                    var selectSta = $('input[id="clinic_active"]:checked').val();
                                                    if (selectSta === "on") {
                                                        status = "enable";
                                                    } else {
                                                        status = "disbale";
                                                    }
                                                    console.log(status);
                                                    if (clinicName.length === 0) {
                                                        $('#inputClinicname').addClass('error');
                                                        document.getElementById('messageClinicname').style.color = 'red';
                                                        document.getElementById('messageClinicname').innerHTML = 'Clinic Name is empty ✘';
                                                        if (address.length === 0) {
                                                            $('#inputAddress').addClass('error');
                                                            document.getElementById('messageAddress').style.color = 'red';
                                                            document.getElementById('messageAddress').innerHTML = 'Address is empty ✘';
                                                        }
                                                        if (district.length === 0) {
                                                            $('#inputDistrict').addClass('error');
                                                            document.getElementById('messageDistrict').style.color = 'red';
                                                            document.getElementById('messageDistrict').innerHTML = 'District is empty ✘';
                                                        }
                                                        if (phone.length !== 10) {
                                                            $('#inputPhone').addClass('error');
                                                            document.getElementById('messagePhone').style.color = 'red';
                                                            document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                        }
                                                    } else if (address.length === 0) {
                                                        $('#inputAddress').addClass('error');
                                                        document.getElementById('messageAddress').style.color = 'red';
                                                        document.getElementById('messageAddress').innerHTML = 'Address is empty ✘';
                                                        if (district.length === 0) {
                                                            $('#inputDistrict').addClass('error');
                                                            document.getElementById('messageDistrict').style.color = 'red';
                                                            document.getElementById('messageDistrict').innerHTML = 'District is empty ✘';
                                                        }
                                                        if (phone.length !== 10) {
                                                            $('#inputPhone').addClass('error');
                                                            document.getElementById('messagePhone').style.color = 'red';
                                                            document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                        }
                                                    } else if (district.length === 0) {
                                                        $('#inputDistrict').addClass('error');
                                                        document.getElementById('messageDistrict').style.color = 'red';
                                                        document.getElementById('messageDistrict').innerHTML = 'District is empty ✘';
                                                        if (phone.length !== 10) {
                                                            $('#inputPhone').addClass('error');
                                                            document.getElementById('messagePhone').style.color = 'red';
                                                            document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                        }
                                                    } else if (phone.length !== 10) {
                                                        $('#inputPhone').addClass('error');
                                                        document.getElementById('messagePhone').style.color = 'red';
                                                        document.getElementById('messagePhone').innerHTML = 'Incorrect phone number format ✘';
                                                    } else {
                                                        toastr["success"]("Update Successfully!", "Success", {"progressBar": true, "closeButton": true, "positionClass": "toast-top-full-width"});
                                                        
                                                            return  $.ajax({
                                                                type: "PUT",
                                                                dataType: "json",
                                                                contentType: "application/json; charset=utf-8",
                                                                headers: {
                                                                    Authorization: 'Bearer ' + token},
                                                                data: JSON.stringify({
                                                                    "address": address,
                                                                    "clinicGroupId": 1,
                                                                    "coordinate": "",
                                                                    "name": clinicName,
                                                                    "id": idUpdate,
                                                                    "image": newImg,
                                                                    "phone": phone,
                                                                    "status": status,
                                                                    "district": district,
                                                                    "description": description
                                                                }),
                                                                url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/clinics/clinic",
                                                                complete: function (jqXHR) {
                                                                    console.log(jqXHR.status);
                                                                    if (jqXHR.status === 200) {
                                                                        alert("Update Successfully");
                                                                        window.location.href = "clinics.jsp";
                                                                    }
                                                                }
                                                            });
//                                                        }
//                                                        uploadImage();
                                                            }
                                                        });                 
                                                            
                                                       }});      

                                                
                                            };
        </script>
    </body>


    <!-- add-blog23:57-->
</html>