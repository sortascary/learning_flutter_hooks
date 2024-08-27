import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:learning_flutter_hooks/widget/BMI.dart';
import 'package:learning_flutter_hooks/widget/Cardlistview.dart';
import 'package:learning_flutter_hooks/widget/between.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI',
      initialRoute: '/',
      routes: {
        '/': (context) => Between(),
        '/BMI': (context) => BMICalculator(),
        '/datar': (context) => CardListView(),
      },
    );
    
  }
}