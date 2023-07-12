import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/calculator_brain.dart';
enum Gender{
  male,female,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState()=> _InputPageState();
}
class _InputPageState extends State<InputPage>{
  Gender selectedGender=Gender.male;
  int height=180;
  int weight=55;
  int age=21;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text('BMI CALCULATOR'),
      ),
      body:Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                      colour: selectedGender==Gender.male?kactivecardcolor:kinactivecardcolor,
                      cardChild: Iconcontent(icon: FontAwesomeIcons.mars,label: 'Male',),
                      onPress: (){
                        setState((){
                          selectedGender=Gender.male;
                        });
                      },
                    ),
                  ),
                Expanded(
                    child: ReusableCard(
                      colour:selectedGender==Gender.female?kactivecardcolor:kinactivecardcolor,
                      cardChild: Iconcontent(icon: FontAwesomeIcons.venus,label: 'Female',),
                   onPress: (){
                         setState((){
                           selectedGender=Gender.female;
                           });
                            },
                    ),
                  ),
               ], ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child:ReusableCard(colour:kactivecardcolor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[Text('HEIGHT',
                          style: klabelText,
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline:TextBaseline.alphabetic,
                            children: <Widget>[
                              Text(height.toString(),style:kNumberTextStyle),
                              Text('cm',style:klabelText),
                            ],
                          ),
                          SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                thumbShape:
                                RoundSliderThumbShape(enabledThumbRadius: 15.0),
                                activeTrackColor: Colors.white,
                                thumbColor: Color(0xFFEB1555),
                                overlayColor: Color(0x29EB1555),
                                overlayShape:
                                RoundSliderOverlayShape(overlayRadius: 30.0),),
                              child:Slider(value: height.toDouble(),
                                  min: 100.0,
                                  max: 220.0,
                                  divisions: 120,
                                  inactiveColor: Color(0xFF8D8E98),
                                  onChanged: (double newValue){
                                    setState(() {
                                      height=newValue.round();
                                      print(newValue);
                                    });
                                  }
                              )),],
                      ),
                      onPress: (){},
                      //Color(0xFF1D1E33)
                    ) ),],),),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child:ReusableCard(
                    colour: kactivecardcolor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('WEIGHT',style: klabelText,),
                        Text(weight.toString(),style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            //     FloatingActionButton(
                            //     backgroundColor: Color(0xFF4C4F5E),
                            //     child: Icon(Icons.add,color: Colors.white,),
                            //   ),
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                              setState(() {
                                weight++;
                              });
                            },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){
                              setState(() {
                                weight--;
                              });
                            },),
                            // FloatingActionButton(
                            //   backgroundColor: Color(0xFF4C4F5E),
                            //   child: Icon(Icons.add,color: Colors.white,),
                            // ),
                          ],
                        ),
                      ],),
                    onPress: (){},
                  ),),
                Expanded(
                  child: ReusableCard(colour:Color(0xFF1D1E33),
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('AGE',style: klabelText,),
                        Text(age.toString(),style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
                              setState(() {
                                age++;
                              });
                            },),
                            SizedBox(width: 10.0,),
                            RoundIconButton(icon: FontAwesomeIcons.minus,onPress:(){
                              setState((){
                                age--;
                              });},),
                          ],
                        ),
                      ],),
                    onPress: (){},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTape: (){
              CalculatorBrain calc=CalculatorBrain(height:height,weight:weight);
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context)=>ResultsPage(bmiResult: calc.calculatorBMI(),resultText: calc.getResult(),interpretation: calc.getInterpretation(),)
              )
              );
            },
          )
        ],
      ),
    );
  }
}

