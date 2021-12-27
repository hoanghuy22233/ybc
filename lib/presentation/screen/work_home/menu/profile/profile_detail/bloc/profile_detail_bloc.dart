import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/bloc/profile_detail_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/bloc/profile_detail_state.dart';

class ProfileDetailBloc extends Bloc<ProfileDetailEvent, ProfileDetailState> {
  final UserRepository _userRepository;

  ProfileDetailBloc({@required UserRepository userRepository})
      : assert(userRepository != null),
        _userRepository = userRepository;

  @override
  ProfileDetailState get initialState => ProfileDetailLoaded();

  @override
  Stream<ProfileDetailState> mapEventToState(ProfileDetailEvent event) async* {
    if (event is OpenFullnameForm) {
      yield* _mapOpenFullnameFormToState();
    } else if (event is OpenPhoneForm) {
      yield* _mapOpenPhoneFormToState();
    } else if (event is OpenEmailForm) {
      yield* _mapOpenEmailFormToState();
    } else if (event is OpenBirthdayForm) {
      yield* _mapOpenBirthdayFormToState();
    } else if (event is OpenJobForm) {
      yield* _mapOpenJobFormToState();
    } else if (event is OpenSuplifeForm) {
      yield* _mapOpenSupfileFormToState();
    } else if (event is OpenIntroForm) {
      yield* _mapOpenInforFormToState();
    } else if (event is OpenAddressForm) {
      yield* _mapOpenAddressFormToState();
    }
  }

  Stream<ProfileDetailState> _mapOpenFullnameFormToState() async* {
    yield ProfileDetailFullnameFormOpened();
  }

  Stream<ProfileDetailState> _mapOpenPhoneFormToState() async* {
    yield ProfileDetailPhoneFormOpened();
  }

  Stream<ProfileDetailState> _mapOpenEmailFormToState() async* {
    yield ProfileDetailEmailFormOpened();
  }

  Stream<ProfileDetailState> _mapOpenBirthdayFormToState() async* {
    yield ProfileDetailBirthdayFormOpened();
  }

  Stream<ProfileDetailState> _mapOpenAddressFormToState() async* {
    yield ProfileDetailAddressFormOpened();
  }

  Stream<ProfileDetailState> _mapOpenSupfileFormToState() async* {
    yield ProfileDetailSuplifeFormOpened();
  }

  Stream<ProfileDetailState> _mapOpenJobFormToState() async* {
    yield ProfileDetailJobFormOpened();
  }

  Stream<ProfileDetailState> _mapOpenInforFormToState() async* {
    yield ProfileDetailIntroFormOpened();
  }
}
