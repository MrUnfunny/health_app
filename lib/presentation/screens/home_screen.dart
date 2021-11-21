import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../config/colors.dart';
import '../../constants/constants.dart';
import '../../constants/route_paths.dart';
import '../common/indicator_tiles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthLoggedOutState) {
            Navigator.pushReplacementNamed(context, RoutePaths.mainScreen);
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 36.0,
            left: 24,
            right: 24,
          ),
          child: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Text(
                    DateFormat('MMM d, yyyy').format(DateTime.now()),
                    style: Theme.of(context).textTheme.subtitle1,
                    textAlign: TextAlign.left,
                  ),
                ),
                SliverToBoxAdapter(
                  child: Text(
                    Constants.hello +
                        FirebaseAuth.instance.currentUser!.displayName!,
                    style: Theme.of(context).textTheme.headline4,
                    textAlign: TextAlign.left,
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: 36)),
                SliverFillRemaining(
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 18,
                    crossAxisSpacing: 18,
                    childAspectRatio: 0.7,
                    children: [
                      IndicatorTile(
                        title: 'Steps',
                        icon: const Icon(FontAwesomeIcons.running),
                        widget: Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(20),
                            child: CircularPercentIndicator(
                              radius: 100,
                              lineWidth: 10.0,
                              percent: 0.75,
                              center: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '7500',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1
                                          ?.copyWith(
                                            color: ThemeColors.backgroundColor,
                                          ),
                                    ),
                                    TextSpan(
                                      text: '\nSteps',
                                      style:
                                          Theme.of(context).textTheme.subtitle2,
                                    ),
                                  ],
                                ),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: ThemeColors.white,
                              backgroundColor: ThemeColors.grey,
                            ),
                          ),
                        ),
                        fillColor: true,
                      ),
                      // IndicatorTile(),
                      // IndicatorTile(),
                      // IndicatorTile(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
