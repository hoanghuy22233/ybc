import 'package:flutter/material.dart';

class WidgetSocialButton extends StatelessWidget {
  final String image;
  final Function onTap;
  final String text;

  const WidgetSocialButton({this.image, this.onTap, this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            child: Image.asset(
              image,
              height: 40,
              width: 40,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(text)
        ],
      ),
    );
  }
}
