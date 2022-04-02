// ignore_for_file: no_logic_in_create_state, use_key_in_widget_constructors, prefer_const_constructors, 
import 'package:flutter/material.dart';
import 'package:invoiceapp/Login/login.dart';
import 'package:invoiceapp/Notifiers/app_state.dart';
import 'package:invoiceapp/Screens/side_bar.dart';
import 'package:invoiceapp/Screens/stack_homescreen.dart';
import 'package:provider/provider.dart';

import 'bottombar.dart';

// // ignore: must_be_immutable
// class Homescreen extends StatefulWidget {
//   //static const routename = '/home-screen';

//   //String? businessName;
//   //Homescreen({this.businessName});

//   @override
//   _SecondState createState() => _SecondState(

//     //businessName
//     );

// }

// class _SecondState extends State<Homescreen> {
//   final _auth = FirebaseAuth.instance;

//   String? businessName;
//   _SecondState(
//     // this.businessName
//     );

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // set shape(shape) {}
  @override
  Widget build(BuildContext context) {
    //this.context ;
    AppState appState = Provider.of<AppState>(context);
    return Scaffold(
      key: _scaffoldKey,
      drawer: SideBar(),
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () => _scaffoldKey.currentState?.openDrawer(),
        ),
        title: Text(
          '${appState.bussinessName}',
          style: TextStyle(color: Colors.black87),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.black,
            ),
            // onPressed: () async {
            //   await _auth.signOut();

            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
          )
        ],
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.zero,
          color: Colors.white,
          child: StackHomeWidgets()),
      bottomNavigationBar: BottomBar(),
    );
  }
}
