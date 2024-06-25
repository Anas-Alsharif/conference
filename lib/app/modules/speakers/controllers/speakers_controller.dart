import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SpeakersController extends GetxController {
  RxList speakers = RxList(Get.arguments);
  RxList allSpeakers = RxList(Get.arguments);
  ScrollController scrollController = ScrollController();
  RxBool enableSearch = false.obs;

  searchList(value) {
    speakers.value = allSpeakers
        .where((name) => name["name"]
            .toString()
            .toLowerCase()
            .contains(value.toString().toLowerCase()))
        .toList();
  }
}
