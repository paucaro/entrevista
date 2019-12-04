class Synonim {
  Synonim(this.word, this.group) ;

  String word;  // word
  String group;    // id 'xx' where xx is main word

  bool operator >(Synonim other) {
    if (compareSynonimHigher(word, other.word) == 1) {
      return true;
    }
    return false;
  }

  bool operator <(Synonim other) {
    if (compareSynonimHigher(word, other.word) == -1) {
      return true;
    }
    return false;
  }

  @override
  bool operator ==(Object other) {
    return other is Synonim && compareSynonimHigher(word, other.word) == 0;
  }

  @override
  int get hashCode => word.hashCode;

  dynamic compareSynonimHigher(String s1, String s2) {
    if(s1 == s2) {
      return 0;
    }
    if (s1.isEmpty) {
      return -1;
    }
    if (s2.isEmpty) {
      return 1;
    }
    if (s1[0].isNotEmpty && s2[0].isNotEmpty && s1[0] == s2[0]) {
      return compareSynonimHigher(s1.substring(1, s1.length), s2.substring(1, s2.length));
    } else if (s1.codeUnitAt(0) > s2.codeUnitAt(0)) {
      return 1;
    } else if (s1.codeUnitAt(0) < s2.codeUnitAt(0)) {
      return -1;
    }
  }

  @override
  String toString() {
    return word + ' ' +group; 
  }

}
