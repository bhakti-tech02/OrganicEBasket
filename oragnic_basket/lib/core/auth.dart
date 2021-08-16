import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:oragnic_basket/core/firebase_methods.dart';
import 'package:oragnic_basket/core/store.dart';
import 'package:oragnic_basket/screens/tabs_screen.dart';
import 'package:oragnic_basket/screens/welcome_screen.dart';

//instance of firebase authentication
final auth = FirebaseAuth.instance;


//synchronous prog - working line by line
//asynchronous prog: Future (async,await)

class Authentication
{
  //access methods without constructore so use static keyword. authentication.signup
  static Future<void> signup({BuildContext context,String name,String email,String password}) async
  {
    try{
      //set spinner to true
      ToggleLoading();
      print(email);
      print(password);
      UserCredential userCredential= await auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = userCredential.user;
      if(user != null)
      {
        //set spinner to false
        ToggleLoading();
        FirebaseMethods.saveUserToFirebase(uid : user.uid , name : name , email : email);
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Tabscreen()));
      }
      print(user);

    }catch(error){
      print(error);


      var errorMessage = 'Failed! Try again Later';
      if (error.toString().contains('ERROR_TOO_MANY_REQUESTS')) {
        errorMessage = 'Too many requests. Try again Later!';
      } else if (error.toString().contains('email address is already in use')) {
        errorMessage = 'User Already Registered';
      } else if (error
          .toString()
          .contains('Password should be at least 6 characters')) {
        errorMessage = 'Password too short';
      } else if (error.toString().contains('A network error')) {
        errorMessage = 'Network error';
      }

     // if(error.toString().contains('Password is too short')){
     //   errorMessage = 'Password is too short';
     // }
      ToggleLoading();
     Fluttertoast.showToast(
         msg: errorMessage,
         toastLength: Toast.LENGTH_SHORT,
         gravity: ToastGravity.BOTTOM,
         timeInSecForIosWeb: 1,
         backgroundColor: Colors.red,
         textColor: Colors.white,
         fontSize: 16.0
     );

    }
  }

 static Future<void> login({BuildContext context,String email, String password})  async
  {
    try{
      ToggleLoading();
      UserCredential userCredential  = await auth.signInWithEmailAndPassword(email: email, password: password);
                                  User user = userCredential.user ;

                                  if(user != null)
                                    {
                                      ToggleLoading();
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => Tabscreen()));

                                    }

      print(user);
    }
    catch(error)
    {
      print(error);

      var errorMessage = 'Failed! Try again Later';
      if (error.toString().contains('password is invalid')) {
        errorMessage = 'Opps! Wrong Password';
      } else if (error.toString().contains('ERROR_TOO_MANY_REQUESTS')) {
        errorMessage = 'Too many requests. Try again Later!';
      } else if (error.toString().contains('no user record corresponding')) {
        errorMessage = 'User not Registered';
      } else if (error.toString().contains('A network error')) {
        errorMessage = 'Network error';
      }

      ToggleLoading();

      Fluttertoast.showToast(
          msg: errorMessage,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
}
static Future<void> Signout() async
{
  await auth.signOut();
}




}