import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({Key key, VoidCallback onPressed})
    : _onPressed = onPressed,
    super(key: key);

  final VoidCallback _onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(NUMBER_THIRTY),
      ),
      textColor: Colors.white,
      color: Colors.orange,
      onPressed: _onPressed,
      child: Text(LOGIN_BUTTON),
    );
  }
}