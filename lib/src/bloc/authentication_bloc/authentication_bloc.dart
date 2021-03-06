import 'dart:async';

import 'package:entrevista_ff/src/bloc/authentication_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({@required UserRepository userRepository})
    : assert(userRepository != null),
      _userRepository = userRepository;
  
  final UserRepository _userRepository;

  /// AuthenticationBloc is going to manage checking and
  /// updating a user's AuthenticationState in response to
  /// AuthenticationEvents (convert events into states)
  @override
  AuthenticationState get initialState => Uninitialized();

  @override
  Stream<AuthenticationState> mapEventToState(AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedToState();
    } else if (event is LoggedIn) {
      yield* _mapLoggedInToState();
    } else if (event is LoggedOut) {
      yield* _mapLoggedOutToState();
    }
  }

  Stream<AuthenticationState> _mapAppStartedToState() async* {
    try {
      final isSignedIn = await _userRepository.isSignedIn();
      if(isSignedIn) {
        final user = await _userRepository.getFirebaseUser();
        yield Authenticated(user);
      } else {
        yield Unauthenticated();
      }
    } catch (_) {
      yield Unauthenticated();
    }
  }

  Stream<AuthenticationState> _mapLoggedInToState() async* {
    yield Authenticated(await _userRepository.getFirebaseUser());
  }

  Stream<AuthenticationState> _mapLoggedOutToState() async* {
    yield Unauthenticated();
    _userRepository.signOut();
  }
}