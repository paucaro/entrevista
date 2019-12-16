import 'package:equatable/equatable.dart';

abstract class PerfilState extends Equatable {
  const PerfilState();

  @override
  List<Object> get props => [];
}

// perfil loading
// perfil loaded
// perfil not loaded
class PerfilLoading extends PerfilState {
  @override
  String toString() => 'Loading perfil';
}

class PerfilLoaded extends PerfilState {
  const PerfilLoaded(this.level);

  final int level;

  @override
  List<Object> get props => [level];
  
  @override
  String toString() => 'Perfil loaded';
}

class PerfilNotLoaded extends PerfilState {
  @override
  String toString() => 'Perfil NotLoaded';
}