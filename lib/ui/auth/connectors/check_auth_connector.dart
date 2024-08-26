import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:q_yaar/constants/auth_status.dart';
import 'package:q_yaar/data/redux/app_state.dart';
import 'package:q_yaar/data/redux/auth/auth_actions.dart';

class CheckAuthConnector extends StatelessWidget {
  final Widget child;
  final Widget signInScreen;
  const CheckAuthConnector({
    super.key,
    required this.child,
    required this.signInScreen,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, _ViewModel>(
        vm: () => _ViewModelFactory(this),
        onInit: (store) {
          store.dispatch(LoginFromLocalAction());
        },
        builder: (context, snapshot) {
          switch (snapshot.loadingStatus) {
            case AuthStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case AuthStatus.loggedIn:
              return child;
            case AuthStatus.loggedOut:
              return signInScreen;
          }
        },
      ),
    );
  }
}

class _ViewModel extends Vm {
  final AuthStatus loadingStatus;

  _ViewModel({
    required this.loadingStatus,
  }) : super(equals: [loadingStatus]);
}

class _ViewModelFactory
    extends VmFactory<AppState, CheckAuthConnector, _ViewModel> {
  _ViewModelFactory(
    super.widget,
  );

  @override
  _ViewModel fromStore() => _ViewModel(
        loadingStatus: state.authState.authStatus,
      );
}
