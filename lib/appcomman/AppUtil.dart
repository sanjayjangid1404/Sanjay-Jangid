
import 'package:airedge/appcomman/AppFont.dart';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';


import 'AppColor.dart';



class AppUtil{

  static appLogs(Object msg){

    if(Foundation.kReleaseMode){
      // print(msg.toString()+'  RM');
    } else {
      print(msg.toString()+' DM');
    }
  }

  static showToast(String msg,String type){

    Color color= Colors.black;

    if(type=='s')
      {
        color=Colors.green;
      }
    else if(type=='e')
      {
        color=Colors.redAccent;
      }
    else if(type=='i')
    {
      color=Colors.orange;
    }

    Fluttertoast.showToast(
        msg: msg,
        fontSize: 14.0, backgroundColor: color, textColor: Colors.white);
  }




 /* static double myContainerWidth(BuildContext context)
  {

    double width=0;

    if(Responsive.isDesktop(context))
      {
        width=MediaQuery.of(context).size.width / 3;
      }
    else if(Responsive.isTabletDesktop(context))
    {
      width=MediaQuery.of(context).size.width / 2;
    }
    else if(Responsive.isTablet(context))
    {
      width=MediaQuery.of(context).size.width / 1.2;
    }
    else{
      //mobile
      width=MediaQuery.of(context).size.width;
    }

    return width;
  }*/
  
  static textStyle() {

    return  TextStyle(fontFamily: semiBoldFont,color: greyColor,fontSize: 15);
  }

  static String changeDateFormat(String value, String inType, String outType)
  {
    if(value.isEmpty) {
      return '';
    }

    DateTime tempDate =  DateFormat(inType).parse(value);
    String date = DateFormat(outType).format(tempDate);

    return date;
  }


  static bool isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }



  static fullWidth(BuildContext context)
  {
    return MediaQuery.of(context).size.width;
  }
  static fullHeight(BuildContext context)
  {
    return MediaQuery.of(context).size.height;
  }







}