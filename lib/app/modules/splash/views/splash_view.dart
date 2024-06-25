import 'package:conference/app/src/colors.dart';
import 'package:conference/app/src/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
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
            color: Colors.black45,
            child: SizedBox(
              width: double.infinity,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(AppImages.fafLogo, width: 300),
                    const SizedBox(height: 30),
                    Text("Elevation Global Connectivity".tr,
                        style: const TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 50)),
                    const Divider(height: 50),
                    Text("WHEN & WHERE".tr,
                        style: TextStyle(color: AppColors.greenColor)),
                    const SizedBox(height: 12),
                    const Text("20 - 22 May 2024"),
                    const SizedBox(height: 12),
                    Text("Riyadh, Saudi Arabia".tr)
                  ],
                ).marginSymmetric(horizontal: 40, vertical: 130),
              ),
            ),
          )
        ],
      ),
    );
  }
}
