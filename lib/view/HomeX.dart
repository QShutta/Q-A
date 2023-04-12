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
  final scrollController = ScrollController();
  //We are going to create indicator that will tell the user that some data loaded at this moment
  bool isLoadingMore = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() async {
    //To prevent another api call,when there is an api call hapen already.
    //->By this line when there is an api call happening already.he will get out from the method.
    if (isLoadingMore) return;
    //The condition is to make sure that the api call will hapen when the user arrive to the end of the listView.
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      //Whenever we reach the end of the screen will retrive the data from new page from the api.
      controller.page = controller.page + 1;
      //When there is data is loaded from the api the var should be true;
      setState(() {
        isLoadingMore = true;
      });

      await controller.getData();
      //Once the api call finish the var will return to false again.
      setState(() {
        isLoadingMore = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      //When we add scroll controller to the listView it gives us idea about the scroll behavior of the listView
      controller: scrollController,
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
                    itemBuilder: (builder, i) {
                      //xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
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
                        return Center(
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
