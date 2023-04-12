// import 'package:get/get.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;

// import '../model/question_model.dart';

// class DetailsController extends GetxController {
//   //Why did we  set the type of the method from the question type
//   Future<Question> getData(id) async {
//     var uri =
//         "https://api.stackexchange.com/2.3/questions/1?order=desc&sort=activity&site=stackoverflow&key=JEGdhQn2ExfkSGS*XTZHNQ((";
//     var res = await http.get(Uri.parse(uri));
//     if (res.statusCode == 200) {
//       var resBody = jsonDecode(res.body)['items'][0];
//       update();
//       // return resBody['items'][0];
//       return Question.fromJson(resBody);
//     } else {
//       // If that call was not successful, throw an error.
//       throw Exception('Failed to load questions');
//     }
//   }
// }
