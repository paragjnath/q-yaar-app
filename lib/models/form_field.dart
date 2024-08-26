
class FormField {
  final String id;
  final String label;
  final String value;
  final FormFieldType type;
  final List<String>? dropdownItems;
  final bool isRequired;
  final String? hint;
  final String? error;
  final String? regex;
  final int? minLength;
  final int? maxLength;

  const FormField({
    required this.id,
    required this.label,
    required this.value,
    required this.isRequired,
    required this.type,
    this.hint,
    this.dropdownItems,
    this.error,
    this.regex,
    this.minLength,
    this.maxLength,
  });

  FormField copyWith({
    String? label,
    String? value,
    bool? isRequired,
    FormFieldType? type,
    String? hint,
    String? error,
    List<String>? dropdownItems,
    String? regex,
    int? minLength,
    int? maxLength,
  }) {
    return FormField(
      id: id,
      label: label ?? this.label,
      value: value ?? this.value,
      isRequired: isRequired ?? this.isRequired,
      type: type ?? this.type,
      hint: hint ?? this.hint,
      error: error ?? this.error,
      dropdownItems: dropdownItems ?? this.dropdownItems,
      regex: regex ?? this.regex,
      minLength: minLength ?? this.minLength,
      maxLength: maxLength ?? this.maxLength,
    );
  }

  FormField copyClearingError() {
    return FormField(
      id: id,
      label: label,
      value: value,
      isRequired: isRequired,
      type: type,
      hint: hint,
      error: null,
      dropdownItems: dropdownItems,
      regex: regex,
      minLength: minLength,
      maxLength: maxLength,
    );
  }

  FormField copyWithClearingValue() {
    return FormField(
      id: id,
      label: label,
      value: '',
      isRequired: isRequired,
      type: type,
      hint: hint,
      error: null,
      dropdownItems: dropdownItems,
      regex: regex,
      minLength: minLength,
      maxLength: maxLength,
    );
  }

  @override
  toString() {
    return 'FormField(id: $id, label: $label, value: $value, type: $type, isRequired: $isRequired, hint: $hint, error: $error, dropdownItems: $dropdownItems, regex: $regex, minLength: $minLength, maxLength: $maxLength)';
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'value': value,
      'type': type.index,
      'isRequired': isRequired,
      'hint': hint,
      'error': error,
      'dropdownItems': dropdownItems,
      'regex': regex,
      'minLength': minLength,
      'maxLength': maxLength,
    };
  }
}

enum FormFieldType {
  text,
  number,
  date,
  dropdown,
}
