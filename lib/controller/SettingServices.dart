import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingServices extends GetxService {
  late SharedPreferences sharedPreferences;

  Future<SettingServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}
