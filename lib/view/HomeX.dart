import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import 'package:statck_exchange_q_a/view/Details.dart';

import '../controller/HomeController.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 30.0, bottom: 10),
          child: Center(
            child: Text(
              "FAQ",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        FutureBuilder(
          future: controller.getData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                  padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                  child: ListView.builder(
                      controller: controller.scrollController,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.isLoadingMore
                          // ? controller.getData().length + 1
                          // : controller.questions.length,
                          ? snapshot.data!.length + 1
                          : snapshot.data!.length,
                      itemBuilder: (builder, i) {
                        // final question = controller.questions[i];
                        final question = snapshot.data![i];
                        return Column(
                          children: [
                            // InkWell(
                            //   onTap: () async {
                            //     await Get.to(() => Details(), arguments: {
                            //       // "id": "${question['question_id']}"
                            //       "id": "${question.questionId}"
                            //     });
                            //   },
                            InkWell(
                              onTap: () async {
                                await Get.to(
                                  () => Details(),
                                  arguments: {
                                    "title": question.title,
                                    "owner": question.owner,
                                    "isAnswered": question.isAnswered,
                                    "questionId": question.questionId,
                                    "link": question.link,
                                    "tags": question.tags,
                                    "viewCount": question.viewCount,
                                    "answerCount": question.answerCount,
                                  },
                                );
                              },
                              child: ListTile(
                                trailing: const Icon(
                                  size: 20,
                                  Icons.arrow_forward_ios,
                                  color: Color(
                                    0xFF5EC590,
                                  ),
                                ),
                                // title: Text("${question['title']}",
                                title: Text("${question.title}",
                                    style: TextStyle(color: Colors.green[400])),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 13.0, right: 8.0),
                              child: Divider(),
                            )
                          ],
                        );
                      }));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        )
      ],
    ));
  }
}
