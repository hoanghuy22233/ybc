import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ybc/app/constants/navigator/navigator.dart';
import 'package:ybc/presentation/common_widgets/widget_cached_image.dart';
import 'package:ybc/presentation/common_widgets/widget_circle_avatar.dart';
import 'package:ybc/presentation/common_widgets/widget_view_image.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_bloc.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_personal/bloc/profile_event.dart';
import 'package:ybc/utils/handler/http_handler.dart';
import 'package:ybc/utils/snackbar/get_snack_bar_utils.dart';

import 'bloc/profile_detail_avatar_bloc.dart';
import 'bloc/profile_detail_avatar_event.dart';
import 'bloc/profile_detail_avatar_state.dart';

class WidgetProfileDetailAvatar extends StatefulWidget {
  final String avatarUrl;

  const WidgetProfileDetailAvatar({Key key, @required this.avatarUrl})
      : super(key: key);
  @override
  _WidgetProfileDetailAvatarState createState() =>
      _WidgetProfileDetailAvatarState();
}

class _WidgetProfileDetailAvatarState extends State<WidgetProfileDetailAvatar> {
  final _picker = ImagePicker();
  PickedFile avatarFile;
  File croppedFile;
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileDetailAvatarBloc, ProfileDetailAvatarState>(
      listener: (context, state) async {
        if (state.isSubmitting) {
          GetSnackBarUtils.createProgress();
        }

        if (state.isSuccess) {
          await HttpHandler.resolve(status: state.status);
          AppNavigator.navigateBack();
          BlocProvider.of<ProfileBloc>(context).add(LoadProfile());
        }

        if (state.isFailure) {
          await HttpHandler.resolve(status: state.status);
        }
      },
      child: BlocBuilder<ProfileDetailAvatarBloc, ProfileDetailAvatarState>(
          builder: (context, state) {
        return Container(
          child: Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: FractionallySizedBox(
                widthFactor: 0.3,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Stack(
                    children: [
                      Hero(
                        tag: 'avatar',
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => WidgetViewNetworkImage(image: widget.avatarUrl)),
                            );
                          },
                          child: WidgetCircleAvatar(
                            image: WidgetCachedImage(
                              url: widget.avatarUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: (){
                              _buildSheetMethod(context);
                            },
                            child: FractionallySizedBox(
                              widthFactor: 0.3,
                              child: AspectRatio(
                                aspectRatio: 1,
                                child: WidgetCircleAvatar(
                                  border: 2,
                                  padding: EdgeInsets.all(6.0),
                                  image: Image.asset(
                                    'assets/images/img_camera2.png',
                                    fit: BoxFit.fitWidth,
                                  ),
                                  backgroundColor: Color(0xFFD6D5D5),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<Null> _onPickAvatar() async {
    avatarFile = null;
    avatarFile =
        await _picker.getImage(source: ImageSource.gallery, imageQuality: 25);
    croppedFile = File(avatarFile.path);
    if (avatarFile != null) {
      BlocProvider.of<ProfileDetailAvatarBloc>(context)
          .add(ProfileDetailAvatarUploadEvent(avatarFile: croppedFile));



    }
  }

  Future<Null> _onTakeAvatar() async {
    avatarFile = null;
    avatarFile =
    await _picker.getImage(source: ImageSource.camera, imageQuality: 25);
    croppedFile = File(avatarFile.path);
    if (avatarFile != null) {
      BlocProvider.of<ProfileDetailAvatarBloc>(context)
          .add(ProfileDetailAvatarUploadEvent(avatarFile: croppedFile));

    }
  }

  _buildSheetMethod(BuildContext context) {
    showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CupertinoActionSheet(
            title: Text('Ảnh đại diện'),
            cancelButton: CupertinoActionSheetAction(
              child: Text('Huỷ'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              CupertinoActionSheetAction(
                onPressed: () {
                  _onPickAvatar();
                },
                child: Text('Chọn ảnh có sẵn'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  _onTakeAvatar();
                },
                child: Text('Chụp ảnh mới'),
              )
            ],
          );
        });
  }
}
