import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:test_project/resources/resources.dart';

void main() {
  test('app_svgs assets test', () {
    expect(File(AppSvgs.band).existsSync(), true);
    expect(File(AppSvgs.favorites).existsSync(), true);
    expect(File(AppSvgs.map).existsSync(), true);
    expect(File(AppSvgs.profile).existsSync(), true);
  });
}
