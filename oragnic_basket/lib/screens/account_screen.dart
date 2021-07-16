import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oragnic_basket/core/auth.dart';
import 'package:oragnic_basket/screens/welcome_screen.dart';


class AccountScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text('Sign Out'),
          onPressed: (){
            Authentication.Signout().whenComplete(() {
              Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => WelcomeScreen()), (route) => false);
            }) ;
          },
        ),
      ),
    );
  }
}