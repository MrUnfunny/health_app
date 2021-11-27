import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/bloc/auth/auth_bloc.dart';
import 'package:health/bloc/userdata/userdata_bloc.dart';
import 'package:provider/provider.dart';

import '../../bloc/homescreen/homescreen_bloc.dart';
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
    context.read<HomescreenBloc>().add(HomescreenGetDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomescreenBloc, HomescreenState>(
      listener: (context, state) {
        if (FirebaseAuth.instance.currentUser == null) {
          Navigator.pushReplacementNamed(context, RoutePaths.mainScreen);
        } else {
          if (FirestoreRepository().checkUserData()) {
            if (state is HomeScreenGetDataSuccessState ||
                state is HomeScreenGetDataFailureState) {
              Navigator.pushReplacementNamed(context, RoutePaths.homeScreen);
            }
          } else {
            Navigator.pushReplacementNamed(
              context,
              RoutePaths.userDataScreen,
            );
          }
        }
      },
      child: Scaffold(
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
      ),
    );
  }
}
