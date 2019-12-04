import 'package:entrevista_ff/src/bloc/register_bloc/bloc.dart';
import 'package:entrevista_ff/src/repository/user_repository.dart';
import 'package:entrevista_ff/src/repository/validators.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  final UserRepository _userRepository;

  @override
  RegisterState get initialState => RegisterState.empty();

  @override
  Stream<RegisterState> transformEvents(Stream<RegisterEvent> events,
      Stream<RegisterState> Function(RegisterEvent event) next) {
    final observableStream = events as Observable<RegisterEvent>;
    final nonDebounceStream = observableStream.where((event) {
      return event is! EmailChanged && event is! PasswordChanged;
    });
    final debounceStream = observableStream.where((event) {
      return event is EmailChanged || event is PasswordChanged;
    }).debounceTime(Duration(milliseconds: 300));

    return super
        .transformEvents(nonDebounceStream.mergeWith([debounceStream]), next);
  }

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is EmailChanged) {
      yield* _mapEmailChangedToState(event.email);
    } else if (event is PasswordChanged) {
      yield* _mapPasswordChangedToState(event.password);
    } else if (event is Submitted) {
      yield* _mapFormSubmittedToState(event.email, event.password);
    }
  }

  Stream<RegisterState> _mapEmailChangedToState(String email) async* {
    yield state.update(
      isEmailValid: Validators.isValidEmail(email),
    );
  }

  Stream<RegisterState> _mapPasswordChangedToState(String password) async* {
    yield state.update(
      isPasswordValid: Validators.isValidPassword(password),
    );
  }

  Stream<RegisterState> _mapFormSubmittedToState(
      String email, String password) async* {
    yield RegisterState.loading();
    try {
      await _userRepository.signUp(
        email: email,
        password: password,
      );
      yield RegisterState.success();
    } catch (_) {
      yield RegisterState.failure();
    }
  }
}
