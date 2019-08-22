import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';

class RegisterButton extends StatelessWidget {
  final VoidCallback _onPressed;

  RegisterButton({Key key, VoidCallback onPressed})
    : _onPressed = onPressed,
      super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(NUMBER_THIRTY),
      ),
      onPressed: _onPressed,
      child: Text(REGISTER_BUTTON),
    );
  }
}