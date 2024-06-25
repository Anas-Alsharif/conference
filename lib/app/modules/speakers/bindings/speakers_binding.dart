import 'package:get/get.dart';

import '../controllers/speakers_controller.dart';

class SpeakersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SpeakersController>(
      () => SpeakersController(),
    );
  }
}
