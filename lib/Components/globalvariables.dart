// ignore_for_file: prefer_typing_uninitialized_variables

library my_prj.globals;

import 'package:firebase_database/firebase_database.dart';

var storeNumber;

var bussNameInput;

DatabaseReference? ref = FirebaseDatabase.instance.ref().child('User_Details');

DateTime currentDate = DateTime.now();

var saleInvNo ;

var saleDate;

var saleCustomer = '';

var salePhoneNumber = '';

var saleTotalAmt = '';

var salePaymentType = '';

var saleStateSupply;

var saleDescription = '' ;

// class GlobalVariables {
//   var storeNumber;
//   var bussNameInput;
//   DatabaseReference? ref =
//       FirebaseDatabase.instance.ref().child('User Details');
// }

var productNNNNN;
var ratePPPP;
