import 'package:q_yaar/models/form_field.dart';

const emailField = FormField(
  id: 'email',
  label: 'Email',
  value: '',
  isRequired: true,
  type: FormFieldType.text,
  hint: 'Enter email',
  error: null,
  dropdownItems: [],
  regex: r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
  minLength: 6,
  maxLength: 50,
);

const passwordField = FormField(
  id: 'password',
  label: 'Password',
  value: '',
  isRequired: true,
  type: FormFieldType.text,
  hint: 'Enter password',
  error: null,
  dropdownItems: [],
  regex: r'^.{6,}$',
  minLength: 6,
  maxLength: 20,
);

const confirmPassword = FormField(
  id: 'confirm_password',
  label: 'Confirm Password',
  value: '',
  isRequired: true,
  type: FormFieldType.text,
  hint: 'Re-enter password',
  error: null,
  dropdownItems: [],
  regex: r'^.{6,}$',
  minLength: 6,
  maxLength: 20,
);

const nameField = FormField(
  id: 'name',
  label: 'Name',
  value: '',
  isRequired: true,
  type: FormFieldType.text,
  hint: 'Enter name',
  error: null,
  dropdownItems: [],
  regex: r'^.{3,}$',
  minLength: 3,
  maxLength: 50,
);

class SignUpForm {
  final List<FormField> formFields;

  FormField get emailFormField =>
      formFields.firstWhere((element) => element.id == emailField.id);

  FormField get passwordFormField =>
      formFields.firstWhere((element) => element.id == passwordField.id);

  FormField get confirmPasswordField => formFields.firstWhere((element) => element.id == confirmPassword.id);

  FormField get nameFormField => formFields.firstWhere((element) => element.id == nameField.id);

  get isFormValid => formFields.every((element) => element.error == null);

  get shouldEnableSubmitButton => formFields.every(
        (element) {
          if (element.isRequired) {
            return element.value.isNotEmpty && element.error == null;
          } else {
            return element.error == null;
          }
        },
      );

  const SignUpForm({
    required this.formFields,
  });

  factory SignUpForm.init() {
    return const SignUpForm(
      formFields: [
        nameField,
        emailField,
        passwordField,
        confirmPassword,
      ],
    );
  }

  SignUpForm copyWith({
    List<FormField>? formFields,
  }) {
    return SignUpForm(
      formFields: formFields ?? this.formFields,
    );
  }

  SignUpForm copyClearingValues() {
    return SignUpForm(
      formFields: formFields.map((e) => e.copyWithClearingValue()).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'formFields': formFields.map((e) => e.toMap()).toList(),
    };
  }
}
