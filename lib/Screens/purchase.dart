// ignore_for_file: file_names, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoiceapp/Login/details.dart';
import 'package:invoiceapp/Login/login.dart';
import 'package:invoiceapp/Notifiers/transaction_notifier.dart';
import 'package:invoiceapp/Screens/add_items.dart';
import 'package:invoiceapp/Components/globalvariables.dart' as globals;
import 'package:invoiceapp/Notifiers/item_notifier.dart';
import 'package:invoiceapp/api/pdf_invoice_api.dart';
import 'package:invoiceapp/Components/invoice_object.dart';
import 'package:invoiceapp/api/pdf_api.dart';
import 'package:invoiceapp/model/transactions.dart';
import 'package:provider/provider.dart';

class Purchase extends StatefulWidget {
  const Purchase({Key? key}) : super(key: key);

  @override
  _PurchaseState createState() => _PurchaseState();
}

class _PurchaseState extends State<Purchase> {
  final _form1Key = GlobalKey<FormState>();
  final _formkey = GlobalKey<FormState>();

  final invNoController = TextEditingController();
  final customerNameController = TextEditingController();
  final cusPhoneNumberContoller = TextEditingController();
  final totalAmtController = TextEditingController();

  DateTime currentDate = DateTime.now();

  bool isVisible = false;

  String paymentTypeSelected = 'Cash';

