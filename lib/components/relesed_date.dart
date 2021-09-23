import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RelesedDate extends StatelessWidget {
  final releaseDate;
  final DateFormat rFormat = DateFormat('yyyy-MM-dd');

  RelesedDate(this.releaseDate);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        const Text(
          "Relesed Date: ",
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
          ),
        ),
        Text(
          rFormat.format(releaseDate),
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: Colors.blue[900],
          ),
        )
      ],
    );
  }
}
