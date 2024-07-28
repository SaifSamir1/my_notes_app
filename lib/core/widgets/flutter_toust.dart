

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_notes_app/core/theme/app_colors.dart';

void showFlutterToastSuccess(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: AppColors.blue,
    textColor: Colors.white,
  );
}

void showFlutterToastError(String message) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: Colors.black54,
    textColor: Colors.white,
  );
}