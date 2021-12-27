import 'package:ybc/model/entity/barrel_entity.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'question_data.g.dart';

@JsonSerializable()
class QuestionData extends Equatable {
  List<Question> list;

  QuestionData(this.list);

  factory QuestionData.fromJson(Map<String, dynamic> json) =>
      _$QuestionDataFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionDataToJson(this);

  @override
  List<Object> get props => [list];
}
