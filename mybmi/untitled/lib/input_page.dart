import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'IconText.dart';
import 'ContainerCOde.dart';
import 'Constant.dart';
import 'result.dart';
import 'claculatormind.dart';
import 'main.dart';
enum Gender{
  male,
  female,
}
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
    Gender SelectGender = Gender.values.first;

    int SliderHeight =180;

    int SliderWeight= 60;
    int SliderAge = 20;
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("BMI Calculator"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:[
        Expanded(child: Row(
            children:  [
              Expanded(

                child: RepeatContainer(
                  onPressed: ()
                  {
                    setState(() {
                      SelectGender=Gender.male;
                    });
                  },

                colors: SelectGender==Gender.male?activeColor:deActiveColor,
                cardWidget: RepeatIcon(
                  icon: FontAwesomeIcons.male,
                  label: 'MALE',
                ),
              ),
            ),


      Expanded(
      child: RepeatContainer(
      onPressed: ()
      {
      setState(() {
      SelectGender=Gender.female;
      });
      },

                colors: SelectGender==Gender.female?activeColor:deActiveColor,
                cardWidget: RepeatIcon(
                  icon: FontAwesomeIcons.female,
                  label: 'FEMALE',

                ),

              ),
            ),
          ],
        ),
      ),

Expanded(child: Row(
children: [
Expanded(child: RepeatContainer(
colors: Colors.green,
  cardWidget: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children:  [
      const Text('HEIGHT',style: LabelStyle,),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,

        children:  [
          Text(
            SliderHeight.toString(),
            style:NumberStyle,
          ),
          Text(
            'cm',
            style: LabelStyle,

          ),

        ],

      ),
      Slider(value: SliderHeight.toDouble(),
        min: 120.0,
        max: 220.0,
        inactiveColor: Color(0xFF8D8E98),
        activeColor: Colors.white, onChanged: (double newValue){
          setState(() {
            SliderHeight = newValue.round();
          });
        },),
    ],
  ),
),),
],
),),
Expanded(child: Row(
children: [
Expanded(child: RepeatContainer(
colors: Colors.blueAccent,
  cardWidget: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('WEIGHT',
        style: LabelStyle,),
      Text(
        SliderWeight.toString(),
        style: NumberStyle,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundIcon(iconData: FontAwesomeIcons.minus, onPress: (){
            setState(() {
              SliderWeight--;
            });
          },),
          const SizedBox(
            width: 10.0,
          ),
          RoundIcon(iconData: FontAwesomeIcons.plus, onPress: (){
            setState(() {
              SliderWeight++;
            });
          },),
        ],
      ),

    ],
  ),
),),
Expanded(child: RepeatContainer(
colors: Colors.purple,
  cardWidget: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text('AGE',
        style: LabelStyle,),
      Text(
        SliderAge.toString(),
        style: NumberStyle,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RoundIcon(iconData: FontAwesomeIcons.minus, onPress: (){
            setState(() {
              SliderAge--;
            });
          },),
          const SizedBox(
            width: 10.0,
          ),
          RoundIcon(iconData: FontAwesomeIcons.plus, onPress: (){
            setState(() {
              SliderAge++;
            });
          },),
        ],
      ),
    ],
  ),

      ),
),
   ],

),),
            GestureDetector(
              onTap: ()
              {
                Calculator cal=Calculator(height: SliderHeight, weight: SliderWeight);
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen(
                  BMIResult: cal.CalculateBMI(),
                  ResultText: cal.getResult(),
                  Interpretation: cal.getInterpretation(),
                )));
              },

              child:   Container(

                child:const Center(

                  child:Text('Calculate',style: LargeButton,),

                ),
                color: Colors.red,
                margin: EdgeInsets.only(top:10.0),
                width: double.infinity,
                height: 80.0,
              ),
            ),
],

),);
    }
}
class RoundIcon extends StatelessWidget {

  RoundIcon({ required this.iconData, required this.onPress});

  final IconData iconData;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton( child: Icon(iconData),
      onPressed: () => {
        onPress(),
      },
      elevation: 6.0,

      constraints: BoxConstraints.tightFor(
        height: 56.0,
        width: 56.0,

      ),
      shape:   CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}