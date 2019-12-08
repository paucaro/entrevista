import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entrevista_ff/src/models/competencia.dart';
import 'package:entrevista_ff/src/models/pregunta.dart';

class DataBaseRespository {
  final competenciaCollection = Firestore.instance.collection('competencias');
  final preguntaCollection = Firestore.instance.collection('preguntas');
  final competenciaPreguntasCollection =
      Firestore.instance.collection('competencias_preguntas');

  Stream<List<Competencia>> getCompetencias() {
    return competenciaCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Competencia.fromSnapshot(doc))
          .toList();
    });
  }

  Future<Map<String, bool>> getPreguntas(String idCompetencia) {
    return competenciaPreguntasCollection
        .document(idCompetencia).get().then(
          (snapshot) {
            return snapshot.data.cast<String, bool>();
          }
        );
  }

  Stream<Pregunta> getPreguntaById(String idPregunta) {
    return preguntaCollection.document(idPregunta).snapshots().map((snapshot) {
      return Pregunta.fromSnapshot(snapshot);
    });
  }
}
