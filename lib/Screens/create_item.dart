// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:invoiceapp/Notifiers/created_items_notifier.dart';
import 'package:invoiceapp/Screens/home_screen.dart';
import 'package:invoiceapp/model/items.dart';
import 'package:provider/provider.dart';

class NewItem extends StatelessWidget {
 
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    CreatedItems createdItems = Provider.of<CreatedItems>(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.8),
            )),
        title: Text(
          'Create New Item',
          style: TextStyle(color: Colors.black.withOpacity(0.8)),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                height: 4,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value == '') {
                            return 'Enter Product';
                          }
                          return null;
                        },
                        style: const TextStyle(fontSize: 16),
                        onSaved: (valueQ) => {},
                        onChanged: (value) => {
                          createdItems.setProductName(value),
                        },
                        decoration: InputDecoration(
                            labelText: 'Product',
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
                    ),
                    Container(
                      height: 20,
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(bottom: 10),
                            child: Text(
                              'Price',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          TextFormField(
                            // validator: (value) {
                            //   if (value == null || value == '') {
                            //     return 'Enter Sale Price';
                            //   }
                            //   return null;
                            // },
                            style: const TextStyle(fontSize: 16),
                            onSaved: (valueQ) => {},
                            onChanged: (value) => {
                              createdItems.setSalePrice(double.parse(value)),
                            },
                            decoration: InputDecoration(
                                labelText: 'Sale Price',
                                focusColor:
                                    const Color.fromARGB(255, 0, 116, 231),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                          SizedBox(height: 20),
                          TextFormField(
                            // validator: (value) {
                            //   if (value == null || value == '') {
                            //     return 'Purchase Price';
                            //   }
                            //   return null;
                            // },
                            style: const TextStyle(fontSize: 16),
                            onSaved: (valueQ) => {},
                            onChanged: (value) => {
                              createdItems.setPurchasePrice(double.parse(value)),
                            },
                            decoration: InputDecoration(
                                labelText: 'Purchase Price',
                                focusColor:
                                    const Color.fromARGB(255, 0, 116, 231),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                          SizedBox(height: 20,),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Stock',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),),
                          ),
                           SizedBox(height: 20),
                          TextFormField(
                            // validator: (value) {
                            //   if (value == null || value == '') {
                            //     return 'Purchase Price';
                            //   }
                            //   return null;
                            // },
                            style: const TextStyle(fontSize: 16),
                            onChanged: (value) => {
                              createdItems.setStock(double.parse(value)),
                            },
                            decoration: InputDecoration(
                                labelText: 'Opening Stock',
                                focusColor:
                                    const Color.fromARGB(255, 0, 116, 231),
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.auto,
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
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.red[700],
        onPressed: () => {if(_formKey.currentState!.validate()){
          createdItems.addItem(NewItems(createdItems.productName, createdItems.salePrice, createdItems.purchasePrice, createdItems.stock)),
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Homescreen()))}

        },
        icon: Icon(Icons.add_rounded, color: Colors.white),
        label: Text('Create Item', style: TextStyle(color: Colors.white)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
