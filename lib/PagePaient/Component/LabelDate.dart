import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/ModelDataBase/TableUser.dart';

class LabelDate extends StatelessWidget {

  final TableUser data;

  const LabelDate({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
          horizontal: 0.05.sw,
          vertical: 10
      ),
      decoration: BoxDecoration(
          color: Colors.grey.shade300
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        textDirection: TextDirection.rtl,
        children: [

          Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('وضعیت درمان \n تحت درمان',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      fontSize: 11.sp
                  )),
              SizedBox(width: 5),
              SizedBox(
                  width: 40,height: 40,
                  child: FittedBox(
                      child: Icon(Icons.add_moderator_rounded,color: Color(0xff43c79f)))
              )
            ],
          ),

          Spacer(),

          Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(builder: (context){
                List<String> birthDate = data.birthday.split('/');
                String year = birthDate[0].trim().padLeft(2,'0');
                String month = birthDate[1].trim().padLeft(2,'0');
                String day = birthDate[2];
                return Text('تاریخ تولد \n ${year}/${month}/${day}',
                    textAlign: TextAlign.right,
                    style: TextStyle(
                        fontFamily: 'SansFaNum',
                        fontSize: 11.sp
                    ));
              }),
              SizedBox(width: 5),
              SizedBox(
                  width: 40,height: 40,
                  child: FittedBox(child: Icon(Icons.calendar_month_rounded,color: Color(0xff43c79f))))
            ],
          )

        ],
      ),
    );
  }

}
