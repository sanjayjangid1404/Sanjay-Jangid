import 'package:airedge/appcomman/AppColor.dart';
import 'package:airedge/appcomman/AppFont.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final Color bgColor;
  final String? title;
  final String? message;
  final String? positiveBtnText;
  final String? negativeBtnText;
  final Function? onPostivePressed;
  final Function? onNegativePressed;
  final double circularBorderRadius;

  CustomAlertDialog({
    this.title,
    this.message,
    this.circularBorderRadius = 15.0,
    this.bgColor = Colors.white,
    this.positiveBtnText,
    this.negativeBtnText,
    this.onPostivePressed,
    this.onNegativePressed,
  })  : assert(bgColor != null),
        assert(circularBorderRadius != null);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title!) : null,
      content: message != null ? Text(message!,style: TextStyle(fontSize: 14,fontFamily: mediumFont),) : null,
      backgroundColor: bgColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circularBorderRadius)),
      actions: <Widget>[

        TextButton(
          child: Text(negativeBtnText!,style: TextStyle(color: Colors.red),),

          onPressed: () {
            Navigator.of(context).pop();
            if (onNegativePressed != null) {
              onNegativePressed!();
            }
          },
        ),


             TextButton(
          child: Text(positiveBtnText!,style: TextStyle(color: primary),),

          onPressed: () {
            if (onPostivePressed != null) {
              onPostivePressed!();
            }
          },
        )

      ],
    );
  }
}