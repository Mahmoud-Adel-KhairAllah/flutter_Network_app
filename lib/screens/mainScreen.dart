import 'dart:convert';
import 'package:get/get.dart' ;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:network_flutter_app/screens/secondScreen.dart';

class MainScreen extends StatefulWidget {


  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var name = ''.obs;
  var job = ''.obs;

  void callApi() async {
    var url = Uri.parse("https://wstest.gov.ps/flutterApi/test.php");
    dynamic response = await http.get(url);
    var result = jsonDecode(response.body);
    name.value = result['name'];
    job.value = result['job'];
  }
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
          appBar: AppBar(
            title: Text('network'),
          ),
          body: Column(
            children: [
              Image.network('https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
              TextButton(onPressed: () {callApi();}, child: Text('get')),
              Row(
                children: [Text('name:'), Text(name.string)],
              ),
              Row(
                children: [Text('job:'), Text(job.string)],
              ),
              TextButton(onPressed: () {Get.to(SecondScreen());}, child: Text('go')),
            ],
          ),
        ));
  }
}
