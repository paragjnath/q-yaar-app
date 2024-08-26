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
      appBar: AppBar(
        title: const Text('Q Yaar'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              CustomControlledTextField(
                text: signInForm.emailFormField.value,
                onChanged: (value) {
                  updateSignInFormFieldValue(
                    fieldId: signInForm.emailFormField.id,
                    fieldValue: value,
                  );
                },
                label: signInForm.emailFormField.label,
                errorText: signInForm.emailFormField.error,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomControlledTextField(
                text: signInForm.passwordFormField.value,
                onChanged: (value) {
                  updateSignInFormFieldValue(
                    fieldId: signInForm.passwordFormField.id,
                    fieldValue: value,
                  );
                },
                label: signInForm.passwordFormField.label,
                errorText: signInForm.passwordFormField.error,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 24),
              CustomFilledButton(
                onPressed: submitSignInForm,
                text: 'Sign In',
                isEnabled: submitStatus != LoadingStatus.loading,
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
