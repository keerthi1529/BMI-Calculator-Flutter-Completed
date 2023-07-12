import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
class BottomButton extends StatelessWidget{
  BottomButton({required this.onTape,required this.buttonTitle});
  final VoidCallback onTape;
  final String buttonTitle;
  @override
  Widget build(BuildContext context){
  return  GestureDetector(
    onTap: onTape,
    child: Container(
      // color: bottomcontainercolor,
      child: Center(
          child: Text(buttonTitle,style: kLargeButtonTextStyle)),
      margin: EdgeInsets.only(top: 10.0),
      // padding: EdgeInsets.only(bottom: 20.0),
      width: double.infinity,
      height: kbottomcontainerHeight,
      decoration: BoxDecoration(color: kbottomcontainercolor,
          borderRadius:BorderRadius.circular(15.0)
      ),
    ),
  );
  }
}