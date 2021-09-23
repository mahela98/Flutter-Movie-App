import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class CardTop extends StatelessWidget {
  final releaseDate;
  final voteAverage;
  final DateFormat rFormat = DateFormat('yyyy');

  CardTop(this.releaseDate, this.voteAverage);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          color: Colors.black.withOpacity(0.8)),
      width: 100.w,
      height: 50.h,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 4, 0, 0),
        child: Row(
          children: [
            Flexible(
              flex: 5,
              fit: FlexFit.tight,
              child: Text(
                rFormat.format(releaseDate),
                style: TextStyle(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyan[300],
                ),
              ),
            ),
            Flexible(
                flex: 1,
                child: Text(
                  voteAverage.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.tealAccent[700],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
