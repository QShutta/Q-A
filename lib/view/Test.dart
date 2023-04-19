import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List myitems = [];
  Future getData() async {
    var apiUrl = Uri.parse('https://643f676f3dee5b763e1bea07.mockapi.io/users');

    // final apiUrl = Uri.parse(
    //     'https://api.stackexchange.com/2.3/questions?page=1&pagesize=10&order=desc&sort=activity&tagged=flutter&site=stackoverflow');

    var res = await http.get(apiUrl);
    if (res.statusCode == 200) {
      List resBody = await jsonDecode(res.body);
      myitems = [];
      setState(() {
        myitems.addAll(resBody);
      });

      return resBody;
    } else {
      throw Exception("status code: ${res.statusCode}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Home"),
        ),
        body: RefreshIndicator(
          onRefresh: getData,
          child: myitems.isEmpty
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: myitems.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                      title: Text("${myitems[index]['name']}"),
                    ));
                  },
                ),
        ));
  }
}
