import 'package:plusofroad/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomNextButton extends StatelessWidget {
  final void Function()? ontap;
  final String text;

  const CustomNextButton({super.key, required this.ontap, this.text = "Next"});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 12.sp),
        child: Text(text, style: TextStyle(color: Colors.white)),
        decoration: BoxDecoration(
          color: AppColors.main,
          borderRadius: BorderRadius.circular(12.sp),
        ),
      ),
    );
  }
}

class CustomCancelButton extends StatelessWidget {
  final void Function()? ontap;
  final String text;

  const CustomCancelButton({
    super.key,
    required this.ontap,
    this.text = "Next",
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.sp, vertical: 12.sp),
        child: Text(text, style: TextStyle(color: AppColors.main)),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.sp),
          border: Border.all(color: AppColors.main),
        ),
      ),
    );
  }
}
