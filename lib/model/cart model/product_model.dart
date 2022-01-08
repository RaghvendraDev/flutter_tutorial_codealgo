import 'dart:convert';

class ProductModel {
  final int id;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String size;
  final String image;
  ProductModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.size,
    required this.image,
  });

  ProductModel copyWith({
    int? id,
    String? name,
    String? desc,
    int? price,
    String? color,
    String? size,
    String? image,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      price: price ?? this.price,
      color: color ?? this.color,
      size: size ?? this.size,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'color': color,
      'size': size,
      'image': image,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      price: map['price']?.toInt() ?? 0,
      color: map['color'] ?? '',
      size: map['size'] ?? '',
      image: map['image'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, name: $name, desc: $desc, price: $price, color: $color, size: $size, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.name == name &&
        other.desc == desc &&
        other.price == price &&
        other.color == color &&
        other.size == size &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        desc.hashCode ^
        price.hashCode ^
        color.hashCode ^
        size.hashCode ^
        image.hashCode;
  }
}
