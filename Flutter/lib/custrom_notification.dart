
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:io' show Platform;
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {

  final FirebaseApp app;

  MyHomePage({Key key, this.title, this.app}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  final referenceDatabase = Firebase.app();

  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings _androidInitializationSettings;
  IOSInitializationSettings _iosInitializationSettings;
  InitializationSettings _initializationSettings;

  DatabaseReference _messagesRef;

  DataSnapshot data;

  FirebaseDatabase database;

  StreamController _stream = StreamController();

  @override
  void initState(){
    super.initState();
    initializing();
    // Timer.periodic(Duration(seconds: 3), (timer) {
      pushFirebase();
    // });
  }

  void initializing() async {
    _androidInitializationSettings = AndroidInitializationSettings('app_icon');
    _iosInitializationSettings = IOSInitializationSettings(onDidReceiveLocalNotification: onDidReceiveNotification);
    _initializationSettings = InitializationSettings(android: _androidInitializationSettings, iOS: _iosInitializationSettings);
    await _flutterLocalNotificationsPlugin.initialize(_initializationSettings, onSelectNotification: onSelectionNotification);
  }

  void _showNotification() async {


    // _counterRef = FirebaseDatabase.instance.reference().child('counter');
    // await notification();
  }
  
  Future<void> notification() async {
    // AndroidNotificationDetails androidNotificationDetails = new AndroidNotificationDetails(
    //   'Channel ID',
    //   'Channel title',
    //   'channel body',
    //   importance: Importance.max,
    // );

    // IOSNotificationDetails iosNotificationDetails = IOSNotificationDetails();

    // NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails, iOS: iosNotificationDetails);

    // await _flutterLocalNotificationsPlugin.show(0, "Hello there", "Please love me", notificationDetails);
  }

  Future onSelectionNotification(String payload) async {
    if (payload != null){
      print(payload);
    }

    // Navigator.push(context, route)
  }

  void pushFirebase(){

    print(widget.app);

    final FirebaseDatabase database = FirebaseDatabase(app: widget.app);

    // database.reference().child("flutterDevsTeam1").set({
    //   'name': 'Deepak Nishad',
    //   'description': 'My Lead'
    // });
    
    database.reference().child('user1').once().then((DataSnapshot snapshot) {
      print('Connected to second database and read ${snapshot.value}');
      data = snapshot;
      _stream.add(data.value);
    });
  }

  Future onDidReceiveNotification(int id, String title, String body, String payload) async {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(body),
      actions: [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: (){
            print("");
          },
          child: Text("Okay"),
        )
      ],
    );
  }

  Future<String> getSakaryaAir() async {
      String url =
          'https://www.random.org/integers/?num=1&min=1&max=6&col=1&base=10&format=plain&rnd=new';
      final response = await http.get(url, headers: {"Accept": "application/json"});

      return response.body;
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder(
              stream: _stream.stream,
              builder: (context, snapshot) {
                print("my snapshot ${snapshot.data}");
                if (snapshot.data == null) return Text('Data null');
                if (snapshot.hasError) return Text("No data");
                else if (snapshot.hasData) return Text(snapshot.data['name']);
              },
            ), 
            
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: pushFirebase,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
