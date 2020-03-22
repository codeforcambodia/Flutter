import 'package:flutter/widgets.dart';

Color getHexaColor(String hexaCode) {
  return Color(convertHexaColor(hexaCode));
}

int convertHexaColor(String colorhexcode){ /* Convert Hexa Color */
  String colornew = '0xff' + colorhexcode;
  colornew = colornew.replaceAll('#', '');
  int colorint = int.parse(colornew);
  return colorint;
}