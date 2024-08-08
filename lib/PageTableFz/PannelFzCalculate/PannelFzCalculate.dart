import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurofeedback/ModelDataBase/TableFz.dart';

import 'Component/CartFormula1Fz.dart';
import 'Component/CartFormula2Fz.dart';
import 'Component/CartFormula3Fz.dart';
import 'Component/CartFormula4Fz.dart';
import 'Component/CartFormula5Fz.dart';

class PannelFzCalculate extends StatefulWidget {

  final TableFz data;

  const PannelFzCalculate({super.key,required this.data});

  @override
  State<PannelFzCalculate> createState() => _PannelFzCalculateState();
}

class _PannelFzCalculateState extends State<PannelFzCalculate> with TickerProviderStateMixin , AutomaticKeepAliveClientMixin {

  late AnimationController controller;
  late Animation animation1;
  @override
  void initState() {

    controller = AnimationController(vsync: this,duration: 500.ms);

    animation1 = Tween(begin: 0.0,end: 1.0).animate(controller);

    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white24,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(
          vertical: 5.h
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          GestureDetector(
            onTap: (){
              if(controller.isDismissed){
                controller..reset()..forward();
              }
              else if(controller.isCompleted){
                controller.reverse();
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white70,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 0,
                        blurRadius: 3
                    )
                  ]
              ),
              padding: EdgeInsets.all(5),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                textDirection: TextDirection.rtl,
                children: [
                  Text(widget.data.date!,
                      style: TextStyle(
                          fontFamily: 'SansFaNum'
                      )),
                  SizedBox(width: 5.w),
                  Image.asset('assets/png/calender.png',width: 25,height: 25),
                  SizedBox(width: 5.w),
                  Container(
                    width: 25,
                    height: 25,
                    padding: EdgeInsets.all(2),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.lightBlue
                    ),
                    child: FittedBox(
                      child: Icon(Icons.arrow_back_ios_sharp).animate(
                        controller: controller,
                        autoPlay: false,
                        effects: [
                          RotateEffect(begin: 0.25,end: -0.25,)
                        ] ,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),

          SizedBox(height: 8.h),

          ClipRect(
            clipBehavior: Clip.hardEdge,
            child: AnimatedBuilder(
              animation: controller,
              builder: (context,_child){
                return Align(
                  alignment: Alignment.center,
                  heightFactor: animation1.value,
                  child: _child,
                );
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [

                  CartFormula1Fz(data: widget.data),
                  CartFormula2Fz(data: widget.data),
                  CartFormula3Fz(data: widget.data),
                  CartFormula4Fz(data: widget.data),
                  CartFormula5Fz(data: widget.data),

                ],
              ),
            ),
          )

        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

}
