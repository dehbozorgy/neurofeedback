import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurofeedback/ModelDataBase/TableFz.dart';

import '../../Component/BadgeTable.dart';

class CartTableFz extends StatelessWidget {

  final TableFz data;

  final bool Selected;

  const CartTableFz({super.key,required this.data,required this.Selected});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.grey,width: 5)
        ),
        margin: EdgeInsets.symmetric(
            vertical: 10.h
        ),
        width: 0.9.sw,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [

            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white70
                    ),
                    padding: EdgeInsets.all(5),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      textDirection: TextDirection.rtl,
                      children: [
                        Text(data.date!,
                            style: TextStyle(
                                fontFamily: 'SansFaNum'
                            )),
                        SizedBox(width: 5.w),
                        Image.asset('assets/png/calender.png',width: 25,height: 25)
                      ],
                    ),
                  ),

                  SizedBox(height: 8.h),

                  Center(
                    child: Wrap(
                      spacing: 10.w,
                      runSpacing: 10.h,
                      alignment: WrapAlignment.center,
                      children: [

                        BadgeTable(
                            BackColor: Color(0XFFE699FF),
                            BorderColor: Colors.purple,
                            Title: 'δ-Ec',
                            Value: data.Delta_Ec.toString()),

                        BadgeTable(
                            BackColor: Color(0XFFE699FF),
                            BorderColor: Colors.purple,
                            Title: 'Lo-α',
                            Value: data.Lo_Alpha.toString()),

                        BadgeTable(
                            BackColor: Color(0XFFE699FF),
                            BorderColor: Colors.purple,
                            Title: 'Hi-α',
                            Value: data.Hi_Alpha.toString()),

                        BadgeTable(
                            BackColor: Color(0XFFE699FF),
                            BorderColor: Colors.purple,
                            Title: 'Hi-β',
                            Value: data.Hi_Beta.toString()),

                        BadgeTable(
                            BackColor: Color(0XFFE699FF),
                            BorderColor: Colors.purple,
                            Title: 'β-Ec',
                            Value: data.Beta_Ec.toString()),

                        BadgeTable(
                            BackColor: Color(0XFFE699FF),
                            BorderColor: Colors.purple,
                            Title: 'β-Eo',
                            Value: data.Beta_Eo.toString()),

                      ],
                    ),
                  ),

                ],
              ),
            ),

            Selected ?
            Positioned.fill(
              child: ColoredBox(
                color: Colors.white.withOpacity(0.7),
                child: SizedBox.expand(
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 30.w,
                      height: 30.w,
                      margin: EdgeInsets.only(
                          top: 10,
                          right: 10
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black,width: 1)
                      ),
                      child: FittedBox(child: Icon(Icons.check_circle,color: Colors.green)).animate(
                        effects: [
                          ScaleEffect(begin: Offset(0.0, 0.0),end: Offset(1.0, 1.0),duration: 200.ms,delay: 100.ms,alignment: Alignment.center,curve: Curves.fastOutSlowIn)
                        ] ,
                      ),
                    ),
                  ),
                ),
              ),
            ) :
            SizedBox.shrink()

          ],
        ),
      ),
    );
  }
}
