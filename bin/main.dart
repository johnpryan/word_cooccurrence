import 'dart:io';
import 'package:word_cooccurence/word_cooccurence.dart';

main(List<String> args) async {
  var file = new File(args[0]);
  var k = int.parse(args[1]);
  var contents = await file.readAsString();
  var calculator = new CoocurrenceCalculator(contents, k);
  while(true) {
    String a = stdin.readLineSync();
    String b = stdin.readLineSync();
    print(calculator.coocurrenceProbability(a, b));
  }
}