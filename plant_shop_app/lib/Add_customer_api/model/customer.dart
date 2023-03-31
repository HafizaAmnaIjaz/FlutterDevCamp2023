import 'dart:convert';

class Customer {
  final String? cat_name;
  final int? cat_id;
  final String? image;
  final int? count;
  Customer({
    this.cat_name,
    this.cat_id,
    this.image,
    this.count,
  });

  Customer copyWith({
    String? cat_name,
    int? cat_id,
    String? image,
    int? count,
  }) {
    return Customer(
      cat_name: cat_name ?? this.cat_name,
      cat_id: cat_id ?? this.cat_id,
      image: image ?? this.image,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'cat_name': cat_name,
      'cat_id': cat_id,
      'image': image,
      'count': count,
    };
  }

  factory Customer.fromMap(Map<String, dynamic> map) {
    return Customer(
      cat_name: map['cat_name'],
      cat_id: map['cat_id']?.toInt(),
      image: map['image'],
      count: map['count']?.toInt(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Customer.fromJson(String source) =>
      Customer.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Customer(cat_name: $cat_name, cat_id: $cat_id, image: $image, count: $count)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Customer &&
        other.cat_name == cat_name &&
        other.cat_id == cat_id &&
        other.image == image &&
        other.count == count;
  }

  @override
  int get hashCode {
    return cat_name.hashCode ^
        cat_id.hashCode ^
        image.hashCode ^
        count.hashCode;
  }
}
