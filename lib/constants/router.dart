import 'package:flutter/material.dart';

import '../presentation/screens/detail_screen.dart';
import '../presentation/screens/formdetail_screen.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/loading_screen.dart';
import '../presentation/screens/main_screen.dart';
import '../presentation/screens/signin_screen.dart';
import '../presentation/screens/signup_screen.dart';
import 'route_paths.dart';

Route<dynamic> generateRoutes(RouteSettings settings) {
  return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) {
        switch (settings.name) {
          case RoutePaths.mainScreen:
            return const MainScreen();

          case RoutePaths.loadingScreen:
            return const LoadingScreen();

          case RoutePaths.signUpScreen:
            return const SignUpScreen();

          case RoutePaths.signInScreen:
            return const SignInScreen();

          case RoutePaths.homeScreen:
            return const HomeScreen();

          case RoutePaths.formDetail:
            return const FormDetailScreen();

          case RoutePaths.detailScreen:
            return const DetailScreen();

          default:
            // if (FirebaseAuth.instance.currentUser == null) {
            //   return const MainScreen();
            // }
            return const HomeScreen();
        }
      });
}
