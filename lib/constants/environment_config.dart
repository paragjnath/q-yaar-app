import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvironmentConfig {
  /// To run application with prod server, use
  /// flutter run --dart-define=isProductionEnvironment=true
  /// otherwise staging server is selected by default.
  static const isProductionEnvironment = bool.fromEnvironment(
    'isProductionEnvironment',
    defaultValue: false,
  );

  static Future<void> ensureInitilized() async {
    await dotenv.load(fileName: '.env');
  }

  static String getQYaarPlatformBaseUrl() {
    if (isProductionEnvironment) {
      return dotenv.get('PROD_Q_YAAR_PLATFORM_BASE_URL');
    } else {
      return dotenv.get('STAGING_Q_YAAR_PLATFORM_BASE_URL');
    }
  }
}
