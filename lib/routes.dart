import 'package:get/get.dart';

import 'addcomplaint.dart';
import 'core/constants/route.dart';
import 'core/middleware/mymiddleware.dart';
import 'editcomplaint.dart';
import 'map.dart';
import 'notifications.dart';
import 'view/auth/forgetpassword/verifycodeforgetpassword.dart';
import 'view/auth/onboarding/onboarding.dart';
import 'view/auth/resetpassword.dart';
import 'view/auth/signup.dart';
import 'view/auth/successsignup.dart';
import 'view/auth/verifycode.dart';
import 'view/home/Homepage.dart';
import 'view/home/googlemap.dart';
import 'viewcomplaint.dart';

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: AppRoutes.signup,
    page: () => Signup(),
    middlewares: [MyMiddleware()],
  ),
  // GetPage(name: AppRoutes.AuthPage, page: () => AuthPage()),
  GetPage(
    name: "/",
    page: () => const Onboarding(),
    middlewares: [Onboardingmiddleware()],
  ),
  GetPage(name: AppRoutes.success, page: () => SuccessSignup()),
  GetPage(name: AppRoutes.MapSample, page: () => MapSample()),

  GetPage(name: AppRoutes.VewComplaint, page: () => VewComplaint()),
  GetPage(name: AppRoutes.notifications, page: () => Notifications()),

  GetPage(name: AppRoutes.verifycode, page: () => VerifycodeForgetpassword()),
  GetPage(name: AppRoutes.addcomplaint, page: () => AddComplaint()),

  GetPage(name: AppRoutes.googlemap, page: () => Googlemap()),
  GetPage(name: AppRoutes.resetpassword, page: () => ResetPassword()),
  GetPage(name: AppRoutes.editcomplaint, page: () => EditComplaint()),

  GetPage(name: AppRoutes.VerifyCode, page: () => VerifyCode()),

  GetPage(name: AppRoutes.homepage, page: () => HomePage()),
];
