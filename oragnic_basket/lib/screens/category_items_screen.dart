import 'package:flutter/material.dart';
import 'package:oragnic_basket/models/product_models.dart';
import 'package:oragnic_basket/widgets/product.dart';
import '../constant.dart';

class CategoriesItemScreen extends StatelessWidget {
  final String title;
  final List<ProductModel> productModel;

  CategoriesItemScreen({this.title,this.productModel});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kPrimaryColor,
          elevation: 0,
          title: Text(title),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                  height: mq.height,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30),
                    ),
                    color: Colors.grey[100],
                  ),
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30),
                        ),
                        color: Colors.white,
                      ),
                      child: GridView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.6,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (ctx, index) => Product(productModel: productModel[index],),
                        itemCount: productModel.length,
                      ))),
            ],
          ),
        ));
  }
}
