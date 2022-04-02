// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:invoiceapp/Screens/purchase.dart';

import 'add_Sale.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
          height: 90,
      child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ElevatedButton.icon(
              ElevatedButton(
                  onPressed: () => {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Purchase()))
                      },
                  child: Row(
                    children: [
                      Icon(
                        Icons.add_circle_outlined,
                        size: 18,
                      ),
                      SizedBox(width: 5),
                      Text("Purchases"),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(140, 45),
                    primary: Color.fromARGB(255, 0, 116, 231),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    elevation: 4,
                  )),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(45, 45),
                  shape: CircleBorder(),
                  primary: Color(0xFFE3F2FD),
                  side: BorderSide(color: Colors.blue),
                  elevation: 4,
                ),
                child: Icon(
                  Icons.add,
                  color: Colors.blue[600],
                  size: 30,
                ),
                onPressed: () {
                  //Bottomcontainer();

                  showModalBottomSheet(
                      context: context,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      backgroundColor: Colors.white,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                          child: Column(
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.zero,
                                height: 20,
                                child: Text('Sale Transactions',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.5))),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.receipt_long_rounded,
                                      color: Color.fromARGB(255, 0, 116, 231),
                                      size: 25,
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        minimumSize: Size(50, 53),
                                        backgroundColor:
                                            Color.fromARGB(255, 238, 247, 255)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.currency_rupee_rounded,
                                      color: Color.fromARGB(255, 0, 116, 231),
                                      size: 25,
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        minimumSize: Size(50, 53),
                                        backgroundColor:
                                            Color.fromARGB(255, 238, 247, 255)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.receipt,
                                      color: Color.fromARGB(255, 0, 116, 231),
                                      size: 25,
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        minimumSize: Size(50, 53),
                                        backgroundColor:
                                            Color.fromARGB(255, 238, 247, 255)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.delivery_dining_outlined,
                                      color: Color.fromARGB(255, 0, 116, 231),
                                      size: 25,
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        minimumSize: Size(50, 53),
                                        backgroundColor:
                                            Color.fromARGB(255, 238, 247, 255)),
                                  ),
                                ],
                              ),

                              Row(children: [
                                SizedBox(
                                  height: 3,
                                ),
                              ]),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Sale\ninvoices',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 11,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text('Payment-In',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 11),
                                      textAlign: TextAlign.center),
                                  Text('Estimate/\nQuotation',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 11),
                                      textAlign: TextAlign.center),
                                  Text('Delievery\nChallan',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 11),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                padding: EdgeInsets.zero,
                                height: 20,
                                child: Text('Purchase Transactions',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black.withOpacity(0.5))),
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.shopping_cart_checkout_outlined,
                                      color: Color.fromARGB(255, 0, 116, 231),
                                      size: 25,
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        minimumSize: Size(50, 53),
                                        backgroundColor:
                                            Color.fromARGB(255, 238, 247, 255)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.currency_rupee_rounded,
                                      color: Color.fromARGB(255, 0, 116, 231),
                                      size: 25,
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        minimumSize: Size(50, 53),
                                        backgroundColor:
                                            Color.fromARGB(255, 238, 247, 255)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.edit_note_sharp,
                                      color: Color.fromARGB(255, 0, 116, 231),
                                      size: 25,
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        minimumSize: Size(50, 53),
                                        backgroundColor:
                                            Color.fromARGB(255, 238, 247, 255)),
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Icon(
                                      Icons.shopping_bag_outlined,
                                      color: Color.fromARGB(255, 0, 116, 231),
                                      size: 25,
                                    ),
                                    style: TextButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        minimumSize: Size(50, 53),
                                        backgroundColor:
                                            Color.fromARGB(255, 238, 247, 255)),
                                  ),
                                ],
                              ),

                              Row(children: [
                                SizedBox(
                                  height: 3,
                                ),
                              ]),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Purchase',
                                    style: TextStyle(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 11,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text('Payment-Out',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 11),
                                      textAlign: TextAlign.center),
                                  Text('Dr. Note/\nPurchase\nReturn',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 11),
                                      textAlign: TextAlign.center),
                                  Text('Delievery\nChallan',
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5),
                                          fontSize: 11),
                                      textAlign: TextAlign.center),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Spacer(),
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                style: ElevatedButton.styleFrom(
                                  minimumSize: Size(45, 45),
                                  shape: CircleBorder(),
                                  primary: Colors.black,
                                  elevation: 6,
                                ),
                                child: Icon(
                                  Icons.close_rounded,
                                  color: Color.fromARGB(209, 255, 255, 255),
                                  size: 25,
                                ),
                              )
                              // FloatingActionButton.small(onPressed: () => Navigator.pop(context),
                              //   elevation: 8,
                              //   backgroundColor: Colors.black,
                              //   child: Icon(Icons.close, color: Colors.white, size: 24,),)
                            ],
                          ),
                        );
                      });
                },
              ),
              ElevatedButton(
                onPressed: () => {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Sale()))
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.add_circle_outlined,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text("Add Sale"),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red[700],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  minimumSize: Size(140, 45),
                  elevation: 4,
                ),
              ),
            ],
          ),
    );
  }
}