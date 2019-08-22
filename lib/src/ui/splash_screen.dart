import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(color: Colors.orangeAccent),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: NUMBER_FIFTY,
                        child: Icon(
                          Icons.shopping_cart,
                          color: Colors.greenAccent,
                          size: NUMBER_FIFTY,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: NUMBER_TEN),
                      ),
                      Text(
                        SPLASH_SCREEN_WELCOME,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: NUMBER_TWENTY_FOUR,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Padding(
                      padding: EdgeInsets.only(top: NUMBER_TWENTY),
                    ),
                    Text(
                      SPLASH_SCREEN_PHRASE,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: NUMBER_EIGHTEEN,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
