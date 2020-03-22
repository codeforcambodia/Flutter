import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:responsive_ui/chatlistpage.dart';
import 'dart:ui' as ui;

import 'package:responsive_ui/services.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(
    MyApp()
    // DevicePreview(
    //   builder: (context) => MyApp(),
    // )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.of(context).locale,
      // builder: DevicePreview.appBuilder,
      title: 'Flutter Demo',
      theme: ThemeData(
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
      ),
      home: ChatListPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Color defaultColor = getHexaColor("#00ffef").withOpacity(0.8);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: getHexaColor("#192c38"),
      body: Container(
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.centerLeft, end: Alignment.centerRight,
        //     colors: [
        //       getHexaColor("#2aba94"),
        //       getHexaColor("#2cb9ad")
        //     ]
        //   )
        // ),
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft, end: Alignment.centerRight,
                  colors: [
                    getHexaColor("#00ffef").withOpacity(0.8),
                    // getHexaColor("#00ffef").withOpacity(0.8),
                    getHexaColor("#006962").withOpacity(0.8)
                  ]
                )
              ),
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 45.0, bottom: 10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    // decoration: BoxDecoration(
                    //   color: getHexaColor("#00ffef"),
                    //   border: Border.all(width: 1, color: Colors.black.withOpacity(0.2)),
                    //   boxShadow: [
                    //     BoxShadow(
                    //       blurRadius: 2,
                    //       spreadRadius: 0.5,
                    //       color: Colors.black.withOpacity(0.5),
                    //       offset: Offset(
                    //         2, 1
                    //       )
                    //     )
                    //   ],
                    //   borderRadius: BorderRadius.circular(50)
                    // ),
                    child: IconButton(
                      icon: Icon(Icons.sort, color: Colors.white,),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Screen2()));
                      },
                    ),
                  ),  
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    child: Text(
                      widget.title, 
                      style: TextStyle(
                        color: Colors.white, 
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      ),
                    ),
                  )
                ],
              ),
            ),
            myCard(context, defaultColor),
            Center(
              // Center is a layout widget. It takes a single child and positions it
              // in the middle of the parent.
              child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Invoke "debug painting" (press "p" in the console, choose the
                // "Toggle Debug Paint" action from the Flutter Inspector in Android
                // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
                // to see the wireframe for each widget.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$size',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget myCard(BuildContext context, Color defaultColor) {
  return Card(
    margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
    color: defaultColor,
    child: Container(
      height: 150.0,
      child: Center(
        child: Text("Hello world"),
      ),
    ),
  );
}

class Screen2 extends StatelessWidget{
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
        title: Text("Screen 2"),
      ),
      body: Center(
        child: Text("Hello screen 2"),
      ),
    );
  }
}
