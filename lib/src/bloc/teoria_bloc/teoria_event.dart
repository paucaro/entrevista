import 'package:equatable/equatable.dart';

abstract class TeoriaEvent extends Equatable {
  const TeoriaEvent();

  @override
  List<Object> get props => [];
}

class LoadTeoria extends TeoriaEvent {}