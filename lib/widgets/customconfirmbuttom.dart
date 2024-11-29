import 'package:plusofroad/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:sizer/sizer.dart';

class Callbutton extends StatelessWidget {
  const Callbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.sp,
      width: 20.sp,
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.main),
      child: Icon(Icons.call, color: Colors.white, size: 18),
    );
  }
}
