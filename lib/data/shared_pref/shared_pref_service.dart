import 'dart:convert';
import 'package:q_yaar/constants/shared_pref_keys.dart';
import 'package:q_yaar/data/remote/model/auth_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  static Future<AuthData?> getAuthData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final encodedAuthData =
        sharedPreferences.getString(SharedPrefKeys.authData.key) ?? '';
    if (encodedAuthData.isNotEmpty) {
      try {
        final authData = AuthData.fromMap(jsonDecode(encodedAuthData));
        return authData;
      } catch (e) {
        return null;
      }
    }
    return null;
  }

  static Future<bool> setAuthData(
    AuthData? authData,
  ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (authData == null) {
      return sharedPreferences.setString(
        SharedPrefKeys.authData.key,
        '',
      );
    }

    return sharedPreferences.setString(
      SharedPrefKeys.authData.key,
      jsonEncode(authData.toMap()),
    );
  }

  static Future<bool> clearData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }
}
