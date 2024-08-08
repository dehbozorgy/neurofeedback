import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '/Component/CartGender/CartGender.dart';
import '/Component/CartGender/GenderController.dart';
import '/Component/InputText.dart';
import '/ModelDataBase/TableUser.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../Component/NavidPersianDatePicker/src/cupertino/cupertino_date_picker.dart';
import '../../Component/NavidPersianDatePicker/src/date/src/jalali/jalali_date.dart';

class PannelUserSave extends StatefulWidget {

  final TableUser? data;

  const PannelUserSave({super.key,required this.data});

  @override
  State<PannelUserSave> createState() => _PannelUserSaveState();
}

class _PannelUserSaveState extends State<PannelUserSave> {

  late GlobalKey<FormState> keyForm;

  late GenderController genderController;

  late String PngGender;

  Jalali? initdate;
  late String birthDay;

  late TextEditingController txtName,txtFamily,txtMobile;

  @override
  void initState() {

    txtName = TextEditingController(text: widget.data?.name);
    txtFamily = TextEditingController(text: widget.data?.family);
    txtMobile = TextEditingController(text: widget.data?.mobile?.substring(2));


    if(widget.data!=null){

      genderController = GenderController(input: widget.data!.gender);

      PngGender = widget.data!.gender ? 'assets/png/man.png' : 'assets/png/woman.png';

      List<String> date = widget.data!.birthday.split('/');
      String year = date.elementAt(0).trim();
      String mounth = date.elementAt(1).trim();
      String day = date.elementAt(2).trim();
      initdate = Jalali(int.parse(year),int.parse(mounth),int.parse(day));

    }
    else {

      genderController = GenderController(input: true);

      PngGender = 'assets/png/man.png';

      initdate = Jalali.now().addYears(-18);
    }

    birthDay = '${initdate!.year} / ${initdate!.month} / ${initdate!.day}';

    keyForm = GlobalKey<FormState>();

    // TODO: implement initState
    super.initState();

    genderController.addListener(() {
      setState(() {
        if(genderController.value)
          PngGender = 'assets/png/man.png';
        else
          PngGender = 'assets/png/woman.png';
      });
    });

  }

  String? ValideLessThan3Char(String? Input) {
    if(Input == null || Input.length < 3)
      return 'کمتر از 3 کارکتر منطقی نیست';
    return null;
  }

  String? ValideMobile(String? Input) {
    if('09$Input'.isValidIranianMobileNumber())
      return null;
    return 'شماره موبایل صحیح نیست';
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

      birthDay = '${pickedDate.year} / ${pickedDate.month} / ${pickedDate.day}';
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
        maxHeight: 0.7.sh,
      ),
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Container(
              width: 80.w,height: 80.w,
              padding: EdgeInsets.all(5),
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
              child: Image.asset(
                  PngGender,
                  alignment: Alignment.center,fit: BoxFit.fill).animate(
                effects: [
                  ScaleEffect(begin: Offset(0.0, 0.0),end: Offset(1.0, 1.0),duration: 300.ms,delay: 300.ms,alignment: Alignment.center)
                ] ,
              )
          ),

          Flexible(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: BouncingScrollPhysics(),
              children: [

                Form(
                  key: keyForm,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [

                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.h
                        ),
                        child: InputText(
                          hint: 'نام بیمار',
                          pathPng: 'assets/png/patient.png',
                          Validator: ValideLessThan3Char,
                          controller: txtName,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h
                        ),
                        child: InputText(
                          hint: 'نام خانوادگی',
                          pathPng: 'assets/png/patient.png',
                          Validator: ValideLessThan3Char,
                          controller: txtFamily,
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h
                        ),
                        child: InputText(
                          pathPng: 'assets/png/mobile.png',
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.start,
                          textInputType: TextInputType.number,
                          length: 9,
                          prefix: '09',
                          Validator: ValideMobile,
                          controller: txtMobile,

                        ),
                      ),

                    ],

                  ),
                ),

                IntrinsicHeight(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.symmetric(
                          vertical: 7
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7)
                        ),
                          child: CartGender(genderController: genderController),
                      ),

                      SizedBox(width: 10),

                      Expanded(child:
                       GestureDetector(
                         onTap: SetBirthDay,
                         child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 7
                          ),
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Column(

                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [

                              Text('تاریخ تولد :',
                                textAlign: TextAlign.right,
                                textDirection: TextDirection.rtl,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'SansFaNum',
                                      fontSize: 11.sp
                                  )),

                              Text(birthDay,
                                  textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'SansFaNum',
                                  fontSize: 15.sp
                                )),

                            ],
                          ),
                                                 ),
                       )
                      )


                    ],
                  ),
                )

              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(
                vertical: 15
            ),
            child: ElevatedButton(
              onPressed: () async {

                if(keyForm.currentState!.validate()){

                  FocusManager.instance.primaryFocus?.unfocus();

                  TableUser tblUser = TableUser(name: txtName.text, family: txtFamily.text, mobile: '09${txtMobile.text}' ,birthday: birthDay, gender: genderController.value, ListTableCz: [], ListTableO1: [], ListTableF3: [], ListTableF4: [], ListTableFz: []);

                  Navigator.pop(context,tblUser);

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
