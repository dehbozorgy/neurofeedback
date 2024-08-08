import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurofeedback/ModelDataBase/TableFz.dart';
import '../../../Component/CartFormula.dart';
import '/Funcs.dart';

class CartFormula2Fz extends StatelessWidget {

  final TableFz data;

  const CartFormula2Fz({super.key,required this.data});

  @override
  Widget build(BuildContext context) {

    String TextFormula = 'Hi_β / β_Ec';

    String ResultFormula = '${data.Hi_Beta} / ${data.Beta_Ec}';

    double Res = data.Hi_Beta! / data.Beta_Ec!;

    String Result = '${Res.toStringAsFloat(4)}';

    Color BackColor = (Res > 0.45 && Res < 0.5) ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3);

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
              child: Text('0.45 < Result < 0.5',
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
