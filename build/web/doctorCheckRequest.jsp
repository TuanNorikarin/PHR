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
                <!--                <div class="col-sm-8 col-9 text-right m-b-20">
                                    <a href="add-testPackage.jsp" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Test Package</a>
                                </div>-->
            </div>
            <!--            <form role="form" id="form-buscar">
                            <div class="form-group">
                                <div class="input-group ">
                                    <input id="1" class="custom-seach " type="text" name="search" placeholder="Search..." required/>
                                    <span class="input-group-btn">
                                        &nbsp;
                                        <button class="btn btn-success custom-btn " type="submit">
                                            <i class="fa fa-search"></i> Search
                                        </button>
                                    </span>
                                </div>
                            </div>
                        </form>-->
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table id="checkRequestTable" class="table table-border table-striped custom-table datatable mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 25%">Patient</th>

                                    <th style="width: 30%">Type</th>
                                    <!--<th style="width: 30%">Time</th>-->
                                    <th style="width: 10%">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="name"></td>

                                    <td id="description"></td>
                                    <!--<td id="date"></td>-->

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
//            =========================================   =====================================
            window.onload = function () {
                var token = localStorage.getItem("key");
                var id = localStorage.getItem("userId");
                var arrayTestRequest = [];
                var arrayTestRequestTotal = [];
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/examinations/examination/6",
                    success: function (data) {
                        var a = JSON.stringify(data);
        
//        ============================= Select to Update========================================
                         $('#patientTable tbody').on('click', 'td', function ()
                        {
                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("patientTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[0];
                            txtValue = td.textContent;
                            $.each(data, function (index, value) {
                                if (value.name === txtValue) {
                                    localStorage.setItem("dataPackage", JSON.stringify(value));
                                }
                            });

                        }
                        );
                        $('td').click(function () {
                            var row_index = $(this).parent().index();

                        });
//=================================================================================================



                        var b = JSON.parse(a);
                        console.log(b);
                        console.log(a);
                        $('#checkRequestTable').DataTable({
                            data: b,
                            columns: [
                                {data: 'patientName'},
                                {data: 'type'},
                                {
                                    defaultContent: '<td><button class="inputResult"> <a> Select</a> </button></td>'

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
                        console.log(' Error in processing! ' + textStatus);
                    }

                })
            };



        </script>
    </body>


    <!-- patients23:19-->
</html>