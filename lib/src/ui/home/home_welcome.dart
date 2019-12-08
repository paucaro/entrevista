import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

class HomeWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipperOne(),
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            height: 220,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: width * 0.6,
                height: height * 0.25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(ASSETS_LOGO),
                    )),
              ),
            ),
            Row(
              children: <Widget>[
                Container(
                  width: width * 0.2,
                  child: Icon(
                    Icons.format_quote,
                    size: 60.0,
                    color: Colors.purple,
                  ),
                ),
                Container(
                  width: width * 0.8,
                  color: const Color.fromRGBO(255, 255, 255, 0.2),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      randomChoice<String>(LIST_FRASES_INTERVIEW),
                      style: TextStyle(
                          fontSize: 18.0,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Vollkorn',
                          color: Colors.black87),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: width * 0.45,
                    height: height * 0.3,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.local_library,
                            size: 100.0,
                            color: Colors.blue,
                          ),
                          Text(TEORIA_BUTTON,
                              style: TextStyle(
                                  fontSize: 16.0))
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: width * 0.45,
                    height: height * 0.3,
                    child: Card(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.border_color,
                            size: 100.0,
                            color: Colors.green,
                          ),
                          Text(
                            PRACTICA_BUTTON,
                            style: TextStyle(
                                fontSize: 16.0),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
