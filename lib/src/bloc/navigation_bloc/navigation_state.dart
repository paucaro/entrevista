enum NavigationEvent { eventTeoria, eventPractica }

abstract class NavigationState {}

class StateTeoria extends NavigationState {}

class StatePractica extends NavigationState {}