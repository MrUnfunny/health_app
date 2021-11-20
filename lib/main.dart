import 'package:flutter/material.dart';

import 'config/theme.dart';
import 'constants/constants.dart';
import 'constants/route_paths.dart';
import 'constants/router.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      onGenerateRoute: router.generateRoutes,
      initialRoute: RoutePaths.loadingScreen,
      theme: themeData(
        ThemeData.light(),
      ),
    );
  }
}
