import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  Widget buildSignupButton()
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Don\'t have an account? '),
        TextButton(
        onPressed: (){},
          child: Text('Sign up',style: TextStyle(decoration: TextDecoration.underline,color:Colors.black,fontSize: 15),),
        ),
      ],
    );
  }

  Widget buildLoginButton(Size mq) {
    return Center(
      child: SizedBox(
          height: mq.height * 0.07,
          width: mq.width * 0.8,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            child: Text('Login',style: TextStyle(fontSize: 25),),
          )),
    );
  }

  Widget buildLoginGoogleButton(Size mq) {
    return Center(
      child: SizedBox(
          height: mq.height * 0.07,
          width: mq.width * 0.8,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height:30 ,
                  width: 30,
                  child: Image.asset('assets/images/googlelogo.png'),
                ),
                Text('Login with Google',style: TextStyle(color:Colors.black,fontSize: 25),),
              ],
            ),
          )),
    );
  }


  Widget buildEmailField() {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        
        decoration: InputDecoration(
            hintText: 'Email',

            prefixIcon: Icon(Icons.email, color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black))
            // labelText: 'Name',
            //labelStyle: TextStyle(fontSize:k 24,fontWeight: FontWeight.bold),
            ),
      ),
    );
  }

  Widget buildPasswordField() {
    return Container(
      margin: EdgeInsets.all(20),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(

            hintText: 'Password',
            prefixIcon: Icon(Icons.vpn_key, color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: mq.height * 0.1,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Login  to your\naccount',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontSize: 25,
                  ),
                ),
              ),
              //Spacer(),
              SizedBox(
                height: mq.height * 0.1,
              ),
              buildEmailField(),
              buildPasswordField(),
              SizedBox(
                height: mq.height*0.09,
              ),
              buildLoginButton(mq),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(child: Text('or',style: TextStyle(fontSize: 18,color:Colors.grey,),)),
              ),
              buildLoginGoogleButton(mq),
              buildSignupButton(),
              // SizedBox(
              //   height: mq.height*0.04,
              // ),
            ],
          ),
        ));
  }
}
