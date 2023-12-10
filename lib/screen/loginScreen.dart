import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:memo_flutter_projects/constant/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.1),
              width: 150,
              height: 50,
              child: Image(
                image: AssetImage('lib/assets/image/Memo..png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 24, top: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 20,
                      fontFamily: 'NiraBold',
                      color: AppStyle.Colorwhite),
                ),
                Text(
                  'Login to your account now :)',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'NiraRegular',
                      color: AppStyle.accentcolor),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
