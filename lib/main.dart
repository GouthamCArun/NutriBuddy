import 'package:flutter/material.dart';
import 'package:srm_app/UI/chatbot.dart';
import 'package:srm_app/UI/deitsuggestion.dart';
import 'package:srm_app/UI/home.dart';
import 'package:srm_app/UI/chatbot.dart';
import 'UI/first.dart';
import 'UI/page1.dart';
import 'UI/page5.dart';
import 'UI/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Diety',
        home: DietSuggestionPage());
  }
}
