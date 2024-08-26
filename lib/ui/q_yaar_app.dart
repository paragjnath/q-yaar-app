import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:q_yaar/data/redux/app_state.dart';
import 'package:q_yaar/data/redux/store.dart';
import 'package:q_yaar/ui/auth/connectors/check_auth_connector.dart';
import 'package:q_yaar/ui/auth/connectors/sigin_in_screen_connector.dart';
import 'package:q_yaar/ui/bottom_navigation/widgets/bottom_navigation_screen.dart';

class QYaarApp extends StatelessWidget {
  const QYaarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 237, 98),
            dynamicSchemeVariant: DynamicSchemeVariant.expressive,
          ),
          useMaterial3: true,
        ),
        home: const CheckAuthConnector(
          signInScreen: SignInScreenConnector(),
          child: BottomNavigationScreen(),
        ),
      ),
    );
  }
}
