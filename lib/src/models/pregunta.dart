import 'package:cloud_firestore/cloud_firestore.dart';

class Pregunta {
  const Pregunta(this.pregunta, this.id);

  final String pregunta;
  final String id;

  static Pregunta fromSnapshot(DocumentSnapshot snap){
    return Pregunta(
      snap.data['name'],
      snap.documentID
    );
  }
}