import 'package:flutter/material.dart';

import 'pages/datepick.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        dialogBackgroundColor: Colors.white,
        colorScheme: ColorScheme.light(primary: Colors.black),
        buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
        highlightColor: Colors.grey[400],
      ),
      home: DatePick(), // MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}