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
            .sidebar-menu li a {
                color: black;
                font-weight: 500;
            }

            .sidebar-menu li#aHome a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            .overlay{
                display: none;
                position: fixed;
                width: 100%;
                height: 100%;
                top: 0;
                left: 6%;
                z-index: 999;
                background:rgba(255,255,255,0.5)
                    url("assets/img/loadingscreen2.gif") center no-repeat;
            }
            /* Turn off scrollbar when body element has the loading class */
            div.loading{
                overflow: hidden;   
            }
            /* Make spinner image visible when body element has the loading class */
            div.loading.overlay{
                display: block;
            }
            
            img#clinicImg.img-fluid{
                left: 50px;
                width: 90%;
            }
            
        </style>

    </head>
    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>
    <div class="page-wrapper">
        <div class="content">


            <div class="row">
                <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                    <div class="dash-widget">
                        <span class="dash-widget-bg1"><i class="fa fa-user-md" aria-hidden="true"></i></span>
                        <div class="dash-widget-info text-right">
                            <h3 id="doctorCount">&nbsp;</h3>
                            <span class="widget-title1">Doctors <i class="fa fa-check" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>

                <div id="data"> </div>
                <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                    <div class="dash-widget">
                        <span class="dash-widget-bg2"><i class="fa fa-wheelchair"></i></span>
                        <div class="dash-widget-info text-right">
                            <h3 id="patientCount">&nbsp; </h3>
                            <span class="widget-title2">Patients <i class="fa fa-check" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                    <div class="dash-widget">
                        <span class="dash-widget-bg3"><i class="fa fa-user-circle-o" aria-hidden="true"></i></span>
                        <div class="dash-widget-info text-right">
                            <h3 id="receptionistCount">&nbsp;</h3>
                            <span class="widget-title3">Receptionist <i class="fa fa-check" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-sm-6 col-lg-6 col-xl-3">
                    <div class="dash-widget">
                        <span class="dash-widget-bg4"><i class="fa fa-hospital-o" aria-hidden="true"></i></span>
                        <div class="dash-widget-info text-right">
                            <h3 id="examCount">&nbsp;</h3>
                            <span class="widget-title4">Examination <i class="fa fa-check" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
            </div>
<!--            <div class="row">

                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="chart-title">
                                <h4>Examination In Month</h4>

                            </div>	
                            <canvas id="bargraph"></canvas>
                        </div>
                    </div>
                </div>
            </div>-->
            <div class="row">
                <div class="col-md-12 clinicIndex">
                    <div class="blog-view">
                        <article class="blog blog-single-post">
                            <h3 id="clinicTitle" class="blog-title"></h3>
                            <div class="blog-info clearfix">
                                <div class="post-left">
<!--                                    <ul>
                                        <li><a href="#."><i class="fa fa-user-o"></i> By <span id="userAdd"></span></a></li>
                                    </ul>-->
                                </div>
<!--                                <div class="post-right"><a href="#."><i  class="fa fa-comment-o"></i><span id="icomments"></span></a></div>-->
                            </div>
                            <div class="blog-image">
                                <a href="#."><img id="clinicImg" alt="" src="" class="img-fluid"></a>
                            </div>
                            <div class="blog-content">

                                <div>
                                    Địa chỉ: <span id="clinicAddress"></span>
                                </div>
                                <div>
                                    Quận: <span id="clinicDistrict"></span>
                                </div>
                                <div>
                                    Điện thoại: <span id="clinicPhone"></span>
                                </div>
                                <div>
                                    Thời gian làm việc: <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+Thứ hai đến thứ bảy: 7:30 – 19:30.
                                    <br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;+Chủ nhật: 7:30 – 11:30.
                                    <br/>
                                    <br/>
                                </div>

                                <div>
                                    Giới thiệu: <br/> <span id="clinicDescription"></span>
                                </div>

                            </div>
                        </article>
<!--                        <div id='rating' class="widget blog-share clearfix">
                            <h3>Rating</h3>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                            <span class="fa fa-star"></span>
                        </div>-->

