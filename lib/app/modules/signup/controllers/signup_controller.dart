import 'dart:developer';

import 'package:conference/app/src/alert.dart';
import 'package:conference/app/src/database.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  RxBool loading = false.obs;

  signup() async {
    if (loading.value) return;
    if (name.text.trim().isEmpty) {
      return Get.showSnackbar(
          Ui.DefaultSnackBar(message: "Please Enter Your Name".tr));
    }
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
        "name": name.text,
        "email": email.text,
      };
      final response = await GetConnect()
          .post(Database.signup, headers: Database().headers, body);
      final result = response.body;
      log(result.toString());
      loading.value = false;
    } catch (e) {
      loading.value = false;
      log(e.toString());
    }
  }
}
