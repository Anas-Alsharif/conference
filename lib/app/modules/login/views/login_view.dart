import 'package:conference/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../src/colors.dart';
import '../../../src/images.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
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
                        child: Text("SIGN IN".tr,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    const SizedBox(height: 30),
                    Text("Email".tr, style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 10),
                    TextField(
                      controller: controller.email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.done,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(FontAwesomeIcons.solidEnvelope)),
                      onSubmitted: (_) => controller.login(),
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      return Row(
                        children: [
                          Text("Remember me".tr),
                          const Spacer(),
                          CupertinoSwitch(
                              value: controller.rememberMe.value,
                              activeColor: AppColors.greenColor,
                              onChanged: (value) {
                                controller.rememberMe.value = value;
                                GetStorage().write("rememberMe", value);
                              })
                        ],
                      );
                    }),
                    const SizedBox(height: 30),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                            onPressed: () => controller.login(),
                            child: Obx(() {
                              return controller.loading.value
                                  ? SpinKitThreeBounce(
                                      color: AppColors.primaryColor, size: 20)
                                  : Text("Go".tr);
                            }))),
                    const SizedBox(height: 50),
                    Center(
                      child: InkWell(
                          onTap: () => Get.toNamed(Routes.SIGNUP),
                          child: Text("Register For The Event ?".tr)),
                    )
                  ],
                ),
              ),
            ))
      ],
    ));
  }
}
