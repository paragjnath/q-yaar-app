import 'package:async_redux/async_redux.dart';
import 'package:q_yaar/data/redux/app_state.dart';
import 'package:q_yaar/models/form_field.dart';

class UpdateSignInFormFieldValueAction extends ReduxAction<AppState> {
  final String fieldId;
  final String fieldValue;

  UpdateSignInFormFieldValueAction({
    required this.fieldId,
    required this.fieldValue,
  });

  @override
  Null reduce() {
    final formFields = state.signInState.signInForm.formFields;
    final index = formFields.indexWhere((element) => element.id == fieldId);
    if (index != -1) {
      final formField = formFields[index];
      final updatedField = formField.copyWith(value: fieldValue);
      dispatch(
        UpdateSignInFormFieldAcion(
          field: updatedField,
        ),
      );
      dispatch(
        ValidateSignInFormFieldAction(
          field: updatedField,
        ),
      );
    }
  }
}

class UpdateSignInFormFieldAcion extends ReduxAction<AppState> {
  final FormField field;

  UpdateSignInFormFieldAcion({
    required this.field,
  });

  @override
  AppState reduce() {
    final formFields = state.signInState.signInForm.formFields;

    final updatedFormFields = formFields.map((formField) {
      if (formField.id == field.id) {
        return field;
      }
      return formField;
    }).toList();

    return state.copyWith(
      signInState: state.signInState.copyWith(
        signInForm: state.signInState.signInForm.copyWith(
          formFields: updatedFormFields,
        ),
      ),
    );
  }
}

class ValidateSignInFormAction extends ReduxAction<AppState> {
  @override
  Null reduce() {
    final formFields = state.signInState.signInForm.formFields;
    for (final formField in formFields) {
      dispatch(
        ValidateSignInFormFieldAction(
          field: formField,
        ),
      );
    }
  }
}

class ValidateSignInFormFieldAction extends ReduxAction<AppState> {
  final FormField field;

  ValidateSignInFormFieldAction({
    required this.field,
  });

  @override
  Null reduce() {
    dispatch(
      UpdateSignInFormFieldAcion(
        field: field.copyClearingError(),
      ),
    );
    if ((field.regex ?? '').isNotEmpty) {
      final regex = RegExp(field.regex!);
      if (!regex.hasMatch(field.value)) {
        dispatch(
          UpdateSignInFormFieldAcion(
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
          UpdateSignInFormFieldAcion(
            field: field.copyWith(
              error: '${field.label} must be ${field.minLength} characters',
            ),
          ),
        );
      } else {
        dispatch(
          UpdateSignInFormFieldAcion(
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
        UpdateSignInFormFieldAcion(
          field: field.copyWith(
            error:
                '${field.label} must be at most ${field.maxLength} characters',
          ),
        ),
      );
    }
    if (field.isRequired && field.value.isEmpty) {
      dispatch(
        UpdateSignInFormFieldAcion(
          field: field.copyWith(
            error: '${field.label} is required',
          ),
        ),
      );
    }
  }
}
