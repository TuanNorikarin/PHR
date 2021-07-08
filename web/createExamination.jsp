<!DOCTYPE html>
<html lang="en">


    <!-- blog23:34-->
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>MPMR - Manage Personal Medical Record</title>
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

            .sidebar-menu li#aPatient a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            button#createExamination.btn.btn-primary.submit-btn{
                margin-left: 180%;
            }
            .error {
                border-color: #FF0000 !important;
            }
        </style>
    </head>

    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>

    <!-- ============================================== Add Examination Form ================================================ -->

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <h4 class="page-title">Create Examination</h4>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-8 offset-lg-2">
                    <form id="myForm" >
                        <div class="row">
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Select Doctor</label><br/>
                                    <select id="doctorName" name="doctorPhone" class="select">

                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-6">
                                <div class="form-group">
                                    <label>Type</label>
                                    <input class="form-control" id='inputType' name="type" type="text" >
                                    <span id='messageType'/></span>
                                </div>
                            </div>


                            <div class="m-t-20 text-center">
                                <button id="createExamination" class="btn btn-primary submit-btn">Submit</button>

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
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
        <script type="text/javascript">


//                =====================================Insert===============================================

            $(document).ready(function () {
                function uuidv4() {
                    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                        var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
                        return v.toString(16);
                    });
                }
                ;
                var clinicId = localStorage.getItem("clinicId");
                var doctorIdData = "";
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/userinfor/finddoctorbyclinicid/"+clinicId,
                    success: function (data) {
                        doctorIdData = data;
                        var select = document.getElementById("doctorName");
                        for (var i in data) {
                            $(select).append('<option value=' + data[i].phone + '>' + data[i].fullname + " - " + data[i].mail + '</option>');
                        }
                    }
                });
                console.log("a");
                var dataPat = JSON.parse(localStorage.getItem("dataPat"));
                console.log(dataPat);
                var arrayIdTestForExam = localStorage.getItem("arrayIdTestForExam");
                var clinicId = localStorage.getItem("clinicId");
                var splitArrayIdTestForExam = arrayIdTestForExam.split(",");
//                var today = new Date();
                var today = moment().format("YYYY-MM-DDTHH:mm:ss");
//                var todayRating = new Date();
                var dayReturn = moment().add(2, 'm').format("YYYY-MM-DDTHH:mm:ss");
                var uuidExam = uuidv4();
                var uuidTestRequest = uuidv4();
                var uuidTestResult = uuidv4();
                var uuidTestResultDetail = uuidv4();
                $("#inputType").click(function () {
                    $('#inputType').removeClass('error');
                    document.getElementById('messageType').innerHTML = '';
                });
                $("#createExamination").click(function (event) {
                    event.preventDefault();
                    var doctorPhone = $("select[name='doctorPhone']").val(); //lấy giá trị trong input user
                    var type = $("input[name='type']").val();
                    var doctorId = "";
                    for (var i = 0; i < doctorIdData.length; i++) {
                        if (doctorIdData[i].phone === doctorPhone) {
                            doctorId = doctorIdData[i].id;
                        }
                    }
                    if (type.length > 40) {
                        $('#inputType').addClass('error');
                        document.getElementById('messageType').style.color = 'red';
                        document.getElementById('messageType').innerHTML = 'Type must be between 0-40 charcters';
                    } else {
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            data: JSON.stringify({
                                "id": uuidExam,
                                "timeStart": today + 'Z',
                                "timeFinish": dayReturn + 'Z',
                                "type": type,
                                "doctorId": doctorId,
                                "userId": {
                                    "id": dataPat.id
                                },
                                "clinicId": {
                                    "id": clinicId
                                }
                            }),
                            url: "https://bt-application.herokuapp.com/api/examination/insert",
                            complete: function (jqXHR) {
                                if (jqXHR.status === 201) {

                                    $.ajax({
                                        type: "POST",
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        headers: {
                                            Authorization: 'Bearer ' + token},
                                        data: JSON.stringify({
                                            "id": uuidTestRequest,
                                            "timeStart": today + 'Z',
                                            "timeFinish": dayReturn + 'Z',
                                            "examinationId": {
                                                "id": uuidExam
                                            }
                                        }),
                                        url: "https://bt-application.herokuapp.com/api/testrequest/insert",
                                        complete: function (jqXHR) {
                                            if (jqXHR.status === 201) {
                                                for (var i = 0; i < splitArrayIdTestForExam.length; i++) {
                                                    $.ajax({
                                                        type: "POST",
                                                        dataType: "json",
                                                        contentType: "application/json; charset=utf-8",
                                                        headers: {
                                                            Authorization: 'Bearer ' + token},
                                                        data: JSON.stringify({
                                                            "testId": {
                                                                "id": splitArrayIdTestForExam[i]
                                                            },
                                                            "testRequestId": {
                                                                "id": uuidTestRequest
                                                            }
                                                        }),
                                                        url: "https://bt-application.herokuapp.com/api/testtestrequest/insert",
                                                        complete: function (jqXHR) {
                                                            if (jqXHR.status === 201) {

                                                            }
                                                        }
                                                    });
                                                }
                                                $.ajax({
                                                    type: "POST",
                                                    dataType: "json",
                                                    contentType: "application/json; charset=utf-8",
                                                    headers: {
                                                        Authorization: 'Bearer ' + token},
                                                    data: JSON.stringify({
                                                        "id": uuidTestResult,
                                                        "timeFinish": today + 'Z',
                                                        "timeReturn": dayReturn + 'Z',
                                                        "testRequestId": {
                                                            "id": uuidTestRequest
                                                        }
                                                    }),
                                                    url: "https://bt-application.herokuapp.com/api/testresult/insert",
                                                    complete: function (jqXHR) {
                                                        if (jqXHR.status === 201) {
                                                            alert("Create Request Successfully");
                                                            window.location.href = "receptionistPatients.jsp";
//                                                        for (var i = 0; i < splitArrayIdTestForExam.length; i++) {
//                                                            $.ajax({
//                                                                type: "POST",
//                                                                dataType: "json",
//                                                                contentType: "application/json; charset=utf-8",
//                                                                headers: {
//                                                                    Authorization: 'Bearer ' + token},
//                                                                data: JSON.stringify({
//                                                                    "id": uuidTestResultDetail,
//                                                                    "testResultId": {
//                                                                        "id": uuidTestResult
//                                                                    },
//                                                                    "testId": {
//                                                                        "id": splitArrayIdTestForExam[i]
//                                                                    }
//                                                                }),
//                                                                url: "https://bt-application.herokuapp.com/api/testresultdetail/insert",
//                                                                complete: function (jqXHR) {
//                                                                    if (jqXHR.status === 201) {
//
//                                                                    }
//                                                                }
//                                                            });
//                                                        }
                                                        }
                                                    }
                                                });
                                            }
                                        }
                                    });
                                }
                            }
                        });
                    }
                });
            });
//       ================================================Check Confirm Password========================================

        </script>
    </body>


    <!-- add-patient24:07-->
</html>
