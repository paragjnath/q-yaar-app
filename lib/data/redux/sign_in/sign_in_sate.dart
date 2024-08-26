import 'package:flutter/material.dart';
import 'package:q_yaar/constants/loading_status.dart';
import 'package:q_yaar/ui/auth/models/sigin_in_form.dart';

@immutable
class SignInState {
  final SignInForm signInForm;
  final LoadingStatus submitStatus;

  const SignInState({
    required this.signInForm,
    required this.submitStatus,
  });

  factory SignInState.initial() {
    return SignInState(
      signInForm: SignInForm.init(),
      submitStatus: LoadingStatus.idle,
    );
  }

  SignInState copyWith({
    SignInForm? signInForm,
    LoadingStatus? submitStatus,
  }) {
    return SignInState(
      signInForm: signInForm ?? this.signInForm,
      submitStatus: submitStatus ?? this.submitStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'signInForm': signInForm.toMap(),
      'submitStatus': submitStatus.name,
    };
  }
}
