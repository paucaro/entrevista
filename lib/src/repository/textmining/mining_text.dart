import 'package:entrevista_ff/src/repository/algorithm/btree.dart';
import 'package:entrevista_ff/src/repository/textmining/steem_es.dart';
import 'package:entrevista_ff/src/util/synonim.dart';
import 'package:entrevista_ff/src/util/synonim_words.dart';
import 'package:entrevista_ff/src/util/unnecesarty_words.dart';
import 'dart:math';

class MiningText {

  MiningText(String text) {
    String temp = caseFolding(text);
    List<String> filtered = filtering(temp);
    for(String word in filtered) {
      print('Word: ' + word + '\n');
    }
  }

  ///Text Mining - Preprocesing steps
  /// * Case Folding: Convierte el texto en lowercase (minúsculas) y elimina caracteres extraños
  /// * Filtering: Elimina palabras innecesarias, reemplazar palabras por su sinonimo
  /// * Tokenizing: Produce palabras solas
  /// * Stemming: Cambia la palabra en una palabra base, removiendo prefjos, sufijos, afijos
  /// *           (Algoritmo de Porter)
  /// TD-IDF
  /// * Term Frequency(t,d)
  /// * Inverse Term Frequency(t,D)
  /// Similarity
  /// * CosineSimilarity
  /// * Knn

  String caseFolding(String text) {
    return removeAccent(text).replaceAll("[^a-zA-ZñÑ\\s]*", '') // regex no words, ñ or space
            .replaceAll("\\s+", ' ') // regex space
            .toLowerCase();
  }

  List<String> filtering(String text) {
    String pattern = convertListWordsToString(UNNECESSARY_WORDS);
    List<String> significantWords = text.replaceAll('\\b(' + pattern + ')\\b', '').split(' ');
    SynonimWord synonimWord = SynonimWord();
    BTree treeSynonims = synonimWord.returnBTreeSynonim();
    for (int i = 0; i < significantWords.length; i++) {
      Synonim coincidence = treeSynonims.searchKey(treeSynonims.root, Synonim(significantWords[i],''));
      if ( coincidence != null) {
        significantWords[i] = synonimGroup[coincidence.group];
      }
    }
    return significantWords;
  }

  List<String> stemming(List<String> token) {
    SteemEs steemEs = SteemEs();
    List<String> listBaseWords = List();
    for (String word in token) {
      listBaseWords.add(steemEs.stemm(word));
    }
    return listBaseWords;
  }

  
  
  
  /// Functions 
  String removeAccent(String text) {
    return text.replaceAll('á', 'a')
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
      if (equalsIgnoreCase(term,word)) result++;
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
    return log(docs.length / n);
  }

  double tfIdf(List<String> doc, List<List<String>> docs, String term) {
    return tf(doc, term) * idf(docs, term);
  }
}