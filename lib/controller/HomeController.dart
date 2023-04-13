import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statck_exchange_q_a/model/question_model.dart';

class HomeController extends GetxController {
  //We make it from "obs" to be reactive so any change will hapen in it will be reflect in other places

  RxList<Question> questions = <Question>[].obs;

  //This var is to determine which page is going to bring the data from it in the api.and it's inital val is 1.
  var page = 1.obs;
  var scrollController = ScrollController().obs;
  //This is to check wither there is more data has been loading from the api.
  var isLoadingMore = false.obs;

//This method to get the data from the api.
  Future<void> getData() async {
    var uri =
        "https://api.stackexchange.com//2.3/questions?page=${page.value}&order=desc&sort=activity&site=stackoverflow&key=JEGdhQn2ExfkSGS*XTZHNQ((";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      List resBody = jsonDecode(res.body)["items"];
      //The line of code you provided converts a List of JSON objects returned from an API into a List of Question objects
//, the overall effect of this line of code is to convert each JSON object in the resBody  to a Question object,
// and then store these Question objects in the myqustions list.
      List<Question> myqustions =
          resBody.map((e) => Question.fromJson(e)).toList();
//addAll method of the RxList will add the new values to the end of the existing values in the list
      questions.addAll(myqustions);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load questions:${res.statusCode}');
    }
  }

  @override
  void onInit() {
    super.onInit();
    getData();
    //This to lisitin to the state of the listView.
    scrollController.value.addListener(_scrollLithenr);
  }

  void _scrollLithenr() async {
    //If the position of the user in the end of the list,in that case he should load more data from the api.
    if (scrollController.value.position.pixels ==
        scrollController.value.position.maxScrollExtent) {
      //In case of that the user arrive to the end of the page we have to load data from another page from the api
      page.value = page.value + 1;

      //This var to indicate that ther is data come from the api
      isLoadingMore.value = true;

//Getting new data from the api.when the user arrive to the end of the listView.
      await getData();

      //after the data come from the api succfuly:
      isLoadingMore.value = false;
    }
  }
}
