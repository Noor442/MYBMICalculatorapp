import 'package:flutter/material.dart';
import 'input_page.dart';
import 'Constant.dart';
import 'input.dart';
import 'main.dart';
import '';
class ResultScreen extends StatelessWidget {

  ResultScreen({required this.Interpretation,required this.BMIResult,required this.ResultText});

  final String BMIResult;
  final String ResultText;
  final String Interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),

      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(child: Container(
            child: Center(
              child: Text(
                'Your Result',
                style: TitleStyle,
              ),
            ),
          ),),
          Expanded(
            flex: 5,
            child: RepeatContainer(
              colors: activeColor,
              cardWidget: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ResultText.toUpperCase(),
                    style: ResultStyle,
                  ),
                  Text(
                    BMIResult,
                    style: BMIStyle,
                  ),
                  Text(
                   Interpretation,
                    textAlign: TextAlign.center,
                    style: BodyStyle,
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => BMI()));

              child:
              Container(

                child: const Center(

                  child: Text('Re-Calculate', style: LargeButton,),

                ),
                color: Colors.red,
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
              );
            },
          ),
    ),
        ],
      ),
    );
  }
}