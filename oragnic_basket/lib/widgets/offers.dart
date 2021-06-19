import 'package:flutter/material.dart';

import '../constant.dart';

class Offer extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
   return  Container(
     width: mq.width*0.70,

     margin: EdgeInsets.only(right:12),

     decoration: BoxDecoration(
       color: kPrimaryColor.withOpacity(0.2),
       borderRadius: BorderRadius.circular(17.0),
     ),
   );
  }
}