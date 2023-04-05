
import 'package:airedge/Model/ResponseModel/FlightListResponse.dart';
import 'package:airedge/appcomman/AppColor.dart';
import 'package:airedge/appcomman/AppFont.dart';
import 'package:airedge/appcomman/AppRoute.dart';
import 'package:airedge/appcomman/AppUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingFrom extends StatefulWidget{
  const BookingFrom({super.key});


  @override
  State<StatefulWidget> createState()=>_BookingFrom();
}
class _BookingFrom extends State<BookingFrom>{

  List<String>titleList = ["Mr","Mrs","Ms"];
  List<String>childMasterTitle = ["Master","Mrs"];
  List<String>infantMasterTitle = ["Master","Baby"];
  List<String>selectTitle = ["Mr"];
  List<String>selectChildTitle = ["Master"];
  List<String>selectInfantTitle = ["Master"];
  TextEditingController cNameCT =TextEditingController();
  TextEditingController cMobileCT =TextEditingController();
  TextEditingController cEmailCT =TextEditingController();
  List<TextEditingController>travellerFirstCt = [TextEditingController(text: "")];
  List<TextEditingController>travellerLastCt = [TextEditingController(text: "")];

  List<TextEditingController>childFirstCt = [TextEditingController(text: "")];
  List<TextEditingController>childLastCt = [TextEditingController(text: "")];

  List<TextEditingController>infantFirstCt = [TextEditingController(text: "")];
  List<TextEditingController>infantLastCt = [TextEditingController(text: "")];
  List<TextEditingController>infantWithCt = [TextEditingController(text: "")];
  List<TextEditingController>infantDOBCt = [TextEditingController(text: "")];
  List<bool>selectValue   = [false];
  List<bool>selectChildValue   = [false];
  List<bool>selectInfantValue   = [false];
  int travellerCount = 1;
  int childCount = 1;
  int infantCount = 1;
  bool childValue = false;
  bool infant = false;
  String fromPage = "";

  FlightData data = FlightData();

  @override
  Widget build(BuildContext context) {

    final argument = ModalRoute.of(context)?.settings.arguments as Map;

    fromPage = argument['arg'];

    data = argument['data'];
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("Book Flight"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("images/airlogo.png",height: 35,),
                        Text("INDIAN AIRLINE",style: TextStyle(fontSize: 14,color: Colors.black),),
                        Text("Price",style: TextStyle(fontSize: 14,color: Colors.black),)
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
                            Text("JFK",style: TextStyle(fontSize: 20,color: primary),),
                            SizedBox(height: 4,),
                            Text("13:00",style: TextStyle(fontSize: 16,color: primary.withOpacity(0.6)),),
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
                            Text("JFK",style: TextStyle(fontSize: 20,color: primary),),
                            SizedBox(height: 4,),
                            Text("13:00",style: TextStyle(fontSize: 16,color: primary.withOpacity(0.6)),),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 8,),



                ],
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                    child: Text("CUSTOMER DETAILS",style: TextStyle(fontSize: 15,color: primary),),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                    child: SizedBox(
                      height: 45,
                      child: TextFormField(
                        style:AppUtil.textStyle(),
                        controller: cNameCT,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                            fillColor: Colors.white,
                            filled: true,

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
                            hintText: "Customer Name*",
                            hintStyle: const TextStyle(
                                fontSize: 15,
                                fontFamily: semiBoldFont)
                        ),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 0),
                    child: SizedBox(
                      height: 45,
                      child: TextFormField(
                        style:AppUtil.textStyle(),
                        controller: cMobileCT,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                            fillColor: Colors.white,
                            filled: true,

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
                            hintText: "Customer Mobile*",
                            hintStyle: const TextStyle(
                                fontSize: 15,
                                fontFamily: semiBoldFont)
                        ),

                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 10),
                    child: SizedBox(
                      height: 45,
                      child: TextFormField(
                        style:AppUtil.textStyle(),
                        controller: cEmailCT,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                            fillColor: Colors.white,
                            filled: true,

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
                            hintText: "Customer Email*",
                            hintStyle: const TextStyle(
                                fontSize: 15,
                                fontFamily: semiBoldFont)
                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ),

            Card(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 4),
                    child: Text("TRAVELLER INFORMATION",style: TextStyle(fontSize: 15,color: primary),),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                    child: Text("Please make sure the details entered below are exactly as per Traveller's ID",
                      style: TextStyle(fontSize: 12,color: Colors.red,fontFamily: mediumFont),),
                  ),

                  SizedBox(height: 10,),

