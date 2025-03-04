import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/Component/CartFormula.dart';
import '/ModelDataBase/TableCz.dart';
import '/Funcs.dart';

class CartFormula6Cz extends StatelessWidget {

  final TableCz data;

  const CartFormula6Cz({super.key,required this.data});

  @override
  Widget build(BuildContext context) {

    String TextFormula = '(β_Eo - β_UT) / β_Eo';

    String ResultFormula = '(${data.Beta_Eo} - ${data.Beta_UT}) / ${data.Beta_Eo}';

    double Res = ((data.Beta_Eo! - data.Beta_UT!) / data.Beta_Eo!) * 100;

    String Result = '${Res.toStringAsFloat(4)}%';

    Color BackColor = Res < 15 ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3);

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
              child: Text('Result < 15%',
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
