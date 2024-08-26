import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:q_yaar/constants/loading_status.dart';
import 'package:q_yaar/data/redux/app_state.dart';
import 'package:q_yaar/data/redux/sign_up/sign_up_actions.dart';
import 'package:q_yaar/data/redux/sign_up/sign_up_form_actions.dart';
import 'package:q_yaar/ui/auth/models/sigin_up_form.dart';
import 'package:q_yaar/ui/auth/widgets/sign_up_screen.dart';

class SignUpScreenConnector extends StatelessWidget {
  const SignUpScreenConnector({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<AppState, _ViewModel>(
        vm: () => _ViewModelFactory(this),
        builder: (context, snapshot) {
          return SignUpScreen(
            submitStatus: snapshot.submitStatus,
            signUpForm: snapshot.signUpForm,
            updateSignUpFormFieldValue: snapshot.updateSignUpFormFieldValue,
            submitSignUpForm: snapshot.submitSignUpForm,
          );
        },
      ),
    );
  }
}

class _ViewModel extends Vm {
  final LoadingStatus submitStatus;
  final SignUpForm signUpForm;
  final Function({
    required String fieldId,
    required String fieldValue,
  }) updateSignUpFormFieldValue;

  final VoidCallback submitSignUpForm;

  _ViewModel({
    required this.submitStatus,
    required this.signUpForm,
    required this.updateSignUpFormFieldValue,
    required this.submitSignUpForm,
  }) : super(equals: [
          submitStatus,
          signUpForm,
        ]);
}

class _ViewModelFactory
    extends VmFactory<AppState, SignUpScreenConnector, _ViewModel> {
  _ViewModelFactory(
    super.widget,
  );

  @override
  _ViewModel fromStore() => _ViewModel(
        submitStatus: state.signUpState.submitStatus,
        signUpForm: state.signUpState.signUpForm,
        updateSignUpFormFieldValue: ({
          required String fieldId,
          required String fieldValue,
        }) {
          dispatch(UpdateSignUpFormFieldValueAction(
            fieldId: fieldId,
            fieldValue: fieldValue,
          ));
        },
        submitSignUpForm: () {
          dispatch(ValidateSignUpFormAction());
          dispatch(SignUpAction());
        },
      );
}