                  ListView.builder(
                    itemCount: travellerCount,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {

                    return  Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                                child:  Container(
                                  height: 45,

                                  margin: EdgeInsets.symmetric(horizontal: 0),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0),
                                      border: Border.all(color: greyColor,width: 1)
                                  ),
                                  padding:const EdgeInsets.symmetric(horizontal: 10.0),

                                  child: DropdownButton(
                                    hint: Text("Title ",
                                      style: TextStyle(fontSize: 14,color: greyColor,fontFamily: regularFont),),
                                    dropdownColor: Colors.white,
                                    icon: Icon(Icons.arrow_drop_down,color: primary,),
                                    iconSize: 25,
                                    isExpanded: true,
                                    underline: SizedBox(),
                                    style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: semiBoldFont),
                                    items: titleList.map((String language) {
                                      return  DropdownMenuItem<String>(
                                        child:  Text(language),
                                        value: language,
                                      );
                                    }).toList(),
                                    value: selectTitle[index],
                                    onChanged: (String? value) {

                                      setState(() {
                                        selectTitle[index] = value.toString();
                                      });
                                    },),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                  padding: const EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 0),
                                  child: CheckboxListTile(
                                    contentPadding: EdgeInsets.zero,
                                    visualDensity: VisualDensity(horizontal: -4,vertical: -4),
                                    controlAffinity: ListTileControlAffinity.leading,
                                    activeColor: primary,

                                    title: Text("Wheelchair",
                                      style: TextStyle(fontSize: 13,color: primary),),
                                    value: selectValue[index], onChanged: (bool? value) {

                                    setState(() {
                                      selectValue[index] = value!;
                                    });
                                  },
                                  )
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                                child: SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    style:AppUtil.textStyle(),
                                    controller: travellerFirstCt[index],
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                                        fillColor: Colors.white,
                                        filled: true,

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
                                        hintText: "First Name",
                                        hintStyle: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: semiBoldFont)
                                    ),

                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                                child: SizedBox(
                                  height: 45,
                                  child: TextFormField(
                                    style:AppUtil.textStyle(),
                                    controller: travellerLastCt[index],
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                                        fillColor: Colors.white,
                                        filled: true,

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
                                        hintText: "Last Name",
                                        hintStyle: const TextStyle(
                                            fontSize: 15,
                                            fontFamily: semiBoldFont)
                                    ),

                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            travellerCount++;

                            selectTitle.add("Mr");
                            selectValue.add(false);
                            travellerFirstCt.add(TextEditingController(text: ''));
                            travellerLastCt.add(TextEditingController(text: ''));

                            print(selectTitle);
                            print(selectValue);

                          });
                        },
                        child: Container(

                          padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: primary,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add,color: Colors.white,),
                              SizedBox(width: 4,),
                              Text("Add",style: TextStyle(fontSize: 13,color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 6,),

                      InkWell(
                        onTap: (){
                          setState(() {



                            if(travellerCount>1) {
                              selectTitle.removeAt(travellerCount-1);
                              selectValue.removeAt(travellerCount-1);
                              travellerFirstCt.removeAt(travellerCount-1);
                              travellerLastCt.removeAt(travellerCount-1);
                              print(selectTitle);
                              print(selectValue);
                              travellerCount--;

                            }
                          });
                        },
                        child: Container(

                          padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.red,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.remove,color: Colors.white,),
                              SizedBox(width: 4,),
                              Text("Remove",style: TextStyle(fontSize: 13,color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,)



                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Row(
                children: [
                  Expanded(
                  flex: 1,
                  child: Padding(
                      padding: const EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 0),
                      child: CheckboxListTile(
                        contentPadding: EdgeInsets.zero,
                        visualDensity: VisualDensity(horizontal: -4,vertical: -4),
                        controlAffinity: ListTileControlAffinity.leading,
                        activeColor: primary,

                        title: Text("Add Child",
                          style: TextStyle(fontSize: 13,color: primary),),
                        value: childValue, onChanged: (bool? value) {

                        setState(() {
                          childValue = value!;
                        });
                      },
                      )
                  ),
                ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 0),
                        child: CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity(horizontal: -4,vertical: -4),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: primary,

                          title: Text("Add Infant",
                            style: TextStyle(fontSize: 13,color: primary),),
                          value: infant, onChanged: (bool? value) {

                          setState(() {
                            infant = value!;
                          });
                        },
                        )
                    ),
                  ),
                ],
              ),
            ),

            Visibility(
              visible: childValue,
              child: Card(
              margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 4),
                    child: Text("CHILDREN INFORMATION",style: TextStyle(fontSize: 15,color: primary),),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                    child: Text("Please make sure the details entered below are exactly as per Traveller's ID",
                      style: TextStyle(fontSize: 12,color: Colors.red,fontFamily: mediumFont),),
                  ),

                  SizedBox(height: 10,),

                  ListView.builder(
                    itemCount: childCount,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {

                      return  Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                                  child:  Container(
                                    height: 45,

                                    margin: EdgeInsets.symmetric(horizontal: 0),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(0),
                                        border: Border.all(color: greyColor,width: 1)
                                    ),
                                    padding:const EdgeInsets.symmetric(horizontal: 10.0),

                                    child: DropdownButton(
                                      hint: Text("Title ",
                                        style: TextStyle(fontSize: 14,color: greyColor,fontFamily: regularFont),),
                                      dropdownColor: Colors.white,
                                      icon: Icon(Icons.arrow_drop_down,color: primary,),
                                      iconSize: 25,
                                      isExpanded: true,
                                      underline: SizedBox(),
                                      style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: semiBoldFont),
                                      items: childMasterTitle.map((String language) {
                                        return  DropdownMenuItem<String>(
                                          child:  Text(language),
                                          value: language,
                                        );
                                      }).toList(),
                                      value: selectChildTitle[index],
                                      onChanged: (String? value) {

                                        setState(() {
                                          selectChildTitle[index] = value.toString();
                                        });
                                      },),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding: const EdgeInsets.only(left: 0, right: 10, top: 10, bottom: 0),
                                    child: CheckboxListTile(
                                      contentPadding: EdgeInsets.zero,
                                      visualDensity: VisualDensity(horizontal: -4,vertical: -4),
                                      controlAffinity: ListTileControlAffinity.leading,
                                      activeColor: primary,

                                      title: Text("Wheelchair",
                                        style: TextStyle(fontSize: 13,color: primary),),
                                      value: selectChildValue[index], onChanged: (bool? value) {

                                      setState(() {
                                        selectChildValue[index] = value!;
                                      });
                                    },
                                    )
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                                  child: SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      style:AppUtil.textStyle(),
                                      controller: childFirstCt[index],
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                                          fillColor: Colors.white,
                                          filled: true,

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
                                          hintText: "First Name",
                                          hintStyle: const TextStyle(
                                              fontSize: 15,
                                              fontFamily: semiBoldFont)
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                                  child: SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      style:AppUtil.textStyle(),
                                      controller: childLastCt[index],
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                                          fillColor: Colors.white,
                                          filled: true,

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
                                          hintText: "Last Name",
                                          hintStyle: const TextStyle(
                                              fontSize: 15,
                                              fontFamily: semiBoldFont)
                                      ),

                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },),

                  SizedBox(height: 10,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: (){
                          setState(() {
                            childCount++;

                            selectChildTitle.add("Master");
                            selectChildValue.add(false);

                            childFirstCt.add(TextEditingController(text: ''));
                            childLastCt.add(TextEditingController(text: ''));

                            print(selectChildTitle);
                            print(selectChildValue);

                          });
                        },
                        child: Container(

                          padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: primary,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.add,color: Colors.white,),
                              SizedBox(width: 4,),
                              Text("Add",style: TextStyle(fontSize: 13,color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 6,),

                      InkWell(
                        onTap: (){
                          setState(() {



                            if(childCount>1) {
                              selectChildTitle.removeAt(childCount-1);
                              selectChildValue.removeAt(childCount-1);
                              childFirstCt.removeAt(childCount-1);
                              childLastCt.removeAt(childCount-1);
                              print(selectChildTitle);
                              print(selectChildValue);
                              childCount--;

                            }
                          });
                        },
                        child: Container(

                          padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.red,
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.remove,color: Colors.white,),
                              SizedBox(width: 4,),
                              Text("Remove",style: TextStyle(fontSize: 13,color: Colors.white),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,)



                ],
              ),
            ),),

            Visibility(
              visible: infant,
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 4),
                      child: Text("INFANT INFORMATION",style: TextStyle(fontSize: 15,color: primary),),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                      child: Text("Please make sure the details entered below are exactly as per Traveller's ID",
                        style: TextStyle(fontSize: 12,color: Colors.red,fontFamily: mediumFont),),
                    ),

                    SizedBox(height: 10,),

                    ListView.builder(
                      itemCount: infantCount,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {

                        return  Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                                    child:  Container(
                                      height: 45,

                                      margin: EdgeInsets.symmetric(horizontal: 0),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(0),
                                          border: Border.all(color: greyColor,width: 1)
                                      ),
                                      padding:const EdgeInsets.symmetric(horizontal: 10.0),

                                      child: DropdownButton(
                                        hint: Text("Title ",
                                          style: TextStyle(fontSize: 14,color: greyColor,fontFamily: regularFont),),
                                        dropdownColor: Colors.white,
                                        icon: Icon(Icons.arrow_drop_down,color: primary,),
                                        iconSize: 25,
                                        isExpanded: true,
                                        underline: SizedBox(),
                                        style: TextStyle(fontSize: 15,color: Colors.black,fontFamily: semiBoldFont),
                                        items: infantMasterTitle.map((String language) {
                                          return  DropdownMenuItem<String>(
                                            child:  Text(language),
                                            value: language,
                                          );
                                        }).toList(),
                                        value: selectInfantTitle[index],
                                        onChanged: (String? value) {

                                          setState(() {
                                            selectInfantTitle[index] = value.toString();
                                          });
                                        },),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child:Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 14, bottom: 0),
                                    child: SizedBox(
                                      height: 45,
                                      child: TextFormField(
                                        style:AppUtil.textStyle(),
                                        controller: infantDOBCt[index],
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
                                              infantDOBCt[index].text =
                                                  DateFormat('dd MMM yyyy').format(selectedDate);
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
                                                    color:  greyColor,
                                                    width: 2
                                                ),
                                                /*border: Border.all(color: Color(0xFFF1F1F1),width: 1)*/
                                                borderRadius: BorderRadius.circular(0)
                                            ),
                                            enabledBorder:  OutlineInputBorder(
                                                borderSide:  BorderSide(
                                                  color: greyColor,
                                                ),
                                                borderRadius: BorderRadius.circular(0)
                                            ),
                                            hintText: "Date of Birth",
                                            hintStyle: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: semiBoldFont)
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                                    child: SizedBox(
                                      height: 45,
                                      child: TextFormField(
                                        style:AppUtil.textStyle(),
                                        controller: infantFirstCt[index],
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                                            fillColor: Colors.white,
                                            filled: true,

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
                                            hintText: "First Name",
                                            hintStyle: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: semiBoldFont)
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                                    child: SizedBox(
                                      height: 45,
                                      child: TextFormField(
                                        style:AppUtil.textStyle(),
                                        controller: infantLastCt[index],
                                        textInputAction: TextInputAction.next,
                                        decoration: InputDecoration(
                                            contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                                            fillColor: Colors.white,
                                            filled: true,

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
                                            hintText: "Last Name",
                                            hintStyle: const TextStyle(
                                                fontSize: 15,
                                                fontFamily: semiBoldFont)
                                        ),

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 0),
                              child: SizedBox(
                                height: 45,
                                child: TextFormField(
                                  style:AppUtil.textStyle(),
                                  controller: infantWithCt[index],
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                      contentPadding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),

                                      fillColor: Colors.white,
                                      filled: true,

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
                                      hintText: "Travelling With",
                                      hintStyle: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: semiBoldFont)
                                  ),

                                ),
                              ),
                            ),
                          ],
                        );
                      },),

                    SizedBox(height: 10,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: (){
                            setState(() {
                              infantCount++;

                              selectInfantTitle.add("Master");
                              infantWithCt.add(TextEditingController(text: ''));
                              infantDOBCt.add(TextEditingController(text: ''));
                              infantFirstCt.add(TextEditingController(text: ''));
                              infantLastCt.add(TextEditingController(text: ''));
                              // selectInfantValue.add(false);

                              print(selectInfantTitle);
                              print(selectInfantValue);

                            });
                          },
                          child: Container(

                            padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: primary,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.add,color: Colors.white,),
                                SizedBox(width: 4,),
                                Text("Add",style: TextStyle(fontSize: 13,color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 6,),

                        InkWell(
                          onTap: (){
                            setState(() {

                              if(infantCount>1) {
                                selectInfantTitle.removeAt(infantCount-1);
                                // selectInfantValue.removeAt(infantCount-1);

                                infantWithCt.removeAt(infantCount-1);
                                infantDOBCt.removeAt(infantCount-1);
                                infantFirstCt.removeAt(infantCount-1);
                                infantLastCt.removeAt(infantCount-1);

                                print(selectInfantTitle);
                                print(selectInfantValue);
                                infantCount--;

                              }
                            });
                          },
                          child: Container(

                            padding: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.red,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.remove,color: Colors.white,),
                                SizedBox(width: 4,),
                                Text("Remove",style: TextStyle(fontSize: 13,color: Colors.white),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 10,)



                  ],
                ),
              ),),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.1,vertical: AppUtil.fullHeight(context)*0.05),
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary: primary, // Change the color here..
                    elevation: 0,
                    // ...
                  ),

                  onPressed: () {

                    NavigationService.instance.navigateTo("/bookPayment");


                  },
                  child: Text("Submit",style: TextStyle(fontSize: 14),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}