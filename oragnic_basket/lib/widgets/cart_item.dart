import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oragnic_basket/core/store.dart';
import 'package:oragnic_basket/models/product_models.dart';

import '../constant.dart';

class CartItem extends StatelessWidget {
  final ProductModel productModel;

  CartItem({this.productModel});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      //    color: Colors.pink,
        margin: EdgeInsets.all(5),
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 100,
              width: 100,
              child: Image.network(
                  'https://www.freepngimg.com/thumb/strawberry/14-2-strawberry-png-images-thumb.png'),
            ),
            SizedBox(
              width: 20,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                Text(productModel.title, style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 21,),),
                SizedBox(
                  height: 4,
                ),
                Text('\$17.00/kg', style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: Colors.grey,)),
                SizedBox(
                  height: 8,
                ),
                Text('\$17.50/kg', style: TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 21,
                  color: kPrimaryColor,)),
              ],
            ),
            Spacer(),
            GestureDetector(onTap:(){RemoveProduct(productModel);}, child: Icon(Icons.delete,),),
            // Column(
            //   children: [
            //     Icon(Icons.add),
            //     Container(
            //       height: 30,
            //       width: 30,
            //       decoration: BoxDecoration(
            //         borderRadius:BorderRadius.circular(4),
            //         color:kPrimaryColor,
            //       ),
            //       child:Center(
            //         child: Text(
            //           '01',
            //           style: TextStyle(
            //             color:Colors.white,
            //             fontWeight: FontWeight.w900,
            //           ),
            //         ),
            //       ),
            //     ),
            //     Icon(CupertinoIcons.minus),
            //   ],
            // ),
          ],
        )
    );
  }
}