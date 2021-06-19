import 'package:flutter/material.dart';
import '../constant.dart';

class WelcomeScreen extends StatelessWidget {
  Widget buildTitle() {
    return Container(
      child: Text(
        'The best\napp for\nfresh food',
        style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget buildButton(BuildContext context, Size mq, String text) {
    return SizedBox(
        height: mq.height * 0.07,
        width: mq.width * 0.8,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                elevation: 0,
                primary: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
            onPressed: () {
              if (text == 'Log In') {
                Navigator.of(context).pushReplacementNamed('./login_screen');
              } else {
                Navigator.of(context).pushReplacementNamed('./signup_screen');
              }
            },
            child: Text(text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ))));
  }

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: mq.height * 0.18,
            ),
            buildTitle(),
            // SizedBox(
            //   height: mq.height * 0.15,
            // ),
            Spacer(),
            buildButton(context, mq, 'Sign Up'),
            SizedBox(
              height: mq.height * 0.025,
            ),

            buildButton(context, mq, 'Log In'),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
