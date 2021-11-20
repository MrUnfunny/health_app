import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const FlutterLogo(
          size: 150,
          curve: Curves.bounceInOut,
          duration: Duration(seconds: 2),
        ),
      ),
    );
  }
}
