import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/model/repo/user_repository.dart';
import 'package:ybc/utils/dio/dio_error_util.dart';

import 'bloc.dart';

class InformationUserBloc extends Bloc<InformationUserEvent, InformationUserState> {
  final HomeRepository _homeRepository;

  InformationUserBloc({@required HomeRepository homeRepository})
      : assert(homeRepository != null),
        _homeRepository = homeRepository;

  @override
  InformationUserState get initialState => InformationUserLoading();

  @override
  Stream<InformationUserState> mapEventToState(InformationUserEvent event) async* {
    if (event is LoadInformationUser) {
      yield* _mapLoadInformationUserToState(event.userId);
    } else if (event is RefreshInformationUser) {
      yield InformationUserLoading();
      yield* _mapLoadInformationUserToState(event.userId);
    }
  }

  Stream<InformationUserState> _mapLoadInformationUserToState(int idUser) async* {
    try {
      final profileResponse = await _homeRepository.getInformation(idUser: idUser);
      print('-----------------');
      yield InformationUserLoaded(profileResponse.data);
    } catch (e) {
      yield InformationUserNotLoaded(DioErrorUtil.handleError(e));
//      yield InformationUserNotLoaded(e);
    }
  }
}
