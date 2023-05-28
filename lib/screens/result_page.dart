import 'package:flutter/material.dart';

import '../components/bottom_button.dart';
import '../constants.dart';
import '../components/resuable_widget.dart';

class ResultPage extends StatelessWidget {


  String result;
  String bmi;
  String interpretation;


  ResultPage({required this.result,required this.bmi,required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              const Text('BMI Calculator')),
      body: Column(
          mainAxisAlignment:
              MainAxisAlignment
                  .spaceEvenly,
          crossAxisAlignment:
              CrossAxisAlignment
                  .stretch,
          children: [
            Expanded(
                child: Container(
              margin:
                  EdgeInsets.all(15),
              alignment:
                  Alignment.bottomLeft,
              child: const Text(
                "Your result",
                style: KTitleTextStyle,
              ),
            )),
            Expanded(
                flex: 5,
                child: ReusableWidget(
                  color:
                      KActiveCardColor,
                  child: Column(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceEvenly,
                      crossAxisAlignment:
                          CrossAxisAlignment
                              .center,
                      children:  [
                        Text(result,
                            style: KResultTextStyle),
                        Text(
                          bmi,
                          style:
                              KBMITextStyle,
                        ),
                        Text(
                          interpretation,
                          textAlign:
                              TextAlign
                                  .center,
                          style:
                              KBodyTextStyle,
                        ),
                         BottomButton(onPressed: (){
                           Navigator.pop(context);
                         }, label: "RECALCULATE")
                      ]),
                ))
          ]),
    );
  }
}
