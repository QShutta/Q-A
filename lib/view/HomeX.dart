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
        body: Obx(
      () => RefreshIndicator(
        color: Colors.green,
        onRefresh: controller.refreshQuestions,
        child: ListView(
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
            Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                //This condition check wither the list "quesiton" contain the text"empty"
                //(To handle the case of that the user open the app for the first time
                //and he doesn't have an internet connection)
                //,if yes will display the next things.
                //"any" keyword:return true if the condition is true.
                child: controller.questions.any((element) =>
                        element.title!.toLowerCase().contains("empty"))
                    ? Container(
                        margin: const EdgeInsets.only(top: 150),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "No Data",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              IconButton(
                                  onPressed: controller.refreshQuestions,
                                  icon: const Icon(
                                    Icons.refresh,
                                    size: 30,
                                    color: Colors.green,
                                  ))
                            ],
                          ),
                        ),
                      )

                    //This condition is to display circluerProgress indicator
                    //in the period of that the data come either from the api
                    //or from the cach memory.
                    : controller.questions.isEmpty
                        ? Container(
                            margin: const EdgeInsets.only(top: 200),
                            child: const Center(
                              child: CircularProgressIndicator(
                                color: Colors.green,
                              ),
                            ))
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            //This line to add loading indicator to the end of the list in case if it's loading more data from api.
                            //in case of it's loading more daata ,will add 1 element  for the loading indicator
                            itemCount: controller.isLoadingMore.value
                                ? controller.questions.length + 1
                                : controller.questions.length,
                            itemBuilder: (builder, i) {
                              //if my current position is less than the total number of elements in the list called "question"
                              //that means there is still question in the list and there is no api call happen
                              //in this case will just dispaly the data from the list ,otherwise will do
                              //an api call again.and show loading indicator
                              if (i < controller.questions.length) {
                                //will get the data from the questions list.
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
                                            style: TextStyle(
                                                color: Colors.green[400])),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                          left: 13.0, right: 8.0),
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
                            }))
          ],
        ),
      ),
    ));
  }
}
