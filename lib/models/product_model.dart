import 'package:flutter/cupertino.dart';

class ProductModel {
  final int id;
  final String title;
  final String price;
  final String description;
  final String image;
  final RatingModel? ratingModel;
  final String Category;

  ProductModel(
      {required this.Category,
      required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.image,
      required this.ratingModel});

  factory ProductModel.fromJson(i) {
    return ProductModel(
      id: i['id'],
      title: i['title'],
      price: i['price'].toString(),
      description: i['description'],
      image: i['image'],
      Category: i['category'],
      ratingModel: i['rating'] == null ? null : RatingModel.fromJson(i['rating']),
    );
  }
}

class RatingModel {
  final String rate;
  final String count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(i) {
    return RatingModel(rate: i['rate'].toString(), count: i['count'].toString());
  }
}
