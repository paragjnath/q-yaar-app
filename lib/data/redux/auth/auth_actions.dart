import 'package:async_redux/async_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:q_yaar/constants/auth_status.dart';
import 'package:q_yaar/data/redux/app_state.dart';
import 'package:q_yaar/data/remote/model/auth_data.dart';
import 'package:q_yaar/data/shared_pref/shared_pref_service.dart';

class LoginFromLocalAction extends ReduxAction<AppState> {
  AuthStatus authStatus = AuthStatus.loading;
  @override
  Future<AppState?> reduce() async {
    final authData = await SharedPrefService.getAuthData();
    if (authData != null) {
      await dispatch(
        LoginAction(
          authData: authData,
        ),
      );
      authStatus = AuthStatus.loggedIn;
    } else {
      await dispatch(LogoutAction());
      authStatus = AuthStatus.loggedOut;
    }
    return null;
  }

  @override
  void before() => dispatch(_ChangeAuthStatusAction(authStatus));

  @override
  void after() => dispatch(_ChangeAuthStatusAction(authStatus));

  Map<String, dynamic> toMap() {
    return {};
  }
}

class LoginAction extends ReduxAction<AppState> {
  final AuthData authData;
  LoginAction({
    required this.authData,
  });

  @override
  Future<AppState?> reduce() async {
    try {
      return state.copyWith(
        authState: state.authState.copyWith(
          authData: authData,
          authStatus: AuthStatus.loggedIn,
        ),
      );
    } catch (e, st) {
      debugPrintStack(stackTrace: st);
      await dispatch(LogoutAction());
      return null;
    }
  }

  Map<String, dynamic> toMap() {
    return {};
  }
}

class LogoutAction extends ReduxAction<AppState> {
  @override
  Future<AppState> reduce() async {
    await SharedPrefService.clearData();
    return AppState.initial();
  }
}

class _ChangeAuthStatusAction extends ReduxAction<AppState> {
  final AuthStatus authStatus;
  _ChangeAuthStatusAction(this.authStatus);

  @override
  AppState reduce() {
    return state.copyWith(
      authState: state.authState.copyWith(
        authStatus: authStatus,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'authStatus': authStatus.toString(),
    };
  }
}
