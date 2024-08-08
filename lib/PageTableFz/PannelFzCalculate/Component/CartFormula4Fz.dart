import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurofeedback/ModelDataBase/TableFz.dart';
import '../../../Component/CartFormula.dart';
import '/Funcs.dart';

class CartFormula4Fz extends StatelessWidget {

  final TableFz data;

  const CartFormula4Fz({super.key,required this.data});

  @override
  Widget build(BuildContext context) {

    String TextFormula = 'Lo_α / Hi_α';

    String ResultFormula = '${data.Lo_Alpha} / ${data.Hi_Alpha}';

    double Res = data.Lo_Alpha! / data.Hi_Alpha!;

    String Result = '${Res.toStringAsFloat(4)}';

    Color BackColor = (Res > 1  && Res < 1.5) ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3);

    return  Container(
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
              child: Text('1 < Result < 1.5',
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
