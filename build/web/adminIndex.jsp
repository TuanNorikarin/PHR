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
            
        </style>

    </head>
    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>
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
                            <h3 id="clinicCount">&nbsp;</h3>
                            <span class="widget-title4">Clinic <i class="fa fa-check" aria-hidden="true"></i></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">

                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="chart-title">
                                <h4>Clinics In District</h4>

                            </div>	
                            <canvas id="bargraph"></canvas>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="overlay"></div>
    </div>
    <%@include file="components/footer.html" %>
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
            
            sessionStorage.getItem("name");
            
            console.log(pass);
            window.onload = function () {
            
            
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
//                    var name = sessionStorage.setItem("name", infor.name);
//                    var image = sessionStorage.setItem("avatar", infor.image);
//                    sessionStorage.setItem("id", infor.id);
                    
                },
                error: function (jqXHR, textStatus, errorThrown) {


                }
                
            });
            
            $.ajax({
                type: "GET",
                dataType: "text",
                contentType: "application/json; charset=utf-8",
                headers: {
                    'Access-Control-Allow-Origin': '*',
                    Authorization: 'Bearer ' + token},

                url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/commons/total-role",
                success: function (data) {
                    
                    var json = jQuery.parseJSON(data);
                    
                    document.getElementById("doctorCount").innerHTML = json.totalDoctor;
                    document.getElementById("receptionistCount").innerHTML = json.totalReceptionist;
                    document.getElementById("patientCount").innerHTML = json.totalPatient;
                    document.getElementById("clinicCount").innerHTML = json.totalClinic;
                    
                    
        
//                    var patCount;
//                    patCount = data.totalPatient;
//                    $("#patientCount").html(patCount);
//                    alert( "Data Loaded: " + data );
//                    console.log(data);

                },
                error: function (jqXHR, textStatus, errorThrown) {


                }
                
            });
//            var q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, bt, td, tb, bth, pn, gv, tp;
//            $.ajax({
//            type: "GET",
//            dataType: "text",
//            contentType: "application/json; charset=utf-8",
//            headers: {
//                Authorization: 'Bearer ' + token},
//            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/clinics/clinics/total-district",
//            success: function (data) {
//                var json = jQuery.parseJSON(data);
//                q1 = json.q1;
//                q2 = json.q2;
//                q3 = json.q3;
//                q4 = json.q4;
//                q5 = json.q5;
//                q6 = json.q6;
//                q7 = json.q7;
//                q8 = json.q8
//                q9 = json.q9;
//                q10 = json.q10;
//                q11 = json.q11;
//                q12 = json.q12;
//                bt = json.binh_tan;
//                td = json.thu_duc;
//                tb = json.tan_binh;
//                bth = json.binh_thanh;
//                pn = json.phu_nhuan;
//                gv = json.go_vap;
//                tp = json.tan_phu;
//
//            },
//            error: function (jqXHR, textStatus, errorThrown) {
//
//
//            }
//        });
            
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