import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ybc/app/constants/preferences/app_preferences.dart';
import 'package:ybc/model/local/pref.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';

import 'bloc.dart';

class HistoryOrderBloc extends Bloc<HistoryOrderEvent, HistoryOrderState> {
  final UserRepository _userRepository;


  HistoryOrderBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  HistoryOrderState get initialState => HistoryOrderLoading();

  @override
  Stream<HistoryOrderState> mapEventToState(HistoryOrderEvent event) async* {
    if (event is LoadHistoryOrder) {
      yield* _mapLoadHistoryOrderToState(event.status, event.type);
    } else if (event is RefreshHistoryOrder) {
      yield HistoryOrderLoading();
      yield* _mapLoadHistoryOrderToState(event.status, event.type);
    }
  }

  Stream<HistoryOrderState> _mapLoadHistoryOrderToState(int status, int type) async* {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final token = prefs.getString(AppPreferences.auth_token);
      String apiToken = token;
      final historyOrderResponse = await _userRepository.historyOrder(limit: 10, offset: 0, apiToken: apiToken, status: status, type: type);

      yield HistoryOrderLoaded(historyOrderResponse.data);
    } catch (e) {
      yield HistoryOrderNotLoaded(DioErrorUtil.handleError(e));
//      yield HistoryOrderNotLoaded(e);
    }
  }
}
