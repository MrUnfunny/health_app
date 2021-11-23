import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
                  child: StaggeredGridView.countBuilder(
                    crossAxisCount: 4,
                    itemCount: Constants.indicators.length,
                    itemBuilder: (BuildContext context, int index) =>
                        IndicatorTile(
                      title: Constants.indicators[index].name,
                      icon: Constants.indicators[index].icon,
                      widget: Container(
                        child: !Constants.indicators[index].isShort
                            ? CircularPercentIndicator(
                                radius: 100,
                                lineWidth: 10.0,
                                percent: 0.75,
                                center: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: Constants
                                            .indicators[index].shortData
                                            .toStringAsFixed(2),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            ?.copyWith(
                                              color: Constants.indicators[index]
                                                      .isFilled
                                                  ? ThemeColors.backgroundColor
                                                  : ThemeColors.black,
                                            ),
                                      ),
                                      TextSpan(
                                        text:
                                            '\n${Constants.indicators[index].unit}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle2,
                                      ),
                                    ],
                                  ),
                                ),
                                circularStrokeCap: CircularStrokeCap.round,
                                progressColor:
                                    Constants.indicators[index].isFilled
                                        ? ThemeColors.backgroundColor
                                        : ThemeColors.mainColor,
                                backgroundColor:
                                    Constants.indicators[index].isFilled
                                        ? ThemeColors.grey
                                        : ThemeColors.backgroundColor,
                              )
                            : Text(
                                '${Constants.indicators[index].shortData} ${Constants.indicators[index].unit}',
                                textAlign: TextAlign.left,
                              ),
                      ),
                      isFilled: Constants.indicators[index].isFilled,
                      fillColor: Constants.indicators[index].color,
                    ),
                    staggeredTileBuilder: (int index) =>
                        (Constants.indicators[index].isShort)
                            ? const StaggeredTile.count(2, 1.25)
                            : const StaggeredTile.count(2, 2.5),
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 18.0,
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
