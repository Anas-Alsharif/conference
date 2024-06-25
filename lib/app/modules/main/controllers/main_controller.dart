import 'package:conference/app/modules/home/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  RxInt index = 0.obs;

  List<Widget> pages = [
    const HomeView(),
    const Scaffold(
      body: Center(
        child: Text("EVENTS"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("PRFOFILE"),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text("MORE"),
      ),
    )
  ];
}
