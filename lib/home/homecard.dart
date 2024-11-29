import 'package:plusofroad/appIcons.dart';
import 'package:plusofroad/core/constants/apptextstyle.dart';
import 'package:plusofroad/core/constants/colors.dart';
import 'package:plusofroad/core/constants/imageassets.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sizer/sizer.dart';

class HomeCard extends StatelessWidget {
  final String image;
  final String title;
  bool status;
  final void Function()? ontap;
  HomeCard({
    super.key,
    required this.image,
    required this.title,
    required this.ontap,
    this.status = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: UnconstrainedBox(
        child: SizedBox(
          height: 10.h,
          width: 40.w,
          child: PhysicalModel(
            borderRadius: BorderRadius.circular(12.sp),
            color: Colors.white,
            elevation: 9,
            shadowColor: Colors.black.withOpacity(0.01),
            child: Stack(
              children: [
                Container(
                  // padding: EdgeInsets.all(0.5.h),
                  // margin: EdgeInsets.all(1.h),
                  child: Center(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),

                            // // color: Colors.red,
                            height: 4.h,
                            width: 4.h,
                            child: Iconify(image),
                          ),
                          FittedBox(
                            child: Text(title, style: AppTextStyle.main),
                          ),
                        ],
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    // image: DecorationImage(
                    //   image: AssetImage(ImageAssets.backgroundhomecard),
                    //   fit: BoxFit.cover,
                    // ),
                    borderRadius: BorderRadius.circular(18),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 2,
                        blurRadius: 2,
                        blurStyle: BlurStyle.outer,
                        offset: Offset(0, 1), // changes the shadow direction
                      ),
                    ],
                  ),
                ),
                // status
                //     ? Positioned(
                //         top: 4.sp,
                //         right: 4.sp,
                //         child: Container(
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(180)),
                //           height: 7.w,
                //           width: 7.w,
                //           child: Center(
                //             child: Icon(
                //               Icons.highlight_off,
                //               color: Colors.white,
                //               size: 20.sp,
                //             ),
                //           ),
                //         ))
                //     : Positioned(
                //         top: 4.sp,
                //         right: 4.sp,
                //         child: Container(
                //           decoration: BoxDecoration(
                //               borderRadius: BorderRadius.circular(180)),
                //           height: 7.w,
                //           width: 7.w,
                //           child: Center(
                //             child: Icon(
                //               Icons.cancel,
                //               color: Colors.red,
                //               size: 20.sp,
                //             ),
                //           ),
                //         )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
