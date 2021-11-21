import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/auth/auth_bloc.dart';
import 'config/theme.dart';
import 'constants/constants.dart';
import 'constants/route_paths.dart';
import 'constants/router.dart' as router;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Constants.appName,
        onGenerateRoute: router.generateRoutes,
        initialRoute: RoutePaths.loadingScreen,
        theme: themeData(
          ThemeData.light(),
        ),
      ),
    );
  }
}
