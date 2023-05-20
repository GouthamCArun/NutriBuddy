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
          // mainAxisAlignment: MainAxisAlignment.left,
          children: [
            const SizedBox(
              height: 200,
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
                  "\n\nHey! Great that you are looking to maintain a \n healthy weight and stay fit. Here's a diet plan \nthat you can follow:\n\n• Keto Diet: This diet involves reducing your carb \nintake and increasing .\n This helps to reduce your body weight.\n\n• Eat healthy and nutritious meals: Make sure \nyou eat meals that are rich in proteins,\n healthy fats, and complex carbohydrates.\n Avoid processed foods and deep fried foods.\n\n• Drink lots of water This helps to keep your body hydrated\n\n• Exercise regularly: Aim to exercise at least 5 days a week. \n\n• Get enough sleep: Aim to get at least 8 hours of sleep per night.\n\n• Avoid alcohol and smoking: These habits can have a negative impact on your health and should be avoided.\n\nFollowing this diet plan should help you reach your goal of losing 2 kg. All the best!",
                  style: GoogleFonts.getFont("Mitr",
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 15,
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
