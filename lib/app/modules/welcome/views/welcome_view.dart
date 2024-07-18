import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../src/colors.dart';
import '../../../src/images.dart';
import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});
  @override
  Widget build(BuildContext context) {
        return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          AppImages.bgImage,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                AppColors.fillColor.withOpacity(.5),
                AppColors.blueColor.withOpacity(.5)
              ])),
        ),
        Container(
            color: Colors.black54,
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: double.infinity,
              child: Container(
                height: Get.height / 1.4,
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  children: [
                    Image.asset(AppImages.fafLogo, width: 160),
                    const SizedBox(height: 30),
                    Text("Future Aviation Forum".tr,
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 30),
                    Text("Make a good first\nimpression".tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 24, height: 1.5)),
                    const SizedBox(height: 30),
                    Text(
                        "Log in create your profile and get the most out of your event experience"
                            .tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16,
                            height: 1.5,
                            color: AppColors.greyColor.withOpacity(.5))),
                    const SizedBox(height: 30),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                            onPressed: () => Get.toNamed(Routes.LOGIN),
                            child: Text("Sign in".tr))),
                    const SizedBox(height: 50),
                    InkWell(
                        onTap: () => Get.toNamed(Routes.SIGNUP),
                        child: Text("Register For The Event ?".tr))
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}
