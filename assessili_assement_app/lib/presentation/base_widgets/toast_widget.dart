import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TostWidget {
  errorToast({String? title, String? message}) {
    return Get.snackbar(title ?? "Invalid!", message ?? "",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        forwardAnimationCurve: Curves.easeInOutBack,
        dismissDirection: DismissDirection.up,
        shouldIconPulse: true,
        overlayBlur: 1,
        instantInit: false,
        duration: const Duration(seconds: 3),
        margin: const EdgeInsets.only(left: 40, right: 40, bottom: 20));
  }

  successToast({String? title, String? message, int? duration}) {
    return Get.snackbar(title ?? "Success", message ?? "",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: Duration(seconds: duration ?? 3),
        forwardAnimationCurve: Curves.easeInOutBack,
        margin: const EdgeInsets.only(left: 40, right: 40, bottom: 20));
  }
}
