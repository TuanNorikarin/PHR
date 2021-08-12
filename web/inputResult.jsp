<!DOCTYPE html>
<html lang="en">


<!-- blog23:34-->

<head>
    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">

        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>PHR - Manage Personal Health Record</title>
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>


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

            table,
            th,
            td {
                /* border: 1px solid black; */
                text-align: center;
            }

            thead {
                text-align: center;
                color: #009efb;
                font-weight: bolder;
            }

            .close {
                margin-right: 40%;
                transform: scale(1.2);
                -ms-transform: scale(1.2);
                -webkit-transform: scale(1.2);
                opacity: 0.85;
                font-weight: 500;
                color: red;

            }

            .close:hover {
                opacity: 1;
                color: orangered;
            }

            caption {
                color: #000;
                font-size: 18px;
                font-weight: bold;

            }

            .testPackage {
                left: 12%;
            }

            .doctorComment {
                left: 12%;
                width: 100%;
                margin-top: 5%;
                resize: none;
            }

            button.btn.btn-primary.account-btn.finishResult {
                margin-left: 48%;
            }

            .error {
                border: 1px solid red !important;
            }

            #inputResult {
                text-align: right;
            }

            textArea#textArea1.form-control,
            textArea#textArea.form-control {
                font-size: 1.2em;

            }

            #namePackage {
                color: salmon;
            }
            button.viewDiseases{
                position: relative;
                left: 77%;
                top: 90px;
                z-index: 10;
            }
            table#diseasesTable{
                width: 600px !important;
            }
            div.modal-content{
                width: 630px;
            }
        </style>
</head>

