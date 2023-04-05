import 'package:airedge/appcomman/AppColor.dart';
import 'package:airedge/appcomman/AppRoute.dart';
import 'package:airedge/appcomman/Helper/HalfCutCircle.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:clippy_flutter/clippy_flutter.dart';


class BookTicket extends StatefulWidget{
  const BookTicket({super.key});


  @override
  State<StatefulWidget> createState()=>_BookTicket();
}
class _BookTicket extends State<BookTicket>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        actions: [

          IconButton(
              onPressed: (){},
              icon: Image.asset("images/profile.png",height: 22,))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: primary,
        child: Column(
          children: [
            SizedBox(height: 10,),

            Container(
              height: 90,
              child: Stack(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(20),
                            dashPattern: [10, 10],
                            color: Colors.grey,
                            strokeWidth: 2,
                            child: Container(
                              alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),

                                ),
                                child: Column(
                                  children: [
                                    Text("JFK",style: TextStyle(fontSize: 24,color: Colors.white),),
                                    Text("India",style: TextStyle(fontSize: 14,color: Colors.white),),
                                  ],
                                )),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: DottedBorder(
                            borderType: BorderType.RRect,
                            radius: Radius.circular(20),
                            dashPattern: [10, 10],
                            color: Colors.grey,
                            strokeWidth: 2,
                            child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),

                                ),
                                child: Column(
                                  children: [
                                    Text("JFK",style: TextStyle(fontSize: 24,color: Colors.white),),
                                    Text("India",style: TextStyle(fontSize: 14,color: Colors.white),),
                                  ],
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),

                  Center(
                    child: Image.asset("images/airplane.png",height: 50,),
                  )


                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(child: getTicketContainer())

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
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (context, index) {
        return InkWell(
          onTap: (){
            NavigationService.instance.navigateTo("/bookFrom");
          },
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
}