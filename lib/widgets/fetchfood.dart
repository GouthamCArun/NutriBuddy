import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FetchFood extends StatefulWidget {
  const FetchFood({super.key, required this.Food});
  final Food;

  @override
  State<FetchFood> createState() => _FetchFoodState();
}

class _FetchFoodState extends State<FetchFood> {
  late Future _fetchedData;

  Future fetchRestaurants() async {
    await Future.delayed(Duration(seconds: 5));
    final response = await http.post(
      //fetching API
      Uri.parse(
          'https://diet-bot-production.up.railway.app/chatbot_api/food_search/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"food": widget.Food, "diet": "kieto"}),
    );

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      String dataList = jsonResponse['response'];
      return dataList;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }

  FutureBuilder buildFutureBuilder() {
    //building Cards
    return FutureBuilder(
      future: _fetchedData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var food = snapshot.data!;
          return Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              height: MediaQuery.of(context).size.height - 30,
              width: MediaQuery.of(context).size.width - 30,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 254, 239, 194),
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8, top: 8),
                    child: Text(
                      "About the Food:",
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      '$food',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    _fetchedData = fetchRestaurants();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return buildFutureBuilder();
  }
}
