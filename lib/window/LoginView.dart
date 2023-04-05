
import 'package:airedge/API/ObjectController.dart';
import 'package:airedge/Model/RequestModel/LoginRequestModel.dart';
import 'package:airedge/Model/ResponseModel/LoginResponse.dart';
import 'package:airedge/appcomman/AppColor.dart';
import 'package:airedge/appcomman/AppFont.dart';
import 'package:airedge/appcomman/AppVariable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../appcomman/AppUtil.dart';
import '../view/DashBoard/DashBoardView.dart';

class LoginView extends StatefulWidget{
  const LoginView({super.key});


  @override
  State<StatefulWidget> createState()=>_LoginView();
}
class _LoginView  extends State<LoginView>{
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  bool     _passwordVisible = false;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: primary,
          child: Stack(
            children: [

              Container(
                margin: EdgeInsets.only(
                    top: AppUtil.fullHeight(context)*0.3,
                    left: AppUtil.fullWidth(context)*0.03,right:  AppUtil.fullWidth(context)*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                    boxShadow: [new BoxShadow(
                      color: Colors.white,
                      blurRadius: 1.0,
                    ),]
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _emailPasswordWidget()


                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.only(top: AppUtil.fullHeight(context)*0.25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("images/logo.png",height: AppUtil.fullHeight(context)*0.1,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[

        SizedBox(height: AppUtil.fullHeight(context)*0.05,),
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 0),
          child: SizedBox(
            height: 50,
            child: TextFormField(
              style:AppUtil.textStyle(),
              controller: idController,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10),

                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon:  Padding(
                    padding: EdgeInsets.symmetric(horizontal:15.0),
                    child: Icon(
                      Icons.person_outline,
                      color: greyColor,
                    ),
                  ),
                  border: const OutlineInputBorder(

                  ),
                  focusedBorder:  OutlineInputBorder(
                      borderSide:   BorderSide(
                          color: primary,
                          width: 2
                      ),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  enabledBorder:  OutlineInputBorder(
                      borderSide:  BorderSide(
                        color: greyColor,
                      ),
                      borderRadius: BorderRadius.circular(0)
                  ),
                  hintText: "User Name",
                  hintStyle: const TextStyle(
                      fontSize: 15,
                      fontFamily: semiBoldFont)
              ),

            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10,right: 10,top: 14,bottom: 14),
          // padding: const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 0),
          child: SizedBox(
            height: 50,
            child: TextFormField(
              textInputAction: TextInputAction.go,
              onFieldSubmitted: (value) {
                // checkValidation();
              },
              style:AppUtil.textStyle(),
              obscureText: !_passwordVisible,

              controller: passController,

              // focusNode: passwordNode,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                fillColor: Colors.white,
                filled: true,
                prefixIcon:  Padding(
                  padding: EdgeInsets.symmetric(horizontal:15.0),
                  child: Icon(
                    Icons.lock_outline,
                    color: greyColor,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    // Based on passwordVisible state choose the icon
                    _passwordVisible?
                    Icons.visibility:Icons.visibility_off
                    ,
                    color: _passwordVisible?primary:
                    greyColor,
                  ),
                  onPressed: () {
                    // Update the state i.e. toggle the state of passwordVisible variable
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),
                  ),
                ),
                focusedBorder:  OutlineInputBorder(
                    borderSide:   BorderSide(
                        color: primary,
                        width: 2
                    ),
                    borderRadius: BorderRadius.circular(0)
                ),
                enabledBorder:  OutlineInputBorder(
                    borderSide:  BorderSide(
                      color: greyColor,
                    ),
                    borderRadius: BorderRadius.circular(0
                    )
                ),
                hintText: "Password",
                hintStyle: const TextStyle(fontSize: 15,fontFamily: semiBoldFont),

              ),

            ),
          ),
        ),
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                primary: primary, // Change the color here..
                elevation: 0,
                // ...
              ),

              onPressed: () {
                if(idController.text.isEmpty)
                  {
                    AppUtil.showToast("Enter Name", "e");
                  }
                else  if(passController.text.isEmpty)
                  {
                    AppUtil.showToast("Enter Password", "e");
                  }
                else
                {

                  setState(() {
                    isLoading = true;
                  });

                  LoginRequestModel requestModel = LoginRequestModel("","");

                  requestModel.username = idController.text.toString().trim();
                  requestModel.password = passController.text.toString().trim();

                  ObjectController controller = ObjectController();

                  controller.loginCallAPI(requestModel).then((value) async {

                    LoginResponse response = value;

                    if(response.status! && response.user!=null)
                      {
                        SharedPreferences sp = await SharedPreferences.getInstance();

                        sp.setString(saveUserID, response.user!.id.toString());
                        sp.setString(saveUserName, response.user!.agencyName.toString());
                        sp.setString(saveUserOwnerName, response.user!.ownerName.toString());
                        sp.setString(saveUserMobile, response.user!.mobileNumber.toString());
                        sp.setString(saveUserEmail, response.user!.agencyEmail.toString());
                        sp.setString(saveUserAccount, response.user!.accountNumber.toString());
                        sp.setString(saveUserAccountIFSC, response.user!.ifscCode.toString());
                        sp.setString(saveUserUpiId, response.user!.upiId.toString());
                        sp.setString(saveUserPan, response.user!.panNumber.toString());
                        sp.setString(saveUserAadhar, response.user!.aadharNumber.toString());
                        sp.setString(saveUserStatus, response.user!.isActive.toString());
                        sp.setString(saveUserAddress, response.user!.agencyAddress.toString());
                        sp.setString(saveUserCity, response.user!.agencyCity.toString());
                        sp.setString(saveUserState, response.user!.agencyState.toString());


                        AppUtil.showToast(response.message!, "s");

                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashBoard(),),ModalRoute.withName("dashboard"));

                      }

                    else
                    {

                      AppUtil.showToast(response.message!, "e");

                    }

                    setState(() {
                      isLoading = false;
                    });
                  });


                }

              },
              child:isLoading ? Center(child: CircularProgressIndicator(color: Colors.white,),): Text("Login",style: TextStyle(fontSize: 14),)
          ),
        ),

        SizedBox(height: 10,)





      ],
    );
  }
}