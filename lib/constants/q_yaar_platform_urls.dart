import 'package:q_yaar/constants/environment_config.dart';

class QYaarPlatformUrls {
  static String getBaseUrl() {
    return EnvironmentConfig.getQYaarPlatformBaseUrl();
  }

  static const String userLogin = "api/v1/auth/login";
}
