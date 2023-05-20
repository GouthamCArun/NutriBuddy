import 'package:diamond_bottom_bar/diamond_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:srm_app/UI/dashboard.dart';

import 'scan.dart';
import 'start.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late Widget _selectedWidget;
  @override
  void initState() {
    _selectedWidget = const Dashboard();
    super.initState();
  }

  void onPressed(index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        _selectedWidget = const Dashboard();
      } else if (index == 1) {
        _selectedWidget = const ScanScreen();
      } else if (index == 2) {
        _selectedWidget = const ScanScreen();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _selectedWidget,
      bottomNavigationBar: DiamondBottomNavigation(
        itemIcons: const [
          Icons.home,
          Icons.chat,
        ],
        centerIcon: Icons.qr_code_scanner_rounded,
        selectedColor: Color.fromARGB(255, 185, 34, 255),
        selectedLightColor: Color.fromARGB(255, 131, 19, 184),
        selectedIndex: _selectedIndex,
        onItemPressed: onPressed,
      ),
    );
  }
}
