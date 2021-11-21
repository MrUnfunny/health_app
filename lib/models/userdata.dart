import 'dart:convert';

class UserData {
  final String name;
  final double weight;
  final double height;

  UserData(
    this.name,
    this.weight,
    this.height,
  );

  @override
  String toString() {
    return 'UserData(name: $name, weight: $weight, height: $height)';
  }

  UserData copyWith({
    String? name,
    double? weight,
    double? height,
  }) {
    return UserData(
      name ?? this.name,
      weight ?? this.weight,
      height ?? this.height,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'weight': weight,
      'height': height,
    };
  }

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
      map['name'],
      map['weight'],
      map['height'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserData.fromJson(String source) =>
      UserData.fromMap(json.decode(source));
}
