import 'package:flutter/material.dart';

class AppColor {
  static const MaterialColor dark = MaterialColor(
    0xFF041C32, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFF041c32), //10%
      100: Color(0xFF04192d), //20%
      200: Color(0xFF031628), //30%
      300: Color(0xFF031423), //40%
      400: Color(0xff02111e), //50%
      500: Color(0xff020e19), //60%
      600: Color(0xff020b14), //70%
      700: Color(0xff01080f), //80%
      800: Color(0xff01060a), //90%
      900: Color(0xff000000), //100%
    },
  );
  static final Color light = Color(0xFF04293A);
  static final Color normal = Color(0xFF064663);
  static final Color orange = Color(0xFFECB365);
} // y

// static final Color darc = Color(0xFF041C32);

