import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

class DatePick extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => DatePickState();
}

class DatePickState extends State {
  bool checked = false;

  _handleClick(BuildContext context, bool? next) async {
    final daethDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now().add(Duration(days: 1)),
      lastDate: DateTime(9999, 12, 31),
    );
    if (daethDate != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => CountDown(daethDate)));
    }
    // print(daethDate.toString());
    // setState(() => {
    //   checked = next!
    // });
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff000000),
          brightness: Brightness.dark,
          title: Text(''),
        ),
        backgroundColor: Color(0xffffffff),
        body: Center(
          child: Checkbox(
            value: checked,
            onChanged: (next) => _handleClick(context, next)
          ),
        ),
      )
    );
  }
}

class CountDown extends StatefulWidget {
  final DateTime deathDate;

  CountDown(this.deathDate);

  @override
  State<StatefulWidget> createState() => CountDownState(deathDate);
}

class CountDownState extends State {
  final DateTime deathDate;

  Timer? timer;
  num showTime = 0;

  CountDownState(this.deathDate);

  @override
  void initState() {
    timer = Timer.periodic(new Duration(milliseconds: 10), (timer) {
      setState(() => {
        showTime = (deathDate.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch) / 1000 / 60 / 60 / 24
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (
      Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff000000),
          brightness: Brightness.dark,
          title: Text(''),
        ),
        backgroundColor: Color(0xffffffff),
        body: Center(
          child: Text(showTime.toStringAsFixed(8)),
        ),
      )
    );
  }
}