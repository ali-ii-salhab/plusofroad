import 'package:plusofroad/core/constants/colors.dart';
import 'package:plusofroad/core/soul/animatedloadingbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<dynamic> showalertdeletedialogue(
  BuildContext context,
  GestureTapCallback onconfirm,
) {
  return showDialog(
    context: context,
    builder:
        (c) => AlertDialog(
          actionsAlignment: MainAxisAlignment.center,
          title: Row(
            children: [
              Icon(Icons.warning, color: AppColors.red),
              Text("warning"),
            ],
          ),
          content: Text("Delete this content ?"),
          actions: [
            AnimatedLoadingButton('delete', () {
              print("sssssssssssssssssssssssssssss");
              onconfirm();
            }),
          ],
        ),
  );
}
