import 'package:flutter/material.dart';
import 'package:q_yaar/constants/auth_status.dart';
import 'package:q_yaar/data/remote/model/auth_data.dart';

@immutable
class AuthState {
  final AuthStatus authStatus;
  final AuthData? authData;

  const AuthState({
    required this.authStatus,
    required this.authData,
  });

  factory AuthState.initial() {
    return const AuthState(
      authStatus: AuthStatus.loggedOut,
      authData: null,
    );
  }

  AuthState copyWith({
    AuthStatus? authStatus,
    AuthData? authData,
  }) {
    return AuthState(
      authStatus: authStatus ?? this.authStatus,
      authData: authData ?? this.authData,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'authStatus': authStatus.name,
      'authData': authData?.toMap(),
    };
  }
}
