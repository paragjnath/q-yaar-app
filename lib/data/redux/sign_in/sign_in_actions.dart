import 'dart:async';

import 'package:async_redux/async_redux.dart';
import 'package:flutter/foundation.dart';
import 'package:q_yaar/constants/loading_status.dart';
import 'package:q_yaar/constants/q_yaar_platform_urls.dart';
import 'package:q_yaar/data/redux/app_state.dart';
import 'package:q_yaar/data/redux/auth/auth_actions.dart';
import 'package:q_yaar/data/remote/model/auth_data.dart';
import 'package:q_yaar/data/remote/q_yaar_platform_api_service.dart';
import 'package:q_yaar/services/crashlytics_service.dart';
import 'package:q_yaar/utilities/custom_toast.dart';

class SignInAction extends ReduxAction<AppState> {
  LoadingStatus loadingStatus = LoadingStatus.loading;

  @override
  Future<Null> reduce() async {
    try {
      final response = await QYaarPlatformApiService.instance
          .post(QYaarPlatformUrls.userAuth);
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
    dispatch(_ChangeSignInSubmitStatusAction(loadingStatus));
  }

  @override
  Future<void> after() async {
    dispatch(_ChangeSignInSubmitStatusAction(loadingStatus));
  }
}

class _ChangeSignInSubmitStatusAction extends ReduxAction<AppState> {
  final LoadingStatus loadingStatus;
  _ChangeSignInSubmitStatusAction(
    this.loadingStatus,
  );

  @override
  AppState reduce() {
    return state.copyWith(
      signInState: state.signInState.copyWith(
        submitStatus: loadingStatus,
      ),
    );
  }
}
