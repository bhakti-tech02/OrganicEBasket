import 'package:flutter/material.dart';
import 'package:oragnic_basket/core/store.dart';
import 'package:oragnic_basket/models/product_models.dart';
import 'package:velocity_x/velocity_x.dart';

class Cart{
  List<ProductModel> allProductsInCart = [];
  int totalPrice = 0;
}

class AddProduct extends VxMutation<MyStore>
{
  final ProductModel product;
  AddProduct(this.product);
  @override
  perform() {
    store.cart.allProductsInCart.add(product);
    int sum = 0;
    store.cart.allProductsInCart.forEach((element) {
      sum = sum + element.itemPrice;
    });
    store.cart.totalPrice = sum;
  }
}

class RemoveProduct extends VxMutation<MyStore>
{
  final ProductModel product;
  RemoveProduct(this.product);
  @override
  perform() {
    store.cart.allProductsInCart.remove(product);
    int sum = 0;
    store.cart.allProductsInCart.forEach((element) {
      sum = sum + element.itemPrice;
    });
    store.cart.totalPrice = sum;
  }
}