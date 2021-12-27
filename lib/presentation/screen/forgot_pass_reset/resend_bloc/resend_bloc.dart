import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:quiver/async.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/validator/validator.dart';
import 'bloc.dart';

class ResendOTPBloc
    extends Bloc<ResendOTPEvent, ResendOTPState> {
  final UserRepository _userRepository;

  StreamSubscription _streamSubscription;

  ResendOTPBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ResendOTPState get initialState =>
      ResendOTPState.empty();

  @override
  Stream<ResendOTPState> mapEventToState(
      ResendOTPEvent event) async* {
    if (event is TimeInit) {
      yield* _mapTimeInitToState(event.time);
    } else if (event is TimeChanged) {
      yield* _mapTimeChangeToState(event.time);
    } else if (event is ResendOTPSubmit) {
      yield* _mapResendOtpToState(event.email);
    }
  }

  Stream<ResendOTPState> _mapTimeInitToState(Duration time) async* {
    CountdownTimer _countDownTimer;
    _countDownTimer =
    new CountdownTimer(time, Duration(seconds: 1));
    _streamSubscription = _countDownTimer.listen(null);
    _streamSubscription.onData(( duration) {
      print('time: ${duration.remaining.inSeconds}');
      this.add(TimeChanged(time: duration.remaining.inSeconds));
    });

    _streamSubscription.onDone(() async* {
      _streamSubscription.cancel();
    });
  }

  Stream<ResendOTPState> _mapTimeChangeToState(int time) async* {
    yield state.update(time: time, isTimeValid: Validator.isValidResendOtp(time));
  }

  Stream<ResendOTPState> _mapResendOtpToState(
      String email) async* {
    yield ResendOTPState.loading();
    try {
      var response =
      await _userRepository.forgotPassword(email: email);

      if (response.status == true) {
        yield ResendOTPState.success(message: response.msg);
      } else {
        yield ResendOTPState.failure(message: response.msg);
      }
    } catch (e) {
      print(e.toString());
      yield ResendOTPState.failure(message: e.toString());
    }
  }

  @override
  Future<void> close() {
    _streamSubscription.cancel();
    return super.close();
  }
}
