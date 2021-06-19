import 'package:flutter/material.dart';
import 'package:oragnic_basket/models/category_models.dart';
import 'package:oragnic_basket/widgets/offers.dart';
import 'package:oragnic_basket/widgets/popular_items.dart';
import '../widgets/category_item.dart';

class Data{
//static use kare to class no obj nai banavo pade, classname thi j access thai
//ek  var data memory ma ave n change naithai , prog complie thai tyare j ave
  static final categories = [
    Category(id:1,title: 'Vegetables',image:''),
  Category(id:2,title: 'Fruits',image:''),
  Category(id:3,title: 'Milk & Egg',image:''),
  Category(id:4,title: 'Meat',image:''),
  Category(id:5,title: 'Fish',image:''),
  Category(id:6,title: 'Drinks',image:''),
  Category(id:7,title: 'Sea Food',image:''),
  Category(id:8,title: 'Cake',image:''),
  Category(id:9,title: 'Bakery',image:''),
  Category(id:10,title: 'Buiscuits',image:''),
  Category(id:11,title: 'Ice cream',image:''),
  Category(id:12,title: 'Juice',image:''),
  Category(id:13,title: 'Dairy',image:''),

  //   CategoryItem(title: 'Vegetables',),
  //   CategoryItem(title: 'Fruits',),
  //   CategoryItem(title: 'Meat',),
  //   CategoryItem(title: 'Milk & Egg',),
  //   CategoryItem(title: 'Fish',),
  //   CategoryItem(title: 'Drinks',),
  //   CategoryItem(title: 'Sea-Food',),
  //   CategoryItem(title: 'Cake',),
  //   CategoryItem(title: 'Bakery',),
  //   CategoryItem(title: 'Biscuits',),
  //   CategoryItem(title: 'IceCream',),
  //   CategoryItem(title: 'Juice',),
  //   CategoryItem(title: 'Dairy',),
  // ];
  ];
  static  final offers = [
    Offer(),
    Offer(),
    Offer(),
    Offer(),
    Offer(),

  ];
  static final popularDeals = [
  Popularitem(),
  Popularitem(),
  Popularitem(),
  Popularitem(),
  Popularitem(),
];
}
