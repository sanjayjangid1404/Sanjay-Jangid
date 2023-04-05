
import 'package:airedge/appcomman/AppColor.dart';
import 'package:airedge/appcomman/AppFont.dart';
import 'package:airedge/appcomman/AppUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookingPayment extends StatefulWidget{
  const BookingPayment({super.key});



  @override
  State<StatefulWidget> createState()=>_BookingPayment();
}

class _BookingPayment extends State<BookingPayment>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Summary"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: AppUtil.fullHeight(context)*0.1,),

            Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [
                    SizedBox(height: 10,),
                    Text("FARE SUMMARY",style: TextStyle(fontSize: 18,color: Colors.black),),

                    SizedBox(height: 20,),

                    Row(
                      children: [
                        Expanded(
                            flex:1,
                            child: SizedBox()),

                        Expanded(
                            flex: 1,
                            child: Text("PERSON",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor),)),
                        Expanded(
                            flex: 1,
                            child: Text("PRICE",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor),)),
                        Expanded(
                            flex: 1,
                            child: Text("TOTAL COST",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor),)),

                      ],
                    ),

                    SizedBox(height: 12,),

                    Row(
                      children: [
                        Expanded(
                            flex:1,
                            child:Text("Adult",style: TextStyle(fontSize: 14,color: primary),)),

                        Expanded(
                            flex: 1,
                            child: Text("1",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),
                        Expanded(
                            flex: 1,
                            child: Text("₹ 6,000.00",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),
                        Expanded(
                            flex: 1,
                            child: Text("₹ 6,000.00",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),

                      ],
                    ),
                    SizedBox(height: 6,),

                    Row(
                      children: [
                        Expanded(
                            flex:1,
                            child:Text("Children",style: TextStyle(fontSize: 14,color: primary),)),

                        Expanded(
                            flex: 1,
                            child: Text("1",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),
                        Expanded(
                            flex: 1,
                            child: Text("₹ 6,000.00",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),
                        Expanded(
                            flex: 1,
                            child: Text("₹ 6,000.00",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),

                      ],
                    ),
                    SizedBox(height: 6,),

                    Row(
                      children: [
                        Expanded(
                            flex:1,
                            child:Text("Infant",style: TextStyle(fontSize: 14,color: primary),)),

                        Expanded(
                            flex: 1,
                            child: Text("1",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),
                        Expanded(
                            flex: 1,
                            child: Text("₹ 6,000.00",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),
                        Expanded(
                            flex: 1,
                            child: Text("₹ 6,000.00",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),

                      ],
                    ),



                  ],
                ),
              ),
            ),

            SizedBox(height: AppUtil.fullHeight(context)*0.05,),

            Card(
              margin: EdgeInsets.symmetric(horizontal: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,


                  children: [
                    SizedBox(height: 10,),
                    Text("PAYMENT AMOUNT",style: TextStyle(fontSize: 18,color: Colors.black),),

                    SizedBox(height: 20,),





                    Row(
                      children: [
                        Expanded(
                            flex:1,
                            child:Text("Total Amount",style: TextStyle(fontSize: 14,color: primary),)),

                        Expanded(
                            flex: 1,
                            child: Text("₹ 6,000.00",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),


                      ],
                    ),
                    SizedBox(height: 6,),

                    Row(
                      children: [
                        Expanded(
                            flex:1,
                            child:Text("Mark up",style: TextStyle(fontSize: 14,color: primary),)),

                        Expanded(
                            flex: 1,
                            child: Text("1",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),


                      ],
                    ),
                    SizedBox(height: 6,),

                    Row(
                      children: [
                        Expanded(
                            flex:1,
                            child:Text("Grand Total",style: TextStyle(fontSize: 14,color: primary),)),

                        Expanded(
                            flex: 1,
                            child: Text("₹ 6,000.00",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 14,color: greyColor,fontFamily: mediumFont),)),


                      ],
                    ),



                  ],
                ),
              ),
            ),


            SizedBox(height: 20,),

            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: AppUtil.fullWidth(context)*0.1,vertical: AppUtil.fullHeight(context)*0.05),
              child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                    primary: primary,
                    elevation: 0,

                  ),

                  onPressed: () {

                  },
                  child: Text("Confirm Booking",style: TextStyle(fontSize: 14),)
              ),
            ),


          ],
        ),
      ),
    );
  }
}