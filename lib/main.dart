import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/input_page.dart';
void main() => runApp(BMICalculator());
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme : ThemeData(
     primaryColor: Color(0xFFFFFF),
        scaffoldBackgroundColor: Colors.black,
      //textTheme: TextTheme(bodyText2: TextStyle(color:Colors.black)),
        // accentColor: Colors.purple,
) ,
      home: InputPage(),
    );
  }
}

