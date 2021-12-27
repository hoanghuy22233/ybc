import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/model/entity/category_menu.dart';
import 'package:ybc/presentation/common_widgets/widget_dialog.dart';

class WorkCategory extends StatefulWidget {
  MenuCategories menuCategories;
  final Function(MenuCategories, int) onCategoryClick;
  WorkCategory({this.menuCategories, this.onCategoryClick});

  @override
  _WorkCategory createState() => _WorkCategory();
}

class _WorkCategory extends State<WorkCategory> {
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (widget.menuCategories.id == 239) {
          print('haha: ${widget.menuCategories.id}');
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return WidgetDialog(
                  title: 'Thông báo',
                  image: 'assets/icons/warning.png',
                  content: "Tính năng này đang phát triển!",
                  action1: (){
                    Navigator.of(context, rootNavigator: true).pop('dialog');
                  },
                  colorButton1: Colors.blue,
                  titleAction1: 'OK',
                );
              });
          //AppNavigator.navigateListVideo();
        } else {
          widget.onCategoryClick(
              widget.menuCategories, widget.menuCategories.id);
        }
        widget.onCategoryClick(widget.menuCategories, widget.menuCategories.id);

        // AppNavigator.navigateCategoryPrimary(category);
      },
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(500),
                child: Container(
                  height: 40,
                  width: 40,
                  color: Colors.white,
                ),
              ),
              Image.network(
                "${widget.menuCategories.image}",
                height: 20,
                width: 20,
                color: AppColor.WORK_COLOR,
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "${widget.menuCategories.name}",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black45, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
