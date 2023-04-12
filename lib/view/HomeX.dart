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
        GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    //We want to show the loading so to add space for the loading indicator(in the listview)
                    //we will add the number of the the +1 will represent the loadding indicator.
                    itemCount: isLoadingMore
                        ? controller.questions.length + 1
                        : controller.questions.length,
                    // the i variable represents the current index of the item being built.
                    itemBuilder: (builder, i) {
                      //In general the purbose of this question is to add loading indicator .
                      //if my current position is lesss than the total number of questions in the list
                      //then he will display the "question" from the list of "questions".
                      //otherwise he will display  a loading inicator to indicate that there is data featching from api.
                      if (i < controller.questions.length) {
                        final question = controller.questions[i];
                        return Column(
                          children: [
                            InkWell(
                              onTap: () async {
                                await Get.to(() => Details(), arguments: {
                                  "id": "${question['question_id']}"
                                });
                              },
                              child: ListTile(
                                trailing: const Icon(
                                  size: 20,
                                  Icons.arrow_forward_ios,
                                  color: Color(
                                    0xFF5EC590,
                                  ),
                                ),
                                title: Text("${question['title']}",
                                    maxLines: 1,
                                    style: TextStyle(color: Colors.green[400])),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 13.0, right: 8.0),
                              child: Divider(),
                            )
                          ],
                        );
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.green,
                          ),
                        );
                      }
                    }));
          },
        )
      ],
    ));
  }
}
