import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:entrevista_ff/src/models/competencia.dart';
import 'package:entrevista_ff/src/models/pregunta.dart';

class DataBaseRespository {
  final competenciaCollection = Firestore.instance.collection('competencias');
  final preguntaCollection = Firestore.instance.collection('preguntas');
  final respuestaCollection = Firestore.instance.collection('respuestas');
  final guiaCollection = Firestore.instance.collection('guias');
  final competenciaPreguntasCollection =
      Firestore.instance.collection('competencias_preguntas');
  final preguntaGuiaCollection =
      Firestore.instance.collection('preguntas_guias');
  final preguntaRespuestaCollection = 
      Firestore.instance.collection('preguntas_respuestas');
  

  Stream<List<Competencia>> getCompetencias() {
    return competenciaCollection.snapshots().map((snapshot) {
      return snapshot.documents
          .map((doc) => Competencia.fromSnapshot(doc))
          .toList();
    });
  }

  Future<Map<String, bool>> getPreguntas(String idCompetencia) {
    return competenciaPreguntasCollection
        .document(idCompetencia)
        .get()
        .then((snapshot) {
      return snapshot.data.cast<String, bool>();
    });
  }

  Stream<Pregunta> getPreguntaById(String idPregunta) {
    return preguntaCollection.document(idPregunta).snapshots().map((snapshot) {
      return Pregunta.fromSnapshot(snapshot);
    });
  }

  Future<Map<String, bool>> getGuias(String idPregunta) {
    return preguntaGuiaCollection.document(idPregunta).get()
      .then((snapshot) {
        return snapshot.data.cast<String, bool>();
      });
  }

  Stream<String> getGuiaById(String idGuia) {
    return guiaCollection.document(idGuia).snapshots().map((snapshot) {
      return snapshot.data['name'];
    });
  }

  Future<Map<String, bool>> getRespuestas(String idPregunta) {
    return preguntaRespuestaCollection.document(idPregunta).get()
      .then((snapshot) {
        return snapshot.data.cast<String, bool>();
      });
  }

  Stream<String> getRespuestaById(String idRespuesta) {
    return guiaCollection.document(idRespuesta).snapshots().map((snapshot) {
      return snapshot.data['name'];
    });
  }

  Future<String> addNewRespuesta(String respuesta) async{
    final Map<String, String> mapi = {'name': respuesta};
    return await respuestaCollection.add(mapi).then(
        (doc) {
          return doc.documentID;
        }
      );
  }

  Future<void> addNewRespuestaToPregunta(String idPregunta, Map<String, bool> mapi) async{
    await preguntaRespuestaCollection.document(idPregunta).setData(mapi);
  }
}
