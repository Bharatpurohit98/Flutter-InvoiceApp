// ignore_for_file: use_key_in_widget_constructors, constant_identifier_names, prefer_final_fields, prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invoiceapp/Login/details.dart';
import 'package:invoiceapp/Components/globalvariables.dart' as globals;
import 'package:invoiceapp/Notifiers/login_notifier.dart';
import 'package:provider/provider.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final phoneController = TextEditingController();
final otpController = TextEditingController();
final contact = phoneController.text;
final phoneNumber = "+91" + contact;

class _LoginScreenState extends State<LoginScreen> {
  
  final formKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();
  
  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  FirebaseAuth _auth = FirebaseAuth.instance;

  String? verificationId;

  bool showLoading = false;


  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);

      setState(() {
        showLoading = false;
      });

      if (authCredential.user != null) {
        globals.storeNumber = phoneController.text;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BusinessName()));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message!)));
    }
  }

  getMobileFormWidget(context) {
    LoginNotifier loginNotifier = Provider.of<LoginNotifier>(context);
    return Column(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 30),
          height: 150,
          child: Text('Sign Up', style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),)
        ),
        Form(
          key: formKey,
          child: TextFormField(
            controller: phoneController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10)
            ],
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value == '' ) {
                return 'Enter Contact Number';
              }
              //globals.saleCustomer = customerNameController.text!;
              return null;
            },
            style: TextStyle(fontSize: 16),
            onChanged: (phoneNumber) => {
              loginNotifier.setPhone(int.parse(phoneNumber)),
            },
            decoration: InputDecoration(
                prefix: Text("+91"),
                labelText: 'Phone Number',
                prefixIcon: Icon(
                  Icons.phone_android,
                  size: 30,
                ),
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
        ),
        // TextField(
        //   controller: phoneController,
        //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        //   keyboardType: TextInputType.number,
        //   maxLength: 10,
        //   decoration: InputDecoration(
        //     prefix: Text("+91"),
        //     hintText: "Phone Number",
        //     prefixIcon: Icon(
        //       Icons.phone_android,
        //       size: 30,
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
              onPressed: () async {
                
                if(formKey.currentState!.validate()){
                setState(() {
                  showLoading = true;
                });
                await _auth.verifyPhoneNumber(
                  phoneNumber: phoneNumber,
                  verificationCompleted: (phoneAuthCredential) async {
                    setState(() {
                      showLoading = false;
                    });
                  },
                  verificationFailed: (phoneVerificationFailed) async {
                    var verificationFailed;
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(verificationFailed.message)));
                    setState(() {
                      showLoading = false;
                    });
                  },
                  codeSent: (verificationId, resendingToken) async {
                    setState(() {
                      showLoading = false;
                      currentState =
                          MobileVerificationState.SHOW_OTP_FORM_STATE;
                      this.verificationId = verificationId;
                    });
                  },
                  codeAutoRetrievalTimeout: (verificationId) async {},
                );}
              },
              child: Text(
                "Get OTP",
              ),
              style: TextButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 45),
                backgroundColor: Color.fromARGB(255, 237, 26, 58),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 4,
              )),
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context) {
    return Column(
      children: [
        Spacer(),
         Form(
           key: otpFormKey,
           child: TextFormField(
              controller: otpController,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10)
              ],
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value == '') {
                  return 'Enter OTP';
                }
                //globals.saleCustomer = customerNameController.text!;
                return null;
              },
              style: TextStyle(fontSize: 16),
              onChanged: (oTP) => {
              },
              decoration: InputDecoration(
                  labelText: 'Enter OTP',
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
         ),
        // TextField(
        //   controller: otpController,
        //   inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        //   keyboardType: TextInputType.number,
        //   decoration: InputDecoration(
        //     hintText: "Enter Otp",
        //     prefixIcon: Icon(
        //       Icons.account_circle,
        //       size: 30,
        //     ),
        //   ),
        // ),
        SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: ElevatedButton(
              onPressed: () async {
                if(otpFormKey.currentState!.validate()){
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationId!,
                        smsCode: otpController.text);

                signInWithPhoneAuthCredential(phoneAuthCredential);}
              },
              child: Text(
                "Verify",
              ),
              style: TextButton.styleFrom(
                minimumSize: Size(MediaQuery.of(context).size.width, 45),
                backgroundColor: Color.fromARGB(255, 237, 26, 58),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                elevation: 4,
              )),
        ),
        Spacer(),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
        key: _scaffoldkey,
        child: Scaffold(
            body: Container(
          child: showLoading
              ? Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    backgroundColor: Colors.black,
                  ),
                )
              : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
                  ? getMobileFormWidget(context)
                  : getOtpFormWidget(context),
          padding: const EdgeInsets.all(16),
        )));
  }
}
