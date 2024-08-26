import 'package:flutter/material.dart';
import 'package:q_yaar/constants/loading_status.dart';
import 'package:q_yaar/ui/auth/models/sigin_in_form.dart';
import 'package:q_yaar/ui/widgets/custom_button.dart';
import 'package:q_yaar/ui/widgets/custom_controlled_text_field.dart';

class SignInScreen extends StatelessWidget {
  final LoadingStatus submitStatus;
  final SignInForm signInForm;
  final Function({
    required String fieldId,
    required String fieldValue,
  }) updateSignInFormFieldValue;

  final VoidCallback submitSignInForm;
  const SignInScreen({
    super.key,
    required this.submitStatus,
    required this.signInForm,
    required this.updateSignInFormFieldValue,
    required this.submitSignInForm,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomControlledTextField(
              text: signInForm.emailFormField.value,
              onChanged: (value) {
                updateSignInFormFieldValue(
                  fieldId: signInForm.emailFormField.id,
                  fieldValue: value,
                );
              },
              label: signInForm.emailFormField.label,
            ),
            CustomControlledTextField(
              text: signInForm.passwordFormField.value,
              onChanged: (value) {
                updateSignInFormFieldValue(
                  fieldId: signInForm.passwordFormField.id,
                  fieldValue: value,
                );
              },
              label: signInForm.passwordFormField.label,
            ),
            CustomFilledButton(
              onPressed: submitSignInForm,
              text: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }
}
