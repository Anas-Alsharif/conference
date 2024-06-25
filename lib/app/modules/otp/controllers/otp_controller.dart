import 'dart:async';
import 'dart:developer';

import 'package:conference/app/routes/app_pages.dart';
import 'package:conference/app/src/database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../src/alert.dart';

class OtpController extends GetxController {
  TextEditingController code = TextEditingController();
  RxBool loading = false.obs;
  String email = Get.arguments;
  RxInt timer = 59.obs;

  sendOtp() async {
    Map body = {"email": email};
    final response = await GetConnect().post(Database.login, body);
    final result = response.body;
    if (response.statusCode == 200) {
      timer.value = 59;
      Timer.periodic(const Duration(milliseconds: 1000), (time) {
        if (timer.value > 0) {
          timer.value -= 1;
        } else {
          time.cancel();
        }
      });
      return;
    }
    if (response.statusCode == 429) {
      Get.showSnackbar(Ui.ErrorSnackBar(message: "Too Many Attempts".tr));
    } else {
      Get.showSnackbar(Ui.ErrorSnackBar(message: result["message"].toString()));
    }
  }

  confirmOtp() async {
    if (loading.value) return;
    if (code.text.length != 5) {
      return Get.showSnackbar(
          Ui.DefaultSnackBar(message: "Please Enter The Verification Code".tr));
    }

    try {
      loading.value = true;
      Map body = {"email": email, "otp": code.text};
      final response = await GetConnect().post(Database.otp, body);
      log(response.statusCode.toString());
      loading.value = false;
      final result = response.body;
      if (response.statusCode == 200) {
        GetStorage().write("token", result["token"]);
        Get.offAllNamed(Routes.MAIN);
        return;
      }
      if (response.statusCode == 401) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: "Invalid OTP".tr));
      } else if (response.statusCode == 429) {
        Get.showSnackbar(Ui.ErrorSnackBar(message: "Too Many Attempts".tr));
      } else {
        Get.showSnackbar(
            Ui.ErrorSnackBar(message: result["message"].toString()));
      }
    } catch (e) {
      loading.value = false;
      log(e.toString());
    }
    // loading.value = true;
  }

  @override
  void onInit() {
    super.onInit();
    Timer.periodic(const Duration(milliseconds: 1000), (time) {
      if (timer.value > 0) {
        timer.value -= 1;
      } else {
        time.cancel();
      }
    });
  }
}
