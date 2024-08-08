import 'package:flutter/material.dart';

class GenderController extends ValueNotifier<bool> {

  GenderController({bool? input}) :
        super(input ?? true);


}