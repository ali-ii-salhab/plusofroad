import 'dart:math';

import 'package:plusofroad/controller/home/authaccountcontroller.dart';
import 'package:plusofroad/controller/home/homecontroller.dart';
import 'package:plusofroad/widgets/customappbar.dart';
import 'package:plusofroad/widgets/mainappbar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // final _key = GlobalKey<ExpandableFabState1>();

    HomeController controller = Get.put(HomeController());
    return WillPopScope(
      onWillPop: () async {
        print("back from home page");
        Get.put(AuthaccountinfoController());
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          extendBody: true, // <--- do not forget mark this as true
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: AppBarGod(),

          // appBar: StoreCustomizableAppBar(title: "main", context),
          body: GetBuilder<HomeController>(
            builder:
                (controller) => controller.Screens[controller.currentscreen],
          ),
        ),
      ),
    );
  }
}
