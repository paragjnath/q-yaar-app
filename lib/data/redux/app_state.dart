import 'package:flutter/material.dart';
import 'package:q_yaar/data/redux/auth/auth_state.dart';
import 'package:q_yaar/data/redux/sign_in/sign_in_sate.dart';
import 'package:q_yaar/data/redux/sign_up/sign_up_state.dart';

@immutable
class AppState {
  final AuthState authState;
  final SignInState signInState;
  final SignUpState signUpState;

  const AppState({
    required this.authState,
    required this.signInState,
    required this.signUpState,
  });

  factory AppState.initial() => AppState(
        authState: AuthState.initial(),
        signInState: SignInState.initial(),
        signUpState: SignUpState.initial(),
      );

  AppState copyWith({
    AuthState? authState,
    SignInState? signInState,
    SignUpState? signUpState,
  }) {
    return AppState(
      authState: authState ?? this.authState,
      signInState: signInState ?? this.signInState,
      signUpState: signUpState ?? this.signUpState,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          signInState == other.signInState &&
          signInState == other.signInState &&
          authState == other.authState;

  @override
  int get hashCode =>
      signInState.hashCode ^ authState.hashCode ^ signUpState.hashCode;

  Map<String, dynamic> toMap() {
    return {
      'authState': authState.toMap(),
      'signInState': signInState.toMap(),
      'signUpState': signUpState.toMap(),
    };
  }
}
