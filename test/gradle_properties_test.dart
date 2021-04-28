import 'dart:io';

import 'package:gradle_properties/gradle_properties.dart';
import 'package:test/test.dart';

void main() {
  group('library test', () {
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
      expect(properties?['first_name'], 'Birju');
      expect(properties?['last_name'], 'Vachhani');
      expect(properties?['email'], 'brvachhani@gmail.com');
      expect(properties?['age'], '24');
    });

    test('load from file path test', () async {
      final properties = await GradleProperties.fromPath(testFile.path);
      expect(properties?['first_name'], 'Birju');
      expect(properties?['last_name'], 'Vachhani');
      expect(properties?['email'], 'brvachhani@gmail.com');
      expect(properties?['age'], '24');
    });

    test('empty file test', () async {
      final properties =
          await GradleProperties.fromPath('test/empty_test_data.properties');
      expect(properties, null);
    });

    test('load from map test', () async {
      final properties = await GradleProperties.fromMap({
        'first_name': 'John',
        'last_name': 'Doe',
        'email': 'john@doe.com',
        'age': '24',
      });
      expect(properties['first_name'], 'John');
      expect(properties['last_name'], 'Doe');
      expect(properties['email'], 'john@doe.com');
      expect(properties['age'], '24');
      expect(() async => await properties.save(), throwsException);
    });

    test('save method test', () async {
      final properties = await GradleProperties.fromPath(testFile.path);
      expect(properties?['first_name'], 'Birju');
      properties?['email'] = 'test@example.com';
      expect(properties?['email'], 'test@example.com');
      await properties?.save();
      final newProperties = await GradleProperties.fromPath(testFile.path);
      expect(newProperties?['email'], 'test@example.com');
    });

    test('readProperties extension test', () async {
      final properties = await testFile.readProperties();
      expect(properties?['first_name'], 'Birju');
      expect(properties?['last_name'], 'Vachhani');
      expect(properties?['email'], 'brvachhani@gmail.com');
      expect(properties?['age'], '24');
    });

    test('contains method test', () async {
      final properties = await testFile.readProperties();
      expect(properties?.contains('first_name'), true);
      expect(properties?.contains('abcd'), false);
    });

    test('getters tests', () async {
      final properties = await testFile.readProperties();
      expect(properties?.keys.contains('first_name'), true);
      expect(properties?.values.contains('Birju'), true);
      expect(properties?.keys.contains('address'), false);
      properties?.putIfAbsent('address', 'Ahmedabad');
      expect(properties?.keys.contains('address'), true);
      properties
          ?.addAll({'github': 'birjuvachhani', 'twitter': 'birjuvachhani'});
      expect(properties?.contains('github'), true);
      expect(properties?.contains('twitter'), true);
      expect(properties?['twitter'], 'birjuvachhani');
      expect(properties?['github'], 'birjuvachhani');
      expect(properties?.properties['last_name'], 'Vachhani');
    });

    tearDown(testFile.deleteSync);
  });
}
