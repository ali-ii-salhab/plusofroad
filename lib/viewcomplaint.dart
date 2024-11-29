import 'dart:developer';

import 'package:plusofroad/controller/complaiment_controller.dart';
import 'package:plusofroad/core/constants/colors.dart';
import 'package:plusofroad/core/constants/imageassets.dart';
import 'package:plusofroad/core/constants/route.dart';
import 'package:plusofroad/core/functions/uploadfile.dart';
import 'package:plusofroad/view/widgets/auth/customtextformfield.dart';
import 'package:plusofroad/widgets/clicable.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class VewComplaint extends StatelessWidget {
  const VewComplaint({super.key});

  @override
  Widget build(BuildContext context) {
    ComplaintController controller = Get.put(ComplaintController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(" شكوى"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.all(12.sp),
        child: ListView(
          children: [
            CustomTextFormField(
              label: "عنوان الشكوى",
              valid: (c) {},
              icon: Icons.add,
              mycontroller: controller.title,
              hint: "ادخل عنوان الشكوى",
              isnumeric: false,
            ),
            SizedBox(height: 20.sp),
            TextFormField(
              controller: controller.content,
              decoration: InputDecoration(
                label: Text("محتوى الشكوى"),
                labelStyle: TextStyle(),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 12,
                ),
                focusColor: AppColors.main,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                ),
              ),
              maxLength: 400,
              maxLines: 12,
            ),
            SizedBox(height: 20.sp),
            CustomTextFormField(
              label: "اسم الحي",
              valid: (c) {},
              icon: Icons.add,
              mycontroller: controller.location,
              hint: "ادخل اسم الحي",
              isnumeric: false,
            ),
            SizedBox(height: 20.sp),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Clicable(
                  ontap: () async {
                    var uploaded_file;
                    uploaded_file = await fileuploadgalllery();
                    print(uploaded_file);
                    controller.files = uploaded_file;
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.sp),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 2,
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Row(
                      children: [
                        Text("ارفاق وسائط متعددة "),
                        SizedBox(width: 20.sp),
                        Icon(Icons.mediation, size: 25.sp),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.sp),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.main,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 2,
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Clicable(
                    ontap: () async {
                      Position p = await _determinePosition();
                      print("----------------------------------");
                      print(p.latitude);
                      print(p.longitude);
                      Get.toNamed(
                        AppRoutes.MapSample,
                        arguments: {"lat": p.latitude, "long": p.longitude},
                      );
                    },
                    child: Row(
                      children: [
                        Text(
                          "اختيار موقع",
                          style: TextStyle(color: AppColors.main),
                        ),
                        SizedBox(width: 10.sp),
                        Icon(
                          Icons.location_on,
                          color: AppColors.main,
                          size: 25.sp,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.sp),
            GetBuilder<ComplaintController>(
              builder: (c) {
                print("rebuild get builder ${controller.files?.length}");
                return controller.files?.length != 0
                    ? Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.main),
                        borderRadius: BorderRadius.circular(12.sp),
                      ),
                      child: SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            ...List.generate(
                              controller.files!.length,
                              (i) => Container(
                                padding: EdgeInsets.all(12.sp),
                                child: Stack(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                        12.sp,
                                      ),
                                      child: Container(
                                        height: 50.sp,
                                        child: Image.file(controller.files![i]),
                                      ),
                                    ),
                                    Clicable(
                                      ontap: () {
                                        Get.defaultDialog(
                                          title: "تحذير",
                                          content: Text("مسح هذه الصورة ؟"),
                                          onConfirm: () {
                                            controller.files!.removeAt(i);
                                          },
                                          onCancel: () {
                                            Get.back();
                                          },
                                        );
                                      },
                                      child: Positioned(
                                        bottom: 2.sp,
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: Colors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    : Text("");
              },
            ),
            SizedBox(height: 20.sp),
            Container(
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              padding: EdgeInsets.symmetric(horizontal: 7.sp, vertical: 7.sp),
              child: Center(
                child: Text(
                  "أضافة الشكوى",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.',
    );
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}
