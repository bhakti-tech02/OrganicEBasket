import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oragnic_basket/core/store.dart';
import 'package:oragnic_basket/screens/categories_screen.dart';
import 'package:velocity_x/velocity_x.dart';
import './screens/login_screen.dart';
import './screens/signupu_screen.dart';
import './screens/tabs_screen.dart';
import './screens/welcome_screen.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  runApp(VxState(store:MyStore(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirebaseAuth.instance.currentUser == null ? WelcomeScreen() : Tabscreen(),
      routes: {
        './categories_screen': (ctx) => Categories(),
        './welcome_screen': (ctx) => WelcomeScreen(),
        './login_screen': (ctx) => LoginScreen(),
        './signup_screen': (ctx) => SignupScreen(),
      },
    );
  }
}
