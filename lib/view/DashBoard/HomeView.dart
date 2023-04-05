
import 'dart:math';

import 'package:airedge/API/ArrayContontroller.dart';
import 'package:airedge/Model/RequestModel/FlightRequestModel.dart';
import 'package:airedge/Model/ResponseModel/CityResponse.dart';
import 'package:airedge/Model/ResponseModel/FlightListResponse.dart';
import 'package:airedge/appcomman/AppFont.dart';
import 'package:airedge/appcomman/AppRoute.dart';
import 'package:airedge/appcomman/AppUtil.dart';
import 'package:airedge/appcomman/AppVariable.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math show Random;
import '../../appcomman/AppColor.dart';

class HomeView extends StatefulWidget{
  const HomeView({super.key});


  @override
  State<StatefulWidget> createState()=>_HomeView();
}

class _HomeView extends State<HomeView>{

  List<String>locationTo = ["From City","Jaipur","Mumbai"];
  List<String>locationFrom = ["To City","Dausa","Gujarat"];
  String selectLTo = "From City";
  String selectLFrom = "To City";
  int adultCount = 0;
  int childCount = 0;
  int infantCount = 0;
  String userID = "";
  String agencyName = "";
  CityResponse cityResponse = CityResponse();
  bool isLoading  =false;
  bool isFlightView  =false;

  TextEditingController dateCt = TextEditingController();
  TextEditingController adultCt = TextEditingController(text: "0");
  TextEditingController childCt = TextEditingController(text: "0");
  TextEditingController infantCt = TextEditingController(text: "0");
  Color color = Colors.primaries[math.Random().nextInt(Colors.primaries.length)];
  FlightListResponse response = FlightListResponse();

  List<String>bangalore = ["Delhi(DEL)","Patna(PAT)","Ranchi(IXR)","Varanasi (VNS)"];
  List<String>patna = ["Bangalore (BLR)"];
  List<String>ranchi = ["Bangalore (BLR)"];
  List<String>varanasi = ["Bangalore (BLR)"];

  final _random = Random();

