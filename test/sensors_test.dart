import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sensors/sensors.dart';

void main() {
  const MethodChannel channel = MethodChannel('sensors');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Sensors.platformVersion, '42');
  });
}
