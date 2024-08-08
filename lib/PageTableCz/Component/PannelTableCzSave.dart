import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/ModelDataBase/TableCz.dart';
import '../../Component/NavidPersianDatePicker/src/cupertino/cupertino_date_picker.dart';
import '../../Component/NavidPersianDatePicker/src/date/src/jalali/jalali_date.dart';
import '/Component/InputText.dart';
import '/Funcs.dart';

class PannelTableCzSave extends StatefulWidget {

  final TableCz? data;

  const PannelTableCzSave({super.key,this.data});

  @override
  State<PannelTableCzSave> createState() => _PannelTableCzSaveState();
}

class _PannelTableCzSaveState extends State<PannelTableCzSave> {

  Random rnd = Random();

  late String PathPng;

  late GlobalKey<FormState> FormKey;

  Jalali? initdate;
  late String visitDay;

  late TextEditingController
  txt_Theta_Eo,
      txt_Alpha_Eo,
      txt_SMR_Eo,
      txt_Beta_Eo,
      txt_Theta_Ec,
      txt_Alpha_Ec,
      txt_SMR_Ec,
      txt_Beta_Ec,
      txt_Alpha_after,
      txt_Theta_UT,
      txt_Beta_UT;

  @override
  void initState() {

    txt_Theta_Eo = TextEditingController(text: widget.data?.Theta_Eo.toString());
    txt_Alpha_Eo = TextEditingController(text: widget.data?.Alpha_Eo.toString());
    txt_SMR_Eo = TextEditingController(text: widget.data?.SMR_Eo.toString());
    txt_Beta_Eo = TextEditingController(text: widget.data?.Beta_Eo.toString());
    txt_Theta_Ec = TextEditingController(text: widget.data?.Theta_Ec.toString());
    txt_Alpha_Ec = TextEditingController(text: widget.data?.Alpha_Ec.toString());
    txt_SMR_Ec = TextEditingController(text: widget.data?.SMR_Ec.toString());
    txt_Beta_Ec = TextEditingController(text: widget.data?.Beta_Ec.toString());
    txt_Alpha_after = TextEditingController(text: widget.data?.Alpha_after.toString());
    txt_Theta_UT = TextEditingController(text: widget.data?.Theta_UT.toString());
    txt_Beta_UT = TextEditingController(text: widget.data?.Beta_UT.toString());

    if(widget.data!=null){
      List<String> date = widget.data!.date!.split('/');
      String year = date.elementAt(0).trim();
      String mounth = date.elementAt(1).trim();
      String day = date.elementAt(2).trim();
      initdate = Jalali(int.parse(year),int.parse(mounth),int.parse(day));
    }
    else{
      initdate = Jalali.now();
    }

    visitDay = '${initdate!.year} / ${initdate!.month} / ${initdate!.day}';

    FormKey = GlobalKey<FormState>();

    PathPng = 'assets/wave/${rnd.nextInt(30)}.png';

    // TODO: implement initState
    super.initState();

  }

