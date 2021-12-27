import 'package:flutter/material.dart';

extension HexColor on Color {
  getColorFromHex() {
//    hexColor = hexColor.toUpperCase().replaceAll("#", "");
//    if (hexColor.length == 6) {
      var hexColor = "FF" + this.toString();
//    }
    return Color(int.parse(hexColor, radix: 16));

  }
}
