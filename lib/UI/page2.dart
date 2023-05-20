import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'page3.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  late final _gender;

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
                'Could me let you Know your sex',
                style: GoogleFonts.getFont(
                  "Poppins",
                  textStyle: const TextStyle(
                    color: Color.fromARGB(255, 0, 0, 0),
                    fontSize: 40,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "I am a",
                style: GoogleFonts.getFont("Poppins",
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    )),
              ),
              const SizedBox(height: 50),
              SizedBox(
                child: Row(
                  children: [
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            final _gender = "man";
                            print('------------------------' +
                                _gender.toString() +
                                '---------');

                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ThirdPage()),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/boy.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            padding: const EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 30),
                    SizedBox(
                      height: 150,
                      width: 150,
                      child: Card(
                        child: InkWell(
                          onTap: () {
                            final _gender = "women";
                            print('------------------------' +
                                _gender.toString() +
                                '---------');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ThirdPage()),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/girl.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                            padding: const EdgeInsets.all(16.0),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
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
                    final _gender = " ";
                    try {
                      print('------------------------' +
                          _gender.toString() +
                          '---------');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ThirdPage()),
                      );
                    } catch (e) {}
                  },
                  child: Text(
                    "Its fine if you don't want to say",
                    style: GoogleFonts.getFont("Poppins",
                        textStyle: const TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 20,
                            fontWeight: FontWeight.w300)),
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
