import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //We make it from "obs" to be reactive so any change will hapen in it will be reflect in other places
  List questions = [].obs;
  //This var is to determine which page is going to bring the data from it in the api.and it's inital val is 1.
  var page = 1.obs;
  var scrollController = ScrollController().obs;
  //This is to check wither there is more data has been loading from the api.
  final RxBool isLoadingMore = false.obs;

//This method to get the data from the api.
  Future getData() async {
    var uri =
        "https://api.stackexchange.com//2.3/questions?page=${page.value}&order=desc&sort=activity&site=stackoverflow";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      //The list of questions ,is equeal to the old list of question +new list of quesion that will come from the api.
      questions = questions + resBody['items'];
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
