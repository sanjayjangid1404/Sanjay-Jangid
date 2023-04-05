
import 'package:airedge/API/ArrayContontroller.dart';
import 'package:airedge/Model/RequestModel/BookingRequest.dart';
import 'package:airedge/Model/ResponseModel/BookingResponse.dart';
import 'package:airedge/appcomman/AppColor.dart';
import 'package:airedge/appcomman/AppFont.dart';
import 'package:airedge/appcomman/AppUtil.dart';
import 'package:airedge/appcomman/AppVariable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookingView extends StatefulWidget{
  const BookingView({super.key});


  @override
  State<StatefulWidget> createState()=>_BookingView();
}
class _BookingView extends State<BookingView>{

  List<bool>isShow = [false,false,false,false,false,false,false,false,false,false];

  BookingResponse bookingResponse = BookingResponse();
  TextEditingController searchController = TextEditingController();
  bool isLoading = false;

  String userID = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    SharedPreferences.getInstance().then((sp){

      userID = sp.getString(saveUserID)!=null ? sp.getString(saveUserID)! : "";

     /* for(int i=0; i<10; i++)
        {
          isShow.add(false);
        }*/

      getAllBookingData(userID,"");

      setState(() {

      });

    });
  }

  void getAllBookingData(String userID,String keyword)
  {

    setState(() {
      isLoading = true;
    });

    BookingRequest request = BookingRequest("", "");

    request.userID = userID;
    request.keyword = keyword;
    ArrayController controller = ArrayController();

    controller.getAllBooking(request).then((value){

      bookingResponse = value!;

      if(bookingResponse.bookingData!=null && bookingResponse.status!)
        {

          isShow.clear();
          for(int i=0; i<bookingResponse.bookingData!.length; i++)
            {
              isShow.add(false);
            }
        }

      setState(() {
        isLoading = false;
      });


    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text("Bookings",),
     ),
     body: Column(
       children: [
         Container(
           height: AppUtil.fullHeight(context)*0.12,
           color: primary,
           width: double.infinity,
           padding: EdgeInsets.symmetric(horizontal: 10),

           child: Row(
             children: [
               Expanded(
                   flex:8,
                   child: SizedBox(
                     height: 40,
                     child: TextFormField(
                       controller: searchController,
                       textInputAction: TextInputAction.go,
                       onFieldSubmitted: (value) {
                         getAllBookingData(userID, value);

                         setState(() {

                         });
                       },
                       style:AppUtil.textStyle(),
                       onChanged: (value){
                         getAllBookingData(userID, value);

                         setState(() {

                         });
                       },


                       decoration: InputDecoration(
                         contentPadding: const EdgeInsets.symmetric(vertical: 8),
                         fillColor: Colors.white,
                         filled: true,
                         prefixIcon:  Padding(
                           padding: EdgeInsets.symmetric(horizontal:15.0),
                           child: Icon(
                             Icons.search,
                             color: primary,
                           ),
                         ),
                         suffixIcon: IconButton(
                             onPressed: (){
                               getAllBookingData(userID,searchController.text.toString());

                             },
                             icon: Icon(Icons.forward)),

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
                         hintText: "Search Customer...",
                         hintStyle: const TextStyle(fontSize: 13,fontFamily: semiBoldFont),

                       ),

                     ),
                   ),),
               Expanded(
                   flex: 2,
                   child: InkWell(
                       onTap: (){
                         searchController.text = "";
                         getAllBookingData(userID,"");

                         setState(() {

                         });
                       },
                       child: Icon(Icons.cancel,color: Colors.white,)))
             ],
           ),
         ),
        isLoading ? Center(child: CircularProgressIndicator(color: primary,),): Expanded(child: getAllBooking())

         


       ],
     ),
   );
  }
  
  Widget getAllBooking()
  {
    return ListView.builder(
      itemCount:bookingResponse.bookingData!=null ?  bookingResponse.bookingData!.length : 0,
      shrinkWrap: true,
      itemBuilder: (context, index) {
      return Card(
        margin: EdgeInsets.symmetric(horizontal: 6,vertical: 4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8)
        ),
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text("CUSTOMER NAME:",
                      style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                  ),



                  Expanded(
                    flex: 6,
                    child: Text(bookingResponse.bookingData![index].custName!,
                      style: TextStyle(fontSize: 13,color: Colors.black,),),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text("MOBILE:",
                      style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                  ),



                  Expanded(
                    flex: 6,
                    child: Text(bookingResponse.bookingData![index].custMobile!,
                      style: TextStyle(fontSize: 13,color: Colors.black),),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text("BOOKING ID:",
                      style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                  ),



                  Expanded(
                    flex: 6,
                    child: Text(bookingResponse.bookingData![index].bookingId!,
                      style: TextStyle(fontSize: 13,color: Colors.black),),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text("AIRLINE:",
                      style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                  ),



                  Expanded(
                    flex: 6,
                            child: Text("bookingResponse.bookingData![index].!",
                      style: TextStyle(fontSize: 13,color: Colors.black),),
                  ),
                ],
              ),

              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text("FLIGHT NO:",
                      style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                  ),



                  Expanded(
                    flex: 6,
                    child: Text(bookingResponse.bookingData![index].flightNo!,
                      style: TextStyle(fontSize: 13,color: Colors.black),),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text("SECTOR:",
                      style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                  ),



                  Expanded(
                    flex: 6,
                    child: Text("Bangalore - BOM",
                      style: TextStyle(fontSize: 13,color: Colors.black),),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text("DEPARTURE DATE & TIME:",
                      style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                  ),



                  Expanded(
                    flex: 6,
                    child: Text(AppUtil.changeDateFormat(bookingResponse.bookingData![index].depDate!, "yyyy-MM-dd", "yyyy-MM-dd")+
                        bookingResponse.bookingData![index].depTime!,
                      style: TextStyle(fontSize: 13,color: Colors.black),),
                  ),
                ],
              ),
              Visibility(
                  visible: isShow[index],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,

                children: [



                  SizedBox(height: 4,),

                  Divider(color: greyColor,height: 0.8,),
                  SizedBox(height: 4,),

                  Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("PNR NO", style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                              SizedBox(height: 2,),
                              Text(bookingResponse.bookingData![index].pnrNo!,
                                style: TextStyle(fontSize: 13,color: Colors.black),),
                            ],
                          )),

                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("ISSUE DATE", style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                              SizedBox(height: 2,),
                              Text(bookingResponse.bookingData![index].issueDate!,
                                style: TextStyle(fontSize: 13,color: Colors.black),),
                            ],
                          ))
                    ],
                  ),
                  SizedBox(height: 4,),
                  Row(
                    children: [
                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("QTY", style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                              SizedBox(height: 2,),
                              Text(bookingResponse.bookingData![index].ticketQty!,
                                style: TextStyle(fontSize: 13,color: Colors.black),),
                            ],
                          )),
                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("AGENT PRICE	", style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                              SizedBox(height: 2,),
                              Text(rupeesSymbol+bookingResponse.bookingData![index].totalAmount!,
                                style: TextStyle(fontSize: 13,color: Colors.black),),
                            ],
                          ))
                    ],
                  ),

                  SizedBox(height: 4,),
                  Row(
                    children: [

                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("STATUS", style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                              SizedBox(height: 2,),
                              Text(bookingResponse.bookingData![index].bookingStatus!,
                                style: TextStyle(fontSize: 13,color: Colors.black),),
                            ],
                          )),
                      Expanded(
                          flex: 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("TOTAL AMOUNT", style: TextStyle(fontSize: 12,color: greyColor,fontFamily: mediumFont),),
                              SizedBox(height: 2,),
                              Text(bookingResponse.bookingData![index].totalPurchasePrice!,
                                style: TextStyle(fontSize: 13,color: Colors.black),),
                            ],
                          )),
                    ],
                  ),
                ],
              )),

              SizedBox(height: 10,),

              Align(
                alignment: Alignment.centerRight,
                child: InkWell(
                  onTap: (){
                    setState(() {

                      if(isShow[index])
                        {
                          isShow[index]=false;
                        }
                      else {
                        isShow[index]=true;
                      }
                    });
                  },
                  child: Text(isShow[index] ? "Show less" :"Show more",
                    style: TextStyle(
                        fontSize: 12,
                        color: primary.withOpacity(0.7)),),
                ),
              ),
              SizedBox(height: 10,),

              Align(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          radius:15,
                            backgroundColor: primary,

                            child: Icon(Icons.print,color: Colors.white,size: 15,)),
                        // Text("Print",style: TextStyle(fontSize: 12,color: Colors.black),)
                      ],
                    ),
                    SizedBox(width: 8,),

                    Column(
                      children: [
                        CircleAvatar(
                            radius:15,
                            backgroundColor: primary,

                            child: Icon(Icons.edit_note,color: Colors.white,size: 15,)),
                        // Text("Print",style: TextStyle(fontSize: 12,color: Colors.black),)
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },);
  }
}