<%@include file="components/doctorHeader.html" %>
<%@include file="components/doctorSidebar.html" %>

        <div class="page-wrapper">
                      
        <div class="">

                <!-- Button to Open the Modal -->
              <button type="button" class="btn btn-primary btn-lg viewDiseases" data-toggle="modal" data-target="#myModalDisease">
              <i class="fa fa-eye"></i> View Patient's Diseases
              </button>


                <!-- The Modal -->
              <div class="modal" id="myModalDisease">
                <div class="modal-dialog">
                  <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">Patient's Diseases</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <table id="diseasesTable" class="table table-bordered datatable mb-0">

                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th id='description' >Description</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr> 
                                    <td id="name"></td>
                                    <td id="description"></td>

                                </tr>
                            </tbody>
                        </table>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

              </div>
            </div>
          </div>
          </div>
            
            
            
            <div class="content">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header">
                                RESULT
                            </div>
                            <div class="card-body">
                                <div class="form-group">
                                    <table id="testPackageTable" name="requesttable"
                                        class="table table-bordered datatable mb-0">
                                        <thead>
                                            <tr>
                                                <th style="width: 20%">Name</th>
                                                <th style="width: 15%">Min</th>
                                                <th style="width: 15%">Max</th>
                                                <th style="width: 15%">Result</th>
                                                <th style="width: 15%">Diagnose</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td id="name"></td>
                                                <td id="male"></td>
                                                <td id="female"></td>
                                                <td id="result" name="result"></td>
                                                <td id="diagnose" name="diagnose"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                                <div class="form-group doctorComment">
                                    <label>Summary Diagnose:</label>
                                    <textarea id="textArea" rows="7" cols="5" class="form-control" style="resize: none;"
                                        placeholder=""></textarea>
                                </div>

                                <div class="form-group doctorComment">
                                    <label>Doctor's Advise:</label>
                                    <textarea id="textArea1" rows="7" cols="5" class="form-control"
                                        style="resize: none;" placeholder=""></textarea>
                                </div>
                                <div class="form-group text-right">
                                    <button id="finishResult" type="submit"
                                        class="btn btn-primary account-btn finishResult">Submit</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="overlay"></div>
            <!--Modal Bootstrap-->
            <div>
                <div class="modal fade" id="diagnoseModal" tabindex="-1" role="dialog"
                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Diagnose</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                               <div class="form-row">
                                   <div class="col-md-12">
                                       <textarea rows="10" id="txtDiagnose" style="width: 100%" class="form-control"></textarea>
                                       <input type="hidden" id="txtTestPackageId" />
                                   </div>
                               </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="fnSaveDiagnose()">Save</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
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
                <script type="text/javascript">
                    //==============================Loading Page=========================================
                    $(document).ajaxStart(function () {
                        $("div").addClass("loading");
                    });
                    $(document).ajaxStop(function () {
                        $("div").removeClass("loading");
                    });
                    var listExamiationDetailsResult = [];
                    var listResult = [];
                    var listDiagnose = []

                    var token = sessionStorage.getItem("key");
                   
                    window.onload = function () {
                        
                        var dataTestRequestId = JSON.parse(localStorage.getItem("dataTestRequestId"));
                        var dataTestRequest = JSON.parse(localStorage.getItem("dataTestRequestId"));

                        var patientGender = sessionStorage.getItem("patientGender")
                        var typeGender = sessionStorage.getItem('typeGender')
                        var patientID = sessionStorage.getItem("patientID");
                        console.log(patientID + " patientID");

                        var namePackage = localStorage.getItem("namePackage");
                        var valueArray = [];
                        var arrayTotal = [];
                        var idExamination = dataTestRequestId[0].examinationId;
                        console.log(idExamination + " examinationID");
                        var testRequest = [];
                        var todayRating = moment().format("YYYY-MM-DDTHH:mm:ss");
                        var today = moment().format("YYYY-MM-DDTHH:mm:ss");
                        var dayExpire = moment().add(2, 'd').format("YYYY-MM-DD");
                        
                        $.ajax({
                            type: "GET",
                            dataType: "json",
                            contentType: "application/json; charset=UTF-8",
                            headers: {
                                 Authorization: 'Bearer ' + token
                            },
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/diseases/diseases/" +patientID,
                            success: function (data) {
                                var mainData = [];
                                console.log(data);
                                data.forEach(element => {
                                    var dataShow = new Object();
                                    dataShow.name = element.name;
                                    dataShow.description = element.description;

                                    mainData.push(dataShow);
                                });
                                console.log(mainData);
                                table = $('#diseasesTable').DataTable({
                                    data: mainData,
                                    columns: [
                                        { data: 'name' },
                                        {
                                            data: 'description',"width": "70%",
                                        },
                                        
                                       
                                    ],
                                    "bDestroy": true,
                                    "bFilter": false,
                                    "bPaginate": false,
                                    "bInfo": false,
                                    "aaSorting": [],
                                    "bSort": false
                                   

                                });

                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(' Error in processing! ' + textStatus);
                            }

                        })
                        
                        $.ajax({
                            type: "GET",
                            dataType: "json",
                            contentType: "application/json; charset=UTF-8",
                            headers: {
                                Authorization: 'Bearer ' + token
                            },
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/examination-details/examination-detail/examination/" + idExamination + "?typeGender=" + typeGender,
                            success: function (data) {
                                $('#testPackageTable').DataTable({
                                    data: data,
                                    columns: [
                                        {
                                            data: 'test_name', "width": "15%",
                                        },
                                        {
                                            data: 'indexValueMin', "width": "15%",
                                            render: function (data, type, row, meta) {
                                                if (row.indexValueMin === -9999) {
                                                    return "Âm tính";
                                                } else {
                                                    return row.indexValueMin;
                                                }
                                            }
                                        },
                                        {
                                            data: 'indexValueMax', "width": "15%",
                                            render: function (data, type, row, meta) {
                                                if (row.indexValueMax === -9999) {
                                                    return "Âm tính";
                                                } else {
                                                    return row.indexValueMax;
                                                }
                                            }
                                        },

                                        {
                                            data: 'testId',
                                            render: function (data, type, row, meta) {
                                                return '<input id="inputResult' + data + '" onChange="createResult(' + data + ')" class="inputResult form-control" style="width:100%" type="number"></input>'
                                            }
                                        },
                                        {
                                            data: 'testId',
                                            render: function (data, type, row, meta) {
                                                return '<textarea id="inputDignose' + data + '" onfocus="createDiagnose(' + data + ')" style="width:100%" class="inputDiagnose form-control" type="text"></textarea>'
                                            }
                                        },
                                    ],
                                    "bDestroy": true,
                                    "bFilter": false,
                                    "bPaginate": false,
                                    "bInfo": false,
                                    "aaSorting": [],
                                    "bSort": false
                                });
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(' Error in processing! ' + textStatus);
                            }
                        });
                        $(document).on('click', '[id^="inputResult"]', function () {
                            $('.inputResult').removeClass('error');
                        });
                        $(document).on('click', '[id^="textArea"]', function () {
                            $('#textArea').removeClass('error');
                        });
                        $(document).on('click', '[id^="textArea1"]', function () {
                            $('#textArea1').removeClass('error');
                        });
                        $(document).on('click', '[id^="finishResult"]', function () {
                            if (listResult.length >= listDiagnose.length) {
                                for (var i = 0; i < listResult.length; i++) {
                                    if (listDiagnose.length === 0) {
                                        listResult[i].examinationId = idExamination;
                                        listExamiationDetailsResult.push(listResult[i]);
                                    }
                                    for (var j = 0; j < listDiagnose.length; j++) {
                                        listResult[i].examinationId = idExamination;
                                        if ((listResult[i].testId + '') === (listDiagnose[j].testId + '')) {
                                            listResult[i].diagnose = listDiagnose[j].dia;
                                        }
                                        listExamiationDetailsResult.push(listResult[i]);

                                    }
                                }
                            } else {
                                for (var i = 0; i < listDiagnose.length; i++) {
                                    for (var j = 0; j < listResult.length; j++) {
                                        listResult[i].examinationId = idExamination;
                                        if ((listDiagnose[i].testId + '') === (listResult[j].testId + '')) {
                                            listResult[i].diagnose = listDiagnose[j].dia;
                                        }
                                        listExamiationDetailsResult.push(listResult[i]);
                                    }
                                }
                            }

                            console.log('----------------------');
                            console.log(listExamiationDetailsResult);
                            //===============================tuan
                            var a = $('.inputResult');
                            $('.inputResult').removeClass('error');
                            $('#textArea').removeClass('error');
                            $('#textArea1').removeClass('error');
                            console.log(a.val());
                            var b = $('.inputResult').length;
                            var result = [];
                            var regexp = /^-?\d{1,4}(\.\d{1})?$/;
                            for (var i = 0; i < b; i++) {
                                if (regexp.test(a.eq(i).val())) {
                                    result.push(a.eq(i).val());
                                } else {
                                    $('.inputResult').addClass('error');
                                }
                            }
                            var sumDiagnose = document.getElementById("textArea").value;
                            var advise = document.getElementById("textArea1").value;

                            console.log(sumDiagnose);
                            console.log(advise);
                            console.log(idExamination);
                            if (sumDiagnose.length === 0 || sumDiagnose.length > 255) {
                                $('#textArea').addClass('error');
                                if (advise.length === 0 || advise.length > 255) {
                                    $('#textArea1').addClass('error');
                                }
                            } else if (advise.length === 0 || advise.length > 255) {
                                $('#textArea1').addClass('error');
                            } else {
                                $.ajax({
                                    type: "PUT",
                                    dataType: "json",
                                    contentType: "application/json; charset=UTF-8",
                                    headers: {
                                        Authorization: 'Bearer ' + token
                                    },
                                    data: JSON.stringify({
                                        "advise": advise,
                                        "diagnose": sumDiagnose,
                                        "examinationDetailRequests": listExamiationDetailsResult,
                                        "examinationId": idExamination
                                    }),
                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/examinations/examination",
                                    complete: function (jqXHR) {}
                                });
                                $.ajax({
                                    type: "POST",
                                    dataType: "json",
                                    contentType: "application/json; charset=UTF-8",
                                    headers: {
                                        Authorization: 'Bearer ' + token
                                    },
                                    data: JSON.stringify({
                                        "rate": 0,
                                        "comment": "",
                                        "examinationId": idExamination
                                    }),
                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/ratings/rating",
                                    complete: function (jqXHR) {
                                        if (jqXHR.status === 201 || jqXHR.status === 200) {
                                            alertify.alert('COMPLETE ✔');
                                            setTimeout(function () {
                                                window.location.href = "doctorCheckRequest.jsp";
                                            }, 1500);
                                        }
                                    }
                                });
                            }
                        });
                    };
                    function createResult(id) {
                        let result = new Object();
                        let temp = parseInt($('#inputResult' + id + '').val(), 10);
                        result.testId = id;
                        result.result = temp;
                        listResult.push(result);
                        console.log(listResult);
                    }

                    function createDiagnose(id) {
                        $("#diagnoseModal").modal('show')
                        var Dignose = $('#inputDignose' + id + '').val()
                        $('[id="txtTestPackageId"]').val(id)
                        $('[id="txtDiagnose"]').val(Dignose)
                        // let diagnose = new Object();
                        // let temp = $('#inputDignose' + id + '').val();
                        // diagnose.testId = id;
                        // diagnose.dia = temp;
                        // listDiagnose.push(diagnose)
                        // console.log(listDiagnose);
                    }

                    function fnSaveDiagnose() {
                        var TestPackageId = $('[id="txtTestPackageId"]').val()
                        var Diagnose = $('[id="txtDiagnose"]').val()
                        if(Diagnose !== undefined && Diagnose.length > 0) 
                        {
                            var diagnose = new Object()
                            diagnose.testId = TestPackageId
                            diagnose.dia = Diagnose
                            listDiagnose.push(diagnose)
                            $('#inputDignose' + TestPackageId + '').val(Diagnose)
                        }
                    }
                </script>
                </body>
                <!-- patients23:19-->

</html>