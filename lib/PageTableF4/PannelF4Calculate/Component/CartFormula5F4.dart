import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Component/CartFormula.dart';
import '../../../ModelDataBase/TableF3.dart';
import '../../../ModelDataBase/TableF4.dart';
import '/Funcs.dart';
import 'dart:math' as Math;

class CartFormula5F4 extends StatelessWidget {

  final TableF4 data;

  final TableF3? tableF3;

  const CartFormula5F4({super.key,required this.data,this.tableF3});

  @override
  Widget build(BuildContext context) {
    String TextFormula = '( F3_θ - F4_θ ) / min';

    String? ResultFormula;

    double? Res;

    String? Result;

    Color? BackColor;

    if(tableF3!=null) {

      double min = Math.min<double>(tableF3!.Theta_Ec!, data.Theta_Ec!);

      ResultFormula = '(${tableF3!.Theta_Ec!} - ${data.Theta_Ec!}) / $min';

      Res = ((tableF3!.Theta_Ec! - data.Theta_Ec!) / min) * 100;

      Result = '${Res.toStringAsFloat(4)}%';

      BackColor = Res < 10 ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3);

    }

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
              child: Text('Result < 10%',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold
                ),
              )
          ),

          SizedBox(height: 10.h),

          CartFormula(
            TextFormula: TextFormula,
            ResultFormula: ResultFormula,
            Result: Result,
            BackColor: BackColor,
          )

        ],
      ),

    );

  }

}
