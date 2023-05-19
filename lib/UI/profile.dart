import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Column(children: [
              Image.asset(
                'assets/images/dp.jpg',
                height: 300,
                width: 300,
              ),
              Text(
                'Alfred Jimmy',
                style: GoogleFonts.getFont("Mitr",
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    )),
              ),
              Row(children: [
                Text(
                  'Signed in as: ',
                  style: GoogleFonts.getFont("Mitr",
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      )),
                ),
                Text(
                  user.email!,
                  style: GoogleFonts.getFont("Mitr",
                      textStyle: const TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 20,
                      )),
                ),
              ]),
              Text(
                'I have visited 20 countries ',
                style: GoogleFonts.getFont("Mitr",
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    )),
              ),
              Text(
                'HomeTown:New York',
                style: GoogleFonts.getFont("Mitr",
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    )),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
