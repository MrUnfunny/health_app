import 'package:flutter/material.dart';
import '../common/bottom_navbar.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: const CustomNavBar(),
      body: SafeArea(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
