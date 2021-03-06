import 'package:entrevista_ff/src/models/topic.dart';
import 'package:equatable/equatable.dart';

abstract class TeoriaState extends Equatable {
  const TeoriaState();

  @override
  List<Object> get props => [];
}

// teoria loading
// teoria loaded
// teoria not loaded
class TeoriaLoading extends TeoriaState {
  @override
  String toString() => 'Loading teoria';
}

class TeoriaLoaded extends TeoriaState {
  const TeoriaLoaded([this.topicos, this.progress]);

  final List<Topic> topicos;
  final Map<String, bool> progress;

  @override
  List<Object> get props => [topicos, progress];

  @override
  String toString() => 'Teoria Loaded';
}

class TeoriaNotLoaded extends TeoriaState {
  @override
  String toString() => 'Teoria Not Loaded';
}