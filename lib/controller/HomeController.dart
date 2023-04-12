import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statck_exchange_q_a/model/question_model.dart';

class HomeController extends GetxController {
  //We make it from "obs" to be reactive so any change will hapen in it will be reflect in other places

  // List questions = [].obs;

  //This var is to determine which page is going to bring the data from it in the api.and it's inital val is 1.
  var page = 1;
  var scrollController = ScrollController();
  //This is to check wither there is more data has been loading from the api.
  bool isLoadingMore = false;

//This method to get the data from the api.
  Future<List<Question>> getData() async {
    var uri =
        "https://api.stackexchange.com//2.3/questions?page=${page}&order=desc&sort=activity&site=stackoverflow&key=JEGdhQn2ExfkSGS*XTZHNQ((";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      List resBody = jsonDecode(res.body)["items"];

      List<Question> myqustions =
          resBody.map((e) => Question.fromJson(e)).toList();

      return myqustions;
      // questions = questions + myqustions;
      //The list of questions ,is equeal to the old list of question +new list of quesion that will come from the api.
      // questions = questions + resBody['items'];
      // questions.map((e) => Question.fromJson(e)).toList();
      // return questions;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load questions:${res.statusCode}');
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
    //This to lisitin to the state of the listView.
    scrollController.addListener(_scrollLithenr);
  }

  void _scrollLithenr() async {
    //If the position of the user in the end of the list,in that case he should load more data from the api.
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      //In case of that the user arrive to the end of the page we have to load data from another page from the api
      page = page + 1;

      //This var to indicate that ther is data come from the api
      isLoadingMore = true;

//Getting new data from the api.when the user arrive to the end of the listView.
      await getData();

      //after the data come from the api succfuly:
      isLoadingMore = false;
    }
  }
}
