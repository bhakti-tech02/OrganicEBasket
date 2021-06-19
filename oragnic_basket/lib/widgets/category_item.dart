import 'package:flutter/material.dart';
import 'package:oragnic_basket/screens/category_items_screen.dart';

import '../constant.dart';

class CategoryItem extends StatelessWidget {
  final String title;

  CategoryItem({this.title});

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => CategoriesItemScreen(title: title,)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: mq.width * 0.24,
              height: mq.height * 0.12,
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Text(
                title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