  Jalali? tempPickedDate;
  SetBirthDay() async {

    FocusManager.instance.primaryFocus!.unfocus();

    Jalali? pickedDate =
    await showModalBottomSheet<Jalali>(
        context: context,
        builder: (context)
        {
          return Container(
            height: 250,
            child: Column(
              children: <Widget>[
                FractionallySizedBox(
                  widthFactor: 0.9,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('لغو',style: TextStyle(
                            color: Colors.white,
                          )),
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )),
                              backgroundColor: MaterialStatePropertyAll(Colors.red)
                          ),
                        ),
                        Image.asset('assets/png/calender.png',width: 30,height: 30),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(
                                tempPickedDate ?? initdate);
                          },
                          child: Text('تایید',style: TextStyle(
                            color: Colors.white,
                          )),
                          style: ButtonStyle(
                              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )),
                              backgroundColor: MaterialStatePropertyAll(Color(0xff43c79f))
                          ),

                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                ),
                Expanded(
                  child: Container(
                    child: PCupertinoDatePicker(
                      mode: PCupertinoDatePickerMode.date,
                      initialDateTime: initdate,
                      textStyleYear: TextStyle(
                          fontFamily: 'SansFaNum',
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                      textStyleMonth: TextStyle(
                          fontFamily: 'SansFaNum',
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                      textStyleDay: TextStyle(
                          fontFamily: 'SansFaNum',
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                      ),
                      onDateTimeChanged: (Jalali dateTime) {
                        tempPickedDate = dateTime;
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });

    if(pickedDate==null)
      return;


    setState(() {

      visitDay = '${pickedDate.year} / ${pickedDate.month} / ${pickedDate.day}';
      initdate = pickedDate;

    });

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      decoration: BoxDecoration(
          color: Colors.indigoAccent,
          borderRadius: BorderRadius.circular(10)
      ),
      constraints: BoxConstraints(
        maxHeight: 0.8.sh,
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
                  PathPng,
                  alignment: Alignment.center,fit: BoxFit.fill).animate(
                effects: [
                  ScaleEffect(begin: Offset(0.0, 0.0),end: Offset(1.0, 1.0),duration: 300.ms,delay: 300.ms,alignment: Alignment.center)
                ] ,
              )
          ),

          Form(
            key: FormKey,
            child: Flexible(
              child: ListView(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: BouncingScrollPhysics(),
                children: [

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/0.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'θ-Eo' : null,
                      prefix: widget.data==null ? null : 'θ-Eo : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_Theta_Eo,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/1.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'α-Eo' : null,
                      prefix: widget.data==null ? null : 'α-Eo : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_Alpha_Eo,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/2.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'SMR-Eo' : null,
                      prefix: widget.data==null ? null : 'SMR-Eo : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_SMR_Eo,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/3.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'β-Eo' : null,
                      prefix: widget.data==null ? null : 'β-Eo : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_Beta_Eo,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/4.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'θ-Ec' : null,
                      prefix: widget.data==null ? null : 'θ-Ec : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_Theta_Ec,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/5.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'α-Ec' : null,
                      prefix: widget.data==null ? null : 'α-Ec : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_Alpha_Ec,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/6.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'SMR-Ec' : null,
                      prefix: widget.data==null ? null : 'SMR-Ec : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_SMR_Ec,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/7.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'β-Ec' : null,
                      prefix: widget.data==null ? null : 'β-Ec : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_Beta_Ec,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/8.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'α-after' : null,
                      prefix: widget.data==null ? null : 'α-after : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_Alpha_after,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/9.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'θ-UT' : null,
                      prefix: widget.data==null ? null : 'θ-UT : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_Theta_UT,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.h
                    ),
                    child: InputText(
                      pathPng: 'assets/wave/10.png',
                      textDirection: TextDirection.ltr,
                      textAlign: widget.data==null ? TextAlign.center : TextAlign.start,
                      hint: widget.data==null ? 'β-UT' : null,
                      prefix: widget.data==null ? null : 'β-UT : ',
                      textInputType: TextInputType.numberWithOptions(decimal: true,signed: true),
                      Validator: ValidFloatNumber,
                      controller: txt_Beta_UT,
                    ),
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.max,
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: SetBirthDay,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 7
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: IntrinsicWidth(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [

                                Text('تاریخ ویزیت :',
                                    textAlign: TextAlign.right,
                                    textDirection: TextDirection.rtl,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontFamily: 'SansFaNum',
                                        fontSize: 11.sp
                                    )),

                                SizedBox(height: 7.h),

                                Text(visitDay,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'SansFaNum',
                                        fontSize: 15.sp
                                    )),

                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )

                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 15
            ),
            child: ElevatedButton(
              onPressed: () async {

                  if(FormKey.currentState!.validate()){

                    FocusManager.instance.primaryFocus?.unfocus();

                    TableCz tblCz = TableCz(
                        date: visitDay,
                        Theta_Ec: double.parse(txt_Theta_Ec.text),
                        Theta_Eo: double.parse(txt_Theta_Eo.text),
                        Theta_UT: double.parse(txt_Theta_UT.text),
                        Alpha_Ec: double.parse(txt_Alpha_Ec.text),
                        Alpha_Eo: double.parse(txt_Alpha_Eo.text),
                        Alpha_after: double.parse(txt_Alpha_after.text),
                        Beta_Ec: double.parse(txt_Beta_Ec.text),
                        Beta_Eo: double.parse(txt_Beta_Eo.text),
                        Beta_UT: double.parse(txt_Beta_UT.text),
                        SMR_Ec: double.parse(txt_SMR_Ec.text),
                        SMR_Eo: double.parse(txt_SMR_Eo.text)
                    );

                    Navigator.pop(context,tblCz);

                  }

              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('تایید',style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 15.sp
                  )),
                  SizedBox(width: 5),
                  Image.asset('assets/png/ok.png',width: 30,height: 30)
                ],
              ),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  fixedSize: MaterialStateProperty.all(Size(double.maxFinite,40))
              ),
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
