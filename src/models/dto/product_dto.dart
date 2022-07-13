import 'dart:convert';

class ProductDto {
  ProductDto({
    this.id,
    this.name,
    required this.tags,
  });

  factory ProductDto.fromMap(Map<String, dynamic> map) {
    return ProductDto(
        id: map['id'] != null ? map['id'] as int : null,
        name: map['name'] != null ? map['name'] as String : null,
        tags: List<String>.from(
          map['tags'] as List<dynamic>,
        ));
  }

  factory ProductDto.fromJson(String source) =>
      ProductDto.fromMap(json.decode(source) as Map<String, dynamic>);
  final int? id;
  final String? name;
  final List<String> tags;

  ProductDto copyWith({
    int? id,
    String? name,
    List<String>? tags,
  }) {
    return ProductDto(
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
  String toString() => 'ProductDto(id: $id, name: $name, tags: $tags)';
}
