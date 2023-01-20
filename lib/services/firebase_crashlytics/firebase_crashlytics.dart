import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class FirebaseCrashlyticsService {
  static FirebaseCrashlytics? _crashlytics;
  static Future<void> init() async {
    _crashlytics = FirebaseCrashlytics.instance;
    _crashlytics!.setCrashlyticsCollectionEnabled(!kDebugMode);
    Function? originalOnError = FlutterError.onError;
    FlutterError.onError = (FlutterErrorDetails errorDetails) async {
      await _crashlytics!.recordFlutterError(errorDetails);
      if (originalOnError != null) {
        originalOnError(errorDetails);
      }
    };
  }

  static Future<void> recordError(
    dynamic exception,
    StackTrace? stackTrace,
  ) async {
    _crashlytics?.recordError(exception, stackTrace);
  }
}
