
import 'package:airedge/appcomman/AppVariable.dart';
import 'package:airedge/view/Booking/BookingFrom.dart';
import 'package:airedge/view/Booking/BookingPayment.dart';
import 'package:airedge/view/DashBoard/BookTicket.dart';
import 'package:airedge/view/DashBoard/DashBoardView.dart';
import 'package:airedge/view/Profile/ProfileView.dart';
import 'package:airedge/window/LoginView.dart';
import 'package:airedge/window/MaimSplashView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'appcomman/AppColor.dart';
import 'appcomman/AppFont.dart';
import 'appcomman/AppRoute.dart';


void main() {


  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState()=>_MyApp();


}


class _MyApp extends State<MyApp>
{

  String userID = "";
  String userSplash = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((sp){

      SystemChannels.textInput.invokeMethod('TextInput.hide');

      userID = sp.getString(saveUserID)!=null ? sp.getString(saveUserID)! : "";
      userSplash = sp.getString(saveUserSplash)!=null ? sp.getString(saveUserSplash)! : "0";
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "Air Edge",
      debugShowCheckedModeBanner: false,
      navigatorKey: NavigationService.instance.navigationKey,
      theme: ThemeData(
        fontFamily: semiBoldFont,
        appBarTheme: AppBarTheme(
          backgroundColor: primary,
            systemOverlayStyle:SystemUiOverlayStyle(
                statusBarColor: primary,
                statusBarBrightness: Brightness.light)
        ),
        primarySwatch: Colors.blue,
      ),
      routes: {
        "/bookTicket": (BuildContext context) =>   BookTicket(),
        "/bookFrom": (BuildContext context) =>   BookingFrom(),
        "/bookPayment": (BuildContext context) =>   BookingPayment(),
        "/profileView": (BuildContext context) =>   ProfileView(),

      },
      home:userSplash!="1" ?  const MaimSplashView() : userID.isNotEmpty ? DashBoard() : LoginView(),
    );
  }
}


