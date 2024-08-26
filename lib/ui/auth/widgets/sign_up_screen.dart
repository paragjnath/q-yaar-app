import 'package:flutter/material.dart';
import 'package:q_yaar/constants/loading_status.dart';
import 'package:q_yaar/ui/auth/models/sigin_up_form.dart';
import 'package:q_yaar/ui/widgets/custom_button.dart';
import 'package:q_yaar/ui/widgets/custom_controlled_text_field.dart';

class SignUpScreen extends StatelessWidget {
  final LoadingStatus submitStatus;
  final SignUpForm signUpForm;
  final Function({
    required String fieldId,
    required String fieldValue,
  }) updateSignUpFormFieldValue;

  final VoidCallback submitSignUpForm;
  const SignUpScreen({
    super.key,
    required this.submitStatus,
    required this.signUpForm,
    required this.updateSignUpFormFieldValue,
    required this.submitSignUpForm,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Join Q Yaar'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Spacer(),
              CustomControlledTextField(
                text: signUpForm.nameFormField.value,
                onChanged: (value) {
                  updateSignUpFormFieldValue(
                    fieldId: signUpForm.nameFormField.id,
                    fieldValue: value,
                  );
                },
                label: signUpForm.nameFormField.label,
                errorText: signUpForm.nameFormField.error,
                keyboardType: TextInputType.text,
              ),
              const SizedBox(height: 16),
              CustomControlledTextField(
                text: signUpForm.emailFormField.value,
                onChanged: (value) {
                  updateSignUpFormFieldValue(
                    fieldId: signUpForm.emailFormField.id,
                    fieldValue: value,
                  );
                },
                label: signUpForm.emailFormField.label,
                errorText: signUpForm.emailFormField.error,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              CustomControlledTextField(
                obscureText: true,
                text: signUpForm.passwordFormField.value,
                onChanged: (value) {
                  updateSignUpFormFieldValue(
                    fieldId: signUpForm.passwordFormField.id,
                    fieldValue: value,
                  );
                },
                label: signUpForm.passwordFormField.label,
                errorText: signUpForm.passwordFormField.error,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 16),
              CustomControlledTextField(
                obscureText: true,
                text: signUpForm.confirmPasswordField.value,
                onChanged: (value) {
                  updateSignUpFormFieldValue(
                    fieldId: signUpForm.confirmPasswordField.id,
                    fieldValue: value,
                  );
                },
                label: signUpForm.confirmPasswordField.label,
                errorText: signUpForm.confirmPasswordField.error,
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 24),
              CustomFilledButton(
                onPressed: submitSignUpForm,
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
