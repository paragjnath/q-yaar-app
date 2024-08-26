import 'package:async_redux/async_redux.dart';
import 'package:q_yaar/data/redux/app_state.dart';
import 'package:q_yaar/models/form_field.dart';

class UpdateSignUpFormFieldValueAction extends ReduxAction<AppState> {
  final String fieldId;
  final String fieldValue;

  UpdateSignUpFormFieldValueAction({
    required this.fieldId,
    required this.fieldValue,
  });

  @override
  Null reduce() {
    final formFields = state.signUpState.signUpForm.formFields;
    final index = formFields.indexWhere((element) => element.id == fieldId);
    if (index != -1) {
      final formField = formFields[index];
      final updatedField = formField.copyWith(value: fieldValue);
      dispatch(
        UpdateSignUpFormFieldAcion(
          field: updatedField,
        ),
      );
      dispatch(
        ValidateSignUpFormFieldAction(
          field: updatedField,
        ),
      );
    }
  }
}

class UpdateSignUpFormFieldAcion extends ReduxAction<AppState> {
  final FormField field;

  UpdateSignUpFormFieldAcion({
    required this.field,
  });

  @override
  AppState reduce() {
    final formFields = state.signUpState.signUpForm.formFields;

    final updatedFormFields = formFields.map((formField) {
      if (formField.id == field.id) {
        return field;
      }
      return formField;
    }).toList();

    return state.copyWith(
      signUpState: state.signUpState.copyWith(
        signUpForm: state.signUpState.signUpForm.copyWith(
          formFields: updatedFormFields,
        ),
      ),
    );
  }
}

class ValidateSignUpFormAction extends ReduxAction<AppState> {
  @override
  Null reduce() {
    final formFields = state.signUpState.signUpForm.formFields;
    for (final formField in formFields) {
      dispatch(
        ValidateSignUpFormFieldAction(
          field: formField,
        ),
      );
    }
  }
}

class ValidateSignUpFormFieldAction extends ReduxAction<AppState> {
  final FormField field;

  ValidateSignUpFormFieldAction({
    required this.field,
  });

  @override
  Null reduce() {
    dispatch(
      UpdateSignUpFormFieldAcion(
        field: field.copyClearingError(),
      ),
    );
    if ((field.regex ?? '').isNotEmpty) {
      final regex = RegExp(field.regex!);
      if (!regex.hasMatch(field.value)) {
        dispatch(
          UpdateSignUpFormFieldAcion(
            field: field.copyWith(
              error: 'Invalid ${field.label}',
            ),
          ),
        );
      }
    }
    if (field.minLength != null && field.value.length < field.minLength!) {
      if (field.minLength == field.maxLength) {
        dispatch(
          UpdateSignUpFormFieldAcion(
            field: field.copyWith(
              error: '${field.label} must be ${field.minLength} characters',
            ),
          ),
        );
      } else {
        dispatch(
          UpdateSignUpFormFieldAcion(
            field: field.copyWith(
              error:
                  '${field.label} must be at least ${field.minLength} characters',
            ),
          ),
        );
      }
    }
    if (field.maxLength != null && field.value.length > (field.maxLength!)) {
      dispatch(
        UpdateSignUpFormFieldAcion(
          field: field.copyWith(
            error:
                '${field.label} must be at most ${field.maxLength} characters',
          ),
        ),
      );
    }
    if (field.isRequired && field.value.isEmpty) {
      dispatch(
        UpdateSignUpFormFieldAcion(
          field: field.copyWith(
            error: '${field.label} is required',
          ),
        ),
      );
    }
  }
}
