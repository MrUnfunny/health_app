import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../config/colors.dart';
import '../../constants/constants.dart';
import '../../constants/route_paths.dart';
import '../../models/indicator.dart';

class FormDetailScreen extends StatelessWidget {
  const FormDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 24.0,
          horizontal: 18.0,
        ),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                '${FirebaseAuth.instance.currentUser!.displayName!}, ${Constants.formDetailTitle}',
                style: Theme.of(context).textTheme.headline5,
              ),
              const SizedBox(
                height: 24,
              ),
              ...Constants.indicators
                  .map((e) => DetailCard(indicator: e))
                  .toList(),
            ],
          ),
        ),
      ),
    );
  }
}

class DetailCard extends StatelessWidget {
  final Indicator indicator;
  const DetailCard({
    Key? key,
    required this.indicator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: TextButton(
        style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.formDetailInputScreen,
              arguments: indicator);
        },
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: ThemeColors.mainColor,
              radius: 24,
              child: Icon(
                indicator.icon,
                color: ThemeColors.backgroundColor,
                size: 18,
              ),
            ),
            const SizedBox(width: 18),
            Text(
              indicator.name,
              style: Theme.of(context).textTheme.headline6,
            )
          ],
        ),
      ),
    );
  }
}
