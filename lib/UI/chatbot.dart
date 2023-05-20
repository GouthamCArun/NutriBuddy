// chat_screen.dart

import 'dart:convert';

import 'package:flutter/material.dart';
import 'chat_bubble.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
  //default constructor
  const ChatScreen({Key? key}) : super(key: key);

}

class _ChatScreenState extends State<ChatScreen> {
  List<ChatBubble> _chatBubbles = [];
  TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Healthy Diet Chatbot'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatBubbles.length,
              itemBuilder: (BuildContext context, int index) {
                return _chatBubbles[index];
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Type your message...'),
                    onSubmitted: _handleSubmitted,
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () => _handleSubmitted(_textController.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

    Future<void> _handleSubmitted(String text) async {
    setState(() {
      _chatBubbles.add(ChatBubble(
        message: text,
        isUser: true,
        timestamp: DateTime.now(),
      ));
      _textController.clear();
    });

    final apiUrl = 'https://pyg-backend.up.railway.app/chatbot-api';
    final response = await http.post(
      Uri.parse(apiUrl), 
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(<String, String>{
      "query": text,
    })
    );

    if (response.statusCode == 200) {
      final botResponse = jsonDecode(response.body)['response'] as String;
      setState(() {
   
        _chatBubbles.add(ChatBubble(
          message: botResponse,
          isUser: false,
          timestamp: DateTime.now(),
        ));
      });
    } else {
      print('API Error: ${response.statusCode}');
    }
  }
  }
class Album {
  final String answer;

  const Album({required this.answer});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      answer: json['response'],
    );
  }
}