import 'package:flutter/material.dart';

import 'countdown.dart';

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