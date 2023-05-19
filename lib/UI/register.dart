import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:srm_app/UI/start.dart';

import '../services/firebase_options.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/firebase_options.dart';
import 'home.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late AnimationController controller;
  String msg = "Enter password";

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController(); // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose(); // TODO: implement dis
    // pose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(150.0),
      //   child: AppBar(
      //     title: const Text(
      //       'SignUp',
      //       style: TextStyle(fontSize: 30),
      //       textAlign: TextAlign.center,
      //     ),
      //   ),
      // ),
      body: FutureBuilder(
          future: Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          ),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return ListView(
                  children: [
                    Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          'Sign Up',
                          style: GoogleFonts.getFont("Mitr",
                              textStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 40,
                              )),
                        ),
                        Image.asset(
                          'assets/first.png',
                          height: 300,
                          width: 300,
                        ),
                        Text(
                          'Welcome back you\'ve been missed!',
                          style: GoogleFonts.getFont("Mitr",
                              textStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 20,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                              controller: _email,
                              keyboardType: TextInputType.emailAddress,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                hintText: "Email",
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: TextField(
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              controller: _password,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  hintText: "password")),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 50,
                          width: 350,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 0, 0, 0)),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
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
                              final email = _email.text;
                              final password = _password.text;
                              try {
                                final userCredentials = await FirebaseAuth
                                    .instance
                                    .createUserWithEmailAndPassword(
                                        email: email, password: password);
                                print(userCredentials);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const StartPage()),
                                );
                              } on FirebaseAuthException catch (e) {
                                if (e.code == "Weak-password") {
                                  setState(() {
                                    msg = "Weak password";
                                  });
                                  print("Weak password");
                                } else if (e.code == "email-already-use") {
                                  setState(() {
                                    msg = "email already exist";
                                  });
                                } else if (e.code == "invalid-email") {
                                  setState(() {
                                    msg = "invalid-email";
                                  });
                                }
                              }
                            },
                            // style: ElevatedButton.styleFrom(
                            //   side: BorderSide(
                            //     width: 2.0,
                            //   ),
                            // ),
                            child: const Text(
                              "Create",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            msg,
                            style: const TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              default:
                return Scaffold(
                    backgroundColor: Colors.blueAccent[300],
                    body: const Center(child: CircularProgressIndicator()));
            }
          }),
    );
  }
}
