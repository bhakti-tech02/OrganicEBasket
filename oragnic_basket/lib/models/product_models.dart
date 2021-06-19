import 'package:flutter/material.dart';

class Product
{
  final int id;
  final String title;
  final num itemPrice;
  final num perItemPrice;
  final String image;
  final List reviews;
  final String description;
  final bool isAvailable;

  Product({this.id,this.title,this.itemPrice,this.perItemPrice,this.image,this.reviews,this.description,this.isAvailable});

}