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

class SignInForm {
  final List<FormField> formFields;

  FormField get emailFormField =>
      formFields.firstWhere((element) => element.id == emailField.id);

  FormField get passwordFormField =>
      formFields.firstWhere((element) => element.id == passwordField.id);

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

  const SignInForm({
    required this.formFields,
  });

  factory SignInForm.init() {
    return const SignInForm(
      formFields: [
        emailField,
        passwordField,
      ],
    );
  }

  SignInForm copyWith({
    List<FormField>? formFields,
  }) {
    return SignInForm(
      formFields: formFields ?? this.formFields,
    );
  }

  SignInForm copyClearingValues() {
    return SignInForm(
      formFields: formFields.map((e) => e.copyWithClearingValue()).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'formFields': formFields.map((e) => e.toMap()).toList(),
    };
  }
}
