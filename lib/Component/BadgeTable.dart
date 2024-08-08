import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BadgeTable extends StatelessWidget {

  final Color BackColor;

  final Color BorderColor;

  final String Title;

  final String Value;

  const BadgeTable({super.key,required this.BackColor,required this.BorderColor,required this.Title,required this.Value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: BackColor,
        border: Border.all(color: BorderColor,width: 3),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurStyle: BlurStyle.outer,
            spreadRadius: 0,
            blurRadius: 5
          )
        ]
      ),
      child: IntrinsicWidth(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(Title,
              textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
                )
            ),
            Divider(
              color: Colors.black,
              thickness: 1,
            ),
            Text(Value,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 11.sp,
                    color: Colors.black,
                    fontFamily: 'SansFaNum'
                )
            ),
          ],
        ),
      ),
    );
  }
}
