
var firebaseConfig = {
    apiKey: "AIzaSyAlwQXlCfXMf8Q4y2KjH1uus2KtQ8ZCCZk",
    authDomain: "phrsystem-a395a.firebaseapp.com",
    projectId: "phrsystem-a395a",
    storageBucket: "phrsystem-a395a.appspot.com",
    messagingSenderId: "612057377858",
    appId: "1:612057377858:web:c9cbc1e5c379b62277d1db",
    measurementId: "G-XPP2P6QNHR"
};
if ("serviceWorker" in navigator) {
    console.log(".........");
    navigator.serviceWorker
            .register("./notification/firebase-messaging-sw.js")
            .then(function (registration) {
                console.log("Registration successful, scope is:", registration.scope);
                firebase.initializeApp(firebaseConfig);
                const messaging = firebase.messaging().useServiceWorker(registration);

                firebase.messaging().getToken({vapidKey: 'BIEnFr-_eXIRwxwji4d5skzDdZm5FSy5iS_PGmJSgvdfVyD7oTgyiG9n3E9FDiIXkSAKyLoNoKOZNUGGepCvGfI', serviceWorkerRegistration: registration})
                        .then((currentToken) => {
                            if (currentToken) {
                                console.log('current token for client: ', currentToken);
                                var token = sessionStorage.getItem("key");
                                var phone = sessionStorage.getItem('user');


                                $.ajax({
                                    type: "PUT",
                                    dataType: "json",
                                    contentType: "application/json; charset=utf-8",
                                    headers: {
                                        Authorization: 'Bearer ' + token
                                    },
                                    data: JSON.stringify({
                                        "fcm_token": currentToken,
                                        "phone": phone
                                    }),
                                    url: "http://14.161.47.36:8080/PHR_System-0.0.1-SNAPSHOT/accounts/account",
                                    complete: function (jqXHR) {
                                        if (jqXHR.status === 200) {
                                            console.log("ok");
                                        }
                                    }
                                });

                            } else {
                                alert("You must allow notify to recive information about new patient\n Let go to view site information -> Change Notification to allow");
                            }
                        }).catch((err) => {
                    alert("You must allow notify to recive information about new patient\n Let go to view site information -> Change Notification to allow");
                    // catch error while creating client token
                });
                firebase.messaging().onMessage(function (payload) {
                    var today = new Date();
                    var date = today.getFullYear()+'-'+(today.getMonth()+1)+'-'+today.getDate();
                    var time = today.getHours() + ":" + today.getMinutes() + ":" + today.getSeconds();
                    var datetime = date +'  '+time;
                    $('#listNotification').append('<p class="noti-details"><span class="noti-title" id="name">You have a new patient</span></p>\n\
                                                    <p class="noti-time"><span class="notification-time">'+datetime+'</span></p>');
                    
                    var number = parseInt($('#number').html());
                    
                    console.log(",,,,,,,",number);
                    
                    $('#number').text(number + 1);
                    
                    var ls = [localStorage.getItem('listNotification')];
                    console.log(ls);
                    if(ls[0] !== null){
                        console.log("sao lai zo day");
                        var temp = ls[0].split(",");
                        temp.push(datetime);
                        localStorage.setItem('listNotification', temp);
                    }else{
                        localStorage.setItem('listNotification', [datetime]);
                    }

                                                    
                    console.log("...........", payload);
                });
            })
            .catch(function (err) {
                console.log("Service worker registration failed, error:", err);
            });
}

