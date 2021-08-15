<html lang="en">
    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8"%>
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/logo-dark.png">
        <title>PHR - Manage Personal Health Record</title>
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab&subset=latin,greek' rel='stylesheet' type='text/css'>
        <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/select2.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-datetimepicker.min.css">
        <link rel="stylesheet" type="text/css" href="assets/css/style.css">
        <link rel="stylesheet" type="text/css" href="assets/css/customStyle.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
        <style>
            body {
                font-size: 14px;
            }.sidebar-menu li a {
                color: black;
                font-weight: 500;
            }.sidebar-menu li#aTestRequest a {
                color: #009efb;
                /*background-color: #2a9c31;*/
                background-color: #e3e7e8;
            }i.fa.fa-bars {
                padding-top: 14px;
            }span.status.online {
                left: 14px;
                top: 16px;
            }div.profile-widget {
                height: 110%;
                left: 45%;
                top: 35%;
            }.doctor-img {
                cursor: pointer;
                height: 180px;
                margin: 0 auto 15px;
                position: relative;
                width: 180px;
            }.doctor-img .avatar {
                font-size: 24px;
                height: 100%;
                line-height: 80px;
                margin: 0;
                width: 100%;
            }a.serviceName {
                font-size: 25px;
                font-weight: 600;
                font-family: cursive;
                color: salmon;
            }.avatar > img {
                width: 70%;
                display: block;
                margin-top: 35px;
                margin-left: 32;
            }a.avatar {
                background-color: linen;
            }.addButton {
                left: 30%;
                padding-top: 20px;
            }input[type=checkbox] {
                transform: scale(1.5);
                -ms-transform: scale(1.5);
                -webkit-transform: scale(1.5);

            }a:not([href]):not([tabindex]) {
                color: white;
                text-decoration: none;
            }#description {
                display: none;
            }#indexTable {
                width: 100% !important;
            }button.ajs-button.ajs-ok{
                display: inline;
            }div.ajs-footer{
                display: block;
            }.divPrice{
                float: right;
            }
            
            input[type=checkbox] {
                transform: scale(1.5);
                -ms-transform: scale(1.5);
                -webkit-transform: scale(1.5);

            }a:not([href]):not([tabindex]) {
                color: white;
                text-decoration: none;
            }#description {
                display: none;
            }#indexTable {
                width: 100% !important;
            }
            button.ajs-button.ajs-ok{
                display: inline;
            }div.ajs-footer{
                display: block;
            }.divPrice{
                float: right;
            }
            
            button.btn.btn-primary.buttonDetail, input.icheck.checkbox-pk{
                position: relative;
                left: 50px;
            }
            button.btn.btn-primary.buttonDetail{
                width: 45%;
                height: 30px;
                font-size: 14px;
            }
            
            .btn-danger{
                width: 15%;
                height: 30px;
                font-size: 14px;
            }
            
            button#createExamination.btn.btn-success{
                width: 100px;
                height: 30px;
                font-size: 14px;
            }
            div.modal-content.createExam{
                width: 600px;
                height: 400px;
            }
            textarea.form-control.clss-description-area{
                height: 180px;
            }
            
            thead {
                
                color: #009efb;
                font-weight: bolder;
            }
            </style>
    </head>
        <%@include file="components/recepHeader.html" %>
        <%@include file="components/recepSidebar.html" %>
        <div class="page-wrapper">
            <div class="content">
                <div class="form-group row">
                    <div class="col-sm-10">
                        <h4 class="page-title">Select Type Of Test</h4>
                    </div>
                    <div class="col-sm-2">
                        <button type="button" data-toggle="modal" data-target="#my-modal-add" class="btn btn-primary" style="padding: 10px 15px 10px 15px; font-size: 13px;">Create Examination</button>
                    </div>
                </div>
                <fieldset>
                            <div class="">

                <!-- View Package Detail Popup -->
             
                <!-- The Modal -->
              <div class="modal" id="myModalPackageDetail">
                <div class="modal-dialog">
                  <div class="modal-content">

                    <!-- Modal Header -->
                    <div class="modal-header">
                      <h4 class="modal-title">Package Detail</h4>
                      <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <table id="packageDetailTable" class="table table-bordered datatable mb-0">

                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Male</th>
                                    <th>Female</th>
                                    <th>Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr> 
                                    <td id="name"></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>

                                </tr>
                            </tbody>
                        </table>
                        <div class="col-sm-3 divPrice">
                            <div class="form-group">
                                <label><span class="text-danger">Price </span></label>
                                <input class="form-control inputValue clss-input-price" id='price' name="price" type="number" step=".01" value="0">
                                <span id='messageChildMin'></span>
                            </div>
                        </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                  <button type="button" class="btn btn-danger closeButton" data-dismiss="modal">Close</button>
                </div>

              </div>
            </div>
          </div>
          </div> 
                <legend><h2>Test Packages</h2></legend>
                <div class="form-group">
                    <div class="col-md-12">
                        <div class="">
                            <table id="patientTable" class="table table-bordered datatable mb-0">
                                <thead>
                                    <tr>
                                        <th style="width: 25%">Name</th>
                                        <th style="width: 40%">Description</th>
                                        <!--<th style="width: 25%">Price</th>-->
                                        <th style="width: 15%" class="text-center packageButton">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td id="name"></td>
                                        <td id="description"></td>
                                        <!--<td id="price"></td>-->
                                        <td>
                                            <button class="selectPackage"> <a> Select</a> </button>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </fieldset>
                
                 <fieldset>
                     <legend><h2>Test Indexes</h2></legend>
                    <div class="form-group row">
                    <div class="col-md-12">
                        <div class="">
                            <table id="indexTable" class="table table-border table-striped custom-table datatable mb-0">
                                <thead>
                                    <tr>
                                        <th style="width: 20%">Name</th>
                                        <th id="description" style="width: 30%; display: block !important;">Description
                                        </th>
                                        <th style="width: 15%">Male Value</th>
                                        <th style="width: 15%">FeMale Value</th>
                                        <th style="width: 15%">Price</th>
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
                                        <td class="text-right">
                                            <div class="form-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck">
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="col-sm-3 divPrice">
                                    <div class="form-group">
                                        <label><span class="text-danger">Price </span></label>
                                        <input class="form-control inputValue" id='price' name="price" type="number" step=".01" value="0">
                                        <span id='messageChildMin'></span>
                                    </div>
                                </div>
                            </div>
                        
                        <script>
                            function calPrice() {
                                let rowElements = document.getElementsByTagName('tr');
                                document.getElementById('price').value = '';
                            }
                           
                        </script>
                        
                        </div>
