import 'package:plusofroad/core/constants/colors.dart';
import 'package:plusofroad/widgets/bedoption.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoomBedOptions extends StatelessWidget {
  const RoomBedOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.sp),
      width: 95.w,
      padding: EdgeInsets.all(5.sp),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0, 1),
            blurStyle: BlurStyle.outer,
          ),
        ],
        borderRadius: BorderRadius.circular(8.sp),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Room 1",
            style: TextStyle(color: AppColors.main, fontSize: 18.sp),
          ),
          SizedBox(height: 9.sp),
          Bedoption(),
          Bedoption(),
          Bedoption(),
        ],
      ),
    );
  }
}
