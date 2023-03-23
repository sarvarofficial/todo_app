import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TodoDate extends StatelessWidget {
  final Function selectDate;
  final DateTime beldilanganKun;
  final Function() keyingiSana;
  final Function() oldingiSana;

  const TodoDate(
    this.selectDate,
    this.beldilanganKun,
    this.keyingiSana,
    this.oldingiSana, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(
            onPressed: oldingiSana,
            icon: Icon(
              Icons.arrow_left,
              size: 34,
            )),
        TextButton(
          onPressed: () {
            selectDate(context);
          },
          child: RichText(
              text: TextSpan(
                  style: TextStyle(color: Colors.black, fontSize: 20),
                  children: [
                TextSpan(
                    text: "${DateFormat.EEEE().format(beldilanganKun)}, ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "${DateFormat("d MMM").format(beldilanganKun)}")
              ])),
        ),
        IconButton(
            onPressed: keyingiSana,
            icon: Icon(
              Icons.arrow_right,
              size: 34,
            ))
      ],
    );
  }
}