<!--                        <div class="widget blog-comments clearfix">
                            <h3>Comments (<span id="comments">0</span>) </h3> 
                            <ul id='listComment' class="comments-list">
                                <li>
                                    <div class="comment">
                                        <div class="comment-author">
                                            <img class="avatar" alt="" src="assets/img/user.jpg">
                                        </div>
                                        <div class="comment-block">
                                            <span class="comment-by">
                                                <span class="blog-author-name"></span>
                                            </span>
                                            <p></p>
                                            <span class="blog-date"></span>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>-->

                    </div>
                </div>

            </div>
        </div>
        <div class="overlay"></div>
    </div>
    <%@include file="components/recepFooter.html" %>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/Chart.bundle.js"></script>
    <script src="assets/js/chart.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/app.js"></script>
    <script type="text/javascript">
        
            var token = sessionStorage.getItem("key");
            var phone = sessionStorage.getItem("user");
            var pass = sessionStorage.getItem("password");
           
            console.log(phone);
            
            window.onload = function () {
//            localStorage.clear();
            

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
                    sessionStorage.setItem("name", infor.name);
                    var clinicId = infor.clinicId;
                    sessionStorage.setItem("clinicID", clinicId);
                    var recepID = infor.id;
                    sessionStorage.setItem("recepID", recepID);
                    sessionStorage.setItem("dob", infor.dob);
                    sessionStorage.setItem("genderRe", infor.gender);
                    console.log(infor.gender);
                    
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        headers: {
                            Authorization: 'Bearer ' + token},
                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/commons/total-role/" + clinicId,
                        success: function (data) {
                            document.getElementById("doctorCount").innerHTML = data.totalDoctor;
                            document.getElementById("patientCount").innerHTML = data.totalPatient;
                            document.getElementById("receptionistCount").innerHTML = data.totalReceptionist;
                            document.getElementById("examCount").innerHTML = data.totalExamination;

                        },
                        error: function (jqXHR, textStatus, errorThrown) {


                        }
                    });
                    
                    
                    $.ajax({
                   type: "GET",
                   dataType: "json",
                   contentType: "application/json",
                       headers: {
                       Authorization: 'Bearer ' + token},
                   url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/clinics/clinic/" +clinicId,
//                                                        
                 success: function (data) { 
                        
                        
                        $('#clinicImg').attr('src', data.image);
                        document.getElementById("clinicTitle").innerHTML = data.name;
                        document.getElementById("clinicAddress").innerHTML = data.address;
                        document.getElementById("clinicDistrict").innerHTML = data.district;
                        document.getElementById("clinicPhone").innerHTML = data.phone;
                        if (!data.description) {
                            document.getElementById("clinicDescription").innerHTML = "..."

                        } else {
                            document.getElementById("clinicDescription").innerHTML = data.description;
                        }
//                      $.ajax({
//                   type: "GET",
//                   dataType: "json",
//                   contentType: "application/json",
//                       headers: {
//                       Authorization: 'Bearer ' + token},
//                   url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/ratings/ratings/" +clinicId,
////                                                        
//                    success: function (value) { 
//                        console.log(value);
//                        
//                        var x = "";
//                        var y = "";
//                        var count = 0
//                        for (var i = 0; i < rating.length; i++) {
//                            count += rating[i].rate;
//                        }
//                        count = count / rating.length;
//                        console.log(count);
//                        if (Number.isNaN(count)) {
//                            console.log(Number.isNaN(count));
//                            count = 0;
//                        }
//                        if (count < 0.5) {
//                            x = '<h3>Rating</h3><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
//                        } else if (count > 0.5 && count < 1) {
//                            x = '<h3>Rating</h3><span class="fa fa-star checked1"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
//                        } else if (count > 1 && count < 1.5) {
//                            x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
//                        } else if (count > 1.5 && count < 2) {
//                            x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
//                        } else if (count > 2 && count < 2.5) {
//                            x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
//                        } else if (count > 2.5 && count < 3) {
//                            x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
//                        } else if (count > 3 && count < 3.5) {
//                            x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span><span class="fa fa-star"></span>';
//                        } else if (count > 3.5 && count < 4) {
//                            x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span><span class="fa fa-star"></span>';
//                        } else if (count > 4 && count < 4.5) {
//                            x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star"></span>';
//                        } else if (count > 4.5 && count < 5) {
//                            x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked1"></span>';
//                        } else {
//                            x = '<h3>Rating</h3><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span><span class="fa fa-star checked"></span>';
//                        }
//                        for (var j = 0; j < rating.length; j++) {
//                            var time = rating[j].time.split("T");
//                            y += '<li><div class="comment"><div class="comment-author">'
//                                    + '<img class="avatar" alt="" src=' + rating[j].image + '></div>'
//                                    + '<div class="comment-block"><span class="comment-by">'
//                                    + '<span class="blog-author-name">' + rating[j].name + '</span></span>'
//                                    + '<p>' + rating[j].comment + '</p>'
//                                    + '<span class="blog-date">' + time[0] + '</span></div></div></li>';
//                        }
//                        $("#rating").html(x);
//                        $("#comments").html(rating.length);
//                        $("#icomments").html(rating.length);
//                        $("#listComment").html(y);
//                
//                
//                  }});
                
                
                }});
                    
                    
                    
                },
                error: function (jqXHR, textStatus, errorThrown) {


                }
                
            });
            
            
            
            

        };
        $(document).ajaxStart(function () {
            $("div").addClass("loading");
        });
        $(document).ajaxStop(function () {
            $("div").removeClass("loading");
        });       

    </script>


</body>

</html>