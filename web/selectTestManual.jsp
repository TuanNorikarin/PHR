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

            .sidebar-menu li#aTest a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }

            input#exampleCheck1.form-check-input{
                left: 90%;
                top: -12px;

            }
            .addButton{
                left: 30%;
                padding-top: 20px;
            }
            input[type=checkbox] {
                transform: scale(1.5);
                -ms-transform: scale(1.5);
                -webkit-transform: scale(1.5);

            }
            a:not([href]):not([tabindex]) {
                color: white;
                text-decoration: none;
            }
            #description{
                display: none;    
            }
            #indexTable {
                width: 100% !important;
            }

        </style>
    </head>

    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">All Test Indexes</h4>
                </div>

            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">

                        <table id="indexTable" class="table table-border table-striped custom-table datatable mb-0">

                            <thead>
                                <tr>
                                    <th style="width: 20%">Name</th>
                                    <th id="description" style="width: 30%">Description</th>
                                    <th style="width: 15%">Male Value</th>
                                    <th style="width: 15%">FeMale Value</th>
                                    <th style="width: 15%">Children Value</th>
                                    <th style="width: 5%" class="text-right">Select</th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr> 

                                    <td id="name"></td>
                                    <td id="description"></td>
                                    <td id="maleVal"></td>
                                    <td id="femaleVal"></td>
                                    <td id="childVal"></td>
                                    <td  class="text-right">
                                        <div class="form-check">
                                            <input type="checkbox" class="form-check-input" id="exampleCheck">

                                        </div>
                                    </td>
                                </tr>



                            </tbody>
                        </table>
                    </div>
                </div>
                <div class="col-sm-8 col-9 text-right m-b-20 addButton">
                    <a id="addTest"  class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Create Examination</a>
                </div>
            </div>
        </div>
        <%@include file="components/recepFooter.html" %>
        <script src="assets/js/jquery-3.2.1.min.js"></script>
        <script src="assets/js/popper.min.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.slimscroll.js"></script>
        <script src="assets/js/select2.min.js"></script>
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap4.min.js"></script>
        <script src="assets/js/moment.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script type="text/javascript">

            window.onload = function () {
                var token = localStorage.getItem("key");
                var testName = localStorage.getItem("testName");
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/testresultsample/getall",
                    success: function (data) {
                        var valueArray = [];
                        var valueArrayTotal = [];
                        var valueId = [];
                        var valueIdTotal = [];
                        var idData = null;
                        for (var i = 0; i < data.length; i++) {
                            if (data[i] !== undefined) {
                                valueArray.push(data[i].testId.name);
                                valueArray.push(data[i].testId.description);
                                valueId.push(data[i].testId.name);
                                valueId.push(data[i].testId.id);
                                if (data[i].type === 'Male') {
                                    valueArray.splice(2, 0, data[i].indexValueMin + " - " + data[i].indexValueMax);
                                    valueId.splice(2, 0, data[i].id);

                                }
                                if (data[i].type === 'Female') {
                                    valueArray.splice(3, 0, data[i].indexValueMin + " - " + data[i].indexValueMax);
                                    valueId.splice(3, 0, data[i].id);

                                }
                                if (data[i].type === 'Children') {
                                    valueArray.splice(4, 0, data[i].indexValueMin + " - " + data[i].indexValueMax);
                                    valueId.splice(4, 0, data[i].id);

                                }
                                idData = data[i].testId.id;
                                delete data[i];
                                for (var k = 0; k < data.length; k++) {
                                    if (data[k] !== undefined) {
                                        if (data[k].testId.id === idData) {
                                            if (data[k].type === 'Male') {
                                                valueArray.splice(2, 0, data[k].indexValueMin + " - " + data[k].indexValueMax);
                                                valueId.splice(2, 0, data[k].id);

                                            }
                                            if (data[k].type === 'Female') {
                                                valueArray.splice(3, 0, data[k].indexValueMin + " - " + data[k].indexValueMax);
                                                valueId.splice(3, 0, data[k].id);

                                            }
                                            if (data[k].type === 'Children') {
                                                valueArray.splice(4, 0, data[k].indexValueMin + " - " + data[k].indexValueMax);
                                                valueId.splice(4, 0, data[k].id);
                                            }
                                            delete data[k];

                                        }

                                    }
                                }
                                if (valueArray.length === 5) {
                                    valueArrayTotal.push(valueArray);
                                    valueArray = [];
                                } else if (valueArray.length === 4) {
                                    valueArrayTotal.push(valueArray);
                                    valueArray = [];
                                }
                                if (valueId.length === 5) {
                                    valueIdTotal.push(valueId);
                                    valueId = [];
                                }

                            }
                        }

                        var listId = [];
                        var arrayResult = [];
                        var containName = [];
                        var tmp = "";
                        var check = null;

                        var table = $('#indexTable').DataTable({
                            data: valueArrayTotal,
                            columns: [
                                {data: '0'},
                                {data: '1'},
                                {data: '2'},
                                {data: '3'},
                                {data: '4'},
                                {
                                    data: '0',
                                    render: function (data, type, row)
                                    {
                                        return '<td id="actionIcon" class="text-right"><div class="form-check"><input name="checkBox" type="checkbox" class="form-check-input" value="' + data + '"id="exampleCheck1"></div></td>'
                                    }
                                }
                            ],
                            "bDestroy": true,
                            "bFilter": true,
                            "createdRow": function (row, data, dataIndex) {
                                $('td:eq(1)', row).css('display', 'none');
                            }
                        });
                        var tableTMP = table;
//                        var page = 1;
                        var getData = "";
                        $('#indexTable').on('page.dt', function () {
                            var info = tableTMP.page.info();
//                            page = info.page + 1;
                            check = listId;

                        }).on('mouseenter', 'input', function () {
                            var resultTMP = "";
                            var checkboxTMP = document.getElementsByName('checkBox');
                            for (var i = 0; i < checkboxTMP.length; i++) {
                                if (checkboxTMP[i].checked === true) {
                                    resultTMP += checkboxTMP[i].value + ',';

                                }

                            }
                            getData = resultTMP;
                        });
                        $('#indexTable tbody').on('click', 'input', function ()
                        {
                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("indexTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[0];
                            txtValue = td.textContent;
                            containName = testName.toString().split(",");
                            var result = "";
                            var checkbox = document.getElementsByName('checkBox');
                            for (var i = 0; i < checkbox.length; i++) {
                                if (checkbox[i].checked === true) {
                                    result += checkbox[i].value + ',';
                                }

                            }
                            if (check) {

                                if (getData.length > result.length) {
                                    var split = result.split(",");
                                    for (var j = 0; j < split.length; j++) {
                                        getData = getData.replace(split[j], "");
                                        getData = getData.replace(",", "");
                                    }
                                    tmp = result;
                                    listId = tmp + check;
                                    for (var i = 0; i < 10; i++) {
                                        listId = listId.replace(getData, "");
                                    }
                                    check = listId;
                                } else {
                                    tmp += result;
                                    listId = tmp + check;

                                }

                            } else {
                                tmp = result;
                                listId = result;
                            }
                            arrayResult = listId.split(",");
                            Array.prototype.clean = function (deleteValue) {
                                for (var i = 0; i < this.length; i++) {
                                    if (this[i] === deleteValue) {
                                        this.splice(i, 1);
                                        i--;
                                    }
                                }
                                return this;
                            };
                            arrayResult.clean("");

                        }
                        );
                        function unique(arr) {
                            var newArr = []
                            for (var i = 0; i < arr.length; i++) {
                                if (newArr.indexOf(arr[i]) === -1) {
                                    newArr.push(arr[i])
                                }
                            }
                            return newArr;
                        }
                        $('#addTest').click(function (event) {
                            var dataArrayId = [];
                            var checkArray = unique(arrayResult);
                            for (var i = 0; i < checkArray.length; i++) {
                                for (var j = 0; j < valueIdTotal.length; j++) {
                                    if (valueIdTotal[j][0] === checkArray[i]) {
                                        dataArrayId.push(valueIdTotal[j][1]);
                                    }
                                }
                            }
                            console.log(dataArrayId);
                            localStorage.setItem("arrayIdTestForExam", dataArrayId);
                            window.location.href = "createExamination.jsp";

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