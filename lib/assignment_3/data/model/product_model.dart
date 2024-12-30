import 'package:hive/hive.dart';
part 'product_model.g.dart'; // The code generator will create this file

@HiveType(typeId: 0) // Type ID to identify the class
class Product {
  @HiveField(0) // This number should be unique within the class
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  double price;

  @HiveField(3)
  String description;

  @HiveField(4)
  String category;

  @HiveField(5)
  String image;

  @HiveField(6)
  double ratingRate;

  @HiveField(7)
  int ratingCount;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.ratingRate,
    required this.ratingCount,
  });

  // Factory method to create an instance of Product from a JSON object
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      ratingRate: json['rating']['rate'].toDouble(),
      ratingCount: json['rating']['count'],
    );
  }
}