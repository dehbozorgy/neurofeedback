import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MenuButton extends StatelessWidget {

  final String Title;

  final Color BgColor;

  const MenuButton({super.key,required this.Title,required this.BgColor});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.elliptical(40, 20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
            spreadRadius: 0,
            blurStyle: BlurStyle.outer
          )
        ]
      ),
      child: DottedBorder(
        color: BgColor,
        padding: EdgeInsets.all(5),
        radius: Radius.elliptical(40, 20),
        borderType: BorderType.RRect,
        dashPattern: [8, 4],
        strokeWidth: 5,
        child: Hero(
          tag: Title,
          child: Container(
            decoration: BoxDecoration(
                color: BgColor,
                borderRadius: BorderRadius.all(Radius.elliptical(40, 20)),
                shape: BoxShape.rectangle),
            height: 0.2.sw,
            width: 0.2.sw,
            clipBehavior: Clip.hardEdge,
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: FittedBox(
              child: DefaultTextStyle(
                child: Text(Title,
                    textAlign: TextAlign.center,
                ),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 100.sp,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                          color: Colors.grey,
                          blurRadius: 5,
                          offset: Offset(10, 10)
                      )
                    ]
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
