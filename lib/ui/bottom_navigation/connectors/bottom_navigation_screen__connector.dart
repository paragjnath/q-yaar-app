import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:q_yaar/data/redux/app_state.dart';
import 'package:q_yaar/data/redux/auth/auth_actions.dart';
import 'package:q_yaar/ui/bottom_navigation/widgets/bottom_navigation_screen.dart';

class BottomNavigationScreenConnector extends StatelessWidget {
  const BottomNavigationScreenConnector({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      vm: () => _ViewModelFactory(this),
      onInit: (store) {
        store.dispatch(LoginFromLocalAction());
      },
      builder: (context, snapshot) {
        return BottomNavigationScreen(
          logOut: snapshot.logOut,
          profileName: snapshot.profileName,
        );
      },
    );
  }
}

class _ViewModel extends Vm {
  final VoidCallback logOut;
  final String profileName;

  _ViewModel({
    required this.logOut,
    required this.profileName,
  }) : super(equals: [
          profileName,
        ]);
}

class _ViewModelFactory
    extends VmFactory<AppState, BottomNavigationScreenConnector, _ViewModel> {
  _ViewModelFactory(
    super.widget,
  );

  @override
  _ViewModel fromStore() => _ViewModel(
        profileName: state.authState.authData?.profiles?.player?.profileData
                ?.profileName ??
            '',
        logOut: () => dispatch(
          LogoutAction(),
        ),
      );
}
