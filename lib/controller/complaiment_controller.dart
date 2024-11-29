import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ComplaintController extends GetxController {
  List? files = [];
  double? lat;
  double? long;
  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();
  TextEditingController location = TextEditingController();
}
