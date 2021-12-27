import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/change_profile/widget_form.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/information_account/widget_appbar_not_search.dart';
import 'package:ybc/presentation/screen/work_home/menu/profile/widget_appbar_profile.dart';

class ChangeProfileScreen extends StatefulWidget {
  ChangeProfileScreen({Key key}) : super(key: key);

  @override
  _ChangeProfileScreen createState() => _ChangeProfileScreen();
}

class _ChangeProfileScreen extends State<ChangeProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Expanded(
            //   flex: 3,
            //   child: _buildAppbar(),
            // ),
            Stack(
              children: [
                Container(
                  color: Colors.white,
                  // height: MediaQuery.of(context).size.height * 0.1,
                  child: _buildAppbar(),
                ),
                //
                // _buildTabBarMenu(),
              ],
            ),

            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){
                      _buildSheetMethod(context);
                    },
                    child: Align(
                      alignment: Alignment.center,
                      child: Stack(
                        children: [
                          Container(
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue[600]
                            ),
                          ),
                          Container(
                            height: 110,
                            width: 110,
                            margin: EdgeInsets.only(top: 5, left: 5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                image: new ExactAssetImage('assets/images/avatar_user.jpg'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 15),
                      child: WidgetFormProfileDetail()),
                ],
              ),
            ))
          ],
        ));
  }

  _buildAppbar() => WidgetAppbarNotSearch(
    backgroundColor: Colors.blue,
    textColor: Colors.white,
    title: "Sửa profile",
    left: [WidgetAppbarMenuBack()],
    right: [Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Text('Lưu', style: TextStyle(color: Colors.white),),
    )],
  );

  // _buildAppbar() => WidgetAppbarWithAvatar(
  //       backgroundColor: Colors.blue,
  //       textColor: Colors.white,
  //       title: "Sửa profile",
  //       left: [WidgetAppbarMenuBack()],
  //       right: [
  //         Padding(
  //           padding: const EdgeInsets.only(right: 15),
  //           child: Text(
  //             'Lưu',
  //             style: TextStyle(
  //               color: Colors.white,
  //             ),
  //           ),
  //         )
  //       ],
  //     );
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
                onPressed: () {},
                child: Text('Chọn ảnh có sẵn'),
              ),
              CupertinoActionSheetAction(
                onPressed: () {},
                child: Text('Chụp ảnh mới'),
              )
            ],
          );
        });
  }
}
