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

            .sidebar-menu li#aPatient a {
                color: #009efb;

                background-color: #e3e7e8;
            }
            div.dropdown.dropdown-action{
                float: right;

            }


        </style>
    </head>

    <%@include file="components/recepHeader.html" %>
    <%@include file="components/recepSidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">Patients List</h4>
                </div>
                <div class="col-sm-8 col-9 text-right m-b-20">
                    <a href="add-patientReceptionist.jsp" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Patient</a>
                </div>
            </div>
            <input id="searchPatient" class="custom-seach " type="text" name="search" placeholder=" Search by Phone" required/>
            <button id="buttonPatient">Search</button>
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">

                        <table id="patientTable" class="table table-border table-striped custom-table datatable mb-0">

                            <thead>
                                <tr>
                                    <th style="width: 3%">Avatar</th>
                                    <th style="width: 15%">Name</th>
                                    <th style="width: 14%">Date of Birth</th>
                                    <th style="width: 30%">Address</th>

                                    <th style="width: 10%">Phone</th>
                                    <th style="width: 5%">Email</th>
                                    <th style="width: 10%">Status</th>
                                    <th style="width: 3%" class="text-right">Action</th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr>

                                    <td id="avatar"></td>
                                    <td id="name"></td>
                                    <td id="dob"></td>
                                    <td id="address"></td>
                                    <td id="phoneNum"></td>

                                    <td id="email"></td>
                                    <td id="status"></td>


                                    <td  class="text-right">
                                        <div class="dropdown dropdown-action">
                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                            <div id="d" class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="edit-patient.jsp"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_patient"><i class="fa fa-check-square"></i> Delete</a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>



                            </tbody>
                        </table>
                    </div>
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
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
        <script src="assets/js/app.js"></script>
        <script type="text/javascript">
