import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          /* Sliver App Bar */
          SliverAppBar(
            centerTitle: true,
            title: Text("Sliver App Bar"),
            floating: true,
          ),
          /* Body */
          // SliverFixedExtentList(
          //   itemExtent: 200.0,
          //   delegate: 
          //   SliverChildListDelegate(
          //     [
          //       Container(color: Colors.red),
          //       Container(color: Colors.purple),
          //       Container(color: Colors.green),
          //       Container(color: Colors.orange),
          //       Container(color: Colors.yellow),
          //       Container(color: Colors.pink),
          //       Container(color: Colors.red),
          //       Container(color: Colors.purple),
          //       Container(color: Colors.green),
          //       Container(color: Colors.orange),
          //       Container(color: Colors.yellow),
          //       Container(color: Colors.pink),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
