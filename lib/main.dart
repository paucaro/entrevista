import 'package:entrevista_ff/app.dart';
import 'package:entrevista_ff/src/bloc/simple_bloc_delegate.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}
