import 'package:bemoltest/model/model.dart';

class ProductModel implements Model {
  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final double rate;
  final int count;
  final bool? isFavorite;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rate,
    required this.count,
    this.isFavorite,
  });

  ProductModel.fromMap(Map<String, dynamic> map)
      : id = map['id'] is int ? map['id'] as int : 0,
        title = map['title'] is String ? map['title'] as String : '',
        price = map['price'] is double
            ? map['price'] as double
            : map['price'] is int
                ? double.parse(map['price'].toString())
                : 0.0,
        description =
            map['description'] is String ? map['description'] as String : '',
        category = map['category'] is String ? map['category'] as String : '',
        image = map['image'] is String ? map['image'] as String : '',
        rate = map['rating']['rate'] is double
            ? map['rating']['rate'] as double
            : map['rating']['rate'] is int
                ? double.parse(map['rating']['rate'].toString())
                : 0.0,
        count =
            map['rating']['count'] is int ? map['rating']['count'] as int : 0,
        isFavorite = map['isFavorite'] is bool ? map['isFavorite'] : null;

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'description': description,
      'category': category,
      'image': image,
      'rate': rate,
      'count': count,
      'isFavorite': isFavorite,
    };
  }

  @override
  String toString() {
    return 'ProductModel {id: $id, title: $title, price: $price, description: $description, category: $category, image: $image, rate: $rate, count: $count, isFavorite: $isFavorite}';
  }
}
