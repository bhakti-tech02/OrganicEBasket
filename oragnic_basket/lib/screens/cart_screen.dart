import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oragnic_basket/constant.dart';
import 'package:oragnic_basket/core/store.dart';
import 'package:oragnic_basket/widgets/cart_item.dart';
import 'package:velocity_x/velocity_x.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyStore store = VxState.store;
    print('bc');
   // VxState.watch(context, on: [RemoveProduct]);

    final mq = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Cart',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: Column(
          children: [
            VxBuilder(
              mutations: {RemoveProduct},
              builder: (context,_,status)=>
               Container(
                height: mq.height * 0.6,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[100],
                ),
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: store.allProductsInCart.length == 0 ? Text('No products added!') : ListView.builder(
                      itemCount: store.allProductsInCart.length,
                      itemBuilder: (ctx, index) => CartItem(
                        productModel: store.allProductsInCart[index],
                      ),
                  ),
                ),
              ),
            ),
            Container(
                height: mq.height * 0.15,
                color: kPrimaryColor.withOpacity(0.2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    VxBuilder(
                      mutations: {AddProduct,RemoveProduct},
                      builder : (context,_,__) =>
                       Text(
                        'Total: ${store.totalPrice}',
                        style: TextStyle(fontSize: 21,fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                        onPressed: () {},
                        child: Text(
                          'Checkout >',
                          style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ))
          ],
        ));
  }
}
