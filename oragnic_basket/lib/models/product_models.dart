import 'package:flutter/material.dart';

class ProductModel
{
  final int id;
  final String title;
  final num itemPrice;
  final num perItemPrice;
  final String image;
  final List reviews;
  final String description;
  final bool isAvailable;

  ProductModel({this.id,this.title,this.itemPrice,this.perItemPrice,this.image,this.reviews,this.description,this.isAvailable});

}