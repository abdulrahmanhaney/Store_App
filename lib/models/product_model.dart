import 'package:store_app/models/rating_model.dart';

class ProductModel {
  final dynamic id;
  final String title;
  final dynamic price;
  final String description;
  final String image;
  final String category;
  final RatingModel? rating;

  ProductModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.price,
      required this.image,
      required this.rating,
      required this.category});

  factory ProductModel.fromJson(jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      description: jsonData['description'],
      price: jsonData['price'],
      image: jsonData['image'],
      category: jsonData['category'],
      rating: jsonData['rating'] == null
          ? null
          : RatingModel.fromJson(jsonData['rating']),
    );
  }
}
