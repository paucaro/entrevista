import 'package:entrevista_ff/src/models/pregunta.dart';
import 'package:equatable/equatable.dart';

abstract class PreguntaDBState extends Equatable {
  const PreguntaDBState();
  
  @override
  List<Object> get props => [];
}

// preguntas db loading
// preguntas db loaded
// preguntas db not loaded
class PreguntaDBLoading extends PreguntaDBState {
  @override
  String toString() => 'Loading questions';
}

class PreguntaDBLoaded extends PreguntaDBState {
  const PreguntaDBLoaded([this.preguntas = const[]]);

  final List<Pregunta> preguntas;

  @override
  List<Object> get props => [preguntas];

  @override
  String toString() => 'QuestionsLoaded {preguntas: $preguntas}';
}

class PreguntaDBNotLoaded extends PreguntaDBState {
  @override
  String toString() => 'Questions Not Loaded';
}