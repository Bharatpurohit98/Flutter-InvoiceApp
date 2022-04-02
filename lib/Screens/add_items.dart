
// ignore_for_file: prefer_const_constructors, avoid_print, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:invoiceapp/Components/globalvariables.dart' as globals;
import 'package:invoiceapp/Notifiers/item_notifier.dart';
import 'package:provider/provider.dart';
import 'package:invoiceapp/Notifiers/calculation_notifier.dart';

import '../model/items.dart';

import 'stock_list.dart';


class Products extends StatefulWidget {
  // const Items(productNameVal, salePrice, {Key? key}) : super(key: key);

  @override
  State<Products> createState() => _ProductsState();
}

final productcontroller = TextEditingController();
final quantitycontroller = TextEditingController();
final ratecontroller = TextEditingController();
final discountController = TextEditingController();

// int? qty;
// int? rate;

var subtotal;

var _productName;

var _salePrice;

class _ProductsState extends State<Products> {
  final _formProductKey = GlobalKey<FormState>();
  final _formRateKey = GlobalKey<FormState>();

  String unit = 'Select unit';
  String tax = 'Tax Excluded';
  String taxPercent = 'None';

  @override
  Widget build(BuildContext context) {
    CalculationItemAmt calculationItemAmt =
        Provider.of<CalculationItemAmt>(context);
    ItemNotifier itemNotifier = Provider.of<ItemNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black.withOpacity(0.8),
            )),
        title: Text(
          'Add Line Item',
          style: TextStyle(color: Colors.black.withOpacity(0.8)),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 80,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: const Offset(0, 0.25),
                    )
                  ]),
              child: Container(
                height: 40,
                padding: const EdgeInsets.fromLTRB(10, 15, 10, 5),
                child: Form(
                  key: _formProductKey,
                  child: TextFormField(
                    controller: productcontroller,
                    validator: (value) {
                      if (value == null || value == '') {
                        return 'Enter Product';
                      }
                      //globals.saleCustomer = customerNameController.text!;
                      return null;
                    },
                    style: const TextStyle(fontSize: 16),
                    onSaved: (valueQ) => {
                      _productName = valueQ,
                    },
                    onChanged: (value) => {
                      _productName = value
                      // _productNameVal = value
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
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 150,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: const Offset(0, 0.25),
                    )
                  ]),
              // child: Container(
              //   height:40,
              //   padding: const EdgeInsets.fromLTRB(10, 15,10,5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 65,
                          width: 200,
                          padding: const EdgeInsets.fromLTRB(12, 12, 10, 7),
                          child: TextFormField(
                            controller: quantitycontroller,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(8)
                            ],
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value == '') {
                                return 'Enter quantity';
                              }
                              //globals.saleCustomer = customerNameController.text!;
                              return null;
                            },
                            style: const TextStyle(fontSize: 16),
                            onChanged: (valqty) => {
                              calculationItemAmt
                                  .setQty(double.tryParse(valqty) ?? 0),
                              calculationItemAmt.subTotal(),
                              calculationItemAmt.setEmptyQty(valqty),
                              print('Qty:${calculationItemAmt.qty}'),
                              print('EmptyQ:${calculationItemAmt.emptyQty}'),
                              print('Sub:${calculationItemAmt.subtotal}')
                            },
                            decoration: InputDecoration(
                                labelText: 'Quantity',
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
                        ),
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 65,
                          width: 192,
                          padding: const EdgeInsets.fromLTRB(40, 15, 25, 0),
                          child: ButtonTheme(
                            //alignedDropdown: true,
                            child: DropdownButton<String>(
                              underline: Container(
                                height: 1,
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                ),
                              ),
                              isExpanded: true,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                //overflow: TextOverflow.ellipsis
                              ),
                              items: <String>[
                                'Select unit',
                                'Bag',
                                'Bdl',
                                'Box',
                                'Btl',
                                'Can',
                                'Ctn',
                                'Dzn',
                                'Gm',
                                'Kg',
                                'Ltr',
                                'Ml',
                                'Mtr',
                                'Nos',
                                'Pac',
                                'Pcs',
                                'Prs',
                                'Qtl',
                                'Rol',
                                'Sqf',
                                'Sqm',
                                'Tbs',
                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              value: unit,
                              onChanged: (String? newValue) {
                                setState(() {
                                  unit = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          height: 65,
                          width: 235,
                          padding: const EdgeInsets.fromLTRB(12, 12, 10, 7),
                          child: Form(
                            key: _formRateKey,
                            child: TextFormField(
                              controller: ratecontroller,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(8)
                              ],
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value == '') {
                                  return 'Enter Rate';
                                }
                                //globals.saleCustomer = customerNameController.text!;
                                return null;
                              },
                              style: const TextStyle(fontSize: 16),
                              onChanged: (value) => {
                                _salePrice = value,

                                calculationItemAmt
                                    .setRate(double.tryParse(value) ?? 0),
                                calculationItemAmt.subTotal(),
                                calculationItemAmt.setEmptyRate(value),
                                print('RAte:${calculationItemAmt.rate}'),
                                print('emptyR:${calculationItemAmt.emptyRate}'),
                                print('Sub:${calculationItemAmt.subtotal}')
                                // _salePrice =value,
                                // rate = int.tryParse(ratecontroller.text),
                                //subtotal = "${qty! * rate!}",
                              },
                              onSaved: (value) => {
                                _salePrice = value,
                              },
                              decoration: InputDecoration(
                                  labelText: 'Rate(Price/ Unit)',
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
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 65,
                          width: 130,
                          padding: const EdgeInsets.fromLTRB(0, 15, 10, 0),
                          child: ButtonTheme(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                isExpanded: true,
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                                items: <String>[
                                  'Tax Included',
                                  'Tax Excluded',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          color: Colors.black.withOpacity(0.5)),
                                    ),
                                  );
                                }).toList(),
                                value: calculationItemAmt.taxSelected,
                                onChanged: (String? newValue) {
                                  calculationItemAmt.setTaxSelected(newValue);
                                  calculationItemAmt.taxSelected;
                                  print('${calculationItemAmt.taxSelected}');
                                  // setState(() {
                                  //   tax = newValue!;
                                  // });
                                },
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 205,
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        offset: Offset(0, -0.75),
                        blurRadius: 15,
                        spreadRadius: 0)
                  ]),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 2.5),
                    width: 25,
                    height: 205,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 166, 201, 235),
                    ),
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Text(
                        'Totals and Taxes',
                        style: TextStyle(
                            letterSpacing: 0.3,
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 205,
                    width: 8,
                  ),
                  SizedBox(
                    height: 205,
                    width: 359,
                    child: Column(
                      children: [
                        Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              height: 45,
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'SubTotal',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            Container(
                              alignment: Alignment.bottomLeft,
                              height: 45,
                              padding: EdgeInsets.only(bottom: 5, left: 10),
                              child: Text(
                                '(Rate x Qty)',
                                style: TextStyle(
                                    color: Colors.grey.withOpacity(0.5),
                                    fontSize: 14),
                              ),
                            ),
                            SizedBox(width: 15, height: 45),
                            Container(
                                height: 45,
                                width: 185,
                                padding: EdgeInsets.only(bottom: 3),
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 20, top: 10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    )),
                                  ),
                                  child: Text(
                                    '${calculationItemAmt.emptyQty}' == '' ||
                                            '${calculationItemAmt.emptyRate}' ==
                                                ''
                                        ? '0.0'
                                        : '${calculationItemAmt.subtotal}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                )),
                            SizedBox(
                              width: 10,
                              height: 45,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 2,
                          width: 300,
                        ),
                        Row(children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            height: 45,
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Discount',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 95,
                          ),
                          Container(
                            height: 45,
                            width: 50,
                            padding: EdgeInsets.only(bottom: 3),
                            child: TextFormField(
                                controller: discountController,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3)
                                ],
                                keyboardType: TextInputType.number,
                                onEditingComplete: () {
                                  calculationItemAmt.setNet();
                                },
                                onChanged: (value) {
                                  calculationItemAmt.setEmptyDiscount(value);
                                  calculationItemAmt.setDiscountPercent(
                                      double.tryParse(value) ?? 0);
                                  // calculationItemAmt.taxType;

                                  calculationItemAmt.emptyDiscount;
                                  calculationItemAmt.discountPercent;
                                  calculationItemAmt.discountCal();

                                  if (calculationItemAmt.taxSelected ==
                                      "Tax Included") {
                                    calculationItemAmt.setTaxIncluded();
                                  } else {
                                    calculationItemAmt.setTaxExcluded();
                                  }

                                  // print('${calculationItemAmt.emptyDiscount}');
                                  // print(
                                  //     '${calculationItemAmt.discountPercent}');
                                  // print('${calculationItemAmt.discountCal()}');
                                },
                                decoration: InputDecoration(
                                  suffixText: '%',
                                )),
                          ),
                          Container(
                              height: 45,
                              width: 138,
                              padding: EdgeInsets.only(left: 15, bottom: 3),
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(left: 20, top: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  )),
                                ),
                                child: Text(
                                  '${calculationItemAmt.emptyDiscount}' == ''
                                      ? '0.0'
                                      : '${calculationItemAmt.discount}',
                                ),
                              )),
                          // child: TextFormField(
                          //   controller: discountController,
                          //   decoration: InputDecoration(
                          //     prefixIcon: Icon(
                          //       Icons.currency_rupee,
                          //       size: 18,
                          //     ),
                          //   ),
                          // )),
                          SizedBox(
                            width: 10,
                            height: 45,
                          )
                        ]),
                        SizedBox(
                          height: 3,
                          width: 300,
                        ),
                        Row(
                          children: [
                            Container(
                              alignment: Alignment.bottomLeft,
                              height: 45,
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                'Tax %',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              width: 75,
                            ),
                            Container(
                              height: 48,
                              width: 90,
                              padding: EdgeInsets.only(bottom: 0),
                              child: DropdownButton<String>(
                                onTap: () {},
                                underline: Container(
                                  height: 1,
                                  decoration: const BoxDecoration(
                                    color: Colors.black,
                                  ),
                                ),
                                isExpanded: true,
                                style: const TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 1),
                                  fontSize: 12,
                                  //overflow: TextOverflow.ellipsis
                                ),
                                items: <String>[
                                  'None',
                                  'Exempted',
                                  'GST@0%',
                                  'IGST@0%',
                                  'GST@0.25%',
                                  'IGST@0.25%',
                                  'GST@3%',
                                  'IGST@3%',
                                  'GST@5%',
                                  'IGST@5%',
                                  'GST@12%',
                                  'IGST@12%',
                                  'GST@18%',
                                  'IGST@18%',
                                  'GST@28%',
                                  'IGST@28%',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  );
                                }).toList(),
                                value: calculationItemAmt.taxType,
                                onChanged: (String? newValue) {
                                  calculationItemAmt.setNet();

                                  calculationItemAmt.setTaxType(newValue!);
                                  // calculationItemAmt.setTaxExcluded();
                                  if (calculationItemAmt.taxSelected ==
                                      "Tax Included") {
                                    calculationItemAmt.setTaxIncluded();
                                  } else {
                                    calculationItemAmt.setTaxExcluded();
                                  }

                                  calculationItemAmt.setTotalAmountAfterTax();
                                  // taxPercent = calculationItemAmt.taxType!;
                                  // setState(() {
                                  //   taxPercent = newValue!;
                                  // });
                                },
                              ),
                            ),
                            Container(
                                alignment: Alignment.centerLeft,
                                height: 45,
                                width: 140,
                                padding: EdgeInsets.only(bottom: 7, left: 15),
                                child: Container(
                                  alignment: Alignment.centerRight,
                                  padding: EdgeInsets.only(left: 20, top: 10),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    )),
                                  ),
                                  child: Text(
                                    '${calculationItemAmt.tax}',
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                )),
                            SizedBox(
                              height: 45,
                              width: 10,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 1,
                          width: 300,
                        ),
                        Row(children: [
                          Container(
                            alignment: Alignment.bottomLeft,
                            height: 45,
                            padding: EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Total Amount:',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                          ),
                          SizedBox(
                            height: 45,
                            width: 40,
                          ),
                          Container(
                              alignment: Alignment.centerLeft,
                              height: 45,
                              width: 200,
                              padding: EdgeInsets.only(bottom: 7, left: 15),
                              child: Container(
                                alignment: Alignment.centerRight,
                                padding: EdgeInsets.only(left: 20, top: 10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.black,
                                    width: 1.0,
                                  )),
                                ),
                                child: Text(
                                  '${calculationItemAmt.totalAmountAfterTax}',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16),
                                ),
                              )),
                          SizedBox(
                            height: 45,
                            width: 10,
                          )
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(
                onPressed: () => {
                      globals.productNNNNN = _productName,
                      globals.ratePPPP = _salePrice,
                      // if(_formProductKey.currentState!.validate() && _formRateKey.currentState!.validate()){
                      //   _formProductKey.currentState?.save(),
                      //   _formRateKey.currentState?.save(),
                      // },
                      //context.read<ItemNotifier>().addItem(Items(_productNameVal,_salePrice)),
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Stock()))

                      itemNotifier.addItem(Items(_productName, _salePrice)),

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Stock()))
                    },
                child: const Text(
                  "SAVE",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(370, 42),
                  primary: const Color.fromARGB(255, 222, 226, 253),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  elevation: 4,
                )),
          ],
        ),
      ),
    );
  }
}
