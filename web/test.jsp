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

            .sidebar-menu li#aTest a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            div.dropdown.dropdown-action{
                float: right;
            }
            #patientTable {
                width: 100% !important;
            }
            #description{
                display: none;    
            }
            div.table-responsive{
             table-layout: fixed;   
    width: 100% !important;
            }
            
        </style>
    </head>

    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-4 col-3">
                    <h4 class="page-title">Test Package</h4>
                </div>
                <div class="col-sm-8 col-9 text-right m-b-20">
                    <buttom class="btn btn btn-primary btn-rounded float-right" data-toggle="modal" data-target="#my-modal-add"><i class="fa fa-plus"></i> Add Test Package</buttom>
                </div>
            </div>
            
            <div class="row">
                <div class="col-md-12">
                    <div class="">
                        <table id="patientTable" class="table table-border table-striped custom-table datatable mb-0">
                            <thead>
                                <tr>
                                    <th style="width: 30%">Name</th>
                                    <th style="width: 30%">Description</th>
                                    <th style="width: 10%" class="text-right">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td id="name"></td>
                                    <td id="description"></td>
                                    <td class="text-right">
                                        <div class="dropdown dropdown-action">
                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" data-toggle="modal" data-target="#my-modal-Edit"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                <!--<a class="dropdown-item" href="edit-patient.jsp"><i class="fa fa-pencil m-r-5"></i> Edit</a>-->
                                                <a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_patient"><i class="fa fa-trash-o m-r-5"></i> Delete</a>
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
        
        <!-- The Modal ADD-->
        <div class="modal" id="my-modal-add" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Add Test Package</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="content">
                            <form id="myForm" >
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label>Name <span class="text-danger">*</span></label>
                                        <input class="form-control" id='inputName' name="name" type="text" >
                                        <span id='messageName'></span>
                                    </div>
                                     <div class="col-sm-6">
                                        <label><span class="text-danger">Price </span></label>
                                        <input class="form-control inputValue" id='price' name="price" type="number" step=".01" value="0">
                                        <span id='messageChildMin'></span>
                                    </div>                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <label>Description</label>
                                        <textarea  class="form-control" id='description' name="description"> </textarea>
                                        <span id='messageDes'></span>
                                    </div>                                    
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <button id="createTestIndex" type="button" class="btn btn-success">Create Test Package</button>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- The Modal Edit-->
        <div class="modal" id="my-modal-Edit" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Edit Test Package</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="content">
                            <form id="myForm" >
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label>Name <span class="text-danger">*</span></label>
                                        <input class="form-control" id='inputNameEdit' name="nameEdit" type="text" >
                                        <span id='messageNameEdit'></span>
                                    </div>
                                     <div class="col-sm-6">
                                        <label><span class="text-danger">Price </span></label>
                                        <input class="form-control inputValue" id='priceEdit' name="priceEdit" type="number" step=".01" value="0">
                                        <span id='messageChildMinEdit'></span>
                                    </div>                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <label>Description</label>
                                        <textarea  class="form-control" id='descriptionEdit' name="descriptionEdit"> </textarea>
                                        <span id='messageDesEdit'></span>
                                    </div>                                    
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <button id="updateTestIndex" type="button" class="btn btn-success">Update Test Package</button>
                    </div>
                </div>
            </div>
        </div>
        
        <%@include file="components/footer.html" %>
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
        <script>
            $(document).ready(function () {                
                var token = sessionStorage.getItem("key");
                var testName = localStorage.getItem("testName");
                var allDataPackage = JSON.parse(localStorage.getItem("allDataPackage"));
                testName = "";
                localStorage.setItem("testName", testName);
                $("#inputName").click(function () {
                    $('#inputName').removeClass('error');
                    document.getElementById('messageName').innerHTML = '';
                });
                $("#description").click(function () {
                    $('#description').removeClass('error');
                    document.getElementById('messageDes').innerHTML = '';
                });
                $("#createTestIndex").click(function (event) {
                    event.preventDefault();
                    $('#inputName').removeClass('error');
                    document.getElementById('messageName').innerHTML = '';
                    $('#description').removeClass('error');
                    document.getElementById('messageDes').innerHTML = '';
                    var count = 0;
                    var name = $("input[name='name']").val(); //lấy giá trị trong input user
                    var price = $("input[name='price']").val(); //lấy giá trị trong input user
                    var description = $("textarea[name='description']").val();
                    for (var i = 0; i < allDataPackage.length; i++) {
                        if (allDataPackage[i].name === name) {
                            count = 1;
                        }
                    }
                    if (name.length === 0) {
                        $('#inputName').addClass('error');
                        document.getElementById('messageName').style.color = 'red';
                        document.getElementById('messageName').innerHTML = 'Name is empty ✘';
                        if (description.length > 255) {
                            $('#description').addClass('error');
                            document.getElementById('messageDes').style.color = 'red';
                            document.getElementById('messageDes').innerHTML = 'Description must be less than 255 letters ✘';
                        }
                    } else if (name.length > 50) {
                        $('#inputName').addClass('error');
                        document.getElementById('messageName').style.color = 'red';
                        document.getElementById('messageName').innerHTML = 'Name must be less than 30 letters ✘';
                        if (description.length > 255) {
                            $('#description').addClass('error');
                            document.getElementById('messageDes').style.color = 'red';
                            document.getElementById('messageDes').innerHTML = 'Description must be less than 255 letters ✘';
                        }
                    } else if (count === 1) {
                        $('#inputName').addClass('error');
                        document.getElementById('messageName').style.color = 'red';
                        document.getElementById('messageName').innerHTML = 'Name already exists ✘';
                        if (description.length > 255) {
                            $('#description').addClass('error');
                            document.getElementById('messageDes').style.color = 'red';
                            document.getElementById('messageDes').innerHTML = 'Description must be less than 255 letters ✘';
                        }
                    } else if (description.length > 255) {
                        $('#description').addClass('error');
                        document.getElementById('messageDes').style.color = 'red';
                        document.getElementById('messageDes').innerHTML = 'Description must be less than 255 letters ✘';
                    } else {
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            data: JSON.stringify({
                                "name": name,
                                "price": price,
                                "description": description,
                                "status": "enable"
                            }),
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/packages/package",
                            complete: function (jqXHR) {
                                console.log(jqXHR.status);
                                if (jqXHR.status === 201 || jqXHR.status === 200) {
                                    alertify.alert('Create Successfully!');
                                  setTimeout(function(){
                                        window.location.href = "test.jsp";
                                  },1500);
                                }
                            }
                        });
                    }
                });
            });
            
            $("#my-modal-Edit").on('shown.bs.modal', function (e) {
                var token = sessionStorage.getItem("key");
                var testName = localStorage.getItem("testName");
                var allDataPackage = JSON.parse(localStorage.getItem("allDataPackage"));
                var dataPackage = JSON.parse(localStorage.getItem("dataPackage"));
                console.log(dataPackage);
                testName = "";
                localStorage.setItem("testName", testName);
                //For Edit test package
                $("#inputNameEdit").click(function () {
                    $('#inputNameEdit').removeClass('error');
                    document.getElementById('messageNameEdit').innerHTML = '';
                });
                $("#descriptionEdit").click(function () {
                    $('#descriptionEdit').removeClass('error');
                    document.getElementById('messageDesEdit').innerHTML = '';
                });
                $("#inputNameEdit").val(dataPackage.name);
                $("#descriptionEdit").val(dataPackage.description);
                $("#updateTestIndex").click(function (event) {
                    event.preventDefault();
                    $('#inputNameEdit').removeClass('error');
                    document.getElementById('messageNameEdit').innerHTML = '';
                    $('#descriptionEdit').removeClass('error');
                    document.getElementById('messageDesEdit').innerHTML = '';
                    var count = 0;
                    var name = $("input[name='nameEdit']").val(); //lấy giá trị trong input user
                    var price = $("input[name='priceEdit']").val(); //lấy giá trị trong input user
                    var description = $("textarea[name='descriptionEdit']").val();
                    for (var i = 0; i < allDataPackage.length; i++) {
                        if (allDataPackage[i].name === name && name !== dataPackage.name) {
                            count = 1;
                        }
                    }
                    if (name.length === 0) {
                        $('#inputNameEdit').addClass('error');
                        document.getElementById('messageNameEdit').style.color = 'red';
                        document.getElementById('messageNameEdit').innerHTML = 'Name is empty ✘';
                        if (description.length > 255) {
                            $('#descriptionEdit').addClass('error');
                            document.getElementById('messageDesEdit').style.color = 'red';
                            document.getElementById('messageDesEdit').innerHTML = 'Description must be less than 255 letters ✘';
                        }
                    } else if (name.length > 50) {
                        $('#inputNameEdit').addClass('error');
                        document.getElementById('messageNameEdit').style.color = 'red';
                        document.getElementById('messageNameEdit').innerHTML = 'Name must be less than 50 letters ✘';
                        if (description.length > 255) {
                            $('#descriptionEdit').addClass('error');
                            document.getElementById('messageDesEdit').style.color = 'red';
                            document.getElementById('messageDesEdit').innerHTML = 'Description must be less than 255 letters ✘';
                        }
                    } else if (count === 1) {
                        $('#inputNameEdit').addClass('error');
                        document.getElementById('messageNameEdit').style.color = 'red';
                        document.getElementById('messageNameEdit').innerHTML = 'Name already exists ✘';
                        if (description.length > 255) {
                            $('#descriptionEdit').addClass('error');
                            document.getElementById('messageDesEdit').style.color = 'red';
                            document.getElementById('messageDesEdit').innerHTML = 'Description must be less than 255 letters ✘';
                        }
                    } else if (description.length > 255) {
                        $('#descriptionEdit').addClass('error');
                        document.getElementById('messageDesEdit').style.color = 'red';
                        document.getElementById('messageDesEdit').innerHTML = 'Description must be less than 255 letters ✘';
                    } else {
                        $.ajax({
                            type: "PUT",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            data: JSON.stringify({
                                "id": dataPackage.id,
                                "name": name,
                                "price": price,
                                "description": description,
                                "status": "enable"
                            }),
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/packages/package",
                            complete: function (jqXHR) {
                                console.log(jqXHR.status);
                                if (jqXHR.status === 200) {
                                    alertify.alert('Update Successfully ✔');
                                        setTimeout(function(){
                                            window.location.href = "test.jsp";
                                    },1500);
                                    
                                }
                            }
                        });
                    }
                });
            });
        </script>
        <script type="text/javascript">
            window.onload = function () {
                var token = sessionStorage.getItem("key");
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {Authorization: 'Bearer ' + token},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/packages/packages",
                    success: function (data) {
                        var a = JSON.stringify(data);
                        localStorage.setItem("allDataPackage", JSON.stringify(data));
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
                                    sessionStorage.setItem("packageName", value.name);
                                    localStorage.setItem("dataPackage", JSON.stringify(value));
                                }
                            });
                        }
                        );
                        $('td').click(function () {
                            var row_index = $(this).parent().index();
                        });
                        var b = JSON.parse(a);
                        $('#patientTable').DataTable({
                            data: b,
                            columns: [
                                {data: 'name'},
                                {data: 'description'},
                                {
                                    defaultContent: '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a href = "#" class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a class = "dropdown-item" href = "test-detail.jsp"> <i class="fa fa-plus"></i> View Package Detail</a><a class = "dropdown-item" data-toggle="modal" data-target="#my-modal-Edit"> <i class = "fa fa-pencil m-r-5" > </i> Edit</a></div></div></td>'
                                }
                            ],
                            "bDestroy": true,
                            "bFilter": true,
                            "aaSorting": [],
                            "bSort": false
                            
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