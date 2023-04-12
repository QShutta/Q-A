import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  List questions = [];
  //This var i will use it in pagination:so that every time he reach to the end of the page there will a new page to load
  int page = 1;
  Future getData() async {
    var uri =
        // "https://api.stackexchange.com/2.3/questions?order=desc&sort=activity&site=stackoverflow"

        "https://api.stackexchange.com/2.3/questions?page=$page&order=desc&sort=activity&site=stackoverflow";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      //questions=question+resBody['items']:the benfit of this is to store in the "question" list the prevois question
      //+new questions.
      questions = questions + resBody['items'];
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
