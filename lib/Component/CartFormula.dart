import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartFormula extends StatefulWidget {

  final String TextFormula;

  final String? ResultFormula;

  final String? Result;

  final Color? BackColor;

  const CartFormula({super.key,required this.TextFormula,this.ResultFormula,this.Result,this.BackColor});

  @override
  State<CartFormula> createState() => _CartFormulaState();
}

class _CartFormulaState extends State<CartFormula> {

  late bool showFormula;

  @override
  void initState() {
    showFormula = widget.Result==null;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: 150.ms,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: showFormula ? Colors.white : widget.BackColor ?? Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                blurStyle: BlurStyle.outer,
                spreadRadius: 0,
                blurRadius: 3
            )
          ]
      ),
      child: SizedBox(
        height: 25.w,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.Result==null ?
            Image.asset('assets/png/eyeClose.png',width: 25.w,height: 25.w) :
            GestureDetector(
              onTap: (){
                setState(() {
                  showFormula ^= true;
                });
              },
              child: Image.asset(showFormula ? 'assets/png/eyeClose.png' : 'assets/png/eyeOpen.png',width: 25.w,height: 25.w)
            ),
            VerticalDivider(
              color: Colors.black,
            ),
            Flexible(
              child: SingleChildScrollView(
                padding: EdgeInsets.zero,
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: showFormula ?
                  Text('${widget.TextFormula}',
                      textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13.sp
                    )) :
                  Text('${widget.ResultFormula} = ${widget.Result}',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 13.sp
                      ))
              ),
            )
          ],
        ),
      ),
    );
  }

}
