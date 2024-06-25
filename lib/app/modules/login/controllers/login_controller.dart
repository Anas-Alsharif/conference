import 'dart:developer';

import 'package:conference/app/routes/app_pages.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../src/alert.dart';
import '../../../src/database.dart';

class LoginController extends GetxController {
  RxBool rememberMe = false.obs;

  TextEditingController email = TextEditingController();
  RxBool loading = false.obs;

  login() async {
    if (loading.value) return;
    if (email.text.trim().isEmpty) {
      return Get.showSnackbar(
          Ui.DefaultSnackBar(message: "Please Enter Your Email".tr));
    }
    if (!EmailValidator.validate(email.text)) {
      return Get.showSnackbar(
          Ui.DefaultSnackBar(message: "Please Enter a Valid Email".tr));
    }

    try {
      loading.value = true;
      Map body = {
        "email": email.text,
      };
      final response = await GetConnect()
          .post(Database.login, headers: Database().headers, body);
      loading.value = false;
      final result = response.body;
      if (response.statusCode == 200) {
        Get.toNamed(Routes.OTP, arguments: email.text);
        return;
      }
      if (response.statusCode == 401) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: "Email is incorrect".tr));
      } else
      if (response.statusCode == 429) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: "Too Many Attempts".tr));
      } else {
        Get.showSnackbar(
            Ui.ErrorSnackBar(message: result["message"].toString()));
      }
    } catch (e) {
      loading.value = false;
      log(e.toString());
    }
  }
}
