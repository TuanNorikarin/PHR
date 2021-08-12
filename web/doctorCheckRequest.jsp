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

            .sidebar-menu li#aGroup a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            div.dropdown.dropdown-action{
                float: right;
            }
            
            /*------ Switch Button ---------*/
            .switch {
            position: relative;
            display: inline-block;
            width: 90px;
            height: 34px;
            left: 58%;
          }
            h4.busyLabel{
              position: relative;
              right: 52px;
              top: 7px;
              color: goldenrod;
          }

          .switch input {display:none;}

          .slider {
            position: absolute;
            cursor: pointer;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: #ca2222;
            -webkit-transition: .4s;
            transition: .4s;
          }

          .slider:before {
            position: absolute;
            content: "";
            height: 26px;
            width: 26px;
            left: 4px;
            bottom: 4px;
            background-color: white;
            -webkit-transition: .4s;
            transition: .4s;
          }

          input:checked + .slider {
            background-color: #2ab934;
          }

          input:focus + .slider {
            box-shadow: 0 0 1px #2196F3;
          }

          input:checked + .slider:before {
            -webkit-transform: translateX(55px);
            -ms-transform: translateX(55px);
            transform: translateX(55px);
          }

          /*------ ADDED CSS ---------*/
          .on
          {
            display: none;
          }

          .on, .off
          {
            color: white;
            position: absolute;
            transform: translate(-50%,-50%);
            top: 50%;
            left: 50%;
            font-size: 10px;
            font-family: Verdana, sans-serif;
          }

          input:checked+ .slider .on
          {display: block;}

          input:checked + .slider .off
          {display: none;}

          /*--------- END --------*/

          /* Rounded sliders */
          .slider.round {
            border-radius: 34px;
          }

          .slider.round:before {
            border-radius: 50%;}
          
          
            
            
        </style>
    </head>

    <%@include file="components/doctorHeader.html" %>
    <%@include file="components/doctorSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">Waiting Requests</h4>
                </div>
                <!-----------------Busy Button-=========================->-->
                
                <label class="switch">
                <h4 class="busyLabel">Busy</h4>
                <input type="checkbox" id="togBtn">
                <div class="slider round"><!--
                 <!--ADDED HTML -->
                 <span class="on">ON</span>
                 <span class="off">OFF</span>
                 <!--END-->
                </div>
               </label>
                
                </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="">
                        <table id="checkRequestTable" class="table table-border table-striped custom-table datatable mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 30%">Patient</th>
                                    <th style="width: 60%">Description</th>
                                    <th style="width: 10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="name"></td>
                                    <td id="description"><span id='messageName'></span></td>
                                    <td class="text-right">
                                    </td>
                                </tr>

                            </tbody>
                        </table>
                        
                    </div>
                </div>
            </div>
        </div>
        <div class="overlay"></div>
        <%@include file="components/doctorFooter.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script src="https://cdn.datatables.net/plug-ins/1.10.15/dataRender/datetime.js"></script>
        <script type="text/javascript">
            //==============================Loading Page=========================================
            $(document).ajaxStart(function () {
                $("div").addClass("loading");
            });
            $(document).ajaxStop(function () {
                $("div").removeClass("loading");
            });

//============================================================================================    



