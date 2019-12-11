import 'dart:math';
import 'package:entrevista_ff/src/repository/algorithm/btree.dart';
import 'package:entrevista_ff/src/repository/textmining/cosine_similarity.dart';
import 'package:entrevista_ff/src/repository/textmining/steem_es.dart';
import 'package:entrevista_ff/src/util/synonim.dart';
import 'package:entrevista_ff/src/util/synonim_words.dart';
import 'package:entrevista_ff/src/util/unnecesarty_words.dart';

class MiningText {
  const MiningText(this.respuesta, this.listRespuestas);

  final String respuesta;
  final List<String> listRespuestas;

  String miningText() {
    // Pre-processing steps
    final List<String> respuestaPreProcessed = getSignificantWords(respuesta);
    final List<List<String>> listRespuestasPreProcessed = [];
    for (var respuestaDB in listRespuestas.toList()) {
      listRespuestasPreProcessed.add(getSignificantWords(respuestaDB));
    }

    // TF-IDF
    final List<Map<String, double>> mapWeights = []; 
    // similar len listRespuestas
    for (var doc in listRespuestasPreProcessed) {
      final Map<String, double> weightByDoc = {};
      for (var term in respuestaPreProcessed) {
        final double value = tfIdf(doc, listRespuestasPreProcessed, term);
        weightByDoc[term] = (value != 0)? value: 0.0;
      }
      mapWeights.add(weightByDoc);
    }

    final Map<String, double> weightRespuesta = {};
    for (String item in respuestaPreProcessed) {
      final double value = tfIdf(respuestaPreProcessed, listRespuestasPreProcessed, item);
      weightRespuesta[item] = (value != 0.0)? value: 0.0;
    }

    // Similarity
    final CosineSimilarity cosineSimilarity = CosineSimilarity<String, double>();
    final Map<int, double> cosineEvaluation = {};
    int i = 0;
    for (Map<String,double> weightMapDoc in mapWeights) {
      // map doc
      cosineEvaluation[i] =
          cosineSimilarity.compare(weightMapDoc, weightRespuesta);
      i++;
    }

    // Get 1 more similarity
    int keyOfMax = 0;
    double maxValue = -1;
    for (var key in cosineEvaluation.keys) {
      if (cosineEvaluation[key] > maxValue) {
        maxValue = cosineEvaluation[key];
        keyOfMax = key;
      }
    }

    return listRespuestas[keyOfMax];
  }

  List<String> getSignificantWords(String text) {
    return stemming(filtering(caseFolding(text)));
  }

  ///Text Mining - Preprocesing steps
  /// * Case Folding: Convierte el texto en lowercase (minúsculas) y elimina caracteres extraños
  /// * Filtering: Elimina palabras innecesarias (stop words), reemplazar palabras por su sinonimo
  /// * Tokenizing: Produce palabras solas
  /// * Stemming: Cambia la palabra en una palabra base, removiendo prefjos, sufijos, afijos
  /// *           (Algoritmo de Porter)
  /// TD-IDF
  /// * Term Frequency(t,d)
  /// * Inverse Term Frequency(t,D)
  /// Similarity
  /// * CosineSimilarity
  /// * Knn = n

  String caseFolding(String text) {
    return removeAccent(text)
        .replaceAll(RegExp('[^a-zA-ZñÑ\\s]*'), '') // regex no words, ñ or space
        .replaceAll(RegExp('\\s+'), ' ') // regex space
        .toLowerCase();
  }

  // Do filtering and tokenizing
  List<String> filtering(String text) {
    final String pattern = convertListWordsToString(UNNECESSARY_WORDS);

    // Produce tokens
    final List<String> significantWords =
        text.replaceAll(RegExp('\\b(' + pattern + ')\\b'), '').split(' ');
    significantWords.removeWhere((item) => item == '');


    final SynonimWord synonimWord = SynonimWord();
    final BTree treeSynonims = synonimWord.sinonimos();
    
    for (int i = 0; i < significantWords.length; i++) {
      final Synonim coincidence = treeSynonims.searchKey(
          treeSynonims.root, Synonim(significantWords[i], ''));
      if (coincidence != null) {
        significantWords[i] = synonimGroup[coincidence.group];
      }
    }

    return significantWords;
  }

  List<String> stemming(List<String> token) {
    final SteemEs steemEs = SteemEs();
    final List<String> listBaseWords = [];
    for (String word in token) {
      listBaseWords.add(steemEs.stemm(word));
    }
    return listBaseWords;
  }

  /// Functions
  String removeAccent(String text) {
    return text
        .replaceAll('á', 'a')
        .replaceAll('é', 'e')
        .replaceAll('í', 'i')
        .replaceAll('ó', 'o')
        .replaceAll('ú', 'u');
  }

  String convertListWordsToString(List<String> words) {
    String output = '';
    for (String word in words) {
      output += word + '|';
    }
    return output.substring(0, output.length - 1);
  }

  bool equalsIgnoreCase(String a, String b) =>
      (a == null && b == null) ||
      (a != null && b != null && a.toLowerCase() == b.toLowerCase());

  double tf(List<String> doc, String term) {
    double result = 0;
    for (String word in doc) {
      if (equalsIgnoreCase(term, word)) {
        result++;
      }
    }
    return result / doc.length;
  }

  double idf(List<List<String>> docs, String term) {
    double n = 0;
    for (List<String> doc in docs) {
      for (String word in doc) {
        if (equalsIgnoreCase(term, word)) {
          n++;
          break;
        }
      }
    }
    if (n > 0) {
      return 1.0 + log(docs.length / n);
    } else {
      return 1.0;
    }
  }

  double tfIdf(List<String> doc, List<List<String>> docs, String term) {
      return tf(doc, term) * idf(docs, term);
  }
}
