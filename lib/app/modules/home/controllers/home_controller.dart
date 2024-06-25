import 'dart:developer';

import 'package:conference/app/src/database.dart';
import 'package:conference/app/src/images.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt themeIndex = 0.obs;
  RxInt spackersIndex = 0.obs;
  List themes = [
    {
      "image": AppImages.themes,
      "value": "INDUSTRY COLLABORATION AND ECOSYSTEMS"
    },
    {"image": AppImages.themes, "value": "INDUSTRY TALENT AND FUTURES"},
    {
      "image": AppImages.themes,
      "value": "INDUSTRY COLLABORATION AND ECOSYSTEMS"
    },
    {"image": AppImages.themes, "value": "INDUSTRY TALENT AND FUTURES"},
    {
      "image": AppImages.themes,
      "value": "INDUSTRY COLLABORATION AND ECOSYSTEMS"
    },
    {"image": AppImages.themes, "value": "INDUSTRY TALENT AND FUTURES"},
  ];

  RxList spackers = RxList([]);

  getSpackers() async {
    try {
      final response = await GetConnect().get(Database.speakers, headers: Database().headers);
      
      if(response.statusCode == 200) {
        final result = response.body["data"];
        spackers.value = result;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSpackers();
  }
}
