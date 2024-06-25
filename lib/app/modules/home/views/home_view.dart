import 'package:conference/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../src/colors.dart';
import '../../../src/images.dart';
import '../controllers/home_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
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
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                    colors: [
                  AppColors.fillColor.withOpacity(.8),
                  AppColors.blueColor.withOpacity(.8)
                ])),
          ),
          Container(
            color: Colors.black54,
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(top: 150),
              child: Column(children: [
                Image.asset(AppImages.fafLogo, width: 200),
                const SizedBox(height: 30),
                Text("Elevation Global Connectivity".tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w900, fontSize: 30)),
                const SizedBox(height: 80),
                Container(
                  color: AppColors.blue2Color,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text("5,000",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: AppColors.greenColor,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          Text("VISITORS EXPECTED".tr,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.normal))
                        ],
                      ),
                      Column(
                        children: [
                          Text("120+",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: AppColors.greenColor,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          Text("SPEAKERS".tr,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.normal))
                        ],
                      ),
                      Column(
                        children: [
                          Text("100+",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: AppColors.greenColor,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          Text("COUNTRIES".tr,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.normal))
                        ],
                      ),
                      Column(
                        children: [
                          Text("50+",
                              style: TextStyle(
                                  fontSize: 30,
                                  color: AppColors.greenColor,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 5),
                          Text("PARTNERS".tr,
                              style: const TextStyle(
                                  fontSize: 10, fontWeight: FontWeight.normal))
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 40),
                  color: AppColors.secondryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      title(title: "Discover the Future of Aviation"),
                      const Text(
                              "Under the esteemed patronage of the Custodian of the Two Holy Mosques King Salman bin Abdulaziz Al-Saud, the General Authority of Civil Aviation (GACA) is hosting the third edition of the Future Aviation Forum (FAF 2024) at the King Abdulaziz International Conference Center in Riyadh, Saudi Arabia, on 20-22 May 2024. FAF 2024 will focus on 'Elevating Global Connectivity' and strives to enhance aviation ...")
                          .marginSymmetric(horizontal: 33),
                      const SizedBox(height: 15),
                      Text(
                        "Read More".tr,
                        style: TextStyle(
                            fontSize: 16, color: AppColors.greenColor),
                      ).marginSymmetric(horizontal: 33),
                      const SizedBox(height: 25),
                      title(title: "Themes"),
                      CarouselSlider.builder(
                          options: CarouselOptions(
                              height: 100,
                              enlargeCenterPage: true,
                              autoPlay: true,
                              viewportFraction: .7,
                              autoPlayCurve: Curves.linear,
                              enlargeFactor: .1,
                              onPageChanged: (i, _) =>
                                  controller.themeIndex.value = i),
                          itemCount: controller.themes.length,
                          itemBuilder: (BuildContext context, int index,
                                  int pageViewIndex) =>
                              Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 15),
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                      color: AppColors.primaryColor,
                                      borderRadius: BorderRadius.circular(50)),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          controller.themes[index]["image"],
                                          width: 80),
                                      const SizedBox(width: 10),
                                      Expanded(
                                          child: Text(controller.themes[index]
                                              ["value"]))
                                    ],
                                  ))),
                      const SizedBox(height: 20),
                      Obx(() {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: AnimatedSmoothIndicator(
                                activeIndex: controller.themeIndex.value,
                                effect: ExpandingDotsEffect(
                                    dotWidth: 15,
                                    dotHeight: 15,
                                    expansionFactor: 1.01,
                                    dotColor: AppColors.fillColor,
                                    activeDotColor: AppColors.greenColor),
                                count: controller.themes.length),
                          ),
                        );
                      }),
                      const SizedBox(height: 20),
                      title(title: "Featured Speakers"),
                      Obx(() {
                          return controller.spackers.isEmpty ? SpinKitCircle(color: AppColors.greenColor,) :
                          CarouselSlider.builder(
                              options: CarouselOptions(
                                  height: 200,
                                  enlargeCenterPage: true,
                                  autoPlay: true,
                                  viewportFraction: .3,
                                  autoPlayCurve: Curves.linear,
                                  enlargeFactor: .1,
                                  onPageChanged: (i, _) =>
                                      controller.spackersIndex.value = i),
                              itemCount: 5,
                              itemBuilder: (BuildContext context, int index,
                                      int pageViewIndex) =>
                                  Container(
                                      margin:
                                          const EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: AppColors.primaryColor,
                                          border: Border.all(
                                              color: AppColors.greenColor,
                                              width: 2),
                                          borderRadius: BorderRadius.circular(15)),
                                      child: Column(
                                        children: [
                                          SizedBox(
                                            height: 120,
                                            child: ClipRRect(
                                              borderRadius: const BorderRadius.only(
                                                  topLeft: Radius.circular(15),
                                                  topRight:
                                                     Radius.circular(15)),
                                              child: Image.network(
                                                controller.spackers[index]["image"],
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Row(
                                            children: [
                                              Expanded(
                                                  child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  SizedBox(
                                                      height: 30,
                                                      child: Text(
                                                          controller.spackers[index]
                                                              ["name"],
                                                          maxLines: 2,
                                                          overflow:
                                                              TextOverflow.ellipsis,
                                                          style: TextStyle(
                                                              color: AppColors
                                                                  .greenColor,
                                                              fontSize: 10))),
                                                  Text(
                                                      controller.spackers[index]
                                                          ["sample_description"],
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          color: AppColors.greyColor
                                                              .withOpacity(.7),
                                                          fontSize: 8)),
                                                ],
                                              )),
                                            ],
                                          ).marginSymmetric(horizontal: 10)
                                        ],
                                      )));
                        }
                      ),
                      const SizedBox(height: 20),
                      Obx(() {
                        return Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: AnimatedSmoothIndicator(
                                activeIndex: controller.spackersIndex.value,
                                effect: ExpandingDotsEffect(
                                    dotWidth: 15,
                                    dotHeight: 15,
                                    expansionFactor: 1.01,
                                    dotColor: AppColors.fillColor,
                                    activeDotColor: AppColors.greenColor),
                                count: 5),
                          ),
                        );
                      }),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(child: Divider(color: AppColors.greenColor)),
                          TextButton(
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.transparent,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(
                                          color: AppColors.greenColor))),
                              onPressed: () => Get.toNamed(Routes.SPEAKERS, arguments: controller.spackers),
                              child: Text("View All Speakers".tr)),
                          Expanded(child: Divider(color: AppColors.greenColor)),
                        ],
                      ),
                      title(title: "Program at a glance"),
                      imageMenu(title: "View Program"),
                      title(title: "Sponsors and Partners"),
                      imageMenu(title: "View Sponsors and Partners"),
                      title(title: "Sponsorships"),
                      imageMenu(title: "PDF"),
                      title(title: "Media Center"),
                      imageMenu(title: "View all Media"),
                      title(title: "Venue"),
                      const SizedBox(height: 20),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "King Abdulaziz International Conference Center (KAICC), Al Hada, Riyadh 12912, Saudi Arabia"),
                          SizedBox(height: 20),
                          Text("Day 1: 09:00 - 18:00"),
                          SizedBox(height: 20),
                          Text("Day 2: 09:00 - 17:00"),
                          SizedBox(height: 20),
                          Text("Day 3: By invitation Only 08:30 - 14:00"),
                        ],
                      ).marginSymmetric(horizontal: 33),
                      Container(
                        height: 200,
                        margin: const EdgeInsets.all(20),
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: GoogleMap(
                            mapType: MapType.terrain,
                            myLocationEnabled: false,
                            myLocationButtonEnabled: false,
                            initialCameraPosition: const CameraPosition(
                                target: LatLng(24.8347746, 46.6831648),
                                zoom: 17),
                            onMapCreated: (GoogleMapController controller) {},
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(AppImages.youtube, width: 80),
                          Image.asset(AppImages.x, width: 80),
                          Image.asset(AppImages.linkedin, width: 80),
                        ],
                      ).marginSymmetric(horizontal: 20, vertical: 30)
                    ],
                  ),
                ),
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget title({required String title}) => Row(
        children: [
          Icon(Icons.circle, color: AppColors.greenColor, size: 8),
          const SizedBox(width: 5),
          Text(
            title.toString().tr,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ).paddingSymmetric(horizontal: 20, vertical: 20);

  Widget imageMenu({required String title}) => Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.asset(AppImages.program),
          Container(
            height: 107,
            alignment: Alignment.bottomLeft,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.black38, borderRadius: BorderRadius.circular(10)),
            child:
                Text(title.toString().tr, style: const TextStyle(fontSize: 18)),
          )
        ],
      ).marginSymmetric(horizontal: 20);
}
