import 'package:plusofroad/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';

class CustomRoomOptionsCard extends StatelessWidget {
  final String icon;
  final String title;
  const CustomRoomOptionsCard({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(4.sp),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.greyfat,
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.greyfat,
            ),
            child: Iconify(icon, size: 18.sp),
          ),
        ),
        Text(
          "$title",
          style: TextStyle(color: AppColors.main, fontSize: 10.sp),
        ),
      ],
    );
  }
}
