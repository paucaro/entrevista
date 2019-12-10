import 'package:meta/meta.dart';

class RespuestasDBState {
  RespuestasDBState(
      {@required this.isRespuestaValid,
      @required this.isSubmitting,
      @required this.isSuccess,
      @required this.isFailure});

  factory RespuestasDBState.empty() {
    return RespuestasDBState(
        isRespuestaValid: true,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  factory RespuestasDBState.loading() {
    return RespuestasDBState(
        isRespuestaValid: true,
        isSubmitting: true,
        isSuccess: false,
        isFailure: false);
  }

  final bool isRespuestaValid;
  final bool isSubmitting;
  final bool isSuccess;
  final bool isFailure;

  bool get isFieldValid => isRespuestaValid;

  RespuestasDBState update({bool isRespuestaValid}) {
    return copyWith(
        isRespuestaValid: isRespuestaValid,
        isSubmitting: false,
        isSuccess: false,
        isFailure: false);
  }

  RespuestasDBState copyWith({
    bool isRespuestaValid,
    bool isSubmitting,
    bool isSuccess,
    bool isFailure,
  }) {
    return RespuestasDBState(
        isRespuestaValid: isRespuestaValid ?? this.isRespuestaValid,
        isSubmitting: isSubmitting ?? this.isSubmitting,
        isSuccess: isSuccess ?? this.isSuccess,
        isFailure: isFailure ?? this.isFailure);
  }

  @override
  String toString() {
    return '''RespuestaDBState {
      isRespuestaValid: $isRespuestaValid,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      isFailure: $isFailure,
      }''';
  }
}
