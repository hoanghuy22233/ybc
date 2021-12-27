import 'package:flutter/material.dart';

class WidgetLoginLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.7,
      child:  AspectRatio(
        aspectRatio: 1,
        child: Center(
          child: Image.asset('assets/images/img_login.png'),
        ),
      ),
    );
  }
}
