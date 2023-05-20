import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_app/UI/page1.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Nutrition in your pocket',
                style: GoogleFonts.poppins(
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'Unlock Your Health Potential with AI Dietician: Your Personalized Path to Wellness!',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Image.asset('assets/images/Healthy lifestyle.gif'),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FirstPage()),
                  );
                },
                color: const Color.fromARGB(255, 253, 190, 208),
                elevation: 10,
                splashColor: Color.fromARGB(255, 215, 39, 255),
                height: 45,
                minWidth: 200,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Get started'),
                    Icon(Icons.arrow_forward_ios)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
