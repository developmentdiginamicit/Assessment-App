import 'dart:developer';
import 'package:assessili_assement_app/data/local_storage.dart';
import 'package:assessili_assement_app/domain/auth/auth_repo.dart';
import 'package:assessili_assement_app/presentation/auth/presentation/login_screen.dart';
import 'package:assessili_assement_app/presentation/auth/presentation/otp_screen.dart';
import 'package:assessili_assement_app/presentation/base_widgets/succes_widget.dart';
import 'package:assessili_assement_app/utils/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../base_widgets/toast_widget.dart';

class AuthController extends GetxController {
  final _authRepo = AuthRepo();
  final _localStorage = LocalStorage();
  RxBool isObscuredNewPassword = true.obs;
  RxBool isObscuredConfirmPassword = true.obs;
  RxBool isObscuredProfilePassword = true.obs;
  RxBool isObscuredLoginPassword = false.obs;
  final newPasswordController = TextEditingController().obs;
  final confirmPasswordController = TextEditingController().obs;

  /// registration
  final registrationnameController = TextEditingController().obs;
  final registrationemailController = TextEditingController().obs;
  final registrationschoolController = TextEditingController().obs;
  final registrationboardController = TextEditingController().obs;
  final registrationphoneController = TextEditingController().obs;
  final registrationclassController = TextEditingController().obs;
  final registrationsectionController = TextEditingController().obs;
  final registrationaddressController = TextEditingController().obs;
  final registrationregisterPass = TextEditingController().obs;
  final registrationguardianController = TextEditingController().obs;
  final registrationeditPhoneController = TextEditingController().obs;
  final registrationeditPasswordController = TextEditingController().obs;

  /// clear all controller
  void clearAllRegistrationControllers() {
    registrationnameController.value.clear();
    registrationemailController.value.clear();
    registrationschoolController.value.clear();
    registrationboardController.value.clear();
    registrationphoneController.value.clear();
    registrationclassController.value.clear();
    registrationsectionController.value.clear();
    registrationaddressController.value.clear();
    registrationregisterPass.value.clear();
    registrationguardianController.value.clear();
    registrationeditPhoneController.value.clear();
    registrationeditPasswordController.value.clear();
  }

  editProfile() {
    registrationnameController.value.text = "";
    registrationemailController.value.text = "";
    registrationschoolController.value.text = "";
    registrationboardController.value.text = "";
    registrationphoneController.value.text = "";
    registrationclassController.value.text = "";
    registrationsectionController.value.text = "";
    registrationaddressController.value.text = "";
    registrationguardianController.value.text = "";
    registrationeditPhoneController.value.text = "";
    registrationeditPasswordController.value.text = "";
  }

  /// login
  ///
  final loginEmailController = TextEditingController().obs;
  final loginPhoneController = TextEditingController().obs;
  final loginPasswordController = TextEditingController().obs;

  void toggleNewPasswordVisibility() {
    isObscuredNewPassword.value = !isObscuredNewPassword.value;
  }

  void toggleConfirmPasswordVisibility() {
    isObscuredConfirmPassword.value = !isObscuredConfirmPassword.value;
  }

  void toggleProfilePasswordVisibility() {
    isObscuredProfilePassword.value = !isObscuredProfilePassword.value;
  }

  RxBool isPhoneSelected = false.obs;

  void toggleSelection(bool isPhone) {
    isPhoneSelected.value = isPhone;
  }

  RxBool isObscuredReg = true.obs;
  void regToggleVisibility() {
    isObscuredReg.value = !isObscuredReg.value;
  }

