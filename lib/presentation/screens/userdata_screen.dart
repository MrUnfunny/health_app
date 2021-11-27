import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../../bloc/userdata/userdata_bloc.dart';
import '../../config/colors.dart';
import '../../constants/constants.dart';
import '../../constants/route_paths.dart';
import '../../models/userdata.dart';
import '../../utils/analytics.dart';

class UserDataScreen extends StatelessWidget {
  const UserDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final heightController = TextEditingController();
    final weightController = TextEditingController();

    return BlocListener<UserdataBloc, UserdataState>(
      listener: (context, state) {
        if (state is UserdataSubmittedState) {
          Provider.of<AnalyticService>(context, listen: false)
              .logUserDetailsAdded();

          Navigator.pushReplacementNamed(context, RoutePaths.homeScreen);
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 36.0, left: 24, right: 24),
            child: ListView(
              children: [
                Text(
                  Constants.userDataScreenTitle,
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 48,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(hintText: 'Name'),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: weightController,
                  decoration: const InputDecoration(hintText: 'Weight (Kg)'),
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: heightController,
                  decoration: const InputDecoration(hintText: 'Height (cm)'),
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                const SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () {
                    context.read<UserdataBloc>().add(
                          UserdataSubmitEvent(
                            UserData(
                              nameController.text,
                              double.parse(weightController.text),
                              double.parse(heightController.text),
                            ),
                          ),
                        );
                  },
                  child: Text(
                    Constants.continu,
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: ThemeColors.backgroundColor),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 12),
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
