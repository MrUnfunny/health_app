import 'package:flutter/material.dart';
import '../../constants/route_paths.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) =>
        Navigator.pushReplacementNamed(context, RoutePaths.mainScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            child: const FlutterLogo(
              size: 150,
              curve: Curves.bounceInOut,
              duration: Duration(seconds: 2),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
