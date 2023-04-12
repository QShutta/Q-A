import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statck_exchange_q_a/model/DetailsController.dart';

import '../model/question_model.dart';

class DetailsController extends GetxController {
  //Why did we  set the type of the method from the question type
  Future<Question> getData(id) async {
    var uri =
        "https://api.stackexchange.com/2.3/questions/$id?order=desc&sort=activity&site=stackoverflow";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body)['items'][0];
      update();
      // return resBody['items'][0];
      return Question.fromJson(resBody);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load questions');
    }
  }
}
