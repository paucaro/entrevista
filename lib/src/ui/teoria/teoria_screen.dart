import 'package:entrevista_ff/src/repository/textmining/mining_text.dart';
import 'package:flutter/material.dart';

class TeoriaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
            child: Container(
              height: 200,
              width: 200,
              alignment: Alignment(0, 0),
              child: Text(
                "Page Teoria",
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              color: Colors.yellow,
            ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RaisedButton(
            child: Text('Holi Boli'),
            onPressed: () {
              MiningText('Trabajar es agobiante pero el estado es cool');
              
            },
          ),
        ),
      ],
    );
    
  }
}