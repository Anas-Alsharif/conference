import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../routes/app_pages.dart';
import '../../../src/colors.dart';
import '../../../src/images.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  const OtpView({super.key});
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
                        child: Text("Confirmation Code".tr,
                            style: const TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold))),
                    const SizedBox(height: 30),
                    Text(
                        "Please write the 6-digit code sent via your email correctly"
                            .tr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            height: 1.5,
                            fontSize: 18,
                            color: AppColors.greyColor.withOpacity(.8))),
                    const SizedBox(height: 30),
                    Directionality(
                        textDirection: TextDirection.ltr,
                        child: PinCodeTextField(
                          appContext: context,
                          length: 5,
                          controller: controller.code,
                          pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(10),
                              inactiveFillColor: AppColors.fillColor,
                              inactiveColor:
                                  AppColors.greyColor.withOpacity(.8),
                              selectedColor: AppColors.greenColor),
                        )),
                    const SizedBox(height: 10),
                    Obx(() {
                      return Row(
                        children: [
                          Icon(Icons.timer_rounded,
                              color: AppColors.greenColor, size: 18),
                          const SizedBox(width: 5),
                          Text(
                              "00:${((controller.timer.value) % 60).toString().padLeft(2, '0')}",
                              style: TextStyle(color: AppColors.greenColor)),
                          const Spacer(),
                          InkWell(
                            onTap: () => controller.timer.value != 0
                                ? null
                                : controller.sendOtp(),
                            child: Text("Resend the code",
                                style: TextStyle(
                                    color: controller.timer.value == 0
                                        ? AppColors.greenColor
                                        : AppColors.greyColor.withOpacity(.5))),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(height: 40),
                
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: TextButton(
                            onPressed: () => controller.confirmOtp(),
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