// enum Gender{
//   male,female,
// }
// class InputPage extends StatefulWidget {
//   @override
//   _InputPageState createState()=> _InputPageState();
// }
// class _InputPageState extends State<InputPage>{
//   Gender selectedGender=Gender.male;
//   int height=180;
//   int weight=55;
//   int age=21;
//   @override
//   Widget build(BuildContext context){
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle:true,
//         title: Text('BMI CALCULATOR'),
//       ),
//       body:Column(
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: <Widget>[
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child:  GestureDetector(
//                     onTap: ()
//                     {
//                       setState((){
//                         selectedGender=Gender.male;
//                       });
//                     },
//                     child: ReusableCard(
//                       colour: selectedGender==Gender.male?kactivecardcolor:kinactivecardcolor,
//                       cardChild: Iconcontent(icon: FontAwesomeIcons.mars,label: 'Male',),
//                     ),
//                   ),),
//                 Expanded(
//                   child:  GestureDetector(
//                     onTap: ()
//                     {
//                       setState((){
//                         selectedGender=Gender.female;
//                       });},
//                     child: ReusableCard(
//                       colour:selectedGender==Gender.female?kactivecardcolor:kinactivecardcolor,
//                       cardChild: Iconcontent(icon: FontAwesomeIcons.venus,label: 'Female',),
//                     ),
//                   ),
//                 ),
//               ],),),
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                     child:ReusableCard(colour:kactivecardcolor,
//                       cardChild: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children:<Widget>[Text('HEIGHT',
//                           style: klabelText,
//                         ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             crossAxisAlignment: CrossAxisAlignment.baseline,
//                             textBaseline:TextBaseline.alphabetic,
//                             children: <Widget>[
//                               Text(height.toString(),style:kNumberTextStyle),
//                               Text('cm',style:klabelText),
//                             ],
//                           ),
//                           SliderTheme(
//                               data: SliderTheme.of(context).copyWith(
//                                 thumbShape:
//                                 RoundSliderThumbShape(enabledThumbRadius: 15.0),
//                                 activeTrackColor: Colors.white,
//                                 thumbColor: Color(0xFFEB1555),
//                                 overlayColor: Color(0x29EB1555),
//                                 overlayShape:
//                                 RoundSliderOverlayShape(overlayRadius: 30.0),),
//                               child:Slider(value: height.toDouble(),
//                                   min: 100.0,
//                                   max: 220.0,
//                                   divisions: 120,
//                                   inactiveColor: Color(0xFF8D8E98),
//                                   onChanged: (double newValue){
//                                     setState(() {
//                                       height=newValue.round();
//                                       print(newValue);
//                                     });
//                                   }
//                               )),],
//                       ),
//                       //Color(0xFF1D1E33)
//                     ) ),],),),
//           Expanded(
//             child: Row(
//               children: <Widget>[
//                 Expanded(
//                   child:ReusableCard(
//                     colour: kactivecardcolor,
//                     cardChild: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text('WEIGHT',style: klabelText,),
//                         Text(weight.toString(),style: kNumberTextStyle),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             //     FloatingActionButton(
//                             //     backgroundColor: Color(0xFF4C4F5E),
//                             //     child: Icon(Icons.add,color: Colors.white,),
//                             //   ),
//                             RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
//                               setState(() {
//                                 weight++;
//                               });
//                             },),
//                             SizedBox(width: 10.0,),
//                             RoundIconButton(icon: FontAwesomeIcons.minus,onPress: (){
//                               setState(() {
//                                 weight--;
//                               });
//                             },),
//                             // FloatingActionButton(
//                             //   backgroundColor: Color(0xFF4C4F5E),
//                             //   child: Icon(Icons.add,color: Colors.white,),
//                             // ),
//                           ],
//                         ),
//                       ],),
//                   ),),
//                 Expanded(
//                   child: ReusableCard(colour:Color(0xFF1D1E33),
//                     cardChild: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Text('AGE',style: klabelText,),
//                         Text(age.toString(),style: kNumberTextStyle),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             RoundIconButton(icon: FontAwesomeIcons.plus,onPress: (){
//                               setState(() {
//                                 age++;
//                               });
//                             },),
//                             SizedBox(width: 10.0,),
//                             RoundIconButton(icon: FontAwesomeIcons.minus,onPress:(){
//                               setState((){
//                                 age--;
//                               });},),
//                           ],
//                         ),
//                       ],),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           BottomButton(
//             buttonTitle: 'CALCULATE',
//             onTape: (){
//               CalculatorBrain calc=CalculatorBrain(height:height,weight:weight);
//               Navigator.push(
//                   context, MaterialPageRoute(
//                   builder: (context)=>ResultsPage(bmiResult: calc.calculatorBMI(),resultText: calc.getResult(),interpretation: calc.getInterpretation(),)
//               )
//               );
//             },
//           )
//         ],
//       ),
//     );
//   }
// }
//= Gender.male
// Color maleCardColor=inactivecardcolor;
// Color femaleCardColor=inactivecardcolor;
// //int gender=0;
// //male=1,female any other
// void updateColor(Gender selectGender)
// {
//   if(selectGender==Gender.male ){
//     if(maleCardColor == inactivecardcolor){
//     maleCardColor = activecardcolor;
//     femaleCardColor=inactivecardcolor;}
//     else{
//       maleCardColor = inactivecardcolor;
//     }
//   }
//   if(selectGender==Gender.female){
//     if(femaleCardColor==inactivecardcolor){
//       femaleCardColor=activecardcolor;
//       maleCardColor=inactivecardcolor;
//     }
//     else{
//       femaleCardColor=inactivecardcolor;
//     }
//   }
// }
// Center(
//   child: Text('Body Text'),
// ),
//  floatingActionButton: Theme(
//    data : ThemeData(colorScheme:ColorScheme.dark(primary: Colors.cyanAccent),),
//    child: FloatingActionButton(
//    child: Icon(Icons.add),
//    onPressed: (){},
// ),
