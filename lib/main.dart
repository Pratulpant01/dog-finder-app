import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String imgurl = "https://images.dog.ceo//breeds//samoyed//n02111889_4967.jpg";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Dog Finder")),
            backgroundColor: Colors.red[900],
          ),
          backgroundColor: Colors.red[700],
          body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Center(
                  child: Container(
                      child: Image(image: NetworkImage(imgurl, scale: 1.0))),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Text(
                    "Find Your Best Dog....",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    onPressed: () async {
                      var url =
                          Uri.parse("https://dog.ceo/api/breeds/image/random");
                      var response = await http.get(url);
                      print("Response Status: ${response.statusCode}");
                      print("Response Body: ${response.body}");
                      var data = jsonDecode(response.body);
                      imgurl = data['message'];
                      setState(() {});
                    },
                    child: Icon(Icons.forward),
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
