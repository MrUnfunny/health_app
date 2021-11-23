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
  final Map<DateTime, double> data;

  Indicator({
    required this.name,
    required this.icon,
    required this.isShort,
    required this.color,
    required this.shortData,
    required this.data,
    required this.unit,
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
}
