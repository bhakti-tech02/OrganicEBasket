import 'package:flutter/material.dart';
import 'package:oragnic_basket/screens/categories_screen.dart';
import './screens/login_screen.dart';
import './screens/signupu_screen.dart';
import './screens/tabs_screen.dart';
import './screens/welcome_screen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home:Tabscreen(),
     routes: {
       './categories_screen' : (ctx) => Categories(),
       './welcome_screen':(ctx) => WelcomeScreen(),
       './login_screen' : (ctx) =>LoginScreen(),
       './signup_screen' : (ctx) => SignupScreen(),
     }
     ,
   );
  }


}