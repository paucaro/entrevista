import 'package:entrevista_ff/src/bloc/navigation_bloc/bloc.dart';
import 'package:bloc/bloc.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  
  @override
  NavigationState get initialState => StateWelcome();

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    switch (event) {
      case NavigationEvent.eventWelcome:
        yield StateWelcome();
        break;
      case NavigationEvent.eventTeoria:
        yield StateTeoria();
        break;
      case NavigationEvent.eventPractica:
        yield StatePractica();
        break;
    }
  }

}