import 'base_field.dart';

class ValidateField<T> extends BaseField<T> {
  final T field;
  final bool isValid;

  get fieldValue => () {
        return field;
      };

  ValidateField({this.field, this.isValid = false});

  ValidateField<T> empty() {
    return ValidateField(field: null, isValid: false);
  }

  factory ValidateField.init() {
    return ValidateField(field: null, isValid: false);
  }

  ValidateField<T> init() {
    return ValidateField(field: null, isValid: false);
  }

  ValidateField<T> update({T field, bool isValid}) {
    return copyWith(
      field: field,
      isValid: isValid,
    );
  }

  ValidateField<T> copyWith({T field, bool isValid}) {
    return ValidateField<T>(
      field: field ?? this.field,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [field, isValid];

  @override
  String toString() {
    return 'ValidateField{field: $field, isValid: $isValid}';
  }
}
