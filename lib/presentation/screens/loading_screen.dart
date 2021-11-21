import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../constants/constants.dart';
import '../../constants/route_paths.dart';
import '../../repository/firestore_repository.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then(
      (value) => FirebaseAuth.instance.currentUser == null
          ? Navigator.pushReplacementNamed(context, RoutePaths.mainScreen)
          : FirestoreRepository().checkUserData()
              ? Navigator.pushReplacementNamed(context, RoutePaths.homeScreen)
              : Navigator.pushReplacementNamed(
                  context,
                  RoutePaths.userDataScreen,
                ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 400,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const FlutterLogo(
                    size: 80,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(Constants.appName),
                  const SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: CircularProgressIndicator(
                      color: ThemeColors.lightMainAccentColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
