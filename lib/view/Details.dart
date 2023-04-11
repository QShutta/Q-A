import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:statck_exchange_q_a/model/DetailsController.dart';
import 'package:statck_exchange_q_a/view/HomeX.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/question_model.dart';

class Details extends StatefulWidget {
  const Details({
    super.key,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var questionId;
//Why did we  set the type of the method from the question type
  Future<Question> getData() async {
    var uri =
        "https://api.stackexchange.com/2.3/questions/${Get.arguments['id']}?order=desc&sort=activity&site=stackoverflow";
    var res = await http.get(Uri.parse(uri));
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body)['items'][0];

      // return resBody['items'][0];
      return Question.fromJson(resBody);
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load questions');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    questionId = Get.arguments['id'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Color(
                0xFF5EC590,
              ),
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var question = snapshot.data!;
              // List tags = question['tags'];
              List<String> tags = question.tags ?? [];
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10),
                    child: Center(
                      child: Text(
                        "FAQ",
                        style: TextStyle(
                            fontSize: 40, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Question:",
                          style: TextStyle(
                            color: Color(
                              0xFF5EC590,
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 10.0),
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        child: Text(
                          // "${question['title']}",
                          " ${question.title}",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 10.0),
                    child: Row(
                      children: [
                        Text(
                          "Answred:",
                          style: TextStyle(
                            color: Color(
                              0xFF5EC590,
                            ),
                          ),
                        ),
                        // question['is_answered']
                        question.isAnswered!
                            ? Icon(
                                Icons.check,
                                color: Colors.green,
                              )
                            : Icon(
                                Icons.close,
                                color: Colors.red,
                              ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 10.0),
                    child: Row(
                      children: [
                        Text(
                          "Views:",
                          style: TextStyle(
                            color: Color(
                              0xFF5EC590,
                            ),
                          ),
                        ),
                        Text(

                            // "${question['view_count']}",
                            "${question.viewCount}")
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 10.0),
                    child: Row(
                      children: [
                        Text(
                          "Answers:",
                          style: TextStyle(
                            color: Color(
                              0xFF5EC590,
                            ),
                          ),
                        ),
                        Text("${question.answerCount}"
                            // "${question['answer_count']}"
                            )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 12.0,
                      right: 12.0,
                    ),
                    child: Row(
                      children: [
                        Text(
                          "View the qution on Stack Exchange:",
                          style: TextStyle(
                            color: Color(
                              0xFF5EC590,
                            ),
                          ),
                        ),
                        IconButton(
                            onPressed: () async {
                              if (!await launchUrl(
                                  mode: LaunchMode.externalApplication,
                                  Uri.parse(
                                      // question['link']
                                      question.link!))) {
                                throw Exception('Colud not launch ${Uri.parse(

                                    // question['link']
                                    question.link!)}');
                              }
                              ;
                            },
                            icon: Icon(Icons.link))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 10.0),
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Question Tags:",
                          style: TextStyle(
                            color: Color(
                              0xFF5EC590,
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 10.0),
                    child: Wrap(
                      spacing: 8.0,
                      children: tags
                          .map((tag) => Chip(
                                  label: Text(
                                tag,
                                style: TextStyle(
                                  color: Color(
                                    0xFF5EC590,
                                  ),
                                ),
                              )))
                          .toList(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 10.0),
                    child: Container(
                        width: double.infinity,
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Question Owner:",
                          style: TextStyle(
                            color: Color(
                              0xFF5EC590,
                            ),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 12.0, right: 12.0, top: 10.0, bottom: 12.0),
                    child: Card(
                      child: ListTile(
                        leading: CircleAvatar(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: question.owner!.profileImage != null

                              //  question['owner']['profile_image']
                              //  != null

                              ? Image.network(
                                  // "${question['owner']['profile_image']}"
                                  "${question.owner!.profileImage}")
                              : Icon(Icons.person),
                        )),
                        title: Text(
                          // "${question['owner']['display_name']}",
                          "${question.owner!.displayName}",

                          style: TextStyle(
                            color: Color(
                              0xFF5EC590,
                            ),
                          ),
                        ),
                        subtitle: InkWell(
                            onTap: () async {
                              if (!await launchUrl(
                                  mode: LaunchMode.externalApplication,
                                  Uri.parse(
                                    // question['owner']['link']
                                    question.owner!.link!
                                    ))) {
                                throw Exception(
                                    'Colud not launch ${Uri.parse(
                                      // question['link']
                                      question.link!
                                      )}'
                                      
                                      );
                              }
                              ;
                            },
                            child: Text(
                              // "${question['owner']['link']}"
                              question.owner!.link!
                              
                              )),
                      ),
                    ),
                  )
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            }
          },
        ));
  }
}
