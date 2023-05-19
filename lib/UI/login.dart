import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../services/firebase_options.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose(); // TODO: implement
    // pose
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(100.0),
        //   child: AppBar(
        //     backgroundColor: Color.fromARGB(255, 31, 43, 71),
        //     centerTitle: true,
        //     title: const Text(
        //       "Login",
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
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          const Padding(padding: EdgeInsets.all(20)),
                          Text(
                            'Login',
                            style: GoogleFonts.getFont(
                              "Poppins",
                              textStyle: const TextStyle(
                                color: Color.fromARGB(255, 0, 0, 0),
                                fontSize: 40,
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/first.png',
                            height: 300,
                            width: 300,
                          ),
                          Text(
                            'Welcome back you\'ve been missed!',
                            style: GoogleFonts.getFont("Poppins",
                                textStyle: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 20,
                                )),
                          ),
                          const SizedBox(height: 70),
                          SizedBox(
                            width: 350,
                            child: TextField(
                                cursorColor: Color(0xFFea4c89),
                                cursorWidth: 5,
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
                                  prefixIcon: Icon(Icons.email_outlined),
                                  hintText: "Email",
                                )),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: 350,
                            child: TextField(
                                cursorColor: Color(0xFFea4c89),
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
                                    prefixIcon: Icon(Icons.password_outlined),
                                    hintText: "password")),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0),
                            child: SizedBox(
                              width: 350,
                              height: 60,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 253, 190, 208)),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20),
                                                bottomLeft: Radius.circular(20),
                                                bottomRight:
                                                    Radius.circular(20)),
                                            side: BorderSide(
                                                color:
                                                    Color.fromARGB(255, 243, 238, 238))))),
                                onPressed: () async {
                                  final email = _email.text;
                                  final password = _password.text;
                                  try {
                                    final userCredentials = await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                            email: email, password: password);
                                    print(userCredentials);
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            "/home/", (route) => false);
                                  } on FirebaseAuthException catch (e) {
                                    if (e.code == "user-not-found") {
                                      print("Invalid email-id ");
                                    } else if (e.code == "wrong-password") {
                                      print("Invalid password");
                                    }
                                  }
                                },
                                // style: ElevatedButton.styleFrom(
                                //   side: BorderSide(
                                //     width: 2.0,
                                //   ),
                                // ),
                                child: Text(
                                  'Login',
                                  style: GoogleFonts.getFont("Poppins",
                                      textStyle: TextStyle(
                                          color: Color.fromARGB(255, 0, 0, 0),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pushNamedAndRemoveUntil(
                                  "/register/", (route) => false);
                            },
                            child:
                                const Text("don't have account, Sign up here!"),
                          )
                        ],
                      ),
                    )
                  ],
                );
              default:
                return const Text("Loading....");
            }
          },
        ));
  }
}
