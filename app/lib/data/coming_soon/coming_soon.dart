import 'dart:convert';

class ComingSoon {
  final String name;
  final String logo;
  final String releaseDate;

  const ComingSoon(this.name, this.logo, this.releaseDate);

  ComingSoon copyWith({ String? name, String? logo, String? releaseDate }) => ComingSoon(name ?? this.name, logo ?? this.logo, releaseDate ?? this.releaseDate);

  Map<String, dynamic> toMap() => { 'name': name, 'logo': logo, 'releaseDate': releaseDate };

  factory ComingSoon.fromMap(Map<String, dynamic> map) => ComingSoon(map['name'], map['logo'], map['releaseDate']);

  String toJson() => json.encode(toMap());

  factory ComingSoon.fromJson(String source) => ComingSoon.fromMap(json.decode(source));

  @override
  String toString() => 'CommingSoon(name: $name, logo: $logo, releaseDate: $releaseDate)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ComingSoon && other.name == name && other.logo == logo && other.releaseDate == releaseDate;
  }

  @override
  int get hashCode => name.hashCode ^ logo.hashCode ^ releaseDate.hashCode;
}