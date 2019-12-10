import 'package:equatable/equatable.dart';

abstract class GuiaDBState extends Equatable {
  const GuiaDBState();

  @override
  List<Object> get props => [];
}

// guia loading
// guia loaded
// guia notloading
class GuiaLoading extends GuiaDBState {
  @override
  String toString() => 'Loading guia';
}

class GuiaLoaded extends GuiaDBState {
  const GuiaLoaded([this.guia]);

  final String guia;

  @override
  List<Object> get props => [guia];

  @override
  String toString() => 'GuiaLoaded {guia: $guia}';
}

class GuiaNotLoaded extends GuiaDBState {
  @override
  String toString() => 'Guia not loaded';
}