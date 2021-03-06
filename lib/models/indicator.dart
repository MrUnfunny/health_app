import 'dart:convert';

import 'package:flutter/material.dart';

class Indicator {
  final String name;
  final IconData icon;
  final bool isShort;
  final bool isFilled;
  final Color color;
  final double shortData;
  final String unit;
  final double maxDailyValue;
  final Map<DateTime, double> data;

  Indicator({
    required this.name,
    required this.icon,
    required this.isShort,
    required this.color,
    required this.shortData,
    required this.data,
    required this.unit,
    required this.maxDailyValue,
    this.isFilled = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'icon': icon.codePoint,
      'isShort': isShort,
      'isFilled': isFilled,
      'color': color.value,
      'shortData': shortData,
      'unit': unit,
      'data': data,
      'maxDailyValue': maxDailyValue,
    };
  }

  factory Indicator.fromMap(Map<String, dynamic> map) {
    return Indicator(
      name: map['name'],
      icon: IconData(map['icon'], fontFamily: 'MaterialIcons'),
      isShort: map['isShort'],
      isFilled: map['isFilled'],
      color: Color(map['color']),
      shortData: map['shortData'],
      unit: map['unit'],
      maxDailyValue: map['maxDailyValue'],
      data: Map<DateTime, double>.from(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Indicator.fromJson(String source) =>
      Indicator.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Indicator(name: $name, icon: $icon, isShort: $isShort, isFilled: $isFilled, color: $color, shortData: $shortData, unit: $unit, data: $data)';
  }

  Indicator copyWith({
    String? name,
    IconData? icon,
    bool? isShort,
    bool? isFilled,
    Color? color,
    double? shortData,
    String? unit,
    double? maxDailyValue,
    Map<DateTime, double>? data,
  }) {
    return Indicator(
      name: name ?? this.name,
      icon: icon ?? this.icon,
      isShort: isShort ?? this.isShort,
      isFilled: isFilled ?? this.isFilled,
      color: color ?? this.color,
      shortData: shortData ?? this.shortData,
      unit: unit ?? this.unit,
      data: data ?? this.data,
      maxDailyValue: maxDailyValue ?? this.maxDailyValue,
    );
  }
}
