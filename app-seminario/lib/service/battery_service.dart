import 'package:flutter/services.dart';

class BatteryService {
  static const MethodChannel _channel = MethodChannel('com.exemplo/battery');

  static Future<int> getBatteryLevel() async {
    final int level = await _channel.invokeMethod('getBatteryLevel');
    return level;
  }
}
