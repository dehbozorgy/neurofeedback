import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'PagePaient/PagePaient.dart';
import 'package:url_launcher/url_launcher.dart';
import '/ModelDataBase/TableUser.dart';

class CartPatient extends StatelessWidget {

  final TableUser data;

  const CartPatient({super.key,required this.data});

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(
          vertical: 20.h
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              blurRadius: 5
            )
          ]
        ),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            textDirection: TextDirection.rtl,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [

              Container(
                width: 80.w,
                height: 80.w,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          blurStyle: BlurStyle.outer,
                          spreadRadius: 0,
                          blurRadius: 5
                      )
                    ],
                  color: Colors.white.withOpacity(0.3),
                  shape: BoxShape.circle
                ),
                child: Hero(
                  tag: data,
                    child: Image.asset( data.gender ? 'assets/png/man.png' : 'assets/png/woman.png',fit: BoxFit.contain)
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [

                  Text('نام : ${data.name} ${data.family}',
                    textDirection: TextDirection.rtl,
                    maxLines: 3,
                    textAlign: TextAlign.right,
                    overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 11.sp
                      )
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    textDirection: TextDirection.rtl,
                    children: [
                      Text('تاریخ تولد :',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 11.sp
                          )
                      ),
                      Spacer(),
                      Text(data.birthday,
                          textDirection: TextDirection.ltr,
                          style: TextStyle(
                            fontFamily: 'SansFaNum',
                            fontSize: 11.sp
                          ))
                    ],
                  ),

                ],
              )),
              SizedBox(width: 10.w),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 10.h),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PagePaient(data: data)));
                    },
                    child: Container(
                      width: 30.w,
                      height: 30.w,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 0,
                                blurRadius: 5
                            )
                          ],
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle
                      ),
                      child: Image.asset('assets/png/table.png',fit: BoxFit.contain),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () async {
                      Uri _url = Uri.parse('tel:${data.mobile}');
                      await launchUrl(_url,mode: LaunchMode.externalApplication);
                    },
                    child: Container(
                      width: 30.w,
                      height: 30.w,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurStyle: BlurStyle.outer,
                                spreadRadius: 0,
                                blurRadius: 5
                            )
                          ],
                          color: Colors.white.withOpacity(0.3),
                          shape: BoxShape.circle
                      ),
                      child: FittedBox(child: Icon(Icons.phone,color: Colors.green),fit: BoxFit.contain),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
