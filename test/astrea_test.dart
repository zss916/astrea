import 'package:astrea/test/test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('isMatchName', () {
    bool isMatch = Test.isMatchName("dsfsdadsfsd");
    expect(isMatch, true);
  });
}
