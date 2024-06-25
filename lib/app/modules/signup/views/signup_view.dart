import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../src/colors.dart';
import '../../../src/images.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  const SignupView({super.key});
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
                height: Get.height / 1.55,
                padding:
                    const EdgeInsets.symmetric(vertical: 70, horizontal: 30),
                decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                        child: Text("SIGNUP".tr,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    const SizedBox(height: 30),
                    Text("Full Name".tr, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.name,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(FontAwesomeIcons.solidUser)),
                    ),
                    const SizedBox(height: 20),
                    Text("Email".tr, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(FontAwesomeIcons.solidEnvelope)),
                      onSubmitted: (_) => controller.signup(),
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                            onPressed: () => controller.signup(),
                            child: Obx(() {
                              return controller.loading.value
                                  ? SpinKitThreeBounce(
                                      color: AppColors.primaryColor, size: 20)
                                  : Text("Go".tr);
                            }))),
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}
