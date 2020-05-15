import 'package:flutter/material.dart';

import 'phonestate/callsAndMessagesService.dart';
import 'phonestate/servicelocator.dart';
import 'ui/home_screen.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {



  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final CallsAndMessagesService _service = locator<CallsAndMessagesService>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: LoadingScreen(),
    );
  }
}


