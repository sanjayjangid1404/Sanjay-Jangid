
import 'package:airedge/appcomman/AppColor.dart';
import 'package:airedge/appcomman/AppFont.dart';
import 'package:airedge/appcomman/AppUtil.dart';
import 'package:airedge/appcomman/Responsive.dart';
import 'package:flutter/material.dart';

class LedgerView extends StatefulWidget{
  const LedgerView({super.key});


  @override
  State<StatefulWidget> createState()=>_LedgerView();
}

class _LedgerView extends State<LedgerView>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Ledger",),
      ),

      body: SafeArea(
        child:
        Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                
                SizedBox(height: 12,),
                
                Center(
                  child: Text("Balance: ₹ 999,977,700.00",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18,color: Colors.red),),
                ),
                SizedBox(height: 12,),

                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: SizedBox()),

                    Expanded(
                      flex:8,
                      child: SizedBox(
                        height: 40,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextFormField(
                            textInputAction: TextInputAction.go,
                            onFieldSubmitted: (value) {
                              // checkValidation();
                            },
                            style:AppUtil.textStyle(),


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
                                  onPressed: (){},
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
                              hintText: "Search...",
                              hintStyle: const TextStyle(fontSize: 13,fontFamily: semiBoldFont),

                            ),

                          ),
                        ),
                      ),)
                  ],
                ),

                SizedBox(height: 12,),


                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        DataTable(
                          headingRowHeight: 40,

                          headingTextStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                          decoration: BoxDecoration(
                            color:  primary.withOpacity(0.7),
                          ),
                          rows: [],
                          columns: _underCreateColumns(AppUtil.fullWidth(context)),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            // controller: _scrollController,
                            scrollDirection: Axis.vertical,
                            child:DataTable(
                              headingRowHeight: 0,
                              headingTextStyle: const TextStyle(fontSize: 14,fontWeight: FontWeight.w500),

                              rows: _createUnderRows(AppUtil.fullWidth(context)),
                              columns: _underCreateColumns(AppUtil.fullWidth(context)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }


  List<DataColumn> _underCreateColumns(double width) {

    var drawer = 0;
    return  [
      const DataColumn(label:  SizedBox(
          width: 40,
          child: Text('S.N.',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),))),
      DataColumn(label: SizedBox(
          width: Responsive.isMobile(context)?100:(width)/8,

          child: const Center(child: Text('Date',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)))),

      DataColumn(label: SizedBox(
          width: Responsive.isMobile(context)?100:(width)/3,

          child: const Center(child: Text('Description',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)))),
      DataColumn(label: SizedBox(
          width: Responsive.isMobile(context)?100:(width)/8,

          child:const Center(child: Text('Credit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)))),
      DataColumn(label: SizedBox(
          width: Responsive.isMobile(context)?100:(width)/8,

          child:const Center(child: Text('Debit',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)))),
      DataColumn(label: SizedBox(
          width: Responsive.isMobile(context)?100:(width)/8,

          child: const Center(child: Text('Booking ID',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w400),)))),


    ];
  }

  List<DataRow> _createUnderRows(double width) {

    var screenSize = width/8;
    var drawer = 0;

    print( 0000000+(screenSize-drawer)/8);

    return List.generate(40, (index){

      return DataRow(cells: [
        DataCell(SizedBox(
            width: 40,
            child: Text((index+1).toString(),style: const TextStyle(color: Colors.black54,fontFamily: mediumFont),))),
        DataCell(SizedBox(
            width: Responsive.isMobile(context)?100:(width)/8,
            child: Center(child: Text("16/06/2022",style: TextStyle(color: Colors.black54,fontFamily: mediumFont))))),

        DataCell(SizedBox(
            width: Responsive.isMobile(context)?100:(width)/3,
            child: Center(child: Text("TicketCancel STH14093",style: TextStyle(color: Colors.black54,fontFamily: mediumFont))))),
        DataCell(SizedBox(
            width: Responsive.isMobile(context)?100:(width)/8,
            child: Center(child: Text("₹ 1,400.00",style: TextStyle(color: Colors.black54,fontFamily: mediumFont))))),
        DataCell(SizedBox(
            width: Responsive.isMobile(context)?100:(width)/8,
            child: Center(child: Text("₹ 1,400.00",style: TextStyle(color: Colors.black54,fontFamily: mediumFont))))),
        DataCell(SizedBox(
            width: Responsive.isMobile(context)?100:(width)/8,
            child: Center(child: Text("	14387",style: TextStyle(color: Colors.black54,fontFamily: mediumFont))))),

      ]
      );
    });

  }
}