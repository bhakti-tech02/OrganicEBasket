import 'package:flutter/material.dart';

import '../constant.dart';

class Popularitem extends StatelessWidget
{

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return  Container(
      width: mq.width*0.4,
      height: mq.height*0.12,
      margin: EdgeInsets.only(right:15),

      decoration: BoxDecoration(
        color: kPrimaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10.0),
      ),
    );
  }
}