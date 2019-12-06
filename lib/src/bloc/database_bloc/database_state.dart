import 'package:entrevista_ff/src/models/competencia.dart';
import 'package:equatable/equatable.dart';

abstract class DatabaseState extends Equatable {
  const DatabaseState();

  @override
  List<Object> get props => [];
}

// database loading
// database loaded
// database notLoaded
class DatabaseLoading extends DatabaseState {
  @override
  String toString() => 'Loading';
}

class DatabaseLoaded extends DatabaseState {
  const DatabaseLoaded([this.competencias = const []]);

  final List<Competencia> competencias;

  @override
  List<Object> get props => [competencias];

  @override
  String toString() => 'CompetenciasLoaded { competencias: $competencias}';
}

class DatabaseNotLoaded extends DatabaseState {
  @override
  String toString() => 'Not Loaded';
}