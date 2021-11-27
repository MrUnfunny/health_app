import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../constants/route_paths.dart';
import '../../models/indicator.dart';

class IndicatorTile extends StatelessWidget {
  final Indicator indicator;
  final Widget widget;

  const IndicatorTile({
    Key? key,
    required this.widget,
    required this.indicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, RoutePaths.detailScreen,
            arguments: indicator);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: ThemeColors.grey,
          ),
          color: indicator.isFilled ? Theme.of(context).primaryColor : null,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  indicator.name,
                  style: Theme.of(context).textTheme.bodyText1?.copyWith(
                        color: indicator.isFilled
                            ? ThemeColors.white
                            : ThemeColors.textPrimaryColor,
                      ),
                  textAlign: TextAlign.left,
                ),
                Icon(
                  indicator.icon,
                  color: indicator.isFilled
                      ? ThemeColors.backgroundColor.withOpacity(0.6)
                      : indicator.color,
                ),
              ],
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
