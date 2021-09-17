import 'dart:async';
import 'package:flutter/material.dart';

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
        backgroundColor: Color(0xff000000),
        body: Center(
          child: Text(
            showTime.toStringAsFixed(8),
            style: TextStyle(
              fontFamily: 'mono',
              fontWeight: FontWeight.w600,
              fontSize: 24,
              letterSpacing: 2,
              color: Color(0xffffffff)
            ),
          ),
        ),
      )
    );
  }
}