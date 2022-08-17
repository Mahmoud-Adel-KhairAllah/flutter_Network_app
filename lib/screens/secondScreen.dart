import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<String> array = [];

  Future<List<String>> callApi() async {
    var url = Uri.parse("https://wstest.gov.ps/flutterApi/test2.php");
    dynamic response = await http.get(url);
    var result = jsonDecode(response.body);
    for (String c in result) {
      array.add(c);
    }
    return array;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('second'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: callApi(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(5),
                    color: Colors.amber,
                    child: Text(array[index]),
                  );
                },
                itemCount: array.length,
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
