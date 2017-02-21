// Copyright (c) 2016, John Ryan. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library word_cooccurence;

/// Use a Coocurrence Matrix to look up coocurrence
class CoocurrenceCalculator {
  Map<String, Map<String, int>> _matrix = {};
  Map<String, int> _count = {};
  String contents;
  int k;

  CoocurrenceCalculator(this.contents, this.k) {
    _hydrateMatrix();
  }

  void _hydrateMatrix() {
    var words = contents.split(new RegExp(' |\n'));
    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      _addCount(word);
      for (var left in _leftWords(words, i, k)) {
        _add(word, left);
      }
      for (var right in _rightWords(words, i, k)) {
        _add(word, right);
      }
    }
  }

  void _add(String word, String cooccuringWord) {
    if (!_matrix.containsKey(word)) _matrix[word] = {};
    if (!_matrix[word].containsKey([cooccuringWord]))
      _matrix[word][cooccuringWord] = 0;
    _matrix[word][cooccuringWord]++;
  }

  void _addCount(String word) {
    if (!_count.containsKey(word)) _count[word] = 0;
    _count[word]++;
  }

  Iterable<String> _leftWords(List<String> words, i, k) sync* {
    while (i > 0 && i > i - k) {
      yield words[i--];
    }
  }

  Iterable<String> _rightWords(List<String> words, i, k) sync* {
    while (i < words.length && i < i + k) {
      yield words[i++];
    }
  }

  double coocurrenceProbability(String a, String b) {
    if (!_count.containsKey(a)) return 0.0;
    return coocurrence(a,b) / _count[a];
  }

  int coocurrence(String a, String b) {
    if (!_matrix.containsKey(a)) return 0;
    if (!_matrix[a].containsKey(b)) return 0;
    return _matrix[a][b];
  }
}
