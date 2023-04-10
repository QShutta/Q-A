import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List questions = [];
  Future getData() async {
    var uri =
        "https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      questions = resBody['items'];
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load questions');
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getData();
  }
}
