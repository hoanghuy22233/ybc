import 'package:equatable/equatable.dart';

class DioStatus extends Equatable {
  final String message;
  final int code;
  final DateTime timeStamp = DateTime.now();

  DioStatus({
    this.message,
    this.code,
  });

  factory DioStatus.loading() {
    return DioStatus(
      message: '',
      code: API_PROGRESS,
    );
  }

  factory DioStatus.loadingNotify() {
    return DioStatus(
      message: '',
      code: API_PROGRESS_NOTIFY,
    );
  }

  static const int API_FAILURE_NOTIFY = 0;
  static const int API_SUCCESS_NOTIFY = 1;
  static const int API_FAILURE = 2;
  static const int API_SUCCESS = 3;
  static const int API_PROGRESS = 4;
  static const int API_PROGRESS_NOTIFY = 5;

  static const int HTTP_SUCCESS = 200;
  static const int HTTP_UNAUTHORIZED = 401;

  @override
  String toString() {
    return 'DioStatus{message: $message, code: $code, timeStamp: $timeStamp}';
  }

  @override
  List<Object> get props => [message, code, timeStamp];
}
