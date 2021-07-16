import 'package:flutter/material.dart';
import 'package:oragnic_basket/core/store.dart';
import 'package:oragnic_basket/models/product_models.dart';

import '../constant.dart';

class Product extends StatelessWidget
{
  final ProductModel productModel;

  Product({this.productModel});
  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context).size;
    return Container(
      height: mq.height * 0.2,

      decoration:
      BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey[100],),right: BorderSide(color: Colors.grey[100],), ),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: mq.height * 0.18,
            width: mq.width,
            child: Image.network(
              'https://www.freepngimg.com/thumb/strawberry/14-2-strawberry-png-images-thumb.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Text(
              productModel.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
          Text('\$ 17.00/kg',
              style: TextStyle(
                fontSize: 16,
                color:Colors.grey,
              )),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$ 17.20/kg',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                    color: kPrimaryColor,
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    AddProduct(productModel);
                  },
                  child: Container(
                    height: 50,
                    width: 45,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                      ),

                    ),
                    child:Center(child: Icon(Icons.shopping_cart_outlined,color:Colors.white,)),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}