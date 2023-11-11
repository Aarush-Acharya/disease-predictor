import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class StateController extends GetxController {
  Rx<bool> isHovering = false.obs;
  Rx<bool> hasDropped_malaria = false.obs;
  Rx<bool> hasDropped_glucoama = false.obs;
  Rx<String> displayString_malaria = "Drop your files here".obs;
  Rx<String> displayString_glucaoma = "Drop your files here".obs;
  Rx<bool> isFemale = false.obs;
  TextEditingController ageController = TextEditingController();
  TextEditingController tshController = TextEditingController();
          TextEditingController t3Controller = TextEditingController();
      TextEditingController tt4Controller = TextEditingController();
        TextEditingController t4uController = TextEditingController();

}
