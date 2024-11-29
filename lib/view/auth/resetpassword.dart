import 'package:plusofroad/core/constants/route.dart';
import 'package:plusofroad/widgets/customAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plusofroad/controller/auth/resetpasswordcontroller.dart';
import 'package:plusofroad/core/constants/colors.dart';
import 'package:plusofroad/core/functions/validinput.dart';
import 'package:plusofroad/view/widgets/auth/authtextformfield.dart';
import 'package:plusofroad/view/widgets/auth/customauthbutton.dart';
import 'package:sizer/sizer.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerimpl controller = Get.put(
      ResetPasswordControllerimpl(),
    );
    return Scaffold(
      appBar: CustomizableAppBar(title: "reset Password", isactioned: false),
      body: Container(
        padding: EdgeInsets.all(12.sp),
        color: Colors.white,
        width: Get.width,
        child:
            controller.isemailsended.value
                ? Text("Check your email to reset password")
                : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextformfieldAuth(
                      valid: (val) {
                        return validate(val.toString(), 5, 100, 'email');
                      },
                      mycontroller: controller.email,
                      // logincontroller.email,
                      title: "password",
                      hint: "Enter your password",
                    ),
                    CustomTextformfieldAuth(
                      valid: (val) {
                        return validate(val.toString(), 5, 100, 'email');
                      },
                      mycontroller: controller.email,
                      // logincontroller.email,
                      title: "re-password",
                      hint: "re-Enter your password",
                    ),
                    SizedBox(height: 10.h),
                    Container(
                      width: Get.width - 30,
                      child: CustomAuthButton(
                        text: 'Continue',
                        onPressed: () {
                          Get.toNamed(AppRoutes.verifycode);
                        },
                      ),
                    ),
                  ],
                ),
      ),
    );
  }
}
