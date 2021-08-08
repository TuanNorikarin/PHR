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

            .sidebar-menu li#aTestIndex a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }
            div.dropdown.dropdown-action{
                float: right;
            }
            #description{
                display: none;    
            }
            #indexTable {
                width: 100% !important;
            }

        </style>
    </head>

    <%@include file="components/header.html" %>
    <%@include file="components/sidebar.html" %>

    <div class="page-wrapper">
        <div class="content">
            <div class="row">
                <div class="col-sm-2 col-3">
                    <h4 class="page-title">All Test Indexes</h4>
                </div>
                 <div class="col-sm-6 col-3">
                     <label><h4>Choose Children value</h4></label>
                     <select>
                         <option value="children">Children</option>
                         <option value="adult">Adult</option>
                     </select>
                </div>
                <div class="col-sm-4 col-3 text-right m-b-20">
                    <buttom class="btn btn btn-primary btn-rounded float-right" data-toggle="modal" data-target="#my-modal-add"><i class="fa fa-plus"></i> Add Test Index</buttom>
                </div>
                <!--<div class="col-sm-4 col-3 text-right m-b-20">
                    <a href="add-testIndex.jsp" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add Test Index</a>
                </div>-->
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="">

                        <table id="indexTable" class="table table-border table-striped custom-table datatable mb-0">

                            <thead>
                                <tr>
                                    <th style="width: 20%">Name</th>
                                    <!--<th id='description' style="width: 30%">Description</th>-->
                                    <th style="width: 15%">Male Value</th>
                                    <th style="width: 15%">FeMale Value</th>
                                    <th style="width: 15%">Price</th>
                                    <th style="width: 5%" class="text-right">Action</th>
                                </tr>
                            </thead>

                            <tbody>

                                <tr> 

                                    <td id="name"></td>
                                    <!--<td id="description"></td>-->
                                    <td id="maleVal"></td>
                                    <td id="femaleVal"></td>
                                    <td id="priceVal"></td>
                                    <td  class="text-right">
                                        <div class="dropdown dropdown-action">
                                            <a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-ellipsis-v"></i></a>
                                            <div id="d" class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" data-toggle="modal" data-target="#my-modal-Edit"><i class="fa fa-pencil m-r-5"></i> Edit</a>
                                                <!--<a class="dropdown-item" href="edit-testIndex.jsp"><i class="fa fa-pencil m-r-5"></i> Edit</a>-->
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
                        <h4 class="modal-title">Add Test Index</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="content">
                            <form id="myForm" >
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <label>Name <span class="text-danger">*</span></label>
                                        <input class="form-control" id='inputName' name="name" type="text" >
                                        <span id='messageName'></span>
                                    </div>                                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12"><label><span class="text-danger">Adult</span></label></div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label>Male Value Min. </label>
                                        <input class="form-control inputValue" id='maleMin' name="maleMin" type="number" step=".01" value="0">
                                        <span id='messageMaleMin'></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Male Value Max. </label>
                                        <input class="form-control inputValue" id='maleMax' name="maleMax" type="number" step=".01" value="0">
                                        <span id='messageMaleMax'></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label>Female Value Min. </label>
                                        <input class="form-control inputValue" id='femaleMin' name="femaleMin" type="number" step=".01" value="0">
                                        <span id='messageFemaleMin'></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Female Value Max. </label>
                                        <input class="form-control inputValue" id='femaleMax' name="femaleMax" type="number" step=".01" value="0">
                                        <span id='messageFemaleMax'></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12"><label><span class="text-danger">Children </span></label></div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label>Male Value Min. </label>
                                        <input class="form-control inputValue" id='childMinMale' name="childMinMale" type="number" step=".01" value="0">
                                        <span id='messageChildMinMale'></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Male Value Max. </label>
                                        <input class="form-control inputValue" id='childMaxMale' name="childMaxMale" type="number" step=".01" value="0">
                                        <span id='messageChildMaxMale'></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label>Female Value Min. </label>
                                        <input class="form-control inputValue" id='childMinFemale' name="childMinFemale" type="number" step=".01" value="0">
                                        <span id='messageChildMinFemale'></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Female Value Max. </label>
                                        <input class="form-control inputValue" id='childMaxFemale' name="childMaxFemale" type="number" step=".01" value="0">
                                        <span id='messageChildMaxFemale'></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label><span class="text-danger">Price </span></label>
                                        <input class="form-control inputValue" id='price' name="price" type="number" step=".01" value="0">
                                        <span id='messagePrice'></span>
                                    </div> 
                                    <div class="col-sm-6">
                                        <label>Description</label>
                                        <textarea style="resize:none" class="form-control" id='description' name="description"> </textarea>
                                        <span id='messageDes'></span>
                                    </div> 
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <button id="createTestIndex" type="button" class="btn btn-success">Create Test Index</button>
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
                        <h4 class="modal-title">Edit Test Index</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="content">
                            <form id="myForm" >
                                <div class="form-group row">
                                    <div class="col-sm-12">
                                        <label>Name <span class="text-danger">*</span></label>
                                        <input class="form-control" id='inputNameEdit' name="nameEdit" type="text" >
                                        <span id='messageNameEdit'></span>
                                    </div>                                                    
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12"><label><span class="text-danger">Adult</span></label></div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label>Male Value Min. </label>
                                        <input class="form-control inputValue" id='maleMinEdit' name="maleMinEdit" type="number" step=".01" value="0">
                                        <span id='messageMaleMinEdit'></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Male Value Max. </label>
                                        <input class="form-control inputValue" id='maleMaxEdit' name="maleMaxEdit" type="number" step=".01" value="0">
                                        <span id='messageMaleMaxEdit'></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label>Female Value Min. </label>
                                        <input class="form-control inputValue" id='femaleMinEdit' name="femaleMinEdit" type="number" step=".01" value="0">
                                        <span id='messageFemaleMinEdit'></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Female Value Max. </label>
                                        <input class="form-control inputValue" id='femaleMaxEdit' name="femaleMaxEdit" type="number" step=".01" value="0">
                                        <span id='messageFemaleMaxEdit'></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-12"><label><span class="text-danger">Children </span></label></div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label>Male Value Min. </label>
                                        <input class="form-control inputValue" id='childMinMaleEdit' name="childMinMaleEdit" type="number" step=".01" value="0">
                                        <span id='messageChildMinMaleEdit'></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Male Value Max. </label>
                                        <input class="form-control inputValue" id='childMaxMaleEdit' name="childMaxMaleEdit" type="number" step=".01" value="0">
                                        <span id='messageChildMaxMaleEdit'></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label>Female Value Min. </label>
                                        <input class="form-control inputValue" id='childMinFemaleEdit' name="childMinFemaleEdit" type="number" step=".01" value="0">
                                        <span id='messageChildMinFemaleEdit'></span>
                                    </div>
                                    <div class="col-sm-6">
                                        <label>Female Value Max. </label>
                                        <input class="form-control inputValue" id='childMaxFemaleEdit' name="childMaxFemaleEdit" type="number" step=".01" value="0">
                                        <span id='messageChildMaxFemaleEdit'></span>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6">
                                        <label><span class="text-danger">Price </span></label>
                                        <input class="form-control inputValue" id='priceEdit' name="priceEdit" type="number" step=".01" value="0">
                                        <span id='messagePriceEdit'></span>
                                    </div> 
                                    <div class="col-sm-6">
                                        <label>Description</label>
                                        <textarea style="resize:none" class="form-control" id='descriptionEdit' name="descriptionEdit"> </textarea>
                                        <span id='messageDesEdit'></span>
                                    </div> 
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <button id="updateTestIndex" type="button" class="btn btn-success">Edit Test Index</button>
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
        <script src="assets/js/app.js"></script>
        <script type="text/javascript">
            
            window.onload = function () {
                var token = sessionStorage.getItem("key");
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/tests/test-indexs",
                    success: function (data) {
                        var mainData = [];
                        console.log(data);
                        data.forEach(element => {
                            var dataShow = new Object();
                            dataShow.id = element.id;
                            dataShow.name = element.name;
                            dataShow.description = element.description;

                            dataShow.maleIndex = '-';
                            dataShow.femaleindex = '-';
                            dataShow.price = element.price;
//                                console.log(dataShow.id);
                            element.samplelst.forEach(e => {
                                if (e.type === 'Male' || e.type === 'male') {
                                    dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                } else if (e.type === 'Female' || e.type === 'female') {
                                    dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                } 
                                //else if (e.type === 'Child-Male') {
                                //    dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                //}else if (e.type === 'Child-Female') {
                                //    dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                //}
                            });
                            mainData.push(dataShow);
                        });
                        localStorage.setItem("allTestIndex", JSON.stringify(mainData));
                        $('#indexTable tbody').on('click', 'td', function ()
                        {
                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("indexTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[0];
                            txtValue = td.textContent;
                            
                            $.each(mainData, function (index, value,) {
                                if (value[0] === txtValue) {
                                    localStorage.setItem("dataTest", value);
                                }
                            });
                            $.each(mainData, function (index, value) {
                                console.log(value);
                                if (value[0] === txtValue) {
                                    localStorage.setItem("dataTestId", value);
                                }
                            });
                        }
                    );
                    $('td').click(function () {
                        var row_index = $(this).parent().index();

                    });          

//                      valueArrayTotal -> mainData
                        $('#indexTable').DataTable({
                            data: mainData,
                            columns: [
                                { data: 'name' },

                                {
                                    data: 'maleIndex',
                                    render: function (data, type, row, meta) {
                                        if ( row.maleIndex === '-9999--9999') {
                                            return "Âm tính";
                                        }else{
                                            return row.maleIndex;
                                        }
                                    }
                                },
                                {
                                    data: 'femaleindex',
                                    render: function (data, type, row, meta) {
                                        if ( row.femaleindex === '-9999--9999') {
                                            return "Âm tính";
                                        }else{
                                            return row.femaleindex;
                                        }
                                    }
                                },
                                {
                                    data: 'price',
                                    render: function (data, type, row, meta) {                                                
                                        return row.price;
                                    }
                                },
                                {   data: 'id',
                                    render: function (data, type, row, meta) {
                                        return '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a href = "#" class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a class = "dropdown-item" onclick="getTestId('+data+')"  data-toggle="modal" data-target="#my-modal-Edit"> <i class = "fa fa-pencil m-r-5" > </i> Edit</a>  </div></div></td>'
                                    }

                                }
                            ],
                            "bDestroy": true,
                            "bFilter": true,
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }

                })
            };
            function getTestId(data){
                localStorage.setItem("dataTestID", JSON.stringify(data));
            }
        </script>

        <script> 
            $(document).ready(function () {
                var idGroup = "";
                var idMale = "";
                var idTest = "";
                var idFemale = "";
                var idChild =  "";
                var token = sessionStorage.getItem("key");
                $("#inputName").click(function () {
                    $('#inputName').removeClass('error');
                    document.getElementById('messageName').innerHTML = '';
                });
                $("#description").click(function () {
                    $('#description').removeClass('error');
                    document.getElementById('messageDes').innerHTML = '';
                });
                $("#maleMin").click(function () {
                    $('#maleMin').removeClass('error');
                    document.getElementById('messageMaleMin').innerHTML = '';
                });
                $("#maleMax").click(function () {
                    $('#maleMax').removeClass('error');
                    document.getElementById('messageMaleMax').innerHTML = '';
                });
                $("#femaleMin").click(function () {
                    $('#femaleMin').removeClass('error');
                    document.getElementById('messageFemaleMin').innerHTML = '';
                });
                $("#femaleMax").click(function () {
                    $('#femaleMax').removeClass('error');
                    document.getElementById('messageFemaleMax').innerHTML = '';
                });
                $("#childMin").click(function () {
                    $('#childMin').removeClass('error');
                    document.getElementById('messageChildMin').innerHTML = '';
                });
                $("#childMax").click(function () {
                    $('#childMax').removeClass('error');
                    document.getElementById('messageChildMax').innerHTML = '';
                });
                $("#createTestIndex").click(function (event) {
                    event.preventDefault();
                    $('#inputName').removeClass('error');
                    document.getElementById('messageName').innerHTML = '';
                    $('#description').removeClass('error');
                    document.getElementById('messageDes').innerHTML = '';
                    $('#maleMin').removeClass('error');
                    document.getElementById('messageMaleMin').innerHTML = '';
                    $('#maleMax').removeClass('error');
                    document.getElementById('messageMaleMax').innerHTML = '';
                    $('#femaleMin').removeClass('error');
                    document.getElementById('messageFemaleMin').innerHTML = '';
                    $('#femaleMax').removeClass('error');
                    document.getElementById('messageFemaleMax').innerHTML = '';
                    $('#childMinMale').removeClass('error');
                    document.getElementById('messageChildMinMale').innerHTML = '';
                    $('#childMaxMale').removeClass('error');
                    document.getElementById('messageChildMaxMale').innerHTML = '';
                    $('#childMinFemale').removeClass('error');
                    document.getElementById('messageChildMinFemale').innerHTML = '';
                    $('#childMaxFemale').removeClass('error');
                    document.getElementById('messageChildMaxFemale').innerHTML = '';
                    var regexp = /^-?\d{1,4}(\.\d{0,2})?$/;
                    var name = $("input[name='name']").val(); //lấy giá trị trong input user
                    var price = $("input[name='price']").val(); 
                    var description = $("textarea[name='description']").val();
                    var maleMin = $("input[name='maleMin']").val();
                    var maleMax = $("input[name='maleMax']").val();
                    var femaleMin = $("input[name='femaleMin']").val();
                    var femaleMax = $("input[name='femaleMax']").val();
                    var childMinMale = $("input[name='childMinMale']").val();
                    var childMaxMale = $("input[name='childMaxMale']").val();
                    var childMinFemale = $("input[name='childMinFemale']").val();
                    var childMaxFemale = $("input[name='childMaxFemale']").val();                    
                    var count = 0;                    
                    var allTestIndex = JSON.parse(localStorage.getItem("allTestIndex"));                    
                    for (var i = 0; i < allTestIndex.length; i++) {
                        if (allTestIndex[i][0] === name) {
                            count = 1;
                        }
                    }
                    if (name.length === 0 || name.length > 30) {
                        $('#inputName').addClass('error');
                        document.getElementById('messageName').style.color = 'red';
                        document.getElementById('messageName').innerHTML = 'Name must between (1-30) letter ✘';
                        if (description.length > 255) {
                            $('#description').addClass('error');
                            document.getElementById('messageDes').style.color = 'red';
                            document.getElementById('messageDes').innerHTML = 'Descreption must be less than 255 in length ✘';
                        }
                        if (!regexp.test(maleMin)) {
                            $('#maleMin').addClass('error');
                            document.getElementById('messageMaleMin').style.color = 'red';
                            document.getElementById('messageMaleMin').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(maleMax)) {
                            $('#maleMax').addClass('error');
                            document.getElementById('messageMaleMax').style.color = 'red';
                            document.getElementById('messageMaleMax').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(femaleMin)) {
                            $('#femaleMin').addClass('error');
                            document.getElementById('messageFemaleMin').style.color = 'red';
                            document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinMale)) {
                            $('#childMinMale').addClass('error');
                            document.getElementById('messageChildMinMale').style.color = 'red';
                            document.getElementById('messageChildMinMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxMale)) {
                            $('#childMaxMale').addClass('error');
                            document.getElementById('messageChildMaxMale').style.color = 'red';
                            document.getElementById('messageChildMaxMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinFemale)) {
                            $('#childMinFemale').addClass('error');
                            document.getElementById('messageChildMinFemale').style.color = 'red';
                            document.getElementById('messageChildMinFemale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxFemale)) {
                            $('#childMaxFemale').addClass('error');
                            document.getElementById('messageChildMaxFemale').style.color = 'red';
                            document.getElementById('messageChildMaxFemale').innerHTML = 'Value invalid ✘';
                        }
                    }
                    else if (count === 1) {
                        $('#inputName').addClass('error');
                        document.getElementById('messageName').style.color = 'red';
                        document.getElementById('messageName').innerHTML = 'Name already exists ✘';
                        if (description.length > 255) {
                            $('#description').addClass('error');
                            document.getElementById('messageDes').style.color = 'red';
                            document.getElementById('messageDes').innerHTML = 'Descreption must be less than 255 in length ✘';
                        }
                        if (!regexp.test(maleMin)) {
                            $('#maleMin').addClass('error');
                            document.getElementById('messageMaleMin').style.color = 'red';
                            document.getElementById('messageMaleMin').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(maleMax)) {
                            $('#maleMax').addClass('error');
                            document.getElementById('messageMaleMax').style.color = 'red';
                            document.getElementById('messageMaleMax').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(femaleMin)) {
                            $('#femaleMin').addClass('error');
                            document.getElementById('messageFemaleMin').style.color = 'red';
                            document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinMale)) {
                            $('#childMinMale').addClass('error');
                            document.getElementById('messageChildMinMale').style.color = 'red';
                            document.getElementById('messageChildMinMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxMale)) {
                            $('#childMaxMale').addClass('error');
                            document.getElementById('messageChildMaxMale').style.color = 'red';
                            document.getElementById('messageChildMaxMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinFemale)) {
                            $('#childMinFemale').addClass('error');
                            document.getElementById('messageChildMinFemale').style.color = 'red';
                            document.getElementById('messageChildMinFemale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMax)) {
                            $('#childMaxFemale').addClass('error');
                            document.getElementById('messageChildMaxFemale').style.color = 'red';
                            document.getElementById('messageChildMaxFemale').innerHTML = 'Value invalid ✘';
                        }
                    } 
                    else if (description.length > 255) {
                        $('#description').addClass('error');
                        document.getElementById('messageDes').style.color = 'red';
                        document.getElementById('messageDes').innerHTML = 'Descreption must be less than 255 in length ✘';

                        if (!regexp.test(maleMin)) {
                            $('#maleMin').addClass('error');
                            document.getElementById('messageMaleMin').style.color = 'red';
                            document.getElementById('messageMaleMin').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(maleMax)) {
                            $('#maleMax').addClass('error');
                            document.getElementById('messageMaleMax').style.color = 'red';
                            document.getElementById('messageMaleMax').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(femaleMin)) {
                            $('#femaleMin').addClass('error');
                            document.getElementById('messageFemaleMin').style.color = 'red';
                            document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinMale)) {
                            $('#childMinMale').addClass('error');
                            document.getElementById('messageChildMinMale').style.color = 'red';
                            document.getElementById('messageChildMinMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxMale)) {
                            $('#childMaxMale').addClass('error');
                            document.getElementById('messageChildMaxMale').style.color = 'red';
                            document.getElementById('messageChildMaxMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinFemale)) {
                            $('#childMinFemale').addClass('error');
                            document.getElementById('messageChildMinFemale').style.color = 'red';
                            document.getElementById('messageChildMinFemale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxFemale)) {
                            $('#childMaxFemale').addClass('error');
                            document.getElementById('messageChildMaxFemale').style.color = 'red';
                            document.getElementById('messageChildMaxFemale').innerHTML = 'Value invalid ✘';
                        }
                    } else if (!regexp.test(maleMin)) {
                        $('#maleMin').addClass('error');
                        document.getElementById('messageMaleMin').style.color = 'red';
                        document.getElementById('messageMaleMin').innerHTML = 'Value invalid ✘';
                        if (!regexp.test(maleMax)) {
                            $('#maleMax').addClass('error');
                            document.getElementById('messageMaleMax').style.color = 'red';
                            document.getElementById('messageMaleMax').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(femaleMin)) {
                            $('#femaleMin').addClass('error');
                            document.getElementById('messageFemaleMin').style.color = 'red';
                            document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinMale)) {
                            $('#childMinMale').addClass('error');
                            document.getElementById('messageChildMinMale').style.color = 'red';
                            document.getElementById('messageChildMinMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxMale)) {
                            $('#childMaxMale').addClass('error');
                            document.getElementById('messageChildMaxMale').style.color = 'red';
                            document.getElementById('messageChildMaxMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinFemale)) {
                            $('#childMinFemale').addClass('error');
                            document.getElementById('messageChildMinFemale').style.color = 'red';
                            document.getElementById('messageChildMinFemale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxFemale)) {
                            $('#childMaxFemale').addClass('error');
                            document.getElementById('messageChildMaxFemale').style.color = 'red';
                            document.getElementById('messageChildMaxFemale').innerHTML = 'Value invalid ✘';
                        }
                    } else if (!regexp.test(maleMax)) {
                        $('#maleMax').addClass('error');
                        document.getElementById('messageMaleMax').style.color = 'red';
                        document.getElementById('messageMaleMax').innerHTML = 'Value invalid ✘';

                        if (!regexp.test(femaleMin)) {
                            $('#femaleMin').addClass('error');
                            document.getElementById('messageFemaleMin').style.color = 'red';
                            document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinMale)) {
                            $('#childMinMale').addClass('error');
                            document.getElementById('messageChildMinMale').style.color = 'red';
                            document.getElementById('messageChildMinMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxMale)) {
                            $('#childMaxMale').addClass('error');
                            document.getElementById('messageChildMaxMale').style.color = 'red';
                            document.getElementById('messageChildMaxMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinFemale)) {
                            $('#childMinFemale').addClass('error');
                            document.getElementById('messageChildMinFemale').style.color = 'red';
                            document.getElementById('messageChildMinFemale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxFemale)) {
                            $('#childMaxFemale').addClass('error');
                            document.getElementById('messageChildMaxFemale').style.color = 'red';
                            document.getElementById('messageChildMaxFemale').innerHTML = 'Value invalid ✘';
                        }
                    } else if (!regexp.test(femaleMin)) {
                        $('#femaleMin').addClass('error');
                        document.getElementById('messageFemaleMin').style.color = 'red';
                        document.getElementById('messageFemaleMin').innerHTML = 'Value invalid ✘';

                        if (!regexp.test(femaleMax)) {
                            $('#femaleMax').addClass('error');
                            document.getElementById('messageFemaleMax').style.color = 'red';
                            document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinMale)) {
                            $('#childMinMale').addClass('error');
                            document.getElementById('messageChildMinMale').style.color = 'red';
                            document.getElementById('messageChildMinMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxMale)) {
                            $('#childMaxMale').addClass('error');
                            document.getElementById('messageChildMaxMale').style.color = 'red';
                            document.getElementById('messageChildMaxMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinFemale)) {
                            $('#childMinFemale').addClass('error');
                            document.getElementById('messageChildMinFemale').style.color = 'red';
                            document.getElementById('messageChildMinFemale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxFemale)) {
                            $('#childMaxFemale').addClass('error');
                            document.getElementById('messageChildMaxFemale').style.color = 'red';
                            document.getElementById('messageChildMaxFemale').innerHTML = 'Value invalid ✘';
                        }
                    } else if (!regexp.test(femaleMax)) {
                        $('#femaleMax').addClass('error');
                        document.getElementById('messageFemaleMax').style.color = 'red';
                        document.getElementById('messageFemaleMax').innerHTML = 'Value invalid ✘';

                        if (!regexp.test(childMinMale)) {
                            $('#childMinMale').addClass('error');
                            document.getElementById('messageChildMinMale').style.color = 'red';
                            document.getElementById('messageChildMinMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMaxMale)) {
                            $('#childMaxMale').addClass('error');
                            document.getElementById('messageChildMaxMale').style.color = 'red';
                            document.getElementById('messageChildMaxMale').innerHTML = 'Value invalid ✘';
                        }
                        if (!regexp.test(childMinFemale)) {
                            $('#childMinFemale').addClass('error');
                            document.getElementById('messageChildMinFemale').style.color = 'red';
                            document.getElementById('messageChildMinFemale').innerHTML = 'Value invalid ✘';
                        }                        
                        if (!regexp.test(childMaxFemale)) {
                            $('#childMaxFemale').addClass('error');
                            document.getElementById('messageChildMaxFemale').style.color = 'red';
                            document.getElementById('messageChildMaxFemale').innerHTML = 'Value invalid ✘';
                        }
                    } else if (!regexp.test(childMinMale)) {
                        $('#childMinMale').addClass('error');
                        document.getElementById('messageChildMinMale').style.color = 'red';
                        document.getElementById('messageChildMinMale').innerHTML = 'Value invalid ✘';

                        if (!regexp.test(childMaxMale)) {
                            $('#childMaxMale').addClass('error');
                            document.getElementById('messageChildMaxMale').style.color = 'red';
                            document.getElementById('messageChildMaxMale').innerHTML = 'Value invalid ✘';
                        }
                    } else if (!regexp.test(childMaxMale)) {
                        $('#childMaxMale').addClass('error');
                        document.getElementById('messageChildMaxMale').style.color = 'red';
                        document.getElementById('messageChildMaxMale').innerHTML = 'Value invalid ✘';
                    }else if (!regexp.test(childMinFemale)) {
                        $('#childMinFemale').addClass('error');
                        document.getElementById('messageChildMinFemale').style.color = 'red';
                        document.getElementById('messageChildMinFemale').innerHTML = 'Value invalid ✘';

                        if (!regexp.test(childMaxFemale)) {
                            $('#childMaxFemale').addClass('error');
                            document.getElementById('messageChildMaxFemale').style.color = 'red';
                            document.getElementById('messageChildMaxFemale').innerHTML = 'Value invalid ✘';
                        }
                    } else if (!regexp.test(childMaxFemale)) {
                        $('#childMaxFemale').addClass('error');
                        document.getElementById('messageChildMaxFemale').style.color = 'red';
                        document.getElementById('messageChildMaxFemale').innerHTML = 'Value invalid ✘';
                    } else if (parseFloat(maleMax) < parseFloat(maleMin)) {
                        console.log("a");
                        $('#maleMax').addClass('error');
                        document.getElementById('messageMaleMax').style.color = 'red';
                        document.getElementById('messageMaleMax').innerHTML = 'Value max less than value min ✘';
                    } else if (parseFloat(femaleMax) < parseFloat(femaleMin)) {
                        $('#femaleMax').addClass('error');
                        document.getElementById('messageFemaleMax').style.color = 'red';
                        document.getElementById('messageFemaleMax').innerHTML = 'Value max less than value min ✘';
                    } else if (parseFloat(childMaxMale) < parseFloat(childMinMale)) {
                        $('#childMaxMale').addClass('error');
                        document.getElementById('messageChildMaxMale').style.color = 'red';
                        document.getElementById('messageChildMaxMale').innerHTML = 'Value max less than value min ✘';
                    }else if (parseFloat(childMaxFemale) < parseFloat(childMinFemale)) {
                        $('#childMaxFemale').addClass('error');
                        document.getElementById('messageChildMaxFemale').style.color = 'red';
                        document.getElementById('messageChildMaxFemale').innerHTML = 'Value max less than value min ✘';
                    } else {                        
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: { Authorization: 'Bearer ' + token},
                            data: JSON.stringify({                              
                                "name": name,
                                "description": description,
                                "price": price,
                                "samplelst": [
                                    {
                                        "description": "",
                                        "indexValueMax": maleMax,
                                        "indexValueMin": maleMin,
                                        "type": "Male"
                                    },
                                    {
                                        "description": "",
                                        "indexValueMax": femaleMax,
                                        "indexValueMin": femaleMin,
                                        "type": "Female"
                                    },
                                    {
                                        "description": "",
                                        "indexValueMax": childMaxMale,
                                        "indexValueMin": childMinMale,
                                        "type": "Child-Male"
                                    },
                                    {
                                        "description": "",
                                        "indexValueMax": childMaxFemale,
                                        "indexValueMin": childMinFemale,
                                        "type": "Child-Female"
                                    }    
                                ],
                                "status": "enable"
                            }),
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/tests/test-index",
                            complete: function (jqXHR) {
//                                debugger
                                console.log(jqXHR.status);
                                if (jqXHR.status === 201 || jqXHR.status === 200) {
//                                    alert("Create Successfully!");
                                    alertify.alert('Create Successfully!');
                                    setTimeout(function(){
                                        window.location.href = "testIndex.jsp";
                                    },1500);
                                }
                                if (jqXHR.status === 409){
                                    $('#inputName').addClass('error');
                                    document.getElementById('messageName').style.color = 'red';
                                    document.getElementById('messageName').innerHTML = 'Name already exists ✘';
                                }
                            }
                        });
                    }
                });
            });
            
            $('select').on('change', function() {
                var _type = $(this).val();
                var token = sessionStorage.getItem("key");
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: {
                        Authorization: 'Bearer ' + token},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/tests/test-indexs",
                    success: function (data) {
                        var mainData = [];
                        console.log(data);
                        data.forEach(element => {                           

                            var dataShow = new Object();
                            dataShow.id = element.id;
//                          dataShow.testId = element.samplelst[0];
                            dataShow.name = element.name;
                            dataShow.description = element.description;

                            dataShow.maleIndex = '-';
                            dataShow.femaleindex = '-';
                            dataShow.price = element.price;
                            element.samplelst.forEach(e => {
                                if (_type === "adult") {
                                    if (e.type === 'Male' || e.type === 'male') {
                                        dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                    } else if (e.type === 'Female' || e.type === 'female') {
                                        dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                    }
                                }
                                else {
                                    if (e.type === 'Child-Male') {
                                        dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                    }else if (e.type === 'Child-Female') {
                                        dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                    }
                                }
                            });
                            mainData.push(dataShow);
                        });
                        
                        localStorage.setItem("allTestIndex", JSON.stringify(mainData));
                        var a = JSON.stringify(data);
                        var b = JSON.parse(a);
                        
                        $('#indexTable tbody').on('click', 'td', function ()
                        {
                            var tr = $(this).closest("tr");
                            var rowindex = tr.index();
                            table = document.getElementById("indexTable");
                            tr = table.getElementsByTagName("tr");
                            td = tr[rowindex + 1].getElementsByTagName("td")[0];
                            txtValue = td.textContent;
                            
                            $.each(mainData, function (index, value,) {
                                if (value[0] === txtValue) {
                                    localStorage.setItem("dataTest", value);
                                }
                            });
                            $.each(mainData, function (index, value) {
                                console.log(value);
                                if (value[0] === txtValue) {
                                    localStorage.setItem("dataTestId", value);
                                }
                            });

                        }
                        );
                        $('td').click(function () {
                            var row_index = $(this).parent().index();

                        });
                        $('#indexTable').DataTable({
                            data: mainData,
                            columns: [
                                { data: 'name' },

                                {
                                    data: 'maleIndex',
                                    render: function (data, type, row, meta) {
                                        if ( row.maleIndex === '-9999--9999') {
                                            return "Âm tính";
                                        }else{
                                            return row.maleIndex;
                                        }
                                    }
                                },
                                {
                                    data: 'femaleindex',
                                    render: function (data, type, row, meta) {
                                        if ( row.femaleindex === '-9999--9999') {
                                            return "Âm tính";
                                        }else{
                                            return row.femaleindex;
                                        }
                                    }
                                },
                                {
                                    data: 'price',
                                    render: function (data, type, row, meta) {                                                
                                        return row.price;
                                    }
                                },
                                {   data: 'id',
                                    render: function (data, type, row, meta) {
                                        return '<td id="actionIcon" class="text-right"><div class ="dropdown dropdown-action"><a href = "#" class="action-icon dropdown-toggle" data-toggle = "dropdown" aria-expanded = "false"> <i class = "fa fa-ellipsis-v" > </i></a><div id = "d" class = "dropdown-menu dropdown-menu-right" ><a class = "dropdown-item" onclick="getTestId('+data+')"  data-toggle="modal" data-target="#my-modal-Edit"> <i class = "fa fa-pencil m-r-5" > </i> Edit</a>  </div></div></td>'
                                    }
                                }
                            ],
                            "bDestroy": true,
                            "bFilter": true,

                        });

                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }
                })
            });
            
            $("#my-modal-Edit").on('shown.bs.modal', function (e) {
                //For Edit
                var dataId = JSON.parse(localStorage.getItem("dataTestID"));
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json",
                    headers: { Authorization: 'Bearer ' + token},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/tests/test-index/" +dataId,
                    success: function (data) { 
                        var name = data.name;     
                        idGroup = data.id;
                        idMale =  data.samplelst[0].id;
                        idTest =  data.samplelst[0].testId;
                        idFemale = data.samplelst[1].id;
                        idChildMale = data.samplelst[2].id;
                        idChildFemale = data.samplelst[3].id;
                        $("#inputNameEdit").val(name);
                        var description = data.description;
                        console.log(description);
                        $("#descriptionEdit").val(description);
                        var maleMin = data.samplelst[0].indexValueMin;
                        $("#maleMinEdit").val(maleMin);
                        var maleMax = data.samplelst[0].indexValueMax;
                        $("#maleMaxEdit").val(maleMax);

                        var femaleMin = data.samplelst[1].indexValueMin;
                        $("#femaleMinEdit").val(femaleMin);
                        var femaleMax = data.samplelst[1].indexValueMax;
                        $("#femaleMaxEdit").val(femaleMax);

                        var childMin = data.samplelst[2].indexValueMin;
                        $("#childMinEdit").val(childMin);
                        var childMax = data.samplelst[2].indexValueMax;
                        $("#childMaxEdit").val(childMax);
                        $("#inputNameEdit").click(function () {
                            $('#inputNameEdit').removeClass('error');
                            document.getElementById('messageNameEdit').innerHTML = '';
                        });
                        $("#descriptionEdit").click(function () {
                            $('#descriptionEdit').removeClass('error');
                            document.getElementById('messageDesEdit').innerHTML = '';
                        });
                        $("#maleMinEdit").click(function () {
                            $('#maleMinEdit').removeClass('error');
                            document.getElementById('messageMaleMinEdit').innerHTML = '';
                        });
                        $("#maleMaxEdit").click(function () {
                            $('#maleMaxEditEdit').removeClass('error');
                            document.getElementById('messageMaleMaxEdit').innerHTML = '';
                        });
                        $("#femaleMinEdit").click(function () {
                            $('#femaleMinEdit').removeClass('error');
                            document.getElementById('messageFemaleMinEdit').innerHTML = '';
                        });
                        $("#femaleMaxEdit").click(function () {
                            $('#femaleMaxEdit').removeClass('error');
                            document.getElementById('messageFemaleMaxEdit').innerHTML = '';
                        });
                        $("#childMinMaleEdit").click(function () {
                            $('#childMinMaleEdit').removeClass('error');
                            document.getElementById('messageChildMinMaleEdit').innerHTML = '';
                        });
                        $("#childMaxMaleEdit").click(function () {
                            $('#childMaxMaleEdit').removeClass('error');
                            document.getElementById('messageChildMaxMaleEdit').innerHTML = '';
                        });
                        $("#childMinFemaleEdit").click(function () {
                            $('#childMinFemaleEdit').removeClass('error');
                            document.getElementById('messageChildMinFemaleEdit').innerHTML = '';
                        });
                        $("#childMaxFemaleEdit").click(function () {
                            $('#childMaxFemaleEdit').removeClass('error');
                            document.getElementById('messageChildMaxFemaleEdit').innerHTML = '';
                        });
                    }
                });
            });

            $("#updateTestIndex").click(function (event) {
                event.preventDefault();
                $('#inputNameEdit').removeClass('error');
                document.getElementById('messageNameEdit').innerHTML = '';
                $('#descriptionEdit').removeClass('error');
                document.getElementById('messageDesEdit').innerHTML = '';
                $('#maleMinEdit').removeClass('error');
                document.getElementById('messageMaleMinEdit').innerHTML = '';
                $('#maleMaxEdit').removeClass('error');
                document.getElementById('messageMaleMaxEdit').innerHTML = '';
                $('#femaleMinEdit').removeClass('error');
                document.getElementById('messageFemaleMinEdit').innerHTML = '';
                $('#femaleMaxEdit').removeClass('error');
                document.getElementById('messageFemaleMaxEdit').innerHTML = '';
                $('#childMinMaleEdit').removeClass('error');
                document.getElementById('messageChildMinMaleEdit').innerHTML = '';
                $('#childMaxMaleEdit').removeClass('error');
                document.getElementById('messageChildMaxMaleEdit').innerHTML = '';
                $('#childMinFemaleEdit').removeClass('error');
                document.getElementById('messageChildMinFemaleEdit').innerHTML = '';
                $('#childMaxFemaleEdit').removeClass('error');
                document.getElementById('messageChildMaxFemaleEdit').innerHTML = '';
                var regexp = /^-?\d{1,4}(\.\d{0,2})?$/;
                var name = $("input[name='nameEdit']").val(); //lấy giá trị trong input user
                var price = $("input[name='priceEdit']").val(); 
                var description = $("textarea[name='descriptionEdit']").val();
                var maleMin = $("input[name='maleMinEdit']").val();
                var maleMax = $("input[name='maleMaxEdit']").val();
                var femaleMin = $("input[name='femaleMinEdit']").val();
                var femaleMax = $("input[name='femaleMaxEdit']").val();
                var childMinMale = $("input[name='childMinMaleEdit']").val();
                var childMaxMale = $("input[name='childMaxMaleEdit']").val();
                var childMinFemale = $("input[name='childMinFemaleEdit']").val();
                var childMaxFemale = $("input[name='childMaxFemaleEdit']").val();                    
                var count = 0;                    
                var allTestIndex = JSON.parse(localStorage.getItem("allTestIndex"));                    
                for (var i = 0; i < allTestIndex.length; i++) {
                    if (allTestIndex[i][0] === name) {
                        count = 1;
                    }
                }
                if (name.length === 0 || name.length > 30) {
                    $('#inputNameEdit').addClass('error');
                    document.getElementById('messageNameEdit').style.color = 'red';
                    document.getElementById('messageNameEdit').innerHTML = 'Name must between (1-30) letter ✘';
                    if (description.length > 255) {
                        $('#descriptionEdit').addClass('error');
                        document.getElementById('messageDesEdit').style.color = 'red';
                        document.getElementById('messageDesEdit').innerHTML = 'Descreption must be less than 255 in length ✘';
                    }
                    if (!regexp.test(maleMin)) {
                        $('#maleMinEdit').addClass('error');
                        document.getElementById('messageMaleMinEdit').style.color = 'red';
                        document.getElementById('messageMaleMinEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(maleMax)) {
                        $('#maleMaxEdit').addClass('error');
                        document.getElementById('messageMaleMaxEdit').style.color = 'red';
                        document.getElementById('messageMaleMaxEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(femaleMin)) {
                        $('#femaleMinEdit').addClass('error');
                        document.getElementById('messageFemaleMinEdit').style.color = 'red';
                        document.getElementById('messageFemaleMinEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(femaleMax)) {
                        $('#femaleMaxEdit').addClass('error');
                        document.getElementById('messageFemaleMaxEdit').style.color = 'red';
                        document.getElementById('messageFemaleMaxEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinMale)) {
                        $('#childMinMaleEdit').addClass('error');
                        document.getElementById('messageChildMinMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxMale)) {
                        $('#childMaxMaleEdit').addClass('error');
                        document.getElementById('messageChildMaxMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinFemale)) {
                        $('#childMinFemaleEdit').addClass('error');
                        document.getElementById('messageChildMinFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxFemale)) {
                        $('#childMaxFemaleEdit').addClass('error');
                        document.getElementById('messageChildMaxFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                }
                else if (count === 1) {
                    $('#inputNameEdit').addClass('error');
                    document.getElementById('messageNameEdit').style.color = 'red';
                    document.getElementById('messageNameEdit').innerHTML = 'Name already exists ✘';
                    if (description.length > 255) {
                        $('#descriptionEdit').addClass('error');
                        document.getElementById('messageDesEdit').style.color = 'red';
                        document.getElementById('messageDesEdit').innerHTML = 'Descreption must be less than 255 in length ✘';
                    }
                    if (!regexp.test(maleMin)) {
                        $('#maleMinEdit').addClass('error');
                        document.getElementById('messageMaleMinEdit').style.color = 'red';
                        document.getElementById('messageMaleMinEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(maleMax)) {
                        $('#maleMaxEdit').addClass('error');
                        document.getElementById('messageMaleMaxEdit').style.color = 'red';
                        document.getElementById('messageMaleMaxEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(femaleMin)) {
                        $('#femaleMinEdit').addClass('error');
                        document.getElementById('messageFemaleMinEdit').style.color = 'red';
                        document.getElementById('messageFemaleMinEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(femaleMax)) {
                        $('#femaleMaxEdit').addClass('error');
                        document.getElementById('messageFemaleMaxEdit').style.color = 'red';
                        document.getElementById('messageFemaleMaxEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinMale)) {
                        $('#childMinMaleEdit').addClass('error');
                        document.getElementById('messageChildMinMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxMale)) {
                        $('#childMaxMaleEdit').addClass('error');
                        document.getElementById('messageChildMaxMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinFemale)) {
                        $('#childMinFemaleEdit').addClass('error');
                        document.getElementById('messageChildMinFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMax)) {
                        $('#childMaxFemaleEdit').addClass('error');
                        document.getElementById('messageChildMaxFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                } 
                else if (description.length > 255) {
                    $('#descriptionEdit').addClass('error');
                    document.getElementById('messageDesEdit').style.color = 'red';
                    document.getElementById('messageDesEdit').innerHTML = 'Descreption must be less than 255 in length ✘';

                    if (!regexp.test(maleMin)) {
                        $('#maleMinEdit').addClass('error');
                        document.getElementById('messageMaleMinEdit').style.color = 'red';
                        document.getElementById('messageMaleMinEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(maleMax)) {
                        $('#maleMaxEdit').addClass('error');
                        document.getElementById('messageMaleMaxEdit').style.color = 'red';
                        document.getElementById('messageMaleMaxEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(femaleMin)) {
                        $('#femaleMinEdit').addClass('error');
                        document.getElementById('messageFemaleMinEdit').style.color = 'red';
                        document.getElementById('messageFemaleMinEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(femaleMax)) {
                        $('#femaleMaxEdit').addClass('error');
                        document.getElementById('messageFemaleMaxEdit').style.color = 'red';
                        document.getElementById('messageFemaleMaxEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinMale)) {
                        $('#childMinMaleEdit').addClass('error');
                        document.getElementById('messageChildMinMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxMale)) {
                        $('#childMaxMaleEdit').addClass('error');
                        document.getElementById('messageChildMaxMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinFemale)) {
                        $('#childMinFemaleEdit').addClass('error');
                        document.getElementById('messageChildMinFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxFemale)) {
                        $('#childMaxFemaleEdit').addClass('error');
                        document.getElementById('messageChildMaxFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                } else if (!regexp.test(maleMin)) {
                    $('#maleMinEdit').addClass('error');
                    document.getElementById('messageMaleMinEdit').style.color = 'red';
                    document.getElementById('messageMaleMinEdit').innerHTML = 'Value invalid ✘';
                    if (!regexp.test(maleMax)) {
                        $('#maleMaxEdit').addClass('error');
                        document.getElementById('messageMaleMaxEdit').style.color = 'red';
                        document.getElementById('messageMaleMaxEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(femaleMin)) {
                        $('#femaleMinEdit').addClass('error');
                        document.getElementById('messageFemaleMinEdit').style.color = 'red';
                        document.getElementById('messageFemaleMinEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(femaleMax)) {
                        $('#femaleMaxEdit').addClass('error');
                        document.getElementById('messageFemaleMaxEdit').style.color = 'red';
                        document.getElementById('messageFemaleMaxEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinMale)) {
                        $('#childMinMaleEdit').addClass('error');
                        document.getElementById('messageChildMinMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxMale)) {
                        $('#childMaxMaleEdit').addClass('error');
                        document.getElementById('messageChildMaxMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinFemale)) {
                        $('#childMinFemaleEdit').addClass('error');
                        document.getElementById('messageChildMinFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxFemale)) {
                        $('#childMaxFemaleEdit').addClass('error');
                        document.getElementById('messageChildMaxFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                } else if (!regexp.test(maleMax)) {
                    $('#maleMaxEdit').addClass('error');
                    document.getElementById('messageMaleMaxEdit').style.color = 'red';
                    document.getElementById('messageMaleMaxEdit').innerHTML = 'Value invalid ✘';
                    if (!regexp.test(femaleMin)) {
                        $('#femaleMinEdit').addClass('error');
                        document.getElementById('messageFemaleMinEdit').style.color = 'red';
                        document.getElementById('messageFemaleMinEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(femaleMax)) {
                        $('#femaleMaxEdit').addClass('error');
                        document.getElementById('messageFemaleMaxEdit').style.color = 'red';
                        document.getElementById('messageFemaleMaxEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinMale)) {
                        $('#childMinMaleEdit').addClass('error');
                        document.getElementById('messageChildMinMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxMale)) {
                        $('#childMaxMaleEdit').addClass('error');
                        document.getElementById('messageChildMaxMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinFemale)) {
                        $('#childMinFemaleEdit').addClass('error');
                        document.getElementById('messageChildMinFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxFemale)) {
                        $('#childMaxFemaleEdit').addClass('error');
                        document.getElementById('messageChildMaxFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                } else if (!regexp.test(femaleMin)) {
                    $('#femaleMinEdit').addClass('error');
                    document.getElementById('messageFemaleMinEdit').style.color = 'red';
                    document.getElementById('messageFemaleMinEdit').innerHTML = 'Value invalid ✘';

                    if (!regexp.test(femaleMax)) {
                        $('#femaleMaxEdit').addClass('error');
                        document.getElementById('messageFemaleMaxEdit').style.color = 'red';
                        document.getElementById('messageFemaleMaxEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinMale)) {
                        $('#childMinMaleEdit').addClass('error');
                        document.getElementById('messageChildMinMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxMale)) {
                        $('#childMaxMaleEdit').addClass('error');
                        document.getElementById('messageChildMaxMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinFemale)) {
                        $('#childMinFemaleEdit').addClass('error');
                        document.getElementById('messageChildMinFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxFemale)) {
                        $('#childMaxFemaleEdit').addClass('error');
                        document.getElementById('messageChildMaxFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                } else if (!regexp.test(femaleMax)) {
                    $('#femaleMaxEdit').addClass('error');
                    document.getElementById('messageFemaleMaxEdit').style.color = 'red';
                    document.getElementById('messageFemaleMaxEdit').innerHTML = 'Value invalid ✘';

                    if (!regexp.test(childMinMale)) {
                        $('#childMinMale').addClass('error');
                        document.getElementById('messageChildMinMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMaxMale)) {
                        $('#childMaxMaleEdit').addClass('error');
                        document.getElementById('messageChildMaxMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                    if (!regexp.test(childMinFemale)) {
                        $('#childMinFemaleEdit').addClass('error');
                        document.getElementById('messageChildMinFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMinFemaleEdit').innerHTML = 'Value invalid ✘';
                    }                        
                    if (!regexp.test(childMaxFemale)) {
                        $('#childMaxFemaleEdit').addClass('error');
                        document.getElementById('messageChildMaxFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                } else if (!regexp.test(childMinMale)) {
                    $('#childMinMaleEdit').addClass('error');
                    document.getElementById('messageChildMinMaleEdit').style.color = 'red';
                    document.getElementById('messageChildMinMaleEdit').innerHTML = 'Value invalid ✘';

                    if (!regexp.test(childMaxMale)) {
                        $('#childMaxMaleEdit').addClass('error');
                        document.getElementById('messageChildMaxMaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxMaleEdit').innerHTML = 'Value invalid ✘';
                    }
                } else if (!regexp.test(childMaxMale)) {
                    $('#childMaxMaleEdit').addClass('error');
                    document.getElementById('messageChildMaxMaleEdit').style.color = 'red';
                    document.getElementById('messageChildMaxMaleEdit').innerHTML = 'Value invalid ✘';
                }else if (!regexp.test(childMinFemale)) {
                    $('#childMinFemaleEdit').addClass('error');
                    document.getElementById('messageChildMinFemaleEdit').style.color = 'red';
                    document.getElementById('messageChildMinFemaleEdit').innerHTML = 'Value invalid ✘';

                    if (!regexp.test(childMaxFemale)) {
                        $('#childMaxFemaleEdit').addClass('error');
                        document.getElementById('messageChildMaxFemaleEdit').style.color = 'red';
                        document.getElementById('messageChildMaxFemaleEdit').innerHTML = 'Value invalid ✘';
                    }
                } else if (!regexp.test(childMaxFemale)) {
                    $('#childMaxFemaleEdit').addClass('error');
                    document.getElementById('messageChildMaxFemaleEdit').style.color = 'red';
                    document.getElementById('messageChildMaxFemaleEdit').innerHTML = 'Value invalid ✘';
                } else if (parseFloat(maleMax) < parseFloat(maleMin)) {
                    console.log("a");
                    $('#maleMaxEdit').addClass('error');
                    document.getElementById('messageMaleMaxEdit').style.color = 'red';
                    document.getElementById('messageMaleMaxEdit').innerHTML = 'Value max less than value min ✘';
                } else if (parseFloat(femaleMax) < parseFloat(femaleMin)) {
                    $('#femaleMaxEdit').addClass('error');
                    document.getElementById('messageFemaleMaxEdit').style.color = 'red';
                    document.getElementById('messageFemaleMaxEdit').innerHTML = 'Value max less than value min ✘';
                } else if (parseFloat(childMaxMale) < parseFloat(childMinMale)) {
                    $('#childMaxMaleEdit').addClass('error');
                    document.getElementById('messageChildMaxMaleEdit').style.color = 'red';
                    document.getElementById('messageChildMaxMaleEdit').innerHTML = 'Value max less than value min ✘';
                }else if (parseFloat(childMaxFemale) < parseFloat(childMinFemale)) {
                    $('#childMaxFemaleEdit').addClass('error');
                    document.getElementById('messageChildMaxFemaleEdit').style.color = 'red';
                    document.getElementById('messageChildMaxFemaleEdit').innerHTML = 'Value max less than value min ✘';
                } else {  
                    $.ajax({
                        type: "PUT",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        headers: { Authorization: 'Bearer ' + token},
                        data: JSON.stringify({
                            "id": idGroup,
                            "name": name,
                            "price": price,
                            "description": description,
                            "samplelst": [
                                {
                                    "description": "",
                                    "id": idMale,
                                    "indexValueMax": maleMax,
                                    "indexValueMin": maleMin,
                                    "testId": idTest,
                                    "type": "Male"
                                },
                                {
                                    "description": "",
                                    "id": idFemale,
                                    "indexValueMax": femaleMax,
                                    "indexValueMin": femaleMin,
                                    "testId": idTest,
                                    "type": "Female"
                                },
                                {
                                    "description": "",
                                    "id": idChildMale,
                                    "indexValueMax": childMaxMale,
                                    "indexValueMin": childMinMale,
                                    "testId": idTest,
                                    "type": "Child-Male"
                                  },
                                {
                                    "description": "",
                                    "id": idChildFemale,
                                    "indexValueMax": childMaxFemale,
                                    "indexValueMin": childMinFemale,
                                    "testId": idTest,
                                    "type": "Child-Female"
                                }
                            ],
                            "status": "enable"

                        }),
                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/tests/test-index",
                        complete: function (jqXHR) {
                            console.log(jqXHR.status);
                            if (jqXHR.status === 201 || jqXHR.status === 200) {
                                alertify.alert('Update Successfully ✔');
                                setTimeout(function(){
                                    window.location.href = "testIndex.jsp";
                                },1700);
                            }
                            else if (jqXHR.status === 400){
                                $('#inputName').addClass('error');
                                document.getElementById('messageNameEdit').style.color = 'red';
                                document.getElementById('messageNameEdit').innerHTML = 'Can not update this test index because it already in used';
                            }
                        }
                    });
                }
            });
        </script>
    </body>
</html>