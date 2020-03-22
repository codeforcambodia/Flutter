import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget avatar(){
  return FittedBox(
    fit: BoxFit.contain,
    child: Text(
      "Init",
      style: TextStyle(color: Colors.blue, fontSize: 14.0),
    ),
  );
}