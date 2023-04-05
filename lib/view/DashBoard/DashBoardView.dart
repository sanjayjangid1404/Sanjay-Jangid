
import 'package:airedge/view/DashBoard/BookingView.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../appcomman/AppColor.dart';
import '../../appcomman/AppFont.dart';
import '../../appcomman/AppVariable.dart';
import 'HomeView.dart';



class DashBoard extends StatefulWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  _DashBoard createState() =>_DashBoard();
}

class _DashBoard extends State<DashBoard> {

  int _selectedIndex = 0;
  int selectPosition = 0;

  bool isAdding = false;
  ScrollController controller =  ScrollController();



  bool isDataFetching = false;

  List<Widget> _widgetOptions = [HomeView(),BookingView()];

  String userID = "";
  List<Widget> sideBarOption = [];
  // late final ScrollListener _model;
  void _onItemTapped(int index) {
    setState(() {


      _selectedIndex = index;


      // getAllCartList();
    });
  }

  Future<bool> _onWillPop() async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) =>  DashBoard()),
        ModalRoute.withName("/dash")

    );
    return true; //
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    SharedPreferences.getInstance().then((SharedPreferences sp) {

      userID = sp.getString(saveUserID)!=null ? sp.getString(saveUserID)! : "";




      setState(() {});

    });
  }






  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Center(
            child:
            _widgetOptions.elementAt(_selectedIndex),
          ),

        ],
      ),
      bottomNavigationBar: Container(
        color: primary,
        child: Theme(
          data: Theme.of(context).copyWith(

            canvasColor: primary,

            primaryColor: primary,

            textSelectionTheme: TextSelectionThemeData(selectionColor: Colors.white),

          ),
          child: BottomNavigationBar(
            onTap: _onItemTapped,
            fixedColor: primary,

            type: BottomNavigationBarType.fixed,
            unselectedIconTheme: IconThemeData(color: greyColor),
            selectedIconTheme: IconThemeData(color: Colors.white),
            currentIndex: _selectedIndex,
            selectedLabelStyle:  TextStyle(color: Colors.white,fontSize: 10
                ,fontFamily: primaryFont),
            unselectedLabelStyle:  TextStyle(color: greyColor,fontSize: 10,fontFamily: primaryFont),

            items:   <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,size: 22,),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.calendar_today),
                label: 'Bookings',
              ),
            /*  BottomNavigationBarItem(
                icon: Icon(Icons.note_alt_sharp),

                label: 'Ledger',
              ),*/


            ],
          ),
        ),
      ),
    );
  }
}