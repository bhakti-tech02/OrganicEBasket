import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:oragnic_basket/core/auth.dart';

class SignupScreen extends StatefulWidget {

  //key for saving textfields
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email;

  String _password;

  String _name;

  _save()
  {
    if(_formKey.currentState.validate())
      {
        //save the text fields and assign the value to the variable
        _formKey.currentState.save();
        Authentication.signup(context : context ,name: _name, email:_email , password:_password);

      }
  }

  Widget buildSignupButton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Already have an account? '),
        TextButton(
          onPressed: _save,
          child: Text(
            'Sign in',
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: Colors.black,
                fontSize: 15),
          ),
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
            onPressed: _save,
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40))),
            child: Text(
              'Sign up',
              style: TextStyle(fontSize: 25),
            ),
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
                  height: 30,
                  width: 30,
                  child: Image.asset('assets/images/googlelogo.png'),
                ),
                Text(
                  'Sign up with Google',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
              ],
            ),
          )),
    );
  }

  Widget buildNameField() {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Name',
            prefixIcon: Icon(Icons.person, color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black))
            // labelText: 'Name',
            //labelStyle: TextStyle(fontSize:k 24,fontWeight: FontWeight.bold),
            ),
        onSaved: (value){
          _name = value;
        },
        // ignore: missing_return
        validator: (_value){
          if(_value.isEmpty){
            return 'Please enter name';
          }
        },

      ),
    );
  }

  Widget buildEmailField() {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(Icons.email, color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black))
            // labelText: 'Name',
            //labelStyle: TextStyle(fontSize:k 24,fontWeight: FontWeight.bold),
            ),
        onSaved: (value){
          _email = value;
        },
        // ignore: missing_return
        validator: (_value){

          if(RegExp('^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+\$').hasMatch(_value)){
            return "Enter a valid email";
          }
        },
      ),
    );
  }

  Widget buildPasswordField() {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20,bottom: 20),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'Password',
            prefixIcon: Icon(Icons.vpn_key, color: Colors.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black))),
        onSaved: (value){
          _password = value ;
        },
        // ignore: missing_return
        validator: (value){
          if(value.isEmpty)
          {

            return('Password must not be empty!');
          }
          if(value.length < 6)
          {
            return ('Password too short!');
          }
        },
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
              'Create your\naccount',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, top: 5),
            child: Text(
              'Join Us!',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          //Spacer(),
          SizedBox(
            height: mq.height * 0.08,
          ),
          Form(
            key: _formKey,
            child:Column(
              children: [
                buildNameField(),
                buildEmailField(),
                buildPasswordField(),

              ],
            )
          ),
          SizedBox(
            height: mq.height * 0.06,
          ),
          buildLoginButton(mq),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              'or',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            )),
          ),
          buildLoginGoogleButton(mq),
          buildSignupButton(context),
          // SizedBox(
          //   height: mq.height*0.04,
          // ),
        ],
      ),
    ));
  }
}
