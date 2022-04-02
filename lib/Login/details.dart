// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:invoiceapp/Components/globalfunctions.dart';
import 'package:invoiceapp/Components/globalvariables.dart' as globals;
import 'package:invoiceapp/Notifiers/app_state.dart';
import 'package:invoiceapp/Screens/home_screen.dart';
import 'package:provider/provider.dart';

class BusinessName extends StatefulWidget {
  const BusinessName({Key? key}) : super(key: key);

  @override
  _BusinessNameState createState() => _BusinessNameState();
}

final textController = TextEditingController();

String? value;

class _BusinessNameState extends State<BusinessName> {
  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Text(''),
        backgroundColor: Colors.white,
        title: Text(
          "Enter Business Details",
          style: TextStyle(color: Colors.black.withOpacity(0.8)),
        ),
      ),
      body: Container(
        height: 300,
        child: Center(
          child: Column(
            children: [
              Spacer(),
              Container(
                padding: EdgeInsets.only(left: 15, right: 15),
                child: TextFormField(
                  controller: textController,
                  validator: (value) {
                    if (value == null || value == '') {
                      return 'Enter Business Name';
                    }
                    //globals.saleCustomer = customerNameController.text!;
                    return null;
                  },
                  style: TextStyle(fontSize: 16),
                  onChanged: (value) => {
                    appState.setBussinessName(value)
                  },
                  decoration: InputDecoration(
                      labelText: 'Business Name',
                      focusColor: Color.fromARGB(255, 0, 116, 231),
                      floatingLabelBehavior: FloatingLabelBehavior.auto,
                      //isDense: true,
                      contentPadding: EdgeInsets.all(12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        gapPadding: 5,
                        borderSide: BorderSide(
                            color: Colors.black26,
                            width: 0.5,
                            style: BorderStyle.solid),
                      )),
                ),
                //     child: TextFormField(
                //       controller: textController,
                //       decoration: InputDecoration(hintText: "Business Name",prefixIcon: Icon(
                //   Icons.store,
                //   size: 30,
                // )),
                //       onChanged: (text) {
                //         value = text;
                //       },
                //     ),
              ),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Container(
                  padding: EdgeInsets.all(15),
                  child: ElevatedButton(
                    onPressed: () => {
                      globals.bussNameInput = textController.text,
                      // print(GlobalVariables().bussNameInput),
                      GlobalFunctions().storedata(context),
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  Homescreen(
                        //businessName: value
                        )))

                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Homescreen(
                      //               businessName: value,
                      //      )))
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Homescreen(businessName: value)))
                    },
                    child: Text(
                      "Next",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(MediaQuery.of(context).size.width, 45),
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50)),
                      elevation: 4,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