  List<String>cityList = [];
  List<String>cityIDList = [];




  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((sp){

      userID = sp.getString(saveUserID)!=null ? sp.getString(saveUserID)!:"";
      agencyName = sp.getString(saveUserName)!=null ? sp.getString(saveUserName)!:"";

      selectLTo = locationTo[0];
      selectLFrom = locationFrom[0];



      if(dateCt.text.isEmpty)
        {
          dateCt.text =
              DateFormat('yyyy-MM-dd').format(DateTime.now());
        }

      setState(() {

        getAllCity();


      });
    });
  }

  void getAllCity()
  {

    setState(() {
      isLoading  =true;
    });
    ArrayController controller = ArrayController();

    controller.getAllCity().then((value) {

      cityResponse = value!;
      if(cityResponse.status! && cityResponse.city!=null)
        {
          for(int i=0; i<cityResponse.city!.length; i++)
            {
              cityList.add(cityResponse.city![i].cityName.toString());
              cityIDList.add(cityResponse.city![i].id.toString());
            }
        }

      setState(() {
        isLoading  =false;
      });

      setState(() {

      });
    });
  }

  void getAllFlightData()
  {

    setState(() {
      isFlightView  = true;
    });

    FlightRequestModel requestModel = FlightRequestModel("", "", "", "");

    requestModel.date = dateCt.text.toString();
    requestModel.fromCity = getCityId(selectLFrom);
    requestModel.toCity = getCityId(selectLTo);
    requestModel.count = (adultCount+childCount+infantCount).toString();
    ArrayController controller = ArrayController();

    controller.getAllFlight(requestModel).then((value){

      response = value!;


      setState(() {
        isFlightView  = false;
      });

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome $agencyName"),
        actions: [
          IconButton(
              onPressed: (){

                NavigationService.instance.navigateTo("/profileView");
              },
              icon: Image.asset("images/profile.png",height: 22,))
        ],
      ),
      body:isLoading ? Center(child: CircularProgressIndicator(color: primary,),): ListView(
        children: [
          Stack(

            children: [
              Container(
                height: AppUtil.fullHeight(context)*0.12,
                color: primary,
                width: double.infinity,
              ),
              Column(
                children: [
                  searchContainer(),
                  SizedBox(height: 10,),
                  response.flightData!=null ? getTicketContainer():
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      bangaloreContainer(),
                      SizedBox(height: 10,),
                      patnaContainer(),

                      SizedBox(height: 10,),
                      ranchiContainer(),

                      SizedBox(height: 10,),
                      varanasiContainer(),
                    ],
                  ),


                ],
              ),




            ],
          ),
        ],
      ),

    );
  }
  Widget searchContainer()
  {
    return Column(
      children: [
        SizedBox(height: AppUtil.fullHeight(context)*0.06,),
        Card(
          margin: EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.1),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10),
                child: Container(
                  height: 45,

                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(0),
                      border: Border.all(color: Color(0xFFF1F1F1),width: 1)
                  ),
                  padding:const EdgeInsets.only(left: 10.0,right: 0,bottom: 0),

                  child:DropdownSearch<String>(

                    items: cityList,
                    showSearchBox: true,
                    showAsSuffixIcons: true,

                    dropdownSearchDecoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "From City",

                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      iconColor: Colors.white
                    ),

                    onChanged: (String? value) {

                      setState(() {
                        selectLTo = value.toString();
                      });
                    },

                  )


                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 10),
                child: Container(
                    height: 45,

                    margin: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                        border: Border.all(color: Color(0xFFF1F1F1),width: 1)
                    ),
                    padding:const EdgeInsets.only(left: 10.0,right: 0,bottom: 0),

                    child:DropdownSearch<String>(

                      items: cityList,
                      showSearchBox: true,
                      showAsSuffixIcons: true,

                      dropdownSearchDecoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "To City",

                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          iconColor: Colors.white
                      ),

                      onChanged: (String? value) {

                        setState(() {
                          selectLFrom = value.toString();
                        });
                      },

                    )


                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 0),
                child: SizedBox(
                  height: 50,
                  child: TextFormField(
                    style:AppUtil.textStyle(),
                    controller: dateCt,
                    textInputAction: TextInputAction.next,
                    readOnly: true,
                    onTap: () async {
                      await showDatePicker(
                        context: context,
                        builder: (context, child) {
                          return Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: ColorScheme.light(
                                primary:  Color(0xFF161e36), // <-- SEE HERE
                                onPrimary:  Colors.white, // <-- SEE HERE
                                onSurface: Colors.blueAccent, // <-- SEE HERE
                              ),
                            ), child: child!,
                          );
                        },

                        initialDate: DateTime.now(),
                        firstDate: DateTime(2015),
                        lastDate: DateTime(2025),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          dateCt.text =
                              DateFormat('yyyy-MM-dd').format(selectedDate);
                        }
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                        fillColor: Colors.white,
                        filled: true,

                        border: const OutlineInputBorder(

                        ),
                        focusedBorder:  OutlineInputBorder(
                            borderSide:   BorderSide(
                                color:  Color(0xFFF1F1F1),
                                width: 2
                            ),
                            /*border: Border.all(color: Color(0xFFF1F1F1),width: 1)*/
                            borderRadius: BorderRadius.circular(0)
                        ),
                        enabledBorder:  OutlineInputBorder(
                            borderSide:  BorderSide(
                              color:  Color(0xFFF1F1F1),
                            ),
                            borderRadius: BorderRadius.circular(0)
                        ),
                        hintText: "DD/MM/YYYY",
                        hintStyle: const TextStyle(
                            fontSize: 15,
                            fontFamily: semiBoldFont)
                    ),

                  ),
                ),
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Adult (12+ Year)",style: TextStyle(fontSize: 14,color: primary,fontFamily: mediumFont),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Expanded(
                                  flex:2,
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        if(adultCount>0) {
                                          print("click-");
                                          adultCount--;
                                          adultCt = TextEditingController(text: adultCount.toString());
                                        }
                                      });
                                    },
                                    child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:Border.all(color: Color(0xFFF1F1F1),width: 1)
                                        ),
                                        child: Text("-")),
                                  )),
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    style:AppUtil.textStyle(),
                                    controller: adultCt,
                                    textInputAction: TextInputAction.next,
                                    textAlign: TextAlign.center,


                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                                        fillColor: Colors.white,
                                        filled: true,

                                        border: const OutlineInputBorder(

                                        ),
                                        focusedBorder:  OutlineInputBorder(
                                            borderSide:   BorderSide(
                                                color:  Color(0xFFF1F1F1),
                                                width: 2
                                            ),
                                            /*border: Border.all(color: Color(0xFFF1F1F1),width: 1)*/
                                            borderRadius: BorderRadius.circular(0)
                                        ),
                                        enabledBorder:  OutlineInputBorder(
                                            borderSide:  BorderSide(
                                              color:  Color(0xFFF1F1F1),
                                            ),
                                            borderRadius: BorderRadius.circular(0)
                                        ),
                                        hintText: "",
                                        hintStyle: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: semiBoldFont)
                                    ),

                                  ),
                                ),),

                              Expanded(
                                  flex:2,
                                  child: InkWell(
                                    onTap: (){

                                      setState(() {
                                        print("click");
                                        adultCount++;

                                        adultCt = TextEditingController(text: adultCount.toString());
                                      });




                                    },
                                    child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:Border.all(color: Color(0xFFF1F1F1),width: 1)
                                        ),
                                        child: Text("+")),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Child (2 - 12 Year)",style: TextStyle(fontSize: 14,color: primary,fontFamily: mediumFont),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Expanded(
                                  flex:2,
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {

                                        if(childCount>0)
                                        {
                                          childCount--;
                                        }



                                        childCt = TextEditingController(text: childCount.toString());
                                      });
                                    },
                                    child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:Border.all(color: Color(0xFFF1F1F1),width: 1)
                                        ),
                                        child: Text("-")),
                                  )),
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    style:AppUtil.textStyle(),
                                    controller: childCt,
                                    readOnly: true,
                                    textAlign: TextAlign.center,
                                    textInputAction: TextInputAction.next,


                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                                        fillColor: Colors.white,
                                        filled: true,

                                        border: const OutlineInputBorder(

                                        ),
                                        focusedBorder:  OutlineInputBorder(
                                            borderSide:   BorderSide(
                                                color:  Color(0xFFF1F1F1),
                                                width: 2
                                            ),
                                            /*border: Border.all(color: Color(0xFFF1F1F1),width: 1)*/
                                            borderRadius: BorderRadius.circular(0)
                                        ),
                                        enabledBorder:  OutlineInputBorder(
                                            borderSide:  BorderSide(
                                              color:  Color(0xFFF1F1F1),
                                            ),
                                            borderRadius: BorderRadius.circular(0)
                                        ),
                                        hintText: "",
                                        hintStyle: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: semiBoldFont)
                                    ),

                                  ),
                                ),),

                              Expanded(
                                  flex:2,
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {

                                        childCount++;

                                        childCt = TextEditingController(text: childCount.toString());
                                      });
                                    },
                                    child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:Border.all(color: Color(0xFFF1F1F1),width: 1)
                                        ),
                                        child: Text("+")),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    flex:1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Infant",style: TextStyle(fontSize: 14,color: primary,fontFamily: mediumFont),),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Expanded(
                                  flex:2,
                                  child: InkWell(
                                    onTap: (){
                                      setState(() {
                                        if(infantCount>0) {
                                          print("click-");
                                          infantCount--;
                                          infantCt = TextEditingController(text: infantCount.toString());
                                        }
                                      });
                                    },
                                    child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:Border.all(color: Color(0xFFF1F1F1),width: 1)
                                        ),
                                        child: Text("-")),
                                  )),
                              Expanded(
                                flex: 4,
                                child: SizedBox(
                                  height: 50,
                                  child: TextFormField(
                                    style:AppUtil.textStyle(),
                                    controller: infantCt,
                                    textInputAction: TextInputAction.next,
                                    textAlign: TextAlign.center,


                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),

                                        fillColor: Colors.white,
                                        filled: true,

                                        border: const OutlineInputBorder(

                                        ),
                                        focusedBorder:  OutlineInputBorder(
                                            borderSide:   BorderSide(
                                                color:  Color(0xFFF1F1F1),
                                                width: 2
                                            ),
                                            /*border: Border.all(color: Color(0xFFF1F1F1),width: 1)*/
                                            borderRadius: BorderRadius.circular(0)
                                        ),
                                        enabledBorder:  OutlineInputBorder(
                                            borderSide:  BorderSide(
                                              color:  Color(0xFFF1F1F1),
                                            ),
                                            borderRadius: BorderRadius.circular(0)
                                        ),
                                        hintText: "",
                                        hintStyle: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: semiBoldFont)
                                    ),

                                  ),
                                ),),

                              Expanded(
                                  flex:2,
                                  child: InkWell(
                                    onTap: (){

                                      setState(() {
                                        infantCount++;
                                        infantCt = TextEditingController(text: infantCount.toString());
                                      });




                                    },
                                    child: Container(
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            border:Border.all(color: Color(0xFFF1F1F1),width: 1)
                                        ),
                                        child: Text("+")),
                                  )),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex:1,
                    child: SizedBox(),
                  )
                ],
              ),

              SizedBox(height: 10,),

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
                      if(selectLFrom.isEmpty)
                        {
                          AppUtil.showToast("Please select from city", "i");
                        }
                      else if(selectLTo.isEmpty)
                        {
                          AppUtil.showToast("Please select to city", "i");
                        }
                      else
                      {
                        getAllFlightData();
                      }



                      setState(() {

                      });

                    },
                    child: Text("Search",style: TextStyle(fontSize: 14),)
                ),
              ),

              SizedBox(height: 10,),
            ],
          ),
        )
      ],
    );
  }

  Widget bangaloreContainer()
  {
    return Container(
      width: double.infinity,
      child: Card(

        margin: EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.05),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
              child: Text("Bangalore (BLR)",style: TextStyle(fontSize: 18,color: Colors.black),),
            ),

            Wrap(
              direction: Axis.horizontal,
              children: bangalore.map((i) => InkWell(

                onTap: (){
                  NavigationService.instance.navigateTo("/bookTicket");
                },
                child: Container(

                  padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                  margin: EdgeInsets.symmetric(horizontal: 6,vertical: 8),
                  decoration: BoxDecoration(

                    borderRadius: BorderRadius.circular(0),
                    color: Color.fromRGBO(
                      _random.nextInt(255),
                      _random.nextInt(255),
                      _random.nextInt(255),
                      1,
                    ),
                  ),
                  child: Text(i,style: TextStyle(fontFamily: mediumFont,fontSize: 16,color: Colors.white),),
                ),
              )).toList(),
            ),
            SizedBox(height: 10,)

          ],
        ),
      ),
    );
  }

  Widget patnaContainer()
  {
    return Container(
      width: double.infinity,
      child: Card(

        margin: EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.05),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
              child: Text("Patna (PAT)",style: TextStyle(fontSize: 18,color: Colors.black),),
            ),

            Wrap(
              direction: Axis.horizontal,
              children: patna.map((i) => Container(

                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                margin: EdgeInsets.symmetric(horizontal: 6,vertical: 8),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(0),
                  color: Color.fromRGBO(
                    _random.nextInt(255),
                    _random.nextInt(255),
                    _random.nextInt(255),
                    1,
                  ),
                ),
                child: Text(i,style: TextStyle(fontFamily: mediumFont,fontSize: 16,color: Colors.white),),
              )).toList(),
            ),
            SizedBox(height: 10,)

          ],
        ),
      ),
    );
  }

  Widget ranchiContainer()
  {
    return Container(
      width: double.infinity,
      child: Card(

        margin: EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.05),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
              child: Text("Ranchi (IXR)",style: TextStyle(fontSize: 18,color: Colors.black),),
            ),

            Wrap(
              direction: Axis.horizontal,
              children: ranchi.map((i) => Container(

                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                margin: EdgeInsets.symmetric(horizontal: 6,vertical: 8),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(0),
                  color: Color.fromRGBO(
                    _random.nextInt(255),
                    _random.nextInt(255),
                    _random.nextInt(255),
                    1,
                  ),
                ),
                child: Text(i,style: TextStyle(fontFamily: mediumFont,fontSize: 16,color: Colors.white),),
              )).toList(),
            ),
            SizedBox(height: 10,)

          ],
        ),
      ),
    );
  }

  Widget varanasiContainer()
  {
    return Container(
      width: double.infinity,
      child: Card(

        margin: EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.05),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 10),
              child: Text("Varanasi (VNS)",style: TextStyle(fontSize: 18,color: Colors.black),),
            ),

            //sanjay

            Wrap(
              direction: Axis.horizontal,
              children: varanasi.map((i) => Container(

                padding: EdgeInsets.symmetric(horizontal: 8,vertical: 6),
                margin: EdgeInsets.symmetric(horizontal: 6,vertical: 8),
                decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(0),
                  color: Color.fromRGBO(
                    _random.nextInt(255),
                    _random.nextInt(255),
                    _random.nextInt(255),
                    1,
                  ),
                ),
                child: Text(i,style: TextStyle(fontFamily: mediumFont,fontSize: 16,color: Colors.white),),
              )).toList(),
            ),
            SizedBox(height: 10,)

          ],
        ),
      ),
    );
  }

  Widget getTicketContainer()
  {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
      ),

      child: ListView.builder(
        itemCount: response.flightData!=null ? response.flightData!.length:0,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              NavigationService.instance.navigateToArgVal("/bookFrom",'home',response.flightData![index]);
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("images/logo.png",height: 35,),
                      Text(response.flightData![index].airline!,
                        style: TextStyle(fontSize: 14,color: Colors.black),),
                      Text(response.flightData![index].agentPrice!,
                        style: TextStyle(fontSize: 14,color: Colors.black),)
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(response.flightData![index].fromCity!,style: TextStyle(fontSize: 20,color: primary),),
                          SizedBox(height: 4,),
                          Text(response.flightData![index].departureTime!,style: TextStyle(fontSize: 16,color: primary.withOpacity(0.6)),),
                        ],
                      ),
                      Column(

                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                              decoration:BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: primary
                              ),
                              child: Text("11h 20M",style: TextStyle(fontSize: 14,color: Colors.white),)),
                          SizedBox(height: 4,),
                          Text("NON-STOP",style: TextStyle(fontSize: 16,color: primary.withOpacity(0.6)),),

                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(response.flightData![index].toCity!,style: TextStyle(fontSize: 20,color: primary),),
                          SizedBox(height: 4,),
                          Text(response.flightData![index].arrivalTime!,style: TextStyle(fontSize: 16,color: primary.withOpacity(0.6)),),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 8,),

                Visibility(
                  visible: index==9 ? false : true,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [

                      /* Transform.rotate(
                        angle: 90 * math.pi / 180,
                        child: MyArc(diameter: 30)),*/

                      Container(
                          height: 30,
                          width:15,
                          decoration:  BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomRight: Radius.circular(30),
                              ))),
                      Expanded(child: DottedLine()),
                      Container(
                          height: 30,
                          width:15,
                          decoration:  BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30),
                              ))),
                    ],
                  ),
                )

              ],
            ),
          );
        },),
    );
  }

  String getCityId(String cityName)
  {
    String cityID = "";

    for(int i=0; i<cityList.length; i++)
      {
        if(cityName ==cityList[i])
          {
            cityID  = cityIDList[i];
          }
      }
    return cityID;
  }
}