import 'package:plusofroad/appIcons.dart';
import 'package:plusofroad/core/constants/colors.dart';
import 'package:plusofroad/core/constants/imageassets.dart';
import 'package:plusofroad/data/model/roommodel.dart';
import 'package:plusofroad/widgets/customdropbutton.dart';
import 'package:plusofroad/widgets/custompersoncardoption.dart';
import 'package:plusofroad/widgets/customroomoptionscard.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class RoomCard extends StatelessWidget {
  final RoomModel room;
  const RoomCard({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.sp),
      decoration: BoxDecoration(
        // color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(12.sp),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 2,
            spreadRadius: 2,
            offset: Offset(0.1, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 30.w,
            height: 30.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider(room.main!),
              ),
              borderRadius: BorderRadius.circular(12.sp),
            ),
          ),
          Expanded(
            child: Container(
              height: 30.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.sp),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10.sp),
                    child: Row(
                      children: [
                        Text(
                          room.nameen!,
                          style: TextStyle(
                            color: AppColors.main,
                            fontSize: 24.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 8.sp),
                    padding: EdgeInsets.symmetric(horizontal: 4.sp),
                    width: double.infinity,
                    // color: Colors.red,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CustomPersonCard(
                            number: '2',
                            name: 'Adult',
                            icon: AppIcons.adult,
                          ),
                          CustomPersonCard(
                            number: '2',
                            name: 'children',
                            icon: AppIcons.children,
                          ),
                          CustomPersonCard(
                            number: '2',
                            name: 'Adult',
                            icon: AppIcons.adult,
                          ),
                          CustomPersonCard(
                            number: '2',
                            name: 'Adult',
                            icon: AppIcons.adult,
                          ),
                          CustomPersonCard(
                            number: '2',
                            name: 'Adult',
                            icon: AppIcons.adult,
                          ),
                          CustomPersonCard(
                            number: '2',
                            name: 'Adult',
                            icon: AppIcons.adult,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  Container(
                    margin: EdgeInsets.only(left: 8.sp),
                    padding: EdgeInsets.symmetric(horizontal: 4.sp),
                    width: double.infinity,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CustomPersonCard(
                            number: '2',
                            name: 'Single bed',
                            icon: AppIcons.singlebed,
                          ),
                          CustomPersonCard(
                            number: '2',
                            name: 'Single bed',
                            icon: AppIcons.singlebed,
                          ),
                          CustomPersonCard(
                            number: '2',
                            name: 'Single bed',
                            icon: AppIcons.singlebed,
                          ),
                          CustomPersonCard(
                            number: '2',
                            name: 'Single bed',
                            icon: AppIcons.singlebed,
                          ),
                          CustomPersonCard(
                            number: '2',
                            name: 'Extra Large bed',
                            icon: AppIcons.extralargebed,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.sp),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 1.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomRoomOptionsCard(
                          icon: AppIcons.balcony,
                          title: 'Balcony',
                        ),
                        CustomRoomOptionsCard(icon: AppIcons.tv, title: 'TV'),
                        CustomRoomOptionsCard(
                          icon: AppIcons.cityview,
                          title: 'City View',
                        ),
                        CustomRoomOptionsCard(
                          icon: AppIcons.aircondition,
                          title: 'Air Condition',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 24.sp),
                  Row(
                    children: [
                      CustomDropButton(text: 'Duplicated'),
                      CustomDropButton(text: 'Without supplememnt'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
