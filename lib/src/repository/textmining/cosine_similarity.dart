import 'dart:math'; 

class CosineSimilarity<T>{
  double compare(Map<T,T> a, Map<T,T> b) {
    if (a.isEmpty && b.isEmpty) return 1.0;
    if (a.isEmpty || b.isEmpty) return 0.0;
    // Larger set first for performance improvement.
    if (a.length >= b.length)  return determineSimilarity(a,b);
    else return determineSimilarity(b,a);
  }
  
  double determineSimilarity(Map<T,T> largeSet, Map<T,T> smallerSet) {
    double dotProduct = 0.0;
    double magnitudeA = 0.0;
    double magnitudeB = 0.0;
    
    Set<T> allItems = unionKeys(largeSet, smallerSet);
    
    allItems.forEach((item) {
      double aCount = (largeSet[item] != null) 
        ? largeSet[item] as double
        : 0.0;
      double bCount = (smallerSet[item] != null)
        ? smallerSet[item] as double
        : 0.0;
      dotProduct += aCount * bCount;
      magnitudeA += aCount * aCount;
      magnitudeB += bCount * bCount;
    });
    
    // a.b / (||a|| * ||b||)
    return (dotProduct / (sqrt(magnitudeA) * sqrt(magnitudeB)));
  }
  
  Set<T> unionKeys(Map<T,T> v1, Map<T,T> v2) {
    Set<T> items = Set();
    v1.forEach((k,v) => items.add(k));
    v2.forEach((k,v) { if (!v1.containsKey(k)) items.add(k); });
    return items;
  }
}