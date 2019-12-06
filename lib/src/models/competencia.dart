import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

@immutable
class Competencia {
  const Competencia(this.nombre, this.icon, this.id);

  final String nombre;
  final String icon;
  final String id;

  static Competencia fromSnapshot(DocumentSnapshot snap) {
    return Competencia(
      snap.data['name'],
      snap.data['icon'],
      snap.documentID
    );
  }
}