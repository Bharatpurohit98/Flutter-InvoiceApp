// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:invoiceapp/Notifiers/itemNotifier.dart';
import 'package:invoiceapp/Notifiers/app_state.dart';
import 'package:invoiceapp/Screens/home_screen.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}
final formkey = GlobalKey<FormState>();

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
        title: Text(
          'Business Profile',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w500, fontSize: 18),
        ),
        actions: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
            child: TextButton(onPressed: () => {
              if(formkey.currentState!.validate()){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homescreen()))
              }
            }, child: Text('SAVE', style: TextStyle(color: Colors.white, fontSize: 12),),
            style: TextButton.styleFrom(
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
              ),
              minimumSize: Size(80, 15)
            ),),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            height: 250,
            padding: EdgeInsets.all(15),
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              shadowColor: Colors.grey.withOpacity(0.8),
              elevation: 4,
              borderOnForeground: true,
              color: Colors.white,
              child: Container(
                height: 200,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  // color: Colors.purple.withOpacity(0.1)
                  // image: DecorationImage(image: AssetImage('assets/images/p.webp'),
                  // fit: BoxFit.cover,
                  // colorFilter: ColorFilter.mode)
                ),
                child: Row(
                  children: [
                    Container(
                      width: 234.7,
                      padding: EdgeInsets.zero,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: 50,
                              padding: EdgeInsets.only(left: 15, top: 18),
                              child: Text(
                                '${appState.bussinessName}' == ''
                                    ? 'My Company'
                                    : '${appState.getBussinessName}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                    fontSize: 17),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 15,
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.email_outlined,
                                    size: 15,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                      '${appState.email}' == ''
                                          ? 'Email ID'
                                          : '${appState.getEmail}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                ],
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                              height: 15,
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.call_outlined,
                                    size: 15,
                                  ),
                                  SizedBox(width: 3),
                                  Text(
                                      '${appState.empty}' == ''
                                          ? 'Contact'
                                          : '${appState.getPhoneNumber}',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                ],
                              ),
                            ),
                            SizedBox(height: 7),
                            Container(
                              height: 15,
                              padding: EdgeInsets.only(left: 15),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.location_on_outlined,
                                    size: 15,
                                  ),
                                  SizedBox(width: 3),
                                  Text(' Business Address:',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10)),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              height: 40,
                              width: 230,
                              padding: EdgeInsets.only(left: 20),
                              child: Text(
                                '${appState.address}' == ''
                                    ? ''
                                    : '${appState.getAddress}',
                                style: TextStyle(
                                    fontSize: 9.5,
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FontStyle.italic,
                                    color: Colors.green),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      height: 230,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: AssetImage('assets/images/Back.jpg'),
                              fit: BoxFit.cover)),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            alignment: Alignment.centerLeft,
            height: 60,
            padding: EdgeInsets.only(
              left: 20,
            ),
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, 0.75),
                      blurRadius: 15,
                      spreadRadius: 0)
                ]),
            child: Text(
              'Business Details',
              style: TextStyle(
                  color: Color.fromARGB(255, 36, 138, 253),
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 20,
            width: 200,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Business Name required';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 16),
                    onChanged: (value) => {
                      appState.setBussinessName(value),
                    },
                    decoration: InputDecoration(
                        labelText: 'Business Name',
                        focusColor: const Color.fromARGB(255, 0, 116, 231),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        //isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          gapPadding: 5,
                          borderSide: const BorderSide(
                              color: Colors.black26,
                              width: 0.5,
                              style: BorderStyle.solid),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                    width: 200,
                  ),
                  TextFormField(
                    inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Enter Phone Number';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 16),
                    onChanged: (value) => {
                      appState.setEmpty(value),
                      appState.setPhoneNumber(int.parse(value)),
                    },
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
                        focusColor: const Color.fromARGB(255, 0, 116, 231),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        //isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          gapPadding: 5,
                          borderSide: const BorderSide(
                              color: Colors.black26,
                              width: 0.5,
                              style: BorderStyle.solid),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                    width: 200,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Enter Email ID';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 14),
                    onChanged: (value) => {
                      appState.setEmail(value),
                    },
                    decoration: InputDecoration(
                        labelText: 'Email ID',
                        focusColor: const Color.fromARGB(255, 0, 116, 231),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        //isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          gapPadding: 5,
                          borderSide: const BorderSide(
                              color: Colors.black26,
                              width: 0.5,
                              style: BorderStyle.solid),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                    width: 200,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 16),
                    onChanged: (value) => {
                      // appState.setBussinessName(value),
                    },
                    decoration: InputDecoration(
                        labelText: 'GSTIN (optional)',
                        focusColor: const Color.fromARGB(255, 0, 116, 231),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        //isDense: true,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          gapPadding: 5,
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 0.8,
                              style: BorderStyle.solid),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                    width: 200,
                  ),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(70),
                    ],
                    maxLines: 2,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Enter Address';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 16),
                    onChanged: (value) => {
                      appState.setAddress(value),
                    },
                    decoration: InputDecoration(
                        labelText: 'Business Address',
                        alignLabelWithHint: true,
                        focusColor: const Color.fromARGB(255, 0, 116, 231),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          gapPadding: 5,
                          borderSide: const BorderSide(
                              color: Colors.black26,
                              width: 0.5,
                              style: BorderStyle.solid),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                    width: 200,
                  ),
                  TextFormField(
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(150),
                    ],
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Enter Description';
                      }
                      return null;
                    },
                    style: const TextStyle(fontSize: 16),
                    onChanged: (value) => {
                      //appState.setBussinessName(value),
                    },
                    decoration: InputDecoration(
                        labelText: 'Description',
                        alignLabelWithHint: true,
                        focusColor: const Color.fromARGB(255, 0, 116, 231),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        contentPadding: const EdgeInsets.all(12),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          gapPadding: 5,
                          borderSide: const BorderSide(
                              color: Colors.black26,
                              width: 0.5,
                              style: BorderStyle.solid),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                    width: 200,
                  ),
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
