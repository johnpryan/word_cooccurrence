// Copyright (c) 2016, John Ryan. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:word_cooccurence/word_cooccurence.dart';
import 'package:test/test.dart';

void main() {
  group('word coocurrence', () {
    test('coocurrence', () {
      var input = 'a b c\nd';
      int k = 1;
      CoocurrenceCalculator calculator = new CoocurrenceCalculator(input, k);
      expect(calculator.coocurrence('a','b'), 1);
    });
    test('coocurrence probability', () {
      var input = 'a b c\nd';
      int k = 1;
      CoocurrenceCalculator calculator = new CoocurrenceCalculator(input, k);
      expect(calculator.coocurrenceProbability('a','b'), 1.0);
    });
  });
}