//            function searchFunction() {
//                var input, filter, table, tr, nameSearch, i, txtValue, phoneSearch;
//                input = document.getElementById("searchPatient");
//                filter = input.value.toUpperCase();
//                table = document.getElementById("patientTable");
//                tr = table.getElementsByTagName("tr");
//                for (i = 0; i < tr.length; i++) {
//                    nameSearch = tr[i].getElementsByTagName("td")[0];
//                    phoneSearch = tr[i].getElementsByTagName("td")[3];
//                    if (nameSearch || phoneSearch) {
//                        txtValueName = nameSearch.textContent || nameSearch.innerText;
//                        txtValuePhone = phoneSearch.textContent || phoneSearch.innerText;
//                        if (txtValueName.toUpperCase().indexOf(filter) > -1) {
//                            tr[i].style.display = "";
//                        } else if (txtValuePhone.toUpperCase().indexOf(filter) > -1) {
//                            tr[i].style.display = "";
//                        } else {
//                            tr[i].style.display = "none";
//                        }
//                    }
//                }
//            }
//            ;
            window.onload = function () {
                var token = localStorage.getItem("key");
                var clinicId = localStorage.getItem("clinicId");
                var tableData = "";
                $('#buttonPatient').on('click', function ()
                {
                    var count = 0;
                    var searchPatientValue = $('#searchPatient').val();
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        headers: {
                            Authorization: 'Bearer ' + token},
                        url: "https://bt-application.herokuapp.com/api/userinfor/roleid/3",
                        success: function (data) {
                            var arraySearch = [];
                            if (tableData.$.length === 0) {
                                tableData.destroy();
                                tableData.rows().remove().draw();
                            }

                            for (var i = 0; i < data.length; i++) {
                                if (data[i].phone === searchPatientValue) {
                                    $('#patientTable tbody').on('click', 'td', function ()
                                    {
                                        var tr = $(this).closest("tr");
                                        var rowindex = tr.index();
                                        table = document.getElementById("patientTable");
                                        tr = table.getElementsByTagName("tr");
                                        td = tr[rowindex + 1].getElementsByTagName("td")[4];
                                        txtValue = td.textContent;
                                        $.each(data, function (index, value) {
                                            if (value.phone === txtValue) {
                                                localStorage.setItem("dataPat", JSON.stringify(value));
                                            }
                                        });

                                    }
                                    );
                                    count++;
                                    arraySearch.push(data[i]);
                                    tableData = $('#patientTable').DataTable({
                                        data: arraySearch,
                                        columns: [
                                            {data: "image",
                                                "render": function (data, type, row, meta) {
                                                    return '<img width="35" height="35" src="' + data + '" class="rounded-circle m-r-5">';
                                                }},
                                            {data: 'fullname'},
                                            {data: 'dob'},
                                            {data: 'address'},
                                            {data: 'phone'},
                                            {data: 'mail'},
                                            {data: 'status'},
                                            {
                                                defaultContent: '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a href = "" class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a class = "dropdown-item" href = "selectService.jsp"><i class="fa fa-check-square"></i> &nbsp; Select Patient</a ><a class = "dropdown-item" href = "edit-patientReceptionist.jsp"> <i class = "fa fa-pencil m-r-5" > </i> Edit</a></div></div></td>'

                                            },
                                        ],
                                        "bDestroy": true,
                                        "bFilter": true,
                                        language: {
                                            search: 'Search:',
                                            searchPlaceholder: ""
                                        },
                                        "createdRow": function (row, data, dataIndex) {
                                            if (data.status === "Inactive") {
                                                $('td', row).css('color', '#b5b5b5');
                                                $('td', row).css('font-style', 'italic');
                                            }
                                            if (data.status === "Active") {
                                                $('td:eq(6)', row).css('color', '#2a9c31');
                                                $('td:eq(6)', row).css('font-weight', 'bolder');

                                            }
                                        }


                                    });
                                }
                            }
                            if (count === 0) {
                                tableData = $('#patientTable').dataTable({
                                    data: arraySearch,
                                    columns: [
                                        {data: "image",
                                            "render": function (data, type, row, meta) {
                                                return '<img width="35" height="35" src="' + data + '" class="rounded-circle m-r-5">';
                                            }},
                                        {data: 'fullname'},
                                        {data: 'dob'},
                                        {data: 'address'},
                                        {data: 'phone'},
                                        {data: 'mail'},
                                        {data: 'status'},
                                        {
                                            defaultContent: '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a href = "" class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a class = "dropdown-item" href = "selectService.jsp"><i class="fa fa-check-square"></i> &nbsp; Select Patient</a ><a class = "dropdown-item" href = "edit-patientReceptionist.jsp"> <i class = "fa fa-pencil m-r-5" > </i> Edit</a></div></div></td>'

                                        },
                                    ],
                                    "bDestroy": true,
                                    "bFilter": true,
                                    language: {
                                        "language": {
                                            "emptyTable": "No data available in table"
                                        }
                                    },
                                    "createdRow": function (row, data, dataIndex) {
                                        if (data.status === "Inactive") {
                                            $('td', row).css('color', '#b5b5b5');
                                            $('td', row).css('font-style', 'italic');
                                        }
                                        if (data.status === "Active") {
                                            $('td:eq(6)', row).css('color', '#2a9c31');
                                            $('td:eq(6)', row).css('font-weight', 'bolder');

                                        }
                                    }

                                });
                            }
                        }});
                });

                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "https://bt-application.herokuapp.com/api/examination/findbyclinicid/" + clinicId,
                    success: function (data) {
                        var a = JSON.stringify(data);
                        $('#patientTable tbody').on('click', 'td', function ()
                        {
                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("patientTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[4];
                            txtValue = td.textContent;
                            $.each(data, function (index, value) {
                                if (value.userId.phone === txtValue) {
                                    console.log(value.userId);
                                    localStorage.setItem("dataPat", JSON.stringify(value.userId));
                                }
                            });

                        }
                        );
                        $('td').click(function () {
                            var row_index = $(this).parent().index();

                        });
//                                   



                        var b = JSON.parse(a);
                        var uniqueArray = b
                                .map(v => v['userId'])
                                .map(v => v['id'])
                                .map((v, i, array) => array.indexOf(v) === i && i)
                                .filter(v => b[v])
                                .map(v => b[v]);
                        tableData = $('#patientTable').DataTable({
                            data: uniqueArray,
                            columns: [
                                {data: "userId.image",
                                    "render": function (data, type, row, meta) {
                                        return '<img width="35" height="35" src="' + data + '" class="rounded-circle m-r-5">';
                                    }},
                                {data: 'userId.fullname'},
                                {data: 'userId.dob'},
                                {data: 'userId.address'},
                                {data: 'userId.phone'},
                                {data: 'userId.mail'},
                                {data: 'userId.status'},
                                {
                                    defaultContent: '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a href = "" class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a class = "dropdown-item" href = "selectService.jsp"><i class="fa fa-check-square"></i> &nbsp; Select Patient</a ><a class = "dropdown-item" href = "edit-patientReceptionist.jsp"> <i class = "fa fa-pencil m-r-5" > </i> Edit</a></div></div></td>'

                                },
                            ],
                            "bDestroy": true,
                            "bFilter": true,
                            language: {
                                search: 'Search:',
                                searchPlaceholder: ""
                            },
                            "createdRow": function (row, data, dataIndex) {
                                if (data.userId.status === "Inactive") {
                                    $('td', row).css('color', '#b5b5b5');
                                    $('td', row).css('font-style', 'italic');
                                    $('td:eq(7)', row).css('display', 'none');
                                    
                                }
                                if (data.userId.status === "Active") {
                                    $('td:eq(6)', row).css('color', '#2a9c31');
                                    $('td:eq(6)', row).css('font-weight', 'bolder');

                                }
                            }


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