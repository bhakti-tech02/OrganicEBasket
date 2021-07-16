import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oragnic_basket/screens/tabs_screen.dart';
import 'package:oragnic_basket/screens/welcome_screen.dart';

//instance of firebase authentication
final auth = FirebaseAuth.instance;


//synchronous prog - working line by line
//asynchronous prog: Future (async,await)

class Authentication
{
  //access methods without constructore so use static keyword. authentication.signup
  static Future<void> signup({BuildContext context,String email,String password}) async
  {
    try{
      UserCredential userCredential= await auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      if(user != null)
      {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Tabscreen()));
      }
      print(user);

    }catch(error){
      print(error);
    }
  }

 static Future<void> login({BuildContext context,String email, String password})  async
  {
    try{
      UserCredential userCredential  = await auth.signInWithEmailAndPassword(email: email, password: password);
                                  User user = userCredential.user ;

                                  if(user != null)
                                    {
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Tabscreen()));

                                    }

      print(user);
    }
    catch(error)
    {
      print(error);
    }
}
static Future<void> Signout() async
{
  await auth.signOut();
}




}