import 'package:entrevista_ff/src/ui/home/perfil.dart';
import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:dart_random_choice/dart_random_choice.dart';

class HomeWelcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    //final double height = MediaQuery.of(context).size.height;
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: WaveClipperOne(),
          child: Container(
            decoration: BoxDecoration(color: Theme.of(context).primaryColor),
            height: 220,
          ),
        ),
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              /*Padding(
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
              ),*/
              showPerfil(),
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
                    width: width * 0.75,
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
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.local_library,
                                size: 100.0,
                                color: Colors.blue,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(TEORIA_BUTTON,
                                  style: TextStyle(
                                      fontSize: 16.0)),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(APRENDE_FRASE)
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.border_color,
                                    size: 100.0,
                                    color: Colors.green,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    PRACTICA_BUTTON,
                                    style: TextStyle(
                                        fontSize: 16.0),
                                  ),
                                )
                              ],
                            ),
                            Expanded(
                            child: Text(PRACTICA_FRASE)
                          )
                          ],
                        ),
                      ),
                    ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget showPerfil() {
    return Perfil();
  }
}
