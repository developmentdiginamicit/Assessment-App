import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showLoadingDialog() {
  Get.defaultDialog(
    barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
    title: "Please wait...",
    content: const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircularProgressIndicator(),
      ],
    ),
  );
}