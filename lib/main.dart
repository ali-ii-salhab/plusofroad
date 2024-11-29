import 'package:plusofroad/core/binging/initialbindings.dart';

import 'package:plusofroad/core/services/services.dart';
import 'package:plusofroad/routes.dart';
import 'package:plusofroad/sizeconfig.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';

import 'core/localization/changelocale.dart';
import 'core/localization/translation.dart';

import 'package:hive/hive.dart';

// flutter build apk --split-per-abi
// flutter pub add time_range_picker #06ac5a
// flutter pub add image_editor #30036c
Box? services;
Box? sections;
Future<Box> openhivebox(String boxname) async {
  if (!Hive.isBoxOpen(boxname)) {
    Hive.init((await getApplicationDocumentsDirectory()).path);
  }
  return Hive.openBox(boxname);
}

const apiKey = "eO4wq22JDpi7XOT5iyxp";
const styleUrl = "https://api.maptiler.com/maps/streets-v2/style.json";
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  services = await openhivebox("services");
  sections = await openhivebox("sections");

  await initialservizes();

  // ErrorWidget.builder = (FlutterErrorDetails details) => Material();

  runApp(MyApp());
}

// all to done

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print("main rebuild");
    SizeConfig().init(context);

    Localcontroller controller = Get.put(Localcontroller());
    return Sizer(
      builder: (context, orientation, deviceType) {
        return SafeArea(
          child: GetMaterialApp(
            locale: Locale("ar"),
            translations: MyTranslation(),

            // routes: AppRoutes(),
            getPages: getPages,
            initialRoute: "/onboarding",
            initialBinding: InitialBinding(),
            debugShowCheckedModeBanner: false,
            // home: Stopsale(),
            theme: controller.appthem,
          ),
        );
      },
    );
  }
}
// // headers: {
//       'Content-Type': 'application/json',
//       'Accept': 'application/json',
//       'Authorization': 'Bearer $token',
//     // }import numpy as np import matplotlib as plt 
// import as plt as plt 


// import pandas as plt 