<!--                        <div class="col-sm-8 col-9 text-right m-b-20 addButton">
                            <a id="addTest" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i>Create Examination</a>
                        </div>-->
                    </div>
                </fieldset>                
            </div> 
        </div>

        <!-- The Modal ADD-->
        <div class="modal" id="my-modal-add" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content createExam">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Create Examination</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="content">
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label>Select Doctor</label><br />
                                    <select id="doctorName" name="doctorPhone" class="select"></select>
                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-12">
                                    <label for="exampleFormControlTextarea1">Description</label>
                                    <textarea style="display: inline-block !important" class="form-control clss-description-area" id="description" maxlength="255" name="description" rows="3"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-success" onclick="showModalOrder()">Create</button>
                    </div>
                </div>
            </div>
        </div>
        
        
        <!-- The Modal Detail-->
        <div class="modal" id="my-modal-Edit" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Detail Test Package</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="content clss-result-data">
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
                    </div>
                </div>
            </div>
        </div>
        
        <!-- The Modal order-->
        <div class="modal" id="my-modal-order" role="dialog">
            <div class="modal-dialog modal-lg">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 class="modal-title">Confirm Package</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>
                    <!-- Modal body -->
                    <div class="modal-body">
                        <div class="content">
                            <fieldset>
                                <legend>List item order</legend>
                                <div class="clss-group-order">
                                    <table class="table tab-content table-border">
                                        <thead>
                                            <tr>
                                                <th style="width: 5%">.No</th>
                                                <th>Name</th>
                                                <th style="width: 8%">Price</th>
                                            </tr>
                                        </thead>
                                        <tbody id="data-group-save">

                                        </tbody>
                                    </table>
                                </div> 
                            </fieldset>
                            
                            <hr />
                            <fieldset class="clss-group-duplicate" style="display: none">
                                <legend>List item duplicate</legend>
                                <div>
                                    <table class="table tab-content table-border">
                                        <thead>
                                            <tr>
                                                <th style="width: 5%">.No</th>
                                                <th>Name</th>
                                                <th style="width: 8%">Price</th>
                                            </tr>
                                        </thead>
                                        <tbody id="data-group-duplicate">

                                        </tbody>
                                    </table>
                                </div> 
                            </fieldset>                            
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Cancel</button>
                        <button id="createExamination" type="button" class="btn btn-success">Confirm</button>
                    </div>
                </div>
            </div>
        </div>
        
    <%@include file="components/recepFooter.html" %>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="assets/js/jquery-3.2.1.min.js"></script>
    <script src="assets/js/popper.min.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/select2.min.js"></script>
    <script src="assets/js/jquery.dataTables.min.js"></script>
    <script src="assets/js/dataTables.bootstrap4.min.js"></script>
    <script src="assets/js/jquery.slimscroll.js"></script>
    <script src="assets/js/moment.min.js"></script>
    <script src="assets/js/bootstrap-datetimepicker.min.js"></script>
    <script src="assets/js/app.js"></script>
    <script type="text/javascript">              
        var allItems = [];         
        var itemSave = [];
        var itemDuplicate = [];
        
        window.onload = function () {
            var token = sessionStorage.getItem("key");
            var ids = sessionStorage.getItem('listTestId');
            if (ids !== null) {
                var listTestId = ids.split(",");
            }
            console.log(listTestId);
            var listTestDouple = [];
            $.ajax({
                type: "GET",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                headers: {Authorization: 'Bearer ' + token},
                url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/packages/packages",
                success: function (data) {
                    console.log(data);
                    allData = $('#patientTable').DataTable({
                        data: data,
                        columns: [
                            {data: 'name'},
                            {data: 'description'},
//                            {data: 'price'},
                            {
                                data: 'id',
                                "render": function (data, type, row, meta) {
                                    return '<td><div style="display: inline"><button type="button" data-id=' + row.id + ' data-toggle="modal" data-target="#myModalPackageDetail" class="btn btn-primary buttonDetail"style="padding-right: 5px"><i class="fa fa-eye"></i> &nbsp;Detail</button>&nbsp &nbsp<input type="checkbox" onchange = "CheckSelectAll(this)" data-id=' + row.id + ' class = "icheck checkbox-pk" /></div></td>'
                                    //return '<td><div style="display: inline"><button type="button" data-id=' + row.id + ' data-toggle="modal" data-target="#my-modal-Edit" class="btn btn-primary"style="padding-right: 5px">Detail</button>&nbsp &nbsp<button type="button" onclick="getpackageId(' + data + ')" class="btn btn-primary">Select</button></div></td>'
                                }
                            }
                        ],
                        "bDestroy": true,
                        "bFilter": false,
                        "bSort": false,
                        "bLengthChange": false,
                        "bInfo": false,
                    });
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(' Error in processing! ' + textStatus);
                }
            });
            
            //For du lieu bang so 2
            var packageId = sessionStorage.getItem('packageId');
            $.ajax({
                type: "GET",
                dataType: "json",
                contentType: "application/json; charset=UTF-8",
                headers: {Authorization: 'Bearer ' + token},
                url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/tests/test-indexs",
                success: function (data) {
                    jQuery.makeArray(packageId);
                    var listResult = data;
                    var mainData = [];
                    if (packageId !== null) {
                        for (var i = 0, max = packageId.length; i < max; i++) {
                            $.ajax({
                                type: "GET",
                                dataType: "json",
                                contentType: "application/json; charset=UTF-8",
                                headers: {Authorization: 'Bearer ' + token},
                                url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-detail/" + packageId[i],
                                success: function (data) {
                                    for (var j = 0; j < data.length; j++) {
                                        let id = data[j].id;
                                        var a = listResult.findIndex(test => test.id === id);
                                        listResult.splice(a, 1);
                                    }
                                    listResult.forEach(element => {
                                        var dataShow = new Object();
                                        dataShow.id = element.id;
                                        dataShow.name = element.name;
                                        dataShow.description = element.description;
                                        dataShow.price = element.price;
                                        dataShow.maleIndex = '-';
                                        dataShow.femaleindex = '-';
                                        dataShow.childIndex = '-';
                                        element.samplelst.forEach(e => {
                                            if (e.type === 'Male' || e.type === 'male') {
                                                dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                            } else if (e.type === 'Female' || e.type === 'female') {
                                                dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                            } 
                                        });
                                        mainData.push(dataShow);
                                    });
                                    table = $('#indexTable').DataTable({
                                        data: mainData,
                                        columns: [
                                            {data: 'name'},
                                            {data: 'description'},
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
                                                data: 'price'
                                            },
                                            {
                                                data: 'id',
                                                render: function (data, type, row, meta) {
                                                    return '<td id="actionIcon" class="text-right"><div class="form-check"><input name="checkBox" type="checkbox" class="form-check-input checkbox-item" data-id=' + row.id + ' data-name=' + row.name + ' data-price=' + row.price + ' value="' + data + '"id="exampleCheck1"></div></td>'
                                                }
                                            },
                                        ],
                                        "bDestroy": true,
                                        "bFilter": false,
                                        "bSort": false,
                                        "bLengthChange": false,
                                        "bInfo": false,
                                    });
                                },
                                error: function (jqXHR, textStatus, errorThrown) {
                                    console.log(' Error in processing! ' + textStatus);
                                }
                            });
                        }
                    } else {
                        data.forEach(element => {
                            var dataShow = new Object();                    //Bảng này đang load
                            dataShow.id = element.id;
                            dataShow.name = element.name;
                            dataShow.price = element.price;
                            dataShow.description = element.description;
                            dataShow.maleIndex = '-';
                            dataShow.femaleindex = '-';
                            dataShow.childIndex = '-';
                            element.samplelst.forEach(e => {
                                if (e.type === 'Male') {
                                    dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                } else if (e.type === 'Female') {
                                    dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                } 
                            });
                            mainData.push(dataShow);
                        });
                        table = $('#indexTable').DataTable({               //Bảng này đang load
                            data: mainData,
                            columns: [
                                {data: 'name'},
                                {data: 'description'},
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
                                    
                                },
                                {
                                    data: 'id',
                                    render: function (data, type, row, meta) {
                                        return '<td id="actionIcon" class="text-right"><div class="form-check"><input name="checkBox" type="checkbox" class="form-check-input checkbox-item" data-id=' + row.id + ' data-name=' + row.name + ' data-price=' + row.price + ' value="' + data + '"id="exampleCheck1"></div></td>'
                                    }
                                },
                            ],
                            "bDestroy": true,
                            "bFilter": false,
                            "bSort": false,
                            "bInfo": false,
                            
                        });
                    }
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    console.log(' Error in processing! ' + textStatus);
                }
            })
        };
        
        function showModalOrder(){
            var description = $('.clss-description-area').val();         
            if (description === null || description === "") {
                alert('Please entering description!')
            }
            else {
                 $("#my-modal-order").modal("show");
             }
        }
        
        $("#my-modal-add").on('shown.bs.modal', function (e) {    
            var token = sessionStorage.getItem("key");  
            $(document).ready(function () {
                var cliId = sessionStorage.getItem("clinicID");
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    headers: {
                        Authorization: 'Bearer ' + token
                    },
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/doctors/clinic/" + cliId,
                    success: function (data) {
                        for (var i in data) {
                            $('#doctorName').append('<option value=' + data[i].id + '-' + data[i].accountId + '>' + data[i].name + ' - ' + data[i].phone + '</option>');
                        }
                    }
                });
            });
            var idsitem = [];
            $('.checkbox-item:checkbox').filter(':checked').each(function (e) {
                idsitem.push(parseInt($(this).data('id')));
                allItems.push({
                    "id": parseInt($(this).data('id')),
                    "name": $(this).data('name'),
                    "price": $(this).data('price')
                });
            });
            var idspk = [];
            $('.checkbox-pk:checkbox').filter(':checked').each(function (e) {
                idspk.push(parseInt($(this).data('id')));
            });
            if (idspk.length > 0) {
                for (var i = 0; i < idspk.length; i++) {
                    var _id = idspk[i];
                    $.ajax({
                        type: "GET",
                        dataType: "json",
                        contentType: "application/json; charset=UTF-8",
                        headers: { Authorization: 'Bearer ' + token },
                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-detail/" + _id,
                        success: function (data) {
                            for (var i = 0; i < data.length; i++) {
                                allItems.push({
                                    "id": data[i].id,
                                    "name": data[i].name,
                                    "price": data[i].price,
                                });
                            }                            
                            if (allItems .length > 0) {
                                //itemSave = itemSave.filter((value, index, array)=>array.findIndex(t=>(t.id === v.id))===i)
                                itemSave = allItems.filter(function (value, index, array) { 
                                    return array.findIndex(t=> (t.id === value.id)) === index;
                                });
                                itemDuplicate = allItems.filter(function (value, index, array) { 
                                    return array.findIndex(t=> (t.id === value.id)) != index;
                                });
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(' Error in processing! ' + textStatus);
                        }
                    });
                }
            }      
        });
        
        $("#my-modal-order").on('shown.bs.modal', function (e) {  
            var _totalPrice = 0;
            if (itemSave.length > 0) {
                var html = "";
                var index = 1;
                for (var i = 0; i < itemSave.length; i++) {    
                    html += "<tr>"; 
                    html += "<td class=''>" + index + "</td>";
                    html += "<td>" + itemSave[i].name + "</td>";
                    html += "<td>" + itemSave[i].price + "</td>";                    
                    html += "</tr>";
                    _totalPrice = _totalPrice + itemSave[i].price;
                    index = index + 1;
                }
                html = html + "<tr>";
                html = html + "<td colspan ='2' style='text-align: right'><span style='color: red;'><strong>Total price:</strong></span></td>";
                html = html + "<td>" + _totalPrice + "</td>";
                html = html + "</tr>";
                $('#data-group-save').html(html);
            }
            if (itemDuplicate.length > 0) {
                var html = "";
                var index = 1;
                for (var i = 0; i < itemDuplicate.length; i++) {    
                    html += "<tr>"; 
                    html += "<td class=''>" + index + "</td>";
                    html += "<td>" + itemDuplicate[i].name + "</td>";
                    html += "<td>" + itemDuplicate[i].price + "</td>";                    
                    html += "</tr>";
                    index = index + 1;
                }
                $('#data-group-duplicate').html(html);
                $('.clss-group-duplicate').css("display", "block");
            }
            var idsitempk = [];
            var itemIds = itemSave.map(m=> m.id);  
            $('#createExamination').click(function (event) { 
                var token = sessionStorage.getItem("key");  
                var selected = $('#doctorName').find('option:selected').val();
                var description = $('.clss-description-area').val();
                var patientId = parseInt(checkNull(sessionStorage.getItem('patientId')));
                var doctorId = parseInt(selected.split("-")[0]);
                var doctorAccountId = parseInt(selected.split("-")[1]); 
                $.ajax({
                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    headers: { Authorization: 'Bearer ' + token },
                    data: JSON.stringify({
                        "description": description,
                        "doctorId": doctorId,
                        "packageId": idsitempk,
                        "patientId": patientId,
                        "price": _totalPrice,
                        "testId": itemIds,
                    }),
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/examinations/examination",
                    complete: function (jqXHR) {
                        if (jqXHR.status === 200) {
                            $.ajax({
                            type: "POST",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {Authorization: 'Bearer ' + token},
                            data: JSON.stringify({
                                "accountId": doctorAccountId,
                                "message": "You have a new patient"
                            }),
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/commons/notification",
                            complete: function (jqXHR) {
                                if (jqXHR.status === 200) {

                                    alertify.alert('Create Examination Successfully!');
                                     setTimeout(function(){
                                         window.location.href = "receptionistPatients.jsp";
                                 },1700);

                                }
                            }});
                        }
                    }});
            });
            function checkNull(data) {
                if (data === null) {
                    return " ";
                }
                return data;
            }
            function parseStringToInt(list) {
                var result = []
                if (list !== null) {
                    let temp = list.split(',');
                    console.log(temp);
                    for (var i = 0; i < temp.length; i++) {
                        result.push(parseInt(temp[i]));
                    }
                }
                return result;
            }            
        });
        
        $("#myModalPackageDetail").on('shown.bs.modal', function (e) {
            var id = $(e.relatedTarget).data('id');
            var allDataPackage = JSON.parse(localStorage.getItem("allDataPackage"));
            var dataPackage = getObjectByValue(allDataPackage, "id", id);
            console.log(id);
            var _totalPrice = 0;
            //For Edit test package
                 $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: { Authorization: 'Bearer ' + token},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-detail/" + id,
                    success: function (data) {
                        var a = JSON.stringify(data);
                        var b = JSON.parse(a);
                        var mainData = [];
                        $.ajax({
                            type: "GET",
                            dataType: "json",
                            contentType: "application/json; charset=UTF-8",
                            headers: {
                                Authorization: 'Bearer ' + token},
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-detail/" +id,
                            success: function (data) {
                            console.log(data);
                            data.forEach(element => {
                                var dataShow = new Object();
                                dataShow.name = element.name;
                                dataShow.price = element.price;
                                dataShow.description = element.description;
                                dataShow.maleIndex = '-';
                                dataShow.femaleindex = '-';
                                dataShow.childIndex = '-';                                    
                                element.samplelst.forEach(e => {
                                    if (e.type === 'Male' || e.type === 'male') {
                                        dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                    } else if (e.type === 'Female' || e.type === 'female') {
                                        dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                    } 
                                });
                                _totalPrice = _totalPrice + parseFloat(element.price);
                                mainData.push(dataShow);
                            });
                            $('.clss-input-price').val(_totalPrice).trigger('change');
                            
//                                $('#testPackageTable').append('<caption style="caption-side: top">' + dataPackage.name + '</caption>');
                            $('#packageDetailTable').DataTable({                                    
                            data: mainData,
                            columns: [
                                { data: 'name',},
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
                                    data: 'price'
                                   
                                },
                                
                            ],
                            "bDestroy": true,
                            "bFilter": false,
                            "aaSorting": [],
                            "bPaginate": false,
                            "bSort": false,
                            "bInfo": false,
                            
                        });
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        console.log(' Error in processing! ' + textStatus);
                    }
                })
                 
            },   
            error: function (jqXHR, textStatus, errorThrown) {
                console.log(' Error in processing! ' + textStatus);
            },
        })

        });
        
        var getObjectByValue = function (array, key, value) {
            return array.filter(function (object) {
                return object[key] === value;
            });
        };
        
        $('#id_CheckAll').click(function (event) {
            if (this.checked == true) {
                $('.checkbox-pk').each(function () { this.checked = true; }).trigger('change');
            }
            else {
                $('.checkbox-pk').each(function () { this.checked = false; }).trigger('change');
            }
        });


        function CheckSelectAll(e) {
            if ($(".checkbox-pk").length == $(".checkbox-pk:checked").length)
                $("#id_CheckAll").prop('checked', true);
            else
                $("#id_CheckAll").prop('checked', false);
        };


    </script>
    
</body>
</html>