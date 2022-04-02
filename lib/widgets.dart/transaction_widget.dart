// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:invoiceapp/Notifiers/transaction_notifier.dart';
import 'package:provider/provider.dart';

class TranscationList extends StatelessWidget {
  const TranscationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Transactions transactions = Provider.of<Transactions>(context);
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: ((context, index) => Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 15, right: 0, top: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${transactions.newTransactionList[index].name}',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black.withOpacity(0.8)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Total',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12.5),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 1,
                          ),
                          Text(
                            '₹ '
                            '${transactions.newTransactionList[index].totalTransaction}',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    ]
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    thickness: 0.4,
                  )
                ],
              ),
            )),
        itemCount: transactions.newTransactionList.length,
      ),
    );
  }
}
