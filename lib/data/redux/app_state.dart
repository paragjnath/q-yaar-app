import 'package:flutter/material.dart';
import 'package:q_yaar/data/redux/auth/auth_state.dart';
import 'package:q_yaar/data/redux/sign_in/sign_in_sate.dart';

@immutable
class AppState {
  final AuthState authState;
  final SignInState signInState;

  const AppState({
    required this.authState,
    required this.signInState,
  });

  factory AppState.initial() => AppState(
        authState: AuthState.initial(),
        signInState: SignInState.initial(),
      );

  AppState copyWith({
    AuthState? authState,
    SignInState? signInState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
      signInState: signInState ?? this.signInState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          signInState == other.signInState &&
          authState == other.authState;

  @override
  int get hashCode => signInState.hashCode ^ authState.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'authState': authState.toMap(),
      'signInState': signInState.toMap(),
    };
  }
}
