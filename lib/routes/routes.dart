import 'package:flutter/material.dart';
import 'package:q_yaar/constants/route_names.dart';
import 'package:q_yaar/ui/auth/connectors/sigin_up_screen_connector.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> get routes {
    return {
      RouteNames.signUpScreen: (BuildContext context) =>
          const SignUpScreenConnector(),
    };
  }
}
