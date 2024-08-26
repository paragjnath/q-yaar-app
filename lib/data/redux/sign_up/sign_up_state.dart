import 'package:flutter/material.dart';
import 'package:q_yaar/constants/loading_status.dart';
import 'package:q_yaar/ui/auth/models/sigin_up_form.dart';

@immutable
class SignUpState {
  final SignUpForm signUpForm;
  final LoadingStatus submitStatus;

  const SignUpState({
    required this.signUpForm,
    required this.submitStatus,
  });

  factory SignUpState.initial() {
    return SignUpState(
      signUpForm: SignUpForm.init(),
      submitStatus: LoadingStatus.idle,
    );
  }

  SignUpState copyWith({
    SignUpForm? signUpForm,
    LoadingStatus? submitStatus,
  }) {
    return SignUpState(
      signUpForm: signUpForm ?? this.signUpForm,
      submitStatus: submitStatus ?? this.submitStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'signUpForm': signUpForm.toMap(),
      'submitStatus': submitStatus.name,
    };
  }
}
