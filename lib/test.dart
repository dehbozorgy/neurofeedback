
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PureNumber extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    // TODO: implement formatEditUpdate
    String txt = newValue.text;
    if(txt.length==1 && txt=='0'){
      return TextEditingValue();
    }
    return TextEditingValue(text:  newValue.text.replaceAll(RegExp('[^0-9]'), ''));
  }

}

// class CurrencyPersian extends TextInputFormatter {
//
//   @override
//   TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
//     // TODO: implement formatEditUpdate
//     return TextEditingValue(text: newValue.text.seRagham());
//   }
//
// }