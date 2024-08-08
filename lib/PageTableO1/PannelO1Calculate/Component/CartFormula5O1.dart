import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurofeedback/ModelDataBase/TableO1.dart';

import '/Component/CartFormula.dart';
import '/Funcs.dart';

class CartFormula5O1 extends StatelessWidget {

  final TableO1 data;

  const CartFormula5O1({super.key,required this.data});

  @override
  Widget build(BuildContext context) {

    String TextFormula = '( (θ_Eo / β_Eo) - (θ_Ec / β_Ec) ) / (θ_Eo / β_Eo)';

    String ResultFormula = '( (${data.Theta_Eo} / ${data.Beta_Eo}) - (${data.Theta_Ec} / ${data.Beta_Ec}) ) / (${data.Theta_Eo} / ${data.Beta_Eo})';

    double Res = (((data.Theta_Eo! / data.Beta_Eo!) - (data.Theta_Ec! / data.Beta_Ec!)) / (data.Theta_Eo! / data.Beta_Eo!)) * 100;

    String Result = '${Res.toStringAsFloat(4)}%';

    Color BackColor = Res > -25 ? Colors.green.withOpacity(0.3) : Colors.red.withOpacity(0.3);

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
              child: Text('Result > -25%',
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
