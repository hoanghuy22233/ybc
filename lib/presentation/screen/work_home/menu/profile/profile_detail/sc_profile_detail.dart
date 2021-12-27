import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:ybc/model/repo/barrel_repo.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/common_widgets/widget_spacer.dart';
import 'package:ybc/presentation/screen/work_home/common_widget/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_state.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/profile_detail/widget_update_information_form.dart';
import 'package:ybc/utils/locale/app_localization.dart';

import 'avatar/bloc/profile_detail_avatar_bloc.dart';
import 'bloc/bloc.dart';

class ProfileDetailScreen extends StatefulWidget {
  @override
  _ProfileDetailScreenState createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen>
    with AutomaticKeepAliveClientMixin<ProfileDetailScreen> {
  PanelController _panelController = new PanelController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProfileBloc>(context).add(RefreshProfile());
  }

  void openLoading() async {
    BlocProvider.of<ProfileBloc>(context).add(RefreshProfile());
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var userRepository = RepositoryProvider.of<UserRepository>(context);
    //openLoading();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProfileDetailAvatarBloc(userRepository: userRepository),
        ),
      ],
      child: BlocBuilder<ProfileBloc, ProfileState>(builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            top: true,
            child: Container(
              child: _buildContent(state)
            ),
          ),
        );
      }),
    );
  }

  _buildContent(ProfileState state) {
    if (state is ProfileLoaded) {
      return _buildMenu(state);
    } else if (state is ProfileLoading) {
      return Center(
        child: Container(
          height: 100,
          width: 100,
          child: Lottie.asset(
            'assets/lottie/trail_loading.json',
          ),
        ),
      );
    } else if (state is ProfileNotLoaded) {
      return Center(
        child: Text('${state.error}'),
      );
    } else {
      return Center(
        child: Text('Unknown state'),
      );
    }
  }

  Widget _buildMenu(ProfileLoaded state) {
    return RefreshIndicator(
      onRefresh: () async {
        BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
        await Future.delayed(Duration(seconds: 3));
        return true;
      },
      color: Colors.blue,
      backgroundColor: Colors.white,
      child: Container(
        color: Colors.white,
        child: WidgetUpdateInformationBlocForm(
            image: state.user.image,
            name: state.user.name ?? '',
            gender: state.user.gender ?? '0',
            phone: state.user.tel ?? '',
            email: state.user.email ?? '',
            address: state.user.address ?? '',
            dob: state?.user?.birthday != null
                ? DateFormat("dd-MM-yyyy").format(
                    DateFormat("yyyy-MM-dd").parse(state?.user?.birthday))
                : '',
            job: state.user.job ?? '',
            intro: state.user.intro ?? ''
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
