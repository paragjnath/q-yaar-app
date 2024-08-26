import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:q_yaar/constants/loading_status.dart';
import 'package:q_yaar/data/redux/app_state.dart';
import 'package:q_yaar/data/redux/auth/auth_actions.dart';
import 'package:q_yaar/data/redux/sign_in/sign_in_actions.dart';
import 'package:q_yaar/data/redux/sign_in/sign_in_form_actions.dart';
import 'package:q_yaar/ui/auth/models/sigin_in_form.dart';
import 'package:q_yaar/ui/auth/widgets/sign_in_screen.dart';

class SignInScreenConnector extends StatelessWidget {
  const SignInScreenConnector({
    super.key,
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
          return SignInScreen(
            submitStatus: snapshot.submitStatus,
            signInForm: snapshot.signInForm,
            updateSignInFormFieldValue: snapshot.updateSignInFormFieldValue,
            submitSignInForm: snapshot.submitSignInForm,
          );
        },
      ),
    );
  }
}

class _ViewModel extends Vm {
  final LoadingStatus submitStatus;
  final SignInForm signInForm;
  final Function({
    required String fieldId,
    required String fieldValue,
  }) updateSignInFormFieldValue;

  final VoidCallback submitSignInForm;

  _ViewModel({
    required this.submitStatus,
    required this.signInForm,
    required this.updateSignInFormFieldValue,
    required this.submitSignInForm,
  }) : super(equals: [
          submitStatus,
          signInForm,
        ]);
}

class _ViewModelFactory
    extends VmFactory<AppState, SignInScreenConnector, _ViewModel> {
  _ViewModelFactory(
    super.widget,
  );

  @override
  _ViewModel fromStore() => _ViewModel(
        submitStatus: state.signInState.submitStatus,
        signInForm: state.signInState.signInForm,
        updateSignInFormFieldValue: ({
          required String fieldId,
          required String fieldValue,
        }) {
          dispatch(UpdateSignInFormFieldValueAction(
            fieldId: fieldId,
            fieldValue: fieldValue,
          ));
        },
        submitSignInForm: () {
          dispatch(SignInAction());
        },
      );
}
