// ignore_for_file: unnecessary_const, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:invoiceapp/Notifiers/login_notifier.dart';
import 'package:provider/provider.dart';
import 'Login/login.dart';
import 'Notifiers/item_notifier.dart';
import 'Screens/home_screen.dart';
import 'Notifiers/app_state.dart';
import 'package:invoiceapp/Notifiers/app_state.dart';
import 'package:invoiceapp/Notifiers/created_items_notifier.dart';
import 'package:invoiceapp/Notifiers/transaction_notifier.dart';
import 'package:invoiceapp/Screens/home_screen.dart';
import 'Notifiers/calculation_notifier.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      name: 'Android app',
      options: const FirebaseOptions(
          apiKey: ' ',
          appId: ' ',
          messagingSenderId: ' ',
          projectId: ' ',
          databaseURL:
              ' '));
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => ItemNotifier()),
        ChangeNotifierProvider<AppState>(create: (_) => AppState(),),
        ChangeNotifierProvider<CalculationItemAmt>(create: (_) => CalculationItemAmt()),
        ChangeNotifierProvider<CreatedItems>(create: (_) => CreatedItems()),
        ChangeNotifierProvider(create: (_) => Transactions()),
        ChangeNotifierProvider(create: (_) => LoginNotifier()),
      ],
      child: const MyApp(),)
    ); 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: LoginScreen());
  }
}

FirebaseApp app = Firebase.app('Android app');

class InitializerWidget extends StatefulWidget {
  const InitializerWidget({Key? key}) : super(key: key);

  @override
  _InitializerWidgetState createState() => _InitializerWidgetState();
}

class _InitializerWidgetState extends State<InitializerWidget> {
  FirebaseAuth? _auth;


  User? _user;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();  

    _auth = FirebaseAuth.instance;

    _user = _auth!.currentUser;

    isLoading = false;
  }
 
  @override
  Widget build(BuildContext context) {
    return isLoading ? const Scaffold(
            body: const Center(
              child: const CircularProgressIndicator(),
            ),
          )
        : _user == null
            ? LoginScreen()
            : Homescreen();
  }
}
