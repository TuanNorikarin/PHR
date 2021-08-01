$(document).ready(function () {
    // Bar Chart
    var token = sessionStorage.getItem("key");
    var roleID = sessionStorage.getItem("roleID");
    if (roleID === "ADMIN") {
        var q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, bt, td, tb, bth, pn, gv, tp;
            $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/clinics/clinics/total-district",
            success: function (data) {
                var json = jQuery.parseJSON(data);
                q1 = json.q1;
                q2 = json.q2;
                q3 = json.q3;
                q4 = json.q4;
                q5 = json.q5;
                q6 = json.q6;
                q7 = json.q7;
                q8 = json.q8
                q9 = json.q9;
                q10 = json.q10;
                q11 = json.q11;
                q12 = json.q12;
                bt = json.binh_tan;
                td = json.thu_duc;
                tb = json.tan_binh;
                bth = json.binh_thanh;
                pn = json.phu_nhuan;
                gv = json.go_vap;
                tp = json.tan_phu;

            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        
        $(document).ajaxStop(function () {
            var barChartData = {
                labels: ['Quận 1', 'Quận 2', 'Quận 3', 'Quận 4', 'Quận 5', 'Quận 6', 'Quận 7', 'Quận 8', 'Quận 9', 'Quận 10', 'Quận 11', 'Quận 12', 'Gò Vấp', 'Bình Thạnh', 'Thủ Đức', 'Bình Tân', 'Tân Bình', 'Phú Nhuận', 'Tân Phú'],
                datasets: [{
                        label: 'Clinics',
                        backgroundColor: 'rgba(0, 158, 251, 0.5)',
                        borderColor: 'rgba(0, 158, 251, 1)',
                        borderWidth: 1,
                        data: [q1, q2, q3, q4, q5, q6, q7, q8, q9, q10, q11, q12, gv, bth, td, bt, tb, pn, tp]
                    }]
            };
            var ctx = document.getElementById('bargraph').getContext('2d');
            window.myBar = new Chart(ctx, {
                type: 'bar',
                data: barChartData,
                options: {
                    responsive: true,
                    legend: {
                        display: false,
                    }
                }
            });
        });











        // Line Chart

//	var lineChartData = {
//		labels: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
//		datasets: [{
//			label: "My First dataset",
//			backgroundColor: "rgba(0, 158, 251, 0.5)",
//			data: [100, 70, 20, 100, 120, 50, 70, 50, 50, 100, 50, 90]
//		}, {
//		label: "My Second dataset",
//		backgroundColor: "rgba(255, 188, 53, 0.5)",
//		fill: true,
//		data: [28, 48, 40, 19, 86, 27, 20, 90, 50, 20, 90, 20]
//		}]
//	};

//	var linectx = document.getElementById('linegraph').getContext('2d');
//	window.myLine = new Chart(linectx, {
//		type: 'line',
//		data: lineChartData,
//		options: {
//			responsive: true,
//			legend: {
//				display: false,
//			},
//			tooltips: {
//				mode: 'index',
//				intersect: false,
//			}
//		}
//	});

        // Bar Chart 2

//    barChart();
//    
//    $(window).resize(function(){
//        barChart();
//    });
//    
//    function barChart(){
//        $('.bar-chart').find('.item-progress').each(function(){
//            var itemProgress = $(this),
//            itemProgressWidth = $(this).parent().width() * ($(this).data('percent') / 100);
//            itemProgress.css('width', itemProgressWidth);
//        });
//    };
    } else if (roleID === "DOCTOR") {
        var t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12;
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-01-01 00:00:00.000/2020-01-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t1 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-02-01 00:00:00.000/2020-02-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t2 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-03-01 00:00:00.000/2020-03-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t3 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-04-01 00:00:00.000/2020-04-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t4 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-05-01 00:00:00.000/2020-05-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t5 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-06-01 00:00:00.000/2020-06-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t6 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-07-01 00:00:00.000/2020-07-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t7 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-08-01 00:00:00.000/2020-08-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t8 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-09-01 00:00:00.000/2020-09-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t9 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-10-01 00:00:00.000/2020-10-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t10 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-11-01 00:00:00.000/2020-11-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t11 = data;
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $.ajax({
            type: "GET",
            dataType: "text",
            contentType: "application/json; charset=utf-8",
            headers: {
                Authorization: 'Bearer ' + token},
            url: "https://bt-application.herokuapp.com/api/examination/month/2020-12-01 00:00:00.000/2020-12-31 00:00:00.000/" + roleId.clinicId.id,
            success: function (data) {
                t12 = data;
                console.log("a");
                console.log(t12);
            },
            error: function (jqXHR, textStatus, errorThrown) {


            }
        });
        $(document).ajaxStop(function () {
            var barChartData = {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                        label: 'Examination',
                        backgroundColor: 'rgba(0, 158, 251, 0.5)',
                        borderColor: 'rgba(0, 158, 251, 1)',
                        borderWidth: 1,
                        data: [t1,t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12]
                    }]
            };
            var ctx = document.getElementById('bargraph').getContext('2d');
            window.myBar = new Chart(ctx, {
                type: 'bar',
                data: barChartData,
                options: {
                    responsive: true,
                    legend: {
                        display: false
                    }
                }
            });
        });
    }
});