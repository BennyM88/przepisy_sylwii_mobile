import 'dart:convert';
import 'package:flutter/services.dart';

abstract class ConfigReader {
  static late Map<String, dynamic> _config;

  static Future<void> initialize() async {
    final configString = await rootBundle.loadString('config/app_config.json');
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String getAndroidApiKey() {
    return _config['androidApiKey'] as String;
  }

  static String getAndroidAppId() {
    return _config['androidAppId'] as String;
  }

  static String getMessagingSenderId() {
    return _config['messagingSenderId'] as String;
  }

  static String getProjectId() {
    return _config['projectId'] as String;
  }

  static String getStorageBucket() {
    return _config['storageBucket'] as String;
  }

  static String getIosApiKey() {
    return _config['iosApiKey'] as String;
  }

  static String getIosAppId() {
    return _config['iosAppId'] as String;
  }

  static String getIosClientId() {
    return _config['iosClientId'] as String;
  }

  static String getIosBundleId() {
    return _config['iosBundleId'] as String;
  }
}
