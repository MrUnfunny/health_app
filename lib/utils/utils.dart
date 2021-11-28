import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Email {
  Email(this.emailAddress);

  String emailAddress;

  static bool validate(String emailAddress, {bool allowEmpty = true}) {
    final validEmail = RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
    if (emailAddress != '') {
      return validEmail.hasMatch(emailAddress);
    }
    return allowEmpty;
  }
}

class Password {
  Password(this.password);

  String password;

  static bool validate(String password, {bool allowEmpty = true}) {
    if (password != '') {
      if (password.length >= 6) {
        return true;
      }
      return false;
    }
    return allowEmpty;
  }
}

class Username {
  Username(this.username);

  String username;

  static bool validate(String username, {bool allowEmpty = true}) {
    if (username != '') {
      if (username.length >= 3) {
        return true;
      }
      return false;
    }
    return allowEmpty;
  }
}

String capitalize(String str) {
  return str.toUpperCase().substring(0, 1) + str.toLowerCase().substring(1);
}

Map<String, dynamic> toMapWithStringKeys(Map<dynamic, dynamic> m) {
  final res = <String, dynamic>{};
  m.forEach((key, value) {
    res[key.toString()] = value;
  });

  return res;
}

Map<DateTime, double> parseDateTimeMap(Map<dynamic, dynamic> m) {
  final res = <DateTime, double>{};

  m.forEach((key, value) {
    res[DateTime.parse(key.toString())] = value as double;
  });

  return res;
}

List<BarChartGroupData> parseAndSortBarChartGroupData(
    Map<DateTime, double> map) {
  var res = map.entries
      .map(
        (e) => BarChartGroupData(
          x: e.key.day,
          barRods: [
            BarChartRodData(
              y: e.value,
              width: 40,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(5),
              ),
            ),
          ],
        ),
      )
      .toList()
    ..sort((a, b) => a.x.compareTo(b.x));

  return res;
}

Future<bool> onWillPop(
  DateTime currentBackPressTime,
  void Function() backPressUpdateCallBack,
  BuildContext context,
) {
  var now = DateTime.now();

  if (now.difference(currentBackPressTime) > const Duration(seconds: 2)) {
    backPressUpdateCallBack();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Press back again to exit'),
        duration: Duration(seconds: 1),
      ),
    );
    return Future.value(false);
  }
  SystemNavigator.pop();
  return Future.value(true);
}
