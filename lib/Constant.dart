import 'package:flutter/material.dart';

double get StatusBar => MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).viewPadding.top;

