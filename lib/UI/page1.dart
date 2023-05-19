import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'page2.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  late final TextEditingController _age;
  void initState() {
    _age = TextEditingController();
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
                'Would you mind sharing your age ?',
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
                "You definitely look younger than that!",
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
                    controller: _age,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      hintText: "Age is just a number",
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
                    final age = _age.text;
                    try {
                      print('------------------------' +
                          age.toString() +
                          '---------');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SecondPage()),
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
        ));
  }
}
