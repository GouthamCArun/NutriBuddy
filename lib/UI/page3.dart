import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'page4.dart';

class ThirdPage extends StatefulWidget {
  const ThirdPage({super.key});

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  late final TextEditingController _height;
  void initState() {
    _height = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: <Widget>[
                const Padding(padding: EdgeInsets.all(20)),
                Text(
                  'How Tall are you ?',
                  style: GoogleFonts.getFont(
                    "Poppins",
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 40,
                    ),
                  ),
                ),
                Image.asset(
                  'assets/images/height.jpg',
                  height: 300,
                  width: 300,
                ),
                Text(
                  "The greatness of a person cannot be measured by their physical height!",
                  style: GoogleFonts.getFont("Poppins",
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      )),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 350,
                  child: TextField(
                      cursorColor: const Color(0xFFea4c89),
                      cursorWidth: 5,
                      enableSuggestions: false,
                      autocorrect: false,
                      controller: _height,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        hintText: "Height in cm",
                      )),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 55,
                  width: 350,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 253, 190, 208)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20)),
                                    side: BorderSide(
                                        color: Color.fromARGB(
                                            255, 243, 238, 238))))),
                    onPressed: () async {
                      final height = _height.text;
                      try {
                        print('------------------------' +
                            height.toString() +
                            '---------');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForthPage()),
                        );
                      } catch (e) {}
                    },
                    child: Text(
                      'Next',
                      style: GoogleFonts.getFont("Poppins",
                          textStyle: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ));
  }
}
