import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/indicatordata/indicatordata_bloc.dart';
import '../../constants/constants.dart';
import '../../models/indicator.dart';
import '../../utils/utils.dart';

class LineChartSample1 extends StatefulWidget {
  final Indicator indicator;
  const LineChartSample1({Key? key, required this.indicator}) : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartSample1State();
}

class LineChartSample1State extends State<LineChartSample1> {
  @override
  void initState() {
    super.initState();
    context
        .read<IndicatordataBloc>()
        .add(IndicatordataGetDataEvent(widget.indicator));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: BlocBuilder<IndicatordataBloc, IndicatordataState>(
              builder: (context, state) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 60,
                      ),
                      width: state is IndicatordataSuccessState
                          ? state.data.length < 4
                              ? state.data.length * 180
                              : state.data.length * 80
                          : MediaQuery.of(context).size.width * 0.7,
                      child: (state is IndicatordataSuccessState &&
                              state.data.isEmpty)
                          ? Text(
                              Constants.emptyIndicatorData,
                              style: Theme.of(context).textTheme.headline5,
                            )
                          : BarChart(
                              BarChartData(
                                barGroups: state is IndicatordataSuccessState
                                    ? parseAndSortBarChartGroupData(state.data)
                                    : null,
                                borderData: FlBorderData(
                                  show: false,
                                  border: const Border(
                                    top: BorderSide.none,
                                    right: BorderSide.none,
                                    left: BorderSide(width: 1),
                                    bottom: BorderSide(width: 1),
                                  ),
                                ),
                                gridData: FlGridData(
                                  getDrawingHorizontalLine: (val) {
                                    return FlLine(
                                      color: const Color(0xff272C44)
                                          .withOpacity(0.4),
                                      strokeWidth: 1,
                                    );
                                  },
                                ),
                                titlesData: FlTitlesData(
                                    topTitles: SideTitles(showTitles: false),
                                    rightTitles: SideTitles(showTitles: false)),
                              ),
                            ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
