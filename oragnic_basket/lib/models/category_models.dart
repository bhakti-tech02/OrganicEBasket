import 'package:flutter/material.dart';
import 'package:oragnic_basket/models/product_models.dart';

class Category
{
  final int id;
  final String title;
  final String image;
  final List<ProductModel> productModels;

  Category({this.id,this.title,this.image,this.productModels});

}