import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plusofroad/core/constants/colors.dart';
import 'package:plusofroad/core/constants/imageassets.dart';
import 'package:sizer/sizer.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الاشعارات"), centerTitle: true, elevation: 0),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 4.sp),
            padding: EdgeInsets.all(4.sp),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.main),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Row(
              children: [
                Image.asset(ImageAssets.notifications),
                Column(
                  children: [
                    Text(
                      "  اتمت مراجعة الشكوى المقدمة انقر لبيان حالة الشكوى ",
                    ),
                    Text(
                      "2-1-2024 12:12",
                      style: TextStyle(color: AppColors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 4.sp),
            padding: EdgeInsets.all(4.sp),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.main),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Row(
              children: [
                Image.asset(ImageAssets.notifications),
                Column(
                  children: [
                    Text(
                      "  اتمت مراجعة الشكوى المقدمة انقر لبيان حالة الشكوى ",
                    ),
                    Text(
                      "2-1-2024 12:12",
                      style: TextStyle(color: AppColors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 4.sp),
            padding: EdgeInsets.all(4.sp),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.main),
              borderRadius: BorderRadius.circular(12.sp),
            ),
            child: Row(
              children: [
                Image.asset(ImageAssets.notifications),
                Column(
                  children: [
                    Text(
                      "  اتمت مراجعة الشكوى المقدمة انقر لبيان حالة الشكوى ",
                    ),
                    Text(
                      "2-1-2024 12:12",
                      style: TextStyle(color: AppColors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
