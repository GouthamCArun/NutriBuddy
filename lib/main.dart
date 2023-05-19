import 'package:flutter/material.dart';
import 'package:srm_app/UI/profile.dart';
import 'UI/assistant.dart';
import 'UI/first.dart';
import 'UI/home.dart';
import 'UI/login.dart';
import 'UI/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Inhalake',
        routes: {
          "/login/": (context) => const LoginView(),
          "/register/": (context) => const RegisterView(),
          "/home/": (context) => const MainScreen(
                isLoggedIn: true,
              ),
        },
        home: const first());
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key, required this.isLoggedIn}) : super(key: key);

  final bool isLoggedIn;

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List pages = const [HomeScreen(), ProfilePage(), AssistantPage()];

  int screens = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(17, 29, 59, 1),
        body: widget.isLoggedIn ? pages[screens] : const first(),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 23, left: 23, right: 23),
          child: Container(
            height: 70,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(26, 14, 1, 255),
                    offset: Offset(
                      0.0,
                      5.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.white,
                    offset: Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
                color: Color.fromARGB(255, 31, 43, 71),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100))),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        screens = 0;
                      });
                    },
                    child: const Icon(
                      Icons.home,
                      size: 32,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 75),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        screens = 1;
                      });
                    },
                    child: const Icon(
                      Icons.water,
                      size: 32,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 75),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        screens = 2;
                      });
                    },
                    child: const Icon(
                      Icons.air,
                      size: 32,
                      color: Colors.lightBlue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
