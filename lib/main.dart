import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sapient_todo/models/task_data.dart';
import 'onBoardingScreen/onboardingScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: OnBoardingScreen(),
      ),
    );
  }
}
