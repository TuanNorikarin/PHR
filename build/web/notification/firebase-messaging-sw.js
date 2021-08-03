importScripts('https://www.gstatic.com/firebasejs/8.7.1/firebase-app.js');
importScripts('https://www.gstatic.com/firebasejs/8.7.1/firebase-messaging.js');

var firebaseConfig = {
    apiKey: "AIzaSyAlwQXlCfXMf8Q4y2KjH1uus2KtQ8ZCCZk",
    authDomain: "phrsystem-a395a.firebaseapp.com",
    projectId: "phrsystem-a395a",
    storageBucket: "phrsystem-a395a.appspot.com",
    messagingSenderId: "612057377858",
    appId: "1:612057377858:web:c9cbc1e5c379b62277d1db",
    measurementId: "G-XPP2P6QNHR",
};
// Initialize Firebase

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

messaging.onBackgroundMessage(function (payload) {
    console.log('[firebase-messaging-sw.js] Received background message ', payload);
    // Customize notification here
    const notificationTitle = 'PHR System';
    const notificationOptions = {
        body: payload.data.content
    };

    self.registration.showNotification(notificationTitle,
            notificationOptions);
    var today = new Date();
    var date = today.getFullYear() + '-' + (today.getMonth() + 1) + '-' + today.getDate();
    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
    var datetime = date + '  ' + time;
    $('#listNotification').append('<p class="noti-details"><span class="noti-title" id="name">You have a new patient</span></p>\n\
                                                    <p class="noti-time"><span class="notification-time">' + datetime + '</span></p>');

    var number = parseInt($('#number').html());

    console.log(",,,,,,,", number);

    $('#number').text(number + 1);

    var ls = [localStorage.getItem('listNotification')];
    console.log(ls);
    if (ls[0] !== null) {
        var temp = ls[0].split(",");
        temp.push(datetime);
        localStorage.setItem('listNotification', temp);
    } else {
        localStorage.setItem('listNotification', [datetime]);
    }
    console.log("...........", localStorage.getItem('listNotification'));
});

self.addEventListener('notificationclick', function (event) {
    event.notification.close();
    clients.openWindow('http://localhost:8080/PHR/doctorIndex.jsp');
    // Do something as the result of the notification click
});