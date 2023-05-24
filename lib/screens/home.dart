import 'package:final_project/dashboard.dart';
import 'package:final_project/screens/login.dart';
import 'package:final_project/services/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';
import '../my_drawer_header.dart';
import '../privacy_policy.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPage = DrawerSections.dashboard;
  @override
  Widget build(BuildContext context) {
    //will take to other screen
    var container;
    if(currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
     }else {
      container = PrivacyPolicyPage();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        title: Text("Welcome"),
      ),
      body:
        container,
        drawer: Drawer(
        child: SingleChildScrollView(
        child: Container(
        child: Column(
         children: [
           MyHeaderDrawer(),
           MyDrawerList(),
      ],

    )
    ),
    ),
    ),
    );
  }
  Widget MyDrawerList(){
    return Container(
      padding: EdgeInsets.only(top: 15,),
      child: Column(
         //shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
               currentPage == DrawerSections.dashboard ? true: false),
          Divider(),
          menuItem(7, "Privacy Policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacy_policy ? true: false),
          menuItem(8, "Log Out", Icons.logout_outlined,
              currentPage == DrawerSections.logout ? true: false),

        ],
      ),
    );
  }
  Widget menuItem(int id, String title, IconData icon, bool selected){
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: (){
          Navigator.pop(context);
          setState(() {
            if(id==7){
              currentPage=DrawerSections.dashboard;

              currentPage=DrawerSections.privacy_policy;
            }else if(id==8) {
              // Show a confirmation dialog before logging out
              QuickAlert.show(
                context:context,
                type: QuickAlertType.confirm,
                title: 'Log Out',
                text: 'Are you sure you want to log out?',
                confirmBtnText: 'Yes',
                onConfirmBtnTap: () async{
                  // Perform the logout action here
                  await FirebaseServices().signOut();
                  Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                cancelBtnText: 'No',
                onCancelBtnTap:() {
                  Navigator.pop(context);
                },
                confirmBtnColor: Colors.teal,

                );
            }
          });
        },
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                  child: Icon(
                    icon,
                    size: 20,
                    color: Colors.black,
                  )
              ),
              Expanded(
                  flex: 3,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.black, fontSize: 16,
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),

    );

  }
}
enum DrawerSections {
  dashboard,
  privacy_policy,
  logout,
}