  String? state;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ItemNotifier itemNotifier = Provider.of<ItemNotifier>(context);
    Transactions transactions = Provider.of<Transactions>(context);
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
          'Purchase',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            //height: 75,
            padding: EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 0),
            child: Form(
              key: _form1Key,
              child: Row(
                children: [
                  SizedBox(
                    child: Align(
                      child: Text(
                        'Bill No.  ',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    width: 40,
                    child: TextFormField(
                      scrollPadding: EdgeInsets.all(20),
                      textAlign: TextAlign.end,
                      decoration: InputDecoration(
                        isDense: true,
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '';
                        }
                        //globals.saleInvNo = invNoController.text;
                        return null;
                      },
                      onChanged: (invNoVal) => {globals.saleInvNo = invNoVal},
                    ),
                  ),
                  SizedBox(
                    width: 170,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.calendar_today,
                                color: Colors.grey, size: 17),
                            // Text(
                            //   ' Date\n',
                            //   style: TextStyle(
                            //       color: Colors.grey,
                            //       fontSize: 14),
                            // ),
                            Text(
                              (globals.saleDate =
                                  "${currentDate.day}/${currentDate.month}/${currentDate.year}"),
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            )
                          ],
                        ),
                        onPressed: () => {
                          _selectDate(context),
                        },
                      )),
                ],
              ),
            ),
          ),
          Form(
            key: _formkey,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  TextFormField(
                    controller: customerNameController,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Enter Party Name';
                      }
                      //globals.saleCustomer = customerNameController.text!;
                      return null;
                    },
                    style: TextStyle(fontSize: 16),
                    onChanged: (customerFieldValue) => {
                      globals.saleCustomer = customerFieldValue,
                       transactions.setParty(customerFieldValue),
                    },
                    decoration: InputDecoration(
                        labelText: 'Party',
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
                  SizedBox(height: 15),
                  TextFormField(
                    controller: cusPhoneNumberContoller,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Enter Phone Number';
                      }
                      //globals.salePhoneNumber = cusPhoneNumberContoller.text;
                      return null;
                    },
                    style: TextStyle(fontSize: 16),
                    onChanged: (phoneNumberFiledValue) =>
                        {globals.salePhoneNumber = phoneNumberFiledValue},
                    decoration: InputDecoration(
                        labelText: 'Phone Number',
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
                ],
              ),
            ),
          ),
          Divider(
            height: 35,
            thickness: 0.1,
            color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              onPressed: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Products())),
              child: Text(
                'ADD ITEMS(Optional)',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 222, 226, 253),
                minimumSize: Size(400, 40),
              ),
            ),
          ),
          Divider(
            height: 35,
            color: Colors.black,
            thickness: 0.1,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: Offset(0, -0.75),
                      blurRadius: 15,
                      spreadRadius: 0)
                ]),
            child: Row(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 2.5),
                  width: 25,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 166, 201, 235),
                  ),
                  child: RotatedBox(
                    quarterTurns: -1,
                    child: Text(
                      'Totals',
                      style: TextStyle(
                          letterSpacing: 0.3,
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                    width: 100,
                    child: Text(
                      'Total Amt',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center,
                    )),
                Container(
                  padding: EdgeInsets.only(left: 120, bottom: 15),
                  width: 250,
                  child: TextField(
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    onChanged: (totalAmtFieldVal) => {
                      transactions.setTotalAmt(double.parse(totalAmtFieldVal)),
                      setState(() {
                        isVisible = true;
                      }),
                      globals.saleTotalAmt = totalAmtFieldVal,
                    },
                  ),
                )
              ],
            ),
          ),
          Divider(
            height: 25,
            color: Colors.black,
            thickness: 0.1,
          ),
          Visibility(
            visible: isVisible,
            child: Column(
              children: [
                Container(
                  height: 160,
                  width: 400,
                  padding: EdgeInsets.all(0),
                  child: Card(
                    color: Colors.white,
                    child: Column(children: [
                      Container(
                        padding: EdgeInsets.only(left: 6, top: 7),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Payment Type',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 13.5),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.fromLTRB(8, 0, 290, 0),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            items: <String>['Cash', 'Cheque']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: paymentTypeSelected,
                            onChanged: (String? newValue) {
                              setState(() {
                                paymentTypeSelected = newValue!;
                              });
                              globals.salePaymentType = paymentTypeSelected;
                            },
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(6, 0, 25, 7),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'State of Supply',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13.5),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              //child: Container(
                              //padding: EdgeInsets.only(left: 0,right: 20),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  //alignedDropdown: true,
                                  child: DropdownButton<String>(
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13.5,
                                      //overflow: TextOverflow.ellipsis
                                    ),
                                    items: <String>[
                                      'Andaman & Nicobar Islands',
                                      'Andra Pradesh',
                                      'Arunachal Pradesh',
                                      'Assam',
                                      'Bihar',
                                      'Chandigarh',
                                      'Chattisgarh',
                                      'Dadra & Nagar Haveli & Daman & Diu',
                                      'Daman & Diu',
                                      'Delhi',
                                      'Goa',
                                      'Gujarat',
                                      'Haryana',
                                      'Himachal Pradesh',
                                      'Jammu & Kashmir',
                                      'Jharkand',
                                      'Karnataka',
                                      'kerala',
                                      'Ladakh',
                                      'Lakshadweep Islands',
                                      'Madhya Pradesh',
                                      'Maharashtra',
                                      'Manipur',
                                      'Meghalaya',
                                      'Mizoram',
                                      'Nagaland',
                                      'Odisha',
                                      'Pondicherry',
                                      'Punjab',
                                      'Rajasthan',
                                      'Sikkim',
                                      'Tamil Nadu',
                                      'Telangana',
                                      'Tripura',
                                      'Uttar Pradesh',
                                      'Uttarakhand',
                                      'West Bengal'
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    value: state,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        state = newValue!;
                                      });
                                      globals.saleStateSupply = state;
                                    },
                                  ),
                                ),
                              ),
                            ),
                            // ),
                          ],
                        ),
                      )
                    ]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 6),
                  height: 100,
                  width: 450,
                  child: Card(
                      child: Container(
                    padding: EdgeInsets.fromLTRB(8, 10, 220, 25),
                    child: TextButton.icon(
                        onPressed: () => {
                              TextField(
                                decoration: InputDecoration(
                                    labelText: 'Description',
                                    focusColor:
                                        Color.fromARGB(255, 41, 105, 148),
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(15),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide(
                                        color: Colors.black26,
                                        width: 0.5,
                                      ),
                                    )),
                              )
                            },
                        label: Text(
                          'Add Description',
                          style: TextStyle(
                              color: Color.fromARGB(255, 41, 105, 148),
                              fontSize: 14),
                        ),
                        style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 230, 242, 254),
                          minimumSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                        ),
                        icon: Icon(
                          Icons.file_copy_rounded,
                          size: 20,
                        )),
                  )),
                )
              ],
            ),
          ),
          // Container(
          //   alignment: Alignment.bottomCenter,
          //   child: Row(
          //     children: <Widget>[
          //       TextButton(
          //           child: Text(
          //             'Save',
          //             style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 18,
          //             ),
          //           ),
          //           style: TextButton.styleFrom(
          //             minimumSize: Size(200, 50),
          //             backgroundColor: Color.fromARGB(255, 23, 137, 252),
          //             shape: RoundedRectangleBorder(
          //                 borderRadius: BorderRadius.zero),
          //           ),
          //           onPressed: () => {
          //                 if (_form1Key.currentState!.validate() &&
          //                     _formkey.currentState!.validate())
          //                   {
          //                     Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                             builder: (context) => Items())),
          //                   },
          //               }),
          //     ],
          //   ),
          // )

          
        ],
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 400,
        child: Row(
          children: <Widget>[
            TextButton(
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                style: TextButton.styleFrom(
                  minimumSize: Size(200, 50),
                  backgroundColor: Color.fromARGB(255, 23, 137, 252),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                ),
                onPressed: () => {
                      if (_form1Key.currentState!.validate() &&
                          _formkey.currentState!.validate())
                        {
                           transactions.addTransaction(TransactionModel(transactions.party, transactions.totalAmt)),
                          Navigator.pop(context),
                        },
                    }),
            TextButton.icon(
              label: Text(
                'Print',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.8), fontSize: 18),
              ),
              onPressed: () async {
                if (_form1Key.currentState!.validate() &&
                    _formkey.currentState!.validate()) {
                  var pdfFile = await PdfInvoiceApi.generate(invoice);

                  PdfApi.openFile(pdfFile);
                }
              },
              //Navigator.push(context,
              //  MaterialPageRoute(builder: (context) => VarData()))

              icon: Icon(
                Icons.print_rounded,
                color: Colors.black.withOpacity(0.8),
                size: 25,
              ),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero),
                  backgroundColor: Colors.grey.withOpacity(0.3),
                  minimumSize: Size(192, 50)),
            )
          ],
        ),
      ),
    );
  }
}
