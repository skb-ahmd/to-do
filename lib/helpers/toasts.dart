// import 'dart:ffi';

// import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do/misc/colors.dart';

class Toastsaa {
  static void showInfo(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColor.dark,
      textColor: AppColor.orange,
      fontSize: 16.0,
    );
  }

  static void showError(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColor.orange,
      textColor: AppColor.dark,
      fontSize: 16.0,
    );
  }
}
