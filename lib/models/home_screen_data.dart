import 'dart:convert';

import 'package:equatable/equatable.dart';

class HomeScreenData extends Equatable {
  final double steps;
  final double water;
  final double calories;
  final double sleep;
  final double heart;

  const HomeScreenData(
    this.steps,
    this.water,
    this.calories,
    this.sleep,
    this.heart,
  );

  factory HomeScreenData.zero() {
    return const HomeScreenData(0, 0, 0, 0, 0);
  }

  Map<String, dynamic> toMap() {
    return {
      'steps': steps.toString(),
      'water': water.toString(),
      'calories': calories.toString(),
      'sleep': sleep.toString(),
      'heart': heart.toString(),
    };
  }

  factory HomeScreenData.fromMap(Map<String, dynamic> map) {
    return HomeScreenData(
      map['steps'],
      map['water'],
      map['calories'],
      map['sleep'],
      map['heart'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeScreenData.fromJson(String source) =>
      HomeScreenData.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HomeScreenData(steps: $steps, water: $water, calories: $calories, sleep: $sleep, heart: $heart)';
  }

  @override
  List<Object?> get props => [steps, water, calories, sleep, heart];
}
