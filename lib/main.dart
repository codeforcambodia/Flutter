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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page', app: app),
    );
  }
}

