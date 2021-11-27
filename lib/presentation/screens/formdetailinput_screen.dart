import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../bloc/firestore/firestore_bloc.dart';
import '../../config/colors.dart';
import '../../constants/constants.dart';
import '../../constants/route_paths.dart';
import '../../models/indicator.dart';
import '../../utils/analytics.dart';

class FormDetailInputScreen extends StatefulWidget {
  final Indicator indicator;

  const FormDetailInputScreen({required this.indicator, Key? key})
      : super(key: key);

  @override
  State<FormDetailInputScreen> createState() => _FormDetailInputScreenState();
}

class _FormDetailInputScreenState extends State<FormDetailInputScreen> {
  TextEditingController dateController = TextEditingController(
    text: DateTime.now().toString(),
  );

  double? name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: CupertinoNavigationBarBackButton(
          color: ThemeColors.black,
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (name == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      Constants.indicatorDataNotFound + widget.indicator.name,
                    ),
                  ),
                );
              } else {
                var time = DateTime.parse(dateController.text);
                context.read<FirestoreBloc>().add(
                      FirestoreAddIndicatorDataEvent(
                        widget.indicator.copyWith(
                          data: {
                            DateTime(
                              time.year,
                              time.month,
                              time.day,
                              DateTime.now().hour,
                              DateTime.now().second,
                              DateTime.now().millisecond,
                            ): name!
                          },
                        ),
                      ),
                    );
                Provider.of<AnalyticService>(context, listen: false)
                    .logIndicatorAdded(widget.indicator.name);

                Navigator.pushReplacementNamed(context, RoutePaths.homeScreen);
              }
            },
            child: const Text(
              Constants.save,
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 18,
        ),
        child: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Constants.add + widget.indicator.name,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: 36,
            ),
            DetailFormField(
              text: widget.indicator.name,
              unit: widget.indicator.unit,
              textInputType: TextInputType.number,
              onChanged: (String val) {
                setState(() {
                  name = double.tryParse(val) ?? 0.0;
                });
              },
            ),
            const SizedBox(
              height: 18,
            ),
            Text(
              Constants.date,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            DateTimePicker(
              controller: dateController,
              decoration: InputDecoration(
                hintText: Constants.date,
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.grey,
                  ),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: ThemeColors.grey,
                  ),
                ),
                hintStyle: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: ThemeColors.grey,
                    ),
              ),
              autocorrect: false,
              initialDate: DateTime.now(),
              firstDate: DateTime(DateTime.now().year),
              lastDate: DateTime.now(),
              dateLabelText: 'Date',
              validator: (val) {},
              onSaved: (val) {},
            ),
            const SizedBox(
              height: 18,
            ),
          ],
        )),
      ),
    );
  }
}

class DetailFormField extends StatelessWidget {
  final String text;
  final String unit;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  const DetailFormField({
    Key? key,
    required this.text,
    required this.unit,
    required this.onChanged,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Expanded(
              child: TextFormField(
                keyboardType: textInputType ?? TextInputType.text,
                onChanged: onChanged,
              ),
            ),
            const SizedBox(
              width: 36,
            ),
            Text(
              unit,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ],
    );
  }
}
