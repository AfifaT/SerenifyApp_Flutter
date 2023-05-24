import 'package:flutter/material.dart';
//this function takes a string, converts it into one which is accepted by flutter
hexStringToColor(String hexColor) {
  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if(hexColor.length ==6)
    {
      hexColor = "FF" + hexColor;
    }
  return Color(int.parse(hexColor , radix: 16));

}