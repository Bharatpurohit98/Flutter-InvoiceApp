// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:invoiceapp/Components/globalvariables.dart' as globals;
import 'package:invoiceapp/Screens/Business_Profile/business_profile.dart';
import 'package:invoiceapp/Screens/about_us.dart';
import 'package:invoiceapp/Screens/add_Sale.dart';
import 'package:invoiceapp/Screens/purchase.dart';
import 'package:invoiceapp/Screens/stock_list.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
    padding: EdgeInsets.zero,
    children:[
      // TextButton(
      //   onPressed: () => {
      //     Navigator.push(context, MaterialPageRoute(builder: (context) => Profile()))
      //   },
   UserAccountsDrawerHeader(
          accountName: Text('Business.com'),
          accountEmail: Text('example@gmail.com'),
          currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,child: ClipOval(child: Icon(Icons.business_outlined)), ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 96, 177, 243),
          ),
        ), 
      ListTile(
        leading: Icon(Icons.person_add_outlined),
        title: Text('Profile'),
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Profile()));},
      ),
      ListTile(
        leading: Icon(Icons.pageview_outlined),
        title: Text('Sales'),
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Sale()));},
      ),
      ListTile(
        leading: Icon(Icons.shopping_cart_checkout_outlined),
        title: Text('Purchase'),
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Purchase()));},
      ),
      ListTile(
        leading: Icon(Icons.warehouse_outlined),
        title: Text('Stock'),
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> Stock()));},
      ),
      ListTile(
        leading: Icon(Icons.group),
        title: Text('About Us'),
        onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context)=> AboutUs()));},
      ),
      // ListTile(
      //   leading: Icon(Icons.person_add_outlined),
      //   title: Text('Profile'),
      //   onTap: () {},
      // ),
    ],
  ),
    );
  }
}
