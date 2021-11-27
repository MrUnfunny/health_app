import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/constants/route_paths.dart';

import '../../bloc/homescreen/homescreen_bloc.dart';
import '../../config/colors.dart';
import '../../constants/constants.dart';
import '../../models/indicator.dart';
import '../common/line_chart.dart';

class DetailScreen extends StatelessWidget {
  final Indicator indicator;
  const DetailScreen({Key? key, required this.indicator}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: CupertinoNavigationBarBackButton(
          color: ThemeColors.textPrimaryColor,
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(
              context,
              RoutePaths.formDetailInputScreen,
              arguments: indicator,
            ),
            icon: Icon(
              Icons.add,
              color: ThemeColors.textPrimaryColor,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              indicator.name,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline4,
            ),
            LineChartSample1(indicator: indicator),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Text(
                Constants.today,
                textAlign: TextAlign.left,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    ?.copyWith(fontSize: 30, fontWeight: FontWeight.w500),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            BlocBuilder<HomescreenBloc, HomescreenState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 28.0),
                  child: Text(
                    state is HomeScreenGetDataSuccessState
                        ? state.homeScreenData
                                .toMap()[indicator.name.toLowerCase()] +
                            ' ' +
                            indicator.unit.toLowerCase()
                        : ' ',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
