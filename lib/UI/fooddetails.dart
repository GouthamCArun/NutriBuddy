import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FooddetailsPage extends StatefulWidget {
  const FooddetailsPage({super.key});

  @override
  State<FooddetailsPage> createState() => _FooddetailsPageState();
}

class _FooddetailsPageState extends State<FooddetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 253, 190, 208),
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
                "you Wanna Know What's in your food?",
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
