import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'page6.dart';

class FifthPage extends StatefulWidget {
  const FifthPage({super.key});

  @override
  State<FifthPage> createState() => _FifthPageState();
}

class _FifthPageState extends State<FifthPage> {
  @override
  late final TextEditingController _to_gain_or_loose;
  void initState() {
    _to_gain_or_loose = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(children: <Widget>[
              const Padding(padding: EdgeInsets.all(20)),
              Text(
                'Loose or Gain ?',
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 40,
                  ),
                ),
              ),
              Image.asset(
                'assets/images/firstpage.png',
                height: 300,
                width: 300,
              ),
              Text(
                "I Wanna",
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
                    controller: _to_gain_or_loose,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "loose or gain ",
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 243, 238, 238))))),
                  onPressed: () async {
                    final to_gain_or_loose = _to_gain_or_loose.text;
                    try {
                      print('------------------------' +
                          to_gain_or_loose.toString() +
                          '---------');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SixthPage()),
                      );
                    } catch (e) {}
                  },
                  child: Text(
                    'One more',
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
        ));
  }
}
