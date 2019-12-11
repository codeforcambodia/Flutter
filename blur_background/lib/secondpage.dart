import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class SecondPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SecondPageState();
  }
}

class SecondPageState extends State<SecondPage> {
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 5.0,
            sigmaY: 5.0
          ),
          child: Center(
            child: Text("Second Page"),
          ),
        ),
      ),
    );
  }
}