//            =========================================   =====================================
                var doctorID = sessionStorage.getItem("doctorID");
                console.log(doctorID + " doctorID");
                window.onload = function () {
                sessionStorage.removeItem('patientID');    
                var token = sessionStorage.getItem("key");
                var id = localStorage.getItem("userId");
                var arrayTestRequest = [];
                var arrayTestRequestTotal = [];
                
// ==============================Busy Function===============================================
                
                $(function(){
                var test = sessionStorage.input === 'true'? true: false;
                $('#togBtn').prop('checked', test || false);
                });

                $('#togBtn').on('change', function() {
                    sessionStorage.input = $(this).is(':checked');
                    console.log($(this).is(':checked'));
                });

//                $(document).ready(function() {
                //set initial state.
                $('#togBtn').val(this.checked);

                $('#togBtn').change(function() {
                    if($(this).is(":checked")) {
//                    
                            $.ajax({
                            type: "PUT",
                            dataType: "json",
                            contentType: "application/json; charset=UTF-8",
                            headers: {Authorization: 'Bearer ' + token},
        //                    
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/doctors/doctor/false",
                            success: function (data) {

                                alertify.alert('You will NOT receive examination request any more!');

                            }
                       });         
                    }else if($(this).not(':checked')){
                            
                            $.ajax({
                            type: "PUT",
                            dataType: "json",
                            contentType: "application/json; charset=UTF-8",
                            headers: {Authorization: 'Bearer ' + token},
        //                    
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/doctors/doctor/true",
                            success: function (data) {
                            alertify.alert('You will receive examination request');
                            }
                        });

                        }
                $('#togBtn').val(this.checked);        
                });
            
//        });
//      =======================================Get Examination================================
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},

                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/examinations/examination/doctor/" + doctorID,

                    success: function (data) {
                        var string = [];
                        var array = "";
                        var arrayTime = [];
                        var a = JSON.stringify(data);
                        var b = JSON.parse(a);
                        console.log(b);
                        var listPatient = [];
                        if (b !== null) {
                            for (var i = 0; i < b.length; i++) {
                                console.log(b[i].dob)
                                console.log(new Date(b[i].dob).getFullYear())
                                var dobYear = new Date(b[i].dob).getFullYear()
                                var currentYear = new Date().getFullYear()
                                var diffYear = parseInt(currentYear) - parseInt(dobYear)
                                var patient = new Object();
                                patient.name = b[i].patientName;
                                patient.description = b[i].description;
                                patient.patientId = b[i].patientId;
                                console.log(b[i].patientId + " patientID")
                                var gender;
                                if(b[i].gender === "Male"){
                                    gender = 1;
                                }else{
                                    gender = 2;
                                }
                                
                                patient.dataPatient = b[i].examinationId + "." + gender + "." + diffYear + "." + b[i].patientId;
                                listPatient.push(patient);
                                console.log(patient.patientId);
                            }
                        }

                        $('#checkRequestTable').DataTable({
                            data: listPatient,
                            columns: [
                                {data: 'name'},
                                {data: 'description'},
                                {
                                    data: 'dataPatient',
                                    render: function (data, type, row, meta) {
                                        return '<td><button class="btn btn-primary inputResult" onClick="selectPatientToInputResult(\''+data+'\')"> <a> Select</a> </button></td>'
                                    }
                                }
                            ],
                            "bDestroy": true,
                            "bFilter": true,
//                             "createdRow": function (row, data, dataIndex) {
//                                $('td:eq(1)', row).css('display', 'none');
//                            }
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        $('#checkRequestTable').addClass('error');
                        document.getElementById('messageName').style.color = 'green';
                        document.getElementById('messageName').innerHTML = 'NO AVAILABLE REQUEST AT THIS TIME ✘';
//                        alert("NO AVAILABLE REQUEST AT THIS TIME");
                        console.log(' Error in processing! ' + textStatus);
                    }

                })
            };
            function selectPatientToInputResult(dataPatient) {
                var patientData = (dataPatient+"").split(".");
                var examId = patientData[0];
                var gender = (patientData[1] === "1") ? "Male" : "Female";
                var typeGender = gender;
                if(parseInt(patientData[2]) <= 12) {
                    typeGender = "Child-" + gender;
                }
                var patientID = patientData[3];
                
                console.log(patientData[3] +" hajds");
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                    Authorization: 'Bearer ' + token
                    },
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/examination-details/examination-detail/examination/" + examId + "?typeGender=" + typeGender,
                    success: function (data) {
                        localStorage.setItem("dataTestRequestId", JSON.stringify(data));
                        sessionStorage.setItem("patientGender", gender);
                        sessionStorage.setItem("typeGender", typeGender)
                        sessionStorage.setItem("patientID", patientID);
                        window.location.href = "inputResult.jsp";
                    }, 
                    error: function (jqXHR, textStatus, errorThrown) {    
                        console.log(errorThrown)
                    }})
            }
        </script>
    </body>


    <!-- patients23:19-->
</html>