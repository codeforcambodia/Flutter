<<<<<<< HEAD
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
=======
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// // import 'package:flutter/scheduler.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io' show Platform;

import 'package:local_notification/custrom_notification.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app;

  try {

    print(Firebase.apps);
    app = await Firebase.initializeApp(
      name: "local_notification",
      options: FirebaseOptions(
        appId: '1:367208051911:android:2029a2966071004ed4bae2"',
        apiKey: 'AIzaSyAVZb9M5TEqNOepLtiPSLvw7_0mt-WC0s8',
        messagingSenderId: '367208051911',
        projectId: 'notification-98c25',
        databaseURL: 'https://notification-98c25.firebaseio.com',
      )
    );
    
  } catch (e) {
    print(e.message);
    app = Firebase.apps[1];
  }

  runApp(MyApp(app: app));
}

class MyApp extends StatelessWidget {

  final FirebaseApp app;

  MyApp({this.app});

>>>>>>> ea1f1136cfd46ca736d830bb11b5a93795349f0a
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
<<<<<<< HEAD
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
=======
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', app: app),
>>>>>>> ea1f1136cfd46ca736d830bb11b5a93795349f0a
    );
  }
}

<<<<<<< HEAD
class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  String _message = '';

  @override
  void initState() {
    _registerOnFirebase();
    _showNotification();
    var androidInitialize = AndroidInitializationSettings('ic_launcher');
    var iOSinitialize = IOSInitializationSettings();
    var initializationSettings = InitializationSettings(android: androidInitialize, iOS: iOSinitialize);
    flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: notificationSelected);
    getMessage();
    super.initState();
  }

  Future notificationSelected(String payload){

  }

  Future _showNotification() async {
    var androidDetails = AndroidNotificationDetails("channel ID", "Daveat", "This is my love");
    var iOSDetails = IOSNotificationDetails();
    var generalNotificationDetails = NotificationDetails(android: androidDetails, iOS: iOSDetails);
    await flutterLocalNotificationsPlugin.show(0, "Task", "Hey my love", generalNotificationDetails);
  }

  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print('received message');
      setState(() => _message = message["notification"]["body"]);
    }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["body"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["body"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Push Notifications Test'),
      ),
      body: Container(
          child: Center(
        child: Text("Message: $_message"),
      )),
    );
  }
}
=======
>>>>>>> ea1f1136cfd46ca736d830bb11b5a93795349f0a
