import 'package:plusofroad/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Clicable extends StatelessWidget {
  final Function()? ontap;
  final Widget child;
  const Clicable({super.key, required this.child, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      borderRadius: BorderRadius.circular(12.sp),
      splashColor: AppColors.main,
      splashFactory: InkSplash.splashFactory,
      child: child,
    );
  }
}
