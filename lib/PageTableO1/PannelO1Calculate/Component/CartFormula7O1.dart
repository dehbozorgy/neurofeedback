import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurofeedback/ModelDataBase/TableO1.dart';

import '/Component/CartFormula.dart';

class CartFormula7O1 extends StatelessWidget {

  final TableO1 data;

  const CartFormula7O1({super.key,required this.data});

  @override
  Widget build(BuildContext context) {

    String TextFormula = 'Peak α Frequency (Ec)';

    return Container(
      padding: EdgeInsets.all(10),
      color: Colors.white54,
      margin: EdgeInsets.symmetric(
          vertical: 10.h
      ),
      width: double.maxFinite,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 0,
                        blurRadius: 3
                    )
                  ]
              ),
              child: Text('Result > 9.5',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold
                ),
              )
          ),

          SizedBox(height: 10.h),

          CartFormula(TextFormula: TextFormula)

        ],
      ),
    );

  }

}
