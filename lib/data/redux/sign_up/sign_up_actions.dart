import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:q_yaar/constants/loading_status.dart';
import 'package:q_yaar/constants/q_yaar_platform_urls.dart';
import 'package:q_yaar/constants/user_roles.dart';
import 'package:q_yaar/data/redux/app_state.dart';
import 'package:q_yaar/data/redux/auth/auth_actions.dart';
import 'package:q_yaar/data/remote/model/auth_data.dart';
import 'package:q_yaar/data/remote/model/signup_request.dart';
import 'package:q_yaar/data/remote/q_yaar_platform_api_service.dart';
import 'package:q_yaar/services/crashlytics_service.dart';
import 'package:q_yaar/utilities/custom_toast.dart';

class SignUpAction extends ReduxAction<AppState> {
  LoadingStatus loadingStatus = LoadingStatus.loading;

  @override
  Future<Null> reduce() async {
    try {
      if (!state.signUpState.signUpForm.isFormValid) {
        throw Exception('Form is not valid');
      }
      final loginRequest = SignupRequest(
        email: state.signUpState.signUpForm.emailFormField.value,
        password: state.signUpState.signUpForm.passwordFormField.value,
        profileName: state.signUpState.signUpForm.nameFormField.value,
        confirmPassword:
            state.signUpState.signUpForm.confirmPasswordField.value,
        role: UserRoles.player,
      );
      final response = await QYaarPlatformApiService.instance.post(
        QYaarPlatformUrls.userSignUp,
        data: loginRequest.toMap(),
      );
      if (response.statusCode == 200 && response.data != null) {
        loadingStatus = LoadingStatus.success;
        AuthData authData = AuthData.fromMap(response.data);
        dispatch(
          LoginAction(
            authData: authData,
          ),
        );
      } else {
        CustomToast.showDioErrMessage(response);
        loadingStatus = LoadingStatus.error;
      }
    } catch (e, st) {
      CrashlyticsService.recordError(e, st);
      loadingStatus = LoadingStatus.error;
      debugPrintStack(stackTrace: st);
    }
  }

  @override
  Future<void> before() async {
    dispatch(_ChangeSignUpSubmitStatusAction(loadingStatus));
  }

  @override
  Future<void> after() async {
    dispatch(_ChangeSignUpSubmitStatusAction(loadingStatus));
  }
}

class _ChangeSignUpSubmitStatusAction extends ReduxAction<AppState> {
  final LoadingStatus loadingStatus;
  _ChangeSignUpSubmitStatusAction(
    this.loadingStatus,
  );

  @override
  AppState reduce() {
    return state.copyWith(
      signUpState: state.signUpState.copyWith(
        submitStatus: loadingStatus,
      ),
    );
  }
}
