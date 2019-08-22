import 'package:entrevista_ff/src/repository/user_repository.dart';
import 'package:entrevista_ff/src/ui/register/register_screen.dart';
import 'package:entrevista_ff/src/util/constants.dart';
import 'package:flutter/material.dart';

class CreateAccountButton extends StatelessWidget {
  final UserRepository _userRepository;

  const CreateAccountButton({Key key, @required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(CREATE_ACCOUNT),
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return RegisterScreen(userRepository: _userRepository);
        }));
      },
    );
  }
}
