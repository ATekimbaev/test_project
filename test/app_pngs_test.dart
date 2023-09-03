import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/resources/resources.dart';

void main() {
  test('app_pngs assets test', () {
    expect(File(AppPngs.profile).existsSync(), true);
  });
}
