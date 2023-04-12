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
  var scrollController = ScrollController();
  bool isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollLithenr);
  }

  void _scrollLithenr() async {
    //If the position of the user in the end of the list,in that case he should load more data from the api.
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      print("...................................");
      //In case of that the user arrive to the end of the page we have to load data from another page from the api
      controller.page = controller.page + 1;
      //This var to indicate that ther is data come from the api
      setState(() {
        isLoadingMore = true;
      });
      await controller.getData();
      //after the data come from the api succfuly:
      setState(() {
        isLoadingMore = false;
      });
    } else {
      print("no scroll");
    }
  }

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
                    controller: scrollController,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:isLoadingMore?controller.questions.length+1: controller.questions.length,
                    itemBuilder: (builder, i) {
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
          },
        )
      ],
    ));
  }
}
