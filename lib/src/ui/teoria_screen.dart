import 'package:flutter/material.dart';

class TeoriaScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
    
  }
}
