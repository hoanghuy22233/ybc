import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';

part 'question.g.dart';

@JsonSerializable()
class Question extends Equatable {
  String question;
  String answer;


  Question(this.question, this.answer);

  factory Question.fromJson(Map<String, dynamic> json) =>
      _$QuestionFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionToJson(this);

  @override
  List<Object> get props => [
    question, answer
  ];

  @override
  String toString() {
    return 'Question{question: $question, answer: $answer}';
  }
}
