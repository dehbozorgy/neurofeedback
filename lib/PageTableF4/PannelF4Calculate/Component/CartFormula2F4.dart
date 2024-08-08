import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurofeedback/ModelDataBase/TableF4.dart';
import '../../../Component/CartFormula.dart';
import '/Funcs.dart';

class CartFormula2F4 extends StatelessWidget {

  final TableF4 data;

  const CartFormula2F4({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    String TextFormula = 'θ_Ec / α_Ec';

    String ResultFormula = '${data.Theta_Ec} / ${data.Alpha_Ec}';

    double Res = data.Theta_Ec! / data.Alpha_Ec!;

    String Result = '${Res.toStringAsFloat(4)}';

    Color BackColor = (Res > 1.2 && Res < 1.6) ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3);

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
              child: Text('1.2 < Result < 1.6',
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
