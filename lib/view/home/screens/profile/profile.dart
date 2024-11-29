import 'package:plusofroad/core/constants/colors.dart';
import 'package:plusofroad/core/constants/imageassets.dart';
import 'package:plusofroad/core/constants/route.dart';
import 'package:plusofroad/core/services/services.dart';
import 'package:plusofroad/widgets/clicable.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

import 'package:url_launcher/url_launcher.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    // SettingController controller = Get.put(SettingController());
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Text(
              "52".tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.main,
                fontWeight: FontWeight.bold,
                fontSize: 24.sp,
              ),
            ),
            SizedBox(height: 30.sp),
            Clicable(
              ontap: () {
                Get.bottomSheet(
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 10.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            "56".tr,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.sp),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white),
                          ),
                          child: Text(
                            "57".trParams(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Settingcard(name: "51".tr, icon: Icons.three_mp),
            ),
            Row(
              children: [
                Settingcard(name: "53".tr, icon: Icons.notifications),
                Switch(value: true, onChanged: (v) {}),
              ],
            ),
            Clicable(
              ontap: () {
                // launchUrl("/phone");
              },
              child: Settingcard(name: "54".tr, icon: Icons.support_agent),
            ),
            Clicable(
              ontap: () {
                Get.bottomSheet(
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 10.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Clicable(
                          ontap: () {
                            Get.updateLocale(Locale("ar"));
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Text(
                              "Ar",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Clicable(
                          ontap: () {
                            Get.updateLocale(Locale("en"));
                          },
                          child: Container(
                            padding: EdgeInsets.all(12.sp),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white),
                            ),
                            child: Text(
                              "En",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              child: Settingcard(name: "55".tr, icon: Icons.language_outlined),
            ),
            SizedBox(height: Get.width / 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Icon(Icons.copyright), Text("58".tr)],
            ),
          ],
        ),
      ),
    );
  }
}

class Settingcard extends StatelessWidget {
  final String name;
  final IconData icon;
  final IconData? anothericon;
  const Settingcard({
    super.key,
    required this.name,
    required this.icon,
    this.anothericon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.sp),
      padding: EdgeInsets.all(10.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20.sp, color: AppColors.main),
              SizedBox(width: 10.sp),
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.primarycolor,
                ),
              ),
            ],
          ),
          Transform.rotate(
            angle: 3.14,
            child: Icon(Icons.arrow_back_ios, color: AppColors.primarycolor),
          ),
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        border: Border.all(color: AppColors.primarycolor),
      ),
    );
  }
}
