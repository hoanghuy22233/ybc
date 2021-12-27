import 'base_field.dart';

class ListField<T> extends BaseField<T> {
  final List<T> list;
  final bool isValid;

  ListField(this.list, this.isValid);

  @override
  List<Object> get props => [
        list,
        isValid,
      ];
}
