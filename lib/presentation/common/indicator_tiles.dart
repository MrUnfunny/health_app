import 'package:flutter/material.dart';
import '../../config/colors.dart';

class IndicatorTile extends StatelessWidget {
  final bool isFilled;
  final Color? fillColor;
  final String title;
  final IconData icon;
  final Widget widget;

  const IndicatorTile({
    Key? key,
    required this.title,
    required this.icon,
    required this.widget,
    this.fillColor,
    this.isFilled = false,
  })  : assert(isFilled || fillColor != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 24,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: ThemeColors.grey,
        ),
        color: isFilled ? Theme.of(context).primaryColor : null,
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
                title,
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: isFilled
                          ? ThemeColors.white
                          : ThemeColors.textPrimaryColor,
                    ),
                textAlign: TextAlign.left,
              ),
              Icon(
                icon,
                color: isFilled
                    ? ThemeColors.backgroundColor.withOpacity(0.6)
                    : fillColor,
              ),
            ],
          ),
          widget,
        ],
      ),
    );
  }
}
