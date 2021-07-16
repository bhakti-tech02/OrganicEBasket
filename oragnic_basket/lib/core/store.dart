import 'package:oragnic_basket/models/product_models.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  List<ProductModel> allProductsInCart = [];
int totalPrice = 0;
}

class AddProduct extends VxMutation<MyStore>
{
  final ProductModel product;
  AddProduct(this.product);
  @override
  perform() {
   store.allProductsInCart.add(product);
   int sum = 0;
   store.allProductsInCart.forEach((element) {
     sum = sum + element.itemPrice;
   });
   store.totalPrice = sum;
  }
}

class RemoveProduct extends VxMutation<MyStore>
{
  final ProductModel product;
  RemoveProduct(this.product);
  @override
  perform() {
    store.allProductsInCart.remove(product);
    int sum = 0;
    store.allProductsInCart.forEach((element) {
      sum = sum + element.itemPrice;
    });
    store.totalPrice = sum;
  }
}