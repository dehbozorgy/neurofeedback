import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PageTableCalculate extends StatelessWidget {

  final List<Widget> ListPannelCalculate;

  const PageTableCalculate({super.key,required this.ListPannelCalculate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(10)
      ),
      constraints: BoxConstraints(
        maxHeight: 0.9.sh,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
              width: 80.w,height: 80.w,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.7),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 0,
                        blurRadius: 5
                    )
                  ]
              ),
              clipBehavior: Clip.hardEdge,
              child: Image.asset(
                  'assets/png/ok.png',
                  alignment: Alignment.center,fit: BoxFit.fill).animate(
                effects: [
                  ScaleEffect(begin: Offset(0.0, 0.0),end: Offset(1.0, 1.0),duration: 300.ms,delay: 300.ms,alignment: Alignment.center)
                ] ,
              )
          ),

          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              itemCount: ListPannelCalculate.length,
              itemBuilder: (context,index){
                return ListPannelCalculate.elementAt(index);
              },
            ),
          ),

          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                textDirection: TextDirection.rtl,
                children: [
                  Text('OK',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.sp
                  )),
                  SizedBox(width: 5),
                  Image.asset('assets/emoji/ok2.png',width: 30,height: 30)
                ],
              ),
            ),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.green),
                fixedSize: MaterialStateProperty.all(Size.fromWidth(100.w)),
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
          ),

        ],
      ),
    ).animate(
      effects: [
        ScaleEffect(begin: Offset(0.0, 0.0),end: Offset(1.0, 1.0),duration: 300.ms,alignment: Alignment.center)
      ] ,
    );
  }

}
