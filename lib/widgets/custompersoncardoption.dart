import 'package:plusofroad/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';

class CustomPersonCard extends StatelessWidget {
  final String name;
  final String icon;
  final String number;

  const CustomPersonCard({
    super.key,
    required this.name,
    required this.number,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1.sp),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.all(2.sp),
            decoration: BoxDecoration(
              color: AppColors.greyfat,
              shape: BoxShape.circle,
            ),
            child: Iconify(icon, size: 16.sp),
          ),
          Text(
            " $number $name",
            style: TextStyle(color: AppColors.main, fontSize: 10.sp),
          ),
        ],
      ),
    );
  }
}
