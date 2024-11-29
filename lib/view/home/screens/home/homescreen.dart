import 'package:plusofroad/appIcons.dart';
import 'package:plusofroad/controller/home/homecontroller.dart';
import 'package:plusofroad/core/constants/colors.dart';
import 'package:plusofroad/core/constants/imageassets.dart';
import 'package:plusofroad/core/constants/route.dart';
import 'package:plusofroad/home/homecard.dart';
import 'package:plusofroad/widgets/clicable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed: () {}),
        // floatingActionButtonLocation: ,
        appBar: AppBar(
          leading: null,
          toolbarHeight: 0,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.timeline), text: "قيد الانتظار"),
              Tab(icon: Icon(Icons.work_history_outlined), text: "قيد المعاجة"),
              Tab(icon: Icon(Icons.history), text: "مؤرشفة"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // wait
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                WaitingComplaintCard(
                  title: 'عناون الشكوى المقدمة من قبل المواطن',
                  content: 'الشرح التفصيلي للشكوى',
                  date: '2-2-2024',
                  image: '',
                ),
                SizedBox(height: 50.sp),
              ],
            ),
            // process
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ProcessingComplaintCard(
                  title: 'عنوان  لشكوى',
                  content: 'الشرح التفصيلي للشكوى',
                  date: '2-2-2024',
                  image: '',
                ),
                SizedBox(height: 50.sp),
              ],
            ),
            // archieved
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                ArchievedComplaintCard(
                  title: 'عk,hk لشكوى',
                  content: 'الشرح التفصيلي للشكوى',
                  date: '2-2-2024',
                  image: '',
                ),
                SizedBox(height: 50.sp),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ProcessingComplaintCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String image;
  const ProcessingComplaintCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Clicable(
      ontap: () {
        Get.toNamed(AppRoutes.VewComplaint);
      },
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 12.sp,
                    vertical: 12.sp,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 79, 75, 84),
                        blurRadius: 2,
                        spreadRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50.sp,
                            child: Image.asset(ImageAssets.tartous_logo_no_bg),
                          ),
                          Container(
                            // color: Colors.red,
                            width: 65.w,
                            child: Text(
                              "$title",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: Text("$content"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text("تاريخ تقديم الشكوى :"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        date,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("تاريخ بدء معالجة الشكوى:"),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        date,
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text("حالة الشكوى :"),
                                    Container(
                                      child: Column(
                                        children: [
                                          Text(
                                            "قيد المعالجة",
                                            style: TextStyle(
                                              color: AppColors.primary,
                                            ),
                                          ),
                                          Icon(
                                            Icons.workspaces_sharp,
                                            color: AppColors.primary,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ArchievedComplaintCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String image;
  const ArchievedComplaintCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();

    return Clicable(
      ontap: () {
        Get.toNamed(AppRoutes.VewComplaint);
      },
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 12.sp,
                    vertical: 12.sp,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 79, 75, 84),
                        blurRadius: 2,
                        spreadRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50.sp,
                            child: Image.asset(ImageAssets.tartous_logo_no_bg),
                          ),
                          Container(
                            // color: Colors.red,
                            width: 65.w,
                            child: Text(
                              "$title",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: Text("$content"),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(date, textAlign: TextAlign.start),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      "مؤرشفة",
                                      style: TextStyle(
                                        color: AppColors.primary,
                                      ),
                                    ),
                                    Icon(
                                      Icons.archive,
                                      color: AppColors.primary,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Row(children: []),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          controller.complaintstatus.value =
                              !controller.complaintstatus.value;
                        },
                        child: Obx(
                          () => AnimatedContainer(
                            duration: Duration(seconds: 1),
                            margin: EdgeInsets.symmetric(
                              horizontal: 12.sp,
                              vertical: 12.sp,
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 187, 148, 239),
                              borderRadius: BorderRadius.circular(12.sp),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 12.sp,
                              vertical: 3.sp,
                            ),
                            child:
                                controller.complaintstatus.value == true
                                    ? Text(
                                      "عرض الرد",
                                      style: TextStyle(color: Colors.white),
                                    )
                                    : SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Image.asset(
                                                ImageAssets.tartous_logo_no_bg,
                                                height: 30.sp,
                                              ),
                                            ],
                                          ),
                                          Text(
                                            '''من قبل لالا سشب شس يشب يبشس شسيب شي ب تمت معالجة الشjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjكوى بنجاح''',
                                          ),
                                        ],
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WaitingComplaintCard extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String image;
  const WaitingComplaintCard({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Clicable(
      ontap: () {
        Get.toNamed(AppRoutes.VewComplaint);
      },
      child: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 12.sp,
                    vertical: 12.sp,
                  ),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 79, 75, 84),
                        blurRadius: 2,
                        spreadRadius: 2,
                        blurStyle: BlurStyle.outer,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 50.sp,
                            child: Image.asset(ImageAssets.tartous_logo_no_bg),
                          ),
                          Container(
                            // color: Colors.red,
                            width: 65.w,
                            child: Text(
                              "$title",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 90.w,
                        padding: EdgeInsets.all(12.sp),
                        decoration: BoxDecoration(
                          // color: AppColors.primary,
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(12.sp),
                        ),
                        child: Text(
                          "$content ;;;;;;;;;;kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk",
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                child: Row(
                                  children: [
                                    Row(
                                      children: [
                                        Text("حالة الشكوى : "),
                                        Text(
                                          "انتظار",
                                          style: TextStyle(
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 5.sp),
                                    Icon(Icons.timer, color: AppColors.primary),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(date, textAlign: TextAlign.start),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Clicable(
                                ontap: () {
                                  Get.toNamed(AppRoutes.editcomplaint);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                          255,
                                          79,
                                          75,
                                          84,
                                        ),
                                        blurRadius: 2,
                                        spreadRadius: 2,
                                        blurStyle: BlurStyle.outer,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(12.sp),
                                  ),
                                  padding: EdgeInsets.all(5.sp),
                                  margin: EdgeInsets.all(12.sp),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.edit),
                                      SizedBox(height: 4.sp),
                                      Text("تعديل"),
                                    ],
                                  ),
                                ),
                              ),
                              Clicable(
                                ontap: () {
                                  Get.defaultDialog(
                                    title: "تحذير",
                                    content: Text("حذف الشكوى ؟"),
                                    onConfirm: () {},
                                    onCancel: () {
                                      Get.closeCurrentSnackbar();
                                    },
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: const Color.fromARGB(
                                          255,
                                          79,
                                          75,
                                          84,
                                        ),
                                        blurRadius: 2,
                                        spreadRadius: 2,
                                        blurStyle: BlurStyle.outer,
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(12.sp),
                                  ),
                                  padding: EdgeInsets.all(5.sp),
                                  margin: EdgeInsets.all(12.sp),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.delete),
                                      SizedBox(height: 4.sp),
                                      Text("حذف"),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
