// ignore_for_file: prefer_final_fields

import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:invoiceapp/model/transactions.dart';

class Transactions extends ChangeNotifier {
  String? _party;
  String? get party => _party;

  void setParty(input) {
    _party = input;
    notifyListeners();
  }

  double? _totalAmt = 0;
  double? get totalAmt => _totalAmt;

  void setTotalAmt(input) {
    _totalAmt = input;
    notifyListeners();
  }

  // Widget purchase(BuildContext context) {
  //   return Container(
  //       height: 10,
  //       color: Color.fromARGB(255, 255, 160, 153),
  //       child: Text(
  //         'Purchase',
  //         style: TextStyle(color: Colors.red),
  //       ));
  // }

  List<TransactionModel> _newTransactionList = [];

  UnmodifiableListView<TransactionModel> get newTransactionList =>
      UnmodifiableListView(_newTransactionList);

  addTransaction(TransactionModel transactionModel) {
    _newTransactionList.add(transactionModel);
    notifyListeners();
  }

  deleteitem(index) {
    _newTransactionList.removeWhere((_transactionModel) =>
        _transactionModel.name == newTransactionList[index].name && _transactionModel.totalTransaction == newTransactionList[index].totalTransaction);
    notifyListeners();
  }


}
