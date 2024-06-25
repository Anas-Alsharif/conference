import 'package:bottom_bar_matu/bottom_bar_matu.dart';
import 'package:conference/app/src/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(bottom: 15, top: 10),
        decoration: BoxDecoration(color: AppColors.primaryColor, borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))),
        child: BottomBarBubble(
          selectedIndex: controller.index.value,
          backgroundColor: Colors.transparent,
          color: AppColors.greenColor,
          items: [
            BottomBarItem(iconData: CupertinoIcons.home),
            BottomBarItem(iconData: CupertinoIcons.calendar),
            BottomBarItem(iconData: CupertinoIcons.person),
            BottomBarItem(iconData: CupertinoIcons.bars),
          ],
          onSelect: (index) => controller.index.value = index,
        ),
      ),
      body: Obx(() {
          return controller.pages[controller.index.value];
        }
      )
    );
  }
}
