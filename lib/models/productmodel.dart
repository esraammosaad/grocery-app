import 'package:flutter/material.dart';

class ProductModel {
  final String image;
  final Color backGroundColor;
  final String productName;
  final double price;
  final String weight;
  String ? status;
  ProductModel(
      {required this.image,
      required this.price,
      required this.weight,
      required this.backGroundColor,
      required this.productName,this.status});
}
