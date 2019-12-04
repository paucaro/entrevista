class SteemEs {

  ///ARRAYS
  static const List<String> PRONOUN_SUF = [
          'me', 'se', 'sela', 'selo', 'selas', 'selos', 'la', 'le', 'lo',
          'las', 'les', 'los', 'nos'
  ];

  static const List<String> PRONOUN_SUF_PRE = [
          'endo', 'ando', 'iendo', 'ar', 'er', 'ir'
  ];

  static const List<String> SUFIJO_ARRAY_GROUP = [
          'anza', 'anzas', 'ico', 'ica', 'icos', 'icas', 'ismo', 'ismos',
          'able', 'ables', 'ible', 'ibles', 'ista', 'istas', 'oso', 'osa',
          'osos', 'osas', 'amiento', 'amientos', 'imiento', 'imientos',
          'icadora', 'icador', 'icacion', 'icadoras', 'icadores',
          'icaciones', 'icante', 'icantes', 'icancia', 'icancias',
          'adora', 'ador', 'acion', 'adoras', 'adores', 'aciones',
          'ante', 'antes', 'ancia', 'ancias',
          'ativamente', 'ivamente', 'osamente', 'icamente', 'adamente',
          'antemente', 'ablemente', 'iblemente', 'mente',
          'abilidad', 'abilidades', 'icidad', 'icidades', 'ividad',
          'ividades', 'idad', 'idades',
          'ativa', 'ativo', 'ativas', 'ativos', 'iva', 'ivo', 'ivas', 'ivos'
  ];

  static const List<String> SUFIJO_ARRAY_LOGIA = [ 'logia', 'logias' ];

  static const List<String> SUFIJO_ARRAY_UCION = [ 'ucion', 'uciones' ];

  static const List<String> SUFIJO_ARRAY_ENCIA = [ 'encia', 'encias' ];

  static const List<String> SUFIJO_ARRAY_AMENTE = [ 'amente' ];

  static const List<String> SUFIJO_ARRAY_GROUP_Y = [
          'ya', 'ye', 'yan', 'yen', 'yeron', 'yendo', 'yo', 'yas',
          'yes', 'yais', 'yamos'
  ];

  static const List<String> SUFIJO_ARRAY_E = [
          'en', 'es', 'eis', 'emos'
  ];

  static const List<String> SUFIJO_ARRAY_TERMINACIONES = [
          'arian', 'arias', 'aran', 'aras', 'ariais', 'aria',
          'areis', 'ariamos', 'aremos', 'ara', 'are', 'erian',
          'erias', 'eran', 'eras', 'eriais', 'eria', 'ereis',
          'eriamos', 'eremos', 'era', 'ere', 'irian', 'irias',
          'iran', 'iras', 'iriais', 'iria', 'ireis', 'iriamos',
          'iremos', 'ira', 'ire', 'aba', 'ada', 'ida', 'ia', 'ara',
          'iera', 'ad', 'ed', 'id', 'ase', 'iese', 'aste', 'iste',
          'an', 'aban', 'ian', 'aran', 'ieran', 'asen', 'iesen',
          'aron', 'ieron', 'ado', 'ido', 'ando', 'iendo', 'io',
          'ar', 'er', 'ir', 'as', 'abas', 'adas', 'idas', 'ias',
          'aras', 'ieras', 'ases', 'ieses', 'is', 'ais', 'abais',
          'iais', 'arais', 'ierais', 'aseis', 'ieseis', 'asteis',
          'isteis', 'ados', 'idos', 'amos', 'abamos', 'iamos',
          'imos', 'aramos', 'ieramos', 'iesemos', 'asemos'
  ];

  static const List<String> SUFIJO_ARRAY_TERMINACIONES_VOCAL= [ 'os', 'a', 'o', 'i'];

  bool isVowel(String c) {
    return c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u';
  }

  int getNextVowelPos(String word, int start) {
    final int len = strlen(word);
    for (int i = start; i < len; i++) {
      if (isVowel(word[i])) {
        return i;
      }
    }
    return len;
  }

  int getNextConsonantPos(String word, int start) {
    final int len = strlen(word);
    for (int i = start; i < len; i++) {
      if (!isVowel(word[i])) {
        return i;
      }
    }
    return len;
  }

  bool endsin(String word, String suffix) {
    final int lenWord = strlen(word), lenSuffix = strlen(suffix);
    if (lenWord < lenSuffix) {
      return false;
    }
    return substr(word, -strlen(suffix)) == suffix;
  }

  String endSinArr(String word, List<String> suffixes) {
    for (String suff in suffixes) {
      if (endsin(word, suff)) {
        return suff;
      }
    }
    return '';
  }

  int strlen(String word) {
    return word.length;
  }

  String substr(String word, int i) {
    if (i.abs() > word.length) {
      return word;
    } else if (i >= 0) {
      return word.substring(i, word.length);
    } else {
      return word.substring(word.length + i, word.length);
    }
  }

  String substrg(String word, int start, int lenght){
    if (start == lenght) {
      return '';
    } else {
        if (start >= 0) {
            if (lenght >= 0) { // longitud positiva
                final int endIndex = start + lenght;
                if (endIndex > word.length) {
                  return word.substring(start, word.length);
                } else {
                  return word.substring(start, endIndex);
                }
            } else { // longitud negativa
                final int endIndex = word.length + lenght;

                try{
                    word = word.substring(start, endIndex);
                }catch (StringIndexOutOfBoundsException){
                    word = '';
                }

                return word;
            }
        }
        else {
            if (lenght >= 0){ // longitud positiva
                final int inicio = word.length + start;
                final int endIndex = inicio + lenght;

                if (endIndex > word.length) {
                  return word.substring(inicio, word.length);
                } else {
                  return word.substring(inicio, endIndex);
                }
            } else { // longitud negativa
                final int inicio = word.length + start;
                final int endIndex = word.length + lenght;

                try{
                    word = word.substring(inicio, endIndex);
                } catch (StringIndexOutOfBoundsException){
                    word = '';
                }
                return word;
            }
        }
    }
  }

  /// -------------------------------------------------

  String stemm(String word) {
    final int len = strlen(word);
    if (len <= 2) {
      return word;
    }

    int r1, r2, rv;
    r1 = r2 = rv = len;

    // R1 es la region despues de la primera no-vocal seguido de una vocal, o
    // la region nula al final de la palabra si no hay tal no-vocal
    for (int i = 0; i < (len - 1) && r1 == len; i++) {
      if (isVowel(word[i]) && !isVowel(word[i+1])) {
        r1 = i + 2;
      }
    }

    // R2 es la region despues de la primera no-vocal seguido de una vocal en R1,
    // o la región nula al final de la palabra si no hay tal no-vocal
    for (int i = r1; i < (len - 1) && r2 == len; i++){
        if (isVowel(word[i]) && !isVowel(word[i+1])){
            r2 = i + 2;
        }
    }

    if (len > 3){
        if (!isVowel(word[1])){
            // Si la segunda letra es una consonante, RV  es la region después de
            // la siguiente vocal.
            // Ejemplo: avispa [segunda letra: v, siguiente vocal: i, rv: s]
            rv = getNextVowelPos(word, 2) + 1;
        } else if (isVowel(word[0]) && isVowel(word[1])){
            // Si las primeras dos letras son vocales, RV es la region despues de
            // la siguiente consonante.
            // Ejemplo: aerodinamica [primeras letras: ae, siguiente consonante: r]
            rv = getNextConsonantPos(word, 2) + 1;
        } else {
            // Otros casos (caso consonante-vocal), el caso más popular. RV es la region
            // despues de la tercera letra. Pero RV es el final de la letra si no se
            // encuentran esas posiciones
            rv = 3;
        }
    }

    String r1Txt = substr(word, r1);
    String r2Txt = substr(word, r2);
    String rvTxt = substr(word, rv);

    final String wordOrig = word;

    // Paso 0: Pronombre adjunto
    const List<String> pronounSuf = PRONOUN_SUF;
    const List<String> pronounSufPre = PRONOUN_SUF_PRE;
    String suf = endSinArr(word, pronounSuf);

    if(suf != ''){ // Existe sufijo
        final String preSuff = endSinArr(substrg(rvTxt, 0, -strlen(suf)), pronounSufPre);
        if (preSuff != '' || (endsin(word, 'yendo') && // Existe presufijo
                (substrg(word,-strlen(suf) - 6, 1) == 'u'))){
            word = substrg(word, 0, -strlen(suf));
        }
    }

    if (word != wordOrig){ // La palabra tenia sufijo
        r1Txt = substr(word, r1);
        r2Txt = substr(word, r2);
        rvTxt = substr(word, rv);
    }
    final String wordAfter0 = word;

    if ((suf = endSinArr(r2Txt, SUFIJO_ARRAY_GROUP)) != ''){
        word = substrg(word, 0, -strlen(suf));
    } else if ((suf = endSinArr(r1Txt, SUFIJO_ARRAY_AMENTE)) != ''){
        word = substrg(word, 0, -strlen(suf));
    } else if ((suf = endSinArr(r2Txt, SUFIJO_ARRAY_LOGIA)) != ''){
        word = substrg(word, 0, -strlen(suf)) + 'log';
    } else if ((suf = endSinArr(r2Txt, SUFIJO_ARRAY_UCION)) != ''){
        word = substrg(word, 0, -strlen(suf)) + 'u';
    } else if ((suf = endSinArr(r2Txt, SUFIJO_ARRAY_ENCIA)) != ''){
        word = substrg(word, 0, -strlen(suf)) + 'ente';
    }

    if (word != wordAfter0){
        r1Txt = substr(word, r1);
        r2Txt = substr(word, r2);
        rvTxt = substr(word, rv);
    }
    final String wordAfter1 = word;

    if (wordAfter0 == wordAfter1){
        // Hacer el paso 2a si ninguna terminación ha sido removida en el paso 1
        if ( (suf = endSinArr(rvTxt, SUFIJO_ARRAY_GROUP_Y)) != ''
            && !(substrg(word, -strlen(suf) - 1, 1) != 'u')){
            word = substrg(word, 0, -strlen(suf));
        }

        if (word != wordAfter1){
            r1Txt = substr(word, r1);
            r2Txt = substr(word, r2);
            rvTxt = substr(word, rv);
        }
        final String wordAfter2a = word;

        // Hacer el paso 2b si el paso 2a fue hecho, pero fallo eliminar un sufijo
        if (wordAfter2a == wordAfter1) {
            if ((suf = endSinArr(rvTxt, SUFIJO_ARRAY_E)) != '') {
                word = substrg(word, 0, -strlen(suf));
                if (endsin(word, 'gu')) {
                    substrg(word, 0, -1);
                }
            } else if ((suf = endSinArr(rvTxt, SUFIJO_ARRAY_TERMINACIONES)) != ''){
                word = substrg(word, 0, -strlen(suf));
            }
        }
    }

    // Siempre hacer el paso 3
    r1Txt = substr(word, r1);
    r2Txt = substr(word, r2);
    rvTxt = substr(word, rv);

    if((suf = endSinArr(rvTxt, SUFIJO_ARRAY_TERMINACIONES_VOCAL)) != ''){
        word = substrg(word, 0, -strlen(suf));
    } else if ((suf = endSinArr(rvTxt, ['e'])) != ''){
        word = substrg(word, 0, -1);
        rvTxt = substr(word, rv);
        if (endsin(rvTxt, 'u') && endsin(word, 'gu')){
            word = substrg(word, 0, -1);
        }
    }
    return word;

  }
}