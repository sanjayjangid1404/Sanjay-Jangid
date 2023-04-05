
import 'package:airedge/appcomman/AppColor.dart';
import 'package:airedge/appcomman/AppFont.dart';
import 'package:airedge/appcomman/AppUtil.dart';
import 'package:airedge/appcomman/AppVariable.dart';
import 'package:airedge/appcomman/Helper/LogoutDialog.dart';
import 'package:airedge/window/LoginView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileView extends StatefulWidget{
  const ProfileView({super.key});


  @override
  State<StatefulWidget> createState()=>_ProfileView();
}

class _ProfileView extends State<ProfileView>{

  String userId = "";
  String userName = "";
  String userOwnerName = "";
  String userMobile = "";
  String userEmail = "";
  String userAccount = "";
  String userAccountIFSC = "";
  String userUpiID = "";
  String userPan = "";
  String userAadhar = "";
  String userAddress = "";
  String userCity = "";
  String userState = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((sp){




      userId = sp.getString(saveUserID)!=null ? sp.getString(saveUserID)! : "";
      userName = sp.getString(saveUserName)!=null ? sp.getString(saveUserName)! : "";
      userOwnerName = sp.getString(saveUserOwnerName)!=null ? sp.getString(saveUserOwnerName)! : "";
      userMobile = sp.getString(saveUserMobile)!=null ? sp.getString(saveUserMobile)! : "";
      userEmail = sp.getString(saveUserEmail)!=null ? sp.getString(saveUserEmail)! : "";
      userAccount = sp.getString(saveUserAccount)!=null ? sp.getString(saveUserAccount)! : "";
      userAccountIFSC = sp.getString(saveUserAccountIFSC)!=null ? sp.getString(saveUserAccountIFSC)! : "";
      userUpiID = sp.getString(saveUserUpiId)!=null ? sp.getString(saveUserUpiId)! : "";
      userPan = sp.getString(saveUserPan)!=null ? sp.getString(saveUserPan)! : "";
      userAadhar = sp.getString(saveUserAadhar)!=null ? sp.getString(saveUserAadhar)! : "";
      userCity = sp.getString(saveUserCity)!=null ? sp.getString(saveUserCity)! : "";
      userAddress = sp.getString(saveUserAddress)!=null ? sp.getString(saveUserAddress)! : "";
      userState = sp.getString(saveUserState)!=null ? sp.getString(saveUserState)! : "";

      setState(() {

      });


    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(onPressed: (){

           var dialog =  CustomAlertDialog(
                title: "Logout",
                message: "Are you sure, do you want to logout?",
                onPostivePressed: () async {

                  SharedPreferences sp = await SharedPreferences.getInstance();

                  sp.clear();

                  sp.setString(saveUserSplash, "1");

                  setState(() {

                  });

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => LoginView(),),ModalRoute.withName("login"));

                },
                positiveBtnText: 'Yes',
                negativeBtnText: 'No');
            showDialog(
                context: context,
                builder: (BuildContext context) => dialog);


          },
              icon: Icon(Icons.login_outlined))
        ],
      ),

      body: Column(
        children: [

          SizedBox(height: AppUtil.fullHeight(context)*0.03,),
          Card(
            margin: EdgeInsets.symmetric(horizontal: 15),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text("Personal Details",style: TextStyle(fontSize: 16,color: primary),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Image.asset("images/user.png",height: 50,),
                      SizedBox(width: AppUtil.fullWidth(context)*0.05,),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("name",style: TextStyle(fontSize: 12,color: Colors.black),),
                            Text(userOwnerName,style: TextStyle(fontSize: 15,color: greyColor,fontFamily: mediumFont),),

                            SizedBox(height: 4,),
                            Text("Agency name",style: TextStyle(fontSize: 12,color: Colors.black),),
                            Text(userName,style: TextStyle(fontSize: 15,color: greyColor,fontFamily: mediumFont),),
                            SizedBox(height: 4,),
                            Text("Contact",style: TextStyle(fontSize: 12,color: Colors.black),),
                            Text(userMobile,style: TextStyle(fontSize: 15,color: greyColor,fontFamily: mediumFont),),

                            SizedBox(height: 4,),
                            Text("Address",style: TextStyle(fontSize: 12,color: Colors.black),),
                            Text("$userAddress,$userCity,$userState",style: TextStyle(fontSize: 15,color: greyColor,fontFamily: mediumFont),),

                            Row(
                              children: [
                                Expanded(
                                    flex:1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(height: 4,),
                                    Text("Aadhar No.",style: TextStyle(fontSize: 12,color: Colors.black),),
                                    Text(userAadhar,style: TextStyle(fontSize: 15,color: greyColor,fontFamily: mediumFont),),
                                  ],
                                )),

                                Expanded(
                                    flex:1,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: 4,),
                                        Text("Pan No.",style: TextStyle(fontSize: 12,color: Colors.black),),
                                        Text(userPan,style: TextStyle(fontSize: 15,color: greyColor,fontFamily: mediumFont),),
                                      ],
                                    ))
                              ],
                            ),



                          ],
                        ),
                      )



                    ],
                  ),

                  SizedBox(height: 20,),

                  Text("Account Details",style: TextStyle(fontSize: 16,color: primary),),

                  SizedBox(height: 10,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex:1,
                          child: Text("Available Balance : ",style: TextStyle(fontSize: 15,color: greyColor),)),
                      Expanded(
                          flex:1,
                          child: Text("₹ 999,977,700.00",style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: mediumFont),))
                    ],
                  ),

                  SizedBox(height: 6,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex:1,
                          child: Text("Account Number : ",style: TextStyle(fontSize: 15,color: greyColor),)),
                      Expanded(
                          flex: 1,
                          child:  Text(userAccount,style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: mediumFont),))
                    ],
                  ),

                  SizedBox(height: 6,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex:1,
                          child: Text("IFSC Code : ",style: TextStyle(fontSize: 15,color: greyColor),)),
                      Expanded(
                          flex:1,
                          child: Text(userAccountIFSC,style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: mediumFont),))
                    ],
                  ),

                  SizedBox(height: 6,),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex:1,
                          child: Text("Upi Id : ",style: TextStyle(fontSize: 15,color: greyColor),)),
                      Expanded(
                          flex:1,
                          child: Text(userUpiID,style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: mediumFont),))
                    ],
                  ),


                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}