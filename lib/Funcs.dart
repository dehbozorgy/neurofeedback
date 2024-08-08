import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ExtendedNumber on double {

  String toStringAsFloat(int fract) {

    String strNum = this.toString().split('.')[1];

    if(strNum.length <= fract)
      return this.toString();
    else
      return this.toStringAsFixed(fract);


  }

}

extension ExtendedString on String {

  String get Reverse {
    String output = '';
    for(int i=this.length-1;i>=0;i--){
      output += this[i];
    }
    return output;
  }

  // '{{([\u0600-\u06FF]+.\s*)+}}'
  List<String> SplitAll(String pattern){

    List<String> spl = [];

    var reg = RegExp(pattern);

    int start = 0;
    for(RegExpMatch match in reg.allMatches(this)){
      spl.add(this.substring(start,match.start).trim());
      spl.add(this.substring(match.start,match.end).trim());
      start = match.end;
    }

    if(start!=this.length){
      spl.add(this.substring(start,this.length).trim());
    }

    return spl;
  }

  List<String> SplitAll2(String pattern){
    List<String> spl = [];

    var reg = RegExp(pattern);

    int start = 0;
    for(RegExpMatch match in reg.allMatches(this)) {

      String startStr = this.substring(start,match.start);

      if(![null,''].contains(startStr)){
        spl.add(startStr);
      }

      String endStr = this.substring(match.start,match.end);

      if(![null,''].contains(endStr)){
        spl.add(endStr);
      }

      start = match.end;
    }

    if(start!=this.length){

      String endStr = this.substring(start,this.length);

      if(![null,''].contains(endStr)){
        spl.add(endStr);
      }

    }

    return spl;
  }

}

Future showMessageBoxByShrink(context,child) async {

  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    insetPadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    elevation: 0,
    content: child,
  );


  return await showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: true,
      builder: (context){
        double _bottom = MediaQuery.of(context).viewInsets.bottom;
        return Padding(
          padding: EdgeInsets.symmetric(
              vertical: (_bottom>0.0) ? 1.h : 0,
          ),
          child: alertDialog,
        );
      }
  );

}

Future showMessageBox(context,child) async {

  AlertDialog alertDialog = AlertDialog(
    backgroundColor: Colors.transparent,
    alignment: Alignment.center,
    insetPadding: EdgeInsets.zero,
    contentPadding: EdgeInsets.zero,
    elevation: 0,
    content: child,
  );

  return await showDialog(
      context: context,
      barrierDismissible: true,
      useSafeArea: false,
      builder: (context){
        return alertDialog;
      }
  );

}

class FloatNumber extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdat
    String newtxt = newValue.text.trim();
    String oldtxt = oldValue.text.trim();

    var regex1 = RegExp(
        r'^((-)|(\.)|(\d))?$',
        caseSensitive: false);

    var regex2 = RegExp(
        r'^((-\.)|(\.\d)|(\d\.)|(-\d)|(\d\d))?$',
        caseSensitive: false);

    var regex3 = RegExp(
        r'^(-?((\d+\.?)|(\.?\d+)|(\d+\.?\d+)))?$',
        caseSensitive: false);


    if(newtxt.isEmpty){
      return TextEditingValue(text:  newtxt);
    }
    else if(newtxt.length==1 && regex1.hasMatch(newtxt)){
      return TextEditingValue(text:  newtxt);
    }
    else if(newtxt.length==2 && regex2.hasMatch(newtxt)){
      return TextEditingValue(text:  newtxt);
    }
    else if(newtxt.length>=3 && regex3.hasMatch(newtxt)){
      return TextEditingValue(text:  newtxt);
    }
    return TextEditingValue(text:  oldtxt);

  }

}

String? ValidFloatNumber(String? Input) {

  var regex = RegExp(
      r'^(-?((\d+\.?)|(\.?\d+)|(\d+\.?\d+)))?$',
      caseSensitive: false);

  if(Input!=null && Input.isNotEmpty && regex.hasMatch(Input)){
    return null;
  }
  return 'عدد منطقی نیست';


}