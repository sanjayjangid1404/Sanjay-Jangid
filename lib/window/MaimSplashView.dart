
import 'package:airedge/appcomman/AppColor.dart';
import 'package:airedge/appcomman/AppFont.dart';
import 'package:airedge/appcomman/AppRoute.dart';
import 'package:airedge/appcomman/AppUtil.dart';
import 'package:airedge/appcomman/AppVariable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'LoginView.dart';

class MaimSplashView extends StatefulWidget{
  const MaimSplashView({super.key});


  @override
  State<StatefulWidget> createState()=>_MaimSplashView();


}
class _MaimSplashView extends State<MaimSplashView>{

  String userID = "";


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((sp){

      Future.delayed(Duration(milliseconds: 3000), () {

       /* Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => LoginView(),),
            ModalRoute.withName('login'));
*/
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,

          color: primary,


          child: Stack(
            children: [


              Padding(
                padding:  EdgeInsets.only(top: AppUtil.fullHeight(context)*0.2),
                child: Column(
                  children: [
                    Image.asset("images/logo.png",
                      width: AppUtil.fullWidth(context)*0.4),
                    SizedBox(height: 30,),
                    
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.1),
                      child: Text("Streamline Your Flight Ticket Inventory, Elevate Your Business",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 24,fontFamily:semiBoldFont,color: Colors.white),),
                      
                      
                    ),
                    
                    SizedBox(height: AppUtil.fullHeight(context)*0.02,),
                    
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.02),
                      child: Text("With an intuitive interface and powerful features, our solution allows you to efficiently track your flight inventory, manage seat availability, and more.",
                        style: TextStyle(fontSize: 12,color: Colors.white,letterSpacing: 0.3,fontFamily: regularFont),textAlign: TextAlign.center,),
                    )
                  ],
                ),
              ),


              Align(
                alignment: Alignment.bottomRight,
                child: Container(


                  height: 50,
                  child: InkWell(
                    onTap: () async {

                      SharedPreferences sp = await SharedPreferences.getInstance();

                      sp.setString(saveUserSplash, "1");
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) => LoginView(),),
                          ModalRoute.withName('login')
                      );

                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text("Get Started",style: TextStyle(fontSize: 14,color: Colors.white),),
                          SizedBox(width: 5,),
                          Icon(Icons.arrow_forward,color: Colors.white,)
                        ],
                      ),
                    ),
                  ),
                ),
              )
              ],
          ),
        ),
        
        
      ),


    );
  }
}