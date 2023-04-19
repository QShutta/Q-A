import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:statck_exchange_q_a/controller/SettingServices.dart';
import 'package:statck_exchange_q_a/model/question_model.dart';

class HomeController extends GetxController {
  //We use this to access to the sharedprefrences var.by this way it will be accessed any where in my app.
  SettingServices services = Get.find();
  //In this list we will store the data that come either from the api or from the cach memory.
  //We make it from "obs" to be reactive so any change will hapen in it will be reflect in other places
  RxList<Question> questions = <Question>[].obs;
  //This var is to determine which page is going to bring the data from it in the api.and it's inital val is 1.
  RxInt page = 1.obs;
  //This is to lithen wither the user arrive to the end of the screen or not.
  var scrollController = ScrollController().obs;
  //This is to check wither there is more data has been loading from the api.
  var isLoadingMore = false.obs;
  //To check the interent connection
  final Connectivity _connectivity = Connectivity();
    
  //This method is to refesh the app,with new data fromt the api.in case of that the user
  //doesn't have interent connection will display a message to indicate to that.
  Future<void> refreshQuestions() async {
    try {
  final connectivityResult = await _connectivity.checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        Get.snackbar(
            backgroundColor: Colors.red,
            'No internet connection',
            'Please check your internet connection');
      } else {
        //This to start bring the new data from the first page.
        page = 1.obs;
        //I don't exacly waht is the benfit of setting the var to falsexxxxxxxxxxxxxxxxxxxxxxx
        isLoadingMore.value = false;
        //but just for avoding any typ of error ,i will put it.
        //While the api call happen,will make the var to true so that there is a circulerProgressIndicator
        //will apear in that peroid.
        final uri =
            "https://api.stackexchange.com//2.3/questions?page=${page.value}&order=desc&sort=activity&site=stackoverflow&key=JEGdhQn2ExfkSGS*XTZHNQ((";
        final res = await http.get(Uri.parse(uri));
        if (res.statusCode == 200) {
          List resBody = jsonDecode(res.body)["items"];
          //This to remove the old values from the list.to make it ready to recive the new values.
          questions.value = [];
          //This to desrlize the data that come from the api,and then put them in list.
          List<Question> myQuestions =
              resBody.map((e) => Question.fromJson(e)).toList();
          //We will make it to false so that the circulerProgressIndicator will disapear.
          questions.addAll(myQuestions);
          // await sharedPrefs.setString("artic", jsonEncode(resBody));
          await services.sharedPreferences
              .setString("artic", jsonEncode(resBody));
        } else {
          throw Exception("Status code:${res.statusCode}");
        }
      }
    } catch (ex) {
      throw Exception(ex);
    }
  }

  //This method to get the data from the api.
  Future<void> getData() async {
    //This to store the data in the cach memory.
    var sharePref = await SharedPreferences.getInstance();
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      //This to get the data form the cach ,but notice we can not deal with it like this we have to decode it.
      var myData = sharePref.getString("artic");
      //We want to make sure that the data come from the cach not null
      if (myData != null) {
        List lis = jsonDecode(myData);
        //This to deserilize the data.that will come from the cach to dart object
        List<Question> ls = lis.map((e) => Question.fromJson(e)).toList();
        //This to replace all the old values in the list with the news values
        questions.assignAll(ls);
      }
      //Elese means that the user enter to the application for the first time and he doesn't have
      //internet connection :
      else {
        Get.snackbar('No data', 'There is no data available',
            backgroundColor: Colors.red, duration: Duration(seconds: 2));
        questions.add(Question(title: "empty"));
      }
    } else {
      //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
      // This to prevent api call,if there is an already api call hapen
      // if (isLoadingMore.value) return;
      var uri =
          "https://api.stackexchange.com//2.3/questions?page=${page.value}&order=desc&sort=activity&site=stackoverflow&key=JEGdhQn2ExfkSGS*XTZHNQ((";
      //While the api call is happening,the isloading more will become true
      var res = await http.get(Uri.parse(uri));
      if (res.statusCode == 200) {
        //فك تشفير البيانات الجاية وخلينا نتعامل معاها
        List resBody = jsonDecode(res.body)["items"];
        //The line of code you provided converts a List of JSON objects returned from an API into a List of Question objects
        //, the overall effect of this line of code is to convert each JSON object in the resBody  to a Question object,
        // and then store these Question objects in the myqustions list.
        List<Question> myqustions =
            resBody.map((e) => Question.fromJson(e)).toList();
        //When the data come from the api.the var will become false.
        // will add the new values to the end of the existing values in the list
        questions.addAll(myqustions);
        //This to store the data that come from the api ,localy in the cach memory.
        await services.sharedPreferences
          ..setString("artic", jsonEncode(resBody));
      } else {
        throw Exception("${res.statusCode}");
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    //once the build hapen will braing the data from the api
    getData();
    //This to lisitin to the state of the listView.
    scrollController.value.addListener(_scrollLithenr);
  }

  void _scrollLithenr() async {
    //If there is an api call already hapen in this case ,we will get out from this method.
    //and there is no api call will hapen.
    if (isLoadingMore.value) return;
    //If the position of the user in the end of the list,in that case he should load more data from the api.
    if (scrollController.value.position.pixels ==
        scrollController.value.position.maxScrollExtent) {

      //In case of that the user arrive to the end of the page we have to load data from another page from the api
      page.value = page.value + 1;


      // In case of that the user arrive to the end of the page we have to load data from another page from the api
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
