import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'Component/BgLeft.dart';
import 'Component/BgRigth.dart';
import 'GenderController.dart';

class CartGender extends StatefulWidget {

  final GenderController genderController;

  const CartGender({super.key, required this.genderController});

  @override
  State<CartGender> createState() => _CartGenderState();
}

class _CartGenderState extends State<CartGender> {

  late GenderController genderController;

  @override
  void dispose() {
    if(widget.genderController==null){
      genderController.dispose();
    }
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    if(widget.genderController==null){
      genderController = GenderController();
    }
    else{
      genderController = widget.genderController;
    }
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: genderController,
        builder: (context,value,_){
          return Row(
            mainAxisSize: MainAxisSize.min,
            textDirection: TextDirection.ltr,
            children: [

              GestureDetector(
                onTap: (){
                  if(!genderController.value){
                    genderController.value=true;
                  }
                },
                child: Transform.scale(
                  alignment: Alignment.center,
                  scale: value ? 1.15 : 1.0,
                  child: Container(
                    color: Colors.transparent,
                    child: CustomPaint(
                      painter:
                      BgLeft(
                          backColor: Colors.lightBlueAccent,
                          active: value
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: TextDirection.ltr,
                          children: [
                            Image.asset('assets/png/man.png',width: 30,height: 30),
                            SizedBox(width: 7),
                            Text('آقا',style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13.sp
                            )),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 10),

              GestureDetector(
                onTap: (){
                  if(genderController.value){
                    genderController.value=false;
                  }
                },
                child: Transform.scale(
                  alignment: Alignment.center,
                  scale: !value ? 1.15 : 1.0,
                  child: Container(
                    color: Colors.transparent,
                    child: CustomPaint(
                      painter: BgRigth(
                          backColor: Colors.lightBlueAccent,
                        active: !value
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          textDirection: TextDirection.rtl,
                          children: [
                            Image.asset('assets/png/woman.png',width: 30,height: 30),
                            SizedBox(width: 7),
                            Text('خانم',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13.sp
                                )),
                            SizedBox(width: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

            ],
          );
        }
    );
  }
}