  RxBool isRegisterButtonLoading = false.obs;
  registration() async {
    Map<String, dynamic> reqModel = {
      "fullName": registrationnameController.value.text,
      "email": registrationemailController.value.text,
      "board": registrationboardController.value.text,
      "school": registrationschoolController.value.text,
      "phoneNumber": registrationeditPhoneController.value.text,
      "password": registrationeditPasswordController.value.text
    };
    try {
      isRegisterButtonLoading(true);
      final response = await _authRepo.userRegister(reqModel);
      if (response.errorMessage != null) {
        TostWidget()
            .errorToast(title: "Error!", message: response.errorMessage ?? "");
      } else if (response.data!['status'] == false) {
        TostWidget().errorToast(
            title: "Error!", message: response.data!['errors'][0]['message']);
      } else {
        TostWidget().successToast(
            title: "Success!", message: response.data!['message']);

        navigation(Get.context!, OtpScreen(isCommingFrom: false));
      }
    } finally {
      isRegisterButtonLoading(false);
    }
  }

  RxBool isLoginLoading = false.obs;
  RxBool isObscuredLogin = true.obs;
  void loginToggleVisibility() {
    isObscuredLogin.value = !isObscuredLogin.value;
  }

  login() async {
    Map<String, dynamic> reqModel = {
      "identifier": isPhoneSelected.value
          ? loginPhoneController.value.text
          : loginEmailController.value.text,
      "password": loginPasswordController.value.text,
    };
    try {
      isLoginLoading(true);
      final response = await _authRepo.userLogin(reqModel: reqModel);
      log("res--> ${response.data.toString()}");
      if (response.errorMessage != null) {
        TostWidget()
            .errorToast(title: "Error!", message: response.errorMessage!);
      } else if (response.data!['status'] == false) {
        TostWidget()
            .errorToast(title: "Error!", message: response.data!['message']);
      } else {
        log(response.data!["data"]['token'].toString());
        _localStorage.setToken(
            token: response.data!["data"]['token'].toString());
        TostWidget()
            .successToast(title: "Success!", message: "Login Successfully");
        clearAfterLogin();
        navigatePushRemoveUntil(
            Get.context!, SuccesWidget(title: "Login Successfully"));
      }
    } finally {
      isLoginLoading(false);
    }
  }

  sendOtp({bool isResend = false}) async {
    Map<String, dynamic> reqModel = {
      "identifier": isPhoneSelected.value
          ? loginPhoneController.value.text
          : loginEmailController.value.text,
    };
    try {
      isLoginLoading(true);
      final response = await _authRepo.sendOtpForLogin(reqModel: reqModel);
      log("res--> ${response.data.toString()}");
      if (response.errorMessage != null) {
        TostWidget()
            .errorToast(title: "Error!", message: response.errorMessage!);
      } else if (response.data!['status'] == false) {
        TostWidget()
            .errorToast(title: "Error!", message: response.data!['message']);
      } else {
        TostWidget().successToast(
            title: "Success!",
            message: "Otp : ${response.data!['data']['otp']}");
        isResend == true
            ? null
            : navigatePushRemoveUntil(
                Get.context!,
                OtpScreen(
                  isCommingFrom: true,
                ));
      }
    } finally {
      isLoginLoading(false);
    }
  }

  logout() {
    _localStorage.deleteAllLocalData();
    TostWidget().successToast(
        title: "Logged out!", message: "You have logged out successfully.");
    navigatePushRemoveUntil(Get.context!, const LoginScreen());
  }

  clearAfterLogin() {
    loginEmailController.value.clear();
    loginPhoneController.value.clear();
    loginPasswordController.value.clear();
    isObscuredNewPassword(true);
    isLoginLoading(false);
  }

  getProfile() async {
    try {
      isLoginLoading(true);
      final response = await _authRepo.getProfile();
      log("res--> ${response.data.toString()}");
      if (response.errorMessage != null) {
        TostWidget()
            .errorToast(title: "Error!", message: response.errorMessage!);
      } else if (response.data!['status'] == false) {
        TostWidget()
            .errorToast(title: "Error!", message: response.data!['message']);
      } else {
        TostWidget().successToast(title: "Success!", message: "ahsdfjahsfdh");
      }
    } finally {
      isLoginLoading(false);
    }
  }
}
