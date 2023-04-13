import 'package:get/get.dart';
import 'package:flutter/material.dart';

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
      controller: controller.scrollController.value,
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
        Obx(() {
          return Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  //This line to add loading indicator to the end of the list in case if it's loading more data from api.
                  itemCount: controller.isLoadingMore.value
                      ? controller.questions.length + 1
                      : controller.questions.length,
                  itemBuilder: (builder, i) {
                    //if my current position is less than the total number of elements in the list called "question"
                    //that means there is still question in the list and there is no api call happen
                    //in this case will just dispaly the data from the list ,otherwise will do
                    //an api call again.and show loading indicator
                    if (i < controller.questions.length) {
                      final question = controller.questions[i];
                      return Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              //By this way we pass the data of the selected question to the secound page using model class.
                              await Get.to(() => const Details(),
                                  arguments: question);
                            },
                            child: ListTile(
                              trailing: const Icon(
                                size: 20,
                                Icons.arrow_forward_ios,
                                color: Color(
                                  0xFF5EC590,
                                ),
                              ),
                              title: Text("${question.title}",
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
                      ));
                    }
                  }));
        })
      ],
    ));
  }
}
