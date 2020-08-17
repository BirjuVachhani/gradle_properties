import 'dart:io';

import 'package:gradle_properties/gradle_properties.dart';
import 'package:test/test.dart';

void main() {
  group('read from file test', () {
    final testDataFile = File(Platform.isWindows
        ? 'test\test_data.properties'
        : 'test/test_data.properties');
    final testFile = File('test.properties');
    setUp(() async {
      final sink = testFile.openWrite();
      await sink.addStream(testDataFile.openRead());
      return sink.close();
    });

    test('load from file test', () async {
      final properties = await GradleProperties.fromFile(testFile);
      expect(properties['first_name'], 'Birju');
      expect(properties['last_name'], 'Vachhani');
      expect(properties['email'], 'brvachhani@gmail.com');
      expect(properties['age'], '24');
    });

    test('load from file path test', () async {
      final properties = await GradleProperties.fromPath(testFile.path);
      expect(properties['first_name'], 'Birju');
      expect(properties['last_name'], 'Vachhani');
      expect(properties['email'], 'brvachhani@gmail.com');
      expect(properties['age'], '24');
    });

    test('save method test', () async {
      final properties = await GradleProperties.fromPath(testFile.path);
      expect(properties['first_name'], 'Birju');
      properties['email'] = 'test@example.com';
      expect(properties['email'], 'test@example.com');
      await properties.save();
      final newProperties = await GradleProperties.fromPath(testFile.path);
      expect(newProperties['email'], 'test@example.com');
    });

    test('readProperties extension test', () async {
      final properties = await testFile.readProperties();
      expect(properties['first_name'], 'Birju');
      expect(properties['last_name'], 'Vachhani');
      expect(properties['email'], 'brvachhani@gmail.com');
      expect(properties['age'], '24');
    });

    test('contains method test', () async {
      final properties = await testFile.readProperties();
      expect(properties.contains('first_name'), true);
      expect(properties.contains('abcd'), false);
    });

    tearDown(testFile.deleteSync);
  });
}
