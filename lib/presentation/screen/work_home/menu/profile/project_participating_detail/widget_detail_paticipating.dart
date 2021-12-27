import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ybc/app/constants/barrel_constants.dart';
import 'package:ybc/presentation/common_widgets/barrel_common_widgets.dart';

class WidgetMemberParticipating extends StatefulWidget {
  final String image;
  final String fullName, position ,job;
  final Function ontap;

  WidgetMemberParticipating(
      {Key key,
      this.image = 'assets/images/ybc.png',
      this.ontap,
      this.fullName,
      this.position,
      this.job
      })
      : super(key: key);

  @override
  _WidgetMemberParticipatingState createState() => _WidgetMemberParticipatingState();
}

class _WidgetMemberParticipatingState extends State<WidgetMemberParticipating> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Container(
          padding: EdgeInsets.all(0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.all(5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(widget.image),
                    // child: Image.network(state?.user?.image ??
                    //     'https://picsum.photos/250?image=9', fit: BoxFit.fill,),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.fullName, style: AppStyle.DEFAULT_SMALL_BOLD.copyWith(color: Colors.black), ),
                      Text('Chức vụ: ${widget.position}', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black), ),
                      Text('Nghề nghiệp: ${widget.job}', style: AppStyle.DEFAULT_SMALL.copyWith(color: Colors.black), ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }

}


