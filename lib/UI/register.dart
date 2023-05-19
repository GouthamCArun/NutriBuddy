import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/firebase_options.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late AnimationController controller;
  String msg = "enter password";

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
      backgroundColor: Color.fromARGB(255, 17, 29, 59),
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
      body: SafeArea(
        child: FutureBuilder(
            future: Firebase.initializeApp(
              options: DefaultFirebaseOptions.currentPlatform,
            ),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.done:
                  return ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                       Column(
                      children: [
                        Padding(padding: EdgeInsets.only(top: 10)),
                        Text(
                          'Sign Up',
                          style: GoogleFonts.getFont("Poppins",
                              textStyle: TextStyle(
                                color: Color.fromARGB(255, 253, 250, 250),
                                fontSize: 40,
                              )),
                        ),
                        Image.asset(
                          'assets/inhalake.png',
                          height: 300,
                          width: 300,
                        ),
                        Text(
                          'Welcome back you\'ve been missed!',
                          style: GoogleFonts.getFont("Poppins",
                              textStyle: TextStyle(
                                color: Color.fromARGB(255, 253, 250, 250),
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
                        SizedBox(height: 20),
                        SizedBox(
                          height: 50,
                          width: 350,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF2dfff5)),
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
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                      "/home/", (route) => true);
                                } on FirebaseAuthException catch (e) {
                                  if (e.code == "weak-password") {
                                    setState(() {
                                      msg = "weak password";
                                    });
                                    print("weak password");
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
                              child: const Text("Create",
                                  style: TextStyle(color: Colors.black))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            msg,
                            style: TextStyle(
                                fontSize: 18,
                                color: Color.fromARGB(255, 241, 240, 240)),
                          ),
                        ),
                      ],
                    ),
                    ],
                  );
                default:
                  return const Text("Loading....");
              }
            }),
      ),
    );
  }
}
