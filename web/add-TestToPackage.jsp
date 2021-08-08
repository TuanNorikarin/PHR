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
                <div class="col-sm-8 col-3">
                    <h4 class="page-title" id="packageName"></h4>
                </div>
                <div class="col-sm-4 col-3">
                    <buttom class="btn btn btn-primary btn-rounded float-right add-to-package"><i class="fa fa-plus"></i> Add to package </buttom>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12">
                    <div class="">

                        <table id="indexTable" class="table table-border table-striped custom-table datatable mb-0">

                            <thead>
                                <tr>
                                    <th style="width: 20%">Name</th>
                                    <th id='description'>Description</th>
                                    <th style="width: 15%">Male Value</th>
                                    <th style="width: 15%">FeMale Value</th>
                                    <th style="width: 15%">Price</th>
                                    <th style="width: 5%" class="text-left">
                                        <input type="checkbox" class="icheck" id="id_CheckAll" />                                        
                                    </th>
                                </tr>
                            </thead>

                            <tbody>
                               <tr> 

                                    <td id="name"></td>
                                    <td id="description"></td>
                                    <td id="maleVal"></td>
                                    <td id="femaleVal"></td>
                                    <td id="priceVal"></td>
                                    <td  class="text-center row-data">
                                        
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
<!--                <div class="col-sm-8 col-9 text-right m-b-20 addButton">
                    <a id="addTestTotal" class="btn btn btn-primary btn-rounded float-right"><i class="fa fa-plus"></i> Add To Package</a>
                </div>-->
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
        <script>
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
            
            $('.add-to-package').click(function (event) {
                var ids = [];
                var packageId = sessionStorage.getItem('packageId');
                $('.checkbox-pk:checkbox').filter(':checked').each(function (e) {
                    ids.push({
                        id: $(this).data('id'),
                        testid: $(this).data('testid')
                    });
                });
                if (ids.length > 0) {
                    for (var i = 0; i < ids.length; i++) {
                        $.ajax({
                            type: "POST",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            headers: {Authorization: 'Bearer ' + token},
                            data: JSON.stringify({
                                 "id": ids[i].id,
                                 "packageId": packageId,
                                 "testId": ids[i].testid
                            }),
                            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-test",
                            complete: function (jqXHR) {
                                if (jqXHR.status === 200) {
                                    alertify.alert('Add Successfully ✔');
                                    setTimeout(function () {
                                        window.location.href = "test-detail.jsp";
                                    }, 1000);
                                }else {  
                                    alert("Some component are faulty!");
                                    
                                }
                            }
                        });
                    }                    
                }
            });
        </script>
        <script type="text/javascript">            
            var mainData = [];
            window.onload = function () {
                var token = sessionStorage.getItem("key");
                var packageName = sessionStorage.getItem("packageName");
                document.getElementById("packageName").innerHTML = packageName;
                var testName = localStorage.getItem("testName");
                console.log('Name '  + packageName);
                var packageId = sessionStorage.getItem('packageId');
                console.log('PackageID '  + packageId);
                $.ajax({
                    type: "GET",
                    dataType: "json",
                    contentType: "application/json; charset=UTF-8",
                    headers: { Authorization: 'Bearer ' + token},
                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/tests/test-indexs",
                    success: function (data) {
                        console.log(data)
                        jQuery.makeArray(packageId);
                        var listResult = data;
                        if (packageId !== null) {
                            for (var i = 0, max = packageId.length; i < max; i++) {
                                $.ajax({
                                    type: "GET",
                                    dataType: "json",
                                    contentType: "application/json; charset=UTF-8",
                                    headers: {Authorization: 'Bearer ' + token },
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
                                            dataShow.price = element.price;
                                            dataShow.description = element.description;
                                            dataShow.samplelst = element.samplelst;
                                            dataShow.maleIndex = '-';
                                            dataShow.femaleindex = '-';
                                            dataShow.childIndex = '-';
                                            element.samplelst.forEach(e => {
                                                if (e.type === 'Male' || e.type === 'male') {
                                                    dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                                } else if (e.type === 'Female' || e.type === 'female') {
                                                    dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                                } else if (e.type === 'Child' || e.type === 'child') {
                                                    dataShow.childIndex = e.indexValueMin + '-' + e.indexValueMax;
                                                }
                                            });
                                            mainData.push(dataShow);
                                        });
                                        table = $('#indexTable').DataTable({
                                            data: mainData,
                                            columns: [
                                                
                                            {data: 'name'},

                                            {
                                                data: 'description', "width": "25%"
                                            },
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
                                            {   
                                                render: function (data, type, row, meta) {                                                
                                                    return '<td class="text-center row-data" data-id=' + row.id + '><input type="checkbox" onchange = "CheckSelectAll(this)" data-id=' + row.id + ' data-testid=' + row.samplelst[0].testId + ' class = "icheck checkbox-pk" /></td>';
                                                }
                                                //defaultContent: '<td class="text-center row-data"><input type="checkbox" onchange = "CheckSelectAll(this)" class = "icheck checkbox-emp" /></td>'
                                                //defaultContent: '<td><button id="addTest" class="btn btn-primary inputResult" onClick="getTestId('+data+')"> <a> Add </a> </button></td>'
                                            },
                                            ],
                                            "bDestroy": true,
                                            "bFilter": true,
                                        });
                                    },               //data tag
                                    error: function (jqXHR, textStatus, errorThrown) {
                                        console.log(' Error in processing! ' + textStatus);
                                    }
                                });
                            }
                        } else {
                            data.forEach(element => {
                                var dataShow = new Object();
                                dataShow.id = element.id;
                                dataShow.name = element.name;
                                dataShow.description = element.description;
                                dataShow.maleIndex = '-';
                                dataShow.femaleindex = '-';
                                dataShow.childIndex = '-'
                                element.samplelst.forEach(e => {
                                    if (e.type === 'Male' || e.type === 'male') {
                                        dataShow.maleIndex = e.indexValueMin + '-' + e.indexValueMax;
                                    } else if (e.type === 'Female' || e.type === 'female') {
                                        dataShow.femaleindex = e.indexValueMin + '-' + e.indexValueMax;
                                    } else if (e.type === 'Child' || e.type === 'child') {
                                        dataShow.childIndex = e.indexValueMin + '-' + e.indexValueMax;
                                    }
                                });
                                mainData.push(dataShow);
                            });
                            table = $('#indexTable').DataTable({
                                data: mainData,
                                columns: [                                    
                                    {data: 'name'},
                                    {
                                        data: 'description',"width": "25%"
                                    },
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
                                        data: 'childIndex',
                                        render: function (data, type, row, meta) {
                                            if ( row.childIndex === '-9999--9999') {
                                                return "Âm tính";
                                            }else{
                                                return row.childIndex;
                                            }
                                        }
                                    },
                                    {
                                        defaultContent: '<td><button id="addTest" class="btn btn-primary inputResult"> <a> Add </a> </button></td>'
                                    },
                                ],
                                "bDestroy": true,
                                "bFilter": true,
                            });
                        }                            
                        $('#indexTable tbody').on('click', 'button', function () {
                          var tr = $(this).closest("tr");
                          var rowindex = tr.index();
                          table = document.getElementById("indexTable");
                          tr = table.getElementsByTagName("tr");
                          td = tr[rowindex + 1].getElementsByTagName("td")[0];
                          txtValue = td.textContent;
                            for (var i = 0; i < data.length; i++) {
                                if (data[i].name === txtValue) {
//                                    alert(data[i].name + data[i].id + data[i].samplelst[0].testId);
                                    $.ajax({
                                        type: "POST",
                                        dataType: "json",
                                        contentType: "application/json; charset=utf-8",
                                        headers: {
                                             Authorization: 'Bearer ' + token},
                                        data: JSON.stringify({
                                             "id": data[i].id,
                                             "packageId": packageId,
                                             "testId": data[i].samplelst[0].testId
                                        }),
                                        url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/package-tests/package-test",
                                        complete: function (jqXHR) {
                                        if (jqXHR.status === 200) {
                                            alertify.alert('Add Successfully ✔');
                                            setTimeout(function () {
                                                window.location.href = "add-TestToPackage.jsp";
                                            }, 1000);
                                        

                                      }
                                    }
                                  });
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
</html>