import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DietSuggestionPage extends StatefulWidget {
  const DietSuggestionPage({super.key});

  @override
  State<DietSuggestionPage> createState() => _DietSuggestionState();
}

class _DietSuggestionState extends State<DietSuggestionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 202, 214),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 1000,
            ),
            Column(children: [
              const SizedBox(
                height: 80,
              ),
              Text(
                'Hey Jack',
                style: GoogleFonts.getFont("Poppins",
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 50,
                    )),
              ),
              Text(
                "I have a plan for you",
                style: GoogleFonts.getFont("Mitr",
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    )),
              ),
              Row(children: [
                Text(
                  'details here ',
                  style: GoogleFonts.getFont("Mitr",
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      )),
                ),
              ]),
            ]),
          ],
        ),
      ),
    );
  }
}
