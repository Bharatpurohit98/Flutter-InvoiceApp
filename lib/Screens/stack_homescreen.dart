// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:invoiceapp/Notifiers/created_items_notifier.dart';
import 'package:invoiceapp/Screens/create_item.dart';
import 'package:invoiceapp/widgets.dart/transaction_widget.dart';
import 'package:provider/provider.dart';

class StackHomeWidgets extends StatefulWidget {
  const StackHomeWidgets({Key? key}) : super(key: key);

  @override
  State<StackHomeWidgets> createState() => _StackHomeWidgetsState();
}

class _StackHomeWidgetsState extends State<StackHomeWidgets> {
  @override
  Widget build(BuildContext context) {
    CreatedItems createdItems = Provider.of<CreatedItems>(context);
    return Column(children: [
      // Container(
      //   height: 110,
      //   padding: EdgeInsets.zero,
      //   child: ListView(
      //     padding: EdgeInsets.all(15),
      //     scrollDirection: Axis.horizontal,
      //     children: [
      //       Container(
      //         width: 150,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(6),
      //             color: Colors.white,
      //             boxShadow: [
      //               BoxShadow(
      //                   color: Colors.grey.withOpacity(0.8),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //         child: Padding(
      //           padding: const EdgeInsets.all(10),
      //           child: Column(
      //             children: [
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //                 children: [
      //                   Icon(
      //                     Icons.arrow_downward_rounded,
      //                     color: Color.fromARGB(255, 54, 175, 131),
      //                   ),
      //                   Text(
      //                     "You'll Get",
      //                     style: TextStyle(color: Colors.grey, fontSize: 17),
      //                   )
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: 5,
      //               ),
      //               Row(
      //                 children: [
      //                   Icon(Icons.currency_rupee),
      //                   Text(
      //                     '16752',
      //                     style: TextStyle(color: Colors.black),
      //                   ),
      //                 ],
      //               )
      //             ],
      //           ),
      //         ),
      //       ),
      //       SizedBox(height: 50, width: 12),
      //       Container(
      //         width: 150,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(6),
      //             color: Colors.white,
      //             boxShadow: [
      //               BoxShadow(
      //                   color: Colors.grey.withOpacity(0.8),
      //                   // offset: Offset(0, -0.75),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //       ),
      //       SizedBox(height: 50, width: 12),
      //       Container(
      //         width: 150,
      //         decoration: BoxDecoration(
      //             borderRadius: BorderRadius.circular(6),
      //             color: Colors.white,
      //             boxShadow: [
      //               BoxShadow(
      //                   color: Colors.grey.withOpacity(0.8),
      //                   // offset: Offset(0, -0.75),
      //                   blurRadius: 4,
      //                   spreadRadius: 0.2)
      //             ]),
      //       )
      //     ],
      //   ),
      // ),
      SizedBox(
        height: 10,
      ),
      Expanded(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              toolbarHeight: 0,
              bottom: TabBar(
                indicatorColor: Colors.red,
                indicatorWeight: 2.5,
                tabs: [
                  // ElevatedButton(onPressed: onPressed, child: child),
                  Tab(
                      child: Text(
                    'Parties',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
                  Tab(
                      child: Text(
                    'Transactions',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  )),
                  Tab(
                      child: Text(
                    'Items',
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ))
                ],
              ),
            ),
            body: TabBarView(
              children: <Widget>[
                Column(
                  children: [
                    // _buildSearchBar(context),
                    // _buildListViewItem(context),
                  ],
                ),
                Column(
                  children: [
                    // _buildSearchBar(context), 
                    TranscationList(),
                  ],
                ),
                Column(
                  children: [
                    _buildSearchBar(context),
                    _buildListViewItem(context),
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }

  Widget _buildListViewItem(BuildContext context) {
    CreatedItems createdItems = Provider.of<CreatedItems>(context);
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemBuilder: ((context, index) => 
          Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(left:15, right: 0, top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${createdItems.newItemsList[index].productName}', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black.withOpacity(0.8)),),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sale Price',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.5),
                            ),
                            SizedBox(height: 1,),
                            Text('₹ '
                                '${createdItems.newItemsList[index].salePrice}', style: TextStyle(color: Colors.black),)
                          ],
                        ),
                        SizedBox(width: 60,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Purchase Price',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.5),
                                  
                            ),
                            SizedBox(height: 1,),
                            Text('₹ '
                                '${createdItems.newItemsList[index].purchasePrice}', style: TextStyle(color: Colors.black),)
                          ],
                        ),
                        SizedBox(width: 60,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'In stock',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12.5),
                                  
                            ),
                            SizedBox(height: 1,),
                            Text(
                                '${createdItems.newItemsList[index].stock}', style: TextStyle(color: Color.fromARGB(255, 54, 175, 131)))
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(thickness: 0.4,)
                  ],
                ),
              )),
              itemCount: createdItems.newItemsList.length,
              ),
    );
  }

  Widget _buildSearchBar(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 5,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => NewItem())),
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: Color.fromARGB(255, 0, 116, 231),
                      size: 16,
                    ),
                    Text('New Item',
                        style: TextStyle(
                            color: Color.fromARGB(255, 0, 116, 231), fontSize: 13)),
                  ],
                ),
                style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 222, 240, 255),
                    minimumSize: Size(70, 10),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22))),
              )
            ],
          ),
        ),
        Divider(thickness: 1, color: Colors.grey.withOpacity(0.4),)
      ],
    );
  }
}
