import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/auth/auth_bloc.dart';
import 'bloc/firestore/firestore_bloc.dart';
import 'bloc/homescreen/homescreen_bloc.dart';
import 'bloc/indicatordata/indicatordata_bloc.dart';
import 'bloc/userdata/userdata_bloc.dart';
import 'config/theme.dart';
import 'constants/constants.dart';
import 'constants/route_paths.dart';
import 'constants/router.dart' as router;
import 'utils/analytics.dart';
import 'utils/bloc_observer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  BlocOverrides.runZoned(
    () => runApp(MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final analytics = AnalyticService();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthBloc()),
        BlocProvider(create: (context) => UserdataBloc()),
        BlocProvider(create: (context) => FirestoreBloc()),
        BlocProvider(create: (context) => IndicatordataBloc()),
        BlocProvider(
            create: (context) =>
                HomescreenBloc(BlocProvider.of<FirestoreBloc>(context))),
      ],
      child: Provider(
        create: (context) => analytics,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: Constants.appName,
          onGenerateRoute: router.generateRoutes,
          initialRoute: RoutePaths.loadingScreen,
          theme: themeData(
            ThemeData.light(),
          ),
          navigatorObservers: [
            analytics.getAnalyticsObserver(),
          ],
        ),
      ),
    );
  }
}
