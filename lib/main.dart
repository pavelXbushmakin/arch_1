import 'package:arch_1/my_app.dart';
import 'package:flutter/material.dart';
import 'package:arch_1_business/arch_1_business.dart';
import 'my_app.dart';

void main(){
  // BlocFactory.instance.initialize();
  initializeBlocs();
  runApp(const MyApp());
}