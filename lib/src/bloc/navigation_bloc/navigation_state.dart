enum NavigationEvent { eventTeoria, eventPractica, eventWelcome }

abstract class NavigationState {}

class StateTeoria extends NavigationState {}

class StatePractica extends NavigationState {}

class StateWelcome extends NavigationState {}