import 'package:flutter/material.dart';

import '../../constants/constants.dart';
import '../../constants/route_paths.dart';
import '../../utils/utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  DateTime currentBackPressTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: WillPopScope(
        onWillPop: () => onWillPop(
          currentBackPressTime,
          () {
            setState(() {
              currentBackPressTime = DateTime.now();
            });
          },
          context,
        ),
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.only(
              top: 150,
              right: 24,
              left: 24,
              bottom: 12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CircleAvatar(
                  radius: 100,
                ),
                const SizedBox(height: 40),
                Text(
                  'Track all your health indicators at one place',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4,
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, RoutePaths.signUpScreen),
                      child: const Text(Constants.signUpButtonText),
                    ),
                    TextButton(
                      onPressed: () =>
                          Navigator.pushNamed(context, RoutePaths.signInScreen),
                      child: const Text(Constants.signInButtonText),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
