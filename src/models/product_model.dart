import 'dart:convert';

class ProductModel {
  ProductModel({
    required this.id,
    required this.name,
    required this.tags,
  });

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
        id: map['id'] as int,
        name: map['name'] as String,
        tags: List<String>.from(
          map['tags'] as List<String>,
        ));
  }

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);

  final int id;
  final String name;
  final List<String> tags;

  ProductModel copyWith({
    int? id,
    String? name,
    List<String>? tags,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'tags': tags,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() => 'ProductModel(id: $id, name: $name, tags: $tags)';
}
