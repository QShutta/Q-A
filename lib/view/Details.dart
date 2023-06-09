import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import '../model/question_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Details extends StatefulWidget {
  const Details({
    super.key,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  //We create an instane of the data that will passing from the home screen.and this instance is from Quesion model class type.
  final Question myquestion = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
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
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 10),
              child: Center(
                child: Text(
                  "FAQ",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0),
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: const Text(
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
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
              child: Container(
                  width: double.infinity,
                  // alignment: Alignment.topLeft,
                  child: Text(
                    " ${myquestion.title}",
                    style: const TextStyle(
                      fontSize: 14.0,
                    ),
                  )),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
              child: Row(
                children: [
                  const Text(
                    "Answred:",
                    style: TextStyle(
                      color: Color(
                        0xFF5EC590,
                      ),
                    ),
                  ),
                  myquestion.isAnswered!
                      ? const Icon(
                          Icons.check,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.close,
                          color: Colors.red,
                        ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
              child: Row(
                children: [
                  Text(
                    "Views: ${myquestion.viewCount}",
                    style: const TextStyle(
                      color: Color(
                        0xFF5EC590,
                      ),
                    ),
                  ),
                  // Text("${myquestion.viewCount}")
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
              child: Row(
                children: [
                  Text(
                    "Answers:${myquestion.answerCount}",
                    style: const TextStyle(
                      color: Color(
                        0xFF5EC590,
                      ),
                    ),
                  ),
                  // Text("${myquestion.answerCount}")
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
                  const Text(
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
                            Uri.parse(myquestion.link!))) {
                          throw Exception(
                              'Colud not launch ${Uri.parse(myquestion.link!)}');
                        }
                      },
                      icon: const Icon(Icons.link))
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: const Text(
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
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
              child: Wrap(
                spacing: 8.0,
                children: myquestion.tags!
                    .map((tag) => Chip(
                            label: Text(
                          tag,
                          style: const TextStyle(
                            color: Color(
                              0xFF5EC590,
                            ),
                          ),
                        )))
                    .toList(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 12.0, right: 12.0, top: 10.0),
              child: Container(
                  width: double.infinity,
                  alignment: Alignment.topLeft,
                  child: const Text(
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
                    child: myquestion.owner!.profileImage != null
                        ? CachedNetworkImage(
                            imageUrl: myquestion.owner!.profileImage!,
                            placeholder: (context, url) {
                              return const CircularProgressIndicator();
                            },
                            errorWidget: (context, url, error) {
                              return const Icon(Icons.person);
                            },
                          )
                        : const Icon(Icons.person),
                  )),
                  title: Text(
                    "${myquestion.owner!.displayName}",
                    style: const TextStyle(
                      color: Color(
                        0xFF5EC590,
                      ),
                    ),
                  ),
                  subtitle: InkWell(
                      onTap: () async {
                        if (!await launchUrl(
                            mode: LaunchMode.externalApplication,
                            Uri.parse(myquestion.owner!.link!))) {
                          throw Exception(
                              'Colud not launch ${Uri.parse(myquestion.link!)}');
                        }
                      },
                      child: Text(myquestion.owner!.link!)),
                ),
              ),
            )
          ],
        ));
  }
}
