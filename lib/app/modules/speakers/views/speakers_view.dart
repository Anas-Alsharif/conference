import 'package:conference/app/src/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '../controllers/speakers_controller.dart';
import 'package:vs_scrollbar/vs_scrollbar.dart';

class SpeakersView extends GetView<SpeakersController> {
  const SpeakersView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: AppBar(
            title: controller.enableSearch.value
                ? TextField(
                    decoration: InputDecoration(
                        hintText: "Serach".tr,
                        suffixIcon:
                            InkWell(
                                onTap: () => controller.enableSearch.value = false,
                              child: const Icon(Icons.close, color: Colors.white)),
                        prefixIcon: const Icon(
                          FontAwesomeIcons.magnifyingGlass,
                          color: Colors.white,
                        )),
                        onChanged: (value) => controller.searchList(value),
                  )
                : Text('All Speakers'.tr),
            centerTitle: true,
            automaticallyImplyLeading: !controller.enableSearch.value,
            actions: [
              Visibility(
                visible: !controller.enableSearch.value,
                child: IconButton(
                    onPressed: () => controller.enableSearch.value = true,
                    icon: const Icon(FontAwesomeIcons.magnifyingGlass)),
              )
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: AppColors.greenColor)),
                  child: const Text("Featured")),
              Expanded(
                  child: controller.speakers.isEmpty ? const Center(
                    child: Text("No Speakers Found!"),
                  ) : VsScrollbar(
                controller: controller.scrollController,
                showTrackOnHover: true,
                isAlwaysShown: true,
                scrollbarFadeDuration: const Duration(milliseconds: 500),
                scrollbarTimeToFade: const Duration(milliseconds: 800),
                style: VsScrollbarStyle(
                  hoverThickness: 10.0,
                  radius: const Radius.circular(20),
                  thickness: 5.0,
                  color: AppColors.greenColor,
                ),
                child: ListView.builder(
                    controller: controller.scrollController,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    itemCount: controller.speakers.length,
                    itemBuilder: (_, index) {
                      return Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(500),
                            child: Image.network(
                              controller.speakers[index]["image"],
                              width: 70,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(controller.speakers[index]["name"],
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                const SizedBox(height: 10),
                                Text(
                                    controller.speakers[index]
                                        ["sample_description"],
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: AppColors.greyColor
                                            .withOpacity(.8))),
                              ],
                            ),
                          )
                        ],
                      ).marginSymmetric(vertical: 5);
                    }),
              ))
            ],
          ));
    });
  }
